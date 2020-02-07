package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class MDU_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(DecoupledIO(new ISU_MDU_DATAIN(param)))
  val bypass = ValidIO(new MDU_ISU_BYPASS(param))
  val flush = Flipped(ValidIO(new Flush(param)))
  val rob = ValidIO(new ROBWPort(param))
  val mul = new MultiplierIO
  val div = new DividerIO
}

class MDU(param: CoreParams) extends Module
{
  val io = IO(new MDU_IO(param))
  val in_valid = RegInit(N)
  val in = Reg(new ISU_MDU_DATAIN(param))
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (in_valid) {
        printf("time: %d [isu_mdu]: pc: %x rob_idx: %x etw: %x fu_op: %d a: %x b: %x rd: %d\n",
          GTimer(), in.pc, in.rob_idx, in.etw, in.fu_op, in.a, in.b, in.rd)
      }
    }
  }

  val flush = io.flush.bits

  val flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, in.is_delayslot, in.branch_id)

  // mdu to isu bypass
  val bypass = io.bypass.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bypass.valid) {
        printf("time: %d [mdu_isu]: rd_wen: %d rd: %d rob_idx: %d val: %x \n",
          GTimer(), bypass.rd_wen, bypass.rd, bypass.rob_idx, bypass.value)
      }
    }
  }

  // MDU
  val mul_op_width = 33
  val div_op_width = 40
  val mul_ext_width = mul_op_width - param.xprlen
  val div_ext_width = div_op_width - param.xprlen

  val mul_latency = if(param.useLoongson) 3 else 7

  val mul_counter = RegInit(0.asUInt(log2Ceil(mul_latency).W))

  val is_mul = in.fu_op === FU_OP_MDU_MUL || in.fu_op === FU_OP_MDU_MULT || in.fu_op === FU_OP_MDU_MULTU
  val is_mov = in.fu_op === FU_OP_MDU_MTHI || in.fu_op === FU_OP_MDU_MTLO || in.fu_op === FU_OP_MDU_MFHI || in.fu_op === FU_OP_MDU_MFLO
  val is_div = in.fu_op === FU_OP_MDU_DIV || in.fu_op === FU_OP_MDU_DIVU

  io.in.ready := !in_valid || is_mov

  when (io.in.fire()) {
    in_valid := Y
    in := io.in.bits
    mul_counter := 0.U
  }

  val valid = Wire(Bool())
  val passdown = Wire(Bool())
  when (passdown && !io.in.fire()) {
    in_valid := N
  }

  val mul = new MultiplierIO
  val div = new DividerIO

  when (in_valid && is_mul && !flush_valid) { mul_counter := mul_counter + 1.U }

  // mul dout structure: | pad | data |
  val mul_lo_lsb = 0
  val mul_lo_msb = param.xprlen - 1
  val mul_hi_lsb = mul_lo_msb + 1
  val mul_hi_msb = mul_hi_lsb + param.xprlen - 1

  // div dout structure: | pad | quotient | pad | remainder |
  val div_lo_lsb = div_op_width
  val div_lo_msb = div_op_width + param.xprlen - 1
  val div_hi_lsb = 0
  val div_hi_msb = param.xprlen - 1

  val mul_a_sext = Cat(Fill(mul_ext_width, in.a(param.xprlen - 1)), in.a)
  val mul_b_sext = Cat(Fill(mul_ext_width, in.b(param.xprlen - 1)), in.b)
  val div_a_sext = Cat(Fill(div_ext_width, in.a(param.xprlen - 1)), in.a)
  val div_b_sext = Cat(Fill(div_ext_width, in.b(param.xprlen - 1)), in.b)

  val mul_a_uext = Cat(Fill(mul_ext_width, "b0".U), in.a)
  val mul_b_uext = Cat(Fill(mul_ext_width, "b0".U), in.b)
  val div_a_uext = Cat(Fill(div_ext_width, "b0".U), in.a)
  val div_b_uext = Cat(Fill(div_ext_width, "b0".U), in.b)

  io.mul.a := Mux(in.fu_op === FU_OP_MDU_MULTU, mul_a_uext, mul_a_sext)
  io.mul.b := Mux(in.fu_op === FU_OP_MDU_MULTU, mul_b_uext, mul_b_sext)

  val flush_pending = RegInit(N)
  val div_need_flush = flush_valid || flush_pending

  val div_req :: div_wait_divisor_tready :: div_wait_diviend_tready :: div_wait_tdout_valid :: Nil = Enum(UInt(), 4)
  val div_status = RegInit(div_req)
  val div_busy = in_valid && is_div
  def is(state: UInt) = (div_status === state)
  io.div.diviend.valid := div_busy && ((is(div_req) && !flush_valid) || is(div_wait_diviend_tready))
  io.div.diviend.bits := Mux(in.fu_op === FU_OP_MDU_DIVU, div_a_uext, div_a_sext)
  io.div.divisor.valid := div_busy && ((is(div_req) && !flush_valid) || is(div_wait_divisor_tready))
  io.div.divisor.bits := Mux(in.fu_op === FU_OP_MDU_DIVU, div_b_uext, div_b_sext)

  val divisor_fire = io.div.divisor.fire()
  val diviend_fire = io.div.diviend.fire()
  when (div_busy) {
    when (is(div_req)) {
      when (divisor_fire && diviend_fire) {
        div_status := div_wait_tdout_valid
      }
      when(divisor_fire && !diviend_fire) {
        div_status := div_wait_diviend_tready
      }
      when(!divisor_fire && diviend_fire) {
        div_status := div_wait_divisor_tready
      }
    }
    when ((is(div_wait_divisor_tready) && divisor_fire) ||
      (is(div_wait_diviend_tready) && diviend_fire)) {
      div_status := div_wait_tdout_valid
    }
    when (is(div_wait_tdout_valid) && io.div.dout.valid) {
      div_status := div_req
    }
  }

  val wb_wen = in.fu_op === FU_OP_MDU_MUL || in.fu_op === FU_OP_MDU_MFHI || in.fu_op === FU_OP_MDU_MFLO
  val hi_lo_wen = Mux1H(Array(
    (in.fu_op === FU_OP_MDU_MULT)  ->  Y,
    (in.fu_op === FU_OP_MDU_MULTU) ->  Y,
    (in.fu_op === FU_OP_MDU_DIV)   ->  Y,
    (in.fu_op === FU_OP_MDU_DIVU)  ->  Y
  ))
  val hi_only_wen = in.fu_op === FU_OP_MDU_MTHI
  val lo_only_wen = in.fu_op === FU_OP_MDU_MTLO

  val mul_valid = is_mul && (mul_counter === mul_latency.U)
  val div_valid = is_div && io.div.dout.valid

  valid := in_valid && (is_mov || mul_valid || (div_valid && !div_need_flush))
  passdown := valid && !flush_valid
  val rd_wen = wb_wen
  val hi = Mux(in.fu_op === FU_OP_MDU_MTHI, in.a,
    Mux(is_mul, io.mul.dout(mul_hi_msb, mul_hi_lsb), io.div.dout.bits(div_hi_msb, div_hi_lsb))
  )
  val hi_wen = hi_lo_wen || hi_only_wen
  val lo = Mux(in.fu_op === FU_OP_MDU_MTLO, in.a,
    Mux(is_mul, io.mul.dout(mul_lo_msb, mul_lo_lsb), io.div.dout.bits(div_lo_msb, div_lo_lsb))
  )
  val lo_wen = hi_lo_wen || lo_only_wen
  val reg = in

  // for MFHI and MFLO, hi/lo values comes from in.a
  val value = Mux(in.fu_op === FU_OP_MDU_MUL, io.mul.dout(mul_lo_msb, mul_lo_lsb), in.a)

  io.rob.valid := passdown
  val rob = io.rob.bits
  rob.idx := in.rob_idx
  val robEntry = rob.entry
  robEntry.ready := Y
  robEntry.fu_type := FU_TYPE_MDU

  robEntry.value := value
  robEntry.rd := reg.rd
  robEntry.rd_wen := rd_wen
  robEntry.pc := reg.pc
  robEntry.instr := reg.instr
  robEntry.is_delayslot := reg.is_delayslot
  robEntry.branch_id := reg.branch_id
  robEntry.etw := reg.etw

  robEntry.target := DontCare
  robEntry.is_taken := DontCare
  robEntry.bp_info := DontCare

  robEntry.hi := hi
  robEntry.hi_wen := hi_wen
  robEntry.lo := lo
  robEntry.lo_wen := lo_wen

  robEntry.badvaddr := DontCare
  robEntry.lsq_idx := DontCare
  robEntry.is_load := DontCare
  robEntry.speculative := DontCare

  io.bypass.valid := io.rob.valid
  bypass.value := robEntry.value
  bypass.rd := robEntry.rd
  bypass.rob_idx := in.rob_idx
  bypass.rd_wen := robEntry.rd_wen
  bypass.hi := robEntry.hi
  bypass.hi_wen := robEntry.hi_wen
  bypass.lo := robEntry.lo
  bypass.lo_wen := robEntry.lo_wen

  // ******************** flush logic ********************
  // there are two types of flush
  // direct_flush and pending_flush
  // direct_flush:
  //   if it's mov, mul or div(in div_req state, nothing sent to divider yet), we can flush it whenever flush signal is raised
  //   for mul, since the external mdu is pipelined and has fixed latency.
  //   we can simply reset mul_counter to zero, we effectly forgets there is an multiply inflight.
  //   The output will not bother us since next time, we will still count cycles to wait for the correct output
  // pending_flush:
  //   when there is div inflight, we need to wait until it finishes and ignore the result
  //   if we haven't sent anything to divider, say: we are in div_req state
  //   we can simply flush by stop rasing reqs
  val div_inflight = (is(div_wait_divisor_tready) || is(div_wait_diviend_tready) ||
    (is(div_wait_tdout_valid) && !io.div.dout.valid))
  when (div_busy && div_inflight && flush_valid) {
    flush_pending := Y
  }

  val direct_flush = in_valid && (is_mul || is_mov || (is_div && is(div_req))) && flush_valid
  val flush_inflight_div = div_busy && io.div.dout.valid && flush_pending
  when (direct_flush || flush_inflight_div) {
    when (!io.in.valid) { in_valid := N }
    mul_counter := 0.U
    flush_pending := N
  }
}
