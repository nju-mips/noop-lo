#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

"""
sample_input_file_content:
cycle: 0x15f6308a4
instr: 0x81b6fbce
frontend_stall_cycles: 0x22fb57f
backend_stall_cycles: 0x9038707e
frontend_backend_stall_cycles: 0x428986b9
branch: 0x135b8a36
branch_misprediction: 0x22f51e1
branch_btb_miss: 0xdecac2
br: 0x10f67ff7
br_misprediction: 0xe6d66d
br_btb_miss: 0x1cd2af
j: 0x2650a42
j_misprediction: 0x1487b74
j_btb_miss: 0xc1f813
call: 0xc01615
call_misprediction: 0x1e1e7
call_btb_miss: 0x1e1e4
ret: 0xc01613
ret_misprediction: 0xc01613
ret_btb_miss: 0xc01613
icache_access: 0x8a708843
icache_miss: 0x261
icache_miss_cycles: 0x6aa8
icache_miss_backend_busy_cycles: 0x5af
backend_starving: 0x3d98b97b
operand_not_ready: 0x30ded8ca
rd_busy: 0x2bf60d5a
backend_mdu_busy: 0x1ca1aa1d
backend_lsu_busy: 0x81453ccb
dcache_access: 0x1ac52f24
dcache_miss: 0x1351f9f
lsu_wait_dcache: 0x308cbd93
dcache_load: 0x12b9db37
dcache_load_miss: 0x11bfafc
dcache_store: 0x80deb85
dcache_store_miss: 0x1bbbf4
"""
nperf_counters = 36
# overall performance
cycle = 0
instr = 1
frontend_stall_cycles = 2
backend_stall_cycles = 3
frontend_backend_stall_cycles = 4
# frontend performance
# branch prediction
branch = 5
branch_misprediction = 6
branch_btb_miss = 7
br = 8
br_misprediction = 9
br_btb_miss = 10
j = 11
j_misprediction = 12
j_btb_miss = 13
call = 14
call_misprediction = 15
call_btb_miss = 16
ret = 17
ret_misprediction = 18
ret_btb_miss = 19
# icache performance
icache_access = 20
icache_miss = 21
icache_miss_cycles = 22
icache_miss_backend_busy_cycles = 23
# backend performance
backend_starving = 24
operand_not_ready = 25
rd_busy = 26
backend_mdu_busy = 27
backend_lsu_busy = 28
# dcache performance
dcache_access = 29
dcache_miss = 30
lsu_wait_dcache = 31
dcache_load = 32
dcache_load_miss = 33
dcache_store = 34
dcache_store_miss = 35

if __name__ == "__main__":
    prompt = """
Args:
    arg1: microbench output
    remaining args: directories to run tests
    """
    if len(sys.argv) < 2:
        print prompt
        exit(1)
    perf_couter_output = sys.argv[1]
    perf_counters = []
    with open(perf_couter_output, "r") as f:
        cnt = 0
        for line in f:
            cnt += 1
            if (cnt > nperf_counters):
                print "Too many lines\n"
                exit(1)
            l = line.split()
            perf_counters.append(int(l[1], base = 16))
        if cnt < nperf_counters:
                print "Too few lines\n"
                exit(1)
    print "Overall performance"
    print "    IPC: %.2f    CPI: %.2f" % (float(perf_counters[instr]) / perf_counters[cycle],
            float(perf_counters[cycle]) / perf_counters[instr])
    print "Cycle breakdown"
    print "    instr_fetch: %.2f%%    icache_miss: %.2f%%    backend_busy: %.2f%%" % (float(perf_counters[icache_access]) / perf_counters[cycle] * 100,
            float(perf_counters[icache_miss_cycles] - perf_counters[icache_miss_backend_busy_cycles]) / perf_counters[cycle] * 100,
            float(perf_counters[frontend_stall_cycles] + perf_counters[frontend_backend_stall_cycles] + perf_counters[backend_stall_cycles] - perf_counters[icache_miss_backend_busy_cycles]) / perf_counters[cycle] * 100)
    print "BackendBusy breakdown"
    print "    operand_not_ready: %.2f%%    rd_busy: %.2f%%    mdu_busy: %.2f%%    lsu_busy: %.2f%%" % (float(perf_counters[operand_not_ready]) / perf_counters[cycle] * 100,
            float(perf_counters[rd_busy]) / perf_counters[cycle] * 100, float(perf_counters[backend_mdu_busy]) / perf_counters[cycle] * 100,
            float(perf_counters[backend_lsu_busy]) / perf_counters[cycle] * 100)
    print "LSUBusy breakdown"
    print "    hit_busy_cycles: %.2f%%    miss_busy_cycles: %.2f%%" % (
            float((perf_counters[dcache_load] - perf_counters[dcache_load_miss] + perf_counters[dcache_store] - perf_counters[dcache_store_miss]) * 3) / perf_counters[cycle] * 100,
            float((perf_counters[dcache_load_miss] + perf_counters[dcache_store_miss]) * 3 + perf_counters[lsu_wait_dcache]) / perf_counters[cycle] * 100)
    print "Frontend performance"
    print "    backend_starving/cycle: %.2f%%    instr_committed/instr_fetched: %.2f%%" % (
            float(perf_counters[backend_starving]) / perf_counters[cycle] * 100, float(perf_counters[instr]) / perf_counters[icache_access] * 100)
    print "    all_branch/all_instr: %.2f%%    branch/all_branch: %.2f%%    jump/all_branch: %.2f%%    call/all_branch: %.2f%%    ret/all_branch: %.2f%%" % (
            float(perf_counters[branch]) / perf_counters[instr] * 100, float(perf_counters[br]) / perf_counters[branch] * 100,
            float(perf_counters[j]) / perf_counters[branch] * 100, float(perf_counters[call]) / perf_counters[branch] * 100,
            float(perf_counters[ret]) / perf_counters[branch] * 100)
    print "    all_branch_misprediction: %.2f%%    branch_misprediction: %.2f%%    jump_misprediction: %.2f%%    call_misprediction: %.2f%%    ret_misprediction: %.2f%%" % (
            float(perf_counters[branch_misprediction]) / perf_counters[branch] * 100, float(perf_counters[br_misprediction]) / perf_counters[br] * 100,
            float(perf_counters[j_misprediction]) / perf_counters[j] * 100, float(perf_counters[call_misprediction]) / perf_counters[call] * 100,
            float(perf_counters[ret_misprediction]) / perf_counters[ret] * 100)
    print "BTB performance"
    print "    all_branch_btb_miss: %.2f%%    branch_btb_miss: %.2f%%    jump_btb_miss: %.2f%%    call_btb_miss: %.2f%%    ret_btb_miss: %.2f%%" % (
            float(perf_counters[branch_btb_miss]) / perf_counters[branch] * 100, float(perf_counters[br_btb_miss]) / perf_counters[br] * 100,
            float(perf_counters[j_btb_miss]) / perf_counters[j] * 100, float(perf_counters[call_btb_miss]) / perf_counters[call] * 100,
            float(perf_counters[ret_btb_miss]) / perf_counters[ret] * 100)
    print "ICache performance"
    print "    icache_miss_rate: %.2f%%    icache_miss_cycles/all_cycles: %.2f%%    icache_miss_penalty: %.2f" % (
            float(perf_counters[icache_miss]) / perf_counters[icache_access] * 100, float(perf_counters[icache_miss_cycles]) / perf_counters[cycle] * 100,
            float(perf_counters[icache_miss_cycles]) / perf_counters[icache_miss])
    print "Backend performance"
    print "LSU performance"
    print "    load/(load + store) %.2f%%    load_miss/total_miss: %.2f%%    load_miss_rate: %.2f%%    store_miss_rate: %.2f%%" % (
            float(perf_counters[dcache_load]) / (perf_counters[dcache_load] + perf_counters[dcache_store]) * 100,
            float(perf_counters[dcache_load_miss]) / (perf_counters[dcache_load_miss] + perf_counters[dcache_store_miss]) * 100 if(perf_counters[dcache_load_miss] + perf_counters[dcache_store_miss] != 0) else 0.0,
            float(perf_counters[dcache_load_miss]) / perf_counters[dcache_load] * 100, float(perf_counters[dcache_store_miss]) / perf_counters[dcache_store] * 100)
    print "DCache performance"
    print "    dcache_miss_rate: %.2f%%    dcache_miss_cycles/all_cycles: %.2f%%    dcache_miss_penalty: %.2f" % (
            float(perf_counters[dcache_miss]) / perf_counters[dcache_access] * 100, float(perf_counters[lsu_wait_dcache]) / perf_counters[cycle] * 100,
            float(perf_counters[lsu_wait_dcache]) / perf_counters[dcache_miss])
