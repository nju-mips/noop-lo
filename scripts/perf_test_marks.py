#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import math
from functools import reduce

ncounters = 10

if __name__ == "__main__":
    prompt = """
Args:
    arg1: perf test cycles
    """
    if len(sys.argv) < 2:
        print prompt
        exit(1)
    test_output = sys.argv[1]
    counters = []
    with open(test_output, "r") as f:
        cnt = 0
        for line in f:
            cnt += 1
            if (cnt > ncounters):
                print "Too many lines\n"
                exit(1)
            l = line.split()
            counters.append(float(int(l[0], base = 16)))
        if cnt < ncounters:
                print "Too few lines\n"
                exit(1)
    # calculate final marks
    test_names = ["bitcount", "bubble_sort", "coremark", "crc32", "dhrystone", "quick_sort", "select_sort", "sha", "stream_copy", "stringsearch"]
    gs132_baseline = [ 0x144ff46, 0x7be6d9e, 0x11241a4e, 0xae0de84, 0x1ec6ef8, 0x7367916, 0x71abf46, 0x769aa9c, 0x86947a, 0x4cc49b2]
    test_marks = [gs132_baseline[i] / counters[i] for i in range(0, 10)]
    total_mark = math.pow(reduce((lambda x, y: x * y), test_marks), 1.0 / 10)

    # output
    print "total-mark: %f" % total_mark
    for i in range(0, 10):
        print "%s: %f" % (test_names[i], test_marks[i])

