module AXI4RAM_sram(
  input   clock,
  input   reset,
  output  io_in_0_aw_ready,
  input   io_in_0_aw_valid,
  input  [3:0] io_in_0_aw_bits_id,
  input  [27:0] io_in_0_aw_bits_addr,
  input  [7:0] io_in_0_aw_bits_len,
  input  [2:0] io_in_0_aw_bits_size,
  input  [1:0] io_in_0_aw_bits_burst,
  input   io_in_0_aw_bits_lock,
  input  [3:0] io_in_0_aw_bits_cache,
  input  [2:0] io_in_0_aw_bits_prot,
  input  [3:0] io_in_0_aw_bits_qos,
  output  io_in_0_w_ready,
  input   io_in_0_w_valid,
  input  [63:0] io_in_0_w_bits_data,
  input  [7:0] io_in_0_w_bits_strb,
  input   io_in_0_w_bits_last,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [3:0] io_in_0_b_bits_id,
  output [1:0] io_in_0_b_bits_resp,
  output  io_in_0_ar_ready,
  input   io_in_0_ar_valid,
  input  [3:0] io_in_0_ar_bits_id,
  input  [27:0] io_in_0_ar_bits_addr,
  input  [7:0] io_in_0_ar_bits_len,
  input  [2:0] io_in_0_ar_bits_size,
  input  [1:0] io_in_0_ar_bits_burst,
  input   io_in_0_ar_bits_lock,
  input  [3:0] io_in_0_ar_bits_cache,
  input  [2:0] io_in_0_ar_bits_prot,
  input  [3:0] io_in_0_ar_bits_qos,
  input   io_in_0_r_ready,
  output  io_in_0_r_valid,
  output [3:0] io_in_0_r_bits_id,
  output [63:0] io_in_0_r_bits_data,
  output [1:0] io_in_0_r_bits_resp,
  output  io_in_0_r_bits_last
);
  wire [24:0] mem_R0_addr;
  wire  mem_R0_en;
  wire  mem_R0_clk;
  wire [7:0] mem_R0_data_0;
  wire [7:0] mem_R0_data_1;
  wire [7:0] mem_R0_data_2;
  wire [7:0] mem_R0_data_3;
  wire [7:0] mem_R0_data_4;
  wire [7:0] mem_R0_data_5;
  wire [7:0] mem_R0_data_6;
  wire [7:0] mem_R0_data_7;
  wire [24:0] mem_W0_addr;
  wire  mem_W0_en;
  wire  mem_W0_clk;
  wire [7:0] mem_W0_data_0;
  wire [7:0] mem_W0_data_1;
  wire [7:0] mem_W0_data_2;
  wire [7:0] mem_W0_data_3;
  wire [7:0] mem_W0_data_4;
  wire [7:0] mem_W0_data_5;
  wire [7:0] mem_W0_data_6;
  wire [7:0] mem_W0_data_7;
  wire  mem_W0_mask_0;
  wire  mem_W0_mask_1;
  wire  mem_W0_mask_2;
  wire  mem_W0_mask_3;
  wire  mem_W0_mask_4;
  wire  mem_W0_mask_5;
  wire  mem_W0_mask_6;
  wire  mem_W0_mask_7;
  wire [24:0] T_747;
  wire  T_748;
  wire  T_749;
  wire  T_750;
  wire  T_751;
  wire  T_752;
  wire  T_753;
  wire  T_754;
  wire  T_755;
  wire  T_756;
  wire  T_757;
  wire  T_758;
  wire  T_759;
  wire  T_760;
  wire  T_761;
  wire  T_762;
  wire  T_763;
  wire  T_764;
  wire  T_765;
  wire  T_766;
  wire  T_767;
  wire  T_768;
  wire  T_769;
  wire  T_770;
  wire  T_771;
  wire  T_772;
  wire [1:0] T_773;
  wire [2:0] T_774;
  wire [1:0] T_775;
  wire [2:0] T_776;
  wire [5:0] T_777;
  wire [1:0] T_778;
  wire [2:0] T_779;
  wire [1:0] T_780;
  wire [2:0] T_781;
  wire [5:0] T_782;
  wire [11:0] T_783;
  wire [1:0] T_784;
  wire [2:0] T_785;
  wire [1:0] T_786;
  wire [2:0] T_787;
  wire [5:0] T_788;
  wire [1:0] T_789;
  wire [2:0] T_790;
  wire [1:0] T_791;
  wire [1:0] T_792;
  wire [3:0] T_793;
  wire [6:0] T_794;
  wire [12:0] T_795;
  wire [24:0] r_addr;
  wire [24:0] T_796;
  wire  T_797;
  wire  T_798;
  wire  T_799;
  wire  T_800;
  wire  T_801;
  wire  T_802;
  wire  T_803;
  wire  T_804;
  wire  T_805;
  wire  T_806;
  wire  T_807;
  wire  T_808;
  wire  T_809;
  wire  T_810;
  wire  T_811;
  wire  T_812;
  wire  T_813;
  wire  T_814;
  wire  T_815;
  wire  T_816;
  wire  T_817;
  wire  T_818;
  wire  T_819;
  wire  T_820;
  wire  T_821;
  wire [1:0] T_822;
  wire [2:0] T_823;
  wire [1:0] T_824;
  wire [2:0] T_825;
  wire [5:0] T_826;
  wire [1:0] T_827;
  wire [2:0] T_828;
  wire [1:0] T_829;
  wire [2:0] T_830;
  wire [5:0] T_831;
  wire [11:0] T_832;
  wire [1:0] T_833;
  wire [2:0] T_834;
  wire [1:0] T_835;
  wire [2:0] T_836;
  wire [5:0] T_837;
  wire [1:0] T_838;
  wire [2:0] T_839;
  wire [1:0] T_840;
  wire [1:0] T_841;
  wire [3:0] T_842;
  wire [6:0] T_843;
  wire [12:0] T_844;
  wire [24:0] w_addr;
  wire  T_845;
  wire  T_846;
  wire  T_847;
  wire [7:0] T_848;
  wire [7:0] T_849;
  wire [7:0] T_850;
  wire [7:0] T_851;
  wire [7:0] T_852;
  wire [7:0] T_853;
  wire [7:0] T_854;
  wire [7:0] T_855;
  wire [7:0] wdata_0;
  wire [7:0] wdata_1;
  wire [7:0] wdata_2;
  wire [7:0] wdata_3;
  wire [7:0] wdata_4;
  wire [7:0] wdata_5;
  wire [7:0] wdata_6;
  wire [7:0] wdata_7;
  wire  T_877;
  wire  T_878;
  wire  T_879;
  wire  T_880;
  wire  T_881;
  wire  T_882;
  wire  T_883;
  wire  T_884;
  wire  T_885;
  wire  GEN_20;
  wire  GEN_22;
  wire  GEN_24;
  wire  GEN_26;
  wire  GEN_28;
  wire  GEN_30;
  wire  GEN_32;
  wire  GEN_34;
  reg  r_full;
  reg [31:0] GEN_0;
  reg [3:0] r_id;
  reg [31:0] GEN_1;
  wire  T_890;
  wire  GEN_35;
  wire  T_892;
  wire  GEN_36;
  wire  T_895;
  wire  T_896;
  wire [3:0] GEN_37;
  wire [24:0] T_899;
  reg  T_905;
  reg [31:0] GEN_2;
  wire  T_907;
  reg [7:0] T_910_0;
  reg [31:0] GEN_3;
  reg [7:0] T_910_1;
  reg [31:0] GEN_4;
  reg [7:0] T_910_2;
  reg [31:0] GEN_5;
  reg [7:0] T_910_3;
  reg [31:0] GEN_6;
  reg [7:0] T_910_4;
  reg [31:0] GEN_7;
  reg [7:0] T_910_5;
  reg [31:0] GEN_8;
  reg [7:0] T_910_6;
  reg [31:0] GEN_9;
  reg [7:0] T_910_7;
  reg [31:0] GEN_10;
  wire [7:0] GEN_42;
  wire [7:0] GEN_43;
  wire [7:0] GEN_44;
  wire [7:0] GEN_45;
  wire [7:0] GEN_46;
  wire [7:0] GEN_47;
  wire [7:0] GEN_48;
  wire [7:0] GEN_49;
  wire [7:0] rdata_0;
  wire [7:0] rdata_1;
  wire [7:0] rdata_2;
  wire [7:0] rdata_3;
  wire [7:0] rdata_4;
  wire [7:0] rdata_5;
  wire [7:0] rdata_6;
  wire [7:0] rdata_7;
  wire [15:0] T_913;
  wire [15:0] T_914;
  wire [31:0] T_915;
  wire [15:0] T_916;
  wire [15:0] T_917;
  wire [31:0] T_918;
  wire [63:0] T_919;
  mem mem (
    .R0_addr(mem_R0_addr),
    .R0_en(mem_R0_en),
    .R0_clk(mem_R0_clk),
    .R0_data_0(mem_R0_data_0),
    .R0_data_1(mem_R0_data_1),
    .R0_data_2(mem_R0_data_2),
    .R0_data_3(mem_R0_data_3),
    .R0_data_4(mem_R0_data_4),
    .R0_data_5(mem_R0_data_5),
    .R0_data_6(mem_R0_data_6),
    .R0_data_7(mem_R0_data_7),
    .W0_addr(mem_W0_addr),
    .W0_en(mem_W0_en),
    .W0_clk(mem_W0_clk),
    .W0_data_0(mem_W0_data_0),
    .W0_data_1(mem_W0_data_1),
    .W0_data_2(mem_W0_data_2),
    .W0_data_3(mem_W0_data_3),
    .W0_data_4(mem_W0_data_4),
    .W0_data_5(mem_W0_data_5),
    .W0_data_6(mem_W0_data_6),
    .W0_data_7(mem_W0_data_7),
    .W0_mask_0(mem_W0_mask_0),
    .W0_mask_1(mem_W0_mask_1),
    .W0_mask_2(mem_W0_mask_2),
    .W0_mask_3(mem_W0_mask_3),
    .W0_mask_4(mem_W0_mask_4),
    .W0_mask_5(mem_W0_mask_5),
    .W0_mask_6(mem_W0_mask_6),
    .W0_mask_7(mem_W0_mask_7)
  );
  assign io_in_0_aw_ready = T_845;
  assign io_in_0_w_ready = T_846;
  assign io_in_0_b_valid = T_847;
  assign io_in_0_b_bits_id = io_in_0_aw_bits_id;
  assign io_in_0_b_bits_resp = 2'h0;
  assign io_in_0_ar_ready = T_896;
  assign io_in_0_r_valid = r_full;
  assign io_in_0_r_bits_id = r_id;
  assign io_in_0_r_bits_data = T_919;
  assign io_in_0_r_bits_resp = 2'h0;
  assign io_in_0_r_bits_last = 1'h1;
  assign mem_R0_addr = T_899;
  assign mem_R0_en = T_892;
  assign mem_R0_clk = clock;
  assign mem_W0_addr = w_addr;
  assign mem_W0_en = T_877;
  assign mem_W0_clk = clock;
  assign mem_W0_data_0 = wdata_0;
  assign mem_W0_data_1 = wdata_1;
  assign mem_W0_data_2 = wdata_2;
  assign mem_W0_data_3 = wdata_3;
  assign mem_W0_data_4 = wdata_4;
  assign mem_W0_data_5 = wdata_5;
  assign mem_W0_data_6 = wdata_6;
  assign mem_W0_data_7 = wdata_7;
  assign mem_W0_mask_0 = GEN_20;
  assign mem_W0_mask_1 = GEN_22;
  assign mem_W0_mask_2 = GEN_24;
  assign mem_W0_mask_3 = GEN_26;
  assign mem_W0_mask_4 = GEN_28;
  assign mem_W0_mask_5 = GEN_30;
  assign mem_W0_mask_6 = GEN_32;
  assign mem_W0_mask_7 = GEN_34;
  assign T_747 = io_in_0_ar_bits_addr[27:3];
  assign T_748 = T_747[0];
  assign T_749 = T_747[1];
  assign T_750 = T_747[2];
  assign T_751 = T_747[3];
  assign T_752 = T_747[4];
  assign T_753 = T_747[5];
  assign T_754 = T_747[6];
  assign T_755 = T_747[7];
  assign T_756 = T_747[8];
  assign T_757 = T_747[9];
  assign T_758 = T_747[10];
  assign T_759 = T_747[11];
  assign T_760 = T_747[12];
  assign T_761 = T_747[13];
  assign T_762 = T_747[14];
  assign T_763 = T_747[15];
  assign T_764 = T_747[16];
  assign T_765 = T_747[17];
  assign T_766 = T_747[18];
  assign T_767 = T_747[19];
  assign T_768 = T_747[20];
  assign T_769 = T_747[21];
  assign T_770 = T_747[22];
  assign T_771 = T_747[23];
  assign T_772 = T_747[24];
  assign T_773 = {T_750,T_749};
  assign T_774 = {T_773,T_748};
  assign T_775 = {T_753,T_752};
  assign T_776 = {T_775,T_751};
  assign T_777 = {T_776,T_774};
  assign T_778 = {T_756,T_755};
  assign T_779 = {T_778,T_754};
  assign T_780 = {T_759,T_758};
  assign T_781 = {T_780,T_757};
  assign T_782 = {T_781,T_779};
  assign T_783 = {T_782,T_777};
  assign T_784 = {T_762,T_761};
  assign T_785 = {T_784,T_760};
  assign T_786 = {T_765,T_764};
  assign T_787 = {T_786,T_763};
  assign T_788 = {T_787,T_785};
  assign T_789 = {T_768,T_767};
  assign T_790 = {T_789,T_766};
  assign T_791 = {T_770,T_769};
  assign T_792 = {T_772,T_771};
  assign T_793 = {T_792,T_791};
  assign T_794 = {T_793,T_790};
  assign T_795 = {T_794,T_788};
  assign r_addr = {T_795,T_783};
  assign T_796 = io_in_0_aw_bits_addr[27:3];
  assign T_797 = T_796[0];
  assign T_798 = T_796[1];
  assign T_799 = T_796[2];
  assign T_800 = T_796[3];
  assign T_801 = T_796[4];
  assign T_802 = T_796[5];
  assign T_803 = T_796[6];
  assign T_804 = T_796[7];
  assign T_805 = T_796[8];
  assign T_806 = T_796[9];
  assign T_807 = T_796[10];
  assign T_808 = T_796[11];
  assign T_809 = T_796[12];
  assign T_810 = T_796[13];
  assign T_811 = T_796[14];
  assign T_812 = T_796[15];
  assign T_813 = T_796[16];
  assign T_814 = T_796[17];
  assign T_815 = T_796[18];
  assign T_816 = T_796[19];
  assign T_817 = T_796[20];
  assign T_818 = T_796[21];
  assign T_819 = T_796[22];
  assign T_820 = T_796[23];
  assign T_821 = T_796[24];
  assign T_822 = {T_799,T_798};
  assign T_823 = {T_822,T_797};
  assign T_824 = {T_802,T_801};
  assign T_825 = {T_824,T_800};
  assign T_826 = {T_825,T_823};
  assign T_827 = {T_805,T_804};
  assign T_828 = {T_827,T_803};
  assign T_829 = {T_808,T_807};
  assign T_830 = {T_829,T_806};
  assign T_831 = {T_830,T_828};
  assign T_832 = {T_831,T_826};
  assign T_833 = {T_811,T_810};
  assign T_834 = {T_833,T_809};
  assign T_835 = {T_814,T_813};
  assign T_836 = {T_835,T_812};
  assign T_837 = {T_836,T_834};
  assign T_838 = {T_817,T_816};
  assign T_839 = {T_838,T_815};
  assign T_840 = {T_819,T_818};
  assign T_841 = {T_821,T_820};
  assign T_842 = {T_841,T_840};
  assign T_843 = {T_842,T_839};
  assign T_844 = {T_843,T_837};
  assign w_addr = {T_844,T_832};
  assign T_845 = io_in_0_w_valid & io_in_0_b_ready;
  assign T_846 = io_in_0_aw_valid & io_in_0_b_ready;
  assign T_847 = io_in_0_w_valid & io_in_0_aw_valid;
  assign T_848 = io_in_0_w_bits_data[7:0];
  assign T_849 = io_in_0_w_bits_data[15:8];
  assign T_850 = io_in_0_w_bits_data[23:16];
  assign T_851 = io_in_0_w_bits_data[31:24];
  assign T_852 = io_in_0_w_bits_data[39:32];
  assign T_853 = io_in_0_w_bits_data[47:40];
  assign T_854 = io_in_0_w_bits_data[55:48];
  assign T_855 = io_in_0_w_bits_data[63:56];
  assign wdata_0 = T_848;
  assign wdata_1 = T_849;
  assign wdata_2 = T_850;
  assign wdata_3 = T_851;
  assign wdata_4 = T_852;
  assign wdata_5 = T_853;
  assign wdata_6 = T_854;
  assign wdata_7 = T_855;
  assign T_877 = io_in_0_b_ready & io_in_0_b_valid;
  assign T_878 = io_in_0_w_bits_strb[0];
  assign T_879 = io_in_0_w_bits_strb[1];
  assign T_880 = io_in_0_w_bits_strb[2];
  assign T_881 = io_in_0_w_bits_strb[3];
  assign T_882 = io_in_0_w_bits_strb[4];
  assign T_883 = io_in_0_w_bits_strb[5];
  assign T_884 = io_in_0_w_bits_strb[6];
  assign T_885 = io_in_0_w_bits_strb[7];
  assign GEN_20 = T_877 ? T_878 : 1'h0;
  assign GEN_22 = T_877 ? T_879 : 1'h0;
  assign GEN_24 = T_877 ? T_880 : 1'h0;
  assign GEN_26 = T_877 ? T_881 : 1'h0;
  assign GEN_28 = T_877 ? T_882 : 1'h0;
  assign GEN_30 = T_877 ? T_883 : 1'h0;
  assign GEN_32 = T_877 ? T_884 : 1'h0;
  assign GEN_34 = T_877 ? T_885 : 1'h0;
  assign T_890 = io_in_0_r_ready & io_in_0_r_valid;
  assign GEN_35 = T_890 ? 1'h0 : r_full;
  assign T_892 = io_in_0_ar_ready & io_in_0_ar_valid;
  assign GEN_36 = T_892 ? 1'h1 : GEN_35;
  assign T_895 = r_full == 1'h0;
  assign T_896 = io_in_0_r_ready | T_895;
  assign GEN_37 = T_892 ? io_in_0_ar_bits_id : r_id;
  assign T_899 = r_addr;
  assign T_907 = T_905 == 1'h0;
  assign GEN_42 = T_905 ? mem_R0_data_0 : T_910_0;
  assign GEN_43 = T_905 ? mem_R0_data_1 : T_910_1;
  assign GEN_44 = T_905 ? mem_R0_data_2 : T_910_2;
  assign GEN_45 = T_905 ? mem_R0_data_3 : T_910_3;
  assign GEN_46 = T_905 ? mem_R0_data_4 : T_910_4;
  assign GEN_47 = T_905 ? mem_R0_data_5 : T_910_5;
  assign GEN_48 = T_905 ? mem_R0_data_6 : T_910_6;
  assign GEN_49 = T_905 ? mem_R0_data_7 : T_910_7;
  assign rdata_0 = T_907 ? T_910_0 : mem_R0_data_0;
  assign rdata_1 = T_907 ? T_910_1 : mem_R0_data_1;
  assign rdata_2 = T_907 ? T_910_2 : mem_R0_data_2;
  assign rdata_3 = T_907 ? T_910_3 : mem_R0_data_3;
  assign rdata_4 = T_907 ? T_910_4 : mem_R0_data_4;
  assign rdata_5 = T_907 ? T_910_5 : mem_R0_data_5;
  assign rdata_6 = T_907 ? T_910_6 : mem_R0_data_6;
  assign rdata_7 = T_907 ? T_910_7 : mem_R0_data_7;
  assign T_913 = {rdata_1,rdata_0};
  assign T_914 = {rdata_3,rdata_2};
  assign T_915 = {T_914,T_913};
  assign T_916 = {rdata_5,rdata_4};
  assign T_917 = {rdata_7,rdata_6};
  assign T_918 = {T_917,T_916};
  assign T_919 = {T_918,T_915};
  always @(posedge clock) begin
    if (reset) begin
      r_full <= 1'h0;
    end else begin
      if (T_892) begin
        r_full <= 1'h1;
      end else begin
        if (T_890) begin
          r_full <= 1'h0;
        end
      end
    end
    if (T_892) begin
      r_id <= io_in_0_ar_bits_id;
    end
    T_905 <= T_892;
    if (T_905) begin
      T_910_0 <= mem_R0_data_0;
    end
    if (T_905) begin
      T_910_1 <= mem_R0_data_1;
    end
    if (T_905) begin
      T_910_2 <= mem_R0_data_2;
    end
    if (T_905) begin
      T_910_3 <= mem_R0_data_3;
    end
    if (T_905) begin
      T_910_4 <= mem_R0_data_4;
    end
    if (T_905) begin
      T_910_5 <= mem_R0_data_5;
    end
    if (T_905) begin
      T_910_6 <= mem_R0_data_6;
    end
    if (T_905) begin
      T_910_7 <= mem_R0_data_7;
    end
  end
endmodule
module Queue(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [27:0] io_enq_bits_addr,
  input  [7:0] io_enq_bits_len,
  input  [2:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_burst,
  input   io_enq_bits_lock,
  input  [3:0] io_enq_bits_cache,
  input  [2:0] io_enq_bits_prot,
  input  [3:0] io_enq_bits_qos,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [27:0] io_deq_bits_addr,
  output [7:0] io_deq_bits_len,
  output [2:0] io_deq_bits_size,
  output [1:0] io_deq_bits_burst,
  output  io_deq_bits_lock,
  output [3:0] io_deq_bits_cache,
  output [2:0] io_deq_bits_prot,
  output [3:0] io_deq_bits_qos,
  output  io_count
);
  reg [3:0] ram_id [0:0];
  reg [31:0] GEN_0;
  wire [3:0] ram_id_T_115_data;
  wire  ram_id_T_115_addr;
  wire [3:0] ram_id_T_97_data;
  wire  ram_id_T_97_addr;
  wire  ram_id_T_97_mask;
  wire  ram_id_T_97_en;
  reg [27:0] ram_addr [0:0];
  reg [31:0] GEN_1;
  wire [27:0] ram_addr_T_115_data;
  wire  ram_addr_T_115_addr;
  wire [27:0] ram_addr_T_97_data;
  wire  ram_addr_T_97_addr;
  wire  ram_addr_T_97_mask;
  wire  ram_addr_T_97_en;
  reg [7:0] ram_len [0:0];
  reg [31:0] GEN_2;
  wire [7:0] ram_len_T_115_data;
  wire  ram_len_T_115_addr;
  wire [7:0] ram_len_T_97_data;
  wire  ram_len_T_97_addr;
  wire  ram_len_T_97_mask;
  wire  ram_len_T_97_en;
  reg [2:0] ram_size [0:0];
  reg [31:0] GEN_3;
  wire [2:0] ram_size_T_115_data;
  wire  ram_size_T_115_addr;
  wire [2:0] ram_size_T_97_data;
  wire  ram_size_T_97_addr;
  wire  ram_size_T_97_mask;
  wire  ram_size_T_97_en;
  reg [1:0] ram_burst [0:0];
  reg [31:0] GEN_4;
  wire [1:0] ram_burst_T_115_data;
  wire  ram_burst_T_115_addr;
  wire [1:0] ram_burst_T_97_data;
  wire  ram_burst_T_97_addr;
  wire  ram_burst_T_97_mask;
  wire  ram_burst_T_97_en;
  reg  ram_lock [0:0];
  reg [31:0] GEN_5;
  wire  ram_lock_T_115_data;
  wire  ram_lock_T_115_addr;
  wire  ram_lock_T_97_data;
  wire  ram_lock_T_97_addr;
  wire  ram_lock_T_97_mask;
  wire  ram_lock_T_97_en;
  reg [3:0] ram_cache [0:0];
  reg [31:0] GEN_6;
  wire [3:0] ram_cache_T_115_data;
  wire  ram_cache_T_115_addr;
  wire [3:0] ram_cache_T_97_data;
  wire  ram_cache_T_97_addr;
  wire  ram_cache_T_97_mask;
  wire  ram_cache_T_97_en;
  reg [2:0] ram_prot [0:0];
  reg [31:0] GEN_7;
  wire [2:0] ram_prot_T_115_data;
  wire  ram_prot_T_115_addr;
  wire [2:0] ram_prot_T_97_data;
  wire  ram_prot_T_97_addr;
  wire  ram_prot_T_97_mask;
  wire  ram_prot_T_97_en;
  reg [3:0] ram_qos [0:0];
  reg [31:0] GEN_8;
  wire [3:0] ram_qos_T_115_data;
  wire  ram_qos_T_115_addr;
  wire [3:0] ram_qos_T_97_data;
  wire  ram_qos_T_97_addr;
  wire  ram_qos_T_97_mask;
  wire  ram_qos_T_97_en;
  reg  maybe_full;
  reg [31:0] GEN_9;
  wire  T_93;
  wire  T_94;
  wire  do_enq;
  wire  T_95;
  wire  do_deq;
  wire  T_109;
  wire  GEN_12;
  wire  T_111;
  wire  GEN_13;
  wire  GEN_14;
  wire [3:0] GEN_15;
  wire [27:0] GEN_16;
  wire [7:0] GEN_17;
  wire [2:0] GEN_18;
  wire [1:0] GEN_19;
  wire  GEN_20;
  wire [3:0] GEN_21;
  wire [2:0] GEN_22;
  wire [3:0] GEN_23;
  wire  GEN_24;
  wire  GEN_25;
  wire [1:0] T_128;
  wire  ptr_diff;
  wire [1:0] T_130;
  assign io_enq_ready = T_93;
  assign io_deq_valid = GEN_13;
  assign io_deq_bits_id = GEN_15;
  assign io_deq_bits_addr = GEN_16;
  assign io_deq_bits_len = GEN_17;
  assign io_deq_bits_size = GEN_18;
  assign io_deq_bits_burst = GEN_19;
  assign io_deq_bits_lock = GEN_20;
  assign io_deq_bits_cache = GEN_21;
  assign io_deq_bits_prot = GEN_22;
  assign io_deq_bits_qos = GEN_23;
  assign io_count = T_130[0];
  assign ram_id_T_115_addr = 1'h0;
  assign ram_id_T_115_data = ram_id[ram_id_T_115_addr];
  assign ram_id_T_97_data = io_enq_bits_id;
  assign ram_id_T_97_addr = 1'h0;
  assign ram_id_T_97_mask = do_enq;
  assign ram_id_T_97_en = do_enq;
  assign ram_addr_T_115_addr = 1'h0;
  assign ram_addr_T_115_data = ram_addr[ram_addr_T_115_addr];
  assign ram_addr_T_97_data = io_enq_bits_addr;
  assign ram_addr_T_97_addr = 1'h0;
  assign ram_addr_T_97_mask = do_enq;
  assign ram_addr_T_97_en = do_enq;
  assign ram_len_T_115_addr = 1'h0;
  assign ram_len_T_115_data = ram_len[ram_len_T_115_addr];
  assign ram_len_T_97_data = io_enq_bits_len;
  assign ram_len_T_97_addr = 1'h0;
  assign ram_len_T_97_mask = do_enq;
  assign ram_len_T_97_en = do_enq;
  assign ram_size_T_115_addr = 1'h0;
  assign ram_size_T_115_data = ram_size[ram_size_T_115_addr];
  assign ram_size_T_97_data = io_enq_bits_size;
  assign ram_size_T_97_addr = 1'h0;
  assign ram_size_T_97_mask = do_enq;
  assign ram_size_T_97_en = do_enq;
  assign ram_burst_T_115_addr = 1'h0;
  assign ram_burst_T_115_data = ram_burst[ram_burst_T_115_addr];
  assign ram_burst_T_97_data = io_enq_bits_burst;
  assign ram_burst_T_97_addr = 1'h0;
  assign ram_burst_T_97_mask = do_enq;
  assign ram_burst_T_97_en = do_enq;
  assign ram_lock_T_115_addr = 1'h0;
  assign ram_lock_T_115_data = ram_lock[ram_lock_T_115_addr];
  assign ram_lock_T_97_data = io_enq_bits_lock;
  assign ram_lock_T_97_addr = 1'h0;
  assign ram_lock_T_97_mask = do_enq;
  assign ram_lock_T_97_en = do_enq;
  assign ram_cache_T_115_addr = 1'h0;
  assign ram_cache_T_115_data = ram_cache[ram_cache_T_115_addr];
  assign ram_cache_T_97_data = io_enq_bits_cache;
  assign ram_cache_T_97_addr = 1'h0;
  assign ram_cache_T_97_mask = do_enq;
  assign ram_cache_T_97_en = do_enq;
  assign ram_prot_T_115_addr = 1'h0;
  assign ram_prot_T_115_data = ram_prot[ram_prot_T_115_addr];
  assign ram_prot_T_97_data = io_enq_bits_prot;
  assign ram_prot_T_97_addr = 1'h0;
  assign ram_prot_T_97_mask = do_enq;
  assign ram_prot_T_97_en = do_enq;
  assign ram_qos_T_115_addr = 1'h0;
  assign ram_qos_T_115_data = ram_qos[ram_qos_T_115_addr];
  assign ram_qos_T_97_data = io_enq_bits_qos;
  assign ram_qos_T_97_addr = 1'h0;
  assign ram_qos_T_97_mask = do_enq;
  assign ram_qos_T_97_en = do_enq;
  assign T_93 = maybe_full == 1'h0;
  assign T_94 = io_enq_ready & io_enq_valid;
  assign do_enq = GEN_25;
  assign T_95 = io_deq_ready & io_deq_valid;
  assign do_deq = GEN_24;
  assign T_109 = do_enq != do_deq;
  assign GEN_12 = T_109 ? do_enq : maybe_full;
  assign T_111 = T_93 == 1'h0;
  assign GEN_13 = io_enq_valid ? 1'h1 : T_111;
  assign GEN_14 = io_deq_ready ? 1'h0 : T_94;
  assign GEN_15 = T_93 ? io_enq_bits_id : ram_id_T_115_data;
  assign GEN_16 = T_93 ? io_enq_bits_addr : ram_addr_T_115_data;
  assign GEN_17 = T_93 ? io_enq_bits_len : ram_len_T_115_data;
  assign GEN_18 = T_93 ? io_enq_bits_size : ram_size_T_115_data;
  assign GEN_19 = T_93 ? io_enq_bits_burst : ram_burst_T_115_data;
  assign GEN_20 = T_93 ? io_enq_bits_lock : ram_lock_T_115_data;
  assign GEN_21 = T_93 ? io_enq_bits_cache : ram_cache_T_115_data;
  assign GEN_22 = T_93 ? io_enq_bits_prot : ram_prot_T_115_data;
  assign GEN_23 = T_93 ? io_enq_bits_qos : ram_qos_T_115_data;
  assign GEN_24 = T_93 ? 1'h0 : T_95;
  assign GEN_25 = T_93 ? GEN_14 : T_94;
  assign T_128 = 1'h0 - 1'h0;
  assign ptr_diff = T_128[0:0];
  assign T_130 = {maybe_full,ptr_diff};
  always @(posedge clock) begin
    if(ram_id_T_97_en & ram_id_T_97_mask) begin
      ram_id[ram_id_T_97_addr] <= ram_id_T_97_data;
    end
    if(ram_addr_T_97_en & ram_addr_T_97_mask) begin
      ram_addr[ram_addr_T_97_addr] <= ram_addr_T_97_data;
    end
    if(ram_len_T_97_en & ram_len_T_97_mask) begin
      ram_len[ram_len_T_97_addr] <= ram_len_T_97_data;
    end
    if(ram_size_T_97_en & ram_size_T_97_mask) begin
      ram_size[ram_size_T_97_addr] <= ram_size_T_97_data;
    end
    if(ram_burst_T_97_en & ram_burst_T_97_mask) begin
      ram_burst[ram_burst_T_97_addr] <= ram_burst_T_97_data;
    end
    if(ram_lock_T_97_en & ram_lock_T_97_mask) begin
      ram_lock[ram_lock_T_97_addr] <= ram_lock_T_97_data;
    end
    if(ram_cache_T_97_en & ram_cache_T_97_mask) begin
      ram_cache[ram_cache_T_97_addr] <= ram_cache_T_97_data;
    end
    if(ram_prot_T_97_en & ram_prot_T_97_mask) begin
      ram_prot[ram_prot_T_97_addr] <= ram_prot_T_97_data;
    end
    if(ram_qos_T_97_en & ram_qos_T_97_mask) begin
      ram_qos[ram_qos_T_97_addr] <= ram_qos_T_97_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_109) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Queue_3(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [1:0] io_enq_bits_resp,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [1:0] io_deq_bits_resp,
  output  io_count
);
  reg [3:0] ram_id [0:0];
  reg [31:0] GEN_0;
  wire [3:0] ram_id_T_59_data;
  wire  ram_id_T_59_addr;
  wire [3:0] ram_id_T_48_data;
  wire  ram_id_T_48_addr;
  wire  ram_id_T_48_mask;
  wire  ram_id_T_48_en;
  reg [1:0] ram_resp [0:0];
  reg [31:0] GEN_1;
  wire [1:0] ram_resp_T_59_data;
  wire  ram_resp_T_59_addr;
  wire [1:0] ram_resp_T_48_data;
  wire  ram_resp_T_48_addr;
  wire  ram_resp_T_48_mask;
  wire  ram_resp_T_48_en;
  reg  maybe_full;
  reg [31:0] GEN_2;
  wire  T_44;
  wire  T_45;
  wire  do_enq;
  wire  T_46;
  wire  do_deq;
  wire  T_53;
  wire  GEN_5;
  wire  T_55;
  wire  GEN_6;
  wire  GEN_7;
  wire [3:0] GEN_8;
  wire [1:0] GEN_9;
  wire  GEN_10;
  wire  GEN_11;
  wire [1:0] T_65;
  wire  ptr_diff;
  wire [1:0] T_67;
  assign io_enq_ready = T_44;
  assign io_deq_valid = GEN_6;
  assign io_deq_bits_id = GEN_8;
  assign io_deq_bits_resp = GEN_9;
  assign io_count = T_67[0];
  assign ram_id_T_59_addr = 1'h0;
  assign ram_id_T_59_data = ram_id[ram_id_T_59_addr];
  assign ram_id_T_48_data = io_enq_bits_id;
  assign ram_id_T_48_addr = 1'h0;
  assign ram_id_T_48_mask = do_enq;
  assign ram_id_T_48_en = do_enq;
  assign ram_resp_T_59_addr = 1'h0;
  assign ram_resp_T_59_data = ram_resp[ram_resp_T_59_addr];
  assign ram_resp_T_48_data = io_enq_bits_resp;
  assign ram_resp_T_48_addr = 1'h0;
  assign ram_resp_T_48_mask = do_enq;
  assign ram_resp_T_48_en = do_enq;
  assign T_44 = maybe_full == 1'h0;
  assign T_45 = io_enq_ready & io_enq_valid;
  assign do_enq = GEN_11;
  assign T_46 = io_deq_ready & io_deq_valid;
  assign do_deq = GEN_10;
  assign T_53 = do_enq != do_deq;
  assign GEN_5 = T_53 ? do_enq : maybe_full;
  assign T_55 = T_44 == 1'h0;
  assign GEN_6 = io_enq_valid ? 1'h1 : T_55;
  assign GEN_7 = io_deq_ready ? 1'h0 : T_45;
  assign GEN_8 = T_44 ? io_enq_bits_id : ram_id_T_59_data;
  assign GEN_9 = T_44 ? io_enq_bits_resp : ram_resp_T_59_data;
  assign GEN_10 = T_44 ? 1'h0 : T_46;
  assign GEN_11 = T_44 ? GEN_7 : T_45;
  assign T_65 = 1'h0 - 1'h0;
  assign ptr_diff = T_65[0:0];
  assign T_67 = {maybe_full,ptr_diff};
  always @(posedge clock) begin
    if(ram_id_T_48_en & ram_id_T_48_mask) begin
      ram_id[ram_id_T_48_addr] <= ram_id_T_48_data;
    end
    if(ram_resp_T_48_en & ram_resp_T_48_mask) begin
      ram_resp[ram_resp_T_48_addr] <= ram_resp_T_48_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_53) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module AXI4FragmenterSideband(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits,
  output [2:0] io_count
);
  reg [1:0] state;
  reg [31:0] GEN_11;
  reg [1:0] count;
  reg [31:0] GEN_12;
  wire  full;
  wire  empty;
  wire  last;
  wire  T_31;
  wire  T_32;
  wire  T_33;
  wire  T_34;
  wire  T_36;
  wire  T_38;
  wire  T_39;
  wire  T_40;
  wire  T_41;
  wire  T_42;
  wire  T_43;
  wire  T_44;
  wire  T_45;
  wire  T_47;
  wire  T_48;
  wire  T_49;
  wire  T_51;
  wire  GEN_0;
  wire  GEN_1;
  wire  GEN_2;
  wire  T_53;
  wire [1:0] GEN_9;
  wire [2:0] T_54;
  wire [1:0] T_55;
  wire  T_56;
  wire [1:0] GEN_10;
  wire [2:0] T_57;
  wire [1:0] T_58;
  wire  T_59;
  wire  T_61;
  wire  T_62;
  wire  T_63;
  wire [1:0] GEN_3;
  wire [1:0] GEN_4;
  wire  T_64;
  wire  T_65;
  wire  T_68;
  wire [1:0] T_69;
  wire [1:0] GEN_5;
  wire [1:0] GEN_6;
  wire  T_70;
  wire  T_71;
  wire [1:0] GEN_7;
  wire [1:0] GEN_8;
  assign io_enq_ready = T_44;
  assign io_deq_valid = GEN_1;
  assign io_deq_bits = GEN_2;
  assign io_count = 3'h0;
  assign full = count == 2'h3;
  assign empty = count == 2'h0;
  assign last = count == 2'h1;
  assign T_31 = state[1];
  assign T_32 = state[0];
  assign T_33 = last & T_32;
  assign T_34 = T_31 | T_33;
  assign T_36 = empty == 1'h0;
  assign T_38 = full == 1'h0;
  assign T_39 = state == 2'h0;
  assign T_40 = empty | T_39;
  assign T_41 = state == 2'h2;
  assign T_42 = T_41 & io_enq_bits;
  assign T_43 = T_40 | T_42;
  assign T_44 = T_38 & T_43;
  assign T_45 = state != 2'h1;
  assign T_47 = count != 2'h0;
  assign T_48 = T_45 | T_47;
  assign T_49 = T_48 | reset;
  assign T_51 = T_49 == 1'h0;
  assign GEN_0 = empty ? io_enq_bits : T_34;
  assign GEN_1 = io_enq_valid ? 1'h1 : T_36;
  assign GEN_2 = io_enq_valid ? GEN_0 : T_34;
  assign T_53 = io_enq_ready & io_enq_valid;
  assign GEN_9 = {{1'd0}, T_53};
  assign T_54 = count + GEN_9;
  assign T_55 = T_54[1:0];
  assign T_56 = io_deq_ready & io_deq_valid;
  assign GEN_10 = {{1'd0}, T_56};
  assign T_57 = T_55 - GEN_10;
  assign T_58 = T_57[1:0];
  assign T_59 = 2'h2 == state;
  assign T_61 = io_enq_bits == 1'h0;
  assign T_62 = io_enq_valid & T_61;
  assign T_63 = T_62 & empty;
  assign GEN_3 = T_63 ? 2'h0 : state;
  assign GEN_4 = T_59 ? GEN_3 : state;
  assign T_64 = 2'h0 == state;
  assign T_65 = io_enq_valid & io_enq_bits;
  assign T_68 = T_65 & T_38;
  assign T_69 = empty ? 2'h2 : 2'h1;
  assign GEN_5 = T_68 ? T_69 : GEN_4;
  assign GEN_6 = T_64 ? GEN_5 : GEN_4;
  assign T_70 = 2'h1 == state;
  assign T_71 = last & io_deq_ready;
  assign GEN_7 = T_71 ? 2'h2 : GEN_6;
  assign GEN_8 = T_70 ? GEN_7 : GEN_6;
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h2;
    end else begin
      if (T_70) begin
        if (T_71) begin
          state <= 2'h2;
        end else begin
          if (T_64) begin
            if (T_68) begin
              if (empty) begin
                state <= 2'h2;
              end else begin
                state <= 2'h1;
              end
            end else begin
              if (T_59) begin
                if (T_63) begin
                  state <= 2'h0;
                end
              end
            end
          end else begin
            if (T_59) begin
              if (T_63) begin
                state <= 2'h0;
              end
            end
          end
        end
      end else begin
        if (T_64) begin
          if (T_68) begin
            if (empty) begin
              state <= 2'h2;
            end else begin
              state <= 2'h1;
            end
          end else begin
            if (T_59) begin
              if (T_63) begin
                state <= 2'h0;
              end
            end
          end
        end else begin
          if (T_59) begin
            if (T_63) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      count <= 2'h0;
    end else begin
      count <= T_58;
    end
  end
endmodule
module AXI4Fragmenter(
  input   clock,
  input   reset,
  output  io_in_0_aw_ready,
  input   io_in_0_aw_valid,
  input  [3:0] io_in_0_aw_bits_id,
  input  [27:0] io_in_0_aw_bits_addr,
  input  [7:0] io_in_0_aw_bits_len,
  input  [2:0] io_in_0_aw_bits_size,
  input  [1:0] io_in_0_aw_bits_burst,
  input   io_in_0_aw_bits_lock,
  input  [3:0] io_in_0_aw_bits_cache,
  input  [2:0] io_in_0_aw_bits_prot,
  input  [3:0] io_in_0_aw_bits_qos,
  output  io_in_0_w_ready,
  input   io_in_0_w_valid,
  input  [63:0] io_in_0_w_bits_data,
  input  [7:0] io_in_0_w_bits_strb,
  input   io_in_0_w_bits_last,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [3:0] io_in_0_b_bits_id,
  output [1:0] io_in_0_b_bits_resp,
  output  io_in_0_ar_ready,
  input   io_in_0_ar_valid,
  input  [3:0] io_in_0_ar_bits_id,
  input  [27:0] io_in_0_ar_bits_addr,
  input  [7:0] io_in_0_ar_bits_len,
  input  [2:0] io_in_0_ar_bits_size,
  input  [1:0] io_in_0_ar_bits_burst,
  input   io_in_0_ar_bits_lock,
  input  [3:0] io_in_0_ar_bits_cache,
  input  [2:0] io_in_0_ar_bits_prot,
  input  [3:0] io_in_0_ar_bits_qos,
  input   io_in_0_r_ready,
  output  io_in_0_r_valid,
  output [3:0] io_in_0_r_bits_id,
  output [63:0] io_in_0_r_bits_data,
  output [1:0] io_in_0_r_bits_resp,
  output  io_in_0_r_bits_last,
  input   io_out_0_aw_ready,
  output  io_out_0_aw_valid,
  output [3:0] io_out_0_aw_bits_id,
  output [27:0] io_out_0_aw_bits_addr,
  output [7:0] io_out_0_aw_bits_len,
  output [2:0] io_out_0_aw_bits_size,
  output [1:0] io_out_0_aw_bits_burst,
  output  io_out_0_aw_bits_lock,
  output [3:0] io_out_0_aw_bits_cache,
  output [2:0] io_out_0_aw_bits_prot,
  output [3:0] io_out_0_aw_bits_qos,
  input   io_out_0_w_ready,
  output  io_out_0_w_valid,
  output [63:0] io_out_0_w_bits_data,
  output [7:0] io_out_0_w_bits_strb,
  output  io_out_0_w_bits_last,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [3:0] io_out_0_b_bits_id,
  input  [1:0] io_out_0_b_bits_resp,
  input   io_out_0_ar_ready,
  output  io_out_0_ar_valid,
  output [3:0] io_out_0_ar_bits_id,
  output [27:0] io_out_0_ar_bits_addr,
  output [7:0] io_out_0_ar_bits_len,
  output [2:0] io_out_0_ar_bits_size,
  output [1:0] io_out_0_ar_bits_burst,
  output  io_out_0_ar_bits_lock,
  output [3:0] io_out_0_ar_bits_cache,
  output [2:0] io_out_0_ar_bits_prot,
  output [3:0] io_out_0_ar_bits_qos,
  output  io_out_0_r_ready,
  input   io_out_0_r_valid,
  input  [3:0] io_out_0_r_bits_id,
  input  [63:0] io_out_0_r_bits_data,
  input  [1:0] io_out_0_r_bits_resp,
  input   io_out_0_r_bits_last
);
  wire  Queue_4_clock;
  wire  Queue_4_reset;
  wire  Queue_4_io_enq_ready;
  wire  Queue_4_io_enq_valid;
  wire [3:0] Queue_4_io_enq_bits_id;
  wire [27:0] Queue_4_io_enq_bits_addr;
  wire [7:0] Queue_4_io_enq_bits_len;
  wire [2:0] Queue_4_io_enq_bits_size;
  wire [1:0] Queue_4_io_enq_bits_burst;
  wire  Queue_4_io_enq_bits_lock;
  wire [3:0] Queue_4_io_enq_bits_cache;
  wire [2:0] Queue_4_io_enq_bits_prot;
  wire [3:0] Queue_4_io_enq_bits_qos;
  wire  Queue_4_io_deq_ready;
  wire  Queue_4_io_deq_valid;
  wire [3:0] Queue_4_io_deq_bits_id;
  wire [27:0] Queue_4_io_deq_bits_addr;
  wire [7:0] Queue_4_io_deq_bits_len;
  wire [2:0] Queue_4_io_deq_bits_size;
  wire [1:0] Queue_4_io_deq_bits_burst;
  wire  Queue_4_io_deq_bits_lock;
  wire [3:0] Queue_4_io_deq_bits_cache;
  wire [2:0] Queue_4_io_deq_bits_prot;
  wire [3:0] Queue_4_io_deq_bits_qos;
  wire  Queue_4_io_count;
  wire  T_1216_ready;
  wire  T_1216_valid;
  wire [3:0] T_1216_bits_id;
  wire [27:0] T_1216_bits_addr;
  wire [7:0] T_1216_bits_len;
  wire [2:0] T_1216_bits_size;
  wire [1:0] T_1216_bits_burst;
  wire  T_1216_bits_lock;
  wire [3:0] T_1216_bits_cache;
  wire [2:0] T_1216_bits_prot;
  wire [3:0] T_1216_bits_qos;
  wire  in_ar_ready;
  wire  in_ar_valid;
  wire [3:0] in_ar_bits_id;
  wire [27:0] in_ar_bits_addr;
  wire [7:0] in_ar_bits_len;
  wire [2:0] in_ar_bits_size;
  wire [1:0] in_ar_bits_burst;
  wire  in_ar_bits_lock;
  wire [3:0] in_ar_bits_cache;
  wire [2:0] in_ar_bits_prot;
  wire [3:0] in_ar_bits_qos;
  reg  T_1266;
  reg [31:0] GEN_13;
  reg [27:0] T_1268;
  reg [31:0] GEN_14;
  reg [7:0] T_1270;
  reg [31:0] GEN_15;
  wire [7:0] T_1271;
  wire [27:0] T_1272;
  wire  T_1288_0;
  wire  T_1325;
  wire [8:0] T_1331;
  wire [8:0] T_1333;
  wire [15:0] GEN_23;
  wire [15:0] T_1338;
  wire [27:0] GEN_24;
  wire [28:0] T_1339;
  wire [27:0] T_1340;
  wire [15:0] T_1342;
  wire [22:0] GEN_25;
  wire [22:0] T_1343;
  wire [14:0] T_1344;
  wire [27:0] T_1345;
  wire  T_1346;
  wire [27:0] GEN_26;
  wire [27:0] T_1347;
  wire [27:0] T_1348;
  wire [27:0] T_1349;
  wire [27:0] T_1350;
  wire [27:0] T_1351;
  wire [27:0] GEN_0;
  wire [27:0] GEN_1;
  wire  ar_last;
  wire  T_1353;
  wire [27:0] T_1354;
  wire [9:0] T_1357;
  wire [2:0] T_1358;
  wire [2:0] T_1359;
  wire [27:0] GEN_28;
  wire [27:0] T_1360;
  wire [27:0] T_1361;
  wire  T_1362;
  wire  T_1364;
  wire [8:0] GEN_29;
  wire [9:0] T_1365;
  wire [8:0] T_1366;
  wire  GEN_2;
  wire [27:0] GEN_3;
  wire [8:0] GEN_4;
  wire  Queue_1_1_clock;
  wire  Queue_1_1_reset;
  wire  Queue_1_1_io_enq_ready;
  wire  Queue_1_1_io_enq_valid;
  wire [3:0] Queue_1_1_io_enq_bits_id;
  wire [27:0] Queue_1_1_io_enq_bits_addr;
  wire [7:0] Queue_1_1_io_enq_bits_len;
  wire [2:0] Queue_1_1_io_enq_bits_size;
  wire [1:0] Queue_1_1_io_enq_bits_burst;
  wire  Queue_1_1_io_enq_bits_lock;
  wire [3:0] Queue_1_1_io_enq_bits_cache;
  wire [2:0] Queue_1_1_io_enq_bits_prot;
  wire [3:0] Queue_1_1_io_enq_bits_qos;
  wire  Queue_1_1_io_deq_ready;
  wire  Queue_1_1_io_deq_valid;
  wire [3:0] Queue_1_1_io_deq_bits_id;
  wire [27:0] Queue_1_1_io_deq_bits_addr;
  wire [7:0] Queue_1_1_io_deq_bits_len;
  wire [2:0] Queue_1_1_io_deq_bits_size;
  wire [1:0] Queue_1_1_io_deq_bits_burst;
  wire  Queue_1_1_io_deq_bits_lock;
  wire [3:0] Queue_1_1_io_deq_bits_cache;
  wire [2:0] Queue_1_1_io_deq_bits_prot;
  wire [3:0] Queue_1_1_io_deq_bits_qos;
  wire  Queue_1_1_io_count;
  wire  T_1402_ready;
  wire  T_1402_valid;
  wire [3:0] T_1402_bits_id;
  wire [27:0] T_1402_bits_addr;
  wire [7:0] T_1402_bits_len;
  wire [2:0] T_1402_bits_size;
  wire [1:0] T_1402_bits_burst;
  wire  T_1402_bits_lock;
  wire [3:0] T_1402_bits_cache;
  wire [2:0] T_1402_bits_prot;
  wire [3:0] T_1402_bits_qos;
  wire  in_aw_ready;
  wire  in_aw_valid;
  wire [3:0] in_aw_bits_id;
  wire [27:0] in_aw_bits_addr;
  wire [7:0] in_aw_bits_len;
  wire [2:0] in_aw_bits_size;
  wire [1:0] in_aw_bits_burst;
  wire  in_aw_bits_lock;
  wire [3:0] in_aw_bits_cache;
  wire [2:0] in_aw_bits_prot;
  wire [3:0] in_aw_bits_qos;
  reg  T_1452;
  reg [31:0] GEN_16;
  reg [27:0] T_1454;
  reg [31:0] GEN_17;
  reg [7:0] T_1456;
  reg [31:0] GEN_18;
  wire [7:0] T_1457;
  wire [27:0] T_1458;
  wire  T_1474_0;
  wire  T_1511;
  wire [15:0] T_1523;
  wire [27:0] GEN_41;
  wire [28:0] T_1524;
  wire [27:0] T_1525;
  wire [15:0] T_1527;
  wire [22:0] GEN_42;
  wire [22:0] T_1528;
  wire [14:0] T_1529;
  wire [27:0] T_1530;
  wire  T_1531;
  wire [27:0] GEN_43;
  wire [27:0] T_1532;
  wire [27:0] T_1533;
  wire [27:0] T_1534;
  wire [27:0] T_1535;
  wire [27:0] T_1536;
  wire [27:0] GEN_5;
  wire [27:0] GEN_6;
  wire  aw_last;
  wire  T_1538;
  wire [27:0] T_1539;
  wire [9:0] T_1542;
  wire [2:0] T_1543;
  wire [2:0] T_1544;
  wire [27:0] GEN_45;
  wire [27:0] T_1545;
  wire [27:0] T_1546;
  wire  T_1547;
  wire  T_1549;
  wire [8:0] GEN_46;
  wire [9:0] T_1550;
  wire [8:0] T_1551;
  wire  GEN_7;
  wire [27:0] GEN_8;
  wire [8:0] GEN_9;
  wire  out_ar_ready;
  wire  out_ar_valid;
  wire [3:0] out_ar_bits_id;
  wire [27:0] out_ar_bits_addr;
  wire [7:0] out_ar_bits_len;
  wire [2:0] out_ar_bits_size;
  wire [1:0] out_ar_bits_burst;
  wire  out_ar_bits_lock;
  wire [3:0] out_ar_bits_cache;
  wire [2:0] out_ar_bits_prot;
  wire [3:0] out_ar_bits_qos;
  wire  out_r_ready;
  wire  out_r_valid;
  wire [3:0] out_r_bits_id;
  wire [63:0] out_r_bits_data;
  wire [1:0] out_r_bits_resp;
  wire  out_r_bits_last;
  wire  out_b_ready;
  wire  out_b_valid;
  wire [3:0] out_b_bits_id;
  wire [1:0] out_b_bits_resp;
  wire  Queue_2_1_clock;
  wire  Queue_2_1_reset;
  wire  Queue_2_1_io_enq_ready;
  wire  Queue_2_1_io_enq_valid;
  wire [3:0] Queue_2_1_io_enq_bits_id;
  wire [27:0] Queue_2_1_io_enq_bits_addr;
  wire [7:0] Queue_2_1_io_enq_bits_len;
  wire [2:0] Queue_2_1_io_enq_bits_size;
  wire [1:0] Queue_2_1_io_enq_bits_burst;
  wire  Queue_2_1_io_enq_bits_lock;
  wire [3:0] Queue_2_1_io_enq_bits_cache;
  wire [2:0] Queue_2_1_io_enq_bits_prot;
  wire [3:0] Queue_2_1_io_enq_bits_qos;
  wire  Queue_2_1_io_deq_ready;
  wire  Queue_2_1_io_deq_valid;
  wire [3:0] Queue_2_1_io_deq_bits_id;
  wire [27:0] Queue_2_1_io_deq_bits_addr;
  wire [7:0] Queue_2_1_io_deq_bits_len;
  wire [2:0] Queue_2_1_io_deq_bits_size;
  wire [1:0] Queue_2_1_io_deq_bits_burst;
  wire  Queue_2_1_io_deq_bits_lock;
  wire [3:0] Queue_2_1_io_deq_bits_cache;
  wire [2:0] Queue_2_1_io_deq_bits_prot;
  wire [3:0] Queue_2_1_io_deq_bits_qos;
  wire  Queue_2_1_io_count;
  wire  Queue_3_1_clock;
  wire  Queue_3_1_reset;
  wire  Queue_3_1_io_enq_ready;
  wire  Queue_3_1_io_enq_valid;
  wire [3:0] Queue_3_1_io_enq_bits_id;
  wire [1:0] Queue_3_1_io_enq_bits_resp;
  wire  Queue_3_1_io_deq_ready;
  wire  Queue_3_1_io_deq_valid;
  wire [3:0] Queue_3_1_io_deq_bits_id;
  wire [1:0] Queue_3_1_io_deq_bits_resp;
  wire  Queue_3_1_io_count;
  wire  AXI4FragmenterSideband_2_clock;
  wire  AXI4FragmenterSideband_2_reset;
  wire  AXI4FragmenterSideband_2_io_enq_ready;
  wire  AXI4FragmenterSideband_2_io_enq_valid;
  wire  AXI4FragmenterSideband_2_io_enq_bits;
  wire  AXI4FragmenterSideband_2_io_deq_ready;
  wire  AXI4FragmenterSideband_2_io_deq_valid;
  wire  AXI4FragmenterSideband_2_io_deq_bits;
  wire [2:0] AXI4FragmenterSideband_2_io_count;
  wire  AXI4FragmenterSideband_1_1_clock;
  wire  AXI4FragmenterSideband_1_1_reset;
  wire  AXI4FragmenterSideband_1_1_io_enq_ready;
  wire  AXI4FragmenterSideband_1_1_io_enq_valid;
  wire  AXI4FragmenterSideband_1_1_io_enq_bits;
  wire  AXI4FragmenterSideband_1_1_io_deq_ready;
  wire  AXI4FragmenterSideband_1_1_io_deq_valid;
  wire  AXI4FragmenterSideband_1_1_io_deq_bits;
  wire [2:0] AXI4FragmenterSideband_1_1_io_count;
  wire  T_1612;
  wire  T_1613;
  wire  T_1614;
  reg  wbeats_latched;
  reg [31:0] GEN_19;
  wire  wbeats_ready;
  wire  wbeats_valid;
  wire  T_1618;
  wire  GEN_10;
  wire  T_1620;
  wire  GEN_11;
  wire  T_1622;
  wire  T_1623;
  wire  T_1624;
  wire  T_1625;
  wire  T_1627;
  wire  T_1628;
  wire  T_1630;
  wire  T_1632;
  wire  T_1633;
  reg [8:0] w_counter;
  reg [31:0] GEN_20;
  wire  w_idle;
  wire [8:0] T_1637;
  wire [8:0] w_todo;
  wire  w_last;
  wire  T_1639;
  wire [8:0] GEN_47;
  wire [9:0] T_1640;
  wire [8:0] T_1641;
  wire  T_1644;
  wire  T_1646;
  wire  T_1647;
  wire  T_1648;
  wire  T_1650;
  wire  T_1652;
  wire  T_1653;
  wire  T_1654;
  wire  T_1658;
  wire  T_1660;
  wire  T_1662;
  wire  T_1663;
  wire  T_1664;
  wire  T_1665;
  wire  T_1667;
  wire  T_1669;
  wire  T_1670;
  wire  T_1671;
  wire  T_1675;
  wire  T_1676;
  wire  T_1677;
  wire  T_1678;
  wire  T_1679;
  wire  T_1680;
  wire  T_1682;
  wire  T_1683;
  wire  T_1684;
  wire  T_1688;
  reg [1:0] r_resp;
  reg [31:0] GEN_21;
  wire [1:0] resp;
  wire  T_1690;
  wire [1:0] T_1692;
  wire [1:0] GEN_12;
  Queue Queue_4 (
    .clock(Queue_4_clock),
    .reset(Queue_4_reset),
    .io_enq_ready(Queue_4_io_enq_ready),
    .io_enq_valid(Queue_4_io_enq_valid),
    .io_enq_bits_id(Queue_4_io_enq_bits_id),
    .io_enq_bits_addr(Queue_4_io_enq_bits_addr),
    .io_enq_bits_len(Queue_4_io_enq_bits_len),
    .io_enq_bits_size(Queue_4_io_enq_bits_size),
    .io_enq_bits_burst(Queue_4_io_enq_bits_burst),
    .io_enq_bits_lock(Queue_4_io_enq_bits_lock),
    .io_enq_bits_cache(Queue_4_io_enq_bits_cache),
    .io_enq_bits_prot(Queue_4_io_enq_bits_prot),
    .io_enq_bits_qos(Queue_4_io_enq_bits_qos),
    .io_deq_ready(Queue_4_io_deq_ready),
    .io_deq_valid(Queue_4_io_deq_valid),
    .io_deq_bits_id(Queue_4_io_deq_bits_id),
    .io_deq_bits_addr(Queue_4_io_deq_bits_addr),
    .io_deq_bits_len(Queue_4_io_deq_bits_len),
    .io_deq_bits_size(Queue_4_io_deq_bits_size),
    .io_deq_bits_burst(Queue_4_io_deq_bits_burst),
    .io_deq_bits_lock(Queue_4_io_deq_bits_lock),
    .io_deq_bits_cache(Queue_4_io_deq_bits_cache),
    .io_deq_bits_prot(Queue_4_io_deq_bits_prot),
    .io_deq_bits_qos(Queue_4_io_deq_bits_qos),
    .io_count(Queue_4_io_count)
  );
  Queue Queue_1_1 (
    .clock(Queue_1_1_clock),
    .reset(Queue_1_1_reset),
    .io_enq_ready(Queue_1_1_io_enq_ready),
    .io_enq_valid(Queue_1_1_io_enq_valid),
    .io_enq_bits_id(Queue_1_1_io_enq_bits_id),
    .io_enq_bits_addr(Queue_1_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_1_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_1_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_1_1_io_enq_bits_burst),
    .io_enq_bits_lock(Queue_1_1_io_enq_bits_lock),
    .io_enq_bits_cache(Queue_1_1_io_enq_bits_cache),
    .io_enq_bits_prot(Queue_1_1_io_enq_bits_prot),
    .io_enq_bits_qos(Queue_1_1_io_enq_bits_qos),
    .io_deq_ready(Queue_1_1_io_deq_ready),
    .io_deq_valid(Queue_1_1_io_deq_valid),
    .io_deq_bits_id(Queue_1_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_1_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_1_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_1_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_1_1_io_deq_bits_burst),
    .io_deq_bits_lock(Queue_1_1_io_deq_bits_lock),
    .io_deq_bits_cache(Queue_1_1_io_deq_bits_cache),
    .io_deq_bits_prot(Queue_1_1_io_deq_bits_prot),
    .io_deq_bits_qos(Queue_1_1_io_deq_bits_qos),
    .io_count(Queue_1_1_io_count)
  );
  Queue Queue_2_1 (
    .clock(Queue_2_1_clock),
    .reset(Queue_2_1_reset),
    .io_enq_ready(Queue_2_1_io_enq_ready),
    .io_enq_valid(Queue_2_1_io_enq_valid),
    .io_enq_bits_id(Queue_2_1_io_enq_bits_id),
    .io_enq_bits_addr(Queue_2_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_2_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_2_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_2_1_io_enq_bits_burst),
    .io_enq_bits_lock(Queue_2_1_io_enq_bits_lock),
    .io_enq_bits_cache(Queue_2_1_io_enq_bits_cache),
    .io_enq_bits_prot(Queue_2_1_io_enq_bits_prot),
    .io_enq_bits_qos(Queue_2_1_io_enq_bits_qos),
    .io_deq_ready(Queue_2_1_io_deq_ready),
    .io_deq_valid(Queue_2_1_io_deq_valid),
    .io_deq_bits_id(Queue_2_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_2_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_2_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_2_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_2_1_io_deq_bits_burst),
    .io_deq_bits_lock(Queue_2_1_io_deq_bits_lock),
    .io_deq_bits_cache(Queue_2_1_io_deq_bits_cache),
    .io_deq_bits_prot(Queue_2_1_io_deq_bits_prot),
    .io_deq_bits_qos(Queue_2_1_io_deq_bits_qos),
    .io_count(Queue_2_1_io_count)
  );
  Queue_3 Queue_3_1 (
    .clock(Queue_3_1_clock),
    .reset(Queue_3_1_reset),
    .io_enq_ready(Queue_3_1_io_enq_ready),
    .io_enq_valid(Queue_3_1_io_enq_valid),
    .io_enq_bits_id(Queue_3_1_io_enq_bits_id),
    .io_enq_bits_resp(Queue_3_1_io_enq_bits_resp),
    .io_deq_ready(Queue_3_1_io_deq_ready),
    .io_deq_valid(Queue_3_1_io_deq_valid),
    .io_deq_bits_id(Queue_3_1_io_deq_bits_id),
    .io_deq_bits_resp(Queue_3_1_io_deq_bits_resp),
    .io_count(Queue_3_1_io_count)
  );
  AXI4FragmenterSideband AXI4FragmenterSideband_2 (
    .clock(AXI4FragmenterSideband_2_clock),
    .reset(AXI4FragmenterSideband_2_reset),
    .io_enq_ready(AXI4FragmenterSideband_2_io_enq_ready),
    .io_enq_valid(AXI4FragmenterSideband_2_io_enq_valid),
    .io_enq_bits(AXI4FragmenterSideband_2_io_enq_bits),
    .io_deq_ready(AXI4FragmenterSideband_2_io_deq_ready),
    .io_deq_valid(AXI4FragmenterSideband_2_io_deq_valid),
    .io_deq_bits(AXI4FragmenterSideband_2_io_deq_bits),
    .io_count(AXI4FragmenterSideband_2_io_count)
  );
  AXI4FragmenterSideband AXI4FragmenterSideband_1_1 (
    .clock(AXI4FragmenterSideband_1_1_clock),
    .reset(AXI4FragmenterSideband_1_1_reset),
    .io_enq_ready(AXI4FragmenterSideband_1_1_io_enq_ready),
    .io_enq_valid(AXI4FragmenterSideband_1_1_io_enq_valid),
    .io_enq_bits(AXI4FragmenterSideband_1_1_io_enq_bits),
    .io_deq_ready(AXI4FragmenterSideband_1_1_io_deq_ready),
    .io_deq_valid(AXI4FragmenterSideband_1_1_io_deq_valid),
    .io_deq_bits(AXI4FragmenterSideband_1_1_io_deq_bits),
    .io_count(AXI4FragmenterSideband_1_1_io_count)
  );
  assign io_in_0_aw_ready = Queue_1_1_io_enq_ready;
  assign io_in_0_w_ready = T_1658;
  assign io_in_0_b_valid = T_1680;
  assign io_in_0_b_bits_id = out_b_bits_id;
  assign io_in_0_b_bits_resp = resp;
  assign io_in_0_ar_ready = Queue_4_io_enq_ready;
  assign io_in_0_r_valid = T_1671;
  assign io_in_0_r_bits_id = out_r_bits_id;
  assign io_in_0_r_bits_data = out_r_bits_data;
  assign io_in_0_r_bits_resp = out_r_bits_resp;
  assign io_in_0_r_bits_last = T_1678;
  assign io_out_0_aw_valid = T_1624;
  assign io_out_0_aw_bits_id = in_aw_bits_id;
  assign io_out_0_aw_bits_addr = in_aw_bits_addr;
  assign io_out_0_aw_bits_len = in_aw_bits_len;
  assign io_out_0_aw_bits_size = in_aw_bits_size;
  assign io_out_0_aw_bits_burst = in_aw_bits_burst;
  assign io_out_0_aw_bits_lock = in_aw_bits_lock;
  assign io_out_0_aw_bits_cache = in_aw_bits_cache;
  assign io_out_0_aw_bits_prot = in_aw_bits_prot;
  assign io_out_0_aw_bits_qos = in_aw_bits_qos;
  assign io_out_0_w_valid = T_1654;
  assign io_out_0_w_bits_data = io_in_0_w_bits_data;
  assign io_out_0_w_bits_strb = io_in_0_w_bits_strb;
  assign io_out_0_w_bits_last = w_last;
  assign io_out_0_b_ready = Queue_3_1_io_enq_ready;
  assign io_out_0_ar_valid = Queue_2_1_io_deq_valid;
  assign io_out_0_ar_bits_id = Queue_2_1_io_deq_bits_id;
  assign io_out_0_ar_bits_addr = Queue_2_1_io_deq_bits_addr;
  assign io_out_0_ar_bits_len = Queue_2_1_io_deq_bits_len;
  assign io_out_0_ar_bits_size = Queue_2_1_io_deq_bits_size;
  assign io_out_0_ar_bits_burst = Queue_2_1_io_deq_bits_burst;
  assign io_out_0_ar_bits_lock = Queue_2_1_io_deq_bits_lock;
  assign io_out_0_ar_bits_cache = Queue_2_1_io_deq_bits_cache;
  assign io_out_0_ar_bits_prot = Queue_2_1_io_deq_bits_prot;
  assign io_out_0_ar_bits_qos = Queue_2_1_io_deq_bits_qos;
  assign io_out_0_r_ready = out_r_ready;
  assign Queue_4_clock = clock;
  assign Queue_4_reset = reset;
  assign Queue_4_io_enq_valid = io_in_0_ar_valid;
  assign Queue_4_io_enq_bits_id = io_in_0_ar_bits_id;
  assign Queue_4_io_enq_bits_addr = io_in_0_ar_bits_addr;
  assign Queue_4_io_enq_bits_len = io_in_0_ar_bits_len;
  assign Queue_4_io_enq_bits_size = io_in_0_ar_bits_size;
  assign Queue_4_io_enq_bits_burst = io_in_0_ar_bits_burst;
  assign Queue_4_io_enq_bits_lock = io_in_0_ar_bits_lock;
  assign Queue_4_io_enq_bits_cache = io_in_0_ar_bits_cache;
  assign Queue_4_io_enq_bits_prot = io_in_0_ar_bits_prot;
  assign Queue_4_io_enq_bits_qos = io_in_0_ar_bits_qos;
  assign Queue_4_io_deq_ready = T_1216_ready;
  assign T_1216_ready = T_1353;
  assign T_1216_valid = Queue_4_io_deq_valid;
  assign T_1216_bits_id = Queue_4_io_deq_bits_id;
  assign T_1216_bits_addr = Queue_4_io_deq_bits_addr;
  assign T_1216_bits_len = Queue_4_io_deq_bits_len;
  assign T_1216_bits_size = Queue_4_io_deq_bits_size;
  assign T_1216_bits_burst = Queue_4_io_deq_bits_burst;
  assign T_1216_bits_lock = Queue_4_io_deq_bits_lock;
  assign T_1216_bits_cache = Queue_4_io_deq_bits_cache;
  assign T_1216_bits_prot = Queue_4_io_deq_bits_prot;
  assign T_1216_bits_qos = Queue_4_io_deq_bits_qos;
  assign in_ar_ready = T_1613;
  assign in_ar_valid = T_1216_valid;
  assign in_ar_bits_id = T_1216_bits_id;
  assign in_ar_bits_addr = T_1361;
  assign in_ar_bits_len = 8'h0;
  assign in_ar_bits_size = T_1216_bits_size;
  assign in_ar_bits_burst = T_1216_bits_burst;
  assign in_ar_bits_lock = T_1216_bits_lock;
  assign in_ar_bits_cache = T_1216_bits_cache;
  assign in_ar_bits_prot = T_1216_bits_prot;
  assign in_ar_bits_qos = T_1216_bits_qos;
  assign T_1271 = T_1266 ? T_1270 : T_1216_bits_len;
  assign T_1272 = T_1266 ? T_1268 : T_1216_bits_addr;
  assign T_1288_0 = 1'h1;
  assign T_1325 = T_1216_bits_burst == 2'h0;
  assign T_1331 = 9'h0 << 1;
  assign T_1333 = T_1331 | 9'h1;
  assign GEN_23 = {{7'd0}, T_1333};
  assign T_1338 = GEN_23 << T_1216_bits_size;
  assign GEN_24 = {{12'd0}, T_1338};
  assign T_1339 = T_1272 + GEN_24;
  assign T_1340 = T_1339[27:0];
  assign T_1342 = {T_1216_bits_len,8'hff};
  assign GEN_25 = {{7'd0}, T_1342};
  assign T_1343 = GEN_25 << T_1216_bits_size;
  assign T_1344 = T_1343[22:8];
  assign T_1345 = GEN_1;
  assign T_1346 = T_1216_bits_burst == 2'h2;
  assign GEN_26 = {{13'd0}, T_1344};
  assign T_1347 = T_1340 & GEN_26;
  assign T_1348 = ~ T_1216_bits_addr;
  assign T_1349 = T_1348 | GEN_26;
  assign T_1350 = ~ T_1349;
  assign T_1351 = T_1347 | T_1350;
  assign GEN_0 = T_1346 ? T_1351 : T_1340;
  assign GEN_1 = T_1325 ? T_1216_bits_addr : GEN_0;
  assign ar_last = 8'h0 == T_1271;
  assign T_1353 = in_ar_ready & ar_last;
  assign T_1354 = ~ T_1272;
  assign T_1357 = 10'h7 << T_1216_bits_size;
  assign T_1358 = T_1357[2:0];
  assign T_1359 = ~ T_1358;
  assign GEN_28 = {{25'd0}, T_1359};
  assign T_1360 = T_1354 | GEN_28;
  assign T_1361 = ~ T_1360;
  assign T_1362 = in_ar_ready & in_ar_valid;
  assign T_1364 = ar_last == 1'h0;
  assign GEN_29 = {{1'd0}, T_1271};
  assign T_1365 = GEN_29 - T_1333;
  assign T_1366 = T_1365[8:0];
  assign GEN_2 = T_1362 ? T_1364 : T_1266;
  assign GEN_3 = T_1362 ? T_1345 : T_1268;
  assign GEN_4 = T_1362 ? T_1366 : {{1'd0}, T_1270};
  assign Queue_1_1_clock = clock;
  assign Queue_1_1_reset = reset;
  assign Queue_1_1_io_enq_valid = io_in_0_aw_valid;
  assign Queue_1_1_io_enq_bits_id = io_in_0_aw_bits_id;
  assign Queue_1_1_io_enq_bits_addr = io_in_0_aw_bits_addr;
  assign Queue_1_1_io_enq_bits_len = io_in_0_aw_bits_len;
  assign Queue_1_1_io_enq_bits_size = io_in_0_aw_bits_size;
  assign Queue_1_1_io_enq_bits_burst = io_in_0_aw_bits_burst;
  assign Queue_1_1_io_enq_bits_lock = io_in_0_aw_bits_lock;
  assign Queue_1_1_io_enq_bits_cache = io_in_0_aw_bits_cache;
  assign Queue_1_1_io_enq_bits_prot = io_in_0_aw_bits_prot;
  assign Queue_1_1_io_enq_bits_qos = io_in_0_aw_bits_qos;
  assign Queue_1_1_io_deq_ready = T_1402_ready;
  assign T_1402_ready = T_1538;
  assign T_1402_valid = Queue_1_1_io_deq_valid;
  assign T_1402_bits_id = Queue_1_1_io_deq_bits_id;
  assign T_1402_bits_addr = Queue_1_1_io_deq_bits_addr;
  assign T_1402_bits_len = Queue_1_1_io_deq_bits_len;
  assign T_1402_bits_size = Queue_1_1_io_deq_bits_size;
  assign T_1402_bits_burst = Queue_1_1_io_deq_bits_burst;
  assign T_1402_bits_lock = Queue_1_1_io_deq_bits_lock;
  assign T_1402_bits_cache = Queue_1_1_io_deq_bits_cache;
  assign T_1402_bits_prot = Queue_1_1_io_deq_bits_prot;
  assign T_1402_bits_qos = Queue_1_1_io_deq_bits_qos;
  assign in_aw_ready = T_1627;
  assign in_aw_valid = T_1402_valid;
  assign in_aw_bits_id = T_1402_bits_id;
  assign in_aw_bits_addr = T_1546;
  assign in_aw_bits_len = 8'h0;
  assign in_aw_bits_size = T_1402_bits_size;
  assign in_aw_bits_burst = T_1402_bits_burst;
  assign in_aw_bits_lock = T_1402_bits_lock;
  assign in_aw_bits_cache = T_1402_bits_cache;
  assign in_aw_bits_prot = T_1402_bits_prot;
  assign in_aw_bits_qos = T_1402_bits_qos;
  assign T_1457 = T_1452 ? T_1456 : T_1402_bits_len;
  assign T_1458 = T_1452 ? T_1454 : T_1402_bits_addr;
  assign T_1474_0 = 1'h1;
  assign T_1511 = T_1402_bits_burst == 2'h0;
  assign T_1523 = GEN_23 << T_1402_bits_size;
  assign GEN_41 = {{12'd0}, T_1523};
  assign T_1524 = T_1458 + GEN_41;
  assign T_1525 = T_1524[27:0];
  assign T_1527 = {T_1402_bits_len,8'hff};
  assign GEN_42 = {{7'd0}, T_1527};
  assign T_1528 = GEN_42 << T_1402_bits_size;
  assign T_1529 = T_1528[22:8];
  assign T_1530 = GEN_6;
  assign T_1531 = T_1402_bits_burst == 2'h2;
  assign GEN_43 = {{13'd0}, T_1529};
  assign T_1532 = T_1525 & GEN_43;
  assign T_1533 = ~ T_1402_bits_addr;
  assign T_1534 = T_1533 | GEN_43;
  assign T_1535 = ~ T_1534;
  assign T_1536 = T_1532 | T_1535;
  assign GEN_5 = T_1531 ? T_1536 : T_1525;
  assign GEN_6 = T_1511 ? T_1402_bits_addr : GEN_5;
  assign aw_last = 8'h0 == T_1457;
  assign T_1538 = in_aw_ready & aw_last;
  assign T_1539 = ~ T_1458;
  assign T_1542 = 10'h7 << T_1402_bits_size;
  assign T_1543 = T_1542[2:0];
  assign T_1544 = ~ T_1543;
  assign GEN_45 = {{25'd0}, T_1544};
  assign T_1545 = T_1539 | GEN_45;
  assign T_1546 = ~ T_1545;
  assign T_1547 = in_aw_ready & in_aw_valid;
  assign T_1549 = aw_last == 1'h0;
  assign GEN_46 = {{1'd0}, T_1457};
  assign T_1550 = GEN_46 - T_1333;
  assign T_1551 = T_1550[8:0];
  assign GEN_7 = T_1547 ? T_1549 : T_1452;
  assign GEN_8 = T_1547 ? T_1530 : T_1454;
  assign GEN_9 = T_1547 ? T_1551 : {{1'd0}, T_1456};
  assign out_ar_ready = Queue_2_1_io_enq_ready;
  assign out_ar_valid = T_1612;
  assign out_ar_bits_id = in_ar_bits_id;
  assign out_ar_bits_addr = in_ar_bits_addr;
  assign out_ar_bits_len = in_ar_bits_len;
  assign out_ar_bits_size = in_ar_bits_size;
  assign out_ar_bits_burst = in_ar_bits_burst;
  assign out_ar_bits_lock = in_ar_bits_lock;
  assign out_ar_bits_cache = in_ar_bits_cache;
  assign out_ar_bits_prot = in_ar_bits_prot;
  assign out_ar_bits_qos = in_ar_bits_qos;
  assign out_r_ready = T_1675;
  assign out_r_valid = io_out_0_r_valid;
  assign out_r_bits_id = io_out_0_r_bits_id;
  assign out_r_bits_data = io_out_0_r_bits_data;
  assign out_r_bits_resp = io_out_0_r_bits_resp;
  assign out_r_bits_last = io_out_0_r_bits_last;
  assign out_b_ready = T_1684;
  assign out_b_valid = Queue_3_1_io_deq_valid;
  assign out_b_bits_id = Queue_3_1_io_deq_bits_id;
  assign out_b_bits_resp = Queue_3_1_io_deq_bits_resp;
  assign Queue_2_1_clock = clock;
  assign Queue_2_1_reset = reset;
  assign Queue_2_1_io_enq_valid = out_ar_valid;
  assign Queue_2_1_io_enq_bits_id = out_ar_bits_id;
  assign Queue_2_1_io_enq_bits_addr = out_ar_bits_addr;
  assign Queue_2_1_io_enq_bits_len = out_ar_bits_len;
  assign Queue_2_1_io_enq_bits_size = out_ar_bits_size;
  assign Queue_2_1_io_enq_bits_burst = out_ar_bits_burst;
  assign Queue_2_1_io_enq_bits_lock = out_ar_bits_lock;
  assign Queue_2_1_io_enq_bits_cache = out_ar_bits_cache;
  assign Queue_2_1_io_enq_bits_prot = out_ar_bits_prot;
  assign Queue_2_1_io_enq_bits_qos = out_ar_bits_qos;
  assign Queue_2_1_io_deq_ready = io_out_0_ar_ready;
  assign Queue_3_1_clock = clock;
  assign Queue_3_1_reset = reset;
  assign Queue_3_1_io_enq_valid = io_out_0_b_valid;
  assign Queue_3_1_io_enq_bits_id = io_out_0_b_bits_id;
  assign Queue_3_1_io_enq_bits_resp = io_out_0_b_bits_resp;
  assign Queue_3_1_io_deq_ready = out_b_ready;
  assign AXI4FragmenterSideband_2_clock = clock;
  assign AXI4FragmenterSideband_2_reset = reset;
  assign AXI4FragmenterSideband_2_io_enq_valid = T_1614;
  assign AXI4FragmenterSideband_2_io_enq_bits = ar_last;
  assign AXI4FragmenterSideband_2_io_deq_ready = T_1677;
  assign AXI4FragmenterSideband_1_1_clock = clock;
  assign AXI4FragmenterSideband_1_1_reset = reset;
  assign AXI4FragmenterSideband_1_1_io_enq_valid = T_1630;
  assign AXI4FragmenterSideband_1_1_io_enq_bits = aw_last;
  assign AXI4FragmenterSideband_1_1_io_deq_ready = T_1688;
  assign T_1612 = in_ar_valid & AXI4FragmenterSideband_2_io_enq_ready;
  assign T_1613 = AXI4FragmenterSideband_2_io_enq_ready & out_ar_ready;
  assign T_1614 = in_ar_valid & out_ar_ready;
  assign wbeats_ready = w_idle;
  assign wbeats_valid = T_1633;
  assign T_1618 = wbeats_valid & wbeats_ready;
  assign GEN_10 = T_1618 ? 1'h1 : wbeats_latched;
  assign T_1620 = io_out_0_aw_ready & io_out_0_aw_valid;
  assign GEN_11 = T_1620 ? 1'h0 : GEN_10;
  assign T_1622 = in_aw_valid & AXI4FragmenterSideband_1_1_io_enq_ready;
  assign T_1623 = wbeats_ready | wbeats_latched;
  assign T_1624 = T_1622 & T_1623;
  assign T_1625 = AXI4FragmenterSideband_1_1_io_enq_ready & io_out_0_aw_ready;
  assign T_1627 = T_1625 & T_1623;
  assign T_1628 = in_aw_valid & io_out_0_aw_ready;
  assign T_1630 = T_1628 & T_1623;
  assign T_1632 = wbeats_latched == 1'h0;
  assign T_1633 = in_aw_valid & T_1632;
  assign w_idle = w_counter == 9'h0;
  assign T_1637 = wbeats_valid ? T_1333 : 9'h0;
  assign w_todo = w_idle ? T_1637 : w_counter;
  assign w_last = w_todo == 9'h1;
  assign T_1639 = io_out_0_w_ready & io_out_0_w_valid;
  assign GEN_47 = {{8'd0}, T_1639};
  assign T_1640 = w_todo - GEN_47;
  assign T_1641 = T_1640[8:0];
  assign T_1644 = T_1639 == 1'h0;
  assign T_1646 = w_todo != 9'h0;
  assign T_1647 = T_1644 | T_1646;
  assign T_1648 = T_1647 | reset;
  assign T_1650 = T_1648 == 1'h0;
  assign T_1652 = wbeats_ready == 1'h0;
  assign T_1653 = T_1652 | wbeats_valid;
  assign T_1654 = io_in_0_w_valid & T_1653;
  assign T_1658 = io_out_0_w_ready & T_1653;
  assign T_1660 = io_out_0_w_valid == 1'h0;
  assign T_1662 = io_in_0_w_bits_last == 1'h0;
  assign T_1663 = T_1660 | T_1662;
  assign T_1664 = T_1663 | w_last;
  assign T_1665 = T_1664 | reset;
  assign T_1667 = T_1665 == 1'h0;
  assign T_1669 = out_r_bits_last == 1'h0;
  assign T_1670 = T_1669 | AXI4FragmenterSideband_2_io_deq_valid;
  assign T_1671 = out_r_valid & T_1670;
  assign T_1675 = io_in_0_r_ready & T_1670;
  assign T_1676 = out_r_bits_last & out_r_valid;
  assign T_1677 = T_1676 & io_in_0_r_ready;
  assign T_1678 = out_r_bits_last & AXI4FragmenterSideband_2_io_deq_bits;
  assign T_1679 = out_b_valid & AXI4FragmenterSideband_1_1_io_deq_valid;
  assign T_1680 = T_1679 & AXI4FragmenterSideband_1_1_io_deq_bits;
  assign T_1682 = AXI4FragmenterSideband_1_1_io_deq_bits == 1'h0;
  assign T_1683 = T_1682 | io_in_0_b_ready;
  assign T_1684 = AXI4FragmenterSideband_1_1_io_deq_valid & T_1683;
  assign T_1688 = out_b_valid & T_1683;
  assign resp = out_b_bits_resp | r_resp;
  assign T_1690 = out_b_ready & out_b_valid;
  assign T_1692 = AXI4FragmenterSideband_1_1_io_deq_bits ? 2'h0 : resp;
  assign GEN_12 = T_1690 ? T_1692 : r_resp;
  always @(posedge clock) begin
    if (reset) begin
      T_1266 <= 1'h0;
    end else begin
      if (T_1362) begin
        T_1266 <= T_1364;
      end
    end
    if (T_1362) begin
      T_1268 <= T_1345;
    end
    T_1270 <= GEN_4[7:0];
    if (reset) begin
      T_1452 <= 1'h0;
    end else begin
      if (T_1547) begin
        T_1452 <= T_1549;
      end
    end
    if (T_1547) begin
      T_1454 <= T_1530;
    end
    T_1456 <= GEN_9[7:0];
    if (reset) begin
      wbeats_latched <= 1'h0;
    end else begin
      if (T_1620) begin
        wbeats_latched <= 1'h0;
      end else begin
        if (T_1618) begin
          wbeats_latched <= 1'h1;
        end
      end
    end
    if (reset) begin
      w_counter <= 9'h0;
    end else begin
      w_counter <= T_1641;
    end
    if (reset) begin
      r_resp <= 2'h0;
    end else begin
      if (T_1690) begin
        if (AXI4FragmenterSideband_1_1_io_deq_bits) begin
          r_resp <= 2'h0;
        end else begin
          r_resp <= resp;
        end
      end
    end
  end
endmodule
module Queue_4(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [27:0] io_enq_bits_addr,
  input  [7:0] io_enq_bits_len,
  input  [2:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_burst,
  input   io_enq_bits_lock,
  input  [3:0] io_enq_bits_cache,
  input  [2:0] io_enq_bits_prot,
  input  [3:0] io_enq_bits_qos,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [27:0] io_deq_bits_addr,
  output [7:0] io_deq_bits_len,
  output [2:0] io_deq_bits_size,
  output [1:0] io_deq_bits_burst,
  output  io_deq_bits_lock,
  output [3:0] io_deq_bits_cache,
  output [2:0] io_deq_bits_prot,
  output [3:0] io_deq_bits_qos,
  output [1:0] io_count
);
  reg [3:0] ram_id [0:1];
  reg [31:0] GEN_0;
  wire [3:0] ram_id_T_123_data;
  wire  ram_id_T_123_addr;
  wire [3:0] ram_id_T_98_data;
  wire  ram_id_T_98_addr;
  wire  ram_id_T_98_mask;
  wire  ram_id_T_98_en;
  reg [27:0] ram_addr [0:1];
  reg [31:0] GEN_1;
  wire [27:0] ram_addr_T_123_data;
  wire  ram_addr_T_123_addr;
  wire [27:0] ram_addr_T_98_data;
  wire  ram_addr_T_98_addr;
  wire  ram_addr_T_98_mask;
  wire  ram_addr_T_98_en;
  reg [7:0] ram_len [0:1];
  reg [31:0] GEN_2;
  wire [7:0] ram_len_T_123_data;
  wire  ram_len_T_123_addr;
  wire [7:0] ram_len_T_98_data;
  wire  ram_len_T_98_addr;
  wire  ram_len_T_98_mask;
  wire  ram_len_T_98_en;
  reg [2:0] ram_size [0:1];
  reg [31:0] GEN_3;
  wire [2:0] ram_size_T_123_data;
  wire  ram_size_T_123_addr;
  wire [2:0] ram_size_T_98_data;
  wire  ram_size_T_98_addr;
  wire  ram_size_T_98_mask;
  wire  ram_size_T_98_en;
  reg [1:0] ram_burst [0:1];
  reg [31:0] GEN_4;
  wire [1:0] ram_burst_T_123_data;
  wire  ram_burst_T_123_addr;
  wire [1:0] ram_burst_T_98_data;
  wire  ram_burst_T_98_addr;
  wire  ram_burst_T_98_mask;
  wire  ram_burst_T_98_en;
  reg  ram_lock [0:1];
  reg [31:0] GEN_5;
  wire  ram_lock_T_123_data;
  wire  ram_lock_T_123_addr;
  wire  ram_lock_T_98_data;
  wire  ram_lock_T_98_addr;
  wire  ram_lock_T_98_mask;
  wire  ram_lock_T_98_en;
  reg [3:0] ram_cache [0:1];
  reg [31:0] GEN_6;
  wire [3:0] ram_cache_T_123_data;
  wire  ram_cache_T_123_addr;
  wire [3:0] ram_cache_T_98_data;
  wire  ram_cache_T_98_addr;
  wire  ram_cache_T_98_mask;
  wire  ram_cache_T_98_en;
  reg [2:0] ram_prot [0:1];
  reg [31:0] GEN_7;
  wire [2:0] ram_prot_T_123_data;
  wire  ram_prot_T_123_addr;
  wire [2:0] ram_prot_T_98_data;
  wire  ram_prot_T_98_addr;
  wire  ram_prot_T_98_mask;
  wire  ram_prot_T_98_en;
  reg [3:0] ram_qos [0:1];
  reg [31:0] GEN_8;
  wire [3:0] ram_qos_T_123_data;
  wire  ram_qos_T_123_addr;
  wire [3:0] ram_qos_T_98_data;
  wire  ram_qos_T_98_addr;
  wire  ram_qos_T_98_mask;
  wire  ram_qos_T_98_en;
  reg  T_90;
  reg [31:0] GEN_9;
  reg  T_92;
  reg [31:0] GEN_10;
  reg  maybe_full;
  reg [31:0] GEN_11;
  wire  ptr_match;
  wire  T_95;
  wire  empty;
  wire  full;
  wire  T_96;
  wire  do_enq;
  wire  T_97;
  wire  do_deq;
  wire [1:0] T_111;
  wire  T_112;
  wire  GEN_12;
  wire [1:0] T_116;
  wire  T_117;
  wire  GEN_13;
  wire  T_118;
  wire  GEN_14;
  wire  T_120;
  wire  T_122;
  wire [1:0] T_133;
  wire  ptr_diff;
  wire  T_134;
  wire [1:0] T_135;
  assign io_enq_ready = T_122;
  assign io_deq_valid = T_120;
  assign io_deq_bits_id = ram_id_T_123_data;
  assign io_deq_bits_addr = ram_addr_T_123_data;
  assign io_deq_bits_len = ram_len_T_123_data;
  assign io_deq_bits_size = ram_size_T_123_data;
  assign io_deq_bits_burst = ram_burst_T_123_data;
  assign io_deq_bits_lock = ram_lock_T_123_data;
  assign io_deq_bits_cache = ram_cache_T_123_data;
  assign io_deq_bits_prot = ram_prot_T_123_data;
  assign io_deq_bits_qos = ram_qos_T_123_data;
  assign io_count = T_135;
  assign ram_id_T_123_addr = T_92;
  assign ram_id_T_123_data = ram_id[ram_id_T_123_addr];
  assign ram_id_T_98_data = io_enq_bits_id;
  assign ram_id_T_98_addr = T_90;
  assign ram_id_T_98_mask = do_enq;
  assign ram_id_T_98_en = do_enq;
  assign ram_addr_T_123_addr = T_92;
  assign ram_addr_T_123_data = ram_addr[ram_addr_T_123_addr];
  assign ram_addr_T_98_data = io_enq_bits_addr;
  assign ram_addr_T_98_addr = T_90;
  assign ram_addr_T_98_mask = do_enq;
  assign ram_addr_T_98_en = do_enq;
  assign ram_len_T_123_addr = T_92;
  assign ram_len_T_123_data = ram_len[ram_len_T_123_addr];
  assign ram_len_T_98_data = io_enq_bits_len;
  assign ram_len_T_98_addr = T_90;
  assign ram_len_T_98_mask = do_enq;
  assign ram_len_T_98_en = do_enq;
  assign ram_size_T_123_addr = T_92;
  assign ram_size_T_123_data = ram_size[ram_size_T_123_addr];
  assign ram_size_T_98_data = io_enq_bits_size;
  assign ram_size_T_98_addr = T_90;
  assign ram_size_T_98_mask = do_enq;
  assign ram_size_T_98_en = do_enq;
  assign ram_burst_T_123_addr = T_92;
  assign ram_burst_T_123_data = ram_burst[ram_burst_T_123_addr];
  assign ram_burst_T_98_data = io_enq_bits_burst;
  assign ram_burst_T_98_addr = T_90;
  assign ram_burst_T_98_mask = do_enq;
  assign ram_burst_T_98_en = do_enq;
  assign ram_lock_T_123_addr = T_92;
  assign ram_lock_T_123_data = ram_lock[ram_lock_T_123_addr];
  assign ram_lock_T_98_data = io_enq_bits_lock;
  assign ram_lock_T_98_addr = T_90;
  assign ram_lock_T_98_mask = do_enq;
  assign ram_lock_T_98_en = do_enq;
  assign ram_cache_T_123_addr = T_92;
  assign ram_cache_T_123_data = ram_cache[ram_cache_T_123_addr];
  assign ram_cache_T_98_data = io_enq_bits_cache;
  assign ram_cache_T_98_addr = T_90;
  assign ram_cache_T_98_mask = do_enq;
  assign ram_cache_T_98_en = do_enq;
  assign ram_prot_T_123_addr = T_92;
  assign ram_prot_T_123_data = ram_prot[ram_prot_T_123_addr];
  assign ram_prot_T_98_data = io_enq_bits_prot;
  assign ram_prot_T_98_addr = T_90;
  assign ram_prot_T_98_mask = do_enq;
  assign ram_prot_T_98_en = do_enq;
  assign ram_qos_T_123_addr = T_92;
  assign ram_qos_T_123_data = ram_qos[ram_qos_T_123_addr];
  assign ram_qos_T_98_data = io_enq_bits_qos;
  assign ram_qos_T_98_addr = T_90;
  assign ram_qos_T_98_mask = do_enq;
  assign ram_qos_T_98_en = do_enq;
  assign ptr_match = T_90 == T_92;
  assign T_95 = maybe_full == 1'h0;
  assign empty = ptr_match & T_95;
  assign full = ptr_match & maybe_full;
  assign T_96 = io_enq_ready & io_enq_valid;
  assign do_enq = T_96;
  assign T_97 = io_deq_ready & io_deq_valid;
  assign do_deq = T_97;
  assign T_111 = T_90 + 1'h1;
  assign T_112 = T_111[0:0];
  assign GEN_12 = do_enq ? T_112 : T_90;
  assign T_116 = T_92 + 1'h1;
  assign T_117 = T_116[0:0];
  assign GEN_13 = do_deq ? T_117 : T_92;
  assign T_118 = do_enq != do_deq;
  assign GEN_14 = T_118 ? do_enq : maybe_full;
  assign T_120 = empty == 1'h0;
  assign T_122 = full == 1'h0;
  assign T_133 = T_90 - T_92;
  assign ptr_diff = T_133[0:0];
  assign T_134 = maybe_full & ptr_match;
  assign T_135 = {T_134,ptr_diff};
  always @(posedge clock) begin
    if(ram_id_T_98_en & ram_id_T_98_mask) begin
      ram_id[ram_id_T_98_addr] <= ram_id_T_98_data;
    end
    if(ram_addr_T_98_en & ram_addr_T_98_mask) begin
      ram_addr[ram_addr_T_98_addr] <= ram_addr_T_98_data;
    end
    if(ram_len_T_98_en & ram_len_T_98_mask) begin
      ram_len[ram_len_T_98_addr] <= ram_len_T_98_data;
    end
    if(ram_size_T_98_en & ram_size_T_98_mask) begin
      ram_size[ram_size_T_98_addr] <= ram_size_T_98_data;
    end
    if(ram_burst_T_98_en & ram_burst_T_98_mask) begin
      ram_burst[ram_burst_T_98_addr] <= ram_burst_T_98_data;
    end
    if(ram_lock_T_98_en & ram_lock_T_98_mask) begin
      ram_lock[ram_lock_T_98_addr] <= ram_lock_T_98_data;
    end
    if(ram_cache_T_98_en & ram_cache_T_98_mask) begin
      ram_cache[ram_cache_T_98_addr] <= ram_cache_T_98_data;
    end
    if(ram_prot_T_98_en & ram_prot_T_98_mask) begin
      ram_prot[ram_prot_T_98_addr] <= ram_prot_T_98_data;
    end
    if(ram_qos_T_98_en & ram_qos_T_98_mask) begin
      ram_qos[ram_qos_T_98_addr] <= ram_qos_T_98_data;
    end
    if (reset) begin
      T_90 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_90 <= T_112;
      end
    end
    if (reset) begin
      T_92 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_92 <= T_117;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_118) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Queue_5(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input  [7:0] io_enq_bits_strb,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [7:0] io_deq_bits_strb,
  output  io_deq_bits_last,
  output [1:0] io_count
);
  reg [63:0] ram_data [0:1];
  reg [63:0] GEN_0;
  wire [63:0] ram_data_T_75_data;
  wire  ram_data_T_75_addr;
  wire [63:0] ram_data_T_56_data;
  wire  ram_data_T_56_addr;
  wire  ram_data_T_56_mask;
  wire  ram_data_T_56_en;
  reg [7:0] ram_strb [0:1];
  reg [31:0] GEN_1;
  wire [7:0] ram_strb_T_75_data;
  wire  ram_strb_T_75_addr;
  wire [7:0] ram_strb_T_56_data;
  wire  ram_strb_T_56_addr;
  wire  ram_strb_T_56_mask;
  wire  ram_strb_T_56_en;
  reg  ram_last [0:1];
  reg [31:0] GEN_2;
  wire  ram_last_T_75_data;
  wire  ram_last_T_75_addr;
  wire  ram_last_T_56_data;
  wire  ram_last_T_56_addr;
  wire  ram_last_T_56_mask;
  wire  ram_last_T_56_en;
  reg  T_48;
  reg [31:0] GEN_3;
  reg  T_50;
  reg [31:0] GEN_4;
  reg  maybe_full;
  reg [31:0] GEN_5;
  wire  ptr_match;
  wire  T_53;
  wire  empty;
  wire  full;
  wire  T_54;
  wire  do_enq;
  wire  T_55;
  wire  do_deq;
  wire [1:0] T_63;
  wire  T_64;
  wire  GEN_6;
  wire [1:0] T_68;
  wire  T_69;
  wire  GEN_7;
  wire  T_70;
  wire  GEN_8;
  wire  T_72;
  wire  T_74;
  wire [1:0] T_79;
  wire  ptr_diff;
  wire  T_80;
  wire [1:0] T_81;
  assign io_enq_ready = T_74;
  assign io_deq_valid = T_72;
  assign io_deq_bits_data = ram_data_T_75_data;
  assign io_deq_bits_strb = ram_strb_T_75_data;
  assign io_deq_bits_last = ram_last_T_75_data;
  assign io_count = T_81;
  assign ram_data_T_75_addr = T_50;
  assign ram_data_T_75_data = ram_data[ram_data_T_75_addr];
  assign ram_data_T_56_data = io_enq_bits_data;
  assign ram_data_T_56_addr = T_48;
  assign ram_data_T_56_mask = do_enq;
  assign ram_data_T_56_en = do_enq;
  assign ram_strb_T_75_addr = T_50;
  assign ram_strb_T_75_data = ram_strb[ram_strb_T_75_addr];
  assign ram_strb_T_56_data = io_enq_bits_strb;
  assign ram_strb_T_56_addr = T_48;
  assign ram_strb_T_56_mask = do_enq;
  assign ram_strb_T_56_en = do_enq;
  assign ram_last_T_75_addr = T_50;
  assign ram_last_T_75_data = ram_last[ram_last_T_75_addr];
  assign ram_last_T_56_data = io_enq_bits_last;
  assign ram_last_T_56_addr = T_48;
  assign ram_last_T_56_mask = do_enq;
  assign ram_last_T_56_en = do_enq;
  assign ptr_match = T_48 == T_50;
  assign T_53 = maybe_full == 1'h0;
  assign empty = ptr_match & T_53;
  assign full = ptr_match & maybe_full;
  assign T_54 = io_enq_ready & io_enq_valid;
  assign do_enq = T_54;
  assign T_55 = io_deq_ready & io_deq_valid;
  assign do_deq = T_55;
  assign T_63 = T_48 + 1'h1;
  assign T_64 = T_63[0:0];
  assign GEN_6 = do_enq ? T_64 : T_48;
  assign T_68 = T_50 + 1'h1;
  assign T_69 = T_68[0:0];
  assign GEN_7 = do_deq ? T_69 : T_50;
  assign T_70 = do_enq != do_deq;
  assign GEN_8 = T_70 ? do_enq : maybe_full;
  assign T_72 = empty == 1'h0;
  assign T_74 = full == 1'h0;
  assign T_79 = T_48 - T_50;
  assign ptr_diff = T_79[0:0];
  assign T_80 = maybe_full & ptr_match;
  assign T_81 = {T_80,ptr_diff};
  always @(posedge clock) begin
    if(ram_data_T_56_en & ram_data_T_56_mask) begin
      ram_data[ram_data_T_56_addr] <= ram_data_T_56_data;
    end
    if(ram_strb_T_56_en & ram_strb_T_56_mask) begin
      ram_strb[ram_strb_T_56_addr] <= ram_strb_T_56_data;
    end
    if(ram_last_T_56_en & ram_last_T_56_mask) begin
      ram_last[ram_last_T_56_addr] <= ram_last_T_56_data;
    end
    if (reset) begin
      T_48 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_48 <= T_64;
      end
    end
    if (reset) begin
      T_50 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_50 <= T_69;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_70) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Queue_6(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [1:0] io_enq_bits_resp,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [1:0] io_deq_bits_resp,
  output [1:0] io_count
);
  reg [3:0] ram_id [0:1];
  reg [31:0] GEN_0;
  wire [3:0] ram_id_T_67_data;
  wire  ram_id_T_67_addr;
  wire [3:0] ram_id_T_49_data;
  wire  ram_id_T_49_addr;
  wire  ram_id_T_49_mask;
  wire  ram_id_T_49_en;
  reg [1:0] ram_resp [0:1];
  reg [31:0] GEN_1;
  wire [1:0] ram_resp_T_67_data;
  wire  ram_resp_T_67_addr;
  wire [1:0] ram_resp_T_49_data;
  wire  ram_resp_T_49_addr;
  wire  ram_resp_T_49_mask;
  wire  ram_resp_T_49_en;
  reg  T_41;
  reg [31:0] GEN_2;
  reg  T_43;
  reg [31:0] GEN_3;
  reg  maybe_full;
  reg [31:0] GEN_4;
  wire  ptr_match;
  wire  T_46;
  wire  empty;
  wire  full;
  wire  T_47;
  wire  do_enq;
  wire  T_48;
  wire  do_deq;
  wire [1:0] T_55;
  wire  T_56;
  wire  GEN_5;
  wire [1:0] T_60;
  wire  T_61;
  wire  GEN_6;
  wire  T_62;
  wire  GEN_7;
  wire  T_64;
  wire  T_66;
  wire [1:0] T_70;
  wire  ptr_diff;
  wire  T_71;
  wire [1:0] T_72;
  assign io_enq_ready = T_66;
  assign io_deq_valid = T_64;
  assign io_deq_bits_id = ram_id_T_67_data;
  assign io_deq_bits_resp = ram_resp_T_67_data;
  assign io_count = T_72;
  assign ram_id_T_67_addr = T_43;
  assign ram_id_T_67_data = ram_id[ram_id_T_67_addr];
  assign ram_id_T_49_data = io_enq_bits_id;
  assign ram_id_T_49_addr = T_41;
  assign ram_id_T_49_mask = do_enq;
  assign ram_id_T_49_en = do_enq;
  assign ram_resp_T_67_addr = T_43;
  assign ram_resp_T_67_data = ram_resp[ram_resp_T_67_addr];
  assign ram_resp_T_49_data = io_enq_bits_resp;
  assign ram_resp_T_49_addr = T_41;
  assign ram_resp_T_49_mask = do_enq;
  assign ram_resp_T_49_en = do_enq;
  assign ptr_match = T_41 == T_43;
  assign T_46 = maybe_full == 1'h0;
  assign empty = ptr_match & T_46;
  assign full = ptr_match & maybe_full;
  assign T_47 = io_enq_ready & io_enq_valid;
  assign do_enq = T_47;
  assign T_48 = io_deq_ready & io_deq_valid;
  assign do_deq = T_48;
  assign T_55 = T_41 + 1'h1;
  assign T_56 = T_55[0:0];
  assign GEN_5 = do_enq ? T_56 : T_41;
  assign T_60 = T_43 + 1'h1;
  assign T_61 = T_60[0:0];
  assign GEN_6 = do_deq ? T_61 : T_43;
  assign T_62 = do_enq != do_deq;
  assign GEN_7 = T_62 ? do_enq : maybe_full;
  assign T_64 = empty == 1'h0;
  assign T_66 = full == 1'h0;
  assign T_70 = T_41 - T_43;
  assign ptr_diff = T_70[0:0];
  assign T_71 = maybe_full & ptr_match;
  assign T_72 = {T_71,ptr_diff};
  always @(posedge clock) begin
    if(ram_id_T_49_en & ram_id_T_49_mask) begin
      ram_id[ram_id_T_49_addr] <= ram_id_T_49_data;
    end
    if(ram_resp_T_49_en & ram_resp_T_49_mask) begin
      ram_resp[ram_resp_T_49_addr] <= ram_resp_T_49_data;
    end
    if (reset) begin
      T_41 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_41 <= T_56;
      end
    end
    if (reset) begin
      T_43 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_43 <= T_61;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_62) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Queue_8(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0] io_enq_bits_resp,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0] io_deq_bits_resp,
  output  io_deq_bits_last,
  output [1:0] io_count
);
  reg [3:0] ram_id [0:1];
  reg [31:0] GEN_0;
  wire [3:0] ram_id_T_83_data;
  wire  ram_id_T_83_addr;
  wire [3:0] ram_id_T_63_data;
  wire  ram_id_T_63_addr;
  wire  ram_id_T_63_mask;
  wire  ram_id_T_63_en;
  reg [63:0] ram_data [0:1];
  reg [63:0] GEN_1;
  wire [63:0] ram_data_T_83_data;
  wire  ram_data_T_83_addr;
  wire [63:0] ram_data_T_63_data;
  wire  ram_data_T_63_addr;
  wire  ram_data_T_63_mask;
  wire  ram_data_T_63_en;
  reg [1:0] ram_resp [0:1];
  reg [31:0] GEN_2;
  wire [1:0] ram_resp_T_83_data;
  wire  ram_resp_T_83_addr;
  wire [1:0] ram_resp_T_63_data;
  wire  ram_resp_T_63_addr;
  wire  ram_resp_T_63_mask;
  wire  ram_resp_T_63_en;
  reg  ram_last [0:1];
  reg [31:0] GEN_3;
  wire  ram_last_T_83_data;
  wire  ram_last_T_83_addr;
  wire  ram_last_T_63_data;
  wire  ram_last_T_63_addr;
  wire  ram_last_T_63_mask;
  wire  ram_last_T_63_en;
  reg  T_55;
  reg [31:0] GEN_4;
  reg  T_57;
  reg [31:0] GEN_5;
  reg  maybe_full;
  reg [31:0] GEN_6;
  wire  ptr_match;
  wire  T_60;
  wire  empty;
  wire  full;
  wire  T_61;
  wire  do_enq;
  wire  T_62;
  wire  do_deq;
  wire [1:0] T_71;
  wire  T_72;
  wire  GEN_7;
  wire [1:0] T_76;
  wire  T_77;
  wire  GEN_8;
  wire  T_78;
  wire  GEN_9;
  wire  T_80;
  wire  T_82;
  wire [1:0] T_88;
  wire  ptr_diff;
  wire  T_89;
  wire [1:0] T_90;
  assign io_enq_ready = T_82;
  assign io_deq_valid = T_80;
  assign io_deq_bits_id = ram_id_T_83_data;
  assign io_deq_bits_data = ram_data_T_83_data;
  assign io_deq_bits_resp = ram_resp_T_83_data;
  assign io_deq_bits_last = ram_last_T_83_data;
  assign io_count = T_90;
  assign ram_id_T_83_addr = T_57;
  assign ram_id_T_83_data = ram_id[ram_id_T_83_addr];
  assign ram_id_T_63_data = io_enq_bits_id;
  assign ram_id_T_63_addr = T_55;
  assign ram_id_T_63_mask = do_enq;
  assign ram_id_T_63_en = do_enq;
  assign ram_data_T_83_addr = T_57;
  assign ram_data_T_83_data = ram_data[ram_data_T_83_addr];
  assign ram_data_T_63_data = io_enq_bits_data;
  assign ram_data_T_63_addr = T_55;
  assign ram_data_T_63_mask = do_enq;
  assign ram_data_T_63_en = do_enq;
  assign ram_resp_T_83_addr = T_57;
  assign ram_resp_T_83_data = ram_resp[ram_resp_T_83_addr];
  assign ram_resp_T_63_data = io_enq_bits_resp;
  assign ram_resp_T_63_addr = T_55;
  assign ram_resp_T_63_mask = do_enq;
  assign ram_resp_T_63_en = do_enq;
  assign ram_last_T_83_addr = T_57;
  assign ram_last_T_83_data = ram_last[ram_last_T_83_addr];
  assign ram_last_T_63_data = io_enq_bits_last;
  assign ram_last_T_63_addr = T_55;
  assign ram_last_T_63_mask = do_enq;
  assign ram_last_T_63_en = do_enq;
  assign ptr_match = T_55 == T_57;
  assign T_60 = maybe_full == 1'h0;
  assign empty = ptr_match & T_60;
  assign full = ptr_match & maybe_full;
  assign T_61 = io_enq_ready & io_enq_valid;
  assign do_enq = T_61;
  assign T_62 = io_deq_ready & io_deq_valid;
  assign do_deq = T_62;
  assign T_71 = T_55 + 1'h1;
  assign T_72 = T_71[0:0];
  assign GEN_7 = do_enq ? T_72 : T_55;
  assign T_76 = T_57 + 1'h1;
  assign T_77 = T_76[0:0];
  assign GEN_8 = do_deq ? T_77 : T_57;
  assign T_78 = do_enq != do_deq;
  assign GEN_9 = T_78 ? do_enq : maybe_full;
  assign T_80 = empty == 1'h0;
  assign T_82 = full == 1'h0;
  assign T_88 = T_55 - T_57;
  assign ptr_diff = T_88[0:0];
  assign T_89 = maybe_full & ptr_match;
  assign T_90 = {T_89,ptr_diff};
  always @(posedge clock) begin
    if(ram_id_T_63_en & ram_id_T_63_mask) begin
      ram_id[ram_id_T_63_addr] <= ram_id_T_63_data;
    end
    if(ram_data_T_63_en & ram_data_T_63_mask) begin
      ram_data[ram_data_T_63_addr] <= ram_data_T_63_data;
    end
    if(ram_resp_T_63_en & ram_resp_T_63_mask) begin
      ram_resp[ram_resp_T_63_addr] <= ram_resp_T_63_data;
    end
    if(ram_last_T_63_en & ram_last_T_63_mask) begin
      ram_last[ram_last_T_63_addr] <= ram_last_T_63_data;
    end
    if (reset) begin
      T_55 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_55 <= T_72;
      end
    end
    if (reset) begin
      T_57 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_57 <= T_77;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_78) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module AXI4Buffer(
  input   clock,
  input   reset,
  output  io_in_0_aw_ready,
  input   io_in_0_aw_valid,
  input  [3:0] io_in_0_aw_bits_id,
  input  [27:0] io_in_0_aw_bits_addr,
  input  [7:0] io_in_0_aw_bits_len,
  input  [2:0] io_in_0_aw_bits_size,
  input  [1:0] io_in_0_aw_bits_burst,
  input   io_in_0_aw_bits_lock,
  input  [3:0] io_in_0_aw_bits_cache,
  input  [2:0] io_in_0_aw_bits_prot,
  input  [3:0] io_in_0_aw_bits_qos,
  output  io_in_0_w_ready,
  input   io_in_0_w_valid,
  input  [63:0] io_in_0_w_bits_data,
  input  [7:0] io_in_0_w_bits_strb,
  input   io_in_0_w_bits_last,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [3:0] io_in_0_b_bits_id,
  output [1:0] io_in_0_b_bits_resp,
  output  io_in_0_ar_ready,
  input   io_in_0_ar_valid,
  input  [3:0] io_in_0_ar_bits_id,
  input  [27:0] io_in_0_ar_bits_addr,
  input  [7:0] io_in_0_ar_bits_len,
  input  [2:0] io_in_0_ar_bits_size,
  input  [1:0] io_in_0_ar_bits_burst,
  input   io_in_0_ar_bits_lock,
  input  [3:0] io_in_0_ar_bits_cache,
  input  [2:0] io_in_0_ar_bits_prot,
  input  [3:0] io_in_0_ar_bits_qos,
  input   io_in_0_r_ready,
  output  io_in_0_r_valid,
  output [3:0] io_in_0_r_bits_id,
  output [63:0] io_in_0_r_bits_data,
  output [1:0] io_in_0_r_bits_resp,
  output  io_in_0_r_bits_last,
  input   io_out_0_aw_ready,
  output  io_out_0_aw_valid,
  output [3:0] io_out_0_aw_bits_id,
  output [27:0] io_out_0_aw_bits_addr,
  output [7:0] io_out_0_aw_bits_len,
  output [2:0] io_out_0_aw_bits_size,
  output [1:0] io_out_0_aw_bits_burst,
  output  io_out_0_aw_bits_lock,
  output [3:0] io_out_0_aw_bits_cache,
  output [2:0] io_out_0_aw_bits_prot,
  output [3:0] io_out_0_aw_bits_qos,
  input   io_out_0_w_ready,
  output  io_out_0_w_valid,
  output [63:0] io_out_0_w_bits_data,
  output [7:0] io_out_0_w_bits_strb,
  output  io_out_0_w_bits_last,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [3:0] io_out_0_b_bits_id,
  input  [1:0] io_out_0_b_bits_resp,
  input   io_out_0_ar_ready,
  output  io_out_0_ar_valid,
  output [3:0] io_out_0_ar_bits_id,
  output [27:0] io_out_0_ar_bits_addr,
  output [7:0] io_out_0_ar_bits_len,
  output [2:0] io_out_0_ar_bits_size,
  output [1:0] io_out_0_ar_bits_burst,
  output  io_out_0_ar_bits_lock,
  output [3:0] io_out_0_ar_bits_cache,
  output [2:0] io_out_0_ar_bits_prot,
  output [3:0] io_out_0_ar_bits_qos,
  output  io_out_0_r_ready,
  input   io_out_0_r_valid,
  input  [3:0] io_out_0_r_bits_id,
  input  [63:0] io_out_0_r_bits_data,
  input  [1:0] io_out_0_r_bits_resp,
  input   io_out_0_r_bits_last
);
  wire  Queue_4_1_clock;
  wire  Queue_4_1_reset;
  wire  Queue_4_1_io_enq_ready;
  wire  Queue_4_1_io_enq_valid;
  wire [3:0] Queue_4_1_io_enq_bits_id;
  wire [27:0] Queue_4_1_io_enq_bits_addr;
  wire [7:0] Queue_4_1_io_enq_bits_len;
  wire [2:0] Queue_4_1_io_enq_bits_size;
  wire [1:0] Queue_4_1_io_enq_bits_burst;
  wire  Queue_4_1_io_enq_bits_lock;
  wire [3:0] Queue_4_1_io_enq_bits_cache;
  wire [2:0] Queue_4_1_io_enq_bits_prot;
  wire [3:0] Queue_4_1_io_enq_bits_qos;
  wire  Queue_4_1_io_deq_ready;
  wire  Queue_4_1_io_deq_valid;
  wire [3:0] Queue_4_1_io_deq_bits_id;
  wire [27:0] Queue_4_1_io_deq_bits_addr;
  wire [7:0] Queue_4_1_io_deq_bits_len;
  wire [2:0] Queue_4_1_io_deq_bits_size;
  wire [1:0] Queue_4_1_io_deq_bits_burst;
  wire  Queue_4_1_io_deq_bits_lock;
  wire [3:0] Queue_4_1_io_deq_bits_cache;
  wire [2:0] Queue_4_1_io_deq_bits_prot;
  wire [3:0] Queue_4_1_io_deq_bits_qos;
  wire [1:0] Queue_4_1_io_count;
  wire  Queue_5_1_clock;
  wire  Queue_5_1_reset;
  wire  Queue_5_1_io_enq_ready;
  wire  Queue_5_1_io_enq_valid;
  wire [63:0] Queue_5_1_io_enq_bits_data;
  wire [7:0] Queue_5_1_io_enq_bits_strb;
  wire  Queue_5_1_io_enq_bits_last;
  wire  Queue_5_1_io_deq_ready;
  wire  Queue_5_1_io_deq_valid;
  wire [63:0] Queue_5_1_io_deq_bits_data;
  wire [7:0] Queue_5_1_io_deq_bits_strb;
  wire  Queue_5_1_io_deq_bits_last;
  wire [1:0] Queue_5_1_io_count;
  wire  Queue_6_1_clock;
  wire  Queue_6_1_reset;
  wire  Queue_6_1_io_enq_ready;
  wire  Queue_6_1_io_enq_valid;
  wire [3:0] Queue_6_1_io_enq_bits_id;
  wire [1:0] Queue_6_1_io_enq_bits_resp;
  wire  Queue_6_1_io_deq_ready;
  wire  Queue_6_1_io_deq_valid;
  wire [3:0] Queue_6_1_io_deq_bits_id;
  wire [1:0] Queue_6_1_io_deq_bits_resp;
  wire [1:0] Queue_6_1_io_count;
  wire  Queue_7_1_clock;
  wire  Queue_7_1_reset;
  wire  Queue_7_1_io_enq_ready;
  wire  Queue_7_1_io_enq_valid;
  wire [3:0] Queue_7_1_io_enq_bits_id;
  wire [27:0] Queue_7_1_io_enq_bits_addr;
  wire [7:0] Queue_7_1_io_enq_bits_len;
  wire [2:0] Queue_7_1_io_enq_bits_size;
  wire [1:0] Queue_7_1_io_enq_bits_burst;
  wire  Queue_7_1_io_enq_bits_lock;
  wire [3:0] Queue_7_1_io_enq_bits_cache;
  wire [2:0] Queue_7_1_io_enq_bits_prot;
  wire [3:0] Queue_7_1_io_enq_bits_qos;
  wire  Queue_7_1_io_deq_ready;
  wire  Queue_7_1_io_deq_valid;
  wire [3:0] Queue_7_1_io_deq_bits_id;
  wire [27:0] Queue_7_1_io_deq_bits_addr;
  wire [7:0] Queue_7_1_io_deq_bits_len;
  wire [2:0] Queue_7_1_io_deq_bits_size;
  wire [1:0] Queue_7_1_io_deq_bits_burst;
  wire  Queue_7_1_io_deq_bits_lock;
  wire [3:0] Queue_7_1_io_deq_bits_cache;
  wire [2:0] Queue_7_1_io_deq_bits_prot;
  wire [3:0] Queue_7_1_io_deq_bits_qos;
  wire [1:0] Queue_7_1_io_count;
  wire  Queue_8_1_clock;
  wire  Queue_8_1_reset;
  wire  Queue_8_1_io_enq_ready;
  wire  Queue_8_1_io_enq_valid;
  wire [3:0] Queue_8_1_io_enq_bits_id;
  wire [63:0] Queue_8_1_io_enq_bits_data;
  wire [1:0] Queue_8_1_io_enq_bits_resp;
  wire  Queue_8_1_io_enq_bits_last;
  wire  Queue_8_1_io_deq_ready;
  wire  Queue_8_1_io_deq_valid;
  wire [3:0] Queue_8_1_io_deq_bits_id;
  wire [63:0] Queue_8_1_io_deq_bits_data;
  wire [1:0] Queue_8_1_io_deq_bits_resp;
  wire  Queue_8_1_io_deq_bits_last;
  wire [1:0] Queue_8_1_io_count;
  Queue_4 Queue_4_1 (
    .clock(Queue_4_1_clock),
    .reset(Queue_4_1_reset),
    .io_enq_ready(Queue_4_1_io_enq_ready),
    .io_enq_valid(Queue_4_1_io_enq_valid),
    .io_enq_bits_id(Queue_4_1_io_enq_bits_id),
    .io_enq_bits_addr(Queue_4_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_4_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_4_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_4_1_io_enq_bits_burst),
    .io_enq_bits_lock(Queue_4_1_io_enq_bits_lock),
    .io_enq_bits_cache(Queue_4_1_io_enq_bits_cache),
    .io_enq_bits_prot(Queue_4_1_io_enq_bits_prot),
    .io_enq_bits_qos(Queue_4_1_io_enq_bits_qos),
    .io_deq_ready(Queue_4_1_io_deq_ready),
    .io_deq_valid(Queue_4_1_io_deq_valid),
    .io_deq_bits_id(Queue_4_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_4_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_4_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_4_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_4_1_io_deq_bits_burst),
    .io_deq_bits_lock(Queue_4_1_io_deq_bits_lock),
    .io_deq_bits_cache(Queue_4_1_io_deq_bits_cache),
    .io_deq_bits_prot(Queue_4_1_io_deq_bits_prot),
    .io_deq_bits_qos(Queue_4_1_io_deq_bits_qos),
    .io_count(Queue_4_1_io_count)
  );
  Queue_5 Queue_5_1 (
    .clock(Queue_5_1_clock),
    .reset(Queue_5_1_reset),
    .io_enq_ready(Queue_5_1_io_enq_ready),
    .io_enq_valid(Queue_5_1_io_enq_valid),
    .io_enq_bits_data(Queue_5_1_io_enq_bits_data),
    .io_enq_bits_strb(Queue_5_1_io_enq_bits_strb),
    .io_enq_bits_last(Queue_5_1_io_enq_bits_last),
    .io_deq_ready(Queue_5_1_io_deq_ready),
    .io_deq_valid(Queue_5_1_io_deq_valid),
    .io_deq_bits_data(Queue_5_1_io_deq_bits_data),
    .io_deq_bits_strb(Queue_5_1_io_deq_bits_strb),
    .io_deq_bits_last(Queue_5_1_io_deq_bits_last),
    .io_count(Queue_5_1_io_count)
  );
  Queue_6 Queue_6_1 (
    .clock(Queue_6_1_clock),
    .reset(Queue_6_1_reset),
    .io_enq_ready(Queue_6_1_io_enq_ready),
    .io_enq_valid(Queue_6_1_io_enq_valid),
    .io_enq_bits_id(Queue_6_1_io_enq_bits_id),
    .io_enq_bits_resp(Queue_6_1_io_enq_bits_resp),
    .io_deq_ready(Queue_6_1_io_deq_ready),
    .io_deq_valid(Queue_6_1_io_deq_valid),
    .io_deq_bits_id(Queue_6_1_io_deq_bits_id),
    .io_deq_bits_resp(Queue_6_1_io_deq_bits_resp),
    .io_count(Queue_6_1_io_count)
  );
  Queue_4 Queue_7_1 (
    .clock(Queue_7_1_clock),
    .reset(Queue_7_1_reset),
    .io_enq_ready(Queue_7_1_io_enq_ready),
    .io_enq_valid(Queue_7_1_io_enq_valid),
    .io_enq_bits_id(Queue_7_1_io_enq_bits_id),
    .io_enq_bits_addr(Queue_7_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_7_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_7_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_7_1_io_enq_bits_burst),
    .io_enq_bits_lock(Queue_7_1_io_enq_bits_lock),
    .io_enq_bits_cache(Queue_7_1_io_enq_bits_cache),
    .io_enq_bits_prot(Queue_7_1_io_enq_bits_prot),
    .io_enq_bits_qos(Queue_7_1_io_enq_bits_qos),
    .io_deq_ready(Queue_7_1_io_deq_ready),
    .io_deq_valid(Queue_7_1_io_deq_valid),
    .io_deq_bits_id(Queue_7_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_7_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_7_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_7_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_7_1_io_deq_bits_burst),
    .io_deq_bits_lock(Queue_7_1_io_deq_bits_lock),
    .io_deq_bits_cache(Queue_7_1_io_deq_bits_cache),
    .io_deq_bits_prot(Queue_7_1_io_deq_bits_prot),
    .io_deq_bits_qos(Queue_7_1_io_deq_bits_qos),
    .io_count(Queue_7_1_io_count)
  );
  Queue_8 Queue_8_1 (
    .clock(Queue_8_1_clock),
    .reset(Queue_8_1_reset),
    .io_enq_ready(Queue_8_1_io_enq_ready),
    .io_enq_valid(Queue_8_1_io_enq_valid),
    .io_enq_bits_id(Queue_8_1_io_enq_bits_id),
    .io_enq_bits_data(Queue_8_1_io_enq_bits_data),
    .io_enq_bits_resp(Queue_8_1_io_enq_bits_resp),
    .io_enq_bits_last(Queue_8_1_io_enq_bits_last),
    .io_deq_ready(Queue_8_1_io_deq_ready),
    .io_deq_valid(Queue_8_1_io_deq_valid),
    .io_deq_bits_id(Queue_8_1_io_deq_bits_id),
    .io_deq_bits_data(Queue_8_1_io_deq_bits_data),
    .io_deq_bits_resp(Queue_8_1_io_deq_bits_resp),
    .io_deq_bits_last(Queue_8_1_io_deq_bits_last),
    .io_count(Queue_8_1_io_count)
  );
  assign io_in_0_aw_ready = Queue_4_1_io_enq_ready;
  assign io_in_0_w_ready = Queue_5_1_io_enq_ready;
  assign io_in_0_b_valid = Queue_6_1_io_deq_valid;
  assign io_in_0_b_bits_id = Queue_6_1_io_deq_bits_id;
  assign io_in_0_b_bits_resp = Queue_6_1_io_deq_bits_resp;
  assign io_in_0_ar_ready = Queue_7_1_io_enq_ready;
  assign io_in_0_r_valid = Queue_8_1_io_deq_valid;
  assign io_in_0_r_bits_id = Queue_8_1_io_deq_bits_id;
  assign io_in_0_r_bits_data = Queue_8_1_io_deq_bits_data;
  assign io_in_0_r_bits_resp = Queue_8_1_io_deq_bits_resp;
  assign io_in_0_r_bits_last = Queue_8_1_io_deq_bits_last;
  assign io_out_0_aw_valid = Queue_4_1_io_deq_valid;
  assign io_out_0_aw_bits_id = Queue_4_1_io_deq_bits_id;
  assign io_out_0_aw_bits_addr = Queue_4_1_io_deq_bits_addr;
  assign io_out_0_aw_bits_len = Queue_4_1_io_deq_bits_len;
  assign io_out_0_aw_bits_size = Queue_4_1_io_deq_bits_size;
  assign io_out_0_aw_bits_burst = Queue_4_1_io_deq_bits_burst;
  assign io_out_0_aw_bits_lock = Queue_4_1_io_deq_bits_lock;
  assign io_out_0_aw_bits_cache = Queue_4_1_io_deq_bits_cache;
  assign io_out_0_aw_bits_prot = Queue_4_1_io_deq_bits_prot;
  assign io_out_0_aw_bits_qos = Queue_4_1_io_deq_bits_qos;
  assign io_out_0_w_valid = Queue_5_1_io_deq_valid;
  assign io_out_0_w_bits_data = Queue_5_1_io_deq_bits_data;
  assign io_out_0_w_bits_strb = Queue_5_1_io_deq_bits_strb;
  assign io_out_0_w_bits_last = Queue_5_1_io_deq_bits_last;
  assign io_out_0_b_ready = Queue_6_1_io_enq_ready;
  assign io_out_0_ar_valid = Queue_7_1_io_deq_valid;
  assign io_out_0_ar_bits_id = Queue_7_1_io_deq_bits_id;
  assign io_out_0_ar_bits_addr = Queue_7_1_io_deq_bits_addr;
  assign io_out_0_ar_bits_len = Queue_7_1_io_deq_bits_len;
  assign io_out_0_ar_bits_size = Queue_7_1_io_deq_bits_size;
  assign io_out_0_ar_bits_burst = Queue_7_1_io_deq_bits_burst;
  assign io_out_0_ar_bits_lock = Queue_7_1_io_deq_bits_lock;
  assign io_out_0_ar_bits_cache = Queue_7_1_io_deq_bits_cache;
  assign io_out_0_ar_bits_prot = Queue_7_1_io_deq_bits_prot;
  assign io_out_0_ar_bits_qos = Queue_7_1_io_deq_bits_qos;
  assign io_out_0_r_ready = Queue_8_1_io_enq_ready;
  assign Queue_4_1_clock = clock;
  assign Queue_4_1_reset = reset;
  assign Queue_4_1_io_enq_valid = io_in_0_aw_valid;
  assign Queue_4_1_io_enq_bits_id = io_in_0_aw_bits_id;
  assign Queue_4_1_io_enq_bits_addr = io_in_0_aw_bits_addr;
  assign Queue_4_1_io_enq_bits_len = io_in_0_aw_bits_len;
  assign Queue_4_1_io_enq_bits_size = io_in_0_aw_bits_size;
  assign Queue_4_1_io_enq_bits_burst = io_in_0_aw_bits_burst;
  assign Queue_4_1_io_enq_bits_lock = io_in_0_aw_bits_lock;
  assign Queue_4_1_io_enq_bits_cache = io_in_0_aw_bits_cache;
  assign Queue_4_1_io_enq_bits_prot = io_in_0_aw_bits_prot;
  assign Queue_4_1_io_enq_bits_qos = io_in_0_aw_bits_qos;
  assign Queue_4_1_io_deq_ready = io_out_0_aw_ready;
  assign Queue_5_1_clock = clock;
  assign Queue_5_1_reset = reset;
  assign Queue_5_1_io_enq_valid = io_in_0_w_valid;
  assign Queue_5_1_io_enq_bits_data = io_in_0_w_bits_data;
  assign Queue_5_1_io_enq_bits_strb = io_in_0_w_bits_strb;
  assign Queue_5_1_io_enq_bits_last = io_in_0_w_bits_last;
  assign Queue_5_1_io_deq_ready = io_out_0_w_ready;
  assign Queue_6_1_clock = clock;
  assign Queue_6_1_reset = reset;
  assign Queue_6_1_io_enq_valid = io_out_0_b_valid;
  assign Queue_6_1_io_enq_bits_id = io_out_0_b_bits_id;
  assign Queue_6_1_io_enq_bits_resp = io_out_0_b_bits_resp;
  assign Queue_6_1_io_deq_ready = io_in_0_b_ready;
  assign Queue_7_1_clock = clock;
  assign Queue_7_1_reset = reset;
  assign Queue_7_1_io_enq_valid = io_in_0_ar_valid;
  assign Queue_7_1_io_enq_bits_id = io_in_0_ar_bits_id;
  assign Queue_7_1_io_enq_bits_addr = io_in_0_ar_bits_addr;
  assign Queue_7_1_io_enq_bits_len = io_in_0_ar_bits_len;
  assign Queue_7_1_io_enq_bits_size = io_in_0_ar_bits_size;
  assign Queue_7_1_io_enq_bits_burst = io_in_0_ar_bits_burst;
  assign Queue_7_1_io_enq_bits_lock = io_in_0_ar_bits_lock;
  assign Queue_7_1_io_enq_bits_cache = io_in_0_ar_bits_cache;
  assign Queue_7_1_io_enq_bits_prot = io_in_0_ar_bits_prot;
  assign Queue_7_1_io_enq_bits_qos = io_in_0_ar_bits_qos;
  assign Queue_7_1_io_deq_ready = io_out_0_ar_ready;
  assign Queue_8_1_clock = clock;
  assign Queue_8_1_reset = reset;
  assign Queue_8_1_io_enq_valid = io_out_0_r_valid;
  assign Queue_8_1_io_enq_bits_id = io_out_0_r_bits_id;
  assign Queue_8_1_io_enq_bits_data = io_out_0_r_bits_data;
  assign Queue_8_1_io_enq_bits_resp = io_out_0_r_bits_resp;
  assign Queue_8_1_io_enq_bits_last = io_out_0_r_bits_last;
  assign Queue_8_1_io_deq_ready = io_in_0_r_ready;
endmodule
module mem(
  input  [24:0] R0_addr,
  input   R0_en,
  input   R0_clk,
  output [7:0] R0_data_0,
  output [7:0] R0_data_1,
  output [7:0] R0_data_2,
  output [7:0] R0_data_3,
  output [7:0] R0_data_4,
  output [7:0] R0_data_5,
  output [7:0] R0_data_6,
  output [7:0] R0_data_7,
  input  [24:0] W0_addr,
  input   W0_en,
  input   W0_clk,
  input  [7:0] W0_data_0,
  input  [7:0] W0_data_1,
  input  [7:0] W0_data_2,
  input  [7:0] W0_data_3,
  input  [7:0] W0_data_4,
  input  [7:0] W0_data_5,
  input  [7:0] W0_data_6,
  input  [7:0] W0_data_7,
  input   W0_mask_0,
  input   W0_mask_1,
  input   W0_mask_2,
  input   W0_mask_3,
  input   W0_mask_4,
  input   W0_mask_5,
  input   W0_mask_6,
  input   W0_mask_7
);
  wire [24:0] mem_ext_R0_addr;
  wire  mem_ext_R0_en;
  wire  mem_ext_R0_clk;
  wire [63:0] mem_ext_R0_data;
  wire [24:0] mem_ext_W0_addr;
  wire  mem_ext_W0_en;
  wire  mem_ext_W0_clk;
  wire [63:0] mem_ext_W0_data;
  wire [7:0] mem_ext_W0_mask;
  wire [15:0] GEN_0;
  wire [15:0] GEN_1;
  wire [15:0] GEN_2;
  wire [15:0] GEN_3;
  wire [31:0] GEN_4;
  wire [31:0] GEN_5;
  wire [1:0] GEN_6;
  wire [1:0] GEN_7;
  wire [1:0] GEN_8;
  wire [1:0] GEN_9;
  wire [3:0] GEN_10;
  wire [3:0] GEN_11;
  mem_ext mem_ext (
    .R0_addr(mem_ext_R0_addr),
    .R0_en(mem_ext_R0_en),
    .R0_clk(mem_ext_R0_clk),
    .R0_data(mem_ext_R0_data),
    .W0_addr(mem_ext_W0_addr),
    .W0_en(mem_ext_W0_en),
    .W0_clk(mem_ext_W0_clk),
    .W0_data(mem_ext_W0_data),
    .W0_mask(mem_ext_W0_mask)
  );
  assign R0_data_0 = mem_ext_R0_data[7:0];
  assign R0_data_1 = mem_ext_R0_data[15:8];
  assign R0_data_2 = mem_ext_R0_data[23:16];
  assign R0_data_3 = mem_ext_R0_data[31:24];
  assign R0_data_4 = mem_ext_R0_data[39:32];
  assign R0_data_5 = mem_ext_R0_data[47:40];
  assign R0_data_6 = mem_ext_R0_data[55:48];
  assign R0_data_7 = mem_ext_R0_data[63:56];
  assign mem_ext_R0_addr = R0_addr;
  assign mem_ext_R0_en = R0_en;
  assign mem_ext_R0_clk = R0_clk;
  assign mem_ext_W0_addr = W0_addr;
  assign mem_ext_W0_en = W0_en;
  assign mem_ext_W0_clk = W0_clk;
  assign mem_ext_W0_data = {GEN_4,GEN_5};
  assign mem_ext_W0_mask = {GEN_10,GEN_11};
  assign GEN_0 = {W0_data_7,W0_data_6};
  assign GEN_1 = {W0_data_5,W0_data_4};
  assign GEN_2 = {W0_data_3,W0_data_2};
  assign GEN_3 = {W0_data_1,W0_data_0};
  assign GEN_4 = {GEN_0,GEN_1};
  assign GEN_5 = {GEN_2,GEN_3};
  assign GEN_6 = {W0_mask_7,W0_mask_6};
  assign GEN_7 = {W0_mask_5,W0_mask_4};
  assign GEN_8 = {W0_mask_3,W0_mask_2};
  assign GEN_9 = {W0_mask_1,W0_mask_0};
  assign GEN_10 = {GEN_6,GEN_7};
  assign GEN_11 = {GEN_8,GEN_9};
endmodule

module mem_ext(
  input W0_clk,
  input [24:0] W0_addr,
  input W0_en,
  input [63:0] W0_data,
  input [7:0] W0_mask,
  input R0_clk,
  input [24:0] R0_addr,
  input R0_en,
  output [63:0] R0_data
);

  reg [24:0] reg_R0_addr;
  reg [63:0] ram [33554431:0];
  initial begin
    $readmemh("bin.txt", ram);
  end
  integer i;
  always @(posedge R0_clk)
    if (R0_en) reg_R0_addr <= R0_addr;
  always @(posedge W0_clk)
    if (W0_en) begin
      if (W0_mask[0]) ram[W0_addr][7:0] <= W0_data[7:0];
      if (W0_mask[1]) ram[W0_addr][15:8] <= W0_data[15:8];
      if (W0_mask[2]) ram[W0_addr][23:16] <= W0_data[23:16];
      if (W0_mask[3]) ram[W0_addr][31:24] <= W0_data[31:24];
      if (W0_mask[4]) ram[W0_addr][39:32] <= W0_data[39:32];
      if (W0_mask[5]) ram[W0_addr][47:40] <= W0_data[47:40];
      if (W0_mask[6]) ram[W0_addr][55:48] <= W0_data[55:48];
      if (W0_mask[7]) ram[W0_addr][63:56] <= W0_data[63:56];
    end
  assign R0_data = ram[reg_R0_addr];

endmodule

module SimAXIMem(
  input   clock,
  input   reset,
  `axi_slave_if(io_axi4_0, 64, 4)
);
  wire  sram_clock;
  wire  sram_reset;
  wire  sram_io_in_0_aw_ready;
  wire  sram_io_in_0_aw_valid;
  wire [3:0] sram_io_in_0_aw_bits_id;
  wire [27:0] sram_io_in_0_aw_bits_addr;
  wire [7:0] sram_io_in_0_aw_bits_len;
  wire [2:0] sram_io_in_0_aw_bits_size;
  wire [1:0] sram_io_in_0_aw_bits_burst;
  wire  sram_io_in_0_aw_bits_lock;
  wire [3:0] sram_io_in_0_aw_bits_cache;
  wire [2:0] sram_io_in_0_aw_bits_prot;
  wire [3:0] sram_io_in_0_aw_bits_qos;
  wire  sram_io_in_0_w_ready;
  wire  sram_io_in_0_w_valid;
  wire [63:0] sram_io_in_0_w_bits_data;
  wire [7:0] sram_io_in_0_w_bits_strb;
  wire  sram_io_in_0_w_bits_last;
  wire  sram_io_in_0_b_ready;
  wire  sram_io_in_0_b_valid;
  wire [3:0] sram_io_in_0_b_bits_id;
  wire [1:0] sram_io_in_0_b_bits_resp;
  wire  sram_io_in_0_ar_ready;
  wire  sram_io_in_0_ar_valid;
  wire [3:0] sram_io_in_0_ar_bits_id;
  wire [27:0] sram_io_in_0_ar_bits_addr;
  wire [7:0] sram_io_in_0_ar_bits_len;
  wire [2:0] sram_io_in_0_ar_bits_size;
  wire [1:0] sram_io_in_0_ar_bits_burst;
  wire  sram_io_in_0_ar_bits_lock;
  wire [3:0] sram_io_in_0_ar_bits_cache;
  wire [2:0] sram_io_in_0_ar_bits_prot;
  wire [3:0] sram_io_in_0_ar_bits_qos;
  wire  sram_io_in_0_r_ready;
  wire  sram_io_in_0_r_valid;
  wire [3:0] sram_io_in_0_r_bits_id;
  wire [63:0] sram_io_in_0_r_bits_data;
  wire [1:0] sram_io_in_0_r_bits_resp;
  wire  sram_io_in_0_r_bits_last;
  wire  AXI4Fragmenter_1_clock;
  wire  AXI4Fragmenter_1_reset;
  wire  AXI4Fragmenter_1_io_in_0_aw_ready;
  wire  AXI4Fragmenter_1_io_in_0_aw_valid;
  wire [3:0] AXI4Fragmenter_1_io_in_0_aw_bits_id;
  wire [27:0] AXI4Fragmenter_1_io_in_0_aw_bits_addr;
  wire [7:0] AXI4Fragmenter_1_io_in_0_aw_bits_len;
  wire [2:0] AXI4Fragmenter_1_io_in_0_aw_bits_size;
  wire [1:0] AXI4Fragmenter_1_io_in_0_aw_bits_burst;
  wire  AXI4Fragmenter_1_io_in_0_aw_bits_lock;
  wire [3:0] AXI4Fragmenter_1_io_in_0_aw_bits_cache;
  wire [2:0] AXI4Fragmenter_1_io_in_0_aw_bits_prot;
  wire [3:0] AXI4Fragmenter_1_io_in_0_aw_bits_qos;
  wire  AXI4Fragmenter_1_io_in_0_w_ready;
  wire  AXI4Fragmenter_1_io_in_0_w_valid;
  wire [63:0] AXI4Fragmenter_1_io_in_0_w_bits_data;
  wire [7:0] AXI4Fragmenter_1_io_in_0_w_bits_strb;
  wire  AXI4Fragmenter_1_io_in_0_w_bits_last;
  wire  AXI4Fragmenter_1_io_in_0_b_ready;
  wire  AXI4Fragmenter_1_io_in_0_b_valid;
  wire [3:0] AXI4Fragmenter_1_io_in_0_b_bits_id;
  wire [1:0] AXI4Fragmenter_1_io_in_0_b_bits_resp;
  wire  AXI4Fragmenter_1_io_in_0_ar_ready;
  wire  AXI4Fragmenter_1_io_in_0_ar_valid;
  wire [3:0] AXI4Fragmenter_1_io_in_0_ar_bits_id;
  wire [27:0] AXI4Fragmenter_1_io_in_0_ar_bits_addr;
  wire [7:0] AXI4Fragmenter_1_io_in_0_ar_bits_len;
  wire [2:0] AXI4Fragmenter_1_io_in_0_ar_bits_size;
  wire [1:0] AXI4Fragmenter_1_io_in_0_ar_bits_burst;
  wire  AXI4Fragmenter_1_io_in_0_ar_bits_lock;
  wire [3:0] AXI4Fragmenter_1_io_in_0_ar_bits_cache;
  wire [2:0] AXI4Fragmenter_1_io_in_0_ar_bits_prot;
  wire [3:0] AXI4Fragmenter_1_io_in_0_ar_bits_qos;
  wire  AXI4Fragmenter_1_io_in_0_r_ready;
  wire  AXI4Fragmenter_1_io_in_0_r_valid;
  wire [3:0] AXI4Fragmenter_1_io_in_0_r_bits_id;
  wire [63:0] AXI4Fragmenter_1_io_in_0_r_bits_data;
  wire [1:0] AXI4Fragmenter_1_io_in_0_r_bits_resp;
  wire  AXI4Fragmenter_1_io_in_0_r_bits_last;
  wire  AXI4Fragmenter_1_io_out_0_aw_ready;
  wire  AXI4Fragmenter_1_io_out_0_aw_valid;
  wire [3:0] AXI4Fragmenter_1_io_out_0_aw_bits_id;
  wire [27:0] AXI4Fragmenter_1_io_out_0_aw_bits_addr;
  wire [7:0] AXI4Fragmenter_1_io_out_0_aw_bits_len;
  wire [2:0] AXI4Fragmenter_1_io_out_0_aw_bits_size;
  wire [1:0] AXI4Fragmenter_1_io_out_0_aw_bits_burst;
  wire  AXI4Fragmenter_1_io_out_0_aw_bits_lock;
  wire [3:0] AXI4Fragmenter_1_io_out_0_aw_bits_cache;
  wire [2:0] AXI4Fragmenter_1_io_out_0_aw_bits_prot;
  wire [3:0] AXI4Fragmenter_1_io_out_0_aw_bits_qos;
  wire  AXI4Fragmenter_1_io_out_0_w_ready;
  wire  AXI4Fragmenter_1_io_out_0_w_valid;
  wire [63:0] AXI4Fragmenter_1_io_out_0_w_bits_data;
  wire [7:0] AXI4Fragmenter_1_io_out_0_w_bits_strb;
  wire  AXI4Fragmenter_1_io_out_0_w_bits_last;
  wire  AXI4Fragmenter_1_io_out_0_b_ready;
  wire  AXI4Fragmenter_1_io_out_0_b_valid;
  wire [3:0] AXI4Fragmenter_1_io_out_0_b_bits_id;
  wire [1:0] AXI4Fragmenter_1_io_out_0_b_bits_resp;
  wire  AXI4Fragmenter_1_io_out_0_ar_ready;
  wire  AXI4Fragmenter_1_io_out_0_ar_valid;
  wire [3:0] AXI4Fragmenter_1_io_out_0_ar_bits_id;
  wire [27:0] AXI4Fragmenter_1_io_out_0_ar_bits_addr;
  wire [7:0] AXI4Fragmenter_1_io_out_0_ar_bits_len;
  wire [2:0] AXI4Fragmenter_1_io_out_0_ar_bits_size;
  wire [1:0] AXI4Fragmenter_1_io_out_0_ar_bits_burst;
  wire  AXI4Fragmenter_1_io_out_0_ar_bits_lock;
  wire [3:0] AXI4Fragmenter_1_io_out_0_ar_bits_cache;
  wire [2:0] AXI4Fragmenter_1_io_out_0_ar_bits_prot;
  wire [3:0] AXI4Fragmenter_1_io_out_0_ar_bits_qos;
  wire  AXI4Fragmenter_1_io_out_0_r_ready;
  wire  AXI4Fragmenter_1_io_out_0_r_valid;
  wire [3:0] AXI4Fragmenter_1_io_out_0_r_bits_id;
  wire [63:0] AXI4Fragmenter_1_io_out_0_r_bits_data;
  wire [1:0] AXI4Fragmenter_1_io_out_0_r_bits_resp;
  wire  AXI4Fragmenter_1_io_out_0_r_bits_last;
  wire  AXI4Buffer_1_clock;
  wire  AXI4Buffer_1_reset;
  wire  AXI4Buffer_1_io_in_0_aw_ready;
  wire  AXI4Buffer_1_io_in_0_aw_valid;
  wire [3:0] AXI4Buffer_1_io_in_0_aw_bits_id;
  wire [27:0] AXI4Buffer_1_io_in_0_aw_bits_addr;
  wire [7:0] AXI4Buffer_1_io_in_0_aw_bits_len;
  wire [2:0] AXI4Buffer_1_io_in_0_aw_bits_size;
  wire [1:0] AXI4Buffer_1_io_in_0_aw_bits_burst;
  wire  AXI4Buffer_1_io_in_0_aw_bits_lock;
  wire [3:0] AXI4Buffer_1_io_in_0_aw_bits_cache;
  wire [2:0] AXI4Buffer_1_io_in_0_aw_bits_prot;
  wire [3:0] AXI4Buffer_1_io_in_0_aw_bits_qos;
  wire  AXI4Buffer_1_io_in_0_w_ready;
  wire  AXI4Buffer_1_io_in_0_w_valid;
  wire [63:0] AXI4Buffer_1_io_in_0_w_bits_data;
  wire [7:0] AXI4Buffer_1_io_in_0_w_bits_strb;
  wire  AXI4Buffer_1_io_in_0_w_bits_last;
  wire  AXI4Buffer_1_io_in_0_b_ready;
  wire  AXI4Buffer_1_io_in_0_b_valid;
  wire [3:0] AXI4Buffer_1_io_in_0_b_bits_id;
  wire [1:0] AXI4Buffer_1_io_in_0_b_bits_resp;
  wire  AXI4Buffer_1_io_in_0_ar_ready;
  wire  AXI4Buffer_1_io_in_0_ar_valid;
  wire [3:0] AXI4Buffer_1_io_in_0_ar_bits_id;
  wire [27:0] AXI4Buffer_1_io_in_0_ar_bits_addr;
  wire [7:0] AXI4Buffer_1_io_in_0_ar_bits_len;
  wire [2:0] AXI4Buffer_1_io_in_0_ar_bits_size;
  wire [1:0] AXI4Buffer_1_io_in_0_ar_bits_burst;
  wire  AXI4Buffer_1_io_in_0_ar_bits_lock;
  wire [3:0] AXI4Buffer_1_io_in_0_ar_bits_cache;
  wire [2:0] AXI4Buffer_1_io_in_0_ar_bits_prot;
  wire [3:0] AXI4Buffer_1_io_in_0_ar_bits_qos;
  wire  AXI4Buffer_1_io_in_0_r_ready;
  wire  AXI4Buffer_1_io_in_0_r_valid;
  wire [3:0] AXI4Buffer_1_io_in_0_r_bits_id;
  wire [63:0] AXI4Buffer_1_io_in_0_r_bits_data;
  wire [1:0] AXI4Buffer_1_io_in_0_r_bits_resp;
  wire  AXI4Buffer_1_io_in_0_r_bits_last;
  wire  AXI4Buffer_1_io_out_0_aw_ready;
  wire  AXI4Buffer_1_io_out_0_aw_valid;
  wire [3:0] AXI4Buffer_1_io_out_0_aw_bits_id;
  wire [27:0] AXI4Buffer_1_io_out_0_aw_bits_addr;
  wire [7:0] AXI4Buffer_1_io_out_0_aw_bits_len;
  wire [2:0] AXI4Buffer_1_io_out_0_aw_bits_size;
  wire [1:0] AXI4Buffer_1_io_out_0_aw_bits_burst;
  wire  AXI4Buffer_1_io_out_0_aw_bits_lock;
  wire [3:0] AXI4Buffer_1_io_out_0_aw_bits_cache;
  wire [2:0] AXI4Buffer_1_io_out_0_aw_bits_prot;
  wire [3:0] AXI4Buffer_1_io_out_0_aw_bits_qos;
  wire  AXI4Buffer_1_io_out_0_w_ready;
  wire  AXI4Buffer_1_io_out_0_w_valid;
  wire [63:0] AXI4Buffer_1_io_out_0_w_bits_data;
  wire [7:0] AXI4Buffer_1_io_out_0_w_bits_strb;
  wire  AXI4Buffer_1_io_out_0_w_bits_last;
  wire  AXI4Buffer_1_io_out_0_b_ready;
  wire  AXI4Buffer_1_io_out_0_b_valid;
  wire [3:0] AXI4Buffer_1_io_out_0_b_bits_id;
  wire [1:0] AXI4Buffer_1_io_out_0_b_bits_resp;
  wire  AXI4Buffer_1_io_out_0_ar_ready;
  wire  AXI4Buffer_1_io_out_0_ar_valid;
  wire [3:0] AXI4Buffer_1_io_out_0_ar_bits_id;
  wire [27:0] AXI4Buffer_1_io_out_0_ar_bits_addr;
  wire [7:0] AXI4Buffer_1_io_out_0_ar_bits_len;
  wire [2:0] AXI4Buffer_1_io_out_0_ar_bits_size;
  wire [1:0] AXI4Buffer_1_io_out_0_ar_bits_burst;
  wire  AXI4Buffer_1_io_out_0_ar_bits_lock;
  wire [3:0] AXI4Buffer_1_io_out_0_ar_bits_cache;
  wire [2:0] AXI4Buffer_1_io_out_0_ar_bits_prot;
  wire [3:0] AXI4Buffer_1_io_out_0_ar_bits_qos;
  wire  AXI4Buffer_1_io_out_0_r_ready;
  wire  AXI4Buffer_1_io_out_0_r_valid;
  wire [3:0] AXI4Buffer_1_io_out_0_r_bits_id;
  wire [63:0] AXI4Buffer_1_io_out_0_r_bits_data;
  wire [1:0] AXI4Buffer_1_io_out_0_r_bits_resp;
  wire  AXI4Buffer_1_io_out_0_r_bits_last;
  AXI4RAM_sram sram (
    .clock(sram_clock),
    .reset(sram_reset),
    .io_in_0_aw_ready(sram_io_in_0_aw_ready),
    .io_in_0_aw_valid(sram_io_in_0_aw_valid),
    .io_in_0_aw_bits_id(sram_io_in_0_aw_bits_id),
    .io_in_0_aw_bits_addr(sram_io_in_0_aw_bits_addr),
    .io_in_0_aw_bits_len(sram_io_in_0_aw_bits_len),
    .io_in_0_aw_bits_size(sram_io_in_0_aw_bits_size),
    .io_in_0_aw_bits_burst(sram_io_in_0_aw_bits_burst),
    .io_in_0_aw_bits_lock(sram_io_in_0_aw_bits_lock),
    .io_in_0_aw_bits_cache(sram_io_in_0_aw_bits_cache),
    .io_in_0_aw_bits_prot(sram_io_in_0_aw_bits_prot),
    .io_in_0_aw_bits_qos(sram_io_in_0_aw_bits_qos),
    .io_in_0_w_ready(sram_io_in_0_w_ready),
    .io_in_0_w_valid(sram_io_in_0_w_valid),
    .io_in_0_w_bits_data(sram_io_in_0_w_bits_data),
    .io_in_0_w_bits_strb(sram_io_in_0_w_bits_strb),
    .io_in_0_w_bits_last(sram_io_in_0_w_bits_last),
    .io_in_0_b_ready(sram_io_in_0_b_ready),
    .io_in_0_b_valid(sram_io_in_0_b_valid),
    .io_in_0_b_bits_id(sram_io_in_0_b_bits_id),
    .io_in_0_b_bits_resp(sram_io_in_0_b_bits_resp),
    .io_in_0_ar_ready(sram_io_in_0_ar_ready),
    .io_in_0_ar_valid(sram_io_in_0_ar_valid),
    .io_in_0_ar_bits_id(sram_io_in_0_ar_bits_id),
    .io_in_0_ar_bits_addr(sram_io_in_0_ar_bits_addr),
    .io_in_0_ar_bits_len(sram_io_in_0_ar_bits_len),
    .io_in_0_ar_bits_size(sram_io_in_0_ar_bits_size),
    .io_in_0_ar_bits_burst(sram_io_in_0_ar_bits_burst),
    .io_in_0_ar_bits_lock(sram_io_in_0_ar_bits_lock),
    .io_in_0_ar_bits_cache(sram_io_in_0_ar_bits_cache),
    .io_in_0_ar_bits_prot(sram_io_in_0_ar_bits_prot),
    .io_in_0_ar_bits_qos(sram_io_in_0_ar_bits_qos),
    .io_in_0_r_ready(sram_io_in_0_r_ready),
    .io_in_0_r_valid(sram_io_in_0_r_valid),
    .io_in_0_r_bits_id(sram_io_in_0_r_bits_id),
    .io_in_0_r_bits_data(sram_io_in_0_r_bits_data),
    .io_in_0_r_bits_resp(sram_io_in_0_r_bits_resp),
    .io_in_0_r_bits_last(sram_io_in_0_r_bits_last)
  );
  AXI4Fragmenter AXI4Fragmenter_1 (
    .clock(AXI4Fragmenter_1_clock),
    .reset(AXI4Fragmenter_1_reset),
    .io_in_0_aw_ready(AXI4Fragmenter_1_io_in_0_aw_ready),
    .io_in_0_aw_valid(AXI4Fragmenter_1_io_in_0_aw_valid),
    .io_in_0_aw_bits_id(AXI4Fragmenter_1_io_in_0_aw_bits_id),
    .io_in_0_aw_bits_addr(AXI4Fragmenter_1_io_in_0_aw_bits_addr),
    .io_in_0_aw_bits_len(AXI4Fragmenter_1_io_in_0_aw_bits_len),
    .io_in_0_aw_bits_size(AXI4Fragmenter_1_io_in_0_aw_bits_size),
    .io_in_0_aw_bits_burst(AXI4Fragmenter_1_io_in_0_aw_bits_burst),
    .io_in_0_aw_bits_lock(AXI4Fragmenter_1_io_in_0_aw_bits_lock),
    .io_in_0_aw_bits_cache(AXI4Fragmenter_1_io_in_0_aw_bits_cache),
    .io_in_0_aw_bits_prot(AXI4Fragmenter_1_io_in_0_aw_bits_prot),
    .io_in_0_aw_bits_qos(AXI4Fragmenter_1_io_in_0_aw_bits_qos),
    .io_in_0_w_ready(AXI4Fragmenter_1_io_in_0_w_ready),
    .io_in_0_w_valid(AXI4Fragmenter_1_io_in_0_w_valid),
    .io_in_0_w_bits_data(AXI4Fragmenter_1_io_in_0_w_bits_data),
    .io_in_0_w_bits_strb(AXI4Fragmenter_1_io_in_0_w_bits_strb),
    .io_in_0_w_bits_last(AXI4Fragmenter_1_io_in_0_w_bits_last),
    .io_in_0_b_ready(AXI4Fragmenter_1_io_in_0_b_ready),
    .io_in_0_b_valid(AXI4Fragmenter_1_io_in_0_b_valid),
    .io_in_0_b_bits_id(AXI4Fragmenter_1_io_in_0_b_bits_id),
    .io_in_0_b_bits_resp(AXI4Fragmenter_1_io_in_0_b_bits_resp),
    .io_in_0_ar_ready(AXI4Fragmenter_1_io_in_0_ar_ready),
    .io_in_0_ar_valid(AXI4Fragmenter_1_io_in_0_ar_valid),
    .io_in_0_ar_bits_id(AXI4Fragmenter_1_io_in_0_ar_bits_id),
    .io_in_0_ar_bits_addr(AXI4Fragmenter_1_io_in_0_ar_bits_addr),
    .io_in_0_ar_bits_len(AXI4Fragmenter_1_io_in_0_ar_bits_len),
    .io_in_0_ar_bits_size(AXI4Fragmenter_1_io_in_0_ar_bits_size),
    .io_in_0_ar_bits_burst(AXI4Fragmenter_1_io_in_0_ar_bits_burst),
    .io_in_0_ar_bits_lock(AXI4Fragmenter_1_io_in_0_ar_bits_lock),
    .io_in_0_ar_bits_cache(AXI4Fragmenter_1_io_in_0_ar_bits_cache),
    .io_in_0_ar_bits_prot(AXI4Fragmenter_1_io_in_0_ar_bits_prot),
    .io_in_0_ar_bits_qos(AXI4Fragmenter_1_io_in_0_ar_bits_qos),
    .io_in_0_r_ready(AXI4Fragmenter_1_io_in_0_r_ready),
    .io_in_0_r_valid(AXI4Fragmenter_1_io_in_0_r_valid),
    .io_in_0_r_bits_id(AXI4Fragmenter_1_io_in_0_r_bits_id),
    .io_in_0_r_bits_data(AXI4Fragmenter_1_io_in_0_r_bits_data),
    .io_in_0_r_bits_resp(AXI4Fragmenter_1_io_in_0_r_bits_resp),
    .io_in_0_r_bits_last(AXI4Fragmenter_1_io_in_0_r_bits_last),
    .io_out_0_aw_ready(AXI4Fragmenter_1_io_out_0_aw_ready),
    .io_out_0_aw_valid(AXI4Fragmenter_1_io_out_0_aw_valid),
    .io_out_0_aw_bits_id(AXI4Fragmenter_1_io_out_0_aw_bits_id),
    .io_out_0_aw_bits_addr(AXI4Fragmenter_1_io_out_0_aw_bits_addr),
    .io_out_0_aw_bits_len(AXI4Fragmenter_1_io_out_0_aw_bits_len),
    .io_out_0_aw_bits_size(AXI4Fragmenter_1_io_out_0_aw_bits_size),
    .io_out_0_aw_bits_burst(AXI4Fragmenter_1_io_out_0_aw_bits_burst),
    .io_out_0_aw_bits_lock(AXI4Fragmenter_1_io_out_0_aw_bits_lock),
    .io_out_0_aw_bits_cache(AXI4Fragmenter_1_io_out_0_aw_bits_cache),
    .io_out_0_aw_bits_prot(AXI4Fragmenter_1_io_out_0_aw_bits_prot),
    .io_out_0_aw_bits_qos(AXI4Fragmenter_1_io_out_0_aw_bits_qos),
    .io_out_0_w_ready(AXI4Fragmenter_1_io_out_0_w_ready),
    .io_out_0_w_valid(AXI4Fragmenter_1_io_out_0_w_valid),
    .io_out_0_w_bits_data(AXI4Fragmenter_1_io_out_0_w_bits_data),
    .io_out_0_w_bits_strb(AXI4Fragmenter_1_io_out_0_w_bits_strb),
    .io_out_0_w_bits_last(AXI4Fragmenter_1_io_out_0_w_bits_last),
    .io_out_0_b_ready(AXI4Fragmenter_1_io_out_0_b_ready),
    .io_out_0_b_valid(AXI4Fragmenter_1_io_out_0_b_valid),
    .io_out_0_b_bits_id(AXI4Fragmenter_1_io_out_0_b_bits_id),
    .io_out_0_b_bits_resp(AXI4Fragmenter_1_io_out_0_b_bits_resp),
    .io_out_0_ar_ready(AXI4Fragmenter_1_io_out_0_ar_ready),
    .io_out_0_ar_valid(AXI4Fragmenter_1_io_out_0_ar_valid),
    .io_out_0_ar_bits_id(AXI4Fragmenter_1_io_out_0_ar_bits_id),
    .io_out_0_ar_bits_addr(AXI4Fragmenter_1_io_out_0_ar_bits_addr),
    .io_out_0_ar_bits_len(AXI4Fragmenter_1_io_out_0_ar_bits_len),
    .io_out_0_ar_bits_size(AXI4Fragmenter_1_io_out_0_ar_bits_size),
    .io_out_0_ar_bits_burst(AXI4Fragmenter_1_io_out_0_ar_bits_burst),
    .io_out_0_ar_bits_lock(AXI4Fragmenter_1_io_out_0_ar_bits_lock),
    .io_out_0_ar_bits_cache(AXI4Fragmenter_1_io_out_0_ar_bits_cache),
    .io_out_0_ar_bits_prot(AXI4Fragmenter_1_io_out_0_ar_bits_prot),
    .io_out_0_ar_bits_qos(AXI4Fragmenter_1_io_out_0_ar_bits_qos),
    .io_out_0_r_ready(AXI4Fragmenter_1_io_out_0_r_ready),
    .io_out_0_r_valid(AXI4Fragmenter_1_io_out_0_r_valid),
    .io_out_0_r_bits_id(AXI4Fragmenter_1_io_out_0_r_bits_id),
    .io_out_0_r_bits_data(AXI4Fragmenter_1_io_out_0_r_bits_data),
    .io_out_0_r_bits_resp(AXI4Fragmenter_1_io_out_0_r_bits_resp),
    .io_out_0_r_bits_last(AXI4Fragmenter_1_io_out_0_r_bits_last)
  );
  AXI4Buffer AXI4Buffer_1 (
    .clock(AXI4Buffer_1_clock),
    .reset(AXI4Buffer_1_reset),
    .io_in_0_aw_ready(AXI4Buffer_1_io_in_0_aw_ready),
    .io_in_0_aw_valid(AXI4Buffer_1_io_in_0_aw_valid),
    .io_in_0_aw_bits_id(AXI4Buffer_1_io_in_0_aw_bits_id),
    .io_in_0_aw_bits_addr(AXI4Buffer_1_io_in_0_aw_bits_addr),
    .io_in_0_aw_bits_len(AXI4Buffer_1_io_in_0_aw_bits_len),
    .io_in_0_aw_bits_size(AXI4Buffer_1_io_in_0_aw_bits_size),
    .io_in_0_aw_bits_burst(AXI4Buffer_1_io_in_0_aw_bits_burst),
    .io_in_0_aw_bits_lock(AXI4Buffer_1_io_in_0_aw_bits_lock),
    .io_in_0_aw_bits_cache(AXI4Buffer_1_io_in_0_aw_bits_cache),
    .io_in_0_aw_bits_prot(AXI4Buffer_1_io_in_0_aw_bits_prot),
    .io_in_0_aw_bits_qos(AXI4Buffer_1_io_in_0_aw_bits_qos),
    .io_in_0_w_ready(AXI4Buffer_1_io_in_0_w_ready),
    .io_in_0_w_valid(AXI4Buffer_1_io_in_0_w_valid),
    .io_in_0_w_bits_data(AXI4Buffer_1_io_in_0_w_bits_data),
    .io_in_0_w_bits_strb(AXI4Buffer_1_io_in_0_w_bits_strb),
    .io_in_0_w_bits_last(AXI4Buffer_1_io_in_0_w_bits_last),
    .io_in_0_b_ready(AXI4Buffer_1_io_in_0_b_ready),
    .io_in_0_b_valid(AXI4Buffer_1_io_in_0_b_valid),
    .io_in_0_b_bits_id(AXI4Buffer_1_io_in_0_b_bits_id),
    .io_in_0_b_bits_resp(AXI4Buffer_1_io_in_0_b_bits_resp),
    .io_in_0_ar_ready(AXI4Buffer_1_io_in_0_ar_ready),
    .io_in_0_ar_valid(AXI4Buffer_1_io_in_0_ar_valid),
    .io_in_0_ar_bits_id(AXI4Buffer_1_io_in_0_ar_bits_id),
    .io_in_0_ar_bits_addr(AXI4Buffer_1_io_in_0_ar_bits_addr),
    .io_in_0_ar_bits_len(AXI4Buffer_1_io_in_0_ar_bits_len),
    .io_in_0_ar_bits_size(AXI4Buffer_1_io_in_0_ar_bits_size),
    .io_in_0_ar_bits_burst(AXI4Buffer_1_io_in_0_ar_bits_burst),
    .io_in_0_ar_bits_lock(AXI4Buffer_1_io_in_0_ar_bits_lock),
    .io_in_0_ar_bits_cache(AXI4Buffer_1_io_in_0_ar_bits_cache),
    .io_in_0_ar_bits_prot(AXI4Buffer_1_io_in_0_ar_bits_prot),
    .io_in_0_ar_bits_qos(AXI4Buffer_1_io_in_0_ar_bits_qos),
    .io_in_0_r_ready(AXI4Buffer_1_io_in_0_r_ready),
    .io_in_0_r_valid(AXI4Buffer_1_io_in_0_r_valid),
    .io_in_0_r_bits_id(AXI4Buffer_1_io_in_0_r_bits_id),
    .io_in_0_r_bits_data(AXI4Buffer_1_io_in_0_r_bits_data),
    .io_in_0_r_bits_resp(AXI4Buffer_1_io_in_0_r_bits_resp),
    .io_in_0_r_bits_last(AXI4Buffer_1_io_in_0_r_bits_last),
    .io_out_0_aw_ready(AXI4Buffer_1_io_out_0_aw_ready),
    .io_out_0_aw_valid(AXI4Buffer_1_io_out_0_aw_valid),
    .io_out_0_aw_bits_id(AXI4Buffer_1_io_out_0_aw_bits_id),
    .io_out_0_aw_bits_addr(AXI4Buffer_1_io_out_0_aw_bits_addr),
    .io_out_0_aw_bits_len(AXI4Buffer_1_io_out_0_aw_bits_len),
    .io_out_0_aw_bits_size(AXI4Buffer_1_io_out_0_aw_bits_size),
    .io_out_0_aw_bits_burst(AXI4Buffer_1_io_out_0_aw_bits_burst),
    .io_out_0_aw_bits_lock(AXI4Buffer_1_io_out_0_aw_bits_lock),
    .io_out_0_aw_bits_cache(AXI4Buffer_1_io_out_0_aw_bits_cache),
    .io_out_0_aw_bits_prot(AXI4Buffer_1_io_out_0_aw_bits_prot),
    .io_out_0_aw_bits_qos(AXI4Buffer_1_io_out_0_aw_bits_qos),
    .io_out_0_w_ready(AXI4Buffer_1_io_out_0_w_ready),
    .io_out_0_w_valid(AXI4Buffer_1_io_out_0_w_valid),
    .io_out_0_w_bits_data(AXI4Buffer_1_io_out_0_w_bits_data),
    .io_out_0_w_bits_strb(AXI4Buffer_1_io_out_0_w_bits_strb),
    .io_out_0_w_bits_last(AXI4Buffer_1_io_out_0_w_bits_last),
    .io_out_0_b_ready(AXI4Buffer_1_io_out_0_b_ready),
    .io_out_0_b_valid(AXI4Buffer_1_io_out_0_b_valid),
    .io_out_0_b_bits_id(AXI4Buffer_1_io_out_0_b_bits_id),
    .io_out_0_b_bits_resp(AXI4Buffer_1_io_out_0_b_bits_resp),
    .io_out_0_ar_ready(AXI4Buffer_1_io_out_0_ar_ready),
    .io_out_0_ar_valid(AXI4Buffer_1_io_out_0_ar_valid),
    .io_out_0_ar_bits_id(AXI4Buffer_1_io_out_0_ar_bits_id),
    .io_out_0_ar_bits_addr(AXI4Buffer_1_io_out_0_ar_bits_addr),
    .io_out_0_ar_bits_len(AXI4Buffer_1_io_out_0_ar_bits_len),
    .io_out_0_ar_bits_size(AXI4Buffer_1_io_out_0_ar_bits_size),
    .io_out_0_ar_bits_burst(AXI4Buffer_1_io_out_0_ar_bits_burst),
    .io_out_0_ar_bits_lock(AXI4Buffer_1_io_out_0_ar_bits_lock),
    .io_out_0_ar_bits_cache(AXI4Buffer_1_io_out_0_ar_bits_cache),
    .io_out_0_ar_bits_prot(AXI4Buffer_1_io_out_0_ar_bits_prot),
    .io_out_0_ar_bits_qos(AXI4Buffer_1_io_out_0_ar_bits_qos),
    .io_out_0_r_ready(AXI4Buffer_1_io_out_0_r_ready),
    .io_out_0_r_valid(AXI4Buffer_1_io_out_0_r_valid),
    .io_out_0_r_bits_id(AXI4Buffer_1_io_out_0_r_bits_id),
    .io_out_0_r_bits_data(AXI4Buffer_1_io_out_0_r_bits_data),
    .io_out_0_r_bits_resp(AXI4Buffer_1_io_out_0_r_bits_resp),
    .io_out_0_r_bits_last(AXI4Buffer_1_io_out_0_r_bits_last)
  );
  assign io_axi4_0_awready = AXI4Fragmenter_1_io_in_0_aw_ready;
  assign io_axi4_0_wready = AXI4Fragmenter_1_io_in_0_w_ready;
  assign io_axi4_0_bvalid = AXI4Fragmenter_1_io_in_0_b_valid;
  assign io_axi4_0_bid = AXI4Fragmenter_1_io_in_0_b_bits_id;
  assign io_axi4_0_bresp = AXI4Fragmenter_1_io_in_0_b_bits_resp;
  assign io_axi4_0_arready = AXI4Fragmenter_1_io_in_0_ar_ready;
  assign io_axi4_0_rvalid = AXI4Fragmenter_1_io_in_0_r_valid;
  assign io_axi4_0_rid = AXI4Fragmenter_1_io_in_0_r_bits_id;
  assign io_axi4_0_rdata = AXI4Fragmenter_1_io_in_0_r_bits_data;
  assign io_axi4_0_rresp = AXI4Fragmenter_1_io_in_0_r_bits_resp;
  assign io_axi4_0_rlast = AXI4Fragmenter_1_io_in_0_r_bits_last;
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_in_0_aw_valid = AXI4Buffer_1_io_out_0_aw_valid;
  assign sram_io_in_0_aw_bits_id = AXI4Buffer_1_io_out_0_aw_bits_id;
  assign sram_io_in_0_aw_bits_addr = AXI4Buffer_1_io_out_0_aw_bits_addr;
  assign sram_io_in_0_aw_bits_len = AXI4Buffer_1_io_out_0_aw_bits_len;
  assign sram_io_in_0_aw_bits_size = AXI4Buffer_1_io_out_0_aw_bits_size;
  assign sram_io_in_0_aw_bits_burst = AXI4Buffer_1_io_out_0_aw_bits_burst;
  assign sram_io_in_0_aw_bits_lock = AXI4Buffer_1_io_out_0_aw_bits_lock;
  assign sram_io_in_0_aw_bits_cache = AXI4Buffer_1_io_out_0_aw_bits_cache;
  assign sram_io_in_0_aw_bits_prot = AXI4Buffer_1_io_out_0_aw_bits_prot;
  assign sram_io_in_0_aw_bits_qos = AXI4Buffer_1_io_out_0_aw_bits_qos;
  assign sram_io_in_0_w_valid = AXI4Buffer_1_io_out_0_w_valid;
  assign sram_io_in_0_w_bits_data = AXI4Buffer_1_io_out_0_w_bits_data;
  assign sram_io_in_0_w_bits_strb = AXI4Buffer_1_io_out_0_w_bits_strb;
  assign sram_io_in_0_w_bits_last = AXI4Buffer_1_io_out_0_w_bits_last;
  assign sram_io_in_0_b_ready = AXI4Buffer_1_io_out_0_b_ready;
  assign sram_io_in_0_ar_valid = AXI4Buffer_1_io_out_0_ar_valid;
  assign sram_io_in_0_ar_bits_id = AXI4Buffer_1_io_out_0_ar_bits_id;
  assign sram_io_in_0_ar_bits_addr = AXI4Buffer_1_io_out_0_ar_bits_addr;
  assign sram_io_in_0_ar_bits_len = AXI4Buffer_1_io_out_0_ar_bits_len;
  assign sram_io_in_0_ar_bits_size = AXI4Buffer_1_io_out_0_ar_bits_size;
  assign sram_io_in_0_ar_bits_burst = AXI4Buffer_1_io_out_0_ar_bits_burst;
  assign sram_io_in_0_ar_bits_lock = AXI4Buffer_1_io_out_0_ar_bits_lock;
  assign sram_io_in_0_ar_bits_cache = AXI4Buffer_1_io_out_0_ar_bits_cache;
  assign sram_io_in_0_ar_bits_prot = AXI4Buffer_1_io_out_0_ar_bits_prot;
  assign sram_io_in_0_ar_bits_qos = AXI4Buffer_1_io_out_0_ar_bits_qos;
  assign sram_io_in_0_r_ready = AXI4Buffer_1_io_out_0_r_ready;
  assign AXI4Fragmenter_1_clock = clock;
  assign AXI4Fragmenter_1_reset = reset;
  assign AXI4Fragmenter_1_io_in_0_aw_valid = io_axi4_0_awvalid;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_id = io_axi4_0_awid;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_addr = io_axi4_0_awaddr;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_len = io_axi4_0_awlen;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_size = io_axi4_0_awsize;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_burst = io_axi4_0_awburst;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_lock = io_axi4_0_awlock;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_cache = io_axi4_0_awcache;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_prot = io_axi4_0_awprot;
  assign AXI4Fragmenter_1_io_in_0_aw_bits_qos = io_axi4_0_awqos;
  assign AXI4Fragmenter_1_io_in_0_w_valid = io_axi4_0_wvalid;
  assign AXI4Fragmenter_1_io_in_0_w_bits_data = io_axi4_0_wdata;
  assign AXI4Fragmenter_1_io_in_0_w_bits_strb = io_axi4_0_wstrb;
  assign AXI4Fragmenter_1_io_in_0_w_bits_last = io_axi4_0_wlast;
  assign AXI4Fragmenter_1_io_in_0_b_ready = io_axi4_0_bready;
  assign AXI4Fragmenter_1_io_in_0_ar_valid = io_axi4_0_arvalid;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_id = io_axi4_0_arid;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_addr = io_axi4_0_araddr;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_len = io_axi4_0_arlen;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_size = io_axi4_0_arsize;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_burst = io_axi4_0_arburst;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_lock = io_axi4_0_arlock;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_cache = io_axi4_0_arcache;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_prot = io_axi4_0_arprot;
  assign AXI4Fragmenter_1_io_in_0_ar_bits_qos = io_axi4_0_arqos;
  assign AXI4Fragmenter_1_io_in_0_r_ready = io_axi4_0_rready;
  assign AXI4Fragmenter_1_io_out_0_aw_ready = AXI4Buffer_1_io_in_0_aw_ready;
  assign AXI4Fragmenter_1_io_out_0_w_ready = AXI4Buffer_1_io_in_0_w_ready;
  assign AXI4Fragmenter_1_io_out_0_b_valid = AXI4Buffer_1_io_in_0_b_valid;
  assign AXI4Fragmenter_1_io_out_0_b_bits_id = AXI4Buffer_1_io_in_0_b_bits_id;
  assign AXI4Fragmenter_1_io_out_0_b_bits_resp = AXI4Buffer_1_io_in_0_b_bits_resp;
  assign AXI4Fragmenter_1_io_out_0_ar_ready = AXI4Buffer_1_io_in_0_ar_ready;
  assign AXI4Fragmenter_1_io_out_0_r_valid = AXI4Buffer_1_io_in_0_r_valid;
  assign AXI4Fragmenter_1_io_out_0_r_bits_id = AXI4Buffer_1_io_in_0_r_bits_id;
  assign AXI4Fragmenter_1_io_out_0_r_bits_data = AXI4Buffer_1_io_in_0_r_bits_data;
  assign AXI4Fragmenter_1_io_out_0_r_bits_resp = AXI4Buffer_1_io_in_0_r_bits_resp;
  assign AXI4Fragmenter_1_io_out_0_r_bits_last = AXI4Buffer_1_io_in_0_r_bits_last;
  assign AXI4Buffer_1_clock = clock;
  assign AXI4Buffer_1_reset = reset;
  assign AXI4Buffer_1_io_in_0_aw_valid = AXI4Fragmenter_1_io_out_0_aw_valid;
  assign AXI4Buffer_1_io_in_0_aw_bits_id = AXI4Fragmenter_1_io_out_0_aw_bits_id;
  assign AXI4Buffer_1_io_in_0_aw_bits_addr = AXI4Fragmenter_1_io_out_0_aw_bits_addr;
  assign AXI4Buffer_1_io_in_0_aw_bits_len = AXI4Fragmenter_1_io_out_0_aw_bits_len;
  assign AXI4Buffer_1_io_in_0_aw_bits_size = AXI4Fragmenter_1_io_out_0_aw_bits_size;
  assign AXI4Buffer_1_io_in_0_aw_bits_burst = AXI4Fragmenter_1_io_out_0_aw_bits_burst;
  assign AXI4Buffer_1_io_in_0_aw_bits_lock = AXI4Fragmenter_1_io_out_0_aw_bits_lock;
  assign AXI4Buffer_1_io_in_0_aw_bits_cache = AXI4Fragmenter_1_io_out_0_aw_bits_cache;
  assign AXI4Buffer_1_io_in_0_aw_bits_prot = AXI4Fragmenter_1_io_out_0_aw_bits_prot;
  assign AXI4Buffer_1_io_in_0_aw_bits_qos = AXI4Fragmenter_1_io_out_0_aw_bits_qos;
  assign AXI4Buffer_1_io_in_0_w_valid = AXI4Fragmenter_1_io_out_0_w_valid;
  assign AXI4Buffer_1_io_in_0_w_bits_data = AXI4Fragmenter_1_io_out_0_w_bits_data;
  assign AXI4Buffer_1_io_in_0_w_bits_strb = AXI4Fragmenter_1_io_out_0_w_bits_strb;
  assign AXI4Buffer_1_io_in_0_w_bits_last = AXI4Fragmenter_1_io_out_0_w_bits_last;
  assign AXI4Buffer_1_io_in_0_b_ready = AXI4Fragmenter_1_io_out_0_b_ready;
  assign AXI4Buffer_1_io_in_0_ar_valid = AXI4Fragmenter_1_io_out_0_ar_valid;
  assign AXI4Buffer_1_io_in_0_ar_bits_id = AXI4Fragmenter_1_io_out_0_ar_bits_id;
  assign AXI4Buffer_1_io_in_0_ar_bits_addr = AXI4Fragmenter_1_io_out_0_ar_bits_addr;
  assign AXI4Buffer_1_io_in_0_ar_bits_len = AXI4Fragmenter_1_io_out_0_ar_bits_len;
  assign AXI4Buffer_1_io_in_0_ar_bits_size = AXI4Fragmenter_1_io_out_0_ar_bits_size;
  assign AXI4Buffer_1_io_in_0_ar_bits_burst = AXI4Fragmenter_1_io_out_0_ar_bits_burst;
  assign AXI4Buffer_1_io_in_0_ar_bits_lock = AXI4Fragmenter_1_io_out_0_ar_bits_lock;
  assign AXI4Buffer_1_io_in_0_ar_bits_cache = AXI4Fragmenter_1_io_out_0_ar_bits_cache;
  assign AXI4Buffer_1_io_in_0_ar_bits_prot = AXI4Fragmenter_1_io_out_0_ar_bits_prot;
  assign AXI4Buffer_1_io_in_0_ar_bits_qos = AXI4Fragmenter_1_io_out_0_ar_bits_qos;
  assign AXI4Buffer_1_io_in_0_r_ready = AXI4Fragmenter_1_io_out_0_r_ready;
  assign AXI4Buffer_1_io_out_0_aw_ready = sram_io_in_0_aw_ready;
  assign AXI4Buffer_1_io_out_0_w_ready = sram_io_in_0_w_ready;
  assign AXI4Buffer_1_io_out_0_b_valid = sram_io_in_0_b_valid;
  assign AXI4Buffer_1_io_out_0_b_bits_id = sram_io_in_0_b_bits_id;
  assign AXI4Buffer_1_io_out_0_b_bits_resp = sram_io_in_0_b_bits_resp;
  assign AXI4Buffer_1_io_out_0_ar_ready = sram_io_in_0_ar_ready;
  assign AXI4Buffer_1_io_out_0_r_valid = sram_io_in_0_r_valid;
  assign AXI4Buffer_1_io_out_0_r_bits_id = sram_io_in_0_r_bits_id;
  assign AXI4Buffer_1_io_out_0_r_bits_data = sram_io_in_0_r_bits_data;
  assign AXI4Buffer_1_io_out_0_r_bits_resp = sram_io_in_0_r_bits_resp;
  assign AXI4Buffer_1_io_out_0_r_bits_last = sram_io_in_0_r_bits_last;
endmodule
