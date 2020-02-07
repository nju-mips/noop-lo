module UARTRx(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in,
  output        io_out_valid,
  output [7:0]  io_out_bits,
  input  [15:0] io_div
);
  reg [1:0] debounce;
  reg [31:0] _GEN_7;
  wire  debounce_max;
  wire  debounce_min;
  reg [11:0] prescaler;
  reg [31:0] _GEN_20;
  wire  start;
  wire  busy;
  wire  _T_25;
  wire  pulse;
  wire [12:0] _T_27;
  wire [12:0] _T_28;
  wire [11:0] _T_29;
  wire [11:0] _GEN_0;
  wire  _T_30;
  wire [11:0] _T_31;
  wire [11:0] _GEN_1;
  reg [2:0] sample;
  reg [31:0] _GEN_23;
  wire  _T_33;
  wire  _T_34;
  wire  _T_35;
  wire  _T_36;
  wire  _T_37;
  wire  _T_38;
  wire  _T_39;
  wire  voter;
  wire [3:0] _T_40;
  wire [3:0] _GEN_2;
  reg [4:0] timer;
  reg [31:0] _GEN_28;
  reg [3:0] counter;
  reg [31:0] _GEN_43;
  reg [7:0] shifter;
  reg [31:0] _GEN_44;
  wire  _T_45;
  wire  expire;
  wire  sched;
  wire [5:0] _T_49;
  wire [5:0] _T_50;
  wire [4:0] _T_51;
  wire [4:0] _GEN_3;
  wire [4:0] _GEN_4;
  reg  valid;
  reg [31:0] _GEN_45;
  reg [1:0] state;
  reg [31:0] _GEN_46;
  wire  _T_58;
  wire  _T_60;
  wire  _T_62;
  wire  _T_64;
  wire  _T_65;
  wire [2:0] _T_67;
  wire [2:0] _T_68;
  wire [1:0] _T_69;
  wire [1:0] _GEN_5;
  wire [2:0] _T_73;
  wire [1:0] _T_74;
  wire [1:0] _GEN_6;
  wire [4:0] _GEN_8;
  wire [1:0] _GEN_9;
  wire [1:0] _GEN_10;
  wire  _GEN_11;
  wire [4:0] _GEN_12;
  wire [1:0] _GEN_13;
  wire [1:0] _GEN_14;
  wire  _GEN_15;
  wire [4:0] _GEN_16;
  wire  _T_77;
  wire [1:0] _GEN_17;
  wire  _T_81;
  wire [1:0] _GEN_18;
  wire [3:0] _GEN_19;
  wire [1:0] _GEN_21;
  wire [3:0] _GEN_22;
  wire  _GEN_24;
  wire [1:0] _GEN_25;
  wire [3:0] _GEN_26;
  wire  _T_83;
  wire [4:0] _T_86;
  wire [4:0] _T_87;
  wire [3:0] _T_88;
  wire  _T_90;
  wire [1:0] _GEN_27;
  wire  _T_93;
  wire [6:0] _T_94;
  wire [7:0] _T_95;
  wire [7:0] _GEN_29;
  wire  _GEN_30;
  wire [3:0] _GEN_31;
  wire [1:0] _GEN_32;
  wire  _GEN_33;
  wire [7:0] _GEN_34;
  wire  _GEN_35;
  wire  _GEN_36;
  wire [3:0] _GEN_37;
  wire [1:0] _GEN_38;
  wire  _GEN_39;
  wire [7:0] _GEN_40;
  wire  _GEN_41;
  wire  _T_98;
  wire [1:0] _GEN_42;
  assign io_out_valid = valid;
  assign io_out_bits = shifter;
  assign debounce_max = debounce == 2'h3;
  assign debounce_min = debounce == 2'h0;
  assign start = _GEN_15;
  assign busy = _GEN_36;
  assign _T_25 = prescaler == 12'h0;
  assign pulse = _T_25 & busy;
  assign _T_27 = prescaler - 12'h1;
  assign _T_28 = $unsigned(_T_27);
  assign _T_29 = _T_28[11:0];
  assign _GEN_0 = busy ? _T_29 : prescaler;
  assign _T_30 = start | pulse;
  assign _T_31 = io_div[15:4];
  assign _GEN_1 = _T_30 ? _T_31 : _GEN_0;
  assign _T_33 = sample[0];
  assign _T_34 = sample[1];
  assign _T_35 = sample[2];
  assign _T_36 = _T_33 & _T_34;
  assign _T_37 = _T_33 & _T_35;
  assign _T_38 = _T_36 | _T_37;
  assign _T_39 = _T_34 & _T_35;
  assign voter = _T_38 | _T_39;
  assign _T_40 = {sample,io_in};
  assign _GEN_2 = pulse ? _T_40 : {{1'd0}, sample};
  assign _T_45 = timer == 5'h0;
  assign expire = _T_45 & pulse;
  assign sched = _GEN_41;
  assign _T_49 = timer - 5'h1;
  assign _T_50 = $unsigned(_T_49);
  assign _T_51 = _T_50[4:0];
  assign _GEN_3 = pulse ? _T_51 : timer;
  assign _GEN_4 = sched ? 5'hf : _GEN_3;
  assign _T_58 = 2'h0 == state;
  assign _T_60 = io_in == 1'h0;
  assign _T_62 = _T_60 == 1'h0;
  assign _T_64 = debounce_min == 1'h0;
  assign _T_65 = _T_62 & _T_64;
  assign _T_67 = debounce - 2'h1;
  assign _T_68 = $unsigned(_T_67);
  assign _T_69 = _T_68[1:0];
  assign _GEN_5 = _T_65 ? _T_69 : debounce;
  assign _T_73 = debounce + 2'h1;
  assign _T_74 = _T_73[1:0];
  assign _GEN_6 = debounce_max ? 2'h1 : state;
  assign _GEN_8 = debounce_max ? 5'h8 : _GEN_4;
  assign _GEN_9 = _T_60 ? _T_74 : _GEN_5;
  assign _GEN_10 = _T_60 ? _GEN_6 : state;
  assign _GEN_11 = _T_60 ? debounce_max : 1'h0;
  assign _GEN_12 = _T_60 ? _GEN_8 : _GEN_4;
  assign _GEN_13 = _T_58 ? _GEN_9 : debounce;
  assign _GEN_14 = _T_58 ? _GEN_10 : state;
  assign _GEN_15 = _T_58 ? _GEN_11 : 1'h0;
  assign _GEN_16 = _T_58 ? _GEN_12 : _GEN_4;
  assign _T_77 = 2'h1 == state;
  assign _GEN_17 = voter ? 2'h0 : _GEN_14;
  assign _T_81 = voter == 1'h0;
  assign _GEN_18 = _T_81 ? 2'h2 : _GEN_17;
  assign _GEN_19 = _T_81 ? 4'h8 : counter;
  assign _GEN_21 = expire ? _GEN_18 : _GEN_14;
  assign _GEN_22 = expire ? _GEN_19 : counter;
  assign _GEN_24 = _T_77 ? expire : 1'h0;
  assign _GEN_25 = _T_77 ? _GEN_21 : _GEN_14;
  assign _GEN_26 = _T_77 ? _GEN_22 : counter;
  assign _T_83 = 2'h2 == state;
  assign _T_86 = counter - 4'h1;
  assign _T_87 = $unsigned(_T_86);
  assign _T_88 = _T_87[3:0];
  assign _T_90 = counter == 4'h0;
  assign _GEN_27 = _T_90 ? 2'h0 : _GEN_25;
  assign _T_93 = _T_90 == 1'h0;
  assign _T_94 = shifter[7:1];
  assign _T_95 = {voter,_T_94};
  assign _GEN_29 = _T_93 ? _T_95 : shifter;
  assign _GEN_30 = _T_93 ? 1'h1 : _GEN_24;
  assign _GEN_31 = expire ? _T_88 : _GEN_26;
  assign _GEN_32 = expire ? _GEN_27 : _GEN_25;
  assign _GEN_33 = expire ? _T_90 : 1'h0;
  assign _GEN_34 = expire ? _GEN_29 : shifter;
  assign _GEN_35 = expire ? _GEN_30 : _GEN_24;
  assign _GEN_36 = _T_83 ? 1'h1 : _T_77;
  assign _GEN_37 = _T_83 ? _GEN_31 : _GEN_26;
  assign _GEN_38 = _T_83 ? _GEN_32 : _GEN_25;
  assign _GEN_39 = _T_83 ? _GEN_33 : 1'h0;
  assign _GEN_40 = _T_83 ? _GEN_34 : shifter;
  assign _GEN_41 = _T_83 ? _GEN_35 : _GEN_24;
  assign _T_98 = io_en == 1'h0;
  assign _GEN_42 = _T_98 ? 2'h0 : _GEN_13;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  debounce = _GEN_7[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_20 = {1{$random}};
  prescaler = _GEN_20[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_23 = {1{$random}};
  sample = _GEN_23[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  timer = _GEN_28[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_43 = {1{$random}};
  counter = _GEN_43[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_44 = {1{$random}};
  shifter = _GEN_44[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_45 = {1{$random}};
  valid = _GEN_45[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_46 = {1{$random}};
  state = _GEN_46[1:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      debounce <= 2'h0;
    end else begin
      if (_T_98) begin
        debounce <= 2'h0;
      end else begin
        if (_T_58) begin
          if (_T_60) begin
            debounce <= _T_74;
          end else begin
            if (_T_65) begin
              debounce <= _T_69;
            end
          end
        end
      end
    end
    if (reset) begin
      prescaler <= 12'h0;
    end else begin
      if (_T_30) begin
        prescaler <= _T_31;
      end else begin
        if (busy) begin
          prescaler <= _T_29;
        end
      end
    end
    sample <= _GEN_2[2:0];
    if (_T_58) begin
      if (_T_60) begin
        if (debounce_max) begin
          timer <= 5'h8;
        end else begin
          if (sched) begin
            timer <= 5'hf;
          end else begin
            if (pulse) begin
              timer <= _T_51;
            end
          end
        end
      end else begin
        if (sched) begin
          timer <= 5'hf;
        end else begin
          if (pulse) begin
            timer <= _T_51;
          end
        end
      end
    end else begin
      if (sched) begin
        timer <= 5'hf;
      end else begin
        if (pulse) begin
          timer <= _T_51;
        end
      end
    end
    if (_T_83) begin
      if (expire) begin
        counter <= _T_88;
      end else begin
        if (_T_77) begin
          if (expire) begin
            if (_T_81) begin
              counter <= 4'h8;
            end
          end
        end
      end
    end else begin
      if (_T_77) begin
        if (expire) begin
          if (_T_81) begin
            counter <= 4'h8;
          end
        end
      end
    end
    if (_T_83) begin
      if (expire) begin
        if (_T_93) begin
          shifter <= _T_95;
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (_T_83) begin
        if (expire) begin
          valid <= _T_90;
        end else begin
          valid <= 1'h0;
        end
      end else begin
        valid <= 1'h0;
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_83) begin
        if (expire) begin
          if (_T_90) begin
            state <= 2'h0;
          end else begin
            if (_T_77) begin
              if (expire) begin
                if (_T_81) begin
                  state <= 2'h2;
                end else begin
                  if (voter) begin
                    state <= 2'h0;
                  end else begin
                    if (_T_58) begin
                      if (_T_60) begin
                        if (debounce_max) begin
                          state <= 2'h1;
                        end
                      end
                    end
                  end
                end
              end else begin
                if (_T_58) begin
                  if (_T_60) begin
                    if (debounce_max) begin
                      state <= 2'h1;
                    end
                  end
                end
              end
            end else begin
              if (_T_58) begin
                if (_T_60) begin
                  if (debounce_max) begin
                    state <= 2'h1;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_77) begin
            if (expire) begin
              if (_T_81) begin
                state <= 2'h2;
              end else begin
                if (voter) begin
                  state <= 2'h0;
                end else begin
                  if (_T_58) begin
                    if (_T_60) begin
                      if (debounce_max) begin
                        state <= 2'h1;
                      end
                    end
                  end
                end
              end
            end else begin
              state <= _GEN_14;
            end
          end else begin
            state <= _GEN_14;
          end
        end
      end else begin
        if (_T_77) begin
          if (expire) begin
            if (_T_81) begin
              state <= 2'h2;
            end else begin
              if (voter) begin
                state <= 2'h0;
              end else begin
                state <= _GEN_14;
              end
            end
          end else begin
            state <= _GEN_14;
          end
        end else begin
          state <= _GEN_14;
        end
      end
    end
  end
endmodule
