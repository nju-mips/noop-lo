//**************************************************************************
// Bridges
//--------------------------------------------------------------------------
//
// Zhigang Liu
// 2017 Sep 14

package Common

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

import Constants._
import Common._
import Common.Util._

// ============================== Bridges ==============================
class MemPort2AXIBridge(addr_width:Int, data_width: Int, id_width: Int, axi4_data_width: Int) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new MemPortIO(addr_width, data_width))
    val out = new AXI4IO(id_width, axi4_data_width)
  })

  // ** this module assumes that in.resp is always ready
  // response
  val out = io.out

  // current inflight req stored here
  val s1_kill = io.in.req.bits.s1_kill
  val s1_reg_valid = RegInit(false.B)
  val s1_req = Reg(new MemReq(addr_width, data_width))
  val s1_passdown = s1_reg_valid && !s1_kill
  when (io.in.req.fire()) {
    s1_reg_valid := true.B
    s1_req := io.in.req.bits
  }
  when (s1_passdown || s1_kill) {
    s1_reg_valid := false.B
  }

  val s2_reg_valid = RegInit(false.B)
  val s2_req = Reg(new MemReq(addr_width, data_width))
  when (s1_passdown) {
    s2_reg_valid := true.B
    s2_req := s1_req
  }
  when (io.in.resp.fire()) {
    s2_reg_valid := false.B
  }


  val ren = s2_reg_valid && (s2_req.fcn === M_XRD)
  val wen = s2_reg_valid && (s2_req.fcn === M_XWR)

  // rdata, raddr
  val r_score_board = RegInit(0.U(2.W))
  val r_shake = Wire(UInt(2.W))
  val r_status = Wire(UInt(2.W))

  r_shake := Cat(out.r.valid & out.r.ready, out.ar.valid & out.ar.ready)
  r_status := r_score_board | r_shake

  when (r_status === "b11".U) {
    r_score_board := 0.U
  } .otherwise { r_score_board := r_status }

  // wresponse, wdata, waddr
  val w_score_board = RegInit(0.U(3.W))
  val w_shake = Wire(UInt(3.W))
  val w_status = Wire(UInt(3.W))

  w_shake := Cat(out.b.valid & out.b.ready,
    Cat(out.w.valid & out.w.ready, out.aw.valid & out.aw.ready))
  w_status := w_score_board | w_shake;

  when (w_status === "b111".U) {
    w_score_board := 0.U
  } .otherwise { w_score_board := w_status }

  io.in.req.ready := !s1_reg_valid && !s2_reg_valid

  val memport_bytes = data_width / 8
  require(isPow2(memport_bytes))
  val memport_addr_width = log2Ceil(memport_bytes)
  when (!reset.toBool) {
    assert(!s2_reg_valid || s2_req.addr(memport_addr_width - 1, 0) === 0.U, "MemPort2AXIBridge: request address not aligned!")
  }

  // we have an external 64bit axi memory
  val axi4_bytes = axi4_data_width / 8
  require(isPow2(axi4_bytes))
  val axi4_addr_width = log2Ceil(axi4_bytes)
  // address should be aligned to axi memory bus width
  val axi4_aligned_addr = Cat(s2_req.addr(addr_width - 1, axi4_addr_width), 0.U(axi4_addr_width.W))
  // the offset of the bytes that we are interested in?
  val offset = s2_req.addr(axi4_addr_width - 1, 0)
  // memport is 32bit width, axi mem is 64bit, each request is 32bit aliged
  when (!reset.toBool) {
    assert(!s2_reg_valid || offset === 0.U || offset === 4.U, "MemPort2AXIBridge: request address not aligned!")
  }
  val resp_data = out.r.bits.data >> (offset << 3)
  io.in.resp.bits.data := resp_data
  io.in.resp.valid := s2_reg_valid && ((ren && r_status === "b11".U) || (wen && w_status === "b111".U))

  // external memory bus width is 64bits(8bytes)
  // so each memport read/write is mapped into a whole axi bus width read/write
  val axi4_size = Cat("b0".U, io.in.req.bits.len)

  // write address channel signals
  out.aw.bits.id := 0.U(id_width.W)
  out.aw.bits.addr := axi4_aligned_addr
  out.aw.bits.len := 0.U(8.W)  // write once
  out.aw.bits.size := axi4_size
  out.aw.bits.burst := "b01".U       // normal sequential memory
  out.aw.bits.lock := 0.U(1.W)
  out.aw.bits.cache := 0.U(4.W)
  out.aw.bits.prot := 0.U(3.W)
  out.aw.bits.region := 0.U(4.W)
  out.aw.bits.qos := 0.U(4.W)
  out.aw.bits.user := 0.U(5.W)
  out.aw.valid := wen & (~w_score_board(0))

  // write data channel signals
  out.w.bits.id := 0.U(id_width.W)
  out.w.bits.data := s2_req.data << (offset << 3)
  out.w.bits.strb := s2_req.wstrb << offset
  out.w.bits.last := out.w.valid
  out.w.bits.user := 0.U(5.W)
  out.w.valid := wen & (~w_score_board(1))

  // write response channel signals
  out.b.ready := wen & ~w_score_board(2)

  // read address channel signals
  out.ar.bits.id := 0.U(id_width.W)
  out.ar.bits.addr := axi4_aligned_addr
  out.ar.bits.len := 0.U(8.W)  // read once
  out.ar.bits.size := axi4_size
  out.ar.bits.burst := "b01".U // normal sequential memory
  out.ar.bits.lock := 0.U(1.W)
  out.ar.bits.cache := 0.U(4.W)
  out.ar.bits.prot := 0.U(3.W)
  out.ar.bits.region := 0.U(4.W)
  out.ar.bits.qos := 0.U(4.W)
  out.ar.bits.user := 0.U(5.W)
  out.ar.valid := ren & (!r_score_board(0))

  // read data channel signals
  out.r.ready := ren & ~r_score_board(1)
}

class AXI4Lite2AXI4Bridge(axi4lite_data_width: Int, id_width: Int, axi4_data_width: Int) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new AXI4LiteIO(axi4lite_data_width))
    val out = new AXI4IO(id_width, axi4_data_width)
  })

  val in = io.in
  val out = io.out

  // write address channel signals
  out.aw.bits.id := 0.U(id_width.W)
  out.aw.bits.addr := in.aw.bits.addr
  out.aw.bits.len := 0.U(8.W)  // write once
  out.aw.bits.size := "b010".U       // write 4bytes each time
  out.aw.bits.burst := "b01".U       // normal sequential memory
  out.aw.bits.lock := 0.U(1.W)
  out.aw.bits.cache := 0.U(4.W)
  out.aw.bits.prot := in.aw.bits.prot
  out.aw.bits.region := 0.U(4.W)
  out.aw.bits.qos := 0.U(4.W)
  out.aw.bits.user := 0.U(5.W)
  in.aw.ready := out.aw.ready
  out.aw.valid := in.aw.valid

  // write data channel signals
  out.w.bits.id := 0.U(id_width.W)
  out.w.bits.data := in.w.bits.data
  out.w.bits.strb := in.w.bits.strb
  out.w.bits.last := in.w.valid
  out.w.bits.user := 0.U(5.W)
  out.w.valid := in.w.valid
  in.w.ready := out.w.ready

  // write response channel signals
  in.b.bits.resp := out.b.bits.resp
  in.b.valid := out.b.valid
  out.b.ready := in.b.ready


  // read address channel signals
  out.ar.bits.id := 0.U(id_width.W)
  out.ar.bits.addr := in.ar.bits.addr
  out.ar.bits.len := 0.U(8.W)  // read once
  out.ar.bits.size := "b010".U  // read 4bytes each time
  out.ar.bits.burst := "b01".U // normal sequential memory
  out.ar.bits.lock := 0.U(1.W)
  out.ar.bits.cache := 0.U(4.W)
  out.ar.bits.prot := in.ar.bits.prot
  out.ar.bits.region := 0.U(4.W)
  out.ar.bits.qos := 0.U(4.W)
  out.ar.bits.user := 0.U(5.W)
  out.ar.valid := in.ar.valid
  in.ar.ready := out.ar.ready

  // read data channel signals
  in.r.bits.data := out.r.bits.data
  in.r.bits.resp := out.r.bits.resp
  in.r.valid := out.r.valid
  out.r.ready := in.r.ready
}

/* for simulation */
class SimBramFilter(addr_width:Int, data_width:Int) extends Module {
  val io = IO(new Bundle {
    val in = Vec(2, Flipped(new MemPortIO(addr_width, data_width)))
    val out = Vec(2, new MemPortIO(addr_width, data_width))
  })

  val Y = true.B
  val N = false.B

  val bram_size = 1024 * 1024 / 4

  val bram = Mem(bram_size, UInt(32.W))

  def is_bram_req(addr:UInt) = addr(31, 20) === "h1fc".U

  for(i <- 0 until 2) {
    val s0_valid = io.in(i).req.fire()
    val s0_reg = io.in(i).req.bits
    val s0_addr = s0_reg.addr(log2Ceil(bram_size) + 1, 2)
    val s0_to_bram = is_bram_req(s0_reg.addr)

    val addr_misaligned = s0_reg.addr(1, 0) =/= 0.U
    /*
      (s0_reg.len === ML_W && s0_reg.addr(1, 0) =/= 0.U) ||
      (s0_reg.len === ML_H && s0_reg.addr(0) =/= 0.U)
    */

    assert(!io.in(i).req.valid || !addr_misaligned, "misaligned addr %x and len %x\n", s0_reg.addr, s0_reg.len)

    io.out(i).req.valid := io.in(i).req.valid && !s0_to_bram
    io.out(i).resp.ready := io.in(i).resp.ready

    val passdown = s0_valid && s0_to_bram
    val s1_valid = RegEnable(next=Y, init=N, enable=passdown)
    val s1_reg = RegEnable(next=s0_reg, enable=passdown)
    val s1_addr = RegEnable(next=s0_addr, enable=passdown)
    val s1_to_bram = RegEnable(next=s0_to_bram, enable=passdown)
    val s1_data = bram(s1_addr)

    when(s1_valid && (s1_reg.fcn === M_XWR) && s1_to_bram && !s0_reg.s1_kill) {
      val wstrb = s1_reg.wstrb
      val w = wstrb.getWidth
      val mask = Cat(for(j <- w - 1 to 0 by -1) yield Fill(8, wstrb(j)))

      val data = s1_reg.data
      bram(s1_addr) := (s1_data & ~mask) | (data & mask)
    }

    when((io.in(i).resp.fire() || s0_reg.s1_kill) && !passdown) {
      s1_valid := N
    }

    io.in(i).resp.valid := (s1_valid && !s0_reg.s1_kill) || io.out(i).resp.valid
    io.in(i).resp.bits.data := Mux(s1_valid, s1_data, io.out(i).resp.bits.data)

    assert(!(s1_valid && io.out(i).resp.valid))

    io.out(i).req.bits := io.in(i).req.bits

    // request ready signal
    io.in(i).req.ready := io.out(i).req.ready && io.in(i).resp.ready
  }

  def dump() = {
    for(i <- 0 until 2) {
      when(io.in(i).req.bits.s1_kill) {
        printf("time %d: BramFilter.In.Req[" + i + "] s1_kill\n", GTimer())
      }

      when(io.in(i).req.fire()) {
        printf("time %d: BramFilter.In.Req[" + i + "] ", GTimer())
        when(io.in(i).req.bits.fcn === M_XRD) {
          printf("Read addr = %x\n", io.in(i).req.bits.addr)
        } .elsewhen(io.in(i).req.bits.fcn === M_XWR) {
          printf("Write addr = %x wstrb = %x data = %x\n",
            io.in(i).req.bits.addr,
            io.in(i).req.bits.wstrb,
            io.in(i).req.bits.data
            )
        }
      }

      when(io.in(i).resp.fire()) {
        printf("time %d: BramFilter.In.Resp[" + i + "] valid ", GTimer())
        printf("data = %x\n", io.in(i).resp.bits.data)
      }

      when(io.out(i).req.fire()) {
        printf("time %d: BramFilter.Out.Req[" + i + "] ", GTimer())
        when(io.out(i).req.bits.fcn === M_XRD) {
          printf("Read addr = %x\n", io.out(i).req.bits.addr)
        } .elsewhen(io.out(i).req.bits.fcn === M_XWR) {
          printf("Write addr = %x wstrb = %x data = %x\n",
            io.out(i).req.bits.addr,
            io.out(i).req.bits.wstrb,
            io.out(i).req.bits.data
            )
        }
      }

      when(io.out(i).resp.fire()) {
        printf("time %d: BramFilter.Out.Resp[" + i + "] valid ", GTimer())
        printf("data = %x\n", io.out(i).resp.bits.data)
      }
    }
  }
}

class LoongsonMemport2AXI4NaiveBridge(id_width:Int, addr_width:Int, data_width:Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new MemPortIO(addr_width, data_width))
    val out = new AXI4IO(id_width, data_width)
  })

  val Y = true.B
  val N = false.B

  val req_valid = RegInit(N)
  val wait_resp = RegInit(N)
  val req = RegEnable(next=io.in.req.bits, enable=io.in.req.fire())

  val only_w_fire = RegEnable(init=N, next=Y, enable=(io.out.w.fire() && !io.out.aw.fire()))
  val only_aw_fire = RegEnable(init=N, next=Y, enable=(!io.out.w.fire() && io.out.aw.fire()))

  val passdown = Mux(req.fcn === M_XRD,
    io.out.ar.fire(),
    (io.out.aw.fire() && io.out.w.fire()) ||
    (io.out.aw.fire() && only_w_fire) ||
    (only_aw_fire && io.out.w.fire())
  )

  val b_valid = RegNext(io.out.b.valid)
  val r_valid = RegNext(io.out.r.valid)
  val resp_valid = io.out.b.valid || io.out.r.valid
  val r = RegNext(io.out.r.bits)
  val can_req = req_valid && !io.in.req.bits.s1_kill

  io.in.req.ready := !req_valid && !wait_resp

  when(io.in.req.fire()) {
    req_valid := Y
    only_w_fire := N
    only_aw_fire := N
  }

  when(req_valid && passdown) {
    wait_resp := Y
  } .elsewhen(io.in.req.bits.s1_kill || resp_valid) {
    wait_resp := N
  }

  when(req_valid && (passdown || io.in.req.bits.s1_kill)) {
    req_valid := N
  }

  io.in.resp.valid := r_valid || b_valid
  io.in.resp.bits.data := r.data

  // write address channel signals, only dmem write
  io.out.aw.bits.id := 0.U
  io.out.aw.bits.addr := req.addr
  io.out.aw.bits.len := 0.U(8.W)  // write once
  io.out.aw.bits.size := "b010".U       // write 4bytes each time
  io.out.aw.bits.burst := "b01".U       // normal sequential memory
  io.out.aw.bits.lock := 0.U(1.W)
  io.out.aw.bits.cache := 0.U(4.W)
  io.out.aw.bits.prot := 0.U(3.W)
  io.out.aw.bits.region := 0.U(4.W)
  io.out.aw.bits.qos := 0.U(4.W)
  io.out.aw.bits.user := 0.U(5.W)
  io.out.aw.valid := can_req && req.fcn === M_XWR && !only_aw_fire
  // write data channel signals, only dmem write
  io.out.w.bits.id := 0.U
  io.out.w.bits.data := req.data
  io.out.w.bits.strb := req.wstrb
  io.out.w.bits.last := true.B
  io.out.w.bits.user := 0.U(5.W)
  io.out.w.valid := can_req && req.fcn === M_XWR && !only_w_fire

  // write response channel signals
  io.out.b.ready := Y

  // read address channel signals
  io.out.ar.bits.id := 0.U
  io.out.ar.bits.addr := req.addr
  io.out.ar.bits.len := 0.U(8.W)  // read once
  io.out.ar.bits.size := "b010".U  // read 4bytes each time
  io.out.ar.bits.burst := "b01".U // normal sequential memory
  io.out.ar.bits.lock := 0.U(1.W)
  io.out.ar.bits.cache := 0.U(4.W)
  io.out.ar.bits.prot := 0.U(3.W)
  io.out.ar.bits.region := 0.U(4.W)
  io.out.ar.bits.qos := 0.U(4.W)
  io.out.ar.bits.user := 0.U(5.W)
  io.out.ar.valid := can_req && req.fcn === M_XRD

  // read data channel signals
  io.out.r.ready := io.in.resp.ready
}


// default value
class LoongsonBramArbiter(id_width:Int, addr_width:Int, data_width:Int) extends Module {
  val io = IO(new Bundle {
    val imem = Flipped(new MemPortIO(addr_width, data_width))
    val dmem = Flipped(new MemPortIO(addr_width, data_width))
    val bram = new AXI4IO(id_width, data_width)
  })

  val IMEM_ID = 0.U(id_width)
  val DMEM_ID = 0.U(id_width)

  val imem_valid = io.imem.req.valid
  val dmem_valid = io.dmem.req.valid
  val dmem_is_read = dmem_valid && io.dmem.req.bits.fcn === M_XRD
  val dmem_is_write = dmem_valid && io.dmem.req.bits.fcn === M_XWR

  val bram_br_valid = (io.bram.r.valid || io.bram.b.valid)

  val bram_br_imem = bram_br_valid && io.bram.r.bits.id === IMEM_ID
  val bram_br_dmem = bram_br_valid && io.bram.r.bits.id === DMEM_ID

  io.imem.req.ready := io.bram.ar.ready
  io.dmem.req.ready := Mux(io.dmem.req.bits.fcn === M_XRD, !io.imem.req.valid && io.bram.ar.ready, io.bram.aw.ready)

  io.imem.resp.valid := bram_br_imem
  io.dmem.resp.valid := bram_br_dmem

  io.imem.resp.bits.data := Mux(io.bram.r.valid && io.bram.r.bits.id === IMEM_ID, io.bram.r.bits.data, 0.U(data_width.W))
  io.dmem.resp.bits.data := Mux(io.bram.r.valid && io.bram.r.bits.id === DMEM_ID, io.bram.r.bits.data, 0.U(data_width.W))

  // write address channel signals, only dmem write
  io.bram.aw.bits.id := DMEM_ID
  io.bram.aw.bits.addr := io.dmem.req.bits.addr
  io.bram.aw.bits.len := 0.U(8.W)  // write once
  io.bram.aw.bits.size := "b010".U       // write 4bytes each time
  io.bram.aw.bits.burst := "b01".U       // normal sequential memory
  io.bram.aw.bits.lock := 0.U(1.W)
  io.bram.aw.bits.cache := 0.U(4.W)
  io.bram.aw.bits.prot := 0.U(3.W)
  io.bram.aw.bits.region := 0.U(4.W)
  io.bram.aw.bits.qos := 0.U(4.W)
  io.bram.aw.bits.user := 0.U(5.W)
  io.bram.aw.valid := dmem_is_write

  // write data channel signals, only dmem write
  io.bram.w.bits.id := DMEM_ID
  io.bram.w.bits.data := io.dmem.req.bits.data
  io.bram.w.bits.strb := io.dmem.req.bits.wstrb
  io.bram.w.bits.last := true.B
  io.bram.w.bits.user := 0.U(5.W)
  io.bram.w.valid := dmem_is_write

  // write response channel signals
  io.bram.b.ready := true.B

  // read address channel signals
  io.bram.ar.bits.id := Mux(imem_valid, IMEM_ID, DMEM_ID)
  io.bram.ar.bits.addr := Mux(imem_valid, io.imem.req.bits.addr, io.dmem.req.bits.addr)
  io.bram.ar.bits.len := 0.U(8.W)  // read once
  io.bram.ar.bits.size := "b010".U  // read 4bytes each time
  io.bram.ar.bits.burst := "b01".U // normal sequential memory
  io.bram.ar.bits.lock := 0.U(1.W)
  io.bram.ar.bits.cache := 0.U(4.W)
  io.bram.ar.bits.prot := 0.U(3.W)
  io.bram.ar.bits.region := 0.U(4.W)
  io.bram.ar.bits.qos := 0.U(4.W)
  io.bram.ar.bits.user := 0.U(5.W)
  io.bram.ar.valid := imem_valid || dmem_is_read

  // read data channel signals
  io.bram.r.ready := Mux(io.bram.r.bits.id === IMEM_ID, io.imem.resp.ready, io.dmem.resp.ready)
}

class NaiveMemportArbiter(addr_width:Int, data_width: Int) extends Module {
  val io = IO(new Bundle {
    val imem = Flipped(new MemPortIO(addr_width, data_width))
    val dmem = Flipped(new MemPortIO(addr_width, data_width))
    val out = new MemPortIO(addr_width, data_width)
  })
  // test it before use

  val s_ireq_sent = RegInit(false.B)
  val s_dreq_sent = RegInit(false.B)
  val s_wait_resp = s_ireq_sent || s_dreq_sent

  when(!s_wait_resp) {
    when(io.imem.req.valid) {
      io.out.req <> io.imem.req
    } .elsewhen(io.dmem.req.valid) {
      io.out.req <> io.dmem.req
    }
  }

  when(io.imem.req.fire()) { s_ireq_sent := true.B }
  when(io.dmem.req.fire()) { s_dreq_sent := true.B }

  when(s_ireq_sent) {
    io.imem.resp <> io.out.resp
  } .elsewhen(s_dreq_sent) {
    io.dmem.resp <> io.out.resp
  }

  when(io.out.resp.fire()) {
    s_ireq_sent := false.B
    s_dreq_sent := false.B
  }

  assert(!(s_ireq_sent && s_dreq_sent))
}

class NaiveAXI4XArbiter(fan_in: Int, id_width: Int, axi4_data_width: Int) extends Module
{
  val id_extend_width = log2Ceil(fan_in)
  val output_id_width = id_extend_width + id_width

  val io = IO(new Bundle {
    val in = Flipped(Vec(fan_in, new AXI4IO(id_width, axi4_data_width)))
    val out = new AXI4IO(output_id_width, axi4_data_width)
  })

  val aw_arb = Module(new Arbiter(new AXI4ChannelAW(output_id_width), 2))
  val w_arb = Module(new Arbiter(new AXI4ChannelW(output_id_width, axi4_data_width), 2))
  val ar_arb = Module(new Arbiter(new AXI4ChannelAR(output_id_width), 2))

  aw_arb.io.out <> io.out.aw
  w_arb.io.out <> io.out.w
  ar_arb.io.out <> io.out.ar

  val b_ready = Wire(Vec(fan_in, Bool()))
  val r_ready = Wire(Vec(fan_in, Bool()))

  for (i <- 0 until fan_in) {
    aw_arb.io.in(i) <> io.in(i).aw
    w_arb.io.in(i) <> io.in(i).w
    ar_arb.io.in(i) <> io.in(i).ar

    aw_arb.io.in(i).bits.id := Cat(i.U(id_extend_width.W), io.in(i).aw.bits.id)
    w_arb.io.in(i).bits.id := Cat(i.U(id_extend_width.W), io.in(i).w.bits.id)
    ar_arb.io.in(i).bits.id := Cat(i.U(id_extend_width.W), io.in(i).ar.bits.id)

    io.out.b <> io.in(i).b
    io.out.r <> io.in(i).r

    val b_id = io.out.b.bits.id(output_id_width - 1, id_width)
    val r_id = io.out.r.bits.id(output_id_width - 1, id_width)
    io.in(i).b.valid := io.out.b.valid && b_id === i.U
    io.in(i).r.valid := io.out.r.valid && r_id === i.U

    // ready can wait for valid????
    b_ready(i) := io.out.b.valid && b_id === i.U && io.in(i).b.ready
    r_ready(i) := io.out.r.valid && r_id === i.U && io.in(i).r.ready
  }
  io.out.b.ready := b_ready.asUInt.orR
  io.out.r.ready := r_ready.asUInt.orR
}
