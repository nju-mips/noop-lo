#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import time
import subprocess
import random
from multiprocessing import Pool

def bash(cmd):
    os.system(cmd)


def tracker(arg):
    program = arg[0]
    seed = arg[1]
    timeout = arg[2]
    running_directory = "%s/%d" % (program, seed)
    # first, create a seperate directory to run this test
    bash("mkdir -p %s" % running_directory)
    # prepare running environment
    bash("cd %s && ln -sf ../emulator emulator" % running_directory)
    bash("cd %s && ln -sf ../bin.txt bin.txt" % running_directory)
    bash("cd %s && ./emulator +max-cycles=%d -s%d 2>npc.out" % (running_directory, timeout, seed))
    status = "failure"
    emu_output = open("%s/npc.out" % running_directory, "r")
    while True:
        emu_line = emu_output.readline()
        if emu_line == "[32mHIT GOOD TRAP\n":
            status = "success"
            break
        if emu_line == "":
            break
    bash("rm -rf %s" % running_directory)
    result = {"program": running_directory, "seed": seed, "status": status}
    print result
    return result


if __name__ == "__main__":
    prompt = """
Args:
    arg1: test name
    arg2: cores to use
    arg3: rounds: the number of random tests to run for each program
    arg4: timeout
    remaining args: directories to run tests
    """
    if len(sys.argv) < 6:
        print prompt
        exit(1)
    test_name = sys.argv[1]
    ncores = int(sys.argv[2])
    nrounds = int(sys.argv[3])
    timeout = int(sys.argv[4])
    programs = sys.argv[5 : ]
    # generate jobs
    jobs = []
    for program in programs:
        for i in range(0, nrounds):
            job = [program, random.randint(0, 2147483647), timeout]
            jobs.append(job)
    
    p = Pool(ncores)
    result = p.map(tracker, list(jobs))
    with open("../%s_regression_report" % test_name, "w") as f:
        f.write("%s" % result)
    # print out summary
    nsuccess = 0
    nfailure = 0
    for r in result:
        if r["status"] == "success":
            nsuccess += 1
        if r["status"] == "failure":
            nfailure += 1
    print "Run %d tests, %d passed, %d failed" % (len(result), nsuccess, nfailure)
