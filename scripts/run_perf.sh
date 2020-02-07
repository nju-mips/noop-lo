#!/bin/bash
cd ..
make
cd output && ./Emulator +max-cycles=300000000 2>npc.out && cd ..
cd scripts && bash analyse_perf_test.sh ../output/serial && cd ..
mv scripts/total.analyse.txt output
