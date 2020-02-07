default: update

MSG_PARAM_FILE = rtl/msg_param.vh
MSG_DEF_FILE = doc/msg_define.txt
$(MSG_PARAM_FILE): $(MSG_DEF_FILE)
	python doc/gen_msg_param.py -i $< -o $@

DCROM_SRC_FILE = rtl/decode_rom.v
DCROM_DEF_FILE = doc/dct.csv
$(DCROM_SRC_FILE): $(DCROM_DEF_FILE)
	python doc/gen_decoder.py -i $< -o $@

update: $(MSG_PARAM_FILE) $(DCROM_SRC_FILE)
