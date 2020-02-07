#!/bin/bash

emulator=$1
my_diff=$2
correct_output=$3

for i in `seq 1 1000`
do
  $emulator 2>npc_log.txt
  # remove all debug output
  sed '/time/d' npc_log.txt >tmp_log.txt
  $my_diff $correct_output tmp_log.txt
  ret=$?
  if [ $ret -ne 0 ]; then
    exit
  fi
done
