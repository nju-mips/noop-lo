#!/usr/bin/python

import os

print "initial simulation"

os.chdir("xsim")

with open("test_top.sh","r") as f:
  lines = f.readlines()
  f.close()

with open("test_top.sh","w") as f_w:
  for line in lines:
    if "  simulate" in line:
	f_w.write("#simulate");
    f_w.write(line)
  f_w.close()

os.system("/usr/bin/time -f 'init time %e' ./test_top.sh > /dev/null")

with open("test_top.sh","w") as f_w:
  for line in lines:
    if "  compile" in line:
      continue
    elif "  elaborate" in line:
      continue
    elif "#simulate" in line:
      f_w.write(" simulate"); 
    f_w.write(line)
  f_w.close()
