#!/usr/bin/python

import os, sys, shutil,re

def sim(fname):
  print "Begin simulating " + fname + " now."
  print "[" + fname + "]: ",
  # run simulation script
  os.system("/usr/bin/time -f 'time: %e' ./test_top.sh > /dev/null")
  # show result
  with open("simulate.log", "r") as fp:
    contents = fp.read()
    if len(re.findall("HIT GOOD TRAP.", contents, re.M)) != 0:
      print "\033[1;32m HIT GOOD TRAP. \033[0m",
    else:
      print "\033[1;31m HIT BAD TRAP. \033[0m",
    time = re.findall("[0-9]+ ns", contents, re.M)
    if len(time) != 0:
      print "[" + time[0] + "]"
    else:
      print "[sim time error]"
    fp.close()

# change workspace to xsim dir
fname = sys.argv[1]
os.chdir(fname + "_xsim")
# print os.getcwd()
sim(fname)
