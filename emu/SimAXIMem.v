`undef RANDOMIZE_MEM_INIT
module SimAXIMem(
  input   clock,
  input   reset,
  output  axi_aw_ready,
  input   axi_aw_valid,
  input  [31:0] axi_aw_bits_addr,
  input  [7:0] axi_aw_bits_len,
  input  [2:0] axi_aw_bits_size,
  input  [1:0] axi_aw_bits_burst,
  input   axi_aw_bits_lock,
  input  [3:0] axi_aw_bits_cache,
  input  [2:0] axi_aw_bits_prot,
  input  [3:0] axi_aw_bits_qos,
  input  [3:0] axi_aw_bits_region,
  input  [4:0] axi_aw_bits_id,
  input  [4:0] axi_aw_bits_user,
  output  axi_w_ready,
  input   axi_w_valid,
  input  [63:0] axi_w_bits_data,
  input   axi_w_bits_last,
  input  [4:0] axi_w_bits_id,
  input  [7:0] axi_w_bits_strb,
  input  [4:0] axi_w_bits_user,
  input   axi_b_ready,
  output  axi_b_valid,
  output [1:0] axi_b_bits_resp,
  output [4:0] axi_b_bits_id,
  output [4:0] axi_b_bits_user,
  output  axi_ar_ready,
  input   axi_ar_valid,
  input  [31:0] axi_ar_bits_addr,
  input  [7:0] axi_ar_bits_len,
  input  [2:0] axi_ar_bits_size,
  input  [1:0] axi_ar_bits_burst,
  input   axi_ar_bits_lock,
  input  [3:0] axi_ar_bits_cache,
  input  [2:0] axi_ar_bits_prot,
  input  [3:0] axi_ar_bits_qos,
  input  [3:0] axi_ar_bits_region,
  input  [4:0] axi_ar_bits_id,
  input  [4:0] axi_ar_bits_user,
  input   axi_r_ready,
  output  axi_r_valid,
  output [1:0] axi_r_bits_resp,
  output [63:0] axi_r_bits_data,
  output  axi_r_bits_last,
  output [4:0] axi_r_bits_id,
  output [4:0] axi_r_bits_user
);
  reg  rValid;
  reg [31:0] GEN_37;
  wire  T_354;
  reg [31:0] ar_addr;
  reg [31:0] GEN_38;
  reg [7:0] ar_len;
  reg [31:0] GEN_39;
  reg [2:0] ar_size;
  reg [31:0] GEN_40;
  reg [1:0] ar_burst;
  reg [31:0] GEN_41;
  reg  ar_lock;
  reg [31:0] GEN_42;
  reg [3:0] ar_cache;
  reg [31:0] GEN_43;
  reg [2:0] ar_prot;
  reg [31:0] GEN_44;
  reg [3:0] ar_qos;
  reg [31:0] GEN_45;
  reg [3:0] ar_region;
  reg [31:0] GEN_46;
  reg [4:0] ar_id;
  reg [31:0] GEN_47;
  reg [4:0] ar_user;
  reg [31:0] GEN_50;
  wire [31:0] GEN_0;
  wire [7:0] GEN_1;
  wire [2:0] GEN_2;
  wire [1:0] GEN_3;
  wire  GEN_4;
  wire [3:0] GEN_5;
  wire [2:0] GEN_6;
  wire [3:0] GEN_7;
  wire [3:0] GEN_8;
  wire [4:0] GEN_9;
  wire [4:0] GEN_10;
  wire  T_379;
  wire  GEN_11;
  wire  T_382;
  wire  T_383;
  wire  T_384;
  wire  T_386;
  wire [7:0] T_388;
  wire [31:0] GEN_48;
  wire [32:0] T_389;
  wire [31:0] T_390;
  wire [8:0] T_392;
  wire [7:0] T_393;
  wire  T_395;
  wire  GEN_12;
  wire [31:0] GEN_13;
  wire [7:0] GEN_14;
  wire  GEN_15;
  reg [63:0] mem [0:16777215];

  integer i;
  initial begin
    for (i = 0; i < 16777216; i = i + 1)
    begin
      mem[i] = 64'h0;
    end
  end

  always @(posedge clock) begin
    if (reset) begin
      $readmemh("ddr.bin.txt", mem, 'h0);
    end
  end
  reg [63:0] GEN_51;
  wire [63:0] mem_T_500_data;
  wire [23:0] mem_T_500_addr;
  wire [63:0] mem_T_508_data;
  wire [23:0] mem_T_508_addr;
  wire [63:0] mem_T_505_data;
  wire [23:0] mem_T_505_addr;
  wire  mem_T_505_mask;
  wire  mem_T_505_en;
  reg  wValid;
  reg [31:0] GEN_52;
  reg  bValid;
  reg [31:0] GEN_53;
  wire  T_400;
  reg [31:0] aw_addr;
  reg [31:0] GEN_54;
  reg [7:0] aw_len;
  reg [31:0] GEN_55;
  reg [2:0] aw_size;
  reg [31:0] GEN_56;
  reg [1:0] aw_burst;
  reg [31:0] GEN_57;
  reg  aw_lock;
  reg [31:0] GEN_58;
  reg [3:0] aw_cache;
  reg [31:0] GEN_59;
  reg [2:0] aw_prot;
  reg [31:0] GEN_60;
  reg [3:0] aw_qos;
  reg [31:0] GEN_61;
  reg [3:0] aw_region;
  reg [31:0] GEN_62;
  reg [4:0] aw_id;
  reg [31:0] GEN_63;
  reg [4:0] aw_user;
  reg [31:0] GEN_64;
  wire [31:0] GEN_16;
  wire [7:0] GEN_17;
  wire [2:0] GEN_18;
  wire [1:0] GEN_19;
  wire  GEN_20;
  wire [3:0] GEN_21;
  wire [2:0] GEN_22;
  wire [3:0] GEN_23;
  wire [3:0] GEN_24;
  wire [4:0] GEN_25;
  wire [4:0] GEN_26;
  wire  T_425;
  wire  T_427;
  wire  T_428;
  wire  T_429;
  wire  GEN_27;
  wire  GEN_28;
  wire  T_433;
  wire  T_434;
  wire  T_435;
  wire  T_437;
  wire [7:0] T_439;
  wire [31:0] GEN_49;
  wire [32:0] T_440;
  wire [31:0] T_441;
  wire [8:0] T_443;
  wire [7:0] T_444;
  wire  T_446;
  wire  GEN_29;
  wire  GEN_30;
  wire  T_449;
  wire  T_450;
  wire  T_451;
  wire  T_452;
  wire  T_453;
  wire  T_454;
  wire  T_455;
  wire  T_456;
  wire [7:0] T_460;
  wire [7:0] T_464;
  wire [7:0] T_468;
  wire [7:0] T_472;
  wire [7:0] T_476;
  wire [7:0] T_480;
  wire [7:0] T_484;
  wire [7:0] T_488;
  wire [15:0] T_489;
  wire [15:0] T_490;
  wire [31:0] T_491;
  wire [15:0] T_492;
  wire [15:0] T_493;
  wire [31:0] T_494;
  wire [63:0] T_495;
  wire [63:0] T_496;
  wire [63:0] T_497;
  wire [28:0] T_498;
  wire [23:0] T_499;
  wire [63:0] T_501;
  wire [63:0] T_502;
  wire [31:0] GEN_31;
  wire [7:0] GEN_32;
  wire  GEN_33;
  wire  GEN_34;
  wire [28:0] T_506;
  wire [23:0] T_507;
  reg [4:0] GEN_35;
  reg [31:0] GEN_65;
  reg [4:0] GEN_36;
  reg [31:0] GEN_66;
  assign axi_aw_ready = T_428;
  assign axi_w_ready = wValid;
  assign axi_b_valid = bValid;
  assign axi_b_bits_resp = 2'h0;
  assign axi_b_bits_id = aw_id;
  assign axi_b_bits_user = GEN_35;
  assign axi_ar_ready = T_379;
  assign axi_r_valid = rValid;
  assign axi_r_bits_resp = 2'h0;
  assign axi_r_bits_data = mem_T_508_data;
  assign axi_r_bits_last = T_395;
  assign axi_r_bits_id = ar_id;
  assign axi_r_bits_user = GEN_36;
  assign T_354 = axi_ar_ready & axi_ar_valid;
  assign GEN_0 = T_354 ? axi_ar_bits_addr : ar_addr;
  assign GEN_1 = T_354 ? axi_ar_bits_len : ar_len;
  assign GEN_2 = T_354 ? axi_ar_bits_size : ar_size;
  assign GEN_3 = T_354 ? axi_ar_bits_burst : ar_burst;
  assign GEN_4 = T_354 ? axi_ar_bits_lock : ar_lock;
  assign GEN_5 = T_354 ? axi_ar_bits_cache : ar_cache;
  assign GEN_6 = T_354 ? axi_ar_bits_prot : ar_prot;
  assign GEN_7 = T_354 ? axi_ar_bits_qos : ar_qos;
  assign GEN_8 = T_354 ? axi_ar_bits_region : ar_region;
  assign GEN_9 = T_354 ? axi_ar_bits_id : ar_id;
  assign GEN_10 = T_354 ? axi_ar_bits_user : ar_user;
  assign T_379 = rValid == 1'h0;
  assign GEN_11 = T_354 ? 1'h1 : rValid;
  assign T_382 = axi_r_ready & axi_r_valid;
  assign T_383 = ar_burst == 2'h1;
  assign T_384 = T_383 | reset;
  assign T_386 = T_384 == 1'h0;
  assign T_388 = 8'h1 << ar_size;
  assign GEN_48 = {{24'd0}, T_388};
  assign T_389 = ar_addr + GEN_48;
  assign T_390 = T_389[31:0];
  assign T_392 = ar_len - 8'h1;
  assign T_393 = T_392[7:0];
  assign T_395 = ar_len == 8'h0;
  assign GEN_12 = T_395 ? 1'h0 : GEN_11;
  assign GEN_13 = T_382 ? T_390 : GEN_0;
  assign GEN_14 = T_382 ? T_393 : GEN_1;
  assign GEN_15 = T_382 ? GEN_12 : GEN_11;
  assign mem_T_500_addr = T_499;
  assign mem_T_500_data = mem[mem_T_500_addr];
  assign mem_T_508_addr = T_507;
  assign mem_T_508_data = mem[mem_T_508_addr];
  assign mem_T_505_data = T_502;
  assign mem_T_505_addr = T_499;
  assign mem_T_505_mask = T_433;
  assign mem_T_505_en = T_433;
  assign T_400 = axi_aw_ready & axi_aw_valid;
  assign GEN_16 = T_400 ? axi_aw_bits_addr : aw_addr;
  assign GEN_17 = T_400 ? axi_aw_bits_len : aw_len;
  assign GEN_18 = T_400 ? axi_aw_bits_size : aw_size;
  assign GEN_19 = T_400 ? axi_aw_bits_burst : aw_burst;
  assign GEN_20 = T_400 ? axi_aw_bits_lock : aw_lock;
  assign GEN_21 = T_400 ? axi_aw_bits_cache : aw_cache;
  assign GEN_22 = T_400 ? axi_aw_bits_prot : aw_prot;
  assign GEN_23 = T_400 ? axi_aw_bits_qos : aw_qos;
  assign GEN_24 = T_400 ? axi_aw_bits_region : aw_region;
  assign GEN_25 = T_400 ? axi_aw_bits_id : aw_id;
  assign GEN_26 = T_400 ? axi_aw_bits_user : aw_user;
  assign T_425 = wValid == 1'h0;
  assign T_427 = bValid == 1'h0;
  assign T_428 = T_425 & T_427;
  assign T_429 = axi_b_ready & axi_b_valid;
  assign GEN_27 = T_429 ? 1'h0 : bValid;
  assign GEN_28 = T_400 ? 1'h1 : wValid;
  assign T_433 = axi_w_ready & axi_w_valid;
  assign T_434 = aw_burst == 2'h1;
  assign T_435 = T_434 | reset;
  assign T_437 = T_435 == 1'h0;
  assign T_439 = 8'h1 << aw_size;
  assign GEN_49 = {{24'd0}, T_439};
  assign T_440 = aw_addr + GEN_49;
  assign T_441 = T_440[31:0];
  assign T_443 = aw_len - 8'h1;
  assign T_444 = T_443[7:0];
  assign T_446 = aw_len == 8'h0;
  assign GEN_29 = T_446 ? 1'h0 : GEN_28;
  assign GEN_30 = T_446 ? 1'h1 : GEN_27;
  assign T_449 = axi_w_bits_strb[0];
  assign T_450 = axi_w_bits_strb[1];
  assign T_451 = axi_w_bits_strb[2];
  assign T_452 = axi_w_bits_strb[3];
  assign T_453 = axi_w_bits_strb[4];
  assign T_454 = axi_w_bits_strb[5];
  assign T_455 = axi_w_bits_strb[6];
  assign T_456 = axi_w_bits_strb[7];
  assign T_460 = T_449 ? 8'hff : 8'h0;
  assign T_464 = T_450 ? 8'hff : 8'h0;
  assign T_468 = T_451 ? 8'hff : 8'h0;
  assign T_472 = T_452 ? 8'hff : 8'h0;
  assign T_476 = T_453 ? 8'hff : 8'h0;
  assign T_480 = T_454 ? 8'hff : 8'h0;
  assign T_484 = T_455 ? 8'hff : 8'h0;
  assign T_488 = T_456 ? 8'hff : 8'h0;
  assign T_489 = {T_464,T_460};
  assign T_490 = {T_472,T_468};
  assign T_491 = {T_490,T_489};
  assign T_492 = {T_480,T_476};
  assign T_493 = {T_488,T_484};
  assign T_494 = {T_493,T_492};
  assign T_495 = {T_494,T_491};
  assign T_496 = T_495 & axi_w_bits_data;
  assign T_497 = ~ T_495;
  assign T_498 = aw_addr[31:3];
  assign T_499 = T_498[23:0];
  assign T_501 = T_497 & mem_T_500_data;
  assign T_502 = T_496 | T_501;
  assign GEN_31 = T_433 ? T_441 : GEN_16;
  assign GEN_32 = T_433 ? T_444 : GEN_17;
  assign GEN_33 = T_433 ? GEN_29 : GEN_28;
  assign GEN_34 = T_433 ? GEN_30 : GEN_27;
  assign T_506 = ar_addr[31:3];
  assign T_507 = T_506[23:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_37 = {1{$random}};
  rValid = GEN_37[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_38 = {1{$random}};
  ar_addr = GEN_38[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_39 = {1{$random}};
  ar_len = GEN_39[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_40 = {1{$random}};
  ar_size = GEN_40[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_41 = {1{$random}};
  ar_burst = GEN_41[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_42 = {1{$random}};
  ar_lock = GEN_42[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_43 = {1{$random}};
  ar_cache = GEN_43[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_44 = {1{$random}};
  ar_prot = GEN_44[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_45 = {1{$random}};
  ar_qos = GEN_45[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_46 = {1{$random}};
  ar_region = GEN_46[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_47 = {1{$random}};
  ar_id = GEN_47[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_50 = {1{$random}};
  ar_user = GEN_50[4:0];
  `endif
  GEN_51 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16777216; initvar = initvar+1)
    mem[initvar] = GEN_51[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_52 = {1{$random}};
  wValid = GEN_52[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_53 = {1{$random}};
  bValid = GEN_53[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_54 = {1{$random}};
  aw_addr = GEN_54[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_55 = {1{$random}};
  aw_len = GEN_55[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_56 = {1{$random}};
  aw_size = GEN_56[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_57 = {1{$random}};
  aw_burst = GEN_57[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_58 = {1{$random}};
  aw_lock = GEN_58[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_59 = {1{$random}};
  aw_cache = GEN_59[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_60 = {1{$random}};
  aw_prot = GEN_60[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_61 = {1{$random}};
  aw_qos = GEN_61[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_62 = {1{$random}};
  aw_region = GEN_62[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_63 = {1{$random}};
  aw_id = GEN_63[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_64 = {1{$random}};
  aw_user = GEN_64[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_65 = {1{$random}};
  GEN_35 = GEN_65[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_66 = {1{$random}};
  GEN_36 = GEN_66[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      rValid <= 1'h0;
    end else begin
      if (T_382) begin
        if (T_395) begin
          rValid <= 1'h0;
        end else begin
          if (T_354) begin
            rValid <= 1'h1;
          end
        end
      end else begin
        if (T_354) begin
          rValid <= 1'h1;
        end
      end
    end
    if (T_382) begin
      ar_addr <= T_390;
    end else begin
      if (T_354) begin
        ar_addr <= axi_ar_bits_addr;
      end
    end
    if (T_382) begin
      ar_len <= T_393;
    end else begin
      if (T_354) begin
        ar_len <= axi_ar_bits_len;
      end
    end
    if (T_354) begin
      ar_size <= axi_ar_bits_size;
    end
    if (T_354) begin
      ar_burst <= axi_ar_bits_burst;
    end
    if (T_354) begin
      ar_lock <= axi_ar_bits_lock;
    end
    if (T_354) begin
      ar_cache <= axi_ar_bits_cache;
    end
    if (T_354) begin
      ar_prot <= axi_ar_bits_prot;
    end
    if (T_354) begin
      ar_qos <= axi_ar_bits_qos;
    end
    if (T_354) begin
      ar_region <= axi_ar_bits_region;
    end
    if (T_354) begin
      ar_id <= axi_ar_bits_id;
    end
    if (T_354) begin
      ar_user <= axi_ar_bits_user;
    end
    if(mem_T_505_en & mem_T_505_mask) begin
      mem[mem_T_505_addr] <= mem_T_505_data;
    end
    if (reset) begin
      wValid <= 1'h0;
    end else begin
      if (T_433) begin
        if (T_446) begin
          wValid <= 1'h0;
        end else begin
          if (T_400) begin
            wValid <= 1'h1;
          end
        end
      end else begin
        if (T_400) begin
          wValid <= 1'h1;
        end
      end
    end
    if (reset) begin
      bValid <= 1'h0;
    end else begin
      if (T_433) begin
        if (T_446) begin
          bValid <= 1'h1;
        end else begin
          if (T_429) begin
            bValid <= 1'h0;
          end
        end
      end else begin
        if (T_429) begin
          bValid <= 1'h0;
        end
      end
    end
    if (T_433) begin
      aw_addr <= T_441;
    end else begin
      if (T_400) begin
        aw_addr <= axi_aw_bits_addr;
      end
    end
    if (T_433) begin
      aw_len <= T_444;
    end else begin
      if (T_400) begin
        aw_len <= axi_aw_bits_len;
      end
    end
    if (T_400) begin
      aw_size <= axi_aw_bits_size;
    end
    if (T_400) begin
      aw_burst <= axi_aw_bits_burst;
    end
    if (T_400) begin
      aw_lock <= axi_aw_bits_lock;
    end
    if (T_400) begin
      aw_cache <= axi_aw_bits_cache;
    end
    if (T_400) begin
      aw_prot <= axi_aw_bits_prot;
    end
    if (T_400) begin
      aw_qos <= axi_aw_bits_qos;
    end
    if (T_400) begin
      aw_region <= axi_aw_bits_region;
    end
    if (T_400) begin
      aw_id <= axi_aw_bits_id;
    end
    if (T_400) begin
      aw_user <= axi_aw_bits_user;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_382 & T_386) begin
          $fwrite(32'h80000002,"Assertion failed\n    at TestHarness.scala:84 assert(ar.burst === NastiConstants.BURST_INCR)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_382 & T_386) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_433 & T_437) begin
          $fwrite(32'h80000002,"Assertion failed\n    at TestHarness.scala:103 assert(aw.burst === NastiConstants.BURST_INCR)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_433 & T_437) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule
`define RANDOMIZE_MEM_INIT
