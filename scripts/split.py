#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

if __name__ == "__main__":
    prompt = """
Args:
    arg1: perf test output
    """
    if len(sys.argv) != 2:
        print prompt
        exit(1)
    perf_test_output = sys.argv[1]
    tests = ['bitcount', 'bubble_sort', 'coremark', 'crc32', 'dhrystone', 'quick_sort', 'select_sort', 'sha', 'stream_copy', 'stringsearch']
    with open(perf_test_output, "r") as f:
        cnt = 0
        trace_start = False
        trace_file = None
        for line in f:
            if line[0: 5] == "*****":
                if not trace_start:
                    cnt = cnt + 1
                    trace_start = True
                    trace_file = open("%d.perf.txt" % cnt, "w")
                else:
                    trace_start = False
                    trace_file.close()
                    trace_file = None
            elif trace_file != None and trace_start:
                trace_file.write(line)
