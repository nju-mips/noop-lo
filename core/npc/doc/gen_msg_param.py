
#
# Description: script used to generate msg_param.vh
# Usage: python3 gen_msg_param.py -i [inputfile] {-o [outputfile=stdout]}(default=stdout)
# Author: bingo
# Date: 2017/5/1
# Version: 2.0
# Update message: add comment
#

import re
import sys
import getopt

opts, args = getopt.getopt(sys.argv[1:], "i:o:h")

infile = ""
outfile = ""

# argument parser
for op, value in opts:
	if op == "-i":
		infile = value
	elif op == "-o":
		outfile = value
	elif op == "-h":
		print "Usage: python gen_msg_param.py -i [inputfile] {-o [outputfile]}(default=stdout)"
		sys.exit(0)

infp = open(infile)
if outfile == "":
	outfp = sys.stdout
else:
	outfp = open(outfile, "w")


pat_header = re.compile(r'^(?P<_src>\w+)\s+->\s+(?P<_dest>\w+)\s+(?P<_label>\w+)(\s+#.*)?$')
pat_msg = re.compile(r'^(?P<_msg_name>\w+)\s+(?P<_len>\d+)(\s+#.*)?$')

lineno = 0
while True:
	line = infp.readline()
	# end of file
	if not line:
		break
	lineno += 1
	line = line.strip()
	# empty line
	if len(line) == 0:
		continue
	# comment line
	if line.startswith('#'):
		continue

	hdr = pat_header.match(line)
	if hdr == None:
		print "Invalid syntax of line " + str(lineno) + ": " + line
		sys.exit(1)
	prefix = "parameter " + hdr.group("_src") + "_" + hdr.group("_dest") + "_" + hdr.group("_label") + "_"
	msg_list = []
	msg_list.append(prefix + "msglen = ")
	len_sum = 0
	msglen = 0

	while True:
		subline = infp.readline()
		# end of file
		if not subline:
			break
		lineno += 1
		subline = subline.strip()
		# empty line
		if len(subline) == 0:
			break
		# comment line
		if subline.startswith('#'):
			continue
		msg = pat_msg.match(subline)
		if msg == None:
			print "Invalid syntax of line " + str(lineno) + ": " + subline
			sys.exit(1)

		msglen += int(msg.group("_len"))
		msg_list.append(prefix + msg.group("_msg_name") + "_start = " + str(len_sum) + ",")
		msg_list.append(prefix + msg.group("_msg_name") + "_len = " + msg.group("_len") + ",")
		len_sum += int(msg.group("_len"))
		
	if msglen % 8 != 0:
		msglen = (msglen // 8 + 1) * 8
	msg_list[0] = msg_list[0] + str(msglen) + ","
	for ol in msg_list:
		outfp.write(ol + "\n")
	outfp.write("\n")

outfp.write("parameter __dummy = 0\n")

infp.close()
if outfile != "":
	outfp.close()

