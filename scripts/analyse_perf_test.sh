#!/bin/bash
echo $1
python split.py $1
for i in `seq 1 10` 
do
  python analyse.py $i.perf.txt >$i.analyse.txt
done

rm -rf total.analyse.txt

tests[1]='bitcount'
tests[2]='bubble_sort'
tests[3]='coremark'
tests[4]='crc32'
tests[5]='dhrystone'
tests[6]='quick_sort'
tests[7]='select_sort'
tests[8]='sha'
tests[9]='stream_copy'
tests[10]='stringsearch'

for i in `seq 1 10` 
do
  printf "******** " >>total.analyse.txt
  printf ${tests[i]} >>total.analyse.txt
  printf " ********\n" >>total.analyse.txt
  cat $i.analyse.txt >>total.analyse.txt
  printf "\n\n\n\n" >>total.analyse.txt
done
