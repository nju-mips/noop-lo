
obj/coremark/main.elf:     file format elf32-tradlittlemips
obj/coremark/main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:51
bfc00000:	3c0a0040 	lui	t2,0x40
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:52
bfc00004:	408a6000 	mtc0	t2,c0_sr
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:53
bfc00008:	40806800 	mtc0	zero,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:54
bfc0000c:	3c1d8000 	lui	sp,0x8000
bfc00010:	27bd48bc 	addiu	sp,sp,18620
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c88f0 	addiu	gp,gp,-30480
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:57
bfc0001c:	041100dc 	bal	bfc00390 <shell>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:58
bfc00020:	00000000 	nop

bfc00024 <exit>:
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:61
bfc00024:	340900ff 	li	t1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:64
bfc00028:	3c018000 	lui	at,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:65
bfc0002c:	a0297ffc 	sb	t1,32764(at)
	...
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:68
bfc00380:	0ff0283e 	jal	bfc0a0f8 <exception>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:69
bfc00384:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:70
bfc00388:	0bf00009 	j	bfc00024 <exit>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:71
bfc0038c:	00000000 	nop

bfc00390 <shell>:
shell():
bfc00390:	3c048000 	lui	a0,0x8000
bfc00394:	27bdffd0 	addiu	sp,sp,-48
bfc00398:	24840000 	addiu	a0,a0,0
bfc0039c:	afbf002c 	sw	ra,44(sp)
bfc003a0:	afb20028 	sw	s2,40(sp)
bfc003a4:	afb10024 	sw	s1,36(sp)
bfc003a8:	0ff027aa 	jal	bfc09ea8 <puts>
bfc003ac:	afb00020 	sw	s0,32(sp)
bfc003b0:	0ff027fd 	jal	bfc09ff4 <get_count>
bfc003b4:	24120001 	li	s2,1
bfc003b8:	00408821 	move	s1,v0
bfc003bc:	240307d0 	li	v1,2000
bfc003c0:	00002021 	move	a0,zero
bfc003c4:	00002821 	move	a1,zero
bfc003c8:	24060066 	li	a2,102
bfc003cc:	24070001 	li	a3,1
bfc003d0:	24020007 	li	v0,7
bfc003d4:	afa30018 	sw	v1,24(sp)
bfc003d8:	afa20010 	sw	v0,16(sp)
bfc003dc:	0ff00184 	jal	bfc00610 <core_mark>
bfc003e0:	afb20014 	sw	s2,20(sp)
bfc003e4:	0ff027fd 	jal	bfc09ff4 <get_count>
bfc003e8:	00408021 	move	s0,v0
bfc003ec:	12000018 	beqz	s0,bfc00450 <shell+0xc0>
bfc003f0:	00518823 	subu	s1,v0,s1
bfc003f4:	3c188000 	lui	t8,0x8000
bfc003f8:	0ff027aa 	jal	bfc09ea8 <puts>
bfc003fc:	27040028 	addiu	a0,t8,40
bfc00400:	3c0fbfd0 	lui	t7,0xbfd0
bfc00404:	35ebf000 	ori	t3,t7,0xf000
bfc00408:	35eef008 	ori	t6,t7,0xf008
bfc0040c:	35edf004 	ori	t5,t7,0xf004
bfc00410:	240c0002 	li	t4,2
bfc00414:	add20000 	sw	s2,0(t6)
bfc00418:	adac0000 	sw	t4,0(t5)
bfc0041c:	ad600000 	sw	zero,0(t3)
bfc00420:	3c19bfd0 	lui	t9,0xbfd0
bfc00424:	3c1f8000 	lui	ra,0x8000
bfc00428:	3732f010 	ori	s2,t9,0xf010
bfc0042c:	ae510000 	sw	s1,0(s2)
bfc00430:	27e4003c 	addiu	a0,ra,60
bfc00434:	02202821 	move	a1,s1
bfc00438:	8fbf002c 	lw	ra,44(sp)
bfc0043c:	8fb20028 	lw	s2,40(sp)
bfc00440:	8fb10024 	lw	s1,36(sp)
bfc00444:	8fb00020 	lw	s0,32(sp)
bfc00448:	0bf026e4 	j	bfc09b90 <printf>
bfc0044c:	27bd0030 	addiu	sp,sp,48
bfc00450:	3c0a8000 	lui	t2,0x8000
bfc00454:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00458:	25440018 	addiu	a0,t2,24
bfc0045c:	3c09bfd0 	lui	t1,0xbfd0
bfc00460:	3527f000 	ori	a3,t1,0xf000
bfc00464:	3525f008 	ori	a1,t1,0xf008
bfc00468:	3528f004 	ori	t0,t1,0xf004
bfc0046c:	3406ffff 	li	a2,0xffff
bfc00470:	ad120000 	sw	s2,0(t0)
bfc00474:	ace60000 	sw	a2,0(a3)
bfc00478:	0bf00108 	j	bfc00420 <shell+0x90>
bfc0047c:	acb20000 	sw	s2,0(a1)

bfc00480 <iterate>:
iterate():
bfc00480:	27bdffd8 	addiu	sp,sp,-40
bfc00484:	afb30020 	sw	s3,32(sp)
bfc00488:	8c93001c 	lw	s3,28(a0)
bfc0048c:	afb00014 	sw	s0,20(sp)
bfc00490:	afbf0024 	sw	ra,36(sp)
bfc00494:	afb2001c 	sw	s2,28(sp)
bfc00498:	afb10018 	sw	s1,24(sp)
bfc0049c:	00808021 	move	s0,a0
bfc004a0:	a4800038 	sh	zero,56(a0)
bfc004a4:	a480003a 	sh	zero,58(a0)
bfc004a8:	a480003c 	sh	zero,60(a0)
bfc004ac:	1260004d 	beqz	s3,bfc005e4 <iterate+0x164>
bfc004b0:	a480003e 	sh	zero,62(a0)
bfc004b4:	24050001 	li	a1,1
bfc004b8:	2662ffff 	addiu	v0,s3,-1
bfc004bc:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc004c0:	30520001 	andi	s2,v0,0x1
bfc004c4:	96050038 	lhu	a1,56(s0)
bfc004c8:	0ff01680 	jal	bfc05a00 <crcu16>
bfc004cc:	00402021 	move	a0,v0
bfc004d0:	a6020038 	sh	v0,56(s0)
bfc004d4:	2405ffff 	li	a1,-1
bfc004d8:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc004dc:	02002021 	move	a0,s0
bfc004e0:	96050038 	lhu	a1,56(s0)
bfc004e4:	24110001 	li	s1,1
bfc004e8:	0ff01680 	jal	bfc05a00 <crcu16>
bfc004ec:	00402021 	move	a0,v0
bfc004f0:	0233182b 	sltu	v1,s1,s3
bfc004f4:	a602003a 	sh	v0,58(s0)
bfc004f8:	1060003a 	beqz	v1,bfc005e4 <iterate+0x164>
bfc004fc:	a6020038 	sh	v0,56(s0)
bfc00500:	12400013 	beqz	s2,bfc00550 <iterate+0xd0>
bfc00504:	02002021 	move	a0,s0
bfc00508:	24050001 	li	a1,1
bfc0050c:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00510:	02002021 	move	a0,s0
bfc00514:	96050038 	lhu	a1,56(s0)
bfc00518:	0ff01680 	jal	bfc05a00 <crcu16>
bfc0051c:	00402021 	move	a0,v0
bfc00520:	a6020038 	sh	v0,56(s0)
bfc00524:	2405ffff 	li	a1,-1
bfc00528:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc0052c:	02002021 	move	a0,s0
bfc00530:	96050038 	lhu	a1,56(s0)
bfc00534:	00402021 	move	a0,v0
bfc00538:	0ff01680 	jal	bfc05a00 <crcu16>
bfc0053c:	26310001 	addiu	s1,s1,1
bfc00540:	0233202b 	sltu	a0,s1,s3
bfc00544:	10800027 	beqz	a0,bfc005e4 <iterate+0x164>
bfc00548:	a6020038 	sh	v0,56(s0)
bfc0054c:	02002021 	move	a0,s0
bfc00550:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00554:	24050001 	li	a1,1
bfc00558:	96050038 	lhu	a1,56(s0)
bfc0055c:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00560:	00402021 	move	a0,v0
bfc00564:	a6020038 	sh	v0,56(s0)
bfc00568:	02002021 	move	a0,s0
bfc0056c:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00570:	2405ffff 	li	a1,-1
bfc00574:	96050038 	lhu	a1,56(s0)
bfc00578:	0ff01680 	jal	bfc05a00 <crcu16>
bfc0057c:	00402021 	move	a0,v0
bfc00580:	26320001 	addiu	s2,s1,1
bfc00584:	02002021 	move	a0,s0
bfc00588:	24050001 	li	a1,1
bfc0058c:	16200002 	bnez	s1,bfc00598 <iterate+0x118>
bfc00590:	a6020038 	sh	v0,56(s0)
bfc00594:	a602003a 	sh	v0,58(s0)
bfc00598:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc0059c:	00000000 	nop
bfc005a0:	96050038 	lhu	a1,56(s0)
bfc005a4:	0ff01680 	jal	bfc05a00 <crcu16>
bfc005a8:	00402021 	move	a0,v0
bfc005ac:	a6020038 	sh	v0,56(s0)
bfc005b0:	02002021 	move	a0,s0
bfc005b4:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc005b8:	2405ffff 	li	a1,-1
bfc005bc:	96050038 	lhu	a1,56(s0)
bfc005c0:	0ff01680 	jal	bfc05a00 <crcu16>
bfc005c4:	00402021 	move	a0,v0
bfc005c8:	16400002 	bnez	s2,bfc005d4 <iterate+0x154>
bfc005cc:	a6020038 	sh	v0,56(s0)
bfc005d0:	a602003a 	sh	v0,58(s0)
bfc005d4:	26510001 	addiu	s1,s2,1
bfc005d8:	0233282b 	sltu	a1,s1,s3
bfc005dc:	14a0ffdb 	bnez	a1,bfc0054c <iterate+0xcc>
bfc005e0:	00000000 	nop
bfc005e4:	8fbf0024 	lw	ra,36(sp)
bfc005e8:	00001021 	move	v0,zero
bfc005ec:	8fb30020 	lw	s3,32(sp)
bfc005f0:	8fb2001c 	lw	s2,28(sp)
bfc005f4:	8fb10018 	lw	s1,24(sp)
bfc005f8:	8fb00014 	lw	s0,20(sp)
bfc005fc:	03e00008 	jr	ra
bfc00600:	27bd0028 	addiu	sp,sp,40
	...

bfc00610 <core_mark>:
core_mark():
bfc00610:	27bdf798 	addiu	sp,sp,-2152
bfc00614:	afb40850 	sw	s4,2128(sp)
bfc00618:	afb3084c 	sw	s3,2124(sp)
bfc0061c:	00c0a021 	move	s4,a2
bfc00620:	00a09821 	move	s3,a1
bfc00624:	afb20848 	sw	s2,2120(sp)
bfc00628:	afb00840 	sw	s0,2112(sp)
bfc0062c:	00809021 	move	s2,a0
bfc00630:	8fb00878 	lw	s0,2168(sp)
bfc00634:	8fa2087c 	lw	v0,2172(sp)
bfc00638:	8fa30880 	lw	v1,2176(sp)
bfc0063c:	3c048000 	lui	a0,0x8000
bfc00640:	afb10844 	sw	s1,2116(sp)
bfc00644:	2484005c 	addiu	a0,a0,92
bfc00648:	00e08821 	move	s1,a3
bfc0064c:	02402821 	move	a1,s2
bfc00650:	02603021 	move	a2,s3
bfc00654:	02803821 	move	a3,s4
bfc00658:	afbf0864 	sw	ra,2148(sp)
bfc0065c:	afbe0860 	sw	s8,2144(sp)
bfc00660:	afb7085c 	sw	s7,2140(sp)
bfc00664:	afb60858 	sw	s6,2136(sp)
bfc00668:	afb50854 	sw	s5,2132(sp)
bfc0066c:	afa20018 	sw	v0,24(sp)
bfc00670:	afa3001c 	sw	v1,28(sp)
bfc00674:	afb10010 	sw	s1,16(sp)
bfc00678:	0ff026e4 	jal	bfc09b90 <printf>
bfc0067c:	afb00014 	sw	s0,20(sp)
bfc00680:	a7b20020 	sh	s2,32(sp)
bfc00684:	a7b30022 	sh	s3,34(sp)
bfc00688:	a7b40024 	sh	s4,36(sp)
bfc0068c:	16000002 	bnez	s0,bfc00698 <core_mark+0x88>
bfc00690:	afb1003c 	sw	s1,60(sp)
bfc00694:	24100007 	li	s0,7
bfc00698:	8fa30020 	lw	v1,32(sp)
bfc0069c:	00000000 	nop
bfc006a0:	14600006 	bnez	v1,bfc006bc <core_mark+0xac>
bfc006a4:	24070001 	li	a3,1
bfc006a8:	87a50024 	lh	a1,36(sp)
bfc006ac:	00000000 	nop
bfc006b0:	10a002db 	beqz	a1,bfc01220 <core_mark+0xc10>
bfc006b4:	24060066 	li	a2,102
bfc006b8:	24070001 	li	a3,1
bfc006bc:	106702de 	beq	v1,a3,bfc01238 <core_mark+0xc28>
bfc006c0:	00000000 	nop
bfc006c4:	87a60020 	lh	a2,32(sp)
bfc006c8:	32040001 	andi	a0,s0,0x1
bfc006cc:	27a50064 	addiu	a1,sp,100
bfc006d0:	248c0001 	addiu	t4,a0,1
bfc006d4:	320b0002 	andi	t3,s0,0x2
bfc006d8:	afa50028 	sw	a1,40(sp)
bfc006dc:	a7a60020 	sh	a2,32(sp)
bfc006e0:	a7a00060 	sh	zero,96(sp)
bfc006e4:	afb00040 	sw	s0,64(sp)
bfc006e8:	11600265 	beqz	t3,bfc01080 <core_mark+0xa70>
bfc006ec:	3182ffff 	andi	v0,t4,0xffff
bfc006f0:	00401821 	move	v1,v0
bfc006f4:	320d0004 	andi	t5,s0,0x4
bfc006f8:	11a0025d 	beqz	t5,bfc01070 <core_mark+0xa60>
bfc006fc:	24640001 	addiu	a0,v1,1
bfc00700:	00801021 	move	v0,a0
bfc00704:	304fffff 	andi	t7,v0,0xffff
bfc00708:	241507d0 	li	s5,2000
bfc0070c:	15e00002 	bnez	t7,bfc00718 <core_mark+0x108>
bfc00710:	02af001b 	divu	zero,s5,t7
bfc00714:	0007000d 	break	0x7
bfc00718:	320e0001 	andi	t6,s0,0x1
bfc0071c:	00003812 	mflo	a3
bfc00720:	15c00243 	bnez	t6,bfc01030 <core_mark+0xa20>
bfc00724:	afa70038 	sw	a3,56(sp)
bfc00728:	00001821 	move	v1,zero
bfc0072c:	32160002 	andi	s6,s0,0x2
bfc00730:	12c00007 	beqz	s6,bfc00750 <core_mark+0x140>
bfc00734:	321e0004 	andi	s8,s0,0x4
bfc00738:	00670018 	mult	v1,a3
bfc0073c:	24790001 	addiu	t9,v1,1
bfc00740:	3323ffff 	andi	v1,t9,0xffff
bfc00744:	0000c012 	mflo	t8
bfc00748:	00b8b821 	addu	s7,a1,t8
bfc0074c:	afb70030 	sw	s7,48(sp)
bfc00750:	13c00005 	beqz	s8,bfc00768 <core_mark+0x158>
bfc00754:	32140001 	andi	s4,s0,0x1
bfc00758:	00670018 	mult	v1,a3
bfc0075c:	00008812 	mflo	s1
bfc00760:	00b1f821 	addu	ra,a1,s1
bfc00764:	afbf0034 	sw	ra,52(sp)
bfc00768:	12800007 	beqz	s4,bfc00788 <core_mark+0x178>
bfc0076c:	32130002 	andi	s3,s0,0x2
bfc00770:	8fa5002c 	lw	a1,44(sp)
bfc00774:	0ff021cc 	jal	bfc08730 <core_list_init>
bfc00778:	00e02021 	move	a0,a3
bfc0077c:	8fb00040 	lw	s0,64(sp)
bfc00780:	afa20044 	sw	v0,68(sp)
bfc00784:	32130002 	andi	s3,s0,0x2
bfc00788:	1660021d 	bnez	s3,bfc01000 <core_mark+0x9f0>
bfc0078c:	00000000 	nop
bfc00790:	32020004 	andi	v0,s0,0x4
bfc00794:	1440006a 	bnez	v0,bfc00940 <core_mark+0x330>
bfc00798:	00000000 	nop
bfc0079c:	8fa4003c 	lw	a0,60(sp)
bfc007a0:	00000000 	nop
bfc007a4:	14800070 	bnez	a0,bfc00968 <core_mark+0x358>
bfc007a8:	3c158000 	lui	s5,0x8000
bfc007ac:	24020001 	li	v0,1
bfc007b0:	27b20020 	addiu	s2,sp,32
bfc007b4:	000238c0 	sll	a3,v0,0x3
bfc007b8:	00023040 	sll	a2,v0,0x1
bfc007bc:	00c72821 	addu	a1,a2,a3
bfc007c0:	0ff026e0 	jal	bfc09b80 <start_time>
bfc007c4:	afa5003c 	sw	a1,60(sp)
bfc007c8:	8fb3003c 	lw	s3,60(sp)
bfc007cc:	a7a00058 	sh	zero,88(sp)
bfc007d0:	a7a0005a 	sh	zero,90(sp)
bfc007d4:	a7a0005c 	sh	zero,92(sp)
bfc007d8:	1260004d 	beqz	s3,bfc00910 <core_mark+0x300>
bfc007dc:	a7a0005e 	sh	zero,94(sp)
bfc007e0:	2669ffff 	addiu	t1,s3,-1
bfc007e4:	24050001 	li	a1,1
bfc007e8:	02402021 	move	a0,s2
bfc007ec:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc007f0:	31310001 	andi	s1,t1,0x1
bfc007f4:	97a50058 	lhu	a1,88(sp)
bfc007f8:	0ff01680 	jal	bfc05a00 <crcu16>
bfc007fc:	00402021 	move	a0,v0
bfc00800:	2405ffff 	li	a1,-1
bfc00804:	02402021 	move	a0,s2
bfc00808:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc0080c:	a7a20058 	sh	v0,88(sp)
bfc00810:	97a50058 	lhu	a1,88(sp)
bfc00814:	24100001 	li	s0,1
bfc00818:	0ff01680 	jal	bfc05a00 <crcu16>
bfc0081c:	00402021 	move	a0,v0
bfc00820:	0213402b 	sltu	t0,s0,s3
bfc00824:	a7a2005a 	sh	v0,90(sp)
bfc00828:	11000039 	beqz	t0,bfc00910 <core_mark+0x300>
bfc0082c:	a7a20058 	sh	v0,88(sp)
bfc00830:	12200011 	beqz	s1,bfc00878 <core_mark+0x268>
bfc00834:	24050001 	li	a1,1
bfc00838:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc0083c:	02402021 	move	a0,s2
bfc00840:	97a50058 	lhu	a1,88(sp)
bfc00844:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00848:	00402021 	move	a0,v0
bfc0084c:	2405ffff 	li	a1,-1
bfc00850:	02402021 	move	a0,s2
bfc00854:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00858:	a7a20058 	sh	v0,88(sp)
bfc0085c:	97a50058 	lhu	a1,88(sp)
bfc00860:	26100001 	addiu	s0,s0,1
bfc00864:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00868:	00402021 	move	a0,v0
bfc0086c:	0213882b 	sltu	s1,s0,s3
bfc00870:	12200027 	beqz	s1,bfc00910 <core_mark+0x300>
bfc00874:	a7a20058 	sh	v0,88(sp)
bfc00878:	02402021 	move	a0,s2
bfc0087c:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00880:	24050001 	li	a1,1
bfc00884:	97a50058 	lhu	a1,88(sp)
bfc00888:	0ff01680 	jal	bfc05a00 <crcu16>
bfc0088c:	00402021 	move	a0,v0
bfc00890:	02402021 	move	a0,s2
bfc00894:	2405ffff 	li	a1,-1
bfc00898:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc0089c:	a7a20058 	sh	v0,88(sp)
bfc008a0:	97a50058 	lhu	a1,88(sp)
bfc008a4:	0ff01680 	jal	bfc05a00 <crcu16>
bfc008a8:	00402021 	move	a0,v0
bfc008ac:	26110001 	addiu	s1,s0,1
bfc008b0:	02402021 	move	a0,s2
bfc008b4:	24050001 	li	a1,1
bfc008b8:	16000002 	bnez	s0,bfc008c4 <core_mark+0x2b4>
bfc008bc:	a7a20058 	sh	v0,88(sp)
bfc008c0:	a7a2005a 	sh	v0,90(sp)
bfc008c4:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc008c8:	00000000 	nop
bfc008cc:	97a50058 	lhu	a1,88(sp)
bfc008d0:	0ff01680 	jal	bfc05a00 <crcu16>
bfc008d4:	00402021 	move	a0,v0
bfc008d8:	02402021 	move	a0,s2
bfc008dc:	2405ffff 	li	a1,-1
bfc008e0:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc008e4:	a7a20058 	sh	v0,88(sp)
bfc008e8:	97a50058 	lhu	a1,88(sp)
bfc008ec:	0ff01680 	jal	bfc05a00 <crcu16>
bfc008f0:	00402021 	move	a0,v0
bfc008f4:	16200002 	bnez	s1,bfc00900 <core_mark+0x2f0>
bfc008f8:	a7a20058 	sh	v0,88(sp)
bfc008fc:	a7a2005a 	sh	v0,90(sp)
bfc00900:	26300001 	addiu	s0,s1,1
bfc00904:	0213302b 	sltu	a2,s0,s3
bfc00908:	14c0ffdc 	bnez	a2,bfc0087c <core_mark+0x26c>
bfc0090c:	02402021 	move	a0,s2
bfc00910:	0ff026dc 	jal	bfc09b70 <stop_time>
bfc00914:	00000000 	nop
bfc00918:	0ff026b4 	jal	bfc09ad0 <get_time>
bfc0091c:	00000000 	nop
bfc00920:	0ff026cc 	jal	bfc09b30 <time_in_secs>
bfc00924:	00402021 	move	a0,v0
bfc00928:	144001c5 	bnez	v0,bfc01040 <core_mark+0xa30>
bfc0092c:	240e000a 	li	t6,10
bfc00930:	8fa2003c 	lw	v0,60(sp)
bfc00934:	0bf001ee 	j	bfc007b8 <core_mark+0x1a8>
bfc00938:	000238c0 	sll	a3,v0,0x3
bfc0093c:	00000000 	nop
bfc00940:	8fa40038 	lw	a0,56(sp)
bfc00944:	87a50020 	lh	a1,32(sp)
bfc00948:	8fa60034 	lw	a2,52(sp)
bfc0094c:	0ff01b64 	jal	bfc06d90 <core_init_state>
bfc00950:	00000000 	nop
bfc00954:	8fa4003c 	lw	a0,60(sp)
bfc00958:	00000000 	nop
bfc0095c:	1080ff94 	beqz	a0,bfc007b0 <core_mark+0x1a0>
bfc00960:	24020001 	li	v0,1
bfc00964:	3c158000 	lui	s5,0x8000
bfc00968:	240f0001 	li	t7,1
bfc0096c:	26a40088 	addiu	a0,s5,136
bfc00970:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00974:	af8f8010 	sw	t7,-32752(gp)
bfc00978:	0ff02807 	jal	bfc0a01c <get_ns>
bfc0097c:	00000000 	nop
bfc00980:	8fb3003c 	lw	s3,60(sp)
bfc00984:	0040a021 	move	s4,v0
bfc00988:	a7a00058 	sh	zero,88(sp)
bfc0098c:	a7a0005a 	sh	zero,90(sp)
bfc00990:	a7a0005c 	sh	zero,92(sp)
bfc00994:	1260004e 	beqz	s3,bfc00ad0 <core_mark+0x4c0>
bfc00998:	a7a0005e 	sh	zero,94(sp)
bfc0099c:	27b10020 	addiu	s1,sp,32
bfc009a0:	24050001 	li	a1,1
bfc009a4:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc009a8:	02202021 	move	a0,s1
bfc009ac:	97a50058 	lhu	a1,88(sp)
bfc009b0:	0ff01680 	jal	bfc05a00 <crcu16>
bfc009b4:	00402021 	move	a0,v0
bfc009b8:	2405ffff 	li	a1,-1
bfc009bc:	02202021 	move	a0,s1
bfc009c0:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc009c4:	a7a20058 	sh	v0,88(sp)
bfc009c8:	97a50058 	lhu	a1,88(sp)
bfc009cc:	24100001 	li	s0,1
bfc009d0:	0ff01680 	jal	bfc05a00 <crcu16>
bfc009d4:	00402021 	move	a0,v0
bfc009d8:	2677ffff 	addiu	s7,s3,-1
bfc009dc:	0213b02b 	sltu	s6,s0,s3
bfc009e0:	32f20001 	andi	s2,s7,0x1
bfc009e4:	a7a2005a 	sh	v0,90(sp)
bfc009e8:	12c00039 	beqz	s6,bfc00ad0 <core_mark+0x4c0>
bfc009ec:	a7a20058 	sh	v0,88(sp)
bfc009f0:	12400011 	beqz	s2,bfc00a38 <core_mark+0x428>
bfc009f4:	24050001 	li	a1,1
bfc009f8:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc009fc:	02202021 	move	a0,s1
bfc00a00:	97a50058 	lhu	a1,88(sp)
bfc00a04:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00a08:	00402021 	move	a0,v0
bfc00a0c:	2405ffff 	li	a1,-1
bfc00a10:	02202021 	move	a0,s1
bfc00a14:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00a18:	a7a20058 	sh	v0,88(sp)
bfc00a1c:	97a50058 	lhu	a1,88(sp)
bfc00a20:	26100001 	addiu	s0,s0,1
bfc00a24:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00a28:	00402021 	move	a0,v0
bfc00a2c:	0213902b 	sltu	s2,s0,s3
bfc00a30:	12400027 	beqz	s2,bfc00ad0 <core_mark+0x4c0>
bfc00a34:	a7a20058 	sh	v0,88(sp)
bfc00a38:	02202021 	move	a0,s1
bfc00a3c:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00a40:	24050001 	li	a1,1
bfc00a44:	97a50058 	lhu	a1,88(sp)
bfc00a48:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00a4c:	00402021 	move	a0,v0
bfc00a50:	02202021 	move	a0,s1
bfc00a54:	2405ffff 	li	a1,-1
bfc00a58:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00a5c:	a7a20058 	sh	v0,88(sp)
bfc00a60:	97a50058 	lhu	a1,88(sp)
bfc00a64:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00a68:	00402021 	move	a0,v0
bfc00a6c:	26120001 	addiu	s2,s0,1
bfc00a70:	02202021 	move	a0,s1
bfc00a74:	24050001 	li	a1,1
bfc00a78:	16000002 	bnez	s0,bfc00a84 <core_mark+0x474>
bfc00a7c:	a7a20058 	sh	v0,88(sp)
bfc00a80:	a7a2005a 	sh	v0,90(sp)
bfc00a84:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00a88:	00000000 	nop
bfc00a8c:	97a50058 	lhu	a1,88(sp)
bfc00a90:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00a94:	00402021 	move	a0,v0
bfc00a98:	02202021 	move	a0,s1
bfc00a9c:	2405ffff 	li	a1,-1
bfc00aa0:	0ff02408 	jal	bfc09020 <core_bench_list>
bfc00aa4:	a7a20058 	sh	v0,88(sp)
bfc00aa8:	97a50058 	lhu	a1,88(sp)
bfc00aac:	0ff01680 	jal	bfc05a00 <crcu16>
bfc00ab0:	00402021 	move	a0,v0
bfc00ab4:	16400002 	bnez	s2,bfc00ac0 <core_mark+0x4b0>
bfc00ab8:	a7a20058 	sh	v0,88(sp)
bfc00abc:	a7a2005a 	sh	v0,90(sp)
bfc00ac0:	26500001 	addiu	s0,s2,1
bfc00ac4:	0213f82b 	sltu	ra,s0,s3
bfc00ac8:	17e0ffdc 	bnez	ra,bfc00a3c <core_mark+0x42c>
bfc00acc:	02202021 	move	a0,s1
bfc00ad0:	0ff02807 	jal	bfc0a01c <get_ns>
bfc00ad4:	00000000 	nop
bfc00ad8:	3c198000 	lui	t9,0x8000
bfc00adc:	27240094 	addiu	a0,t9,148
bfc00ae0:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00ae4:	0054b823 	subu	s7,v0,s4
bfc00ae8:	87a40020 	lh	a0,32(sp)
bfc00aec:	0ff0179c 	jal	bfc05e70 <crc16>
bfc00af0:	00002821 	move	a1,zero
bfc00af4:	87a40022 	lh	a0,34(sp)
bfc00af8:	0ff0179c 	jal	bfc05e70 <crc16>
bfc00afc:	00402821 	move	a1,v0
bfc00b00:	87a40024 	lh	a0,36(sp)
bfc00b04:	0ff0179c 	jal	bfc05e70 <crc16>
bfc00b08:	00402821 	move	a1,v0
bfc00b0c:	87a40038 	lh	a0,56(sp)
bfc00b10:	0ff0179c 	jal	bfc05e70 <crc16>
bfc00b14:	00402821 	move	a1,v0
bfc00b18:	24187b05 	li	t8,31493
bfc00b1c:	10580238 	beq	v0,t8,bfc01400 <core_mark+0xdf0>
bfc00b20:	0040b021 	move	s6,v0
bfc00b24:	2c5e7b06 	sltiu	s8,v0,31494
bfc00b28:	17c00159 	bnez	s8,bfc01090 <core_mark+0xa80>
bfc00b2c:	241f18f2 	li	ra,6386
bfc00b30:	34148a02 	li	s4,0x8a02
bfc00b34:	1054022b 	beq	v0,s4,bfc013e4 <core_mark+0xdd4>
bfc00b38:	3413e9f5 	li	s3,0xe9f5
bfc00b3c:	105301c7 	beq	v0,s3,bfc0125c <core_mark+0xc4c>
bfc00b40:	3c028000 	lui	v0,0x8000
bfc00b44:	3410ffff 	li	s0,0xffff
bfc00b48:	0ff0167c 	jal	bfc059f0 <check_data_types>
bfc00b4c:	3c138000 	lui	s3,0x8000
bfc00b50:	02021821 	addu	v1,s0,v0
bfc00b54:	8fa50038 	lw	a1,56(sp)
bfc00b58:	0003cc00 	sll	t9,v1,0x10
bfc00b5c:	2664021c 	addiu	a0,s3,540
bfc00b60:	0ff026e4 	jal	bfc09b90 <printf>
bfc00b64:	00199c03 	sra	s3,t9,0x10
bfc00b68:	3c188000 	lui	t8,0x8000
bfc00b6c:	27040234 	addiu	a0,t8,564
bfc00b70:	0ff026e4 	jal	bfc09b90 <printf>
bfc00b74:	02e02821 	move	a1,s7
bfc00b78:	8f8f8010 	lw	t7,-32752(gp)
bfc00b7c:	8fa8003c 	lw	t0,60(sp)
bfc00b80:	3c0d3b9a 	lui	t5,0x3b9a
bfc00b84:	010f0018 	mult	t0,t7
bfc00b88:	35acca00 	ori	t4,t5,0xca00
bfc00b8c:	3c0e8000 	lui	t6,0x8000
bfc00b90:	25c40244 	addiu	a0,t6,580
bfc00b94:	3c118000 	lui	s1,0x8000
bfc00b98:	3c1e8000 	lui	s8,0x8000
bfc00b9c:	00002812 	mflo	a1
	...
bfc00ba8:	00ac0018 	mult	a1,t4
bfc00bac:	00005812 	mflo	t3
	...
bfc00bb8:	16e00002 	bnez	s7,bfc00bc4 <core_mark+0x5b4>
bfc00bbc:	0177001b 	divu	zero,t3,s7
bfc00bc0:	0007000d 	break	0x7
bfc00bc4:	00002812 	mflo	a1
bfc00bc8:	0ff026e4 	jal	bfc09b90 <printf>
bfc00bcc:	3c158000 	lui	s5,0x8000
bfc00bd0:	3c0a8000 	lui	t2,0x8000
bfc00bd4:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00bd8:	2544025c 	addiu	a0,t2,604
bfc00bdc:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00be0:	262402b8 	addiu	a0,s1,696
bfc00be4:	8fa5003c 	lw	a1,60(sp)
bfc00be8:	02e03021 	move	a2,s7
bfc00bec:	27c402e4 	addiu	a0,s8,740
bfc00bf0:	0ff026e4 	jal	bfc09b90 <printf>
bfc00bf4:	3c178000 	lui	s7,0x8000
bfc00bf8:	00002821 	move	a1,zero
bfc00bfc:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c00:	26e40310 	addiu	a0,s7,784
bfc00c04:	0ff026cc 	jal	bfc09b30 <time_in_secs>
bfc00c08:	00002021 	move	a0,zero
bfc00c0c:	00402821 	move	a1,v0
bfc00c10:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c14:	26a40328 	addiu	a0,s5,808
bfc00c18:	0ff026cc 	jal	bfc09b30 <time_in_secs>
bfc00c1c:	00002021 	move	a0,zero
bfc00c20:	144001db 	bnez	v0,bfc01390 <core_mark+0xd80>
bfc00c24:	00000000 	nop
bfc00c28:	8faa003c 	lw	t2,60(sp)
bfc00c2c:	8f8b8010 	lw	t3,-32752(gp)
bfc00c30:	3c118000 	lui	s1,0x8000
bfc00c34:	016a0018 	mult	t3,t2
bfc00c38:	26240358 	addiu	a0,s1,856
bfc00c3c:	3c1e8000 	lui	s8,0x8000
bfc00c40:	3c178000 	lui	s7,0x8000
bfc00c44:	00002812 	mflo	a1
bfc00c48:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c4c:	3c158000 	lui	s5,0x8000
bfc00c50:	27c40370 	addiu	a0,s8,880
bfc00c54:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c58:	26e50388 	addiu	a1,s7,904
bfc00c5c:	3c098000 	lui	t1,0x8000
bfc00c60:	2525030c 	addiu	a1,t1,780
bfc00c64:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c68:	26a40394 	addiu	a0,s5,916
bfc00c6c:	3c078000 	lui	a3,0x8000
bfc00c70:	3c068000 	lui	a2,0x8000
bfc00c74:	24e403ac 	addiu	a0,a3,940
bfc00c78:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c7c:	24c503c4 	addiu	a1,a2,964
bfc00c80:	3c048000 	lui	a0,0x8000
bfc00c84:	02c02821 	move	a1,s6
bfc00c88:	0ff026e4 	jal	bfc09b90 <printf>
bfc00c8c:	24840414 	addiu	a0,a0,1044
bfc00c90:	8fa30040 	lw	v1,64(sp)
bfc00c94:	00000000 	nop
bfc00c98:	30760001 	andi	s6,v1,0x1
bfc00c9c:	16c00174 	bnez	s6,bfc01270 <core_mark+0xc60>
bfc00ca0:	00000000 	nop
bfc00ca4:	8f868010 	lw	a2,-32752(gp)
bfc00ca8:	30740002 	andi	s4,v1,0x2
bfc00cac:	1280003f 	beqz	s4,bfc00dac <core_mark+0x79c>
bfc00cb0:	30720004 	andi	s2,v1,0x4
bfc00cb4:	10c0003d 	beqz	a2,bfc00dac <core_mark+0x79c>
bfc00cb8:	00000000 	nop
bfc00cbc:	3c108000 	lui	s0,0x8000
bfc00cc0:	2612044c 	addiu	s2,s0,1100
bfc00cc4:	27b10020 	addiu	s1,sp,32
bfc00cc8:	00008021 	move	s0,zero
bfc00ccc:	00103080 	sll	a2,s0,0x2
bfc00cd0:	0010f180 	sll	s8,s0,0x6
bfc00cd4:	00de2021 	addu	a0,a2,s8
bfc00cd8:	0224f821 	addu	ra,s1,a0
bfc00cdc:	97e6003c 	lhu	a2,60(ra)
bfc00ce0:	02002821 	move	a1,s0
bfc00ce4:	02402021 	move	a0,s2
bfc00ce8:	0ff026e4 	jal	bfc09b90 <printf>
bfc00cec:	26170001 	addiu	s7,s0,1
bfc00cf0:	32f0ffff 	andi	s0,s7,0xffff
bfc00cf4:	8f868010 	lw	a2,-32752(gp)
bfc00cf8:	00104880 	sll	t1,s0,0x2
bfc00cfc:	0010a980 	sll	s5,s0,0x6
bfc00d00:	01353821 	addu	a3,t1,s5
bfc00d04:	0206b02b 	sltu	s6,s0,a2
bfc00d08:	02402021 	move	a0,s2
bfc00d0c:	02271821 	addu	v1,s1,a3
bfc00d10:	12c00023 	beqz	s6,bfc00da0 <core_mark+0x790>
bfc00d14:	02002821 	move	a1,s0
bfc00d18:	9466003c 	lhu	a2,60(v1)
bfc00d1c:	0ff026e4 	jal	bfc09b90 <printf>
bfc00d20:	26140001 	addiu	s4,s0,1
bfc00d24:	3290ffff 	andi	s0,s4,0xffff
bfc00d28:	8f868010 	lw	a2,-32752(gp)
bfc00d2c:	0010c880 	sll	t9,s0,0x2
bfc00d30:	00101180 	sll	v0,s0,0x6
bfc00d34:	0322c021 	addu	t8,t9,v0
bfc00d38:	0206402b 	sltu	t0,s0,a2
bfc00d3c:	02402021 	move	a0,s2
bfc00d40:	02381821 	addu	v1,s1,t8
bfc00d44:	11000016 	beqz	t0,bfc00da0 <core_mark+0x790>
bfc00d48:	02002821 	move	a1,s0
bfc00d4c:	9466003c 	lhu	a2,60(v1)
bfc00d50:	0ff026e4 	jal	bfc09b90 <printf>
bfc00d54:	26150001 	addiu	s5,s0,1
bfc00d58:	32b0ffff 	andi	s0,s5,0xffff
bfc00d5c:	8f868010 	lw	a2,-32752(gp)
bfc00d60:	00101980 	sll	v1,s0,0x6
bfc00d64:	00104880 	sll	t1,s0,0x2
bfc00d68:	01233821 	addu	a3,t1,v1
bfc00d6c:	0206b02b 	sltu	s6,s0,a2
bfc00d70:	02402021 	move	a0,s2
bfc00d74:	02271821 	addu	v1,s1,a3
bfc00d78:	12c00009 	beqz	s6,bfc00da0 <core_mark+0x790>
bfc00d7c:	02002821 	move	a1,s0
bfc00d80:	9466003c 	lhu	a2,60(v1)
bfc00d84:	0ff026e4 	jal	bfc09b90 <printf>
bfc00d88:	261e0001 	addiu	s8,s0,1
bfc00d8c:	8f868010 	lw	a2,-32752(gp)
bfc00d90:	33d0ffff 	andi	s0,s8,0xffff
bfc00d94:	0206b82b 	sltu	s7,s0,a2
bfc00d98:	16e0ffcc 	bnez	s7,bfc00ccc <core_mark+0x6bc>
bfc00d9c:	00000000 	nop
bfc00da0:	8fa30040 	lw	v1,64(sp)
bfc00da4:	00000000 	nop
bfc00da8:	30720004 	andi	s2,v1,0x4
bfc00dac:	1240003f 	beqz	s2,bfc00eac <core_mark+0x89c>
bfc00db0:	00000000 	nop
bfc00db4:	10c0007a 	beqz	a2,bfc00fa0 <core_mark+0x990>
bfc00db8:	00000000 	nop
bfc00dbc:	3c118000 	lui	s1,0x8000
bfc00dc0:	26320468 	addiu	s2,s1,1128
bfc00dc4:	00008021 	move	s0,zero
bfc00dc8:	27b10020 	addiu	s1,sp,32
bfc00dcc:	00104080 	sll	t0,s0,0x2
bfc00dd0:	0010c180 	sll	t8,s0,0x6
bfc00dd4:	01187821 	addu	t7,t0,t8
bfc00dd8:	022f7021 	addu	t6,s1,t7
bfc00ddc:	95c6003e 	lhu	a2,62(t6)
bfc00de0:	02002821 	move	a1,s0
bfc00de4:	0ff026e4 	jal	bfc09b90 <printf>
bfc00de8:	02402021 	move	a0,s2
bfc00dec:	26050001 	addiu	a1,s0,1
bfc00df0:	30b0ffff 	andi	s0,a1,0xffff
bfc00df4:	8f868010 	lw	a2,-32752(gp)
bfc00df8:	00106080 	sll	t4,s0,0x2
bfc00dfc:	00106980 	sll	t5,s0,0x6
bfc00e00:	018d5821 	addu	t3,t4,t5
bfc00e04:	0206502b 	sltu	t2,s0,a2
bfc00e08:	02402021 	move	a0,s2
bfc00e0c:	022b1821 	addu	v1,s1,t3
bfc00e10:	11400026 	beqz	t2,bfc00eac <core_mark+0x89c>
bfc00e14:	02002821 	move	a1,s0
bfc00e18:	9466003e 	lhu	a2,62(v1)
bfc00e1c:	0ff026e4 	jal	bfc09b90 <printf>
bfc00e20:	00000000 	nop
bfc00e24:	260a0001 	addiu	t2,s0,1
bfc00e28:	3150ffff 	andi	s0,t2,0xffff
bfc00e2c:	8f868010 	lw	a2,-32752(gp)
bfc00e30:	0010b880 	sll	s7,s0,0x2
bfc00e34:	0010f180 	sll	s8,s0,0x6
bfc00e38:	02fea821 	addu	s5,s7,s8
bfc00e3c:	0206482b 	sltu	t1,s0,a2
bfc00e40:	02402021 	move	a0,s2
bfc00e44:	02351821 	addu	v1,s1,s5
bfc00e48:	11200018 	beqz	t1,bfc00eac <core_mark+0x89c>
bfc00e4c:	02002821 	move	a1,s0
bfc00e50:	9466003e 	lhu	a2,62(v1)
bfc00e54:	0ff026e4 	jal	bfc09b90 <printf>
bfc00e58:	00000000 	nop
bfc00e5c:	260e0001 	addiu	t6,s0,1
bfc00e60:	31d0ffff 	andi	s0,t6,0xffff
bfc00e64:	8f868010 	lw	a2,-32752(gp)
bfc00e68:	00102980 	sll	a1,s0,0x6
bfc00e6c:	00106880 	sll	t5,s0,0x2
bfc00e70:	01a56021 	addu	t4,t5,a1
bfc00e74:	0206582b 	sltu	t3,s0,a2
bfc00e78:	02402021 	move	a0,s2
bfc00e7c:	022c1821 	addu	v1,s1,t4
bfc00e80:	1160000a 	beqz	t3,bfc00eac <core_mark+0x89c>
bfc00e84:	02002821 	move	a1,s0
bfc00e88:	9466003e 	lhu	a2,62(v1)
bfc00e8c:	0ff026e4 	jal	bfc09b90 <printf>
bfc00e90:	00000000 	nop
bfc00e94:	260f0001 	addiu	t7,s0,1
bfc00e98:	8f868010 	lw	a2,-32752(gp)
bfc00e9c:	31f0ffff 	andi	s0,t7,0xffff
bfc00ea0:	0206202b 	sltu	a0,s0,a2
bfc00ea4:	1480ffc9 	bnez	a0,bfc00dcc <core_mark+0x7bc>
bfc00ea8:	00000000 	nop
bfc00eac:	10c0003c 	beqz	a2,bfc00fa0 <core_mark+0x990>
bfc00eb0:	00000000 	nop
bfc00eb4:	3c198000 	lui	t9,0x8000
bfc00eb8:	27320484 	addiu	s2,t9,1156
bfc00ebc:	00008021 	move	s0,zero
bfc00ec0:	27b10020 	addiu	s1,sp,32
bfc00ec4:	0010f880 	sll	ra,s0,0x2
bfc00ec8:	00102180 	sll	a0,s0,0x6
bfc00ecc:	03e4b821 	addu	s7,ra,a0
bfc00ed0:	0237a821 	addu	s5,s1,s7
bfc00ed4:	96a60038 	lhu	a2,56(s5)
bfc00ed8:	02002821 	move	a1,s0
bfc00edc:	0ff026e4 	jal	bfc09b90 <printf>
bfc00ee0:	02402021 	move	a0,s2
bfc00ee4:	26090001 	addiu	t1,s0,1
bfc00ee8:	3130ffff 	andi	s0,t1,0xffff
bfc00eec:	8f948010 	lw	s4,-32752(gp)
bfc00ef0:	00101980 	sll	v1,s0,0x6
bfc00ef4:	00103880 	sll	a3,s0,0x2
bfc00ef8:	00e3b021 	addu	s6,a3,v1
bfc00efc:	0214102b 	sltu	v0,s0,s4
bfc00f00:	02402021 	move	a0,s2
bfc00f04:	02361821 	addu	v1,s1,s6
bfc00f08:	10400025 	beqz	v0,bfc00fa0 <core_mark+0x990>
bfc00f0c:	02002821 	move	a1,s0
bfc00f10:	94660038 	lhu	a2,56(v1)
bfc00f14:	0ff026e4 	jal	bfc09b90 <printf>
bfc00f18:	00000000 	nop
bfc00f1c:	260e0001 	addiu	t6,s0,1
bfc00f20:	31d0ffff 	andi	s0,t6,0xffff
bfc00f24:	8f8b8010 	lw	t3,-32752(gp)
bfc00f28:	00102980 	sll	a1,s0,0x6
bfc00f2c:	00106880 	sll	t5,s0,0x2
bfc00f30:	01a56021 	addu	t4,t5,a1
bfc00f34:	020b502b 	sltu	t2,s0,t3
bfc00f38:	02402021 	move	a0,s2
bfc00f3c:	022c1821 	addu	v1,s1,t4
bfc00f40:	11400017 	beqz	t2,bfc00fa0 <core_mark+0x990>
bfc00f44:	02002821 	move	a1,s0
bfc00f48:	94660038 	lhu	a2,56(v1)
bfc00f4c:	0ff026e4 	jal	bfc09b90 <printf>
bfc00f50:	26140001 	addiu	s4,s0,1
bfc00f54:	3290ffff 	andi	s0,s4,0xffff
bfc00f58:	8f888010 	lw	t0,-32752(gp)
bfc00f5c:	0010c880 	sll	t9,s0,0x2
bfc00f60:	00101180 	sll	v0,s0,0x6
bfc00f64:	0322c021 	addu	t8,t9,v0
bfc00f68:	0208782b 	sltu	t7,s0,t0
bfc00f6c:	02402021 	move	a0,s2
bfc00f70:	02381821 	addu	v1,s1,t8
bfc00f74:	11e0000a 	beqz	t7,bfc00fa0 <core_mark+0x990>
bfc00f78:	02002821 	move	a1,s0
bfc00f7c:	94660038 	lhu	a2,56(v1)
bfc00f80:	0ff026e4 	jal	bfc09b90 <printf>
bfc00f84:	00000000 	nop
bfc00f88:	26030001 	addiu	v1,s0,1
bfc00f8c:	8f878010 	lw	a3,-32752(gp)
bfc00f90:	3070ffff 	andi	s0,v1,0xffff
bfc00f94:	0207b02b 	sltu	s6,s0,a3
bfc00f98:	16c0ffca 	bnez	s6,bfc00ec4 <core_mark+0x8b4>
bfc00f9c:	00000000 	nop
bfc00fa0:	126000f7 	beqz	s3,bfc01380 <core_mark+0xd70>
bfc00fa4:	3c108000 	lui	s0,0x8000
bfc00fa8:	1a600109 	blez	s3,bfc013d0 <core_mark+0xdc0>
bfc00fac:	3c068000 	lui	a2,0x8000
bfc00fb0:	0ff027aa 	jal	bfc09ea8 <puts>
bfc00fb4:	24c404ec 	addiu	a0,a2,1260
bfc00fb8:	0ff026d8 	jal	bfc09b60 <portable_fini>
bfc00fbc:	27a40062 	addiu	a0,sp,98
bfc00fc0:	8fbf0864 	lw	ra,2148(sp)
bfc00fc4:	02601021 	move	v0,s3
bfc00fc8:	8fbe0860 	lw	s8,2144(sp)
bfc00fcc:	8fb7085c 	lw	s7,2140(sp)
bfc00fd0:	8fb60858 	lw	s6,2136(sp)
bfc00fd4:	8fb50854 	lw	s5,2132(sp)
bfc00fd8:	8fb40850 	lw	s4,2128(sp)
bfc00fdc:	8fb3084c 	lw	s3,2124(sp)
bfc00fe0:	8fb20848 	lw	s2,2120(sp)
bfc00fe4:	8fb10844 	lw	s1,2116(sp)
bfc00fe8:	8fb00840 	lw	s0,2112(sp)
bfc00fec:	03e00008 	jr	ra
bfc00ff0:	27bd0868 	addiu	sp,sp,2152
	...
bfc01000:	87a30022 	lh	v1,34(sp)
bfc01004:	87b20020 	lh	s2,32(sp)
bfc01008:	00038400 	sll	s0,v1,0x10
bfc0100c:	8fa40038 	lw	a0,56(sp)
bfc01010:	8fa50030 	lw	a1,48(sp)
bfc01014:	02123025 	or	a2,s0,s2
bfc01018:	0ff0050c 	jal	bfc01430 <core_init_matrix>
bfc0101c:	27a70048 	addiu	a3,sp,72
bfc01020:	8fb00040 	lw	s0,64(sp)
bfc01024:	0bf001e5 	j	bfc00794 <core_mark+0x184>
bfc01028:	32020004 	andi	v0,s0,0x4
bfc0102c:	00000000 	nop
bfc01030:	afa5002c 	sw	a1,44(sp)
bfc01034:	0bf001cb 	j	bfc0072c <core_mark+0x11c>
bfc01038:	24030001 	li	v1,1
bfc0103c:	00000000 	nop
bfc01040:	14400002 	bnez	v0,bfc0104c <core_mark+0xa3c>
bfc01044:	01c2001b 	divu	zero,t6,v0
bfc01048:	0007000d 	break	0x7
bfc0104c:	8fab003c 	lw	t3,60(sp)
bfc01050:	00006812 	mflo	t5
bfc01054:	25ac0001 	addiu	t4,t5,1
bfc01058:	00000000 	nop
bfc0105c:	016c0018 	mult	t3,t4
bfc01060:	00005012 	mflo	t2
bfc01064:	0bf00259 	j	bfc00964 <core_mark+0x354>
bfc01068:	afaa003c 	sw	t2,60(sp)
bfc0106c:	00000000 	nop
bfc01070:	0bf001c1 	j	bfc00704 <core_mark+0xf4>
bfc01074:	00601021 	move	v0,v1
	...
bfc01080:	0bf001bd 	j	bfc006f4 <core_mark+0xe4>
bfc01084:	00801821 	move	v1,a0
	...
bfc01090:	105f00e0 	beq	v0,ra,bfc01414 <core_mark+0xe04>
bfc01094:	24114eaf 	li	s1,20143
bfc01098:	1451feab 	bne	v0,s1,bfc00b48 <core_mark+0x538>
bfc0109c:	3410ffff 	li	s0,0xffff
bfc010a0:	3c038000 	lui	v1,0x8000
bfc010a4:	0ff027aa 	jal	bfc09ea8 <puts>
bfc010a8:	24640100 	addiu	a0,v1,256
bfc010ac:	24050002 	li	a1,2
bfc010b0:	8f868010 	lw	a2,-32752(gp)
bfc010b4:	00000000 	nop
bfc010b8:	10c000db 	beqz	a2,bfc01428 <core_mark+0xe18>
bfc010bc:	3c0e8000 	lui	t6,0x8000
bfc010c0:	3c098000 	lui	t1,0x8000
bfc010c4:	00052840 	sll	a1,a1,0x1
bfc010c8:	25cd0598 	addiu	t5,t6,1432
bfc010cc:	3c0b8000 	lui	t3,0x8000
bfc010d0:	2528058c 	addiu	t0,t1,1420
bfc010d4:	00ad6021 	addu	t4,a1,t5
bfc010d8:	256a0580 	addiu	t2,t3,1408
bfc010dc:	00a83821 	addu	a3,a1,t0
bfc010e0:	afac083c 	sw	t4,2108(sp)
bfc010e4:	00aaf021 	addu	s8,a1,t2
bfc010e8:	afa70838 	sw	a3,2104(sp)
bfc010ec:	00008821 	move	s1,zero
bfc010f0:	0000a021 	move	s4,zero
bfc010f4:	27b50020 	addiu	s5,sp,32
bfc010f8:	00119880 	sll	s3,s1,0x2
bfc010fc:	00119180 	sll	s2,s1,0x6
bfc01100:	0272c021 	addu	t8,s3,s2
bfc01104:	02b88021 	addu	s0,s5,t8
bfc01108:	8e080020 	lw	t0,32(s0)
bfc0110c:	00000000 	nop
bfc01110:	310f0001 	andi	t7,t0,0x1
bfc01114:	11e0000f 	beqz	t7,bfc01154 <core_mark+0xb44>
bfc01118:	a6000040 	sh	zero,64(s0)
bfc0111c:	961f003a 	lhu	ra,58(s0)
bfc01120:	97d90000 	lhu	t9,0(s8)
bfc01124:	3c038000 	lui	v1,0x8000
bfc01128:	02202821 	move	a1,s1
bfc0112c:	24640188 	addiu	a0,v1,392
bfc01130:	03e03021 	move	a2,ra
bfc01134:	13f90007 	beq	ra,t9,bfc01154 <core_mark+0xb44>
bfc01138:	03203821 	move	a3,t9
bfc0113c:	0ff026e4 	jal	bfc09b90 <printf>
bfc01140:	00000000 	nop
bfc01144:	96040040 	lhu	a0,64(s0)
bfc01148:	8e080020 	lw	t0,32(s0)
bfc0114c:	24820001 	addiu	v0,a0,1
bfc01150:	a6020040 	sh	v0,64(s0)
bfc01154:	02723821 	addu	a3,s3,s2
bfc01158:	31060002 	andi	a2,t0,0x2
bfc0115c:	10c00010 	beqz	a2,bfc011a0 <core_mark+0xb90>
bfc01160:	02a78021 	addu	s0,s5,a3
bfc01164:	8fab0838 	lw	t3,2104(sp)
bfc01168:	960a003c 	lhu	t2,60(s0)
bfc0116c:	95690000 	lhu	t1,0(t3)
bfc01170:	3c0c8000 	lui	t4,0x8000
bfc01174:	02202821 	move	a1,s1
bfc01178:	258401b8 	addiu	a0,t4,440
bfc0117c:	01403021 	move	a2,t2
bfc01180:	11490007 	beq	t2,t1,bfc011a0 <core_mark+0xb90>
bfc01184:	01203821 	move	a3,t1
bfc01188:	0ff026e4 	jal	bfc09b90 <printf>
bfc0118c:	00000000 	nop
bfc01190:	960d0040 	lhu	t5,64(s0)
bfc01194:	8e080020 	lw	t0,32(s0)
bfc01198:	25a50001 	addiu	a1,t5,1
bfc0119c:	a6050040 	sh	a1,64(s0)
bfc011a0:	02727821 	addu	t7,s3,s2
bfc011a4:	310e0004 	andi	t6,t0,0x4
bfc011a8:	11c00010 	beqz	t6,bfc011ec <core_mark+0xbdc>
bfc011ac:	02af8021 	addu	s0,s5,t7
bfc011b0:	8fb9083c 	lw	t9,2108(sp)
bfc011b4:	9618003e 	lhu	t8,62(s0)
bfc011b8:	97280000 	lhu	t0,0(t9)
bfc011bc:	3c1f8000 	lui	ra,0x8000
bfc011c0:	02202821 	move	a1,s1
bfc011c4:	27e401ec 	addiu	a0,ra,492
bfc011c8:	03003021 	move	a2,t8
bfc011cc:	13080007 	beq	t8,t0,bfc011ec <core_mark+0xbdc>
bfc011d0:	01003821 	move	a3,t0
bfc011d4:	0ff026e4 	jal	bfc09b90 <printf>
bfc011d8:	00000000 	nop
bfc011dc:	96020040 	lhu	v0,64(s0)
bfc011e0:	00000000 	nop
bfc011e4:	24430001 	addiu	v1,v0,1
bfc011e8:	a6030040 	sh	v1,64(s0)
bfc011ec:	02724821 	addu	t1,s3,s2
bfc011f0:	02a93821 	addu	a3,s5,t1
bfc011f4:	94e40040 	lhu	a0,64(a3)
bfc011f8:	26260001 	addiu	a2,s1,1
bfc011fc:	8f928010 	lw	s2,-32752(gp)
bfc01200:	30d1ffff 	andi	s1,a2,0xffff
bfc01204:	02848021 	addu	s0,s4,a0
bfc01208:	0010a400 	sll	s4,s0,0x10
bfc0120c:	0232982b 	sltu	s3,s1,s2
bfc01210:	1660ffb9 	bnez	s3,bfc010f8 <core_mark+0xae8>
bfc01214:	0014a403 	sra	s4,s4,0x10
bfc01218:	0bf002d2 	j	bfc00b48 <core_mark+0x538>
bfc0121c:	3290ffff 	andi	s0,s4,0xffff
bfc01220:	a7a00020 	sh	zero,32(sp)
bfc01224:	a7a00022 	sh	zero,34(sp)
bfc01228:	8fa30020 	lw	v1,32(sp)
bfc0122c:	24070001 	li	a3,1
bfc01230:	1467fd24 	bne	v1,a3,bfc006c4 <core_mark+0xb4>
bfc01234:	a7a60024 	sh	a2,36(sp)
bfc01238:	87a80024 	lh	t0,36(sp)
bfc0123c:	00000000 	nop
bfc01240:	1500fd20 	bnez	t0,bfc006c4 <core_mark+0xb4>
bfc01244:	24093415 	li	t1,13333
bfc01248:	240a0066 	li	t2,102
bfc0124c:	a7a90022 	sh	t1,34(sp)
bfc01250:	a7aa0024 	sh	t2,36(sp)
bfc01254:	0bf001b1 	j	bfc006c4 <core_mark+0xb4>
bfc01258:	a7a90020 	sh	t1,32(sp)
bfc0125c:	0ff027aa 	jal	bfc09ea8 <puts>
bfc01260:	24440130 	addiu	a0,v0,304
bfc01264:	0bf0042c 	j	bfc010b0 <core_mark+0xaa0>
bfc01268:	24050003 	li	a1,3
bfc0126c:	00000000 	nop
bfc01270:	8f868010 	lw	a2,-32752(gp)
bfc01274:	00000000 	nop
bfc01278:	10c0fe8b 	beqz	a2,bfc00ca8 <core_mark+0x698>
bfc0127c:	3c0c8000 	lui	t4,0x8000
bfc01280:	25920430 	addiu	s2,t4,1072
bfc01284:	00008021 	move	s0,zero
bfc01288:	27b10020 	addiu	s1,sp,32
bfc0128c:	00101980 	sll	v1,s0,0x6
bfc01290:	00101080 	sll	v0,s0,0x2
bfc01294:	0043c821 	addu	t9,v0,v1
bfc01298:	0239c021 	addu	t8,s1,t9
bfc0129c:	9706003a 	lhu	a2,58(t8)
bfc012a0:	02002821 	move	a1,s0
bfc012a4:	0ff026e4 	jal	bfc09b90 <printf>
bfc012a8:	02402021 	move	a0,s2
bfc012ac:	26080001 	addiu	t0,s0,1
bfc012b0:	3110ffff 	andi	s0,t0,0xffff
bfc012b4:	8f868010 	lw	a2,-32752(gp)
bfc012b8:	00107080 	sll	t6,s0,0x2
bfc012bc:	00107980 	sll	t7,s0,0x6
bfc012c0:	01cf2821 	addu	a1,t6,t7
bfc012c4:	0206682b 	sltu	t5,s0,a2
bfc012c8:	02251821 	addu	v1,s1,a1
bfc012cc:	02402021 	move	a0,s2
bfc012d0:	11a00026 	beqz	t5,bfc0136c <core_mark+0xd5c>
bfc012d4:	02002821 	move	a1,s0
bfc012d8:	9466003a 	lhu	a2,58(v1)
bfc012dc:	0ff026e4 	jal	bfc09b90 <printf>
bfc012e0:	00000000 	nop
bfc012e4:	26050001 	addiu	a1,s0,1
bfc012e8:	30b0ffff 	andi	s0,a1,0xffff
bfc012ec:	8f868010 	lw	a2,-32752(gp)
bfc012f0:	00106080 	sll	t4,s0,0x2
bfc012f4:	00106980 	sll	t5,s0,0x6
bfc012f8:	018d5821 	addu	t3,t4,t5
bfc012fc:	0206502b 	sltu	t2,s0,a2
bfc01300:	02402021 	move	a0,s2
bfc01304:	022b1821 	addu	v1,s1,t3
bfc01308:	11400018 	beqz	t2,bfc0136c <core_mark+0xd5c>
bfc0130c:	02002821 	move	a1,s0
bfc01310:	9466003a 	lhu	a2,58(v1)
bfc01314:	0ff026e4 	jal	bfc09b90 <printf>
bfc01318:	00000000 	nop
bfc0131c:	26190001 	addiu	t9,s0,1
bfc01320:	3330ffff 	andi	s0,t9,0xffff
bfc01324:	8f868010 	lw	a2,-32752(gp)
bfc01328:	00104080 	sll	t0,s0,0x2
bfc0132c:	0010c180 	sll	t8,s0,0x6
bfc01330:	01187821 	addu	t7,t0,t8
bfc01334:	0206702b 	sltu	t6,s0,a2
bfc01338:	02402021 	move	a0,s2
bfc0133c:	022f1821 	addu	v1,s1,t7
bfc01340:	11c0000a 	beqz	t6,bfc0136c <core_mark+0xd5c>
bfc01344:	02002821 	move	a1,s0
bfc01348:	9466003a 	lhu	a2,58(v1)
bfc0134c:	0ff026e4 	jal	bfc09b90 <printf>
bfc01350:	00000000 	nop
bfc01354:	26020001 	addiu	v0,s0,1
bfc01358:	8f868010 	lw	a2,-32752(gp)
bfc0135c:	3050ffff 	andi	s0,v0,0xffff
bfc01360:	0206202b 	sltu	a0,s0,a2
bfc01364:	1480ffc9 	bnez	a0,bfc0128c <core_mark+0xc7c>
bfc01368:	00000000 	nop
bfc0136c:	8fa30040 	lw	v1,64(sp)
bfc01370:	0bf0032b 	j	bfc00cac <core_mark+0x69c>
bfc01374:	30740002 	andi	s4,v1,0x2
	...
bfc01380:	0ff027aa 	jal	bfc09ea8 <puts>
bfc01384:	260404a0 	addiu	a0,s0,1184
bfc01388:	0bf003ee 	j	bfc00fb8 <core_mark+0x9a8>
bfc0138c:	00000000 	nop
bfc01390:	8fbf003c 	lw	ra,60(sp)
bfc01394:	8f928010 	lw	s2,-32752(gp)
bfc01398:	00002021 	move	a0,zero
bfc0139c:	025f0018 	mult	s2,ra
bfc013a0:	0000a012 	mflo	s4
bfc013a4:	0ff026cc 	jal	bfc09b30 <time_in_secs>
bfc013a8:	3c108000 	lui	s0,0x8000
bfc013ac:	26040340 	addiu	a0,s0,832
bfc013b0:	14400002 	bnez	v0,bfc013bc <core_mark+0xdac>
bfc013b4:	0282001b 	divu	zero,s4,v0
bfc013b8:	0007000d 	break	0x7
bfc013bc:	00001012 	mflo	v0
bfc013c0:	0ff026e4 	jal	bfc09b90 <printf>
bfc013c4:	00402821 	move	a1,v0
bfc013c8:	0bf0030a 	j	bfc00c28 <core_mark+0x618>
bfc013cc:	00000000 	nop
bfc013d0:	3c1e8000 	lui	s8,0x8000
bfc013d4:	0ff027aa 	jal	bfc09ea8 <puts>
bfc013d8:	27c404fc 	addiu	a0,s8,1276
bfc013dc:	0bf003ee 	j	bfc00fb8 <core_mark+0x9a8>
bfc013e0:	00000000 	nop
bfc013e4:	3c108000 	lui	s0,0x8000
bfc013e8:	0ff027aa 	jal	bfc09ea8 <puts>
bfc013ec:	260400a8 	addiu	a0,s0,168
bfc013f0:	0bf0042c 	j	bfc010b0 <core_mark+0xaa0>
bfc013f4:	00002821 	move	a1,zero
	...
bfc01400:	3c128000 	lui	s2,0x8000
bfc01404:	0ff027aa 	jal	bfc09ea8 <puts>
bfc01408:	264400d4 	addiu	a0,s2,212
bfc0140c:	0bf0042c 	j	bfc010b0 <core_mark+0xaa0>
bfc01410:	24050001 	li	a1,1
bfc01414:	3c048000 	lui	a0,0x8000
bfc01418:	0ff027aa 	jal	bfc09ea8 <puts>
bfc0141c:	2484015c 	addiu	a0,a0,348
bfc01420:	0bf0042c 	j	bfc010b0 <core_mark+0xaa0>
bfc01424:	24050004 	li	a1,4
bfc01428:	0bf002d2 	j	bfc00b48 <core_mark+0x538>
bfc0142c:	00008021 	move	s0,zero

bfc01430 <core_init_matrix>:
core_init_matrix():
bfc01430:	27bdffe8 	addiu	sp,sp,-24
bfc01434:	afb50014 	sw	s5,20(sp)
bfc01438:	afb40010 	sw	s4,16(sp)
bfc0143c:	afb3000c 	sw	s3,12(sp)
bfc01440:	afb20008 	sw	s2,8(sp)
bfc01444:	afb10004 	sw	s1,4(sp)
bfc01448:	afb00000 	sw	s0,0(sp)
bfc0144c:	00c06821 	move	t5,a2
bfc01450:	14c00002 	bnez	a2,bfc0145c <core_init_matrix+0x2c>
bfc01454:	00e0a821 	move	s5,a3
bfc01458:	240d0001 	li	t5,1
bfc0145c:	108000e3 	beqz	a0,bfc017ec <core_init_matrix+0x3bc>
bfc01460:	00004821 	move	t1,zero
bfc01464:	25260001 	addiu	a2,t1,1
bfc01468:	00c60018 	mult	a2,a2
bfc0146c:	24cf0007 	addiu	t7,a2,7
bfc01470:	24ca0003 	addiu	t2,a2,3
bfc01474:	24cb0004 	addiu	t3,a2,4
bfc01478:	24cc0005 	addiu	t4,a2,5
bfc0147c:	00003812 	mflo	a3
bfc01480:	000718c0 	sll	v1,a3,0x3
bfc01484:	0064102b 	sltu	v0,v1,a0
bfc01488:	10400039 	beqz	v0,bfc01570 <core_init_matrix+0x140>
bfc0148c:	24ce0006 	addiu	t6,a2,6
bfc01490:	24c80001 	addiu	t0,a2,1
bfc01494:	01080018 	mult	t0,t0
bfc01498:	00009012 	mflo	s2
bfc0149c:	001288c0 	sll	s1,s2,0x3
bfc014a0:	0224802b 	sltu	s0,s1,a0
bfc014a4:	12000032 	beqz	s0,bfc01570 <core_init_matrix+0x140>
bfc014a8:	00c04821 	move	t1,a2
bfc014ac:	25190001 	addiu	t9,t0,1
bfc014b0:	03390018 	mult	t9,t9
bfc014b4:	00009812 	mflo	s3
bfc014b8:	001390c0 	sll	s2,s3,0x3
bfc014bc:	0244882b 	sltu	s1,s2,a0
bfc014c0:	1220002b 	beqz	s1,bfc01570 <core_init_matrix+0x140>
bfc014c4:	01004821 	move	t1,t0
bfc014c8:	014a0018 	mult	t2,t2
bfc014cc:	00003812 	mflo	a3
bfc014d0:	0007c0c0 	sll	t8,a3,0x3
bfc014d4:	0304a02b 	sltu	s4,t8,a0
bfc014d8:	12800025 	beqz	s4,bfc01570 <core_init_matrix+0x140>
bfc014dc:	24c90002 	addiu	t1,a2,2
bfc014e0:	016b0018 	mult	t3,t3
bfc014e4:	01404821 	move	t1,t2
bfc014e8:	00001812 	mflo	v1
bfc014ec:	000380c0 	sll	s0,v1,0x3
bfc014f0:	0204502b 	sltu	t2,s0,a0
bfc014f4:	1140001e 	beqz	t2,bfc01570 <core_init_matrix+0x140>
bfc014f8:	018c0018 	mult	t4,t4
bfc014fc:	01604821 	move	t1,t3
bfc01500:	00003012 	mflo	a2
bfc01504:	000610c0 	sll	v0,a2,0x3
bfc01508:	0044582b 	sltu	t3,v0,a0
bfc0150c:	11600018 	beqz	t3,bfc01570 <core_init_matrix+0x140>
bfc01510:	01ce0018 	mult	t6,t6
bfc01514:	01804821 	move	t1,t4
bfc01518:	00008812 	mflo	s1
bfc0151c:	001140c0 	sll	t0,s1,0x3
bfc01520:	0104602b 	sltu	t4,t0,a0
bfc01524:	11800012 	beqz	t4,bfc01570 <core_init_matrix+0x140>
bfc01528:	01ef0018 	mult	t7,t7
bfc0152c:	01c04821 	move	t1,t6
bfc01530:	00009812 	mflo	s3
bfc01534:	001390c0 	sll	s2,s3,0x3
bfc01538:	0244702b 	sltu	t6,s2,a0
bfc0153c:	11c0000c 	beqz	t6,bfc01570 <core_init_matrix+0x140>
bfc01540:	25e60001 	addiu	a2,t7,1
bfc01544:	01e04821 	move	t1,t7
bfc01548:	00c60018 	mult	a2,a2
bfc0154c:	24cf0007 	addiu	t7,a2,7
bfc01550:	24ca0003 	addiu	t2,a2,3
bfc01554:	24cb0004 	addiu	t3,a2,4
bfc01558:	24cc0005 	addiu	t4,a2,5
bfc0155c:	00003812 	mflo	a3
bfc01560:	000718c0 	sll	v1,a3,0x3
bfc01564:	0064102b 	sltu	v0,v1,a0
bfc01568:	1440ffc9 	bnez	v0,bfc01490 <core_init_matrix+0x60>
bfc0156c:	24ce0006 	addiu	t6,a2,6
bfc01570:	01290018 	mult	t1,t1
bfc01574:	24a8ffff 	addiu	t0,a1,-1
bfc01578:	2404fffc 	li	a0,-4
bfc0157c:	01042824 	and	a1,t0,a0
bfc01580:	24b10004 	addiu	s1,a1,4
bfc01584:	00003012 	mflo	a2
bfc01588:	0006a040 	sll	s4,a2,0x1
bfc0158c:	1120009f 	beqz	t1,bfc0180c <core_init_matrix+0x3dc>
bfc01590:	02349021 	addu	s2,s1,s4
bfc01594:	0120c021 	move	t8,t1
bfc01598:	3c108000 	lui	s0,0x8000
bfc0159c:	3619ffff 	ori	t9,s0,0xffff
bfc015a0:	00189840 	sll	s3,t8,0x1
bfc015a4:	24080001 	li	t0,1
bfc015a8:	00003821 	move	a3,zero
bfc015ac:	00002821 	move	a1,zero
bfc015b0:	3c10ffff 	lui	s0,0xffff
bfc015b4:	01a80018 	mult	t5,t0
bfc015b8:	270affff 	addiu	t2,t8,-1
bfc015bc:	314f0001 	andi	t7,t2,0x1
bfc015c0:	02457021 	addu	t6,s2,a1
bfc015c4:	00004812 	mflo	t1
bfc015c8:	01393024 	and	a2,t1,t9
bfc015cc:	04c00080 	bltz	a2,bfc017d0 <core_init_matrix+0x3a0>
bfc015d0:	02255021 	addu	t2,s1,a1
bfc015d4:	310bffff 	andi	t3,t0,0xffff
bfc015d8:	01666021 	addu	t4,t3,a2
bfc015dc:	3183ffff 	andi	v1,t4,0xffff
bfc015e0:	006b1021 	addu	v0,v1,t3
bfc015e4:	24090001 	li	t1,1
bfc015e8:	304d00ff 	andi	t5,v0,0xff
bfc015ec:	0138202b 	sltu	a0,t1,t8
bfc015f0:	a5c30000 	sh	v1,0(t6)
bfc015f4:	25080001 	addiu	t0,t0,1
bfc015f8:	a54d0000 	sh	t5,0(t2)
bfc015fc:	25cc0002 	addiu	t4,t6,2
bfc01600:	00c06821 	move	t5,a2
bfc01604:	1080005b 	beqz	a0,bfc01774 <core_init_matrix+0x344>
bfc01608:	254b0002 	addiu	t3,t2,2
bfc0160c:	11e00032 	beqz	t7,bfc016d8 <core_init_matrix+0x2a8>
bfc01610:	01a80018 	mult	t5,t0
bfc01614:	00c80018 	mult	a2,t0
bfc01618:	00007812 	mflo	t7
bfc0161c:	01f93024 	and	a2,t7,t9
bfc01620:	04c0006f 	bltz	a2,bfc017e0 <core_init_matrix+0x3b0>
bfc01624:	24cdffff 	addiu	t5,a2,-1
bfc01628:	3104ffff 	andi	a0,t0,0xffff
bfc0162c:	00c06821 	move	t5,a2
bfc01630:	00863021 	addu	a2,a0,a2
bfc01634:	30c3ffff 	andi	v1,a2,0xffff
bfc01638:	00647821 	addu	t7,v1,a0
bfc0163c:	25290001 	addiu	t1,t1,1
bfc01640:	31e200ff 	andi	v0,t7,0xff
bfc01644:	0138302b 	sltu	a2,t1,t8
bfc01648:	a5c30002 	sh	v1,2(t6)
bfc0164c:	25080001 	addiu	t0,t0,1
bfc01650:	a5420002 	sh	v0,2(t2)
bfc01654:	258c0002 	addiu	t4,t4,2
bfc01658:	14c0001e 	bnez	a2,bfc016d4 <core_init_matrix+0x2a4>
bfc0165c:	256b0002 	addiu	t3,t3,2
bfc01660:	0bf005de 	j	bfc01778 <core_init_matrix+0x348>
bfc01664:	24e70001 	addiu	a3,a3,1
	...
bfc01670:	004a0018 	mult	v0,t2
bfc01674:	01021821 	addu	v1,t0,v0
bfc01678:	306dffff 	andi	t5,v1,0xffff
bfc0167c:	01a81021 	addu	v0,t5,t0
bfc01680:	304600ff 	andi	a2,v0,0xff
bfc01684:	a58d0000 	sh	t5,0(t4)
bfc01688:	a5660000 	sh	a2,0(t3)
bfc0168c:	00002012 	mflo	a0
bfc01690:	00993024 	and	a2,a0,t9
bfc01694:	04c00027 	bltz	a2,bfc01734 <core_init_matrix+0x304>
bfc01698:	24cbffff 	addiu	t3,a2,-1
bfc0169c:	00c06821 	move	t5,a2
bfc016a0:	3146ffff 	andi	a2,t2,0xffff
bfc016a4:	00cd4021 	addu	t0,a2,t5
bfc016a8:	3103ffff 	andi	v1,t0,0xffff
bfc016ac:	00661021 	addu	v0,v1,a2
bfc016b0:	25290001 	addiu	t1,t1,1
bfc016b4:	304c00ff 	andi	t4,v0,0xff
bfc016b8:	0138202b 	sltu	a0,t1,t8
bfc016bc:	a5c30000 	sh	v1,0(t6)
bfc016c0:	25480001 	addiu	t0,t2,1
bfc016c4:	a5ec0000 	sh	t4,0(t7)
bfc016c8:	25eb0002 	addiu	t3,t7,2
bfc016cc:	10800029 	beqz	a0,bfc01774 <core_init_matrix+0x344>
bfc016d0:	25cc0002 	addiu	t4,t6,2
bfc016d4:	01a80018 	mult	t5,t0
bfc016d8:	250a0001 	addiu	t2,t0,1
bfc016dc:	258e0002 	addiu	t6,t4,2
bfc016e0:	3108ffff 	andi	t0,t0,0xffff
bfc016e4:	256f0002 	addiu	t7,t3,2
bfc016e8:	00006812 	mflo	t5
bfc016ec:	01b91024 	and	v0,t5,t9
bfc016f0:	0441ffdf 	bgez	v0,bfc01670 <core_init_matrix+0x240>
bfc016f4:	25290001 	addiu	t1,t1,1
bfc016f8:	2443ffff 	addiu	v1,v0,-1
bfc016fc:	00701025 	or	v0,v1,s0
bfc01700:	24420001 	addiu	v0,v0,1
bfc01704:	004a0018 	mult	v0,t2
bfc01708:	01021821 	addu	v1,t0,v0
bfc0170c:	306dffff 	andi	t5,v1,0xffff
bfc01710:	01a81021 	addu	v0,t5,t0
bfc01714:	304600ff 	andi	a2,v0,0xff
bfc01718:	a58d0000 	sh	t5,0(t4)
bfc0171c:	a5660000 	sh	a2,0(t3)
bfc01720:	00002012 	mflo	a0
bfc01724:	00993024 	and	a2,a0,t9
bfc01728:	04c1ffdd 	bgez	a2,bfc016a0 <core_init_matrix+0x270>
bfc0172c:	00c06821 	move	t5,a2
bfc01730:	24cbffff 	addiu	t3,a2,-1
bfc01734:	01704025 	or	t0,t3,s0
bfc01738:	25060001 	addiu	a2,t0,1
bfc0173c:	00c06821 	move	t5,a2
bfc01740:	3146ffff 	andi	a2,t2,0xffff
bfc01744:	00cd4021 	addu	t0,a2,t5
bfc01748:	3103ffff 	andi	v1,t0,0xffff
bfc0174c:	00661021 	addu	v0,v1,a2
bfc01750:	25290001 	addiu	t1,t1,1
bfc01754:	304c00ff 	andi	t4,v0,0xff
bfc01758:	0138202b 	sltu	a0,t1,t8
bfc0175c:	a5c30000 	sh	v1,0(t6)
bfc01760:	25480001 	addiu	t0,t2,1
bfc01764:	a5ec0000 	sh	t4,0(t7)
bfc01768:	25eb0002 	addiu	t3,t7,2
bfc0176c:	1480ffd9 	bnez	a0,bfc016d4 <core_init_matrix+0x2a4>
bfc01770:	25cc0002 	addiu	t4,t6,2
bfc01774:	24e70001 	addiu	a3,a3,1
bfc01778:	00f8582b 	sltu	t3,a3,t8
bfc0177c:	1560ff8d 	bnez	t3,bfc015b4 <core_init_matrix+0x184>
bfc01780:	00b32821 	addu	a1,a1,s3
bfc01784:	2699ffff 	addiu	t9,s4,-1
bfc01788:	02597821 	addu	t7,s2,t9
bfc0178c:	2413fffc 	li	s3,-4
bfc01790:	01f37024 	and	t6,t7,s3
bfc01794:	25cc0004 	addiu	t4,t6,4
bfc01798:	aeb10004 	sw	s1,4(s5)
bfc0179c:	aeb20008 	sw	s2,8(s5)
bfc017a0:	aeac000c 	sw	t4,12(s5)
bfc017a4:	aeb80000 	sw	t8,0(s5)
bfc017a8:	03001021 	move	v0,t8
bfc017ac:	8fb50014 	lw	s5,20(sp)
bfc017b0:	8fb40010 	lw	s4,16(sp)
bfc017b4:	8fb3000c 	lw	s3,12(sp)
bfc017b8:	8fb20008 	lw	s2,8(sp)
bfc017bc:	8fb10004 	lw	s1,4(sp)
bfc017c0:	8fb00000 	lw	s0,0(sp)
bfc017c4:	03e00008 	jr	ra
bfc017c8:	27bd0018 	addiu	sp,sp,24
bfc017cc:	00000000 	nop
bfc017d0:	24c4ffff 	addiu	a0,a2,-1
bfc017d4:	00904825 	or	t1,a0,s0
bfc017d8:	0bf00575 	j	bfc015d4 <core_init_matrix+0x1a4>
bfc017dc:	25260001 	addiu	a2,t1,1
bfc017e0:	01b02025 	or	a0,t5,s0
bfc017e4:	0bf0058a 	j	bfc01628 <core_init_matrix+0x1f8>
bfc017e8:	24860001 	addiu	a2,a0,1
bfc017ec:	24b8ffff 	addiu	t8,a1,-1
bfc017f0:	2407fffc 	li	a3,-4
bfc017f4:	0307a024 	and	s4,t8,a3
bfc017f8:	26920006 	addiu	s2,s4,6
bfc017fc:	26910004 	addiu	s1,s4,4
bfc01800:	2418ffff 	li	t8,-1
bfc01804:	0bf00566 	j	bfc01598 <core_init_matrix+0x168>
bfc01808:	24140002 	li	s4,2
bfc0180c:	0bf005e1 	j	bfc01784 <core_init_matrix+0x354>
bfc01810:	0000c021 	move	t8,zero
	...

bfc01820 <matrix_sum>:
matrix_sum():
bfc01820:	00063400 	sll	a2,a2,0x10
bfc01824:	00807021 	move	t6,a0
bfc01828:	108000c7 	beqz	a0,bfc01b48 <matrix_sum+0x328>
bfc0182c:	00063403 	sra	a2,a2,0x10
bfc01830:	0004c080 	sll	t8,a0,0x2
bfc01834:	00004021 	move	t0,zero
bfc01838:	00001821 	move	v1,zero
bfc0183c:	00004821 	move	t1,zero
bfc01840:	00007821 	move	t7,zero
bfc01844:	8cac0000 	lw	t4,0(a1)
bfc01848:	3122ffff 	andi	v0,t1,0xffff
bfc0184c:	010c5021 	addu	t2,t0,t4
bfc01850:	006c402a 	slt	t0,v1,t4
bfc01854:	00485821 	addu	t3,v0,t0
bfc01858:	2447000a 	addiu	a3,v0,10
bfc0185c:	25cdffff 	addiu	t5,t6,-1
bfc01860:	0007cc00 	sll	t9,a3,0x10
bfc01864:	000b4c00 	sll	t1,t3,0x10
bfc01868:	00ca402a 	slt	t0,a2,t2
bfc0186c:	31a40003 	andi	a0,t5,0x3
bfc01870:	00193c03 	sra	a3,t9,0x10
bfc01874:	150000a6 	bnez	t0,bfc01b10 <matrix_sum+0x2f0>
bfc01878:	00091403 	sra	v0,t1,0x10
bfc0187c:	00404821 	move	t1,v0
bfc01880:	15000002 	bnez	t0,bfc0188c <matrix_sum+0x6c>
bfc01884:	00004021 	move	t0,zero
bfc01888:	01404021 	move	t0,t2
bfc0188c:	240b0001 	li	t3,1
bfc01890:	016ec82b 	sltu	t9,t3,t6
bfc01894:	24aa0004 	addiu	t2,a1,4
bfc01898:	13200087 	beqz	t9,bfc01ab8 <matrix_sum+0x298>
bfc0189c:	01801821 	move	v1,t4
bfc018a0:	1080003f 	beqz	a0,bfc019a0 <matrix_sum+0x180>
bfc018a4:	00000000 	nop
bfc018a8:	108b0028 	beq	a0,t3,bfc0194c <matrix_sum+0x12c>
bfc018ac:	24070002 	li	a3,2
bfc018b0:	10870013 	beq	a0,a3,bfc01900 <matrix_sum+0xe0>
bfc018b4:	3139ffff 	andi	t9,t1,0xffff
bfc018b8:	8d440000 	lw	a0,0(t2)
bfc018bc:	00000000 	nop
bfc018c0:	01046821 	addu	t5,t0,a0
bfc018c4:	0184402a 	slt	t0,t4,a0
bfc018c8:	03281821 	addu	v1,t9,t0
bfc018cc:	2722000a 	addiu	v0,t9,10
bfc018d0:	00024c00 	sll	t1,v0,0x10
bfc018d4:	00036400 	sll	t4,v1,0x10
bfc018d8:	00cd402a 	slt	t0,a2,t5
bfc018dc:	00093c03 	sra	a3,t1,0x10
bfc018e0:	1500008f 	bnez	t0,bfc01b20 <matrix_sum+0x300>
bfc018e4:	000c1403 	sra	v0,t4,0x10
bfc018e8:	1500008f 	bnez	t0,bfc01b28 <matrix_sum+0x308>
bfc018ec:	00404821 	move	t1,v0
bfc018f0:	01a04021 	move	t0,t5
bfc018f4:	256b0001 	addiu	t3,t3,1
bfc018f8:	254a0004 	addiu	t2,t2,4
bfc018fc:	00801821 	move	v1,a0
bfc01900:	8d440000 	lw	a0,0(t2)
bfc01904:	3122ffff 	andi	v0,t1,0xffff
bfc01908:	0064c82a 	slt	t9,v1,a0
bfc0190c:	00591821 	addu	v1,v0,t9
bfc01910:	2449000a 	addiu	t1,v0,10
bfc01914:	01046021 	addu	t4,t0,a0
bfc01918:	00093c00 	sll	a3,t1,0x10
bfc0191c:	00036c00 	sll	t5,v1,0x10
bfc01920:	00cc402a 	slt	t0,a2,t4
bfc01924:	00073c03 	sra	a3,a3,0x10
bfc01928:	15000085 	bnez	t0,bfc01b40 <matrix_sum+0x320>
bfc0192c:	000d1403 	sra	v0,t5,0x10
bfc01930:	00404821 	move	t1,v0
bfc01934:	15000002 	bnez	t0,bfc01940 <matrix_sum+0x120>
bfc01938:	00004021 	move	t0,zero
bfc0193c:	01804021 	move	t0,t4
bfc01940:	256b0001 	addiu	t3,t3,1
bfc01944:	254a0004 	addiu	t2,t2,4
bfc01948:	00801821 	move	v1,a0
bfc0194c:	8d440000 	lw	a0,0(t2)
bfc01950:	3122ffff 	andi	v0,t1,0xffff
bfc01954:	01046021 	addu	t4,t0,a0
bfc01958:	0064402a 	slt	t0,v1,a0
bfc0195c:	00481821 	addu	v1,v0,t0
bfc01960:	2449000a 	addiu	t1,v0,10
bfc01964:	00093c00 	sll	a3,t1,0x10
bfc01968:	00036c00 	sll	t5,v1,0x10
bfc0196c:	00cc402a 	slt	t0,a2,t4
bfc01970:	00073c03 	sra	a3,a3,0x10
bfc01974:	1500006e 	bnez	t0,bfc01b30 <matrix_sum+0x310>
bfc01978:	000d1403 	sra	v0,t5,0x10
bfc0197c:	00404821 	move	t1,v0
bfc01980:	15000002 	bnez	t0,bfc0198c <matrix_sum+0x16c>
bfc01984:	00004021 	move	t0,zero
bfc01988:	01804021 	move	t0,t4
bfc0198c:	256b0001 	addiu	t3,t3,1
bfc01990:	016e602b 	sltu	t4,t3,t6
bfc01994:	254a0004 	addiu	t2,t2,4
bfc01998:	11800047 	beqz	t4,bfc01ab8 <matrix_sum+0x298>
bfc0199c:	00801821 	move	v1,a0
bfc019a0:	8d440000 	lw	a0,0(t2)
bfc019a4:	312dffff 	andi	t5,t1,0xffff
bfc019a8:	01044821 	addu	t1,t0,a0
bfc019ac:	0064402a 	slt	t0,v1,a0
bfc019b0:	01a81821 	addu	v1,t5,t0
bfc019b4:	25ac000a 	addiu	t4,t5,10
bfc019b8:	000c3c00 	sll	a3,t4,0x10
bfc019bc:	00031400 	sll	v0,v1,0x10
bfc019c0:	00c9402a 	slt	t0,a2,t1
bfc019c4:	00073c03 	sra	a3,a3,0x10
bfc019c8:	11000002 	beqz	t0,bfc019d4 <matrix_sum+0x1b4>
bfc019cc:	00021403 	sra	v0,v0,0x10
bfc019d0:	00e01021 	move	v0,a3
bfc019d4:	11000002 	beqz	t0,bfc019e0 <matrix_sum+0x1c0>
bfc019d8:	01203821 	move	a3,t1
bfc019dc:	00003821 	move	a3,zero
bfc019e0:	8d480004 	lw	t0,4(t2)
bfc019e4:	304cffff 	andi	t4,v0,0xffff
bfc019e8:	0088682a 	slt	t5,a0,t0
bfc019ec:	2582000a 	addiu	v0,t4,10
bfc019f0:	00e84821 	addu	t1,a3,t0
bfc019f4:	018d1821 	addu	v1,t4,t5
bfc019f8:	00023c00 	sll	a3,v0,0x10
bfc019fc:	0003cc00 	sll	t9,v1,0x10
bfc01a00:	00c9202a 	slt	a0,a2,t1
bfc01a04:	256b0001 	addiu	t3,t3,1
bfc01a08:	00073c03 	sra	a3,a3,0x10
bfc01a0c:	00191403 	sra	v0,t9,0x10
bfc01a10:	10800002 	beqz	a0,bfc01a1c <matrix_sum+0x1fc>
bfc01a14:	254c0004 	addiu	t4,t2,4
bfc01a18:	00e01021 	move	v0,a3
bfc01a1c:	14800002 	bnez	a0,bfc01a28 <matrix_sum+0x208>
bfc01a20:	00003821 	move	a3,zero
bfc01a24:	01203821 	move	a3,t1
bfc01a28:	8d840004 	lw	a0,4(t4)
bfc01a2c:	3042ffff 	andi	v0,v0,0xffff
bfc01a30:	0104182a 	slt	v1,t0,a0
bfc01a34:	00e44821 	addu	t1,a3,a0
bfc01a38:	0043c821 	addu	t9,v0,v1
bfc01a3c:	2447000a 	addiu	a3,v0,10
bfc01a40:	00076c00 	sll	t5,a3,0x10
bfc01a44:	00195400 	sll	t2,t9,0x10
bfc01a48:	00c9402a 	slt	t0,a2,t1
bfc01a4c:	000d3c03 	sra	a3,t5,0x10
bfc01a50:	11000002 	beqz	t0,bfc01a5c <matrix_sum+0x23c>
bfc01a54:	000a1403 	sra	v0,t2,0x10
bfc01a58:	00e01021 	move	v0,a3
bfc01a5c:	1500001c 	bnez	t0,bfc01ad0 <matrix_sum+0x2b0>
bfc01a60:	00004021 	move	t0,zero
bfc01a64:	8d870008 	lw	a3,8(t4)
bfc01a68:	01204021 	move	t0,t1
bfc01a6c:	3042ffff 	andi	v0,v0,0xffff
bfc01a70:	01075021 	addu	t2,t0,a3
bfc01a74:	0087402a 	slt	t0,a0,a3
bfc01a78:	0048c821 	addu	t9,v0,t0
bfc01a7c:	244d000a 	addiu	t5,v0,10
bfc01a80:	000d2400 	sll	a0,t5,0x10
bfc01a84:	00194c00 	sll	t1,t9,0x10
bfc01a88:	00ca402a 	slt	t0,a2,t2
bfc01a8c:	00042403 	sra	a0,a0,0x10
bfc01a90:	1500001b 	bnez	t0,bfc01b00 <matrix_sum+0x2e0>
bfc01a94:	00091403 	sra	v0,t1,0x10
bfc01a98:	1500001b 	bnez	t0,bfc01b08 <matrix_sum+0x2e8>
bfc01a9c:	00404821 	move	t1,v0
bfc01aa0:	01404021 	move	t0,t2
bfc01aa4:	256b0003 	addiu	t3,t3,3
bfc01aa8:	016ec82b 	sltu	t9,t3,t6
bfc01aac:	258a000c 	addiu	t2,t4,12
bfc01ab0:	1720ffbb 	bnez	t9,bfc019a0 <matrix_sum+0x180>
bfc01ab4:	00e01821 	move	v1,a3
bfc01ab8:	25ef0001 	addiu	t7,t7,1
bfc01abc:	01ee202b 	sltu	a0,t7,t6
bfc01ac0:	1480ff60 	bnez	a0,bfc01844 <matrix_sum+0x24>
bfc01ac4:	00b82821 	addu	a1,a1,t8
bfc01ac8:	03e00008 	jr	ra
bfc01acc:	01201021 	move	v0,t1
bfc01ad0:	8d870008 	lw	a3,8(t4)
bfc01ad4:	3042ffff 	andi	v0,v0,0xffff
bfc01ad8:	01075021 	addu	t2,t0,a3
bfc01adc:	0087402a 	slt	t0,a0,a3
bfc01ae0:	0048c821 	addu	t9,v0,t0
bfc01ae4:	244d000a 	addiu	t5,v0,10
bfc01ae8:	000d2400 	sll	a0,t5,0x10
bfc01aec:	00194c00 	sll	t1,t9,0x10
bfc01af0:	00ca402a 	slt	t0,a2,t2
bfc01af4:	00042403 	sra	a0,a0,0x10
bfc01af8:	1100ffe7 	beqz	t0,bfc01a98 <matrix_sum+0x278>
bfc01afc:	00091403 	sra	v0,t1,0x10
bfc01b00:	1100ffe7 	beqz	t0,bfc01aa0 <matrix_sum+0x280>
bfc01b04:	00804821 	move	t1,a0
bfc01b08:	0bf006a9 	j	bfc01aa4 <matrix_sum+0x284>
bfc01b0c:	00004021 	move	t0,zero
bfc01b10:	0bf00620 	j	bfc01880 <matrix_sum+0x60>
bfc01b14:	00e04821 	move	t1,a3
	...
bfc01b20:	1100ff73 	beqz	t0,bfc018f0 <matrix_sum+0xd0>
bfc01b24:	00e04821 	move	t1,a3
bfc01b28:	0bf0063d 	j	bfc018f4 <matrix_sum+0xd4>
bfc01b2c:	00004021 	move	t0,zero
bfc01b30:	0bf00660 	j	bfc01980 <matrix_sum+0x160>
bfc01b34:	00e04821 	move	t1,a3
	...
bfc01b40:	0bf0064d 	j	bfc01934 <matrix_sum+0x114>
bfc01b44:	00e04821 	move	t1,a3
bfc01b48:	00004821 	move	t1,zero
bfc01b4c:	03e00008 	jr	ra
bfc01b50:	01201021 	move	v0,t1
	...

bfc01b60 <matrix_mul_const>:
matrix_mul_const():
bfc01b60:	27bdfff0 	addiu	sp,sp,-16
bfc01b64:	00077400 	sll	t6,a3,0x10
bfc01b68:	afb2000c 	sw	s2,12(sp)
bfc01b6c:	afb10008 	sw	s1,8(sp)
bfc01b70:	afb00004 	sw	s0,4(sp)
bfc01b74:	0080c821 	move	t9,a0
bfc01b78:	10800083 	beqz	a0,bfc01d88 <matrix_mul_const+0x228>
bfc01b7c:	000e7403 	sra	t6,t6,0x10
bfc01b80:	00a0c021 	move	t8,a1
bfc01b84:	00c07821 	move	t7,a2
bfc01b88:	00049080 	sll	s2,a0,0x2
bfc01b8c:	00048840 	sll	s1,a0,0x1
bfc01b90:	00008021 	move	s0,zero
bfc01b94:	85e70000 	lh	a3,0(t7)
bfc01b98:	240d0001 	li	t5,1
bfc01b9c:	01c70018 	mult	t6,a3
bfc01ba0:	272cffff 	addiu	t4,t9,-1
bfc01ba4:	01b9482b 	sltu	t1,t5,t9
bfc01ba8:	31830007 	andi	v1,t4,0x7
bfc01bac:	25eb0002 	addiu	t3,t7,2
bfc01bb0:	270c0004 	addiu	t4,t8,4
bfc01bb4:	00004012 	mflo	t0
bfc01bb8:	1120006e 	beqz	t1,bfc01d74 <matrix_mul_const+0x214>
bfc01bbc:	af080000 	sw	t0,0(t8)
bfc01bc0:	10600040 	beqz	v1,bfc01cc4 <matrix_mul_const+0x164>
bfc01bc4:	00000000 	nop
bfc01bc8:	106d0035 	beq	v1,t5,bfc01ca0 <matrix_mul_const+0x140>
bfc01bcc:	24060002 	li	a2,2
bfc01bd0:	1066002c 	beq	v1,a2,bfc01c84 <matrix_mul_const+0x124>
bfc01bd4:	24050003 	li	a1,3
bfc01bd8:	10650023 	beq	v1,a1,bfc01c68 <matrix_mul_const+0x108>
bfc01bdc:	24040004 	li	a0,4
bfc01be0:	1064001a 	beq	v1,a0,bfc01c4c <matrix_mul_const+0xec>
bfc01be4:	24020005 	li	v0,5
bfc01be8:	10620011 	beq	v1,v0,bfc01c30 <matrix_mul_const+0xd0>
bfc01bec:	240a0006 	li	t2,6
bfc01bf0:	106a0008 	beq	v1,t2,bfc01c14 <matrix_mul_const+0xb4>
bfc01bf4:	00000000 	nop
bfc01bf8:	85690000 	lh	t1,0(t3)
bfc01bfc:	240d0002 	li	t5,2
bfc01c00:	01c90018 	mult	t6,t1
bfc01c04:	25eb0004 	addiu	t3,t7,4
bfc01c08:	00001812 	mflo	v1
bfc01c0c:	ad830000 	sw	v1,0(t4)
bfc01c10:	270c0008 	addiu	t4,t8,8
bfc01c14:	85670000 	lh	a3,0(t3)
bfc01c18:	25ad0001 	addiu	t5,t5,1
bfc01c1c:	01c70018 	mult	t6,a3
bfc01c20:	256b0002 	addiu	t3,t3,2
bfc01c24:	00004012 	mflo	t0
bfc01c28:	ad880000 	sw	t0,0(t4)
bfc01c2c:	258c0004 	addiu	t4,t4,4
bfc01c30:	85650000 	lh	a1,0(t3)
bfc01c34:	25ad0001 	addiu	t5,t5,1
bfc01c38:	01c50018 	mult	t6,a1
bfc01c3c:	256b0002 	addiu	t3,t3,2
bfc01c40:	00003012 	mflo	a2
bfc01c44:	ad860000 	sw	a2,0(t4)
bfc01c48:	258c0004 	addiu	t4,t4,4
bfc01c4c:	85620000 	lh	v0,0(t3)
bfc01c50:	25ad0001 	addiu	t5,t5,1
bfc01c54:	01c20018 	mult	t6,v0
bfc01c58:	256b0002 	addiu	t3,t3,2
bfc01c5c:	00002012 	mflo	a0
bfc01c60:	ad840000 	sw	a0,0(t4)
bfc01c64:	258c0004 	addiu	t4,t4,4
bfc01c68:	85630000 	lh	v1,0(t3)
bfc01c6c:	25ad0001 	addiu	t5,t5,1
bfc01c70:	01c30018 	mult	t6,v1
bfc01c74:	256b0002 	addiu	t3,t3,2
bfc01c78:	00005012 	mflo	t2
bfc01c7c:	ad8a0000 	sw	t2,0(t4)
bfc01c80:	258c0004 	addiu	t4,t4,4
bfc01c84:	85680000 	lh	t0,0(t3)
bfc01c88:	25ad0001 	addiu	t5,t5,1
bfc01c8c:	01c80018 	mult	t6,t0
bfc01c90:	256b0002 	addiu	t3,t3,2
bfc01c94:	00004812 	mflo	t1
bfc01c98:	ad890000 	sw	t1,0(t4)
bfc01c9c:	258c0004 	addiu	t4,t4,4
bfc01ca0:	85650000 	lh	a1,0(t3)
bfc01ca4:	25ad0001 	addiu	t5,t5,1
bfc01ca8:	01c50018 	mult	t6,a1
bfc01cac:	01b9382b 	sltu	a3,t5,t9
bfc01cb0:	256b0002 	addiu	t3,t3,2
bfc01cb4:	00003012 	mflo	a2
bfc01cb8:	ad860000 	sw	a2,0(t4)
bfc01cbc:	10e0002d 	beqz	a3,bfc01d74 <matrix_mul_const+0x214>
bfc01cc0:	258c0004 	addiu	t4,t4,4
bfc01cc4:	856a0000 	lh	t2,0(t3)
bfc01cc8:	85630002 	lh	v1,2(t3)
bfc01ccc:	01ca0018 	mult	t6,t2
bfc01cd0:	85640004 	lh	a0,4(t3)
bfc01cd4:	85650006 	lh	a1,6(t3)
bfc01cd8:	85660008 	lh	a2,8(t3)
bfc01cdc:	8567000a 	lh	a3,10(t3)
bfc01ce0:	8568000c 	lh	t0,12(t3)
bfc01ce4:	8569000e 	lh	t1,14(t3)
bfc01ce8:	25ad0008 	addiu	t5,t5,8
bfc01cec:	01b9502b 	sltu	t2,t5,t9
bfc01cf0:	256b0010 	addiu	t3,t3,16
bfc01cf4:	00001012 	mflo	v0
bfc01cf8:	ad820000 	sw	v0,0(t4)
bfc01cfc:	00000000 	nop
bfc01d00:	01c30018 	mult	t6,v1
bfc01d04:	00001812 	mflo	v1
bfc01d08:	ad830004 	sw	v1,4(t4)
bfc01d0c:	00000000 	nop
bfc01d10:	01c40018 	mult	t6,a0
bfc01d14:	00002012 	mflo	a0
bfc01d18:	ad840008 	sw	a0,8(t4)
bfc01d1c:	00000000 	nop
bfc01d20:	01c50018 	mult	t6,a1
bfc01d24:	00002812 	mflo	a1
bfc01d28:	ad85000c 	sw	a1,12(t4)
bfc01d2c:	00000000 	nop
bfc01d30:	01c60018 	mult	t6,a2
bfc01d34:	00003012 	mflo	a2
bfc01d38:	ad860010 	sw	a2,16(t4)
bfc01d3c:	00000000 	nop
bfc01d40:	01c70018 	mult	t6,a3
bfc01d44:	00003812 	mflo	a3
bfc01d48:	ad870014 	sw	a3,20(t4)
bfc01d4c:	00000000 	nop
bfc01d50:	01c80018 	mult	t6,t0
bfc01d54:	00004012 	mflo	t0
bfc01d58:	ad880018 	sw	t0,24(t4)
bfc01d5c:	00000000 	nop
bfc01d60:	01c90018 	mult	t6,t1
bfc01d64:	00004812 	mflo	t1
bfc01d68:	ad89001c 	sw	t1,28(t4)
bfc01d6c:	1540ffd5 	bnez	t2,bfc01cc4 <matrix_mul_const+0x164>
bfc01d70:	258c0020 	addiu	t4,t4,32
bfc01d74:	26100001 	addiu	s0,s0,1
bfc01d78:	0219582b 	sltu	t3,s0,t9
bfc01d7c:	0312c021 	addu	t8,t8,s2
bfc01d80:	1560ff84 	bnez	t3,bfc01b94 <matrix_mul_const+0x34>
bfc01d84:	01f17821 	addu	t7,t7,s1
bfc01d88:	8fb2000c 	lw	s2,12(sp)
bfc01d8c:	8fb10008 	lw	s1,8(sp)
bfc01d90:	8fb00004 	lw	s0,4(sp)
bfc01d94:	03e00008 	jr	ra
bfc01d98:	27bd0010 	addiu	sp,sp,16
bfc01d9c:	00000000 	nop

bfc01da0 <matrix_add_const>:
matrix_add_const():
bfc01da0:	00061400 	sll	v0,a2,0x10
bfc01da4:	00807821 	move	t7,a0
bfc01da8:	10800061 	beqz	a0,bfc01f30 <matrix_add_const+0x190>
bfc01dac:	00021403 	sra	v0,v0,0x10
bfc01db0:	304dffff 	andi	t5,v0,0xffff
bfc01db4:	00a07021 	move	t6,a1
bfc01db8:	0004c840 	sll	t9,a0,0x1
bfc01dbc:	0000c021 	move	t8,zero
bfc01dc0:	95c80000 	lhu	t0,0(t6)
bfc01dc4:	240c0001 	li	t4,1
bfc01dc8:	01a81021 	addu	v0,t5,t0
bfc01dcc:	25e9ffff 	addiu	t1,t7,-1
bfc01dd0:	018f502b 	sltu	t2,t4,t7
bfc01dd4:	a5c20000 	sh	v0,0(t6)
bfc01dd8:	31230007 	andi	v1,t1,0x7
bfc01ddc:	11400050 	beqz	t2,bfc01f20 <matrix_add_const+0x180>
bfc01de0:	25cb0002 	addiu	t3,t6,2
bfc01de4:	10600032 	beqz	v1,bfc01eb0 <matrix_add_const+0x110>
bfc01de8:	00000000 	nop
bfc01dec:	106c0029 	beq	v1,t4,bfc01e94 <matrix_add_const+0xf4>
bfc01df0:	24070002 	li	a3,2
bfc01df4:	10670022 	beq	v1,a3,bfc01e80 <matrix_add_const+0xe0>
bfc01df8:	24060003 	li	a2,3
bfc01dfc:	1066001b 	beq	v1,a2,bfc01e6c <matrix_add_const+0xcc>
bfc01e00:	24050004 	li	a1,4
bfc01e04:	10650014 	beq	v1,a1,bfc01e58 <matrix_add_const+0xb8>
bfc01e08:	24040005 	li	a0,5
bfc01e0c:	1064000d 	beq	v1,a0,bfc01e44 <matrix_add_const+0xa4>
bfc01e10:	240a0006 	li	t2,6
bfc01e14:	106a0006 	beq	v1,t2,bfc01e30 <matrix_add_const+0x90>
bfc01e18:	00000000 	nop
bfc01e1c:	95690000 	lhu	t1,0(t3)
bfc01e20:	240c0002 	li	t4,2
bfc01e24:	01a91821 	addu	v1,t5,t1
bfc01e28:	a5630000 	sh	v1,0(t3)
bfc01e2c:	25cb0004 	addiu	t3,t6,4
bfc01e30:	95680000 	lhu	t0,0(t3)
bfc01e34:	258c0001 	addiu	t4,t4,1
bfc01e38:	01a81021 	addu	v0,t5,t0
bfc01e3c:	a5620000 	sh	v0,0(t3)
bfc01e40:	256b0002 	addiu	t3,t3,2
bfc01e44:	95660000 	lhu	a2,0(t3)
bfc01e48:	258c0001 	addiu	t4,t4,1
bfc01e4c:	01a63821 	addu	a3,t5,a2
bfc01e50:	a5670000 	sh	a3,0(t3)
bfc01e54:	256b0002 	addiu	t3,t3,2
bfc01e58:	95640000 	lhu	a0,0(t3)
bfc01e5c:	258c0001 	addiu	t4,t4,1
bfc01e60:	01a42821 	addu	a1,t5,a0
bfc01e64:	a5650000 	sh	a1,0(t3)
bfc01e68:	256b0002 	addiu	t3,t3,2
bfc01e6c:	95630000 	lhu	v1,0(t3)
bfc01e70:	258c0001 	addiu	t4,t4,1
bfc01e74:	01a35021 	addu	t2,t5,v1
bfc01e78:	a56a0000 	sh	t2,0(t3)
bfc01e7c:	256b0002 	addiu	t3,t3,2
bfc01e80:	95620000 	lhu	v0,0(t3)
bfc01e84:	258c0001 	addiu	t4,t4,1
bfc01e88:	01a24821 	addu	t1,t5,v0
bfc01e8c:	a5690000 	sh	t1,0(t3)
bfc01e90:	256b0002 	addiu	t3,t3,2
bfc01e94:	95660000 	lhu	a2,0(t3)
bfc01e98:	258c0001 	addiu	t4,t4,1
bfc01e9c:	01a63821 	addu	a3,t5,a2
bfc01ea0:	018f402b 	sltu	t0,t4,t7
bfc01ea4:	a5670000 	sh	a3,0(t3)
bfc01ea8:	1100001d 	beqz	t0,bfc01f20 <matrix_add_const+0x180>
bfc01eac:	256b0002 	addiu	t3,t3,2
bfc01eb0:	95630000 	lhu	v1,0(t3)
bfc01eb4:	95640002 	lhu	a0,2(t3)
bfc01eb8:	95650004 	lhu	a1,4(t3)
bfc01ebc:	95660006 	lhu	a2,6(t3)
bfc01ec0:	95670008 	lhu	a3,8(t3)
bfc01ec4:	9568000a 	lhu	t0,10(t3)
bfc01ec8:	9569000c 	lhu	t1,12(t3)
bfc01ecc:	956a000e 	lhu	t2,14(t3)
bfc01ed0:	258c0008 	addiu	t4,t4,8
bfc01ed4:	01a31021 	addu	v0,t5,v1
bfc01ed8:	01a41821 	addu	v1,t5,a0
bfc01edc:	01a52021 	addu	a0,t5,a1
bfc01ee0:	01a62821 	addu	a1,t5,a2
bfc01ee4:	01a73021 	addu	a2,t5,a3
bfc01ee8:	01a83821 	addu	a3,t5,t0
bfc01eec:	01a94021 	addu	t0,t5,t1
bfc01ef0:	01aa4821 	addu	t1,t5,t2
bfc01ef4:	018f502b 	sltu	t2,t4,t7
bfc01ef8:	a5620000 	sh	v0,0(t3)
bfc01efc:	a5630002 	sh	v1,2(t3)
bfc01f00:	a5640004 	sh	a0,4(t3)
bfc01f04:	a5650006 	sh	a1,6(t3)
bfc01f08:	a5660008 	sh	a2,8(t3)
bfc01f0c:	a567000a 	sh	a3,10(t3)
bfc01f10:	a568000c 	sh	t0,12(t3)
bfc01f14:	a569000e 	sh	t1,14(t3)
bfc01f18:	1540ffe5 	bnez	t2,bfc01eb0 <matrix_add_const+0x110>
bfc01f1c:	256b0010 	addiu	t3,t3,16
bfc01f20:	27180001 	addiu	t8,t8,1
bfc01f24:	030f582b 	sltu	t3,t8,t7
bfc01f28:	1560ffa5 	bnez	t3,bfc01dc0 <matrix_add_const+0x20>
bfc01f2c:	01d97021 	addu	t6,t6,t9
bfc01f30:	03e00008 	jr	ra
bfc01f34:	00000000 	nop
	...

bfc01f40 <matrix_mul_vect>:
matrix_mul_vect():
bfc01f40:	27bdffd8 	addiu	sp,sp,-40
bfc01f44:	afb70020 	sw	s7,32(sp)
bfc01f48:	afb40014 	sw	s4,20(sp)
bfc01f4c:	afbe0024 	sw	s8,36(sp)
bfc01f50:	afb6001c 	sw	s6,28(sp)
bfc01f54:	afb50018 	sw	s5,24(sp)
bfc01f58:	afb30010 	sw	s3,16(sp)
bfc01f5c:	afb2000c 	sw	s2,12(sp)
bfc01f60:	afb10008 	sw	s1,8(sp)
bfc01f64:	afb00004 	sw	s0,4(sp)
bfc01f68:	0080a021 	move	s4,a0
bfc01f6c:	10800093 	beqz	a0,bfc021bc <matrix_mul_vect+0x27c>
bfc01f70:	00e0b821 	move	s7,a3
bfc01f74:	00a0b021 	move	s6,a1
bfc01f78:	00c09821 	move	s3,a2
bfc01f7c:	0004f040 	sll	s8,a0,0x1
bfc01f80:	0000a821 	move	s5,zero
bfc01f84:	86e40000 	lh	a0,0(s7)
bfc01f88:	86620000 	lh	v0,0(s3)
bfc01f8c:	24110001 	li	s1,1
bfc01f90:	00820018 	mult	a0,v0
bfc01f94:	2683ffff 	addiu	v1,s4,-1
bfc01f98:	0234282b 	sltu	a1,s1,s4
bfc01f9c:	30630007 	andi	v1,v1,0x7
bfc01fa0:	26780002 	addiu	t8,s3,2
bfc01fa4:	00009012 	mflo	s2
bfc01fa8:	10a0007e 	beqz	a1,bfc021a4 <matrix_mul_vect+0x264>
bfc01fac:	26f90002 	addiu	t9,s7,2
bfc01fb0:	10600047 	beqz	v1,bfc020d0 <matrix_mul_vect+0x190>
bfc01fb4:	00000000 	nop
bfc01fb8:	1071003b 	beq	v1,s1,bfc020a8 <matrix_mul_vect+0x168>
bfc01fbc:	24100002 	li	s0,2
bfc01fc0:	10700031 	beq	v1,s0,bfc02088 <matrix_mul_vect+0x148>
bfc01fc4:	24070003 	li	a3,3
bfc01fc8:	10670027 	beq	v1,a3,bfc02068 <matrix_mul_vect+0x128>
bfc01fcc:	240f0004 	li	t7,4
bfc01fd0:	106f001d 	beq	v1,t7,bfc02048 <matrix_mul_vect+0x108>
bfc01fd4:	24060005 	li	a2,5
bfc01fd8:	10660013 	beq	v1,a2,bfc02028 <matrix_mul_vect+0xe8>
bfc01fdc:	240e0006 	li	t6,6
bfc01fe0:	106e0009 	beq	v1,t6,bfc02008 <matrix_mul_vect+0xc8>
bfc01fe4:	00000000 	nop
bfc01fe8:	87190000 	lh	t9,0(t8)
bfc01fec:	86f80002 	lh	t8,2(s7)
bfc01ff0:	24110002 	li	s1,2
bfc01ff4:	03190018 	mult	t8,t9
bfc01ff8:	26780004 	addiu	t8,s3,4
bfc01ffc:	26f90004 	addiu	t9,s7,4
bfc02000:	00002812 	mflo	a1
bfc02004:	02459021 	addu	s2,s2,a1
bfc02008:	87290000 	lh	t1,0(t9)
bfc0200c:	87040000 	lh	a0,0(t8)
bfc02010:	26310001 	addiu	s1,s1,1
bfc02014:	01240018 	mult	t1,a0
bfc02018:	27180002 	addiu	t8,t8,2
bfc0201c:	27390002 	addiu	t9,t9,2
bfc02020:	00006812 	mflo	t5
bfc02024:	024d9021 	addu	s2,s2,t5
bfc02028:	87220000 	lh	v0,0(t9)
bfc0202c:	870b0000 	lh	t3,0(t8)
bfc02030:	26310001 	addiu	s1,s1,1
bfc02034:	004b0018 	mult	v0,t3
bfc02038:	27180002 	addiu	t8,t8,2
bfc0203c:	27390002 	addiu	t9,t9,2
bfc02040:	00006012 	mflo	t4
bfc02044:	024c9021 	addu	s2,s2,t4
bfc02048:	87280000 	lh	t0,0(t9)
bfc0204c:	87030000 	lh	v1,0(t8)
bfc02050:	26310001 	addiu	s1,s1,1
bfc02054:	01030018 	mult	t0,v1
bfc02058:	27180002 	addiu	t8,t8,2
bfc0205c:	27390002 	addiu	t9,t9,2
bfc02060:	00005012 	mflo	t2
bfc02064:	024a9021 	addu	s2,s2,t2
bfc02068:	87270000 	lh	a3,0(t9)
bfc0206c:	870f0000 	lh	t7,0(t8)
bfc02070:	26310001 	addiu	s1,s1,1
bfc02074:	00ef0018 	mult	a3,t7
bfc02078:	27180002 	addiu	t8,t8,2
bfc0207c:	27390002 	addiu	t9,t9,2
bfc02080:	00008012 	mflo	s0
bfc02084:	02509021 	addu	s2,s2,s0
bfc02088:	872e0000 	lh	t6,0(t9)
bfc0208c:	87050000 	lh	a1,0(t8)
bfc02090:	26310001 	addiu	s1,s1,1
bfc02094:	01c50018 	mult	t6,a1
bfc02098:	27180002 	addiu	t8,t8,2
bfc0209c:	27390002 	addiu	t9,t9,2
bfc020a0:	00003012 	mflo	a2
bfc020a4:	02469021 	addu	s2,s2,a2
bfc020a8:	87240000 	lh	a0,0(t9)
bfc020ac:	870c0000 	lh	t4,0(t8)
bfc020b0:	26310001 	addiu	s1,s1,1
bfc020b4:	008c0018 	mult	a0,t4
bfc020b8:	0234682b 	sltu	t5,s1,s4
bfc020bc:	27180002 	addiu	t8,t8,2
bfc020c0:	27390002 	addiu	t9,t9,2
bfc020c4:	00004812 	mflo	t1
bfc020c8:	11a00036 	beqz	t5,bfc021a4 <matrix_mul_vect+0x264>
bfc020cc:	02499021 	addu	s2,s2,t1
bfc020d0:	87280000 	lh	t0,0(t9)
bfc020d4:	87030000 	lh	v1,0(t8)
bfc020d8:	872b0002 	lh	t3,2(t9)
bfc020dc:	01030018 	mult	t0,v1
bfc020e0:	870a0002 	lh	t2,2(t8)
bfc020e4:	87240004 	lh	a0,4(t9)
bfc020e8:	870c0004 	lh	t4,4(t8)
bfc020ec:	87250006 	lh	a1,6(t9)
bfc020f0:	870d0006 	lh	t5,6(t8)
bfc020f4:	87260008 	lh	a2,8(t9)
bfc020f8:	870e0008 	lh	t6,8(t8)
bfc020fc:	8727000a 	lh	a3,10(t9)
bfc02100:	870f000a 	lh	t7,10(t8)
bfc02104:	8728000c 	lh	t0,12(t9)
bfc02108:	8710000c 	lh	s0,12(t8)
bfc0210c:	8723000e 	lh	v1,14(t9)
bfc02110:	00001012 	mflo	v0
bfc02114:	26310008 	addiu	s1,s1,8
bfc02118:	02421021 	addu	v0,s2,v0
bfc0211c:	27390010 	addiu	t9,t9,16
bfc02120:	016a0018 	mult	t3,t2
bfc02124:	870b000e 	lh	t3,14(t8)
bfc02128:	0234502b 	sltu	t2,s1,s4
bfc0212c:	27180010 	addiu	t8,t8,16
bfc02130:	00004812 	mflo	t1
	...
bfc0213c:	008c0018 	mult	a0,t4
bfc02140:	00496021 	addu	t4,v0,t1
bfc02144:	00002012 	mflo	a0
bfc02148:	01841021 	addu	v0,t4,a0
bfc0214c:	00000000 	nop
bfc02150:	00ad0018 	mult	a1,t5
bfc02154:	00002812 	mflo	a1
	...
bfc02160:	00ce0018 	mult	a2,t6
bfc02164:	00457021 	addu	t6,v0,a1
bfc02168:	00009012 	mflo	s2
bfc0216c:	01d26021 	addu	t4,t6,s2
bfc02170:	00000000 	nop
bfc02174:	00ef0018 	mult	a3,t7
bfc02178:	00006812 	mflo	t5
bfc0217c:	018d4821 	addu	t1,t4,t5
bfc02180:	00000000 	nop
bfc02184:	01100018 	mult	t0,s0
bfc02188:	00004012 	mflo	t0
bfc0218c:	01283021 	addu	a2,t1,t0
bfc02190:	00000000 	nop
bfc02194:	006b0018 	mult	v1,t3
bfc02198:	00003812 	mflo	a3
bfc0219c:	1540ffcc 	bnez	t2,bfc020d0 <matrix_mul_vect+0x190>
bfc021a0:	00c79021 	addu	s2,a2,a3
bfc021a4:	26b50001 	addiu	s5,s5,1
bfc021a8:	02b4882b 	sltu	s1,s5,s4
bfc021ac:	aed20000 	sw	s2,0(s6)
bfc021b0:	027e9821 	addu	s3,s3,s8
bfc021b4:	1620ff73 	bnez	s1,bfc01f84 <matrix_mul_vect+0x44>
bfc021b8:	26d60004 	addiu	s6,s6,4
bfc021bc:	8fbe0024 	lw	s8,36(sp)
bfc021c0:	8fb70020 	lw	s7,32(sp)
bfc021c4:	8fb6001c 	lw	s6,28(sp)
bfc021c8:	8fb50018 	lw	s5,24(sp)
bfc021cc:	8fb40014 	lw	s4,20(sp)
bfc021d0:	8fb30010 	lw	s3,16(sp)
bfc021d4:	8fb2000c 	lw	s2,12(sp)
bfc021d8:	8fb10008 	lw	s1,8(sp)
bfc021dc:	8fb00004 	lw	s0,4(sp)
bfc021e0:	03e00008 	jr	ra
bfc021e4:	27bd0028 	addiu	sp,sp,40
	...

bfc021f0 <matrix_mul_matrix>:
matrix_mul_matrix():
bfc021f0:	27bdffc8 	addiu	sp,sp,-56
bfc021f4:	afb50028 	sw	s5,40(sp)
bfc021f8:	afbe0034 	sw	s8,52(sp)
bfc021fc:	afb70030 	sw	s7,48(sp)
bfc02200:	afb6002c 	sw	s6,44(sp)
bfc02204:	afb40024 	sw	s4,36(sp)
bfc02208:	afb30020 	sw	s3,32(sp)
bfc0220c:	afb2001c 	sw	s2,28(sp)
bfc02210:	afb10018 	sw	s1,24(sp)
bfc02214:	afb00014 	sw	s0,20(sp)
bfc02218:	0080a821 	move	s5,a0
bfc0221c:	108000a8 	beqz	a0,bfc024c0 <matrix_mul_matrix+0x2d0>
bfc02220:	afa70044 	sw	a3,68(sp)
bfc02224:	00041080 	sll	v0,a0,0x2
bfc02228:	00c0f021 	move	s8,a2
bfc0222c:	afa50004 	sw	a1,4(sp)
bfc02230:	00049840 	sll	s3,a0,0x1
bfc02234:	afa20000 	sw	v0,0(sp)
bfc02238:	afa00008 	sw	zero,8(sp)
bfc0223c:	8fb40044 	lw	s4,68(sp)
bfc02240:	8fb70004 	lw	s7,4(sp)
bfc02244:	0000b021 	move	s6,zero
bfc02248:	86840000 	lh	a0,0(s4)
bfc0224c:	87c60000 	lh	a2,0(s8)
bfc02250:	24190001 	li	t9,1
bfc02254:	00860018 	mult	a0,a2
bfc02258:	26a3ffff 	addiu	v1,s5,-1
bfc0225c:	0335282b 	sltu	a1,t9,s5
bfc02260:	30630007 	andi	v1,v1,0x7
bfc02264:	27d80002 	addiu	t8,s8,2
bfc02268:	00009012 	mflo	s2
bfc0226c:	10a00084 	beqz	a1,bfc02480 <matrix_mul_matrix+0x290>
bfc02270:	02935021 	addu	t2,s4,s3
bfc02274:	10600047 	beqz	v1,bfc02394 <matrix_mul_matrix+0x1a4>
bfc02278:	00000000 	nop
bfc0227c:	1079003b 	beq	v1,t9,bfc0236c <matrix_mul_matrix+0x17c>
bfc02280:	240b0002 	li	t3,2
bfc02284:	106b0031 	beq	v1,t3,bfc0234c <matrix_mul_matrix+0x15c>
bfc02288:	24090003 	li	t1,3
bfc0228c:	10690027 	beq	v1,t1,bfc0232c <matrix_mul_matrix+0x13c>
bfc02290:	24110004 	li	s1,4
bfc02294:	1071001d 	beq	v1,s1,bfc0230c <matrix_mul_matrix+0x11c>
bfc02298:	24020005 	li	v0,5
bfc0229c:	10620013 	beq	v1,v0,bfc022ec <matrix_mul_matrix+0xfc>
bfc022a0:	24050006 	li	a1,6
bfc022a4:	10650009 	beq	v1,a1,bfc022cc <matrix_mul_matrix+0xdc>
bfc022a8:	00000000 	nop
bfc022ac:	870c0000 	lh	t4,0(t8)
bfc022b0:	854d0000 	lh	t5,0(t2)
bfc022b4:	24190002 	li	t9,2
bfc022b8:	01ac0018 	mult	t5,t4
bfc022bc:	01535021 	addu	t2,t2,s3
bfc022c0:	27d80004 	addiu	t8,s8,4
bfc022c4:	00001812 	mflo	v1
bfc022c8:	02439021 	addu	s2,s2,v1
bfc022cc:	85460000 	lh	a2,0(t2)
bfc022d0:	870e0000 	lh	t6,0(t8)
bfc022d4:	27390001 	addiu	t9,t9,1
bfc022d8:	00ce0018 	mult	a2,t6
bfc022dc:	27180002 	addiu	t8,t8,2
bfc022e0:	01535021 	addu	t2,t2,s3
bfc022e4:	00002012 	mflo	a0
bfc022e8:	02449021 	addu	s2,s2,a0
bfc022ec:	854f0000 	lh	t7,0(t2)
bfc022f0:	87080000 	lh	t0,0(t8)
bfc022f4:	27390001 	addiu	t9,t9,1
bfc022f8:	01e80018 	mult	t7,t0
bfc022fc:	27180002 	addiu	t8,t8,2
bfc02300:	01535021 	addu	t2,t2,s3
bfc02304:	00003812 	mflo	a3
bfc02308:	02479021 	addu	s2,s2,a3
bfc0230c:	854b0000 	lh	t3,0(t2)
bfc02310:	87090000 	lh	t1,0(t8)
bfc02314:	27390001 	addiu	t9,t9,1
bfc02318:	01690018 	mult	t3,t1
bfc0231c:	27180002 	addiu	t8,t8,2
bfc02320:	01535021 	addu	t2,t2,s3
bfc02324:	00008012 	mflo	s0
bfc02328:	02509021 	addu	s2,s2,s0
bfc0232c:	85420000 	lh	v0,0(t2)
bfc02330:	87050000 	lh	a1,0(t8)
bfc02334:	27390001 	addiu	t9,t9,1
bfc02338:	00450018 	mult	v0,a1
bfc0233c:	27180002 	addiu	t8,t8,2
bfc02340:	01535021 	addu	t2,t2,s3
bfc02344:	00008812 	mflo	s1
bfc02348:	02519021 	addu	s2,s2,s1
bfc0234c:	854d0000 	lh	t5,0(t2)
bfc02350:	870c0000 	lh	t4,0(t8)
bfc02354:	27390001 	addiu	t9,t9,1
bfc02358:	01ac0018 	mult	t5,t4
bfc0235c:	27180002 	addiu	t8,t8,2
bfc02360:	01535021 	addu	t2,t2,s3
bfc02364:	00001812 	mflo	v1
bfc02368:	02439021 	addu	s2,s2,v1
bfc0236c:	854e0000 	lh	t6,0(t2)
bfc02370:	87070000 	lh	a3,0(t8)
bfc02374:	27390001 	addiu	t9,t9,1
bfc02378:	01c70018 	mult	t6,a3
bfc0237c:	0335202b 	sltu	a0,t9,s5
bfc02380:	27180002 	addiu	t8,t8,2
bfc02384:	01535021 	addu	t2,t2,s3
bfc02388:	00003012 	mflo	a2
bfc0238c:	1080003c 	beqz	a0,bfc02480 <matrix_mul_matrix+0x290>
bfc02390:	02469021 	addu	s2,s2,a2
bfc02394:	854f0000 	lh	t7,0(t2)
bfc02398:	87080000 	lh	t0,0(t8)
bfc0239c:	01533821 	addu	a3,t2,s3
bfc023a0:	01e80018 	mult	t7,t0
bfc023a4:	870d0002 	lh	t5,2(t8)
bfc023a8:	84ec0000 	lh	t4,0(a3)
bfc023ac:	00f37021 	addu	t6,a3,s3
bfc023b0:	87110004 	lh	s1,4(t8)
bfc023b4:	85c90000 	lh	t1,0(t6)
bfc023b8:	01d33021 	addu	a2,t6,s3
bfc023bc:	87100006 	lh	s0,6(t8)
bfc023c0:	84c80000 	lh	t0,0(a2)
bfc023c4:	00d32021 	addu	a0,a2,s3
bfc023c8:	870f0008 	lh	t7,8(t8)
bfc023cc:	84870000 	lh	a3,0(a0)
bfc023d0:	00932821 	addu	a1,a0,s3
bfc023d4:	00001012 	mflo	v0
bfc023d8:	870e000a 	lh	t6,10(t8)
bfc023dc:	84a60000 	lh	a2,0(a1)
bfc023e0:	00b31821 	addu	v1,a1,s3
bfc023e4:	018d0018 	mult	t4,t5
bfc023e8:	84640000 	lh	a0,0(v1)
bfc023ec:	870c000c 	lh	t4,12(t8)
bfc023f0:	00735021 	addu	t2,v1,s3
bfc023f4:	870d000e 	lh	t5,14(t8)
bfc023f8:	85430000 	lh	v1,0(t2)
bfc023fc:	02421021 	addu	v0,s2,v0
bfc02400:	27390008 	addiu	t9,t9,8
bfc02404:	0335282b 	sltu	a1,t9,s5
bfc02408:	27180010 	addiu	t8,t8,16
bfc0240c:	01535021 	addu	t2,t2,s3
bfc02410:	00005812 	mflo	t3
bfc02414:	004b1021 	addu	v0,v0,t3
bfc02418:	00000000 	nop
bfc0241c:	01310018 	mult	t1,s1
bfc02420:	00004812 	mflo	t1
bfc02424:	00499021 	addu	s2,v0,t1
bfc02428:	00000000 	nop
bfc0242c:	01100018 	mult	t0,s0
bfc02430:	00004012 	mflo	t0
bfc02434:	02488021 	addu	s0,s2,t0
bfc02438:	00000000 	nop
bfc0243c:	00ef0018 	mult	a3,t7
bfc02440:	00008812 	mflo	s1
	...
bfc0244c:	00ce0018 	mult	a2,t6
bfc02450:	02117021 	addu	t6,s0,s1
bfc02454:	00007812 	mflo	t7
bfc02458:	01cf4821 	addu	t1,t6,t7
bfc0245c:	00000000 	nop
bfc02460:	008c0018 	mult	a0,t4
bfc02464:	00005812 	mflo	t3
bfc02468:	012b3821 	addu	a3,t1,t3
bfc0246c:	00000000 	nop
bfc02470:	006d0018 	mult	v1,t5
bfc02474:	00004012 	mflo	t0
bfc02478:	14a0ffc6 	bnez	a1,bfc02394 <matrix_mul_matrix+0x1a4>
bfc0247c:	00e89021 	addu	s2,a3,t0
bfc02480:	26d60001 	addiu	s6,s6,1
bfc02484:	02d5c02b 	sltu	t8,s6,s5
bfc02488:	aef20000 	sw	s2,0(s7)
bfc0248c:	26940002 	addiu	s4,s4,2
bfc02490:	1700ff6d 	bnez	t8,bfc02248 <matrix_mul_matrix+0x58>
bfc02494:	26f70004 	addiu	s7,s7,4
bfc02498:	8fb00008 	lw	s0,8(sp)
bfc0249c:	8fb70004 	lw	s7,4(sp)
bfc024a0:	8fb90000 	lw	t9,0(sp)
bfc024a4:	26120001 	addiu	s2,s0,1
bfc024a8:	02f9b021 	addu	s6,s7,t9
bfc024ac:	0255a02b 	sltu	s4,s2,s5
bfc024b0:	afb20008 	sw	s2,8(sp)
bfc024b4:	03d3f021 	addu	s8,s8,s3
bfc024b8:	1680ff60 	bnez	s4,bfc0223c <matrix_mul_matrix+0x4c>
bfc024bc:	afb60004 	sw	s6,4(sp)
bfc024c0:	8fbe0034 	lw	s8,52(sp)
bfc024c4:	8fb70030 	lw	s7,48(sp)
bfc024c8:	8fb6002c 	lw	s6,44(sp)
bfc024cc:	8fb50028 	lw	s5,40(sp)
bfc024d0:	8fb40024 	lw	s4,36(sp)
bfc024d4:	8fb30020 	lw	s3,32(sp)
bfc024d8:	8fb2001c 	lw	s2,28(sp)
bfc024dc:	8fb10018 	lw	s1,24(sp)
bfc024e0:	8fb00014 	lw	s0,20(sp)
bfc024e4:	03e00008 	jr	ra
bfc024e8:	27bd0038 	addiu	sp,sp,56
bfc024ec:	00000000 	nop

bfc024f0 <matrix_mul_matrix_bitextract>:
matrix_mul_matrix_bitextract():
bfc024f0:	27bdffd8 	addiu	sp,sp,-40
bfc024f4:	afbe0024 	sw	s8,36(sp)
bfc024f8:	afb00004 	sw	s0,4(sp)
bfc024fc:	afb70020 	sw	s7,32(sp)
bfc02500:	afb6001c 	sw	s6,28(sp)
bfc02504:	afb50018 	sw	s5,24(sp)
bfc02508:	afb40014 	sw	s4,20(sp)
bfc0250c:	afb30010 	sw	s3,16(sp)
bfc02510:	afb2000c 	sw	s2,12(sp)
bfc02514:	afb10008 	sw	s1,8(sp)
bfc02518:	00808021 	move	s0,a0
bfc0251c:	1080008e 	beqz	a0,bfc02758 <matrix_mul_matrix_bitextract+0x268>
bfc02520:	00e0f021 	move	s8,a3
bfc02524:	00c0a021 	move	s4,a2
bfc02528:	00a0a821 	move	s5,a1
bfc0252c:	0004c840 	sll	t9,a0,0x1
bfc02530:	0004b880 	sll	s7,a0,0x2
bfc02534:	0000b021 	move	s6,zero
bfc02538:	03c08821 	move	s1,s8
bfc0253c:	02a09021 	move	s2,s5
bfc02540:	00009821 	move	s3,zero
bfc02544:	86290000 	lh	t1,0(s1)
bfc02548:	868a0000 	lh	t2,0(s4)
bfc0254c:	240f0001 	li	t7,1
bfc02550:	012a0018 	mult	t1,t2
bfc02554:	2604ffff 	addiu	a0,s0,-1
bfc02558:	01f0282b 	sltu	a1,t7,s0
bfc0255c:	30840003 	andi	a0,a0,0x3
bfc02560:	268d0002 	addiu	t5,s4,2
bfc02564:	00004012 	mflo	t0
bfc02568:	00083083 	sra	a2,t0,0x2
bfc0256c:	00083943 	sra	a3,t0,0x5
bfc02570:	30e2007f 	andi	v0,a3,0x7f
bfc02574:	30c3000f 	andi	v1,a2,0xf
bfc02578:	00430018 	mult	v0,v1
bfc0257c:	0000c012 	mflo	t8
bfc02580:	10a0006a 	beqz	a1,bfc0272c <matrix_mul_matrix_bitextract+0x23c>
bfc02584:	02397021 	addu	t6,s1,t9
bfc02588:	10800031 	beqz	a0,bfc02650 <matrix_mul_matrix_bitextract+0x160>
bfc0258c:	00000000 	nop
bfc02590:	108f001f 	beq	a0,t7,bfc02610 <matrix_mul_matrix_bitextract+0x120>
bfc02594:	24030002 	li	v1,2
bfc02598:	1083000f 	beq	a0,v1,bfc025d8 <matrix_mul_matrix_bitextract+0xe8>
bfc0259c:	00000000 	nop
bfc025a0:	85a70000 	lh	a3,0(t5)
bfc025a4:	85cc0000 	lh	t4,0(t6)
bfc025a8:	240f0002 	li	t7,2
bfc025ac:	01870018 	mult	t4,a3
bfc025b0:	01d97021 	addu	t6,t6,t9
bfc025b4:	268d0004 	addiu	t5,s4,4
bfc025b8:	00004812 	mflo	t1
bfc025bc:	00091083 	sra	v0,t1,0x2
bfc025c0:	00092943 	sra	a1,t1,0x5
bfc025c4:	30a8007f 	andi	t0,a1,0x7f
bfc025c8:	304a000f 	andi	t2,v0,0xf
bfc025cc:	010a0018 	mult	t0,t2
bfc025d0:	00002012 	mflo	a0
bfc025d4:	0304c021 	addu	t8,t8,a0
bfc025d8:	85c20000 	lh	v0,0(t6)
bfc025dc:	85a50000 	lh	a1,0(t5)
bfc025e0:	25ef0001 	addiu	t7,t7,1
bfc025e4:	00450018 	mult	v0,a1
bfc025e8:	25ad0002 	addiu	t5,t5,2
bfc025ec:	01d97021 	addu	t6,t6,t9
bfc025f0:	00004012 	mflo	t0
bfc025f4:	00082083 	sra	a0,t0,0x2
bfc025f8:	00085143 	sra	t2,t0,0x5
bfc025fc:	314b007f 	andi	t3,t2,0x7f
bfc02600:	3083000f 	andi	v1,a0,0xf
bfc02604:	01630018 	mult	t3,v1
bfc02608:	00003012 	mflo	a2
bfc0260c:	0306c021 	addu	t8,t8,a2
bfc02610:	85ca0000 	lh	t2,0(t6)
bfc02614:	85a80000 	lh	t0,0(t5)
bfc02618:	25ef0001 	addiu	t7,t7,1
bfc0261c:	01480018 	mult	t2,t0
bfc02620:	01f0482b 	sltu	t1,t7,s0
bfc02624:	25ad0002 	addiu	t5,t5,2
bfc02628:	01d97021 	addu	t6,t6,t9
bfc0262c:	00002012 	mflo	a0
bfc02630:	00045883 	sra	t3,a0,0x2
bfc02634:	00041943 	sra	v1,a0,0x5
bfc02638:	306c007f 	andi	t4,v1,0x7f
bfc0263c:	3166000f 	andi	a2,t3,0xf
bfc02640:	01860018 	mult	t4,a2
bfc02644:	00003812 	mflo	a3
bfc02648:	11200038 	beqz	t1,bfc0272c <matrix_mul_matrix_bitextract+0x23c>
bfc0264c:	0307c021 	addu	t8,t8,a3
bfc02650:	85c60000 	lh	a2,0(t6)
bfc02654:	85ab0000 	lh	t3,0(t5)
bfc02658:	01d96021 	addu	t4,t6,t9
bfc0265c:	00cb0018 	mult	a2,t3
bfc02660:	85a90002 	lh	t1,2(t5)
bfc02664:	85850000 	lh	a1,0(t4)
bfc02668:	01997021 	addu	t6,t4,t9
bfc0266c:	85aa0004 	lh	t2,4(t5)
bfc02670:	85c40000 	lh	a0,0(t6)
bfc02674:	01d93821 	addu	a3,t6,t9
bfc02678:	85ab0006 	lh	t3,6(t5)
bfc0267c:	84e60000 	lh	a2,0(a3)
bfc02680:	00f97021 	addu	t6,a3,t9
bfc02684:	25ef0004 	addiu	t7,t7,4
bfc02688:	01f0602b 	sltu	t4,t7,s0
bfc0268c:	25ad0008 	addiu	t5,t5,8
bfc02690:	00001012 	mflo	v0
bfc02694:	00024083 	sra	t0,v0,0x2
bfc02698:	00021143 	sra	v0,v0,0x5
bfc0269c:	00a90018 	mult	a1,t1
bfc026a0:	3042007f 	andi	v0,v0,0x7f
bfc026a4:	3108000f 	andi	t0,t0,0xf
bfc026a8:	00001812 	mflo	v1
bfc026ac:	00034883 	sra	t1,v1,0x2
bfc026b0:	00032943 	sra	a1,v1,0x5
bfc026b4:	008a0018 	mult	a0,t2
bfc026b8:	30a5007f 	andi	a1,a1,0x7f
bfc026bc:	3129000f 	andi	t1,t1,0xf
bfc026c0:	00005012 	mflo	t2
bfc026c4:	000a3883 	sra	a3,t2,0x2
bfc026c8:	000a2143 	sra	a0,t2,0x5
bfc026cc:	00cb0018 	mult	a2,t3
bfc026d0:	30ea000f 	andi	t2,a3,0xf
bfc026d4:	3084007f 	andi	a0,a0,0x7f
bfc026d8:	00001812 	mflo	v1
bfc026dc:	00033083 	sra	a2,v1,0x2
bfc026e0:	00031943 	sra	v1,v1,0x5
bfc026e4:	00480018 	mult	v0,t0
bfc026e8:	3063007f 	andi	v1,v1,0x7f
bfc026ec:	30c6000f 	andi	a2,a2,0xf
bfc026f0:	00005812 	mflo	t3
bfc026f4:	030b1021 	addu	v0,t8,t3
bfc026f8:	00000000 	nop
bfc026fc:	00a90018 	mult	a1,t1
bfc02700:	00004012 	mflo	t0
bfc02704:	0048c021 	addu	t8,v0,t0
bfc02708:	00000000 	nop
bfc0270c:	008a0018 	mult	a0,t2
bfc02710:	00003812 	mflo	a3
bfc02714:	03075821 	addu	t3,t8,a3
bfc02718:	00000000 	nop
bfc0271c:	00660018 	mult	v1,a2
bfc02720:	00002812 	mflo	a1
bfc02724:	1580ffca 	bnez	t4,bfc02650 <matrix_mul_matrix_bitextract+0x160>
bfc02728:	0165c021 	addu	t8,t3,a1
bfc0272c:	26730001 	addiu	s3,s3,1
bfc02730:	0270682b 	sltu	t5,s3,s0
bfc02734:	ae580000 	sw	t8,0(s2)
bfc02738:	26310002 	addiu	s1,s1,2
bfc0273c:	15a0ff81 	bnez	t5,bfc02544 <matrix_mul_matrix_bitextract+0x54>
bfc02740:	26520004 	addiu	s2,s2,4
bfc02744:	26d60001 	addiu	s6,s6,1
bfc02748:	02d0782b 	sltu	t7,s6,s0
bfc0274c:	0299a021 	addu	s4,s4,t9
bfc02750:	15e0ff79 	bnez	t7,bfc02538 <matrix_mul_matrix_bitextract+0x48>
bfc02754:	02b7a821 	addu	s5,s5,s7
bfc02758:	8fbe0024 	lw	s8,36(sp)
bfc0275c:	8fb70020 	lw	s7,32(sp)
bfc02760:	8fb6001c 	lw	s6,28(sp)
bfc02764:	8fb50018 	lw	s5,24(sp)
bfc02768:	8fb40014 	lw	s4,20(sp)
bfc0276c:	8fb30010 	lw	s3,16(sp)
bfc02770:	8fb2000c 	lw	s2,12(sp)
bfc02774:	8fb10008 	lw	s1,8(sp)
bfc02778:	8fb00004 	lw	s0,4(sp)
bfc0277c:	03e00008 	jr	ra
bfc02780:	27bd0028 	addiu	sp,sp,40
	...

bfc02790 <matrix_test>:
matrix_test():
bfc02790:	27bdffa0 	addiu	sp,sp,-96
bfc02794:	87a20070 	lh	v0,112(sp)
bfc02798:	afb40048 	sw	s4,72(sp)
bfc0279c:	afbf005c 	sw	ra,92(sp)
bfc027a0:	afbe0058 	sw	s8,88(sp)
bfc027a4:	afb70054 	sw	s7,84(sp)
bfc027a8:	afb60050 	sw	s6,80(sp)
bfc027ac:	afb5004c 	sw	s5,76(sp)
bfc027b0:	afb30044 	sw	s3,68(sp)
bfc027b4:	afb20040 	sw	s2,64(sp)
bfc027b8:	afb1003c 	sw	s1,60(sp)
bfc027bc:	afb00038 	sw	s0,56(sp)
bfc027c0:	0080a021 	move	s4,a0
bfc027c4:	afa50028 	sw	a1,40(sp)
bfc027c8:	afa6002c 	sw	a2,44(sp)
bfc027cc:	afa70030 	sw	a3,48(sp)
bfc027d0:	108005ad 	beqz	a0,bfc03e88 <matrix_test+0x16f8>
bfc027d4:	afa20034 	sw	v0,52(sp)
bfc027d8:	304dffff 	andi	t5,v0,0xffff
bfc027dc:	00049040 	sll	s2,a0,0x1
bfc027e0:	afa60014 	sw	a2,20(sp)
bfc027e4:	00c07021 	move	t6,a2
bfc027e8:	00007821 	move	t7,zero
bfc027ec:	95c90000 	lhu	t1,0(t6)
bfc027f0:	240c0001 	li	t4,1
bfc027f4:	01a95021 	addu	t2,t5,t1
bfc027f8:	269fffff 	addiu	ra,s4,-1
bfc027fc:	0194f02b 	sltu	s8,t4,s4
bfc02800:	a5ca0000 	sh	t2,0(t6)
bfc02804:	33e30007 	andi	v1,ra,0x7
bfc02808:	13c00050 	beqz	s8,bfc0294c <matrix_test+0x1bc>
bfc0280c:	25cb0002 	addiu	t3,t6,2
bfc02810:	10600032 	beqz	v1,bfc028dc <matrix_test+0x14c>
bfc02814:	00000000 	nop
bfc02818:	106c0029 	beq	v1,t4,bfc028c0 <matrix_test+0x130>
bfc0281c:	24100002 	li	s0,2
bfc02820:	10700022 	beq	v1,s0,bfc028ac <matrix_test+0x11c>
bfc02824:	24170003 	li	s7,3
bfc02828:	1077001b 	beq	v1,s7,bfc02898 <matrix_test+0x108>
bfc0282c:	24080004 	li	t0,4
bfc02830:	10680014 	beq	v1,t0,bfc02884 <matrix_test+0xf4>
bfc02834:	24150005 	li	s5,5
bfc02838:	1075000d 	beq	v1,s5,bfc02870 <matrix_test+0xe0>
bfc0283c:	24160006 	li	s6,6
bfc02840:	10760006 	beq	v1,s6,bfc0285c <matrix_test+0xcc>
bfc02844:	00000000 	nop
bfc02848:	95730000 	lhu	s3,0(t3)
bfc0284c:	240c0002 	li	t4,2
bfc02850:	01b31821 	addu	v1,t5,s3
bfc02854:	a5630000 	sh	v1,0(t3)
bfc02858:	25cb0004 	addiu	t3,t6,4
bfc0285c:	95710000 	lhu	s1,0(t3)
bfc02860:	258c0001 	addiu	t4,t4,1
bfc02864:	01b1c821 	addu	t9,t5,s1
bfc02868:	a5790000 	sh	t9,0(t3)
bfc0286c:	256b0002 	addiu	t3,t3,2
bfc02870:	95620000 	lhu	v0,0(t3)
bfc02874:	258c0001 	addiu	t4,t4,1
bfc02878:	01a2c021 	addu	t8,t5,v0
bfc0287c:	a5780000 	sh	t8,0(t3)
bfc02880:	256b0002 	addiu	t3,t3,2
bfc02884:	95690000 	lhu	t1,0(t3)
bfc02888:	258c0001 	addiu	t4,t4,1
bfc0288c:	01a9f021 	addu	s8,t5,t1
bfc02890:	a57e0000 	sh	s8,0(t3)
bfc02894:	256b0002 	addiu	t3,t3,2
bfc02898:	95670000 	lhu	a3,0(t3)
bfc0289c:	258c0001 	addiu	t4,t4,1
bfc028a0:	01a72821 	addu	a1,t5,a3
bfc028a4:	a5650000 	sh	a1,0(t3)
bfc028a8:	256b0002 	addiu	t3,t3,2
bfc028ac:	956a0000 	lhu	t2,0(t3)
bfc028b0:	258c0001 	addiu	t4,t4,1
bfc028b4:	01aa3021 	addu	a2,t5,t2
bfc028b8:	a5660000 	sh	a2,0(t3)
bfc028bc:	256b0002 	addiu	t3,t3,2
bfc028c0:	95700000 	lhu	s0,0(t3)
bfc028c4:	258c0001 	addiu	t4,t4,1
bfc028c8:	01b0f821 	addu	ra,t5,s0
bfc028cc:	0194202b 	sltu	a0,t4,s4
bfc028d0:	a57f0000 	sh	ra,0(t3)
bfc028d4:	1080001d 	beqz	a0,bfc0294c <matrix_test+0x1bc>
bfc028d8:	256b0002 	addiu	t3,t3,2
bfc028dc:	95790000 	lhu	t9,0(t3)
bfc028e0:	95780002 	lhu	t8,2(t3)
bfc028e4:	95770004 	lhu	s7,4(t3)
bfc028e8:	95760006 	lhu	s6,6(t3)
bfc028ec:	95750008 	lhu	s5,8(t3)
bfc028f0:	9573000a 	lhu	s3,10(t3)
bfc028f4:	9571000c 	lhu	s1,12(t3)
bfc028f8:	9570000e 	lhu	s0,14(t3)
bfc028fc:	258c0008 	addiu	t4,t4,8
bfc02900:	01b91021 	addu	v0,t5,t9
bfc02904:	01b81821 	addu	v1,t5,t8
bfc02908:	01b72021 	addu	a0,t5,s7
bfc0290c:	01b62821 	addu	a1,t5,s6
bfc02910:	01b53021 	addu	a2,t5,s5
bfc02914:	01b33821 	addu	a3,t5,s3
bfc02918:	01b14021 	addu	t0,t5,s1
bfc0291c:	01b04821 	addu	t1,t5,s0
bfc02920:	0194502b 	sltu	t2,t4,s4
bfc02924:	a5620000 	sh	v0,0(t3)
bfc02928:	a5630002 	sh	v1,2(t3)
bfc0292c:	a5640004 	sh	a0,4(t3)
bfc02930:	a5650006 	sh	a1,6(t3)
bfc02934:	a5660008 	sh	a2,8(t3)
bfc02938:	a567000a 	sh	a3,10(t3)
bfc0293c:	a568000c 	sh	t0,12(t3)
bfc02940:	a569000e 	sh	t1,14(t3)
bfc02944:	1540ffe5 	bnez	t2,bfc028dc <matrix_test+0x14c>
bfc02948:	256b0010 	addiu	t3,t3,16
bfc0294c:	25ef0001 	addiu	t7,t7,1
bfc02950:	01f4582b 	sltu	t3,t7,s4
bfc02954:	1560ffa5 	bnez	t3,bfc027ec <matrix_test+0x5c>
bfc02958:	01d27021 	addu	t6,t6,s2
bfc0295c:	8fac0028 	lw	t4,40(sp)
bfc02960:	00146880 	sll	t5,s4,0x2
bfc02964:	8faf002c 	lw	t7,44(sp)
bfc02968:	afad001c 	sw	t5,28(sp)
bfc0296c:	afac0020 	sw	t4,32(sp)
bfc02970:	01807021 	move	t6,t4
bfc02974:	00008021 	move	s0,zero
bfc02978:	85f10000 	lh	s1,0(t7)
bfc0297c:	8fa50034 	lw	a1,52(sp)
bfc02980:	240d0001 	li	t5,1
bfc02984:	00b10018 	mult	a1,s1
bfc02988:	2695ffff 	addiu	s5,s4,-1
bfc0298c:	01b4382b 	sltu	a3,t5,s4
bfc02990:	32a30007 	andi	v1,s5,0x7
bfc02994:	25eb0002 	addiu	t3,t7,2
bfc02998:	25cc0004 	addiu	t4,t6,4
bfc0299c:	00004012 	mflo	t0
bfc029a0:	10e00077 	beqz	a3,bfc02b80 <matrix_test+0x3f0>
bfc029a4:	adc80000 	sw	t0,0(t6)
bfc029a8:	10600047 	beqz	v1,bfc02ac8 <matrix_test+0x338>
bfc029ac:	00000000 	nop
bfc029b0:	106d003b 	beq	v1,t5,bfc02aa0 <matrix_test+0x310>
bfc029b4:	241e0002 	li	s8,2
bfc029b8:	107e0031 	beq	v1,s8,bfc02a80 <matrix_test+0x2f0>
bfc029bc:	24090003 	li	t1,3
bfc029c0:	10690027 	beq	v1,t1,bfc02a60 <matrix_test+0x2d0>
bfc029c4:	24050004 	li	a1,4
bfc029c8:	1065001d 	beq	v1,a1,bfc02a40 <matrix_test+0x2b0>
bfc029cc:	24070005 	li	a3,5
bfc029d0:	10670013 	beq	v1,a3,bfc02a20 <matrix_test+0x290>
bfc029d4:	24060006 	li	a2,6
bfc029d8:	10660009 	beq	v1,a2,bfc02a00 <matrix_test+0x270>
bfc029dc:	00000000 	nop
bfc029e0:	85640000 	lh	a0,0(t3)
bfc029e4:	8fab0034 	lw	t3,52(sp)
bfc029e8:	240d0002 	li	t5,2
bfc029ec:	01640018 	mult	t3,a0
bfc029f0:	25eb0004 	addiu	t3,t7,4
bfc029f4:	00005012 	mflo	t2
bfc029f8:	ad8a0000 	sw	t2,0(t4)
bfc029fc:	25cc0008 	addiu	t4,t6,8
bfc02a00:	85770000 	lh	s7,0(t3)
bfc02a04:	8fa30034 	lw	v1,52(sp)
bfc02a08:	25ad0001 	addiu	t5,t5,1
bfc02a0c:	00770018 	mult	v1,s7
bfc02a10:	256b0002 	addiu	t3,t3,2
bfc02a14:	0000f812 	mflo	ra
bfc02a18:	ad9f0000 	sw	ra,0(t4)
bfc02a1c:	258c0004 	addiu	t4,t4,4
bfc02a20:	85750000 	lh	s5,0(t3)
bfc02a24:	8fb60034 	lw	s6,52(sp)
bfc02a28:	25ad0001 	addiu	t5,t5,1
bfc02a2c:	02d50018 	mult	s6,s5
bfc02a30:	256b0002 	addiu	t3,t3,2
bfc02a34:	00004012 	mflo	t0
bfc02a38:	ad880000 	sw	t0,0(t4)
bfc02a3c:	258c0004 	addiu	t4,t4,4
bfc02a40:	85790000 	lh	t9,0(t3)
bfc02a44:	8fb10034 	lw	s1,52(sp)
bfc02a48:	25ad0001 	addiu	t5,t5,1
bfc02a4c:	02390018 	mult	s1,t9
bfc02a50:	256b0002 	addiu	t3,t3,2
bfc02a54:	00009812 	mflo	s3
bfc02a58:	ad930000 	sw	s3,0(t4)
bfc02a5c:	258c0004 	addiu	t4,t4,4
bfc02a60:	85620000 	lh	v0,0(t3)
bfc02a64:	8fbe0034 	lw	s8,52(sp)
bfc02a68:	25ad0001 	addiu	t5,t5,1
bfc02a6c:	03c20018 	mult	s8,v0
bfc02a70:	256b0002 	addiu	t3,t3,2
bfc02a74:	0000c012 	mflo	t8
bfc02a78:	ad980000 	sw	t8,0(t4)
bfc02a7c:	258c0004 	addiu	t4,t4,4
bfc02a80:	85650000 	lh	a1,0(t3)
bfc02a84:	8fa70034 	lw	a3,52(sp)
bfc02a88:	25ad0001 	addiu	t5,t5,1
bfc02a8c:	00e50018 	mult	a3,a1
bfc02a90:	256b0002 	addiu	t3,t3,2
bfc02a94:	00004812 	mflo	t1
bfc02a98:	ad890000 	sw	t1,0(t4)
bfc02a9c:	258c0004 	addiu	t4,t4,4
bfc02aa0:	85640000 	lh	a0,0(t3)
bfc02aa4:	8fbf0034 	lw	ra,52(sp)
bfc02aa8:	25ad0001 	addiu	t5,t5,1
bfc02aac:	03e40018 	mult	ra,a0
bfc02ab0:	01b4302b 	sltu	a2,t5,s4
bfc02ab4:	256b0002 	addiu	t3,t3,2
bfc02ab8:	00005012 	mflo	t2
bfc02abc:	ad8a0000 	sw	t2,0(t4)
bfc02ac0:	10c0002f 	beqz	a2,bfc02b80 <matrix_test+0x3f0>
bfc02ac4:	258c0004 	addiu	t4,t4,4
bfc02ac8:	85690000 	lh	t1,0(t3)
bfc02acc:	8fb30034 	lw	s3,52(sp)
bfc02ad0:	8fb10034 	lw	s1,52(sp)
bfc02ad4:	02690018 	mult	s3,t1
bfc02ad8:	856a0002 	lh	t2,2(t3)
bfc02adc:	857f0004 	lh	ra,4(t3)
bfc02ae0:	85790006 	lh	t9,6(t3)
bfc02ae4:	85780008 	lh	t8,8(t3)
bfc02ae8:	8577000a 	lh	s7,10(t3)
bfc02aec:	8576000c 	lh	s6,12(t3)
bfc02af0:	8575000e 	lh	s5,14(t3)
bfc02af4:	25ad0008 	addiu	t5,t5,8
bfc02af8:	01b4982b 	sltu	s3,t5,s4
bfc02afc:	256b0010 	addiu	t3,t3,16
bfc02b00:	00001012 	mflo	v0
bfc02b04:	ad820000 	sw	v0,0(t4)
bfc02b08:	00000000 	nop
bfc02b0c:	022a0018 	mult	s1,t2
bfc02b10:	0000f012 	mflo	s8
bfc02b14:	ad9e0004 	sw	s8,4(t4)
bfc02b18:	00000000 	nop
bfc02b1c:	023f0018 	mult	s1,ra
bfc02b20:	00002012 	mflo	a0
bfc02b24:	ad840008 	sw	a0,8(t4)
bfc02b28:	00000000 	nop
bfc02b2c:	02390018 	mult	s1,t9
bfc02b30:	00001812 	mflo	v1
bfc02b34:	ad83000c 	sw	v1,12(t4)
bfc02b38:	00000000 	nop
bfc02b3c:	02380018 	mult	s1,t8
bfc02b40:	00003012 	mflo	a2
bfc02b44:	ad860010 	sw	a2,16(t4)
bfc02b48:	00000000 	nop
bfc02b4c:	02370018 	mult	s1,s7
bfc02b50:	00002812 	mflo	a1
bfc02b54:	ad850014 	sw	a1,20(t4)
bfc02b58:	00000000 	nop
bfc02b5c:	02360018 	mult	s1,s6
bfc02b60:	00004012 	mflo	t0
bfc02b64:	ad880018 	sw	t0,24(t4)
bfc02b68:	00000000 	nop
bfc02b6c:	02350018 	mult	s1,s5
bfc02b70:	00003812 	mflo	a3
bfc02b74:	ad87001c 	sw	a3,28(t4)
bfc02b78:	1660ffd3 	bnez	s3,bfc02ac8 <matrix_test+0x338>
bfc02b7c:	258c0020 	addiu	t4,t4,32
bfc02b80:	26100001 	addiu	s0,s0,1
bfc02b84:	8fac001c 	lw	t4,28(sp)
bfc02b88:	0214582b 	sltu	t3,s0,s4
bfc02b8c:	01cc7021 	addu	t6,t6,t4
bfc02b90:	1560ff79 	bnez	t3,bfc02978 <matrix_test+0x1e8>
bfc02b94:	01f27821 	addu	t7,t7,s2
bfc02b98:	8faf0034 	lw	t7,52(sp)
bfc02b9c:	240ef000 	li	t6,-4096
bfc02ba0:	8fab0028 	lw	t3,40(sp)
bfc02ba4:	01eef025 	or	s8,t7,t6
bfc02ba8:	00003021 	move	a2,zero
bfc02bac:	00001821 	move	v1,zero
bfc02bb0:	00002021 	move	a0,zero
bfc02bb4:	00006021 	move	t4,zero
bfc02bb8:	2687ffff 	addiu	a3,s4,-1
bfc02bbc:	30ea0003 	andi	t2,a3,0x3
bfc02bc0:	01604021 	move	t0,t3
bfc02bc4:	1140003f 	beqz	t2,bfc02cc4 <matrix_test+0x534>
bfc02bc8:	00004821 	move	t1,zero
bfc02bcc:	8d670000 	lw	a3,0(t3)
bfc02bd0:	3093ffff 	andi	s3,a0,0xffff
bfc02bd4:	0067c82a 	slt	t9,v1,a3
bfc02bd8:	00c73021 	addu	a2,a2,a3
bfc02bdc:	0279b821 	addu	s7,s3,t9
bfc02be0:	2676000a 	addiu	s6,s3,10
bfc02be4:	0016ac00 	sll	s5,s6,0x10
bfc02be8:	0017fc00 	sll	ra,s7,0x10
bfc02bec:	03c6282a 	slt	a1,s8,a2
bfc02bf0:	00151403 	sra	v0,s5,0x10
bfc02bf4:	10a00002 	beqz	a1,bfc02c00 <matrix_test+0x470>
bfc02bf8:	001f2403 	sra	a0,ra,0x10
bfc02bfc:	00402021 	move	a0,v0
bfc02c00:	10a00002 	beqz	a1,bfc02c0c <matrix_test+0x47c>
bfc02c04:	24090001 	li	t1,1
bfc02c08:	00003021 	move	a2,zero
bfc02c0c:	0134882b 	sltu	s1,t1,s4
bfc02c10:	1220007b 	beqz	s1,bfc02e00 <matrix_test+0x670>
bfc02c14:	25680004 	addiu	t0,t3,4
bfc02c18:	1149002a 	beq	t2,t1,bfc02cc4 <matrix_test+0x534>
bfc02c1c:	00e01821 	move	v1,a3
bfc02c20:	24180002 	li	t8,2
bfc02c24:	11580014 	beq	t2,t8,bfc02c78 <matrix_test+0x4e8>
bfc02c28:	308fffff 	andi	t7,a0,0xffff
bfc02c2c:	8d050000 	lw	a1,0(t0)
bfc02c30:	00000000 	nop
bfc02c34:	00c55021 	addu	t2,a2,a1
bfc02c38:	00e5302a 	slt	a2,a3,a1
bfc02c3c:	01e68021 	addu	s0,t7,a2
bfc02c40:	25e7000a 	addiu	a3,t7,10
bfc02c44:	00071400 	sll	v0,a3,0x10
bfc02c48:	00107400 	sll	t6,s0,0x10
bfc02c4c:	03ca302a 	slt	a2,s8,t2
bfc02c50:	00021403 	sra	v0,v0,0x10
bfc02c54:	10c00002 	beqz	a2,bfc02c60 <matrix_test+0x4d0>
bfc02c58:	000e2403 	sra	a0,t6,0x10
bfc02c5c:	00402021 	move	a0,v0
bfc02c60:	14c00002 	bnez	a2,bfc02c6c <matrix_test+0x4dc>
bfc02c64:	00003021 	move	a2,zero
bfc02c68:	01403021 	move	a2,t2
bfc02c6c:	25290001 	addiu	t1,t1,1
bfc02c70:	25080004 	addiu	t0,t0,4
bfc02c74:	00a01821 	move	v1,a1
bfc02c78:	8d050000 	lw	a1,0(t0)
bfc02c7c:	3097ffff 	andi	s7,a0,0xffff
bfc02c80:	0065182a 	slt	v1,v1,a1
bfc02c84:	00c53821 	addu	a3,a2,a1
bfc02c88:	02e36821 	addu	t5,s7,v1
bfc02c8c:	26ff000a 	addiu	ra,s7,10
bfc02c90:	001f2400 	sll	a0,ra,0x10
bfc02c94:	000d5400 	sll	t2,t5,0x10
bfc02c98:	03c7302a 	slt	a2,s8,a3
bfc02c9c:	00041403 	sra	v0,a0,0x10
bfc02ca0:	10c00002 	beqz	a2,bfc02cac <matrix_test+0x51c>
bfc02ca4:	000a2403 	sra	a0,t2,0x10
bfc02ca8:	00402021 	move	a0,v0
bfc02cac:	14c00002 	bnez	a2,bfc02cb8 <matrix_test+0x528>
bfc02cb0:	00003021 	move	a2,zero
bfc02cb4:	00e03021 	move	a2,a3
bfc02cb8:	25290001 	addiu	t1,t1,1
bfc02cbc:	25080004 	addiu	t0,t0,4
bfc02cc0:	00a01821 	move	v1,a1
bfc02cc4:	8d070000 	lw	a3,0(t0)
bfc02cc8:	3082ffff 	andi	v0,a0,0xffff
bfc02ccc:	0067502a 	slt	t2,v1,a3
bfc02cd0:	004a1821 	addu	v1,v0,t2
bfc02cd4:	245f000a 	addiu	ra,v0,10
bfc02cd8:	00c73021 	addu	a2,a2,a3
bfc02cdc:	001fcc00 	sll	t9,ra,0x10
bfc02ce0:	00032400 	sll	a0,v1,0x10
bfc02ce4:	03c6282a 	slt	a1,s8,a2
bfc02ce8:	00191403 	sra	v0,t9,0x10
bfc02cec:	10a00002 	beqz	a1,bfc02cf8 <matrix_test+0x568>
bfc02cf0:	00042403 	sra	a0,a0,0x10
bfc02cf4:	00402021 	move	a0,v0
bfc02cf8:	10a00002 	beqz	a1,bfc02d04 <matrix_test+0x574>
bfc02cfc:	00000000 	nop
bfc02d00:	00003021 	move	a2,zero
bfc02d04:	25290001 	addiu	t1,t1,1
bfc02d08:	0134982b 	sltu	s3,t1,s4
bfc02d0c:	1260003c 	beqz	s3,bfc02e00 <matrix_test+0x670>
bfc02d10:	250a0004 	addiu	t2,t0,4
bfc02d14:	8d050004 	lw	a1,4(t0)
bfc02d18:	3098ffff 	andi	t8,a0,0xffff
bfc02d1c:	00c54021 	addu	t0,a2,a1
bfc02d20:	00e5302a 	slt	a2,a3,a1
bfc02d24:	03066821 	addu	t5,t8,a2
bfc02d28:	2717000a 	addiu	s7,t8,10
bfc02d2c:	0017b400 	sll	s6,s7,0x10
bfc02d30:	000d8400 	sll	s0,t5,0x10
bfc02d34:	03c8302a 	slt	a2,s8,t0
bfc02d38:	00162403 	sra	a0,s6,0x10
bfc02d3c:	10c00002 	beqz	a2,bfc02d48 <matrix_test+0x5b8>
bfc02d40:	00101403 	sra	v0,s0,0x10
bfc02d44:	00801021 	move	v0,a0
bfc02d48:	14c00002 	bnez	a2,bfc02d54 <matrix_test+0x5c4>
bfc02d4c:	00003821 	move	a3,zero
bfc02d50:	01003821 	move	a3,t0
bfc02d54:	8d460004 	lw	a2,4(t2)
bfc02d58:	3059ffff 	andi	t9,v0,0xffff
bfc02d5c:	00a6882a 	slt	s1,a1,a2
bfc02d60:	00e63821 	addu	a3,a3,a2
bfc02d64:	0331a821 	addu	s5,t9,s1
bfc02d68:	2733000a 	addiu	s3,t9,10
bfc02d6c:	0013b400 	sll	s6,s3,0x10
bfc02d70:	00154400 	sll	t0,s5,0x10
bfc02d74:	03c7282a 	slt	a1,s8,a3
bfc02d78:	00162403 	sra	a0,s6,0x10
bfc02d7c:	10a00002 	beqz	a1,bfc02d88 <matrix_test+0x5f8>
bfc02d80:	00081403 	sra	v0,t0,0x10
bfc02d84:	00801021 	move	v0,a0
bfc02d88:	10a00002 	beqz	a1,bfc02d94 <matrix_test+0x604>
bfc02d8c:	00000000 	nop
bfc02d90:	00003821 	move	a3,zero
bfc02d94:	8d450008 	lw	a1,8(t2)
bfc02d98:	304fffff 	andi	t7,v0,0xffff
bfc02d9c:	00c5682a 	slt	t5,a2,a1
bfc02da0:	25e2000a 	addiu	v0,t7,10
bfc02da4:	00e53821 	addu	a3,a3,a1
bfc02da8:	01ed7021 	addu	t6,t7,t5
bfc02dac:	00028400 	sll	s0,v0,0x10
bfc02db0:	000ec400 	sll	t8,t6,0x10
bfc02db4:	03c7302a 	slt	a2,s8,a3
bfc02db8:	00101403 	sra	v0,s0,0x10
bfc02dbc:	10c00002 	beqz	a2,bfc02dc8 <matrix_test+0x638>
bfc02dc0:	00182403 	sra	a0,t8,0x10
bfc02dc4:	00402021 	move	a0,v0
bfc02dc8:	14c00009 	bnez	a2,bfc02df0 <matrix_test+0x660>
bfc02dcc:	00000000 	nop
bfc02dd0:	00e03021 	move	a2,a3
bfc02dd4:	25290003 	addiu	t1,t1,3
bfc02dd8:	2548000c 	addiu	t0,t2,12
bfc02ddc:	0bf00b31 	j	bfc02cc4 <matrix_test+0x534>
bfc02de0:	00a01821 	move	v1,a1
	...
bfc02df0:	0bf00b75 	j	bfc02dd4 <matrix_test+0x644>
bfc02df4:	00003021 	move	a2,zero
	...
bfc02e00:	258c0001 	addiu	t4,t4,1
bfc02e04:	8fa8001c 	lw	t0,28(sp)
bfc02e08:	0194482b 	sltu	t1,t4,s4
bfc02e0c:	11200003 	beqz	t1,bfc02e1c <matrix_test+0x68c>
bfc02e10:	01685821 	addu	t3,t3,t0
bfc02e14:	0bf00aee 	j	bfc02bb8 <matrix_test+0x428>
bfc02e18:	00e01821 	move	v1,a3
bfc02e1c:	0ff0179c 	jal	bfc05e70 <crc16>
bfc02e20:	00002821 	move	a1,zero
bfc02e24:	8fb60028 	lw	s6,40(sp)
bfc02e28:	8fb5002c 	lw	s5,44(sp)
bfc02e2c:	0040f821 	move	ra,v0
bfc02e30:	0000b821 	move	s7,zero
bfc02e34:	8faf0030 	lw	t7,48(sp)
bfc02e38:	86a50000 	lh	a1,0(s5)
bfc02e3c:	85ee0000 	lh	t6,0(t7)
bfc02e40:	24130001 	li	s3,1
bfc02e44:	01c50018 	mult	t6,a1
bfc02e48:	8fac0030 	lw	t4,48(sp)
bfc02e4c:	2691ffff 	addiu	s1,s4,-1
bfc02e50:	0274582b 	sltu	t3,s3,s4
bfc02e54:	32230007 	andi	v1,s1,0x7
bfc02e58:	25980002 	addiu	t8,t4,2
bfc02e5c:	0000c812 	mflo	t9
bfc02e60:	1160007f 	beqz	t3,bfc03060 <matrix_test+0x8d0>
bfc02e64:	26b10002 	addiu	s1,s5,2
bfc02e68:	10600048 	beqz	v1,bfc02f8c <matrix_test+0x7fc>
bfc02e6c:	00000000 	nop
bfc02e70:	1073003c 	beq	v1,s3,bfc02f64 <matrix_test+0x7d4>
bfc02e74:	240b0002 	li	t3,2
bfc02e78:	106b0032 	beq	v1,t3,bfc02f44 <matrix_test+0x7b4>
bfc02e7c:	24090003 	li	t1,3
bfc02e80:	10690028 	beq	v1,t1,bfc02f24 <matrix_test+0x794>
bfc02e84:	24050004 	li	a1,4
bfc02e88:	1065001e 	beq	v1,a1,bfc02f04 <matrix_test+0x774>
bfc02e8c:	240c0005 	li	t4,5
bfc02e90:	106c0014 	beq	v1,t4,bfc02ee4 <matrix_test+0x754>
bfc02e94:	24070006 	li	a3,6
bfc02e98:	1067000a 	beq	v1,a3,bfc02ec4 <matrix_test+0x734>
bfc02e9c:	00000000 	nop
bfc02ea0:	8faa0030 	lw	t2,48(sp)
bfc02ea4:	86380000 	lh	t8,0(s1)
bfc02ea8:	85480002 	lh	t0,2(t2)
bfc02eac:	24130002 	li	s3,2
bfc02eb0:	01180018 	mult	t0,t8
bfc02eb4:	26b10004 	addiu	s1,s5,4
bfc02eb8:	25580004 	addiu	t8,t2,4
bfc02ebc:	00003012 	mflo	a2
bfc02ec0:	0326c821 	addu	t9,t9,a2
bfc02ec4:	870d0000 	lh	t5,0(t8)
bfc02ec8:	86240000 	lh	a0,0(s1)
bfc02ecc:	26730001 	addiu	s3,s3,1
bfc02ed0:	01a40018 	mult	t5,a0
bfc02ed4:	26310002 	addiu	s1,s1,2
bfc02ed8:	27180002 	addiu	t8,t8,2
bfc02edc:	00007812 	mflo	t7
bfc02ee0:	032fc821 	addu	t9,t9,t7
bfc02ee4:	87020000 	lh	v0,0(t8)
bfc02ee8:	862e0000 	lh	t6,0(s1)
bfc02eec:	26730001 	addiu	s3,s3,1
bfc02ef0:	004e0018 	mult	v0,t6
bfc02ef4:	26310002 	addiu	s1,s1,2
bfc02ef8:	27180002 	addiu	t8,t8,2
bfc02efc:	00001812 	mflo	v1
bfc02f00:	0323c821 	addu	t9,t9,v1
bfc02f04:	870b0000 	lh	t3,0(t8)
bfc02f08:	86290000 	lh	t1,0(s1)
bfc02f0c:	26730001 	addiu	s3,s3,1
bfc02f10:	01690018 	mult	t3,t1
bfc02f14:	26310002 	addiu	s1,s1,2
bfc02f18:	27180002 	addiu	t8,t8,2
bfc02f1c:	00008012 	mflo	s0
bfc02f20:	0330c821 	addu	t9,t9,s0
bfc02f24:	870c0000 	lh	t4,0(t8)
bfc02f28:	86270000 	lh	a3,0(s1)
bfc02f2c:	26730001 	addiu	s3,s3,1
bfc02f30:	01870018 	mult	t4,a3
bfc02f34:	26310002 	addiu	s1,s1,2
bfc02f38:	27180002 	addiu	t8,t8,2
bfc02f3c:	00002812 	mflo	a1
bfc02f40:	0325c821 	addu	t9,t9,a1
bfc02f44:	870a0000 	lh	t2,0(t8)
bfc02f48:	86280000 	lh	t0,0(s1)
bfc02f4c:	26730001 	addiu	s3,s3,1
bfc02f50:	01480018 	mult	t2,t0
bfc02f54:	26310002 	addiu	s1,s1,2
bfc02f58:	27180002 	addiu	t8,t8,2
bfc02f5c:	00003012 	mflo	a2
bfc02f60:	0326c821 	addu	t9,t9,a2
bfc02f64:	87040000 	lh	a0,0(t8)
bfc02f68:	86230000 	lh	v1,0(s1)
bfc02f6c:	26730001 	addiu	s3,s3,1
bfc02f70:	00830018 	mult	a0,v1
bfc02f74:	0274782b 	sltu	t7,s3,s4
bfc02f78:	26310002 	addiu	s1,s1,2
bfc02f7c:	27180002 	addiu	t8,t8,2
bfc02f80:	00006812 	mflo	t5
bfc02f84:	11e00036 	beqz	t7,bfc03060 <matrix_test+0x8d0>
bfc02f88:	032dc821 	addu	t9,t9,t5
bfc02f8c:	87080000 	lh	t0,0(t8)
bfc02f90:	86230000 	lh	v1,0(s1)
bfc02f94:	87100002 	lh	s0,2(t8)
bfc02f98:	01030018 	mult	t0,v1
bfc02f9c:	862a0002 	lh	t2,2(s1)
bfc02fa0:	87040004 	lh	a0,4(t8)
bfc02fa4:	862b0004 	lh	t3,4(s1)
bfc02fa8:	87050006 	lh	a1,6(t8)
bfc02fac:	862c0006 	lh	t4,6(s1)
bfc02fb0:	87060008 	lh	a2,8(t8)
bfc02fb4:	862d0008 	lh	t5,8(s1)
bfc02fb8:	8707000a 	lh	a3,10(t8)
bfc02fbc:	862e000a 	lh	t6,10(s1)
bfc02fc0:	8708000c 	lh	t0,12(t8)
bfc02fc4:	862f000c 	lh	t7,12(s1)
bfc02fc8:	8703000e 	lh	v1,14(t8)
bfc02fcc:	00001012 	mflo	v0
bfc02fd0:	26730008 	addiu	s3,s3,8
bfc02fd4:	03221021 	addu	v0,t9,v0
bfc02fd8:	27180010 	addiu	t8,t8,16
bfc02fdc:	020a0018 	mult	s0,t2
bfc02fe0:	8630000e 	lh	s0,14(s1)
bfc02fe4:	0274502b 	sltu	t2,s3,s4
bfc02fe8:	26310010 	addiu	s1,s1,16
bfc02fec:	00004812 	mflo	t1
bfc02ff0:	0049c821 	addu	t9,v0,t1
bfc02ff4:	00000000 	nop
bfc02ff8:	008b0018 	mult	a0,t3
bfc02ffc:	00002012 	mflo	a0
	...
bfc03008:	00ac0018 	mult	a1,t4
bfc0300c:	03246021 	addu	t4,t9,a0
bfc03010:	00002812 	mflo	a1
bfc03014:	01851021 	addu	v0,t4,a1
bfc03018:	00000000 	nop
bfc0301c:	00cd0018 	mult	a2,t5
bfc03020:	00005812 	mflo	t3
bfc03024:	004bc821 	addu	t9,v0,t3
bfc03028:	00000000 	nop
bfc0302c:	00ee0018 	mult	a3,t6
bfc03030:	00004812 	mflo	t1
bfc03034:	03293021 	addu	a2,t9,t1
bfc03038:	00000000 	nop
bfc0303c:	010f0018 	mult	t0,t7
bfc03040:	00002012 	mflo	a0
	...
bfc0304c:	00700018 	mult	v1,s0
bfc03050:	00c48021 	addu	s0,a2,a0
bfc03054:	00006812 	mflo	t5
bfc03058:	1540ffcc 	bnez	t2,bfc02f8c <matrix_test+0x7fc>
bfc0305c:	020dc821 	addu	t9,s0,t5
bfc03060:	26f70001 	addiu	s7,s7,1
bfc03064:	02f4c02b 	sltu	t8,s7,s4
bfc03068:	aed90000 	sw	t9,0(s6)
bfc0306c:	02b2a821 	addu	s5,s5,s2
bfc03070:	1700ff70 	bnez	t8,bfc02e34 <matrix_test+0x6a4>
bfc03074:	26d60004 	addiu	s6,s6,4
bfc03078:	8fab0028 	lw	t3,40(sp)
bfc0307c:	00003021 	move	a2,zero
bfc03080:	00001821 	move	v1,zero
bfc03084:	00002021 	move	a0,zero
bfc03088:	00006021 	move	t4,zero
bfc0308c:	2687ffff 	addiu	a3,s4,-1
bfc03090:	30ea0003 	andi	t2,a3,0x3
bfc03094:	01604021 	move	t0,t3
bfc03098:	1140003f 	beqz	t2,bfc03198 <matrix_test+0xa08>
bfc0309c:	00004821 	move	t1,zero
bfc030a0:	8d670000 	lw	a3,0(t3)
bfc030a4:	3099ffff 	andi	t9,a0,0xffff
bfc030a8:	0067c02a 	slt	t8,v1,a3
bfc030ac:	00c73021 	addu	a2,a2,a3
bfc030b0:	0338a821 	addu	s5,t9,t8
bfc030b4:	2733000a 	addiu	s3,t9,10
bfc030b8:	0013b400 	sll	s6,s3,0x10
bfc030bc:	0015bc00 	sll	s7,s5,0x10
bfc030c0:	03c6282a 	slt	a1,s8,a2
bfc030c4:	00161403 	sra	v0,s6,0x10
bfc030c8:	10a00002 	beqz	a1,bfc030d4 <matrix_test+0x944>
bfc030cc:	00172403 	sra	a0,s7,0x10
bfc030d0:	00402021 	move	a0,v0
bfc030d4:	10a00002 	beqz	a1,bfc030e0 <matrix_test+0x950>
bfc030d8:	24090001 	li	t1,1
bfc030dc:	00003021 	move	a2,zero
bfc030e0:	0134782b 	sltu	t7,t1,s4
bfc030e4:	11e0007a 	beqz	t7,bfc032d0 <matrix_test+0xb40>
bfc030e8:	25680004 	addiu	t0,t3,4
bfc030ec:	1149002a 	beq	t2,t1,bfc03198 <matrix_test+0xa08>
bfc030f0:	00e01821 	move	v1,a3
bfc030f4:	240d0002 	li	t5,2
bfc030f8:	114d0014 	beq	t2,t5,bfc0314c <matrix_test+0x9bc>
bfc030fc:	308effff 	andi	t6,a0,0xffff
bfc03100:	8d050000 	lw	a1,0(t0)
bfc03104:	00000000 	nop
bfc03108:	00c55021 	addu	t2,a2,a1
bfc0310c:	00e5302a 	slt	a2,a3,a1
bfc03110:	01c61821 	addu	v1,t6,a2
bfc03114:	25c2000a 	addiu	v0,t6,10
bfc03118:	00022400 	sll	a0,v0,0x10
bfc0311c:	00033c00 	sll	a3,v1,0x10
bfc03120:	03ca302a 	slt	a2,s8,t2
bfc03124:	00041403 	sra	v0,a0,0x10
bfc03128:	10c00002 	beqz	a2,bfc03134 <matrix_test+0x9a4>
bfc0312c:	00072403 	sra	a0,a3,0x10
bfc03130:	00402021 	move	a0,v0
bfc03134:	14c00002 	bnez	a2,bfc03140 <matrix_test+0x9b0>
bfc03138:	00003021 	move	a2,zero
bfc0313c:	01403021 	move	a2,t2
bfc03140:	25290001 	addiu	t1,t1,1
bfc03144:	25080004 	addiu	t0,t0,4
bfc03148:	00a01821 	move	v1,a1
bfc0314c:	8d050000 	lw	a1,0(t0)
bfc03150:	3095ffff 	andi	s5,a0,0xffff
bfc03154:	0065b02a 	slt	s6,v1,a1
bfc03158:	00c53821 	addu	a3,a2,a1
bfc0315c:	02b68021 	addu	s0,s5,s6
bfc03160:	26b7000a 	addiu	s7,s5,10
bfc03164:	00178c00 	sll	s1,s7,0x10
bfc03168:	00105400 	sll	t2,s0,0x10
bfc0316c:	03c7302a 	slt	a2,s8,a3
bfc03170:	00111403 	sra	v0,s1,0x10
bfc03174:	10c00002 	beqz	a2,bfc03180 <matrix_test+0x9f0>
bfc03178:	000a2403 	sra	a0,t2,0x10
bfc0317c:	00402021 	move	a0,v0
bfc03180:	14c00002 	bnez	a2,bfc0318c <matrix_test+0x9fc>
bfc03184:	00003021 	move	a2,zero
bfc03188:	00e03021 	move	a2,a3
bfc0318c:	25290001 	addiu	t1,t1,1
bfc03190:	25080004 	addiu	t0,t0,4
bfc03194:	00a01821 	move	v1,a1
bfc03198:	8d070000 	lw	a3,0(t0)
bfc0319c:	3085ffff 	andi	a1,a0,0xffff
bfc031a0:	0067102a 	slt	v0,v1,a3
bfc031a4:	00a26821 	addu	t5,a1,v0
bfc031a8:	24a4000a 	addiu	a0,a1,10
bfc031ac:	00c73021 	addu	a2,a2,a3
bfc031b0:	0004cc00 	sll	t9,a0,0x10
bfc031b4:	000d7400 	sll	t6,t5,0x10
bfc031b8:	03c6282a 	slt	a1,s8,a2
bfc031bc:	00191403 	sra	v0,t9,0x10
bfc031c0:	10a00002 	beqz	a1,bfc031cc <matrix_test+0xa3c>
bfc031c4:	000e2403 	sra	a0,t6,0x10
bfc031c8:	00402021 	move	a0,v0
bfc031cc:	10a00002 	beqz	a1,bfc031d8 <matrix_test+0xa48>
bfc031d0:	00000000 	nop
bfc031d4:	00003021 	move	a2,zero
bfc031d8:	25290001 	addiu	t1,t1,1
bfc031dc:	0134802b 	sltu	s0,t1,s4
bfc031e0:	1200003b 	beqz	s0,bfc032d0 <matrix_test+0xb40>
bfc031e4:	250a0004 	addiu	t2,t0,4
bfc031e8:	8d050004 	lw	a1,4(t0)
bfc031ec:	3091ffff 	andi	s1,a0,0xffff
bfc031f0:	00e5782a 	slt	t7,a3,a1
bfc031f4:	00c54021 	addu	t0,a2,a1
bfc031f8:	022fb021 	addu	s6,s1,t7
bfc031fc:	2633000a 	addiu	s3,s1,10
bfc03200:	0013bc00 	sll	s7,s3,0x10
bfc03204:	0016ac00 	sll	s5,s6,0x10
bfc03208:	03c8302a 	slt	a2,s8,t0
bfc0320c:	00172403 	sra	a0,s7,0x10
bfc03210:	10c00002 	beqz	a2,bfc0321c <matrix_test+0xa8c>
bfc03214:	00151403 	sra	v0,s5,0x10
bfc03218:	00801021 	move	v0,a0
bfc0321c:	14c00002 	bnez	a2,bfc03228 <matrix_test+0xa98>
bfc03220:	00003821 	move	a3,zero
bfc03224:	01003821 	move	a3,t0
bfc03228:	8d460004 	lw	a2,4(t2)
bfc0322c:	304fffff 	andi	t7,v0,0xffff
bfc03230:	00a6682a 	slt	t5,a1,a2
bfc03234:	00e63821 	addu	a3,a3,a2
bfc03238:	01ed9821 	addu	s3,t7,t5
bfc0323c:	25f8000a 	addiu	t8,t7,10
bfc03240:	0018cc00 	sll	t9,t8,0x10
bfc03244:	00134400 	sll	t0,s3,0x10
bfc03248:	03c7282a 	slt	a1,s8,a3
bfc0324c:	00192403 	sra	a0,t9,0x10
bfc03250:	10a00002 	beqz	a1,bfc0325c <matrix_test+0xacc>
bfc03254:	00081403 	sra	v0,t0,0x10
bfc03258:	00801021 	move	v0,a0
bfc0325c:	10a00002 	beqz	a1,bfc03268 <matrix_test+0xad8>
bfc03260:	00000000 	nop
bfc03264:	00003821 	move	a3,zero
bfc03268:	8d450008 	lw	a1,8(t2)
bfc0326c:	3050ffff 	andi	s0,v0,0xffff
bfc03270:	00c5882a 	slt	s1,a2,a1
bfc03274:	00e53821 	addu	a3,a3,a1
bfc03278:	02111821 	addu	v1,s0,s1
bfc0327c:	260e000a 	addiu	t6,s0,10
bfc03280:	000e1400 	sll	v0,t6,0x10
bfc03284:	00032400 	sll	a0,v1,0x10
bfc03288:	03c7302a 	slt	a2,s8,a3
bfc0328c:	00021403 	sra	v0,v0,0x10
bfc03290:	10c00002 	beqz	a2,bfc0329c <matrix_test+0xb0c>
bfc03294:	00042403 	sra	a0,a0,0x10
bfc03298:	00402021 	move	a0,v0
bfc0329c:	14c00008 	bnez	a2,bfc032c0 <matrix_test+0xb30>
bfc032a0:	00000000 	nop
bfc032a4:	00e03021 	move	a2,a3
bfc032a8:	25290003 	addiu	t1,t1,3
bfc032ac:	2548000c 	addiu	t0,t2,12
bfc032b0:	0bf00c66 	j	bfc03198 <matrix_test+0xa08>
bfc032b4:	00a01821 	move	v1,a1
	...
bfc032c0:	0bf00caa 	j	bfc032a8 <matrix_test+0xb18>
bfc032c4:	00003021 	move	a2,zero
	...
bfc032d0:	258c0001 	addiu	t4,t4,1
bfc032d4:	8faa001c 	lw	t2,28(sp)
bfc032d8:	0194482b 	sltu	t1,t4,s4
bfc032dc:	11200003 	beqz	t1,bfc032ec <matrix_test+0xb5c>
bfc032e0:	016a5821 	addu	t3,t3,t2
bfc032e4:	0bf00c23 	j	bfc0308c <matrix_test+0x8fc>
bfc032e8:	00e01821 	move	v1,a3
bfc032ec:	03e02821 	move	a1,ra
bfc032f0:	0ff0179c 	jal	bfc05e70 <crc16>
bfc032f4:	00000000 	nop
bfc032f8:	8fa60028 	lw	a2,40(sp)
bfc032fc:	8fb7002c 	lw	s7,44(sp)
bfc03300:	afa20018 	sw	v0,24(sp)
bfc03304:	afa60010 	sw	a2,16(sp)
bfc03308:	afa00024 	sw	zero,36(sp)
bfc0330c:	8fb60010 	lw	s6,16(sp)
bfc03310:	8fb30030 	lw	s3,48(sp)
bfc03314:	0000a821 	move	s5,zero
bfc03318:	86ff0000 	lh	ra,0(s7)
bfc0331c:	86680000 	lh	t0,0(s3)
bfc03320:	24190001 	li	t9,1
bfc03324:	011f0018 	mult	t0,ra
bfc03328:	268bffff 	addiu	t3,s4,-1
bfc0332c:	0334602b 	sltu	t4,t9,s4
bfc03330:	31630007 	andi	v1,t3,0x7
bfc03334:	26f80002 	addiu	t8,s7,2
bfc03338:	0000f812 	mflo	ra
bfc0333c:	11800084 	beqz	t4,bfc03550 <matrix_test+0xdc0>
bfc03340:	02725021 	addu	t2,s3,s2
bfc03344:	10600047 	beqz	v1,bfc03464 <matrix_test+0xcd4>
bfc03348:	00000000 	nop
bfc0334c:	1079003b 	beq	v1,t9,bfc0343c <matrix_test+0xcac>
bfc03350:	240b0002 	li	t3,2
bfc03354:	106b0031 	beq	v1,t3,bfc0341c <matrix_test+0xc8c>
bfc03358:	24090003 	li	t1,3
bfc0335c:	10690027 	beq	v1,t1,bfc033fc <matrix_test+0xc6c>
bfc03360:	24050004 	li	a1,4
bfc03364:	1065001d 	beq	v1,a1,bfc033dc <matrix_test+0xc4c>
bfc03368:	240c0005 	li	t4,5
bfc0336c:	106c0013 	beq	v1,t4,bfc033bc <matrix_test+0xc2c>
bfc03370:	24070006 	li	a3,6
bfc03374:	10670009 	beq	v1,a3,bfc0339c <matrix_test+0xc0c>
bfc03378:	00000000 	nop
bfc0337c:	87020000 	lh	v0,0(t8)
bfc03380:	85440000 	lh	a0,0(t2)
bfc03384:	24190002 	li	t9,2
bfc03388:	00820018 	mult	a0,v0
bfc0338c:	01525021 	addu	t2,t2,s2
bfc03390:	26f80004 	addiu	t8,s7,4
bfc03394:	00003012 	mflo	a2
bfc03398:	03e6f821 	addu	ra,ra,a2
bfc0339c:	854e0000 	lh	t6,0(t2)
bfc033a0:	87100000 	lh	s0,0(t8)
bfc033a4:	27390001 	addiu	t9,t9,1
bfc033a8:	01d00018 	mult	t6,s0
bfc033ac:	27180002 	addiu	t8,t8,2
bfc033b0:	01525021 	addu	t2,t2,s2
bfc033b4:	00004012 	mflo	t0
bfc033b8:	03e8f821 	addu	ra,ra,t0
bfc033bc:	854f0000 	lh	t7,0(t2)
bfc033c0:	870d0000 	lh	t5,0(t8)
bfc033c4:	27390001 	addiu	t9,t9,1
bfc033c8:	01ed0018 	mult	t7,t5
bfc033cc:	27180002 	addiu	t8,t8,2
bfc033d0:	01525021 	addu	t2,t2,s2
bfc033d4:	00008812 	mflo	s1
bfc033d8:	03f1f821 	addu	ra,ra,s1
bfc033dc:	854b0000 	lh	t3,0(t2)
bfc033e0:	87090000 	lh	t1,0(t8)
bfc033e4:	27390001 	addiu	t9,t9,1
bfc033e8:	01690018 	mult	t3,t1
bfc033ec:	27180002 	addiu	t8,t8,2
bfc033f0:	01525021 	addu	t2,t2,s2
bfc033f4:	00001812 	mflo	v1
bfc033f8:	03e3f821 	addu	ra,ra,v1
bfc033fc:	854c0000 	lh	t4,0(t2)
bfc03400:	87070000 	lh	a3,0(t8)
bfc03404:	27390001 	addiu	t9,t9,1
bfc03408:	01870018 	mult	t4,a3
bfc0340c:	27180002 	addiu	t8,t8,2
bfc03410:	01525021 	addu	t2,t2,s2
bfc03414:	00002812 	mflo	a1
bfc03418:	03e5f821 	addu	ra,ra,a1
bfc0341c:	85440000 	lh	a0,0(t2)
bfc03420:	87020000 	lh	v0,0(t8)
bfc03424:	27390001 	addiu	t9,t9,1
bfc03428:	00820018 	mult	a0,v0
bfc0342c:	27180002 	addiu	t8,t8,2
bfc03430:	01525021 	addu	t2,t2,s2
bfc03434:	00003012 	mflo	a2
bfc03438:	03e6f821 	addu	ra,ra,a2
bfc0343c:	85500000 	lh	s0,0(t2)
bfc03440:	87110000 	lh	s1,0(t8)
bfc03444:	27390001 	addiu	t9,t9,1
bfc03448:	02110018 	mult	s0,s1
bfc0344c:	0334402b 	sltu	t0,t9,s4
bfc03450:	27180002 	addiu	t8,t8,2
bfc03454:	01525021 	addu	t2,t2,s2
bfc03458:	00007012 	mflo	t6
bfc0345c:	1100003c 	beqz	t0,bfc03550 <matrix_test+0xdc0>
bfc03460:	03eef821 	addu	ra,ra,t6
bfc03464:	854f0000 	lh	t7,0(t2)
bfc03468:	87080000 	lh	t0,0(t8)
bfc0346c:	01523821 	addu	a3,t2,s2
bfc03470:	01e80018 	mult	t7,t0
bfc03474:	870d0002 	lh	t5,2(t8)
bfc03478:	84ec0000 	lh	t4,0(a3)
bfc0347c:	00f27021 	addu	t6,a3,s2
bfc03480:	87110004 	lh	s1,4(t8)
bfc03484:	85c90000 	lh	t1,0(t6)
bfc03488:	01d23021 	addu	a2,t6,s2
bfc0348c:	87100006 	lh	s0,6(t8)
bfc03490:	84c80000 	lh	t0,0(a2)
bfc03494:	00d22021 	addu	a0,a2,s2
bfc03498:	870f0008 	lh	t7,8(t8)
bfc0349c:	84870000 	lh	a3,0(a0)
bfc034a0:	00922821 	addu	a1,a0,s2
bfc034a4:	00001012 	mflo	v0
bfc034a8:	870e000a 	lh	t6,10(t8)
bfc034ac:	03e21021 	addu	v0,ra,v0
bfc034b0:	84a60000 	lh	a2,0(a1)
bfc034b4:	018d0018 	mult	t4,t5
bfc034b8:	00b21821 	addu	v1,a1,s2
bfc034bc:	870c000c 	lh	t4,12(t8)
bfc034c0:	84640000 	lh	a0,0(v1)
bfc034c4:	00725021 	addu	t2,v1,s2
bfc034c8:	85430000 	lh	v1,0(t2)
bfc034cc:	870d000e 	lh	t5,14(t8)
bfc034d0:	27390008 	addiu	t9,t9,8
bfc034d4:	0334282b 	sltu	a1,t9,s4
bfc034d8:	27180010 	addiu	t8,t8,16
bfc034dc:	01525021 	addu	t2,t2,s2
bfc034e0:	00005812 	mflo	t3
	...
bfc034ec:	01310018 	mult	t1,s1
bfc034f0:	004b8821 	addu	s1,v0,t3
bfc034f4:	00004812 	mflo	t1
bfc034f8:	02295821 	addu	t3,s1,t1
bfc034fc:	00000000 	nop
bfc03500:	01100018 	mult	t0,s0
bfc03504:	0000f812 	mflo	ra
bfc03508:	017f4821 	addu	t1,t3,ra
bfc0350c:	00000000 	nop
bfc03510:	00ef0018 	mult	a3,t7
bfc03514:	00003812 	mflo	a3
bfc03518:	01271021 	addu	v0,t1,a3
bfc0351c:	00000000 	nop
bfc03520:	00ce0018 	mult	a2,t6
bfc03524:	00008012 	mflo	s0
bfc03528:	00507821 	addu	t7,v0,s0
bfc0352c:	00000000 	nop
bfc03530:	008c0018 	mult	a0,t4
bfc03534:	00007012 	mflo	t6
bfc03538:	01ee8821 	addu	s1,t7,t6
bfc0353c:	00000000 	nop
bfc03540:	006d0018 	mult	v1,t5
bfc03544:	00001812 	mflo	v1
bfc03548:	14a0ffc6 	bnez	a1,bfc03464 <matrix_test+0xcd4>
bfc0354c:	0223f821 	addu	ra,s1,v1
bfc03550:	26b50001 	addiu	s5,s5,1
bfc03554:	02b4c02b 	sltu	t8,s5,s4
bfc03558:	aedf0000 	sw	ra,0(s6)
bfc0355c:	26730002 	addiu	s3,s3,2
bfc03560:	1700ff6d 	bnez	t8,bfc03318 <matrix_test+0xb88>
bfc03564:	26d60004 	addiu	s6,s6,4
bfc03568:	8fb00024 	lw	s0,36(sp)
bfc0356c:	8fb30010 	lw	s3,16(sp)
bfc03570:	8fb9001c 	lw	t9,28(sp)
bfc03574:	261f0001 	addiu	ra,s0,1
bfc03578:	0279b021 	addu	s6,s3,t9
bfc0357c:	03f4a82b 	sltu	s5,ra,s4
bfc03580:	afbf0024 	sw	ra,36(sp)
bfc03584:	02f2b821 	addu	s7,s7,s2
bfc03588:	16a0ff60 	bnez	s5,bfc0330c <matrix_test+0xb7c>
bfc0358c:	afb60010 	sw	s6,16(sp)
bfc03590:	8fab0028 	lw	t3,40(sp)
bfc03594:	00003021 	move	a2,zero
bfc03598:	00001821 	move	v1,zero
bfc0359c:	00002021 	move	a0,zero
bfc035a0:	00006021 	move	t4,zero
bfc035a4:	2687ffff 	addiu	a3,s4,-1
bfc035a8:	30ea0003 	andi	t2,a3,0x3
bfc035ac:	01604021 	move	t0,t3
bfc035b0:	1140003f 	beqz	t2,bfc036b0 <matrix_test+0xf20>
bfc035b4:	00004821 	move	t1,zero
bfc035b8:	8d670000 	lw	a3,0(t3)
bfc035bc:	3090ffff 	andi	s0,a0,0xffff
bfc035c0:	0067982a 	slt	s3,v1,a3
bfc035c4:	00c73021 	addu	a2,a2,a3
bfc035c8:	0213a821 	addu	s5,s0,s3
bfc035cc:	2616000a 	addiu	s6,s0,10
bfc035d0:	00167400 	sll	t6,s6,0x10
bfc035d4:	0015bc00 	sll	s7,s5,0x10
bfc035d8:	03c6282a 	slt	a1,s8,a2
bfc035dc:	000e1403 	sra	v0,t6,0x10
bfc035e0:	10a00002 	beqz	a1,bfc035ec <matrix_test+0xe5c>
bfc035e4:	00172403 	sra	a0,s7,0x10
bfc035e8:	00402021 	move	a0,v0
bfc035ec:	10a00002 	beqz	a1,bfc035f8 <matrix_test+0xe68>
bfc035f0:	24090001 	li	t1,1
bfc035f4:	00003021 	move	a2,zero
bfc035f8:	0134c82b 	sltu	t9,t1,s4
bfc035fc:	13200078 	beqz	t9,bfc037e0 <matrix_test+0x1050>
bfc03600:	25680004 	addiu	t0,t3,4
bfc03604:	1149002a 	beq	t2,t1,bfc036b0 <matrix_test+0xf20>
bfc03608:	00e01821 	move	v1,a3
bfc0360c:	24110002 	li	s1,2
bfc03610:	11510014 	beq	t2,s1,bfc03664 <matrix_test+0xed4>
bfc03614:	309fffff 	andi	ra,a0,0xffff
bfc03618:	8d050000 	lw	a1,0(t0)
bfc0361c:	00000000 	nop
bfc03620:	00c55021 	addu	t2,a2,a1
bfc03624:	00e5302a 	slt	a2,a3,a1
bfc03628:	03e67821 	addu	t7,ra,a2
bfc0362c:	27e7000a 	addiu	a3,ra,10
bfc03630:	00076c00 	sll	t5,a3,0x10
bfc03634:	000fc400 	sll	t8,t7,0x10
bfc03638:	03ca302a 	slt	a2,s8,t2
bfc0363c:	000d1403 	sra	v0,t5,0x10
bfc03640:	10c00002 	beqz	a2,bfc0364c <matrix_test+0xebc>
bfc03644:	00182403 	sra	a0,t8,0x10
bfc03648:	00402021 	move	a0,v0
bfc0364c:	14c00002 	bnez	a2,bfc03658 <matrix_test+0xec8>
bfc03650:	00003021 	move	a2,zero
bfc03654:	01403021 	move	a2,t2
bfc03658:	25290001 	addiu	t1,t1,1
bfc0365c:	25080004 	addiu	t0,t0,4
bfc03660:	00a01821 	move	v1,a1
bfc03664:	8d050000 	lw	a1,0(t0)
bfc03668:	3097ffff 	andi	s7,a0,0xffff
bfc0366c:	0065a82a 	slt	s5,v1,a1
bfc03670:	26e2000a 	addiu	v0,s7,10
bfc03674:	00c53821 	addu	a3,a2,a1
bfc03678:	02f51821 	addu	v1,s7,s5
bfc0367c:	00022400 	sll	a0,v0,0x10
bfc03680:	00035400 	sll	t2,v1,0x10
bfc03684:	03c7302a 	slt	a2,s8,a3
bfc03688:	00041403 	sra	v0,a0,0x10
bfc0368c:	10c00002 	beqz	a2,bfc03698 <matrix_test+0xf08>
bfc03690:	000a2403 	sra	a0,t2,0x10
bfc03694:	00402021 	move	a0,v0
bfc03698:	14c00002 	bnez	a2,bfc036a4 <matrix_test+0xf14>
bfc0369c:	00003021 	move	a2,zero
bfc036a0:	00e03021 	move	a2,a3
bfc036a4:	25290001 	addiu	t1,t1,1
bfc036a8:	25080004 	addiu	t0,t0,4
bfc036ac:	00a01821 	move	v1,a1
bfc036b0:	8d070000 	lw	a3,0(t0)
bfc036b4:	3085ffff 	andi	a1,a0,0xffff
bfc036b8:	0067a82a 	slt	s5,v1,a3
bfc036bc:	00b52021 	addu	a0,a1,s5
bfc036c0:	24b8000a 	addiu	t8,a1,10
bfc036c4:	00c73021 	addu	a2,a2,a3
bfc036c8:	00187c00 	sll	t7,t8,0x10
bfc036cc:	00045400 	sll	t2,a0,0x10
bfc036d0:	03c6282a 	slt	a1,s8,a2
bfc036d4:	000f1403 	sra	v0,t7,0x10
bfc036d8:	10a00002 	beqz	a1,bfc036e4 <matrix_test+0xf54>
bfc036dc:	000a2403 	sra	a0,t2,0x10
bfc036e0:	00402021 	move	a0,v0
bfc036e4:	10a00002 	beqz	a1,bfc036f0 <matrix_test+0xf60>
bfc036e8:	00000000 	nop
bfc036ec:	00003021 	move	a2,zero
bfc036f0:	25290001 	addiu	t1,t1,1
bfc036f4:	0134b02b 	sltu	s6,t1,s4
bfc036f8:	12c00039 	beqz	s6,bfc037e0 <matrix_test+0x1050>
bfc036fc:	250a0004 	addiu	t2,t0,4
bfc03700:	8d050004 	lw	a1,4(t0)
bfc03704:	308effff 	andi	t6,a0,0xffff
bfc03708:	00e5182a 	slt	v1,a3,a1
bfc0370c:	25c2000a 	addiu	v0,t6,10
bfc03710:	00c54021 	addu	t0,a2,a1
bfc03714:	01c38821 	addu	s1,t6,v1
bfc03718:	00026c00 	sll	t5,v0,0x10
bfc0371c:	0011bc00 	sll	s7,s1,0x10
bfc03720:	03c8302a 	slt	a2,s8,t0
bfc03724:	000d2403 	sra	a0,t5,0x10
bfc03728:	10c00002 	beqz	a2,bfc03734 <matrix_test+0xfa4>
bfc0372c:	00171403 	sra	v0,s7,0x10
bfc03730:	00801021 	move	v0,a0
bfc03734:	14c00002 	bnez	a2,bfc03740 <matrix_test+0xfb0>
bfc03738:	00003821 	move	a3,zero
bfc0373c:	01003821 	move	a3,t0
bfc03740:	8d460004 	lw	a2,4(t2)
bfc03744:	3053ffff 	andi	s3,v0,0xffff
bfc03748:	00a6c82a 	slt	t9,a1,a2
bfc0374c:	00e63821 	addu	a3,a3,a2
bfc03750:	02797021 	addu	t6,s3,t9
bfc03754:	2670000a 	addiu	s0,s3,10
bfc03758:	0010b400 	sll	s6,s0,0x10
bfc0375c:	000e4400 	sll	t0,t6,0x10
bfc03760:	03c7282a 	slt	a1,s8,a3
bfc03764:	00162403 	sra	a0,s6,0x10
bfc03768:	10a00002 	beqz	a1,bfc03774 <matrix_test+0xfe4>
bfc0376c:	00081403 	sra	v0,t0,0x10
bfc03770:	00801021 	move	v0,a0
bfc03774:	10a00002 	beqz	a1,bfc03780 <matrix_test+0xff0>
bfc03778:	00000000 	nop
bfc0377c:	00003821 	move	a3,zero
bfc03780:	8d450008 	lw	a1,8(t2)
bfc03784:	305fffff 	andi	ra,v0,0xffff
bfc03788:	00c5182a 	slt	v1,a2,a1
bfc0378c:	00e53821 	addu	a3,a3,a1
bfc03790:	03e3c021 	addu	t8,ra,v1
bfc03794:	27ed000a 	addiu	t5,ra,10
bfc03798:	000d7c00 	sll	t7,t5,0x10
bfc0379c:	00188c00 	sll	s1,t8,0x10
bfc037a0:	03c7302a 	slt	a2,s8,a3
bfc037a4:	000f1403 	sra	v0,t7,0x10
bfc037a8:	10c00002 	beqz	a2,bfc037b4 <matrix_test+0x1024>
bfc037ac:	00112403 	sra	a0,s1,0x10
bfc037b0:	00402021 	move	a0,v0
bfc037b4:	14c00006 	bnez	a2,bfc037d0 <matrix_test+0x1040>
bfc037b8:	00000000 	nop
bfc037bc:	00e03021 	move	a2,a3
bfc037c0:	25290003 	addiu	t1,t1,3
bfc037c4:	2548000c 	addiu	t0,t2,12
bfc037c8:	0bf00dac 	j	bfc036b0 <matrix_test+0xf20>
bfc037cc:	00a01821 	move	v1,a1
bfc037d0:	0bf00df0 	j	bfc037c0 <matrix_test+0x1030>
bfc037d4:	00003021 	move	a2,zero
	...
bfc037e0:	258c0001 	addiu	t4,t4,1
bfc037e4:	8fa8001c 	lw	t0,28(sp)
bfc037e8:	0194482b 	sltu	t1,t4,s4
bfc037ec:	11200003 	beqz	t1,bfc037fc <matrix_test+0x106c>
bfc037f0:	01685821 	addu	t3,t3,t0
bfc037f4:	0bf00d69 	j	bfc035a4 <matrix_test+0xe14>
bfc037f8:	00e01821 	move	v1,a3
bfc037fc:	8fa50018 	lw	a1,24(sp)
bfc03800:	0ff0179c 	jal	bfc05e70 <crc16>
bfc03804:	0000b021 	move	s6,zero
bfc03808:	8fb8002c 	lw	t8,44(sp)
bfc0380c:	8fb50028 	lw	s5,40(sp)
bfc03810:	0040b821 	move	s7,v0
bfc03814:	8fb10030 	lw	s1,48(sp)
bfc03818:	02a09821 	move	s3,s5
bfc0381c:	0000c821 	move	t9,zero
bfc03820:	862e0000 	lh	t6,0(s1)
bfc03824:	87030000 	lh	v1,0(t8)
bfc03828:	240f0001 	li	t7,1
bfc0382c:	01c30018 	mult	t6,v1
bfc03830:	268dffff 	addiu	t5,s4,-1
bfc03834:	01f4582b 	sltu	t3,t7,s4
bfc03838:	31a40003 	andi	a0,t5,0x3
bfc0383c:	02327021 	addu	t6,s1,s2
bfc03840:	00001012 	mflo	v0
bfc03844:	00028143 	sra	s0,v0,0x5
bfc03848:	0002f883 	sra	ra,v0,0x2
bfc0384c:	320c007f 	andi	t4,s0,0x7f
bfc03850:	33e6000f 	andi	a2,ra,0xf
bfc03854:	01860018 	mult	t4,a2
bfc03858:	00008012 	mflo	s0
bfc0385c:	1160006a 	beqz	t3,bfc03a08 <matrix_test+0x1278>
bfc03860:	270d0002 	addiu	t5,t8,2
bfc03864:	10800031 	beqz	a0,bfc0392c <matrix_test+0x119c>
bfc03868:	00000000 	nop
bfc0386c:	108f001f 	beq	a0,t7,bfc038ec <matrix_test+0x115c>
bfc03870:	240b0002 	li	t3,2
bfc03874:	108b000f 	beq	a0,t3,bfc038b4 <matrix_test+0x1124>
bfc03878:	00000000 	nop
bfc0387c:	85af0000 	lh	t7,0(t5)
bfc03880:	85cd0000 	lh	t5,0(t6)
bfc03884:	01d27021 	addu	t6,t6,s2
bfc03888:	01af0018 	mult	t5,t7
bfc0388c:	240f0002 	li	t7,2
bfc03890:	270d0004 	addiu	t5,t8,4
bfc03894:	00004012 	mflo	t0
bfc03898:	00085083 	sra	t2,t0,0x2
bfc0389c:	00083143 	sra	a2,t0,0x5
bfc038a0:	30c7007f 	andi	a3,a2,0x7f
bfc038a4:	3145000f 	andi	a1,t2,0xf
bfc038a8:	00e50018 	mult	a3,a1
bfc038ac:	00004812 	mflo	t1
bfc038b0:	02098021 	addu	s0,s0,t1
bfc038b4:	85c90000 	lh	t1,0(t6)
bfc038b8:	85a50000 	lh	a1,0(t5)
bfc038bc:	25ef0001 	addiu	t7,t7,1
bfc038c0:	01250018 	mult	t1,a1
bfc038c4:	25ad0002 	addiu	t5,t5,2
bfc038c8:	01d27021 	addu	t6,t6,s2
bfc038cc:	00005812 	mflo	t3
bfc038d0:	000b2083 	sra	a0,t3,0x2
bfc038d4:	000b1143 	sra	v0,t3,0x5
bfc038d8:	305f007f 	andi	ra,v0,0x7f
bfc038dc:	3083000f 	andi	v1,a0,0xf
bfc038e0:	03e30018 	mult	ra,v1
bfc038e4:	00006012 	mflo	t4
bfc038e8:	020c8021 	addu	s0,s0,t4
bfc038ec:	85c40000 	lh	a0,0(t6)
bfc038f0:	85a20000 	lh	v0,0(t5)
bfc038f4:	25ef0001 	addiu	t7,t7,1
bfc038f8:	00820018 	mult	a0,v0
bfc038fc:	01f4382b 	sltu	a3,t7,s4
bfc03900:	25ad0002 	addiu	t5,t5,2
bfc03904:	01d27021 	addu	t6,t6,s2
bfc03908:	00001812 	mflo	v1
bfc0390c:	00036083 	sra	t4,v1,0x2
bfc03910:	0003f943 	sra	ra,v1,0x5
bfc03914:	33e6007f 	andi	a2,ra,0x7f
bfc03918:	3188000f 	andi	t0,t4,0xf
bfc0391c:	00c80018 	mult	a2,t0
bfc03920:	00005012 	mflo	t2
bfc03924:	10e00038 	beqz	a3,bfc03a08 <matrix_test+0x1278>
bfc03928:	020a8021 	addu	s0,s0,t2
bfc0392c:	85c60000 	lh	a2,0(t6)
bfc03930:	85a30000 	lh	v1,0(t5)
bfc03934:	01d26021 	addu	t4,t6,s2
bfc03938:	00c30018 	mult	a2,v1
bfc0393c:	85a90002 	lh	t1,2(t5)
bfc03940:	85850000 	lh	a1,0(t4)
bfc03944:	01927021 	addu	t6,t4,s2
bfc03948:	85aa0004 	lh	t2,4(t5)
bfc0394c:	85c40000 	lh	a0,0(t6)
bfc03950:	01d23821 	addu	a3,t6,s2
bfc03954:	85a30006 	lh	v1,6(t5)
bfc03958:	84e60000 	lh	a2,0(a3)
bfc0395c:	00f27021 	addu	t6,a3,s2
bfc03960:	25ef0004 	addiu	t7,t7,4
bfc03964:	01f4602b 	sltu	t4,t7,s4
bfc03968:	25ad0008 	addiu	t5,t5,8
bfc0396c:	0000f812 	mflo	ra
bfc03970:	001f4083 	sra	t0,ra,0x2
bfc03974:	001f1143 	sra	v0,ra,0x5
bfc03978:	00a90018 	mult	a1,t1
bfc0397c:	305f007f 	andi	ra,v0,0x7f
bfc03980:	3108000f 	andi	t0,t0,0xf
bfc03984:	00005812 	mflo	t3
bfc03988:	000b4883 	sra	t1,t3,0x2
bfc0398c:	000b2943 	sra	a1,t3,0x5
bfc03990:	008a0018 	mult	a0,t2
bfc03994:	30a5007f 	andi	a1,a1,0x7f
bfc03998:	3129000f 	andi	t1,t1,0xf
bfc0399c:	00003812 	mflo	a3
bfc039a0:	00075083 	sra	t2,a3,0x2
bfc039a4:	00072143 	sra	a0,a3,0x5
bfc039a8:	00c30018 	mult	a2,v1
bfc039ac:	3084007f 	andi	a0,a0,0x7f
bfc039b0:	3147000f 	andi	a3,t2,0xf
bfc039b4:	00005812 	mflo	t3
bfc039b8:	000b1943 	sra	v1,t3,0x5
bfc039bc:	000b3083 	sra	a2,t3,0x2
bfc039c0:	03e80018 	mult	ra,t0
bfc039c4:	30cb000f 	andi	t3,a2,0xf
bfc039c8:	3068007f 	andi	t0,v1,0x7f
bfc039cc:	00001012 	mflo	v0
bfc039d0:	0202f821 	addu	ra,s0,v0
bfc039d4:	00000000 	nop
bfc039d8:	00a90018 	mult	a1,t1
bfc039dc:	00005012 	mflo	t2
bfc039e0:	03ea4821 	addu	t1,ra,t2
bfc039e4:	00000000 	nop
bfc039e8:	00870018 	mult	a0,a3
bfc039ec:	00002012 	mflo	a0
bfc039f0:	01245021 	addu	t2,t1,a0
bfc039f4:	00000000 	nop
bfc039f8:	010b0018 	mult	t0,t3
bfc039fc:	00002812 	mflo	a1
bfc03a00:	1580ffca 	bnez	t4,bfc0392c <matrix_test+0x119c>
bfc03a04:	01458021 	addu	s0,t2,a1
bfc03a08:	27390001 	addiu	t9,t9,1
bfc03a0c:	0334782b 	sltu	t7,t9,s4
bfc03a10:	ae700000 	sw	s0,0(s3)
bfc03a14:	26310002 	addiu	s1,s1,2
bfc03a18:	15e0ff81 	bnez	t7,bfc03820 <matrix_test+0x1090>
bfc03a1c:	26730004 	addiu	s3,s3,4
bfc03a20:	26d60001 	addiu	s6,s6,1
bfc03a24:	8fb9001c 	lw	t9,28(sp)
bfc03a28:	02d4982b 	sltu	s3,s6,s4
bfc03a2c:	0312c021 	addu	t8,t8,s2
bfc03a30:	1660ff78 	bnez	s3,bfc03814 <matrix_test+0x1084>
bfc03a34:	02b9a821 	addu	s5,s5,t9
bfc03a38:	00003021 	move	a2,zero
bfc03a3c:	00001821 	move	v1,zero
bfc03a40:	00002021 	move	a0,zero
bfc03a44:	00005821 	move	t3,zero
bfc03a48:	2687ffff 	addiu	a3,s4,-1
bfc03a4c:	30ea0003 	andi	t2,a3,0x3
bfc03a50:	8fa80020 	lw	t0,32(sp)
bfc03a54:	11400040 	beqz	t2,bfc03b58 <matrix_test+0x13c8>
bfc03a58:	00004821 	move	t1,zero
bfc03a5c:	8d070000 	lw	a3,0(t0)
bfc03a60:	3096ffff 	andi	s6,a0,0xffff
bfc03a64:	0067802a 	slt	s0,v1,a3
bfc03a68:	00c73021 	addu	a2,a2,a3
bfc03a6c:	02d07021 	addu	t6,s6,s0
bfc03a70:	26cc000a 	addiu	t4,s6,10
bfc03a74:	000c7c00 	sll	t7,t4,0x10
bfc03a78:	000e6c00 	sll	t5,t6,0x10
bfc03a7c:	03c6282a 	slt	a1,s8,a2
bfc03a80:	000f1403 	sra	v0,t7,0x10
bfc03a84:	10a00002 	beqz	a1,bfc03a90 <matrix_test+0x1300>
bfc03a88:	000d2403 	sra	a0,t5,0x10
bfc03a8c:	00402021 	move	a0,v0
bfc03a90:	10a00002 	beqz	a1,bfc03a9c <matrix_test+0x130c>
bfc03a94:	24090001 	li	t1,1
bfc03a98:	00003021 	move	a2,zero
bfc03a9c:	8fa30020 	lw	v1,32(sp)
bfc03aa0:	0134282b 	sltu	a1,t1,s4
bfc03aa4:	10a0007b 	beqz	a1,bfc03c94 <matrix_test+0x1504>
bfc03aa8:	24680004 	addiu	t0,v1,4
bfc03aac:	1149002a 	beq	t2,t1,bfc03b58 <matrix_test+0x13c8>
bfc03ab0:	00e01821 	move	v1,a3
bfc03ab4:	24020002 	li	v0,2
bfc03ab8:	11420014 	beq	t2,v0,bfc03b0c <matrix_test+0x137c>
bfc03abc:	3091ffff 	andi	s1,a0,0xffff
bfc03ac0:	8d050000 	lw	a1,0(t0)
bfc03ac4:	00000000 	nop
bfc03ac8:	00e5c02a 	slt	t8,a3,a1
bfc03acc:	02382021 	addu	a0,s1,t8
bfc03ad0:	00c55021 	addu	t2,a2,a1
bfc03ad4:	2639000a 	addiu	t9,s1,10
bfc03ad8:	00199c00 	sll	s3,t9,0x10
bfc03adc:	00043c00 	sll	a3,a0,0x10
bfc03ae0:	03ca302a 	slt	a2,s8,t2
bfc03ae4:	00131403 	sra	v0,s3,0x10
bfc03ae8:	10c00002 	beqz	a2,bfc03af4 <matrix_test+0x1364>
bfc03aec:	00072403 	sra	a0,a3,0x10
bfc03af0:	00402021 	move	a0,v0
bfc03af4:	14c00002 	bnez	a2,bfc03b00 <matrix_test+0x1370>
bfc03af8:	00003021 	move	a2,zero
bfc03afc:	01403021 	move	a2,t2
bfc03b00:	25290001 	addiu	t1,t1,1
bfc03b04:	25080004 	addiu	t0,t0,4
bfc03b08:	00a01821 	move	v1,a1
bfc03b0c:	8d050000 	lw	a1,0(t0)
bfc03b10:	308fffff 	andi	t7,a0,0xffff
bfc03b14:	00c53821 	addu	a3,a2,a1
bfc03b18:	0065302a 	slt	a2,v1,a1
bfc03b1c:	01e6a821 	addu	s5,t7,a2
bfc03b20:	25ee000a 	addiu	t6,t7,10
bfc03b24:	000e6c00 	sll	t5,t6,0x10
bfc03b28:	00155400 	sll	t2,s5,0x10
bfc03b2c:	03c7302a 	slt	a2,s8,a3
bfc03b30:	000d1403 	sra	v0,t5,0x10
bfc03b34:	10c00002 	beqz	a2,bfc03b40 <matrix_test+0x13b0>
bfc03b38:	000a2403 	sra	a0,t2,0x10
bfc03b3c:	00402021 	move	a0,v0
bfc03b40:	14c00002 	bnez	a2,bfc03b4c <matrix_test+0x13bc>
bfc03b44:	00003021 	move	a2,zero
bfc03b48:	00e03021 	move	a2,a3
bfc03b4c:	25290001 	addiu	t1,t1,1
bfc03b50:	25080004 	addiu	t0,t0,4
bfc03b54:	00a01821 	move	v1,a1
bfc03b58:	8d070000 	lw	a3,0(t0)
bfc03b5c:	3085ffff 	andi	a1,a0,0xffff
bfc03b60:	0067702a 	slt	t6,v1,a3
bfc03b64:	00ae5021 	addu	t2,a1,t6
bfc03b68:	24bf000a 	addiu	ra,a1,10
bfc03b6c:	00c73021 	addu	a2,a2,a3
bfc03b70:	001f1400 	sll	v0,ra,0x10
bfc03b74:	000a2400 	sll	a0,t2,0x10
bfc03b78:	03c6282a 	slt	a1,s8,a2
bfc03b7c:	00021403 	sra	v0,v0,0x10
bfc03b80:	10a00002 	beqz	a1,bfc03b8c <matrix_test+0x13fc>
bfc03b84:	00042403 	sra	a0,a0,0x10
bfc03b88:	00402021 	move	a0,v0
bfc03b8c:	10a00002 	beqz	a1,bfc03b98 <matrix_test+0x1408>
bfc03b90:	00000000 	nop
bfc03b94:	00003021 	move	a2,zero
bfc03b98:	25290001 	addiu	t1,t1,1
bfc03b9c:	0134602b 	sltu	t4,t1,s4
bfc03ba0:	1180003b 	beqz	t4,bfc03c90 <matrix_test+0x1500>
bfc03ba4:	250a0004 	addiu	t2,t0,4
bfc03ba8:	8d050004 	lw	a1,4(t0)
bfc03bac:	3090ffff 	andi	s0,a0,0xffff
bfc03bb0:	00e5682a 	slt	t5,a3,a1
bfc03bb4:	00c54021 	addu	t0,a2,a1
bfc03bb8:	020dc021 	addu	t8,s0,t5
bfc03bbc:	2616000a 	addiu	s6,s0,10
bfc03bc0:	0016ac00 	sll	s5,s6,0x10
bfc03bc4:	00188c00 	sll	s1,t8,0x10
bfc03bc8:	03c8302a 	slt	a2,s8,t0
bfc03bcc:	00152403 	sra	a0,s5,0x10
bfc03bd0:	10c00002 	beqz	a2,bfc03bdc <matrix_test+0x144c>
bfc03bd4:	00111403 	sra	v0,s1,0x10
bfc03bd8:	00801021 	move	v0,a0
bfc03bdc:	14c00002 	bnez	a2,bfc03be8 <matrix_test+0x1458>
bfc03be0:	00003821 	move	a3,zero
bfc03be4:	01003821 	move	a3,t0
bfc03be8:	8d460004 	lw	a2,4(t2)
bfc03bec:	305fffff 	andi	ra,v0,0xffff
bfc03bf0:	00a6182a 	slt	v1,a1,a2
bfc03bf4:	00e63821 	addu	a3,a3,a2
bfc03bf8:	03e36021 	addu	t4,ra,v1
bfc03bfc:	27f0000a 	addiu	s0,ra,10
bfc03c00:	0010b400 	sll	s6,s0,0x10
bfc03c04:	000c4400 	sll	t0,t4,0x10
bfc03c08:	03c7282a 	slt	a1,s8,a3
bfc03c0c:	00162403 	sra	a0,s6,0x10
bfc03c10:	10a00002 	beqz	a1,bfc03c1c <matrix_test+0x148c>
bfc03c14:	00081403 	sra	v0,t0,0x10
bfc03c18:	00801021 	move	v0,a0
bfc03c1c:	10a00002 	beqz	a1,bfc03c28 <matrix_test+0x1498>
bfc03c20:	00000000 	nop
bfc03c24:	00003821 	move	a3,zero
bfc03c28:	8d450008 	lw	a1,8(t2)
bfc03c2c:	3051ffff 	andi	s1,v0,0xffff
bfc03c30:	00c5c02a 	slt	t8,a2,a1
bfc03c34:	00e53821 	addu	a3,a3,a1
bfc03c38:	02389821 	addu	s3,s1,t8
bfc03c3c:	2639000a 	addiu	t9,s1,10
bfc03c40:	00191400 	sll	v0,t9,0x10
bfc03c44:	00132400 	sll	a0,s3,0x10
bfc03c48:	03c7302a 	slt	a2,s8,a3
bfc03c4c:	00021403 	sra	v0,v0,0x10
bfc03c50:	10c00002 	beqz	a2,bfc03c5c <matrix_test+0x14cc>
bfc03c54:	00042403 	sra	a0,a0,0x10
bfc03c58:	00402021 	move	a0,v0
bfc03c5c:	14c00008 	bnez	a2,bfc03c80 <matrix_test+0x14f0>
bfc03c60:	00000000 	nop
bfc03c64:	00e03021 	move	a2,a3
bfc03c68:	25290003 	addiu	t1,t1,3
bfc03c6c:	2548000c 	addiu	t0,t2,12
bfc03c70:	0bf00ed6 	j	bfc03b58 <matrix_test+0x13c8>
bfc03c74:	00a01821 	move	v1,a1
	...
bfc03c80:	0bf00f1a 	j	bfc03c68 <matrix_test+0x14d8>
bfc03c84:	00003021 	move	a2,zero
	...
bfc03c90:	8fa30020 	lw	v1,32(sp)
bfc03c94:	8faf001c 	lw	t7,28(sp)
bfc03c98:	256b0001 	addiu	t3,t3,1
bfc03c9c:	006f4821 	addu	t1,v1,t7
bfc03ca0:	0174402b 	sltu	t0,t3,s4
bfc03ca4:	11000003 	beqz	t0,bfc03cb4 <matrix_test+0x1524>
bfc03ca8:	afa90020 	sw	t1,32(sp)
bfc03cac:	0bf00e92 	j	bfc03a48 <matrix_test+0x12b8>
bfc03cb0:	00e01821 	move	v1,a3
bfc03cb4:	0ff0179c 	jal	bfc05e70 <crc16>
bfc03cb8:	02e02821 	move	a1,s7
bfc03cbc:	8fb70034 	lw	s7,52(sp)
bfc03cc0:	00407821 	move	t7,v0
bfc03cc4:	0017f023 	negu	s8,s7
bfc03cc8:	33cdffff 	andi	t5,s8,0xffff
bfc03ccc:	00007021 	move	t6,zero
bfc03cd0:	8fb30014 	lw	s3,20(sp)
bfc03cd4:	240c0001 	li	t4,1
bfc03cd8:	96780000 	lhu	t8,0(s3)
bfc03cdc:	2699ffff 	addiu	t9,s4,-1
bfc03ce0:	01b88821 	addu	s1,t5,t8
bfc03ce4:	0194b82b 	sltu	s7,t4,s4
bfc03ce8:	a6710000 	sh	s1,0(s3)
bfc03cec:	33230007 	andi	v1,t9,0x7
bfc03cf0:	12e00051 	beqz	s7,bfc03e38 <matrix_test+0x16a8>
bfc03cf4:	266b0002 	addiu	t3,s3,2
bfc03cf8:	10600033 	beqz	v1,bfc03dc8 <matrix_test+0x1638>
bfc03cfc:	00000000 	nop
bfc03d00:	106c002a 	beq	v1,t4,bfc03dac <matrix_test+0x161c>
bfc03d04:	24060002 	li	a2,2
bfc03d08:	10660023 	beq	v1,a2,bfc03d98 <matrix_test+0x1608>
bfc03d0c:	24150003 	li	s5,3
bfc03d10:	1075001c 	beq	v1,s5,bfc03d84 <matrix_test+0x15f4>
bfc03d14:	24160004 	li	s6,4
bfc03d18:	10760015 	beq	v1,s6,bfc03d70 <matrix_test+0x15e0>
bfc03d1c:	24100005 	li	s0,5
bfc03d20:	1070000e 	beq	v1,s0,bfc03d5c <matrix_test+0x15cc>
bfc03d24:	240a0006 	li	t2,6
bfc03d28:	106a0007 	beq	v1,t2,bfc03d48 <matrix_test+0x15b8>
bfc03d2c:	00000000 	nop
bfc03d30:	95690000 	lhu	t1,0(t3)
bfc03d34:	8fbf0014 	lw	ra,20(sp)
bfc03d38:	01a94021 	addu	t0,t5,t1
bfc03d3c:	a5680000 	sh	t0,0(t3)
bfc03d40:	240c0002 	li	t4,2
bfc03d44:	27eb0004 	addiu	t3,ra,4
bfc03d48:	95650000 	lhu	a1,0(t3)
bfc03d4c:	258c0001 	addiu	t4,t4,1
bfc03d50:	01a53821 	addu	a3,t5,a1
bfc03d54:	a5670000 	sh	a3,0(t3)
bfc03d58:	256b0002 	addiu	t3,t3,2
bfc03d5c:	95630000 	lhu	v1,0(t3)
bfc03d60:	258c0001 	addiu	t4,t4,1
bfc03d64:	01a32021 	addu	a0,t5,v1
bfc03d68:	a5640000 	sh	a0,0(t3)
bfc03d6c:	256b0002 	addiu	t3,t3,2
bfc03d70:	957e0000 	lhu	s8,0(t3)
bfc03d74:	258c0001 	addiu	t4,t4,1
bfc03d78:	01be1021 	addu	v0,t5,s8
bfc03d7c:	a5620000 	sh	v0,0(t3)
bfc03d80:	256b0002 	addiu	t3,t3,2
bfc03d84:	95730000 	lhu	s3,0(t3)
bfc03d88:	258c0001 	addiu	t4,t4,1
bfc03d8c:	01b3b821 	addu	s7,t5,s3
bfc03d90:	a5770000 	sh	s7,0(t3)
bfc03d94:	256b0002 	addiu	t3,t3,2
bfc03d98:	95710000 	lhu	s1,0(t3)
bfc03d9c:	258c0001 	addiu	t4,t4,1
bfc03da0:	01b1c821 	addu	t9,t5,s1
bfc03da4:	a5790000 	sh	t9,0(t3)
bfc03da8:	256b0002 	addiu	t3,t3,2
bfc03dac:	95750000 	lhu	s5,0(t3)
bfc03db0:	258c0001 	addiu	t4,t4,1
bfc03db4:	01b53021 	addu	a2,t5,s5
bfc03db8:	0194c02b 	sltu	t8,t4,s4
bfc03dbc:	a5660000 	sh	a2,0(t3)
bfc03dc0:	1300001d 	beqz	t8,bfc03e38 <matrix_test+0x16a8>
bfc03dc4:	256b0002 	addiu	t3,t3,2
bfc03dc8:	95620000 	lhu	v0,0(t3)
bfc03dcc:	95630002 	lhu	v1,2(t3)
bfc03dd0:	95640004 	lhu	a0,4(t3)
bfc03dd4:	95650006 	lhu	a1,6(t3)
bfc03dd8:	95670008 	lhu	a3,8(t3)
bfc03ddc:	9569000a 	lhu	t1,10(t3)
bfc03de0:	9568000c 	lhu	t0,12(t3)
bfc03de4:	957f000e 	lhu	ra,14(t3)
bfc03de8:	258c0008 	addiu	t4,t4,8
bfc03dec:	01a25021 	addu	t2,t5,v0
bfc03df0:	01a38021 	addu	s0,t5,v1
bfc03df4:	01a4b021 	addu	s6,t5,a0
bfc03df8:	01a5a821 	addu	s5,t5,a1
bfc03dfc:	01a73021 	addu	a2,t5,a3
bfc03e00:	01a9c021 	addu	t8,t5,t1
bfc03e04:	01a88821 	addu	s1,t5,t0
bfc03e08:	01bfc821 	addu	t9,t5,ra
bfc03e0c:	0194982b 	sltu	s3,t4,s4
bfc03e10:	a56a0000 	sh	t2,0(t3)
bfc03e14:	a5700002 	sh	s0,2(t3)
bfc03e18:	a5760004 	sh	s6,4(t3)
bfc03e1c:	a5750006 	sh	s5,6(t3)
bfc03e20:	a5660008 	sh	a2,8(t3)
bfc03e24:	a578000a 	sh	t8,10(t3)
bfc03e28:	a571000c 	sh	s1,12(t3)
bfc03e2c:	a579000e 	sh	t9,14(t3)
bfc03e30:	1660ffe5 	bnez	s3,bfc03dc8 <matrix_test+0x1638>
bfc03e34:	256b0010 	addiu	t3,t3,16
bfc03e38:	8fbe0014 	lw	s8,20(sp)
bfc03e3c:	25ce0001 	addiu	t6,t6,1
bfc03e40:	03d26021 	addu	t4,s8,s2
bfc03e44:	01d4582b 	sltu	t3,t6,s4
bfc03e48:	1560ffa1 	bnez	t3,bfc03cd0 <matrix_test+0x1540>
bfc03e4c:	afac0014 	sw	t4,20(sp)
bfc03e50:	8fbf005c 	lw	ra,92(sp)
bfc03e54:	000f9400 	sll	s2,t7,0x10
bfc03e58:	00121403 	sra	v0,s2,0x10
bfc03e5c:	8fbe0058 	lw	s8,88(sp)
bfc03e60:	8fb70054 	lw	s7,84(sp)
bfc03e64:	8fb60050 	lw	s6,80(sp)
bfc03e68:	8fb5004c 	lw	s5,76(sp)
bfc03e6c:	8fb40048 	lw	s4,72(sp)
bfc03e70:	8fb30044 	lw	s3,68(sp)
bfc03e74:	8fb20040 	lw	s2,64(sp)
bfc03e78:	8fb1003c 	lw	s1,60(sp)
bfc03e7c:	8fb00038 	lw	s0,56(sp)
bfc03e80:	03e00008 	jr	ra
bfc03e84:	27bd0060 	addiu	sp,sp,96
bfc03e88:	0ff0179c 	jal	bfc05e70 <crc16>
bfc03e8c:	00002821 	move	a1,zero
bfc03e90:	00402821 	move	a1,v0
bfc03e94:	0ff0179c 	jal	bfc05e70 <crc16>
bfc03e98:	00002021 	move	a0,zero
bfc03e9c:	00402821 	move	a1,v0
bfc03ea0:	0ff0179c 	jal	bfc05e70 <crc16>
bfc03ea4:	00002021 	move	a0,zero
bfc03ea8:	00402821 	move	a1,v0
bfc03eac:	8fbf005c 	lw	ra,92(sp)
bfc03eb0:	8fbe0058 	lw	s8,88(sp)
bfc03eb4:	8fb70054 	lw	s7,84(sp)
bfc03eb8:	8fb60050 	lw	s6,80(sp)
bfc03ebc:	8fb5004c 	lw	s5,76(sp)
bfc03ec0:	8fb40048 	lw	s4,72(sp)
bfc03ec4:	8fb30044 	lw	s3,68(sp)
bfc03ec8:	8fb20040 	lw	s2,64(sp)
bfc03ecc:	8fb1003c 	lw	s1,60(sp)
bfc03ed0:	8fb00038 	lw	s0,56(sp)
bfc03ed4:	00002021 	move	a0,zero
bfc03ed8:	0bf0179c 	j	bfc05e70 <crc16>
bfc03edc:	27bd0060 	addiu	sp,sp,96

bfc03ee0 <core_bench_matrix>:
core_bench_matrix():
bfc03ee0:	27bdff98 	addiu	sp,sp,-104
bfc03ee4:	8c820008 	lw	v0,8(a0)
bfc03ee8:	8c83000c 	lw	v1,12(a0)
bfc03eec:	afb40050 	sw	s4,80(sp)
bfc03ef0:	00052c00 	sll	a1,a1,0x10
bfc03ef4:	8c940000 	lw	s4,0(a0)
bfc03ef8:	8c840004 	lw	a0,4(a0)
bfc03efc:	00052c03 	sra	a1,a1,0x10
bfc03f00:	30c6ffff 	andi	a2,a2,0xffff
bfc03f04:	afbf0064 	sw	ra,100(sp)
bfc03f08:	afbe0060 	sw	s8,96(sp)
bfc03f0c:	afb7005c 	sw	s7,92(sp)
bfc03f10:	afb60058 	sw	s6,88(sp)
bfc03f14:	afb50054 	sw	s5,84(sp)
bfc03f18:	afb3004c 	sw	s3,76(sp)
bfc03f1c:	afb20048 	sw	s2,72(sp)
bfc03f20:	afb10044 	sw	s1,68(sp)
bfc03f24:	afb00040 	sw	s0,64(sp)
bfc03f28:	afa50034 	sw	a1,52(sp)
bfc03f2c:	afa60038 	sw	a2,56(sp)
bfc03f30:	afa20028 	sw	v0,40(sp)
bfc03f34:	afa30030 	sw	v1,48(sp)
bfc03f38:	128005a8 	beqz	s4,bfc055dc <core_bench_matrix+0x16fc>
bfc03f3c:	afa4002c 	sw	a0,44(sp)
bfc03f40:	30adffff 	andi	t5,a1,0xffff
bfc03f44:	00149040 	sll	s2,s4,0x1
bfc03f48:	afa40010 	sw	a0,16(sp)
bfc03f4c:	00807021 	move	t6,a0
bfc03f50:	00007821 	move	t7,zero
bfc03f54:	95c90000 	lhu	t1,0(t6)
bfc03f58:	240c0001 	li	t4,1
bfc03f5c:	01a95021 	addu	t2,t5,t1
bfc03f60:	2685ffff 	addiu	a1,s4,-1
bfc03f64:	0194302b 	sltu	a2,t4,s4
bfc03f68:	a5ca0000 	sh	t2,0(t6)
bfc03f6c:	30a30007 	andi	v1,a1,0x7
bfc03f70:	10c00050 	beqz	a2,bfc040b4 <core_bench_matrix+0x1d4>
bfc03f74:	25cb0002 	addiu	t3,t6,2
bfc03f78:	10600032 	beqz	v1,bfc04044 <core_bench_matrix+0x164>
bfc03f7c:	00000000 	nop
bfc03f80:	106c0029 	beq	v1,t4,bfc04028 <core_bench_matrix+0x148>
bfc03f84:	24100002 	li	s0,2
bfc03f88:	10700022 	beq	v1,s0,bfc04014 <core_bench_matrix+0x134>
bfc03f8c:	24170003 	li	s7,3
bfc03f90:	1077001b 	beq	v1,s7,bfc04000 <core_bench_matrix+0x120>
bfc03f94:	24080004 	li	t0,4
bfc03f98:	10680014 	beq	v1,t0,bfc03fec <core_bench_matrix+0x10c>
bfc03f9c:	24130005 	li	s3,5
bfc03fa0:	1073000d 	beq	v1,s3,bfc03fd8 <core_bench_matrix+0xf8>
bfc03fa4:	24190006 	li	t9,6
bfc03fa8:	10790006 	beq	v1,t9,bfc03fc4 <core_bench_matrix+0xe4>
bfc03fac:	00000000 	nop
bfc03fb0:	95750000 	lhu	s5,0(t3)
bfc03fb4:	240c0002 	li	t4,2
bfc03fb8:	01b51821 	addu	v1,t5,s5
bfc03fbc:	a5630000 	sh	v1,0(t3)
bfc03fc0:	25cb0004 	addiu	t3,t6,4
bfc03fc4:	95710000 	lhu	s1,0(t3)
bfc03fc8:	258c0001 	addiu	t4,t4,1
bfc03fcc:	01b1b021 	addu	s6,t5,s1
bfc03fd0:	a5760000 	sh	s6,0(t3)
bfc03fd4:	256b0002 	addiu	t3,t3,2
bfc03fd8:	95620000 	lhu	v0,0(t3)
bfc03fdc:	258c0001 	addiu	t4,t4,1
bfc03fe0:	01a2c021 	addu	t8,t5,v0
bfc03fe4:	a5780000 	sh	t8,0(t3)
bfc03fe8:	256b0002 	addiu	t3,t3,2
bfc03fec:	95690000 	lhu	t1,0(t3)
bfc03ff0:	258c0001 	addiu	t4,t4,1
bfc03ff4:	01a9f021 	addu	s8,t5,t1
bfc03ff8:	a57e0000 	sh	s8,0(t3)
bfc03ffc:	256b0002 	addiu	t3,t3,2
bfc04000:	95670000 	lhu	a3,0(t3)
bfc04004:	258c0001 	addiu	t4,t4,1
bfc04008:	01a72821 	addu	a1,t5,a3
bfc0400c:	a5650000 	sh	a1,0(t3)
bfc04010:	256b0002 	addiu	t3,t3,2
bfc04014:	956a0000 	lhu	t2,0(t3)
bfc04018:	258c0001 	addiu	t4,t4,1
bfc0401c:	01aa3021 	addu	a2,t5,t2
bfc04020:	a5660000 	sh	a2,0(t3)
bfc04024:	256b0002 	addiu	t3,t3,2
bfc04028:	95700000 	lhu	s0,0(t3)
bfc0402c:	258c0001 	addiu	t4,t4,1
bfc04030:	01b0f821 	addu	ra,t5,s0
bfc04034:	0194202b 	sltu	a0,t4,s4
bfc04038:	a57f0000 	sh	ra,0(t3)
bfc0403c:	1080001d 	beqz	a0,bfc040b4 <core_bench_matrix+0x1d4>
bfc04040:	256b0002 	addiu	t3,t3,2
bfc04044:	95620000 	lhu	v0,0(t3)
bfc04048:	95630002 	lhu	v1,2(t3)
bfc0404c:	957f0004 	lhu	ra,4(t3)
bfc04050:	957e0006 	lhu	s8,6(t3)
bfc04054:	95790008 	lhu	t9,8(t3)
bfc04058:	9578000a 	lhu	t8,10(t3)
bfc0405c:	9577000c 	lhu	s7,12(t3)
bfc04060:	9576000e 	lhu	s6,14(t3)
bfc04064:	258c0008 	addiu	t4,t4,8
bfc04068:	01a2a821 	addu	s5,t5,v0
bfc0406c:	01a39821 	addu	s3,t5,v1
bfc04070:	01bf2021 	addu	a0,t5,ra
bfc04074:	01be8821 	addu	s1,t5,s8
bfc04078:	01b98021 	addu	s0,t5,t9
bfc0407c:	01b83821 	addu	a3,t5,t8
bfc04080:	01b74021 	addu	t0,t5,s7
bfc04084:	01b64821 	addu	t1,t5,s6
bfc04088:	0194502b 	sltu	t2,t4,s4
bfc0408c:	a5750000 	sh	s5,0(t3)
bfc04090:	a5730002 	sh	s3,2(t3)
bfc04094:	a5640004 	sh	a0,4(t3)
bfc04098:	a5710006 	sh	s1,6(t3)
bfc0409c:	a5700008 	sh	s0,8(t3)
bfc040a0:	a567000a 	sh	a3,10(t3)
bfc040a4:	a568000c 	sh	t0,12(t3)
bfc040a8:	a569000e 	sh	t1,14(t3)
bfc040ac:	1540ffe5 	bnez	t2,bfc04044 <core_bench_matrix+0x164>
bfc040b0:	256b0010 	addiu	t3,t3,16
bfc040b4:	25ef0001 	addiu	t7,t7,1
bfc040b8:	01f4582b 	sltu	t3,t7,s4
bfc040bc:	1560ffa5 	bnez	t3,bfc03f54 <core_bench_matrix+0x74>
bfc040c0:	01d27021 	addu	t6,t6,s2
bfc040c4:	8fac0030 	lw	t4,48(sp)
bfc040c8:	00146880 	sll	t5,s4,0x2
bfc040cc:	8faf002c 	lw	t7,44(sp)
bfc040d0:	afad001c 	sw	t5,28(sp)
bfc040d4:	afac0020 	sw	t4,32(sp)
bfc040d8:	01807021 	move	t6,t4
bfc040dc:	00008021 	move	s0,zero
bfc040e0:	85f10000 	lh	s1,0(t7)
bfc040e4:	8fa40034 	lw	a0,52(sp)
bfc040e8:	240d0001 	li	t5,1
bfc040ec:	00910018 	mult	a0,s1
bfc040f0:	2695ffff 	addiu	s5,s4,-1
bfc040f4:	01b4382b 	sltu	a3,t5,s4
bfc040f8:	32a30007 	andi	v1,s5,0x7
bfc040fc:	25eb0002 	addiu	t3,t7,2
bfc04100:	25cc0004 	addiu	t4,t6,4
bfc04104:	00004012 	mflo	t0
bfc04108:	10e00077 	beqz	a3,bfc042e8 <core_bench_matrix+0x408>
bfc0410c:	adc80000 	sw	t0,0(t6)
bfc04110:	10600047 	beqz	v1,bfc04230 <core_bench_matrix+0x350>
bfc04114:	00000000 	nop
bfc04118:	106d003b 	beq	v1,t5,bfc04208 <core_bench_matrix+0x328>
bfc0411c:	241e0002 	li	s8,2
bfc04120:	107e0031 	beq	v1,s8,bfc041e8 <core_bench_matrix+0x308>
bfc04124:	24090003 	li	t1,3
bfc04128:	10690027 	beq	v1,t1,bfc041c8 <core_bench_matrix+0x2e8>
bfc0412c:	24050004 	li	a1,4
bfc04130:	1065001d 	beq	v1,a1,bfc041a8 <core_bench_matrix+0x2c8>
bfc04134:	24070005 	li	a3,5
bfc04138:	10670013 	beq	v1,a3,bfc04188 <core_bench_matrix+0x2a8>
bfc0413c:	24060006 	li	a2,6
bfc04140:	10660009 	beq	v1,a2,bfc04168 <core_bench_matrix+0x288>
bfc04144:	00000000 	nop
bfc04148:	85640000 	lh	a0,0(t3)
bfc0414c:	8fab0034 	lw	t3,52(sp)
bfc04150:	240d0002 	li	t5,2
bfc04154:	01640018 	mult	t3,a0
bfc04158:	25eb0004 	addiu	t3,t7,4
bfc0415c:	00005012 	mflo	t2
bfc04160:	ad8a0000 	sw	t2,0(t4)
bfc04164:	25cc0008 	addiu	t4,t6,8
bfc04168:	85770000 	lh	s7,0(t3)
bfc0416c:	8fa30034 	lw	v1,52(sp)
bfc04170:	25ad0001 	addiu	t5,t5,1
bfc04174:	00770018 	mult	v1,s7
bfc04178:	256b0002 	addiu	t3,t3,2
bfc0417c:	0000f812 	mflo	ra
bfc04180:	ad9f0000 	sw	ra,0(t4)
bfc04184:	258c0004 	addiu	t4,t4,4
bfc04188:	85730000 	lh	s3,0(t3)
bfc0418c:	8fb90034 	lw	t9,52(sp)
bfc04190:	25ad0001 	addiu	t5,t5,1
bfc04194:	03330018 	mult	t9,s3
bfc04198:	256b0002 	addiu	t3,t3,2
bfc0419c:	00004012 	mflo	t0
bfc041a0:	ad880000 	sw	t0,0(t4)
bfc041a4:	258c0004 	addiu	t4,t4,4
bfc041a8:	85760000 	lh	s6,0(t3)
bfc041ac:	8fb10034 	lw	s1,52(sp)
bfc041b0:	25ad0001 	addiu	t5,t5,1
bfc041b4:	02360018 	mult	s1,s6
bfc041b8:	256b0002 	addiu	t3,t3,2
bfc041bc:	0000a812 	mflo	s5
bfc041c0:	ad950000 	sw	s5,0(t4)
bfc041c4:	258c0004 	addiu	t4,t4,4
bfc041c8:	85620000 	lh	v0,0(t3)
bfc041cc:	8fbe0034 	lw	s8,52(sp)
bfc041d0:	25ad0001 	addiu	t5,t5,1
bfc041d4:	03c20018 	mult	s8,v0
bfc041d8:	256b0002 	addiu	t3,t3,2
bfc041dc:	0000c012 	mflo	t8
bfc041e0:	ad980000 	sw	t8,0(t4)
bfc041e4:	258c0004 	addiu	t4,t4,4
bfc041e8:	85650000 	lh	a1,0(t3)
bfc041ec:	8fa70034 	lw	a3,52(sp)
bfc041f0:	25ad0001 	addiu	t5,t5,1
bfc041f4:	00e50018 	mult	a3,a1
bfc041f8:	256b0002 	addiu	t3,t3,2
bfc041fc:	00004812 	mflo	t1
bfc04200:	ad890000 	sw	t1,0(t4)
bfc04204:	258c0004 	addiu	t4,t4,4
bfc04208:	85640000 	lh	a0,0(t3)
bfc0420c:	8fbf0034 	lw	ra,52(sp)
bfc04210:	25ad0001 	addiu	t5,t5,1
bfc04214:	03e40018 	mult	ra,a0
bfc04218:	01b4302b 	sltu	a2,t5,s4
bfc0421c:	256b0002 	addiu	t3,t3,2
bfc04220:	00005012 	mflo	t2
bfc04224:	ad8a0000 	sw	t2,0(t4)
bfc04228:	10c0002f 	beqz	a2,bfc042e8 <core_bench_matrix+0x408>
bfc0422c:	258c0004 	addiu	t4,t4,4
bfc04230:	85730000 	lh	s3,0(t3)
bfc04234:	8fa50034 	lw	a1,52(sp)
bfc04238:	8fb10034 	lw	s1,52(sp)
bfc0423c:	00b30018 	mult	a1,s3
bfc04240:	85690002 	lh	t1,2(t3)
bfc04244:	856a0004 	lh	t2,4(t3)
bfc04248:	85660006 	lh	a2,6(t3)
bfc0424c:	857e0008 	lh	s8,8(t3)
bfc04250:	8578000a 	lh	t8,10(t3)
bfc04254:	8576000c 	lh	s6,12(t3)
bfc04258:	8575000e 	lh	s5,14(t3)
bfc0425c:	25ad0008 	addiu	t5,t5,8
bfc04260:	01b4982b 	sltu	s3,t5,s4
bfc04264:	256b0010 	addiu	t3,t3,16
bfc04268:	00001012 	mflo	v0
bfc0426c:	ad820000 	sw	v0,0(t4)
bfc04270:	00000000 	nop
bfc04274:	02290018 	mult	s1,t1
bfc04278:	00001812 	mflo	v1
bfc0427c:	ad830004 	sw	v1,4(t4)
bfc04280:	00000000 	nop
bfc04284:	022a0018 	mult	s1,t2
bfc04288:	0000f812 	mflo	ra
bfc0428c:	ad9f0008 	sw	ra,8(t4)
bfc04290:	00000000 	nop
bfc04294:	02260018 	mult	s1,a2
bfc04298:	0000c812 	mflo	t9
bfc0429c:	ad99000c 	sw	t9,12(t4)
bfc042a0:	00000000 	nop
bfc042a4:	023e0018 	mult	s1,s8
bfc042a8:	0000b812 	mflo	s7
bfc042ac:	ad970010 	sw	s7,16(t4)
bfc042b0:	00000000 	nop
bfc042b4:	02380018 	mult	s1,t8
bfc042b8:	00002012 	mflo	a0
bfc042bc:	ad840014 	sw	a0,20(t4)
bfc042c0:	00000000 	nop
bfc042c4:	02360018 	mult	s1,s6
bfc042c8:	00004012 	mflo	t0
bfc042cc:	ad880018 	sw	t0,24(t4)
bfc042d0:	00000000 	nop
bfc042d4:	02350018 	mult	s1,s5
bfc042d8:	00003812 	mflo	a3
bfc042dc:	ad87001c 	sw	a3,28(t4)
bfc042e0:	1660ffd3 	bnez	s3,bfc04230 <core_bench_matrix+0x350>
bfc042e4:	258c0020 	addiu	t4,t4,32
bfc042e8:	26100001 	addiu	s0,s0,1
bfc042ec:	8fac001c 	lw	t4,28(sp)
bfc042f0:	0214582b 	sltu	t3,s0,s4
bfc042f4:	01cc7021 	addu	t6,t6,t4
bfc042f8:	1560ff79 	bnez	t3,bfc040e0 <core_bench_matrix+0x200>
bfc042fc:	01f27821 	addu	t7,t7,s2
bfc04300:	8faf0034 	lw	t7,52(sp)
bfc04304:	240ef000 	li	t6,-4096
bfc04308:	8fab0030 	lw	t3,48(sp)
bfc0430c:	01eef025 	or	s8,t7,t6
bfc04310:	00003021 	move	a2,zero
bfc04314:	00001821 	move	v1,zero
bfc04318:	00002021 	move	a0,zero
bfc0431c:	00006021 	move	t4,zero
bfc04320:	2687ffff 	addiu	a3,s4,-1
bfc04324:	30ea0003 	andi	t2,a3,0x3
bfc04328:	01604021 	move	t0,t3
bfc0432c:	1140003f 	beqz	t2,bfc0442c <core_bench_matrix+0x54c>
bfc04330:	00004821 	move	t1,zero
bfc04334:	8d670000 	lw	a3,0(t3)
bfc04338:	3095ffff 	andi	s5,a0,0xffff
bfc0433c:	0067b02a 	slt	s6,v1,a3
bfc04340:	00c73021 	addu	a2,a2,a3
bfc04344:	02b6b821 	addu	s7,s5,s6
bfc04348:	26b9000a 	addiu	t9,s5,10
bfc0434c:	00199c00 	sll	s3,t9,0x10
bfc04350:	0017fc00 	sll	ra,s7,0x10
bfc04354:	03c6282a 	slt	a1,s8,a2
bfc04358:	00131403 	sra	v0,s3,0x10
bfc0435c:	10a00002 	beqz	a1,bfc04368 <core_bench_matrix+0x488>
bfc04360:	001f2403 	sra	a0,ra,0x10
bfc04364:	00402021 	move	a0,v0
bfc04368:	10a00002 	beqz	a1,bfc04374 <core_bench_matrix+0x494>
bfc0436c:	24090001 	li	t1,1
bfc04370:	00003021 	move	a2,zero
bfc04374:	0134882b 	sltu	s1,t1,s4
bfc04378:	12200079 	beqz	s1,bfc04560 <core_bench_matrix+0x680>
bfc0437c:	25680004 	addiu	t0,t3,4
bfc04380:	1149002a 	beq	t2,t1,bfc0442c <core_bench_matrix+0x54c>
bfc04384:	00e01821 	move	v1,a3
bfc04388:	24180002 	li	t8,2
bfc0438c:	11580014 	beq	t2,t8,bfc043e0 <core_bench_matrix+0x500>
bfc04390:	308fffff 	andi	t7,a0,0xffff
bfc04394:	8d050000 	lw	a1,0(t0)
bfc04398:	00000000 	nop
bfc0439c:	00c55021 	addu	t2,a2,a1
bfc043a0:	00e5302a 	slt	a2,a3,a1
bfc043a4:	01e68021 	addu	s0,t7,a2
bfc043a8:	25e7000a 	addiu	a3,t7,10
bfc043ac:	00071400 	sll	v0,a3,0x10
bfc043b0:	00107400 	sll	t6,s0,0x10
bfc043b4:	03ca302a 	slt	a2,s8,t2
bfc043b8:	00021403 	sra	v0,v0,0x10
bfc043bc:	10c00002 	beqz	a2,bfc043c8 <core_bench_matrix+0x4e8>
bfc043c0:	000e2403 	sra	a0,t6,0x10
bfc043c4:	00402021 	move	a0,v0
bfc043c8:	14c00002 	bnez	a2,bfc043d4 <core_bench_matrix+0x4f4>
bfc043cc:	00003021 	move	a2,zero
bfc043d0:	01403021 	move	a2,t2
bfc043d4:	25290001 	addiu	t1,t1,1
bfc043d8:	25080004 	addiu	t0,t0,4
bfc043dc:	00a01821 	move	v1,a1
bfc043e0:	8d050000 	lw	a1,0(t0)
bfc043e4:	3097ffff 	andi	s7,a0,0xffff
bfc043e8:	0065182a 	slt	v1,v1,a1
bfc043ec:	00c53821 	addu	a3,a2,a1
bfc043f0:	02e36821 	addu	t5,s7,v1
bfc043f4:	26ff000a 	addiu	ra,s7,10
bfc043f8:	001f2400 	sll	a0,ra,0x10
bfc043fc:	000d5400 	sll	t2,t5,0x10
bfc04400:	03c7302a 	slt	a2,s8,a3
bfc04404:	00041403 	sra	v0,a0,0x10
bfc04408:	10c00002 	beqz	a2,bfc04414 <core_bench_matrix+0x534>
bfc0440c:	000a2403 	sra	a0,t2,0x10
bfc04410:	00402021 	move	a0,v0
bfc04414:	14c00002 	bnez	a2,bfc04420 <core_bench_matrix+0x540>
bfc04418:	00003021 	move	a2,zero
bfc0441c:	00e03021 	move	a2,a3
bfc04420:	25290001 	addiu	t1,t1,1
bfc04424:	25080004 	addiu	t0,t0,4
bfc04428:	00a01821 	move	v1,a1
bfc0442c:	8d070000 	lw	a3,0(t0)
bfc04430:	3093ffff 	andi	s3,a0,0xffff
bfc04434:	0067282a 	slt	a1,v1,a3
bfc04438:	02651821 	addu	v1,s3,a1
bfc0443c:	2662000a 	addiu	v0,s3,10
bfc04440:	00c73021 	addu	a2,a2,a3
bfc04444:	00025400 	sll	t2,v0,0x10
bfc04448:	0003fc00 	sll	ra,v1,0x10
bfc0444c:	03c6282a 	slt	a1,s8,a2
bfc04450:	000a1403 	sra	v0,t2,0x10
bfc04454:	10a00002 	beqz	a1,bfc04460 <core_bench_matrix+0x580>
bfc04458:	001f2403 	sra	a0,ra,0x10
bfc0445c:	00402021 	move	a0,v0
bfc04460:	10a00002 	beqz	a1,bfc0446c <core_bench_matrix+0x58c>
bfc04464:	00000000 	nop
bfc04468:	00003021 	move	a2,zero
bfc0446c:	25290001 	addiu	t1,t1,1
bfc04470:	0134a82b 	sltu	s5,t1,s4
bfc04474:	12a0003a 	beqz	s5,bfc04560 <core_bench_matrix+0x680>
bfc04478:	250a0004 	addiu	t2,t0,4
bfc0447c:	8d050004 	lw	a1,4(t0)
bfc04480:	3098ffff 	andi	t8,a0,0xffff
bfc04484:	00e5c82a 	slt	t9,a3,a1
bfc04488:	00c54021 	addu	t0,a2,a1
bfc0448c:	03196821 	addu	t5,t8,t9
bfc04490:	2717000a 	addiu	s7,t8,10
bfc04494:	0017b400 	sll	s6,s7,0x10
bfc04498:	000d8400 	sll	s0,t5,0x10
bfc0449c:	03c8302a 	slt	a2,s8,t0
bfc044a0:	00162403 	sra	a0,s6,0x10
bfc044a4:	10c00002 	beqz	a2,bfc044b0 <core_bench_matrix+0x5d0>
bfc044a8:	00101403 	sra	v0,s0,0x10
bfc044ac:	00801021 	move	v0,a0
bfc044b0:	14c00002 	bnez	a2,bfc044bc <core_bench_matrix+0x5dc>
bfc044b4:	00003821 	move	a3,zero
bfc044b8:	01003821 	move	a3,t0
bfc044bc:	8d460004 	lw	a2,4(t2)
bfc044c0:	3056ffff 	andi	s6,v0,0xffff
bfc044c4:	00a6882a 	slt	s1,a1,a2
bfc044c8:	00e63821 	addu	a3,a3,a2
bfc044cc:	02d19821 	addu	s3,s6,s1
bfc044d0:	26d5000a 	addiu	s5,s6,10
bfc044d4:	0015cc00 	sll	t9,s5,0x10
bfc044d8:	00134400 	sll	t0,s3,0x10
bfc044dc:	03c7282a 	slt	a1,s8,a3
bfc044e0:	00192403 	sra	a0,t9,0x10
bfc044e4:	10a00002 	beqz	a1,bfc044f0 <core_bench_matrix+0x610>
bfc044e8:	00081403 	sra	v0,t0,0x10
bfc044ec:	00801021 	move	v0,a0
bfc044f0:	10a00002 	beqz	a1,bfc044fc <core_bench_matrix+0x61c>
bfc044f4:	00000000 	nop
bfc044f8:	00003821 	move	a3,zero
bfc044fc:	8d450008 	lw	a1,8(t2)
bfc04500:	304fffff 	andi	t7,v0,0xffff
bfc04504:	00c5682a 	slt	t5,a2,a1
bfc04508:	25e2000a 	addiu	v0,t7,10
bfc0450c:	00e53821 	addu	a3,a3,a1
bfc04510:	01ed7021 	addu	t6,t7,t5
bfc04514:	00028400 	sll	s0,v0,0x10
bfc04518:	000ec400 	sll	t8,t6,0x10
bfc0451c:	03c7302a 	slt	a2,s8,a3
bfc04520:	00101403 	sra	v0,s0,0x10
bfc04524:	10c00002 	beqz	a2,bfc04530 <core_bench_matrix+0x650>
bfc04528:	00182403 	sra	a0,t8,0x10
bfc0452c:	00402021 	move	a0,v0
bfc04530:	14c00007 	bnez	a2,bfc04550 <core_bench_matrix+0x670>
bfc04534:	00000000 	nop
bfc04538:	00e03021 	move	a2,a3
bfc0453c:	25290003 	addiu	t1,t1,3
bfc04540:	2548000c 	addiu	t0,t2,12
bfc04544:	0bf0110b 	j	bfc0442c <core_bench_matrix+0x54c>
bfc04548:	00a01821 	move	v1,a1
bfc0454c:	00000000 	nop
bfc04550:	0bf0114f 	j	bfc0453c <core_bench_matrix+0x65c>
bfc04554:	00003021 	move	a2,zero
	...
bfc04560:	258c0001 	addiu	t4,t4,1
bfc04564:	8fa8001c 	lw	t0,28(sp)
bfc04568:	0194482b 	sltu	t1,t4,s4
bfc0456c:	11200003 	beqz	t1,bfc0457c <core_bench_matrix+0x69c>
bfc04570:	01685821 	addu	t3,t3,t0
bfc04574:	0bf010c8 	j	bfc04320 <core_bench_matrix+0x440>
bfc04578:	00e01821 	move	v1,a3
bfc0457c:	0ff0179c 	jal	bfc05e70 <crc16>
bfc04580:	00002821 	move	a1,zero
bfc04584:	8fb60030 	lw	s6,48(sp)
bfc04588:	8fb5002c 	lw	s5,44(sp)
bfc0458c:	0040f821 	move	ra,v0
bfc04590:	0000b821 	move	s7,zero
bfc04594:	8fae0028 	lw	t6,40(sp)
bfc04598:	86b10000 	lh	s1,0(s5)
bfc0459c:	85c40000 	lh	a0,0(t6)
bfc045a0:	24130001 	li	s3,1
bfc045a4:	00910018 	mult	a0,s1
bfc045a8:	8fab0028 	lw	t3,40(sp)
bfc045ac:	268cffff 	addiu	t4,s4,-1
bfc045b0:	0274302b 	sltu	a2,s3,s4
bfc045b4:	31830007 	andi	v1,t4,0x7
bfc045b8:	26b10002 	addiu	s1,s5,2
bfc045bc:	0000c812 	mflo	t9
bfc045c0:	10c0007d 	beqz	a2,bfc047b8 <core_bench_matrix+0x8d8>
bfc045c4:	25780002 	addiu	t8,t3,2
bfc045c8:	10600048 	beqz	v1,bfc046ec <core_bench_matrix+0x80c>
bfc045cc:	00000000 	nop
bfc045d0:	1073003c 	beq	v1,s3,bfc046c4 <core_bench_matrix+0x7e4>
bfc045d4:	240b0002 	li	t3,2
bfc045d8:	106b0032 	beq	v1,t3,bfc046a4 <core_bench_matrix+0x7c4>
bfc045dc:	24090003 	li	t1,3
bfc045e0:	10690028 	beq	v1,t1,bfc04684 <core_bench_matrix+0x7a4>
bfc045e4:	24050004 	li	a1,4
bfc045e8:	1065001e 	beq	v1,a1,bfc04664 <core_bench_matrix+0x784>
bfc045ec:	240c0005 	li	t4,5
bfc045f0:	106c0014 	beq	v1,t4,bfc04644 <core_bench_matrix+0x764>
bfc045f4:	24070006 	li	a3,6
bfc045f8:	1067000a 	beq	v1,a3,bfc04624 <core_bench_matrix+0x744>
bfc045fc:	00000000 	nop
bfc04600:	8faa0028 	lw	t2,40(sp)
bfc04604:	86280000 	lh	t0,0(s1)
bfc04608:	85580002 	lh	t8,2(t2)
bfc0460c:	24130002 	li	s3,2
bfc04610:	03080018 	mult	t8,t0
bfc04614:	26b10004 	addiu	s1,s5,4
bfc04618:	25580004 	addiu	t8,t2,4
bfc0461c:	00003012 	mflo	a2
bfc04620:	0326c821 	addu	t9,t9,a2
bfc04624:	870d0000 	lh	t5,0(t8)
bfc04628:	86240000 	lh	a0,0(s1)
bfc0462c:	26730001 	addiu	s3,s3,1
bfc04630:	01a40018 	mult	t5,a0
bfc04634:	26310002 	addiu	s1,s1,2
bfc04638:	27180002 	addiu	t8,t8,2
bfc0463c:	00007812 	mflo	t7
bfc04640:	032fc821 	addu	t9,t9,t7
bfc04644:	87020000 	lh	v0,0(t8)
bfc04648:	862e0000 	lh	t6,0(s1)
bfc0464c:	26730001 	addiu	s3,s3,1
bfc04650:	004e0018 	mult	v0,t6
bfc04654:	26310002 	addiu	s1,s1,2
bfc04658:	27180002 	addiu	t8,t8,2
bfc0465c:	00001812 	mflo	v1
bfc04660:	0323c821 	addu	t9,t9,v1
bfc04664:	870b0000 	lh	t3,0(t8)
bfc04668:	86290000 	lh	t1,0(s1)
bfc0466c:	26730001 	addiu	s3,s3,1
bfc04670:	01690018 	mult	t3,t1
bfc04674:	26310002 	addiu	s1,s1,2
bfc04678:	27180002 	addiu	t8,t8,2
bfc0467c:	00008012 	mflo	s0
bfc04680:	0330c821 	addu	t9,t9,s0
bfc04684:	870c0000 	lh	t4,0(t8)
bfc04688:	86270000 	lh	a3,0(s1)
bfc0468c:	26730001 	addiu	s3,s3,1
bfc04690:	01870018 	mult	t4,a3
bfc04694:	26310002 	addiu	s1,s1,2
bfc04698:	27180002 	addiu	t8,t8,2
bfc0469c:	00002812 	mflo	a1
bfc046a0:	0325c821 	addu	t9,t9,a1
bfc046a4:	870a0000 	lh	t2,0(t8)
bfc046a8:	86280000 	lh	t0,0(s1)
bfc046ac:	26730001 	addiu	s3,s3,1
bfc046b0:	01480018 	mult	t2,t0
bfc046b4:	26310002 	addiu	s1,s1,2
bfc046b8:	27180002 	addiu	t8,t8,2
bfc046bc:	00003012 	mflo	a2
bfc046c0:	0326c821 	addu	t9,t9,a2
bfc046c4:	87040000 	lh	a0,0(t8)
bfc046c8:	86230000 	lh	v1,0(s1)
bfc046cc:	26730001 	addiu	s3,s3,1
bfc046d0:	00830018 	mult	a0,v1
bfc046d4:	0274782b 	sltu	t7,s3,s4
bfc046d8:	26310002 	addiu	s1,s1,2
bfc046dc:	27180002 	addiu	t8,t8,2
bfc046e0:	00006812 	mflo	t5
bfc046e4:	11e00034 	beqz	t7,bfc047b8 <core_bench_matrix+0x8d8>
bfc046e8:	032dc821 	addu	t9,t9,t5
bfc046ec:	87080000 	lh	t0,0(t8)
bfc046f0:	86230000 	lh	v1,0(s1)
bfc046f4:	87100002 	lh	s0,2(t8)
bfc046f8:	01030018 	mult	t0,v1
bfc046fc:	862a0002 	lh	t2,2(s1)
bfc04700:	87040004 	lh	a0,4(t8)
bfc04704:	862b0004 	lh	t3,4(s1)
bfc04708:	87050006 	lh	a1,6(t8)
bfc0470c:	862c0006 	lh	t4,6(s1)
bfc04710:	87060008 	lh	a2,8(t8)
bfc04714:	862d0008 	lh	t5,8(s1)
bfc04718:	8707000a 	lh	a3,10(t8)
bfc0471c:	862e000a 	lh	t6,10(s1)
bfc04720:	862f000c 	lh	t7,12(s1)
bfc04724:	8708000c 	lh	t0,12(t8)
bfc04728:	8703000e 	lh	v1,14(t8)
bfc0472c:	00001012 	mflo	v0
bfc04730:	26730008 	addiu	s3,s3,8
bfc04734:	03221021 	addu	v0,t9,v0
bfc04738:	27180010 	addiu	t8,t8,16
bfc0473c:	020a0018 	mult	s0,t2
bfc04740:	8630000e 	lh	s0,14(s1)
bfc04744:	0274502b 	sltu	t2,s3,s4
bfc04748:	26310010 	addiu	s1,s1,16
bfc0474c:	00004812 	mflo	t1
bfc04750:	0049c821 	addu	t9,v0,t1
bfc04754:	00000000 	nop
bfc04758:	008b0018 	mult	a0,t3
bfc0475c:	00002012 	mflo	a0
bfc04760:	03245821 	addu	t3,t9,a0
bfc04764:	00000000 	nop
bfc04768:	00ac0018 	mult	a1,t4
bfc0476c:	00006012 	mflo	t4
bfc04770:	016c4821 	addu	t1,t3,t4
bfc04774:	00000000 	nop
bfc04778:	00cd0018 	mult	a2,t5
bfc0477c:	00003012 	mflo	a2
bfc04780:	01261021 	addu	v0,t1,a2
bfc04784:	00000000 	nop
bfc04788:	00ee0018 	mult	a3,t6
bfc0478c:	00002812 	mflo	a1
bfc04790:	00456821 	addu	t5,v0,a1
bfc04794:	00000000 	nop
bfc04798:	010f0018 	mult	t0,t7
bfc0479c:	0000c812 	mflo	t9
bfc047a0:	01b97821 	addu	t7,t5,t9
bfc047a4:	00000000 	nop
bfc047a8:	00700018 	mult	v1,s0
bfc047ac:	00008012 	mflo	s0
bfc047b0:	1540ffce 	bnez	t2,bfc046ec <core_bench_matrix+0x80c>
bfc047b4:	01f0c821 	addu	t9,t7,s0
bfc047b8:	26f70001 	addiu	s7,s7,1
bfc047bc:	02f4c02b 	sltu	t8,s7,s4
bfc047c0:	aed90000 	sw	t9,0(s6)
bfc047c4:	02b2a821 	addu	s5,s5,s2
bfc047c8:	1700ff72 	bnez	t8,bfc04594 <core_bench_matrix+0x6b4>
bfc047cc:	26d60004 	addiu	s6,s6,4
bfc047d0:	8fab0030 	lw	t3,48(sp)
bfc047d4:	00003021 	move	a2,zero
bfc047d8:	00001821 	move	v1,zero
bfc047dc:	00002021 	move	a0,zero
bfc047e0:	00006021 	move	t4,zero
bfc047e4:	2687ffff 	addiu	a3,s4,-1
bfc047e8:	30ea0003 	andi	t2,a3,0x3
bfc047ec:	01604021 	move	t0,t3
bfc047f0:	1140003f 	beqz	t2,bfc048f0 <core_bench_matrix+0xa10>
bfc047f4:	00004821 	move	t1,zero
bfc047f8:	8d670000 	lw	a3,0(t3)
bfc047fc:	3095ffff 	andi	s5,a0,0xffff
bfc04800:	0067b02a 	slt	s6,v1,a3
bfc04804:	00c73021 	addu	a2,a2,a3
bfc04808:	02b6c021 	addu	t8,s5,s6
bfc0480c:	26b9000a 	addiu	t9,s5,10
bfc04810:	00199c00 	sll	s3,t9,0x10
bfc04814:	0018bc00 	sll	s7,t8,0x10
bfc04818:	03c6282a 	slt	a1,s8,a2
bfc0481c:	00131403 	sra	v0,s3,0x10
bfc04820:	10a00002 	beqz	a1,bfc0482c <core_bench_matrix+0x94c>
bfc04824:	00172403 	sra	a0,s7,0x10
bfc04828:	00402021 	move	a0,v0
bfc0482c:	10a00002 	beqz	a1,bfc04838 <core_bench_matrix+0x958>
bfc04830:	24090001 	li	t1,1
bfc04834:	00003021 	move	a2,zero
bfc04838:	0134782b 	sltu	t7,t1,s4
bfc0483c:	11e00078 	beqz	t7,bfc04a20 <core_bench_matrix+0xb40>
bfc04840:	25680004 	addiu	t0,t3,4
bfc04844:	1149002a 	beq	t2,t1,bfc048f0 <core_bench_matrix+0xa10>
bfc04848:	00e01821 	move	v1,a3
bfc0484c:	240d0002 	li	t5,2
bfc04850:	114d0014 	beq	t2,t5,bfc048a4 <core_bench_matrix+0x9c4>
bfc04854:	308effff 	andi	t6,a0,0xffff
bfc04858:	8d050000 	lw	a1,0(t0)
bfc0485c:	00000000 	nop
bfc04860:	00c55021 	addu	t2,a2,a1
bfc04864:	00e5302a 	slt	a2,a3,a1
bfc04868:	01c61821 	addu	v1,t6,a2
bfc0486c:	25c2000a 	addiu	v0,t6,10
bfc04870:	00022400 	sll	a0,v0,0x10
bfc04874:	00033c00 	sll	a3,v1,0x10
bfc04878:	03ca302a 	slt	a2,s8,t2
bfc0487c:	00041403 	sra	v0,a0,0x10
bfc04880:	10c00002 	beqz	a2,bfc0488c <core_bench_matrix+0x9ac>
bfc04884:	00072403 	sra	a0,a3,0x10
bfc04888:	00402021 	move	a0,v0
bfc0488c:	14c00002 	bnez	a2,bfc04898 <core_bench_matrix+0x9b8>
bfc04890:	00003021 	move	a2,zero
bfc04894:	01403021 	move	a2,t2
bfc04898:	25290001 	addiu	t1,t1,1
bfc0489c:	25080004 	addiu	t0,t0,4
bfc048a0:	00a01821 	move	v1,a1
bfc048a4:	8d050000 	lw	a1,0(t0)
bfc048a8:	3098ffff 	andi	t8,a0,0xffff
bfc048ac:	0065982a 	slt	s3,v1,a1
bfc048b0:	00c53821 	addu	a3,a2,a1
bfc048b4:	03138021 	addu	s0,t8,s3
bfc048b8:	2717000a 	addiu	s7,t8,10
bfc048bc:	00178c00 	sll	s1,s7,0x10
bfc048c0:	00105400 	sll	t2,s0,0x10
bfc048c4:	03c7302a 	slt	a2,s8,a3
bfc048c8:	00111403 	sra	v0,s1,0x10
bfc048cc:	10c00002 	beqz	a2,bfc048d8 <core_bench_matrix+0x9f8>
bfc048d0:	000a2403 	sra	a0,t2,0x10
bfc048d4:	00402021 	move	a0,v0
bfc048d8:	14c00002 	bnez	a2,bfc048e4 <core_bench_matrix+0xa04>
bfc048dc:	00003021 	move	a2,zero
bfc048e0:	00e03021 	move	a2,a3
bfc048e4:	25290001 	addiu	t1,t1,1
bfc048e8:	25080004 	addiu	t0,t0,4
bfc048ec:	00a01821 	move	v1,a1
bfc048f0:	8d070000 	lw	a3,0(t0)
bfc048f4:	3085ffff 	andi	a1,a0,0xffff
bfc048f8:	0067102a 	slt	v0,v1,a3
bfc048fc:	00a26821 	addu	t5,a1,v0
bfc04900:	24a4000a 	addiu	a0,a1,10
bfc04904:	00c73021 	addu	a2,a2,a3
bfc04908:	0004cc00 	sll	t9,a0,0x10
bfc0490c:	000d7400 	sll	t6,t5,0x10
bfc04910:	03c6282a 	slt	a1,s8,a2
bfc04914:	00191403 	sra	v0,t9,0x10
bfc04918:	10a00002 	beqz	a1,bfc04924 <core_bench_matrix+0xa44>
bfc0491c:	000e2403 	sra	a0,t6,0x10
bfc04920:	00402021 	move	a0,v0
bfc04924:	10a00002 	beqz	a1,bfc04930 <core_bench_matrix+0xa50>
bfc04928:	00000000 	nop
bfc0492c:	00003021 	move	a2,zero
bfc04930:	25290001 	addiu	t1,t1,1
bfc04934:	0134802b 	sltu	s0,t1,s4
bfc04938:	12000039 	beqz	s0,bfc04a20 <core_bench_matrix+0xb40>
bfc0493c:	250a0004 	addiu	t2,t0,4
bfc04940:	8d050004 	lw	a1,4(t0)
bfc04944:	3091ffff 	andi	s1,a0,0xffff
bfc04948:	00e5782a 	slt	t7,a3,a1
bfc0494c:	00c54021 	addu	t0,a2,a1
bfc04950:	022fb821 	addu	s7,s1,t7
bfc04954:	2635000a 	addiu	s5,s1,10
bfc04958:	00159c00 	sll	s3,s5,0x10
bfc0495c:	0017b400 	sll	s6,s7,0x10
bfc04960:	03c8302a 	slt	a2,s8,t0
bfc04964:	00132403 	sra	a0,s3,0x10
bfc04968:	10c00002 	beqz	a2,bfc04974 <core_bench_matrix+0xa94>
bfc0496c:	00161403 	sra	v0,s6,0x10
bfc04970:	00801021 	move	v0,a0
bfc04974:	14c00002 	bnez	a2,bfc04980 <core_bench_matrix+0xaa0>
bfc04978:	00003821 	move	a3,zero
bfc0497c:	01003821 	move	a3,t0
bfc04980:	8d460004 	lw	a2,4(t2)
bfc04984:	304fffff 	andi	t7,v0,0xffff
bfc04988:	00a6682a 	slt	t5,a1,a2
bfc0498c:	00e63821 	addu	a3,a3,a2
bfc04990:	01edc821 	addu	t9,t7,t5
bfc04994:	25f6000a 	addiu	s6,t7,10
bfc04998:	0016ac00 	sll	s5,s6,0x10
bfc0499c:	00194400 	sll	t0,t9,0x10
bfc049a0:	03c7282a 	slt	a1,s8,a3
bfc049a4:	00152403 	sra	a0,s5,0x10
bfc049a8:	10a00002 	beqz	a1,bfc049b4 <core_bench_matrix+0xad4>
bfc049ac:	00081403 	sra	v0,t0,0x10
bfc049b0:	00801021 	move	v0,a0
bfc049b4:	10a00002 	beqz	a1,bfc049c0 <core_bench_matrix+0xae0>
bfc049b8:	00000000 	nop
bfc049bc:	00003821 	move	a3,zero
bfc049c0:	8d450008 	lw	a1,8(t2)
bfc049c4:	3050ffff 	andi	s0,v0,0xffff
bfc049c8:	00c5882a 	slt	s1,a2,a1
bfc049cc:	00e53821 	addu	a3,a3,a1
bfc049d0:	02111821 	addu	v1,s0,s1
bfc049d4:	260e000a 	addiu	t6,s0,10
bfc049d8:	000e1400 	sll	v0,t6,0x10
bfc049dc:	00032400 	sll	a0,v1,0x10
bfc049e0:	03c7302a 	slt	a2,s8,a3
bfc049e4:	00021403 	sra	v0,v0,0x10
bfc049e8:	10c00002 	beqz	a2,bfc049f4 <core_bench_matrix+0xb14>
bfc049ec:	00042403 	sra	a0,a0,0x10
bfc049f0:	00402021 	move	a0,v0
bfc049f4:	14c00006 	bnez	a2,bfc04a10 <core_bench_matrix+0xb30>
bfc049f8:	00000000 	nop
bfc049fc:	00e03021 	move	a2,a3
bfc04a00:	25290003 	addiu	t1,t1,3
bfc04a04:	2548000c 	addiu	t0,t2,12
bfc04a08:	0bf0123c 	j	bfc048f0 <core_bench_matrix+0xa10>
bfc04a0c:	00a01821 	move	v1,a1
bfc04a10:	0bf01280 	j	bfc04a00 <core_bench_matrix+0xb20>
bfc04a14:	00003021 	move	a2,zero
	...
bfc04a20:	258c0001 	addiu	t4,t4,1
bfc04a24:	8faa001c 	lw	t2,28(sp)
bfc04a28:	0194482b 	sltu	t1,t4,s4
bfc04a2c:	11200003 	beqz	t1,bfc04a3c <core_bench_matrix+0xb5c>
bfc04a30:	016a5821 	addu	t3,t3,t2
bfc04a34:	0bf011f9 	j	bfc047e4 <core_bench_matrix+0x904>
bfc04a38:	00e01821 	move	v1,a3
bfc04a3c:	03e02821 	move	a1,ra
bfc04a40:	0ff0179c 	jal	bfc05e70 <crc16>
bfc04a44:	00000000 	nop
bfc04a48:	8fa60030 	lw	a2,48(sp)
bfc04a4c:	8fb6002c 	lw	s6,44(sp)
bfc04a50:	afa20018 	sw	v0,24(sp)
bfc04a54:	afa60014 	sw	a2,20(sp)
bfc04a58:	afa00024 	sw	zero,36(sp)
bfc04a5c:	8fb70014 	lw	s7,20(sp)
bfc04a60:	8fb30028 	lw	s3,40(sp)
bfc04a64:	0000a821 	move	s5,zero
bfc04a68:	86df0000 	lh	ra,0(s6)
bfc04a6c:	86680000 	lh	t0,0(s3)
bfc04a70:	24190001 	li	t9,1
bfc04a74:	011f0018 	mult	t0,ra
bfc04a78:	268bffff 	addiu	t3,s4,-1
bfc04a7c:	0334602b 	sltu	t4,t9,s4
bfc04a80:	31630007 	andi	v1,t3,0x7
bfc04a84:	26d80002 	addiu	t8,s6,2
bfc04a88:	0000f812 	mflo	ra
bfc04a8c:	11800084 	beqz	t4,bfc04ca0 <core_bench_matrix+0xdc0>
bfc04a90:	02725021 	addu	t2,s3,s2
bfc04a94:	10600047 	beqz	v1,bfc04bb4 <core_bench_matrix+0xcd4>
bfc04a98:	00000000 	nop
bfc04a9c:	1079003b 	beq	v1,t9,bfc04b8c <core_bench_matrix+0xcac>
bfc04aa0:	240b0002 	li	t3,2
bfc04aa4:	106b0031 	beq	v1,t3,bfc04b6c <core_bench_matrix+0xc8c>
bfc04aa8:	24090003 	li	t1,3
bfc04aac:	10690027 	beq	v1,t1,bfc04b4c <core_bench_matrix+0xc6c>
bfc04ab0:	24050004 	li	a1,4
bfc04ab4:	1065001d 	beq	v1,a1,bfc04b2c <core_bench_matrix+0xc4c>
bfc04ab8:	240c0005 	li	t4,5
bfc04abc:	106c0013 	beq	v1,t4,bfc04b0c <core_bench_matrix+0xc2c>
bfc04ac0:	24070006 	li	a3,6
bfc04ac4:	10670009 	beq	v1,a3,bfc04aec <core_bench_matrix+0xc0c>
bfc04ac8:	00000000 	nop
bfc04acc:	87020000 	lh	v0,0(t8)
bfc04ad0:	85440000 	lh	a0,0(t2)
bfc04ad4:	24190002 	li	t9,2
bfc04ad8:	00820018 	mult	a0,v0
bfc04adc:	01525021 	addu	t2,t2,s2
bfc04ae0:	26d80004 	addiu	t8,s6,4
bfc04ae4:	00003012 	mflo	a2
bfc04ae8:	03e6f821 	addu	ra,ra,a2
bfc04aec:	854e0000 	lh	t6,0(t2)
bfc04af0:	87100000 	lh	s0,0(t8)
bfc04af4:	27390001 	addiu	t9,t9,1
bfc04af8:	01d00018 	mult	t6,s0
bfc04afc:	27180002 	addiu	t8,t8,2
bfc04b00:	01525021 	addu	t2,t2,s2
bfc04b04:	00004012 	mflo	t0
bfc04b08:	03e8f821 	addu	ra,ra,t0
bfc04b0c:	854f0000 	lh	t7,0(t2)
bfc04b10:	870d0000 	lh	t5,0(t8)
bfc04b14:	27390001 	addiu	t9,t9,1
bfc04b18:	01ed0018 	mult	t7,t5
bfc04b1c:	27180002 	addiu	t8,t8,2
bfc04b20:	01525021 	addu	t2,t2,s2
bfc04b24:	00008812 	mflo	s1
bfc04b28:	03f1f821 	addu	ra,ra,s1
bfc04b2c:	854b0000 	lh	t3,0(t2)
bfc04b30:	87090000 	lh	t1,0(t8)
bfc04b34:	27390001 	addiu	t9,t9,1
bfc04b38:	01690018 	mult	t3,t1
bfc04b3c:	27180002 	addiu	t8,t8,2
bfc04b40:	01525021 	addu	t2,t2,s2
bfc04b44:	00001812 	mflo	v1
bfc04b48:	03e3f821 	addu	ra,ra,v1
bfc04b4c:	854c0000 	lh	t4,0(t2)
bfc04b50:	87070000 	lh	a3,0(t8)
bfc04b54:	27390001 	addiu	t9,t9,1
bfc04b58:	01870018 	mult	t4,a3
bfc04b5c:	27180002 	addiu	t8,t8,2
bfc04b60:	01525021 	addu	t2,t2,s2
bfc04b64:	00002812 	mflo	a1
bfc04b68:	03e5f821 	addu	ra,ra,a1
bfc04b6c:	85440000 	lh	a0,0(t2)
bfc04b70:	87020000 	lh	v0,0(t8)
bfc04b74:	27390001 	addiu	t9,t9,1
bfc04b78:	00820018 	mult	a0,v0
bfc04b7c:	27180002 	addiu	t8,t8,2
bfc04b80:	01525021 	addu	t2,t2,s2
bfc04b84:	00003012 	mflo	a2
bfc04b88:	03e6f821 	addu	ra,ra,a2
bfc04b8c:	85500000 	lh	s0,0(t2)
bfc04b90:	87110000 	lh	s1,0(t8)
bfc04b94:	27390001 	addiu	t9,t9,1
bfc04b98:	02110018 	mult	s0,s1
bfc04b9c:	0334402b 	sltu	t0,t9,s4
bfc04ba0:	27180002 	addiu	t8,t8,2
bfc04ba4:	01525021 	addu	t2,t2,s2
bfc04ba8:	00007012 	mflo	t6
bfc04bac:	1100003c 	beqz	t0,bfc04ca0 <core_bench_matrix+0xdc0>
bfc04bb0:	03eef821 	addu	ra,ra,t6
bfc04bb4:	854f0000 	lh	t7,0(t2)
bfc04bb8:	87080000 	lh	t0,0(t8)
bfc04bbc:	01523821 	addu	a3,t2,s2
bfc04bc0:	01e80018 	mult	t7,t0
bfc04bc4:	870d0002 	lh	t5,2(t8)
bfc04bc8:	84ec0000 	lh	t4,0(a3)
bfc04bcc:	00f27021 	addu	t6,a3,s2
bfc04bd0:	87110004 	lh	s1,4(t8)
bfc04bd4:	85c90000 	lh	t1,0(t6)
bfc04bd8:	01d23021 	addu	a2,t6,s2
bfc04bdc:	87100006 	lh	s0,6(t8)
bfc04be0:	84c80000 	lh	t0,0(a2)
bfc04be4:	00d22021 	addu	a0,a2,s2
bfc04be8:	870f0008 	lh	t7,8(t8)
bfc04bec:	84870000 	lh	a3,0(a0)
bfc04bf0:	00922821 	addu	a1,a0,s2
bfc04bf4:	00001012 	mflo	v0
bfc04bf8:	870e000a 	lh	t6,10(t8)
bfc04bfc:	03e21021 	addu	v0,ra,v0
bfc04c00:	84a60000 	lh	a2,0(a1)
bfc04c04:	018d0018 	mult	t4,t5
bfc04c08:	00b21821 	addu	v1,a1,s2
bfc04c0c:	870c000c 	lh	t4,12(t8)
bfc04c10:	84640000 	lh	a0,0(v1)
bfc04c14:	00725021 	addu	t2,v1,s2
bfc04c18:	85430000 	lh	v1,0(t2)
bfc04c1c:	870d000e 	lh	t5,14(t8)
bfc04c20:	27390008 	addiu	t9,t9,8
bfc04c24:	0334282b 	sltu	a1,t9,s4
bfc04c28:	27180010 	addiu	t8,t8,16
bfc04c2c:	01525021 	addu	t2,t2,s2
bfc04c30:	00005812 	mflo	t3
	...
bfc04c3c:	01310018 	mult	t1,s1
bfc04c40:	004b8821 	addu	s1,v0,t3
bfc04c44:	00004812 	mflo	t1
bfc04c48:	02295821 	addu	t3,s1,t1
bfc04c4c:	00000000 	nop
bfc04c50:	01100018 	mult	t0,s0
bfc04c54:	0000f812 	mflo	ra
bfc04c58:	017f4821 	addu	t1,t3,ra
bfc04c5c:	00000000 	nop
bfc04c60:	00ef0018 	mult	a3,t7
bfc04c64:	00003812 	mflo	a3
bfc04c68:	01271021 	addu	v0,t1,a3
bfc04c6c:	00000000 	nop
bfc04c70:	00ce0018 	mult	a2,t6
bfc04c74:	00008012 	mflo	s0
bfc04c78:	00507821 	addu	t7,v0,s0
bfc04c7c:	00000000 	nop
bfc04c80:	008c0018 	mult	a0,t4
bfc04c84:	00007012 	mflo	t6
bfc04c88:	01ee8821 	addu	s1,t7,t6
bfc04c8c:	00000000 	nop
bfc04c90:	006d0018 	mult	v1,t5
bfc04c94:	00001812 	mflo	v1
bfc04c98:	14a0ffc6 	bnez	a1,bfc04bb4 <core_bench_matrix+0xcd4>
bfc04c9c:	0223f821 	addu	ra,s1,v1
bfc04ca0:	26b50001 	addiu	s5,s5,1
bfc04ca4:	02b4c02b 	sltu	t8,s5,s4
bfc04ca8:	aeff0000 	sw	ra,0(s7)
bfc04cac:	26730002 	addiu	s3,s3,2
bfc04cb0:	1700ff6d 	bnez	t8,bfc04a68 <core_bench_matrix+0xb88>
bfc04cb4:	26f70004 	addiu	s7,s7,4
bfc04cb8:	8fb00024 	lw	s0,36(sp)
bfc04cbc:	8fb50014 	lw	s5,20(sp)
bfc04cc0:	8fb9001c 	lw	t9,28(sp)
bfc04cc4:	261f0001 	addiu	ra,s0,1
bfc04cc8:	02b99821 	addu	s3,s5,t9
bfc04ccc:	03f4b82b 	sltu	s7,ra,s4
bfc04cd0:	afbf0024 	sw	ra,36(sp)
bfc04cd4:	02d2b021 	addu	s6,s6,s2
bfc04cd8:	16e0ff60 	bnez	s7,bfc04a5c <core_bench_matrix+0xb7c>
bfc04cdc:	afb30014 	sw	s3,20(sp)
bfc04ce0:	8fab0030 	lw	t3,48(sp)
bfc04ce4:	00003021 	move	a2,zero
bfc04ce8:	00001821 	move	v1,zero
bfc04cec:	00002021 	move	a0,zero
bfc04cf0:	00006021 	move	t4,zero
bfc04cf4:	2687ffff 	addiu	a3,s4,-1
bfc04cf8:	30ea0003 	andi	t2,a3,0x3
bfc04cfc:	01604021 	move	t0,t3
bfc04d00:	1140003f 	beqz	t2,bfc04e00 <core_bench_matrix+0xf20>
bfc04d04:	00004821 	move	t1,zero
bfc04d08:	8d670000 	lw	a3,0(t3)
bfc04d0c:	3090ffff 	andi	s0,a0,0xffff
bfc04d10:	0067c82a 	slt	t9,v1,a3
bfc04d14:	00c73021 	addu	a2,a2,a3
bfc04d18:	0219c021 	addu	t8,s0,t9
bfc04d1c:	2613000a 	addiu	s3,s0,10
bfc04d20:	00137400 	sll	t6,s3,0x10
bfc04d24:	0018bc00 	sll	s7,t8,0x10
bfc04d28:	03c6282a 	slt	a1,s8,a2
bfc04d2c:	000e1403 	sra	v0,t6,0x10
bfc04d30:	10a00002 	beqz	a1,bfc04d3c <core_bench_matrix+0xe5c>
bfc04d34:	00172403 	sra	a0,s7,0x10
bfc04d38:	00402021 	move	a0,v0
bfc04d3c:	10a00002 	beqz	a1,bfc04d48 <core_bench_matrix+0xe68>
bfc04d40:	24090001 	li	t1,1
bfc04d44:	00003021 	move	a2,zero
bfc04d48:	0134882b 	sltu	s1,t1,s4
bfc04d4c:	12200078 	beqz	s1,bfc04f30 <core_bench_matrix+0x1050>
bfc04d50:	25680004 	addiu	t0,t3,4
bfc04d54:	1149002a 	beq	t2,t1,bfc04e00 <core_bench_matrix+0xf20>
bfc04d58:	00e01821 	move	v1,a3
bfc04d5c:	24150002 	li	s5,2
bfc04d60:	11550014 	beq	t2,s5,bfc04db4 <core_bench_matrix+0xed4>
bfc04d64:	309fffff 	andi	ra,a0,0xffff
bfc04d68:	8d050000 	lw	a1,0(t0)
bfc04d6c:	00000000 	nop
bfc04d70:	00c55021 	addu	t2,a2,a1
bfc04d74:	00e5302a 	slt	a2,a3,a1
bfc04d78:	03e67821 	addu	t7,ra,a2
bfc04d7c:	27e7000a 	addiu	a3,ra,10
bfc04d80:	00076c00 	sll	t5,a3,0x10
bfc04d84:	000fb400 	sll	s6,t7,0x10
bfc04d88:	03ca302a 	slt	a2,s8,t2
bfc04d8c:	000d1403 	sra	v0,t5,0x10
bfc04d90:	10c00002 	beqz	a2,bfc04d9c <core_bench_matrix+0xebc>
bfc04d94:	00162403 	sra	a0,s6,0x10
bfc04d98:	00402021 	move	a0,v0
bfc04d9c:	14c00002 	bnez	a2,bfc04da8 <core_bench_matrix+0xec8>
bfc04da0:	00003021 	move	a2,zero
bfc04da4:	01403021 	move	a2,t2
bfc04da8:	25290001 	addiu	t1,t1,1
bfc04dac:	25080004 	addiu	t0,t0,4
bfc04db0:	00a01821 	move	v1,a1
bfc04db4:	8d050000 	lw	a1,0(t0)
bfc04db8:	3097ffff 	andi	s7,a0,0xffff
bfc04dbc:	0065c02a 	slt	t8,v1,a1
bfc04dc0:	26e2000a 	addiu	v0,s7,10
bfc04dc4:	00c53821 	addu	a3,a2,a1
bfc04dc8:	02f81821 	addu	v1,s7,t8
bfc04dcc:	00022400 	sll	a0,v0,0x10
bfc04dd0:	00035400 	sll	t2,v1,0x10
bfc04dd4:	03c7302a 	slt	a2,s8,a3
bfc04dd8:	00041403 	sra	v0,a0,0x10
bfc04ddc:	10c00002 	beqz	a2,bfc04de8 <core_bench_matrix+0xf08>
bfc04de0:	000a2403 	sra	a0,t2,0x10
bfc04de4:	00402021 	move	a0,v0
bfc04de8:	14c00002 	bnez	a2,bfc04df4 <core_bench_matrix+0xf14>
bfc04dec:	00003021 	move	a2,zero
bfc04df0:	00e03021 	move	a2,a3
bfc04df4:	25290001 	addiu	t1,t1,1
bfc04df8:	25080004 	addiu	t0,t0,4
bfc04dfc:	00a01821 	move	v1,a1
bfc04e00:	8d070000 	lw	a3,0(t0)
bfc04e04:	3085ffff 	andi	a1,a0,0xffff
bfc04e08:	0067b82a 	slt	s7,v1,a3
bfc04e0c:	00b72021 	addu	a0,a1,s7
bfc04e10:	24b8000a 	addiu	t8,a1,10
bfc04e14:	00c73021 	addu	a2,a2,a3
bfc04e18:	00187c00 	sll	t7,t8,0x10
bfc04e1c:	00045400 	sll	t2,a0,0x10
bfc04e20:	03c6282a 	slt	a1,s8,a2
bfc04e24:	000f1403 	sra	v0,t7,0x10
bfc04e28:	10a00002 	beqz	a1,bfc04e34 <core_bench_matrix+0xf54>
bfc04e2c:	000a2403 	sra	a0,t2,0x10
bfc04e30:	00402021 	move	a0,v0
bfc04e34:	10a00002 	beqz	a1,bfc04e40 <core_bench_matrix+0xf60>
bfc04e38:	00000000 	nop
bfc04e3c:	00003021 	move	a2,zero
bfc04e40:	25290001 	addiu	t1,t1,1
bfc04e44:	0134982b 	sltu	s3,t1,s4
bfc04e48:	12600039 	beqz	s3,bfc04f30 <core_bench_matrix+0x1050>
bfc04e4c:	250a0004 	addiu	t2,t0,4
bfc04e50:	8d050004 	lw	a1,4(t0)
bfc04e54:	308effff 	andi	t6,a0,0xffff
bfc04e58:	00e5182a 	slt	v1,a3,a1
bfc04e5c:	25c2000a 	addiu	v0,t6,10
bfc04e60:	00c54021 	addu	t0,a2,a1
bfc04e64:	01c38821 	addu	s1,t6,v1
bfc04e68:	00026c00 	sll	t5,v0,0x10
bfc04e6c:	0011b400 	sll	s6,s1,0x10
bfc04e70:	03c8302a 	slt	a2,s8,t0
bfc04e74:	000d2403 	sra	a0,t5,0x10
bfc04e78:	10c00002 	beqz	a2,bfc04e84 <core_bench_matrix+0xfa4>
bfc04e7c:	00161403 	sra	v0,s6,0x10
bfc04e80:	00801021 	move	v0,a0
bfc04e84:	14c00002 	bnez	a2,bfc04e90 <core_bench_matrix+0xfb0>
bfc04e88:	00003821 	move	a3,zero
bfc04e8c:	01003821 	move	a3,t0
bfc04e90:	8d460004 	lw	a2,4(t2)
bfc04e94:	3059ffff 	andi	t9,v0,0xffff
bfc04e98:	00a6882a 	slt	s1,a1,a2
bfc04e9c:	00e63821 	addu	a3,a3,a2
bfc04ea0:	03317021 	addu	t6,t9,s1
bfc04ea4:	2730000a 	addiu	s0,t9,10
bfc04ea8:	00109c00 	sll	s3,s0,0x10
bfc04eac:	000e4400 	sll	t0,t6,0x10
bfc04eb0:	03c7282a 	slt	a1,s8,a3
bfc04eb4:	00132403 	sra	a0,s3,0x10
bfc04eb8:	10a00002 	beqz	a1,bfc04ec4 <core_bench_matrix+0xfe4>
bfc04ebc:	00081403 	sra	v0,t0,0x10
bfc04ec0:	00801021 	move	v0,a0
bfc04ec4:	10a00002 	beqz	a1,bfc04ed0 <core_bench_matrix+0xff0>
bfc04ec8:	00000000 	nop
bfc04ecc:	00003821 	move	a3,zero
bfc04ed0:	8d450008 	lw	a1,8(t2)
bfc04ed4:	305fffff 	andi	ra,v0,0xffff
bfc04ed8:	00c5182a 	slt	v1,a2,a1
bfc04edc:	00e53821 	addu	a3,a3,a1
bfc04ee0:	03e3b021 	addu	s6,ra,v1
bfc04ee4:	27ed000a 	addiu	t5,ra,10
bfc04ee8:	000d7c00 	sll	t7,t5,0x10
bfc04eec:	0016ac00 	sll	s5,s6,0x10
bfc04ef0:	03c7302a 	slt	a2,s8,a3
bfc04ef4:	000f1403 	sra	v0,t7,0x10
bfc04ef8:	10c00002 	beqz	a2,bfc04f04 <core_bench_matrix+0x1024>
bfc04efc:	00152403 	sra	a0,s5,0x10
bfc04f00:	00402021 	move	a0,v0
bfc04f04:	14c00006 	bnez	a2,bfc04f20 <core_bench_matrix+0x1040>
bfc04f08:	00000000 	nop
bfc04f0c:	00e03021 	move	a2,a3
bfc04f10:	25290003 	addiu	t1,t1,3
bfc04f14:	2548000c 	addiu	t0,t2,12
bfc04f18:	0bf01380 	j	bfc04e00 <core_bench_matrix+0xf20>
bfc04f1c:	00a01821 	move	v1,a1
bfc04f20:	0bf013c4 	j	bfc04f10 <core_bench_matrix+0x1030>
bfc04f24:	00003021 	move	a2,zero
	...
bfc04f30:	258c0001 	addiu	t4,t4,1
bfc04f34:	8fa8001c 	lw	t0,28(sp)
bfc04f38:	0194482b 	sltu	t1,t4,s4
bfc04f3c:	11200003 	beqz	t1,bfc04f4c <core_bench_matrix+0x106c>
bfc04f40:	01685821 	addu	t3,t3,t0
bfc04f44:	0bf0133d 	j	bfc04cf4 <core_bench_matrix+0xe14>
bfc04f48:	00e01821 	move	v1,a3
bfc04f4c:	8fa50018 	lw	a1,24(sp)
bfc04f50:	0ff0179c 	jal	bfc05e70 <crc16>
bfc04f54:	0000b021 	move	s6,zero
bfc04f58:	8fb3002c 	lw	s3,44(sp)
bfc04f5c:	8fb50030 	lw	s5,48(sp)
bfc04f60:	0040b821 	move	s7,v0
bfc04f64:	8fb10028 	lw	s1,40(sp)
bfc04f68:	02a0c021 	move	t8,s5
bfc04f6c:	0000c821 	move	t9,zero
bfc04f70:	862e0000 	lh	t6,0(s1)
bfc04f74:	86630000 	lh	v1,0(s3)
bfc04f78:	240f0001 	li	t7,1
bfc04f7c:	01c30018 	mult	t6,v1
bfc04f80:	268dffff 	addiu	t5,s4,-1
bfc04f84:	01f4582b 	sltu	t3,t7,s4
bfc04f88:	31a40003 	andi	a0,t5,0x3
bfc04f8c:	02327021 	addu	t6,s1,s2
bfc04f90:	00001012 	mflo	v0
bfc04f94:	00028143 	sra	s0,v0,0x5
bfc04f98:	0002f883 	sra	ra,v0,0x2
bfc04f9c:	320c007f 	andi	t4,s0,0x7f
bfc04fa0:	33e6000f 	andi	a2,ra,0xf
bfc04fa4:	01860018 	mult	t4,a2
bfc04fa8:	00008012 	mflo	s0
bfc04fac:	1160006a 	beqz	t3,bfc05158 <core_bench_matrix+0x1278>
bfc04fb0:	266d0002 	addiu	t5,s3,2
bfc04fb4:	10800031 	beqz	a0,bfc0507c <core_bench_matrix+0x119c>
bfc04fb8:	00000000 	nop
bfc04fbc:	108f001f 	beq	a0,t7,bfc0503c <core_bench_matrix+0x115c>
bfc04fc0:	240b0002 	li	t3,2
bfc04fc4:	108b000f 	beq	a0,t3,bfc05004 <core_bench_matrix+0x1124>
bfc04fc8:	00000000 	nop
bfc04fcc:	85af0000 	lh	t7,0(t5)
bfc04fd0:	85cd0000 	lh	t5,0(t6)
bfc04fd4:	01d27021 	addu	t6,t6,s2
bfc04fd8:	01af0018 	mult	t5,t7
bfc04fdc:	240f0002 	li	t7,2
bfc04fe0:	266d0004 	addiu	t5,s3,4
bfc04fe4:	00004012 	mflo	t0
bfc04fe8:	00085083 	sra	t2,t0,0x2
bfc04fec:	00083143 	sra	a2,t0,0x5
bfc04ff0:	30c7007f 	andi	a3,a2,0x7f
bfc04ff4:	3145000f 	andi	a1,t2,0xf
bfc04ff8:	00e50018 	mult	a3,a1
bfc04ffc:	00004812 	mflo	t1
bfc05000:	02098021 	addu	s0,s0,t1
bfc05004:	85c90000 	lh	t1,0(t6)
bfc05008:	85a50000 	lh	a1,0(t5)
bfc0500c:	25ef0001 	addiu	t7,t7,1
bfc05010:	01250018 	mult	t1,a1
bfc05014:	25ad0002 	addiu	t5,t5,2
bfc05018:	01d27021 	addu	t6,t6,s2
bfc0501c:	00005812 	mflo	t3
bfc05020:	000b2083 	sra	a0,t3,0x2
bfc05024:	000b1143 	sra	v0,t3,0x5
bfc05028:	305f007f 	andi	ra,v0,0x7f
bfc0502c:	3083000f 	andi	v1,a0,0xf
bfc05030:	03e30018 	mult	ra,v1
bfc05034:	00006012 	mflo	t4
bfc05038:	020c8021 	addu	s0,s0,t4
bfc0503c:	85c40000 	lh	a0,0(t6)
bfc05040:	85a20000 	lh	v0,0(t5)
bfc05044:	25ef0001 	addiu	t7,t7,1
bfc05048:	00820018 	mult	a0,v0
bfc0504c:	01f4382b 	sltu	a3,t7,s4
bfc05050:	25ad0002 	addiu	t5,t5,2
bfc05054:	01d27021 	addu	t6,t6,s2
bfc05058:	00001812 	mflo	v1
bfc0505c:	00036083 	sra	t4,v1,0x2
bfc05060:	0003f943 	sra	ra,v1,0x5
bfc05064:	33e6007f 	andi	a2,ra,0x7f
bfc05068:	3188000f 	andi	t0,t4,0xf
bfc0506c:	00c80018 	mult	a2,t0
bfc05070:	00005012 	mflo	t2
bfc05074:	10e00038 	beqz	a3,bfc05158 <core_bench_matrix+0x1278>
bfc05078:	020a8021 	addu	s0,s0,t2
bfc0507c:	85c60000 	lh	a2,0(t6)
bfc05080:	85a30000 	lh	v1,0(t5)
bfc05084:	01d26021 	addu	t4,t6,s2
bfc05088:	00c30018 	mult	a2,v1
bfc0508c:	85a90002 	lh	t1,2(t5)
bfc05090:	85850000 	lh	a1,0(t4)
bfc05094:	01927021 	addu	t6,t4,s2
bfc05098:	85aa0004 	lh	t2,4(t5)
bfc0509c:	85c40000 	lh	a0,0(t6)
bfc050a0:	01d23821 	addu	a3,t6,s2
bfc050a4:	85a30006 	lh	v1,6(t5)
bfc050a8:	84e60000 	lh	a2,0(a3)
bfc050ac:	00f27021 	addu	t6,a3,s2
bfc050b0:	25ef0004 	addiu	t7,t7,4
bfc050b4:	01f4602b 	sltu	t4,t7,s4
bfc050b8:	25ad0008 	addiu	t5,t5,8
bfc050bc:	0000f812 	mflo	ra
bfc050c0:	001f4083 	sra	t0,ra,0x2
bfc050c4:	001f1143 	sra	v0,ra,0x5
bfc050c8:	00a90018 	mult	a1,t1
bfc050cc:	305f007f 	andi	ra,v0,0x7f
bfc050d0:	3108000f 	andi	t0,t0,0xf
bfc050d4:	00005812 	mflo	t3
bfc050d8:	000b4883 	sra	t1,t3,0x2
bfc050dc:	000b2943 	sra	a1,t3,0x5
bfc050e0:	008a0018 	mult	a0,t2
bfc050e4:	30a5007f 	andi	a1,a1,0x7f
bfc050e8:	3129000f 	andi	t1,t1,0xf
bfc050ec:	00003812 	mflo	a3
bfc050f0:	00075083 	sra	t2,a3,0x2
bfc050f4:	00072143 	sra	a0,a3,0x5
bfc050f8:	00c30018 	mult	a2,v1
bfc050fc:	3084007f 	andi	a0,a0,0x7f
bfc05100:	3147000f 	andi	a3,t2,0xf
bfc05104:	00005812 	mflo	t3
bfc05108:	000b1943 	sra	v1,t3,0x5
bfc0510c:	000b3083 	sra	a2,t3,0x2
bfc05110:	03e80018 	mult	ra,t0
bfc05114:	30cb000f 	andi	t3,a2,0xf
bfc05118:	3068007f 	andi	t0,v1,0x7f
bfc0511c:	00001012 	mflo	v0
bfc05120:	0202f821 	addu	ra,s0,v0
bfc05124:	00000000 	nop
bfc05128:	00a90018 	mult	a1,t1
bfc0512c:	00005012 	mflo	t2
bfc05130:	03ea4821 	addu	t1,ra,t2
bfc05134:	00000000 	nop
bfc05138:	00870018 	mult	a0,a3
bfc0513c:	00002012 	mflo	a0
bfc05140:	01245021 	addu	t2,t1,a0
bfc05144:	00000000 	nop
bfc05148:	010b0018 	mult	t0,t3
bfc0514c:	00002812 	mflo	a1
bfc05150:	1580ffca 	bnez	t4,bfc0507c <core_bench_matrix+0x119c>
bfc05154:	01458021 	addu	s0,t2,a1
bfc05158:	27390001 	addiu	t9,t9,1
bfc0515c:	0334782b 	sltu	t7,t9,s4
bfc05160:	af100000 	sw	s0,0(t8)
bfc05164:	26310002 	addiu	s1,s1,2
bfc05168:	15e0ff81 	bnez	t7,bfc04f70 <core_bench_matrix+0x1090>
bfc0516c:	27180004 	addiu	t8,t8,4
bfc05170:	26d60001 	addiu	s6,s6,1
bfc05174:	8fb1001c 	lw	s1,28(sp)
bfc05178:	02d4c82b 	sltu	t9,s6,s4
bfc0517c:	02729821 	addu	s3,s3,s2
bfc05180:	1720ff78 	bnez	t9,bfc04f64 <core_bench_matrix+0x1084>
bfc05184:	02b1a821 	addu	s5,s5,s1
bfc05188:	00003021 	move	a2,zero
bfc0518c:	00001821 	move	v1,zero
bfc05190:	00002021 	move	a0,zero
bfc05194:	00005821 	move	t3,zero
bfc05198:	2687ffff 	addiu	a3,s4,-1
bfc0519c:	30ea0003 	andi	t2,a3,0x3
bfc051a0:	8fa80020 	lw	t0,32(sp)
bfc051a4:	11400040 	beqz	t2,bfc052a8 <core_bench_matrix+0x13c8>
bfc051a8:	00004821 	move	t1,zero
bfc051ac:	8d070000 	lw	a3,0(t0)
bfc051b0:	3093ffff 	andi	s3,a0,0xffff
bfc051b4:	0067802a 	slt	s0,v1,a3
bfc051b8:	00c73021 	addu	a2,a2,a3
bfc051bc:	02707021 	addu	t6,s3,s0
bfc051c0:	266c000a 	addiu	t4,s3,10
bfc051c4:	000c7c00 	sll	t7,t4,0x10
bfc051c8:	000e6c00 	sll	t5,t6,0x10
bfc051cc:	03c6282a 	slt	a1,s8,a2
bfc051d0:	000f1403 	sra	v0,t7,0x10
bfc051d4:	10a00002 	beqz	a1,bfc051e0 <core_bench_matrix+0x1300>
bfc051d8:	000d2403 	sra	a0,t5,0x10
bfc051dc:	00402021 	move	a0,v0
bfc051e0:	10a00002 	beqz	a1,bfc051ec <core_bench_matrix+0x130c>
bfc051e4:	24090001 	li	t1,1
bfc051e8:	00003021 	move	a2,zero
bfc051ec:	8fa30020 	lw	v1,32(sp)
bfc051f0:	0134282b 	sltu	a1,t1,s4
bfc051f4:	10a0007b 	beqz	a1,bfc053e4 <core_bench_matrix+0x1504>
bfc051f8:	24680004 	addiu	t0,v1,4
bfc051fc:	1149002a 	beq	t2,t1,bfc052a8 <core_bench_matrix+0x13c8>
bfc05200:	00e01821 	move	v1,a3
bfc05204:	24020002 	li	v0,2
bfc05208:	11420014 	beq	t2,v0,bfc0525c <core_bench_matrix+0x137c>
bfc0520c:	3095ffff 	andi	s5,a0,0xffff
bfc05210:	8d050000 	lw	a1,0(t0)
bfc05214:	00000000 	nop
bfc05218:	00e5b02a 	slt	s6,a3,a1
bfc0521c:	02b62021 	addu	a0,s5,s6
bfc05220:	00c55021 	addu	t2,a2,a1
bfc05224:	26b1000a 	addiu	s1,s5,10
bfc05228:	0011cc00 	sll	t9,s1,0x10
bfc0522c:	00043c00 	sll	a3,a0,0x10
bfc05230:	03ca302a 	slt	a2,s8,t2
bfc05234:	00191403 	sra	v0,t9,0x10
bfc05238:	10c00002 	beqz	a2,bfc05244 <core_bench_matrix+0x1364>
bfc0523c:	00072403 	sra	a0,a3,0x10
bfc05240:	00402021 	move	a0,v0
bfc05244:	14c00002 	bnez	a2,bfc05250 <core_bench_matrix+0x1370>
bfc05248:	00003021 	move	a2,zero
bfc0524c:	01403021 	move	a2,t2
bfc05250:	25290001 	addiu	t1,t1,1
bfc05254:	25080004 	addiu	t0,t0,4
bfc05258:	00a01821 	move	v1,a1
bfc0525c:	8d050000 	lw	a1,0(t0)
bfc05260:	308fffff 	andi	t7,a0,0xffff
bfc05264:	00c53821 	addu	a3,a2,a1
bfc05268:	0065302a 	slt	a2,v1,a1
bfc0526c:	01e6c021 	addu	t8,t7,a2
bfc05270:	25ee000a 	addiu	t6,t7,10
bfc05274:	000e6c00 	sll	t5,t6,0x10
bfc05278:	00185400 	sll	t2,t8,0x10
bfc0527c:	03c7302a 	slt	a2,s8,a3
bfc05280:	000d1403 	sra	v0,t5,0x10
bfc05284:	10c00002 	beqz	a2,bfc05290 <core_bench_matrix+0x13b0>
bfc05288:	000a2403 	sra	a0,t2,0x10
bfc0528c:	00402021 	move	a0,v0
bfc05290:	14c00002 	bnez	a2,bfc0529c <core_bench_matrix+0x13bc>
bfc05294:	00003021 	move	a2,zero
bfc05298:	00e03021 	move	a2,a3
bfc0529c:	25290001 	addiu	t1,t1,1
bfc052a0:	25080004 	addiu	t0,t0,4
bfc052a4:	00a01821 	move	v1,a1
bfc052a8:	8d070000 	lw	a3,0(t0)
bfc052ac:	3085ffff 	andi	a1,a0,0xffff
bfc052b0:	0067702a 	slt	t6,v1,a3
bfc052b4:	00ae5021 	addu	t2,a1,t6
bfc052b8:	24bf000a 	addiu	ra,a1,10
bfc052bc:	00c73021 	addu	a2,a2,a3
bfc052c0:	001f1400 	sll	v0,ra,0x10
bfc052c4:	000a2400 	sll	a0,t2,0x10
bfc052c8:	03c6282a 	slt	a1,s8,a2
bfc052cc:	00021403 	sra	v0,v0,0x10
bfc052d0:	10a00002 	beqz	a1,bfc052dc <core_bench_matrix+0x13fc>
bfc052d4:	00042403 	sra	a0,a0,0x10
bfc052d8:	00402021 	move	a0,v0
bfc052dc:	10a00002 	beqz	a1,bfc052e8 <core_bench_matrix+0x1408>
bfc052e0:	00000000 	nop
bfc052e4:	00003021 	move	a2,zero
bfc052e8:	25290001 	addiu	t1,t1,1
bfc052ec:	0134602b 	sltu	t4,t1,s4
bfc052f0:	1180003b 	beqz	t4,bfc053e0 <core_bench_matrix+0x1500>
bfc052f4:	250a0004 	addiu	t2,t0,4
bfc052f8:	8d050004 	lw	a1,4(t0)
bfc052fc:	3090ffff 	andi	s0,a0,0xffff
bfc05300:	00e5682a 	slt	t5,a3,a1
bfc05304:	00c54021 	addu	t0,a2,a1
bfc05308:	020db021 	addu	s6,s0,t5
bfc0530c:	2613000a 	addiu	s3,s0,10
bfc05310:	0013c400 	sll	t8,s3,0x10
bfc05314:	0016ac00 	sll	s5,s6,0x10
bfc05318:	03c8302a 	slt	a2,s8,t0
bfc0531c:	00182403 	sra	a0,t8,0x10
bfc05320:	10c00002 	beqz	a2,bfc0532c <core_bench_matrix+0x144c>
bfc05324:	00151403 	sra	v0,s5,0x10
bfc05328:	00801021 	move	v0,a0
bfc0532c:	14c00002 	bnez	a2,bfc05338 <core_bench_matrix+0x1458>
bfc05330:	00003821 	move	a3,zero
bfc05334:	01003821 	move	a3,t0
bfc05338:	8d460004 	lw	a2,4(t2)
bfc0533c:	305fffff 	andi	ra,v0,0xffff
bfc05340:	00a6182a 	slt	v1,a1,a2
bfc05344:	00e63821 	addu	a3,a3,a2
bfc05348:	03e36021 	addu	t4,ra,v1
bfc0534c:	27f0000a 	addiu	s0,ra,10
bfc05350:	00109c00 	sll	s3,s0,0x10
bfc05354:	000c4400 	sll	t0,t4,0x10
bfc05358:	03c7282a 	slt	a1,s8,a3
bfc0535c:	00132403 	sra	a0,s3,0x10
bfc05360:	10a00002 	beqz	a1,bfc0536c <core_bench_matrix+0x148c>
bfc05364:	00081403 	sra	v0,t0,0x10
bfc05368:	00801021 	move	v0,a0
bfc0536c:	10a00002 	beqz	a1,bfc05378 <core_bench_matrix+0x1498>
bfc05370:	00000000 	nop
bfc05374:	00003821 	move	a3,zero
bfc05378:	8d450008 	lw	a1,8(t2)
bfc0537c:	3055ffff 	andi	s5,v0,0xffff
bfc05380:	00c5b02a 	slt	s6,a2,a1
bfc05384:	00e53821 	addu	a3,a3,a1
bfc05388:	02b6c821 	addu	t9,s5,s6
bfc0538c:	26b1000a 	addiu	s1,s5,10
bfc05390:	00111400 	sll	v0,s1,0x10
bfc05394:	00192400 	sll	a0,t9,0x10
bfc05398:	03c7302a 	slt	a2,s8,a3
bfc0539c:	00021403 	sra	v0,v0,0x10
bfc053a0:	10c00002 	beqz	a2,bfc053ac <core_bench_matrix+0x14cc>
bfc053a4:	00042403 	sra	a0,a0,0x10
bfc053a8:	00402021 	move	a0,v0
bfc053ac:	14c00008 	bnez	a2,bfc053d0 <core_bench_matrix+0x14f0>
bfc053b0:	00000000 	nop
bfc053b4:	00e03021 	move	a2,a3
bfc053b8:	25290003 	addiu	t1,t1,3
bfc053bc:	2548000c 	addiu	t0,t2,12
bfc053c0:	0bf014aa 	j	bfc052a8 <core_bench_matrix+0x13c8>
bfc053c4:	00a01821 	move	v1,a1
	...
bfc053d0:	0bf014ee 	j	bfc053b8 <core_bench_matrix+0x14d8>
bfc053d4:	00003021 	move	a2,zero
	...
bfc053e0:	8fa30020 	lw	v1,32(sp)
bfc053e4:	8faf001c 	lw	t7,28(sp)
bfc053e8:	256b0001 	addiu	t3,t3,1
bfc053ec:	006f4821 	addu	t1,v1,t7
bfc053f0:	0174402b 	sltu	t0,t3,s4
bfc053f4:	11000003 	beqz	t0,bfc05404 <core_bench_matrix+0x1524>
bfc053f8:	afa90020 	sw	t1,32(sp)
bfc053fc:	0bf01466 	j	bfc05198 <core_bench_matrix+0x12b8>
bfc05400:	00e01821 	move	v1,a3
bfc05404:	0ff0179c 	jal	bfc05e70 <crc16>
bfc05408:	02e02821 	move	a1,s7
bfc0540c:	8fb70034 	lw	s7,52(sp)
bfc05410:	00407821 	move	t7,v0
bfc05414:	0017f023 	negu	s8,s7
bfc05418:	33cdffff 	andi	t5,s8,0xffff
bfc0541c:	00007021 	move	t6,zero
bfc05420:	8fb90010 	lw	t9,16(sp)
bfc05424:	240c0001 	li	t4,1
bfc05428:	97360000 	lhu	s6,0(t9)
bfc0542c:	2691ffff 	addiu	s1,s4,-1
bfc05430:	01b6a821 	addu	s5,t5,s6
bfc05434:	0194b82b 	sltu	s7,t4,s4
bfc05438:	a7350000 	sh	s5,0(t9)
bfc0543c:	32230007 	andi	v1,s1,0x7
bfc05440:	12e00051 	beqz	s7,bfc05588 <core_bench_matrix+0x16a8>
bfc05444:	272b0002 	addiu	t3,t9,2
bfc05448:	10600033 	beqz	v1,bfc05518 <core_bench_matrix+0x1638>
bfc0544c:	00000000 	nop
bfc05450:	106c002a 	beq	v1,t4,bfc054fc <core_bench_matrix+0x161c>
bfc05454:	24060002 	li	a2,2
bfc05458:	10660023 	beq	v1,a2,bfc054e8 <core_bench_matrix+0x1608>
bfc0545c:	24180003 	li	t8,3
bfc05460:	1078001c 	beq	v1,t8,bfc054d4 <core_bench_matrix+0x15f4>
bfc05464:	24130004 	li	s3,4
bfc05468:	10730015 	beq	v1,s3,bfc054c0 <core_bench_matrix+0x15e0>
bfc0546c:	24100005 	li	s0,5
bfc05470:	1070000e 	beq	v1,s0,bfc054ac <core_bench_matrix+0x15cc>
bfc05474:	240a0006 	li	t2,6
bfc05478:	106a0007 	beq	v1,t2,bfc05498 <core_bench_matrix+0x15b8>
bfc0547c:	00000000 	nop
bfc05480:	95690000 	lhu	t1,0(t3)
bfc05484:	8fbf0010 	lw	ra,16(sp)
bfc05488:	01a94021 	addu	t0,t5,t1
bfc0548c:	a5680000 	sh	t0,0(t3)
bfc05490:	240c0002 	li	t4,2
bfc05494:	27eb0004 	addiu	t3,ra,4
bfc05498:	95650000 	lhu	a1,0(t3)
bfc0549c:	258c0001 	addiu	t4,t4,1
bfc054a0:	01a53821 	addu	a3,t5,a1
bfc054a4:	a5670000 	sh	a3,0(t3)
bfc054a8:	256b0002 	addiu	t3,t3,2
bfc054ac:	95630000 	lhu	v1,0(t3)
bfc054b0:	258c0001 	addiu	t4,t4,1
bfc054b4:	01a32021 	addu	a0,t5,v1
bfc054b8:	a5640000 	sh	a0,0(t3)
bfc054bc:	256b0002 	addiu	t3,t3,2
bfc054c0:	957e0000 	lhu	s8,0(t3)
bfc054c4:	258c0001 	addiu	t4,t4,1
bfc054c8:	01be1021 	addu	v0,t5,s8
bfc054cc:	a5620000 	sh	v0,0(t3)
bfc054d0:	256b0002 	addiu	t3,t3,2
bfc054d4:	95790000 	lhu	t9,0(t3)
bfc054d8:	258c0001 	addiu	t4,t4,1
bfc054dc:	01b9b821 	addu	s7,t5,t9
bfc054e0:	a5770000 	sh	s7,0(t3)
bfc054e4:	256b0002 	addiu	t3,t3,2
bfc054e8:	95750000 	lhu	s5,0(t3)
bfc054ec:	258c0001 	addiu	t4,t4,1
bfc054f0:	01b58821 	addu	s1,t5,s5
bfc054f4:	a5710000 	sh	s1,0(t3)
bfc054f8:	256b0002 	addiu	t3,t3,2
bfc054fc:	95780000 	lhu	t8,0(t3)
bfc05500:	258c0001 	addiu	t4,t4,1
bfc05504:	01b83021 	addu	a2,t5,t8
bfc05508:	0194b02b 	sltu	s6,t4,s4
bfc0550c:	a5660000 	sh	a2,0(t3)
bfc05510:	12c0001d 	beqz	s6,bfc05588 <core_bench_matrix+0x16a8>
bfc05514:	256b0002 	addiu	t3,t3,2
bfc05518:	95620000 	lhu	v0,0(t3)
bfc0551c:	95630002 	lhu	v1,2(t3)
bfc05520:	95640004 	lhu	a0,4(t3)
bfc05524:	95650006 	lhu	a1,6(t3)
bfc05528:	95670008 	lhu	a3,8(t3)
bfc0552c:	9569000a 	lhu	t1,10(t3)
bfc05530:	9568000c 	lhu	t0,12(t3)
bfc05534:	957f000e 	lhu	ra,14(t3)
bfc05538:	258c0008 	addiu	t4,t4,8
bfc0553c:	01a25021 	addu	t2,t5,v0
bfc05540:	01a38021 	addu	s0,t5,v1
bfc05544:	01a49821 	addu	s3,t5,a0
bfc05548:	01a5c021 	addu	t8,t5,a1
bfc0554c:	01a73021 	addu	a2,t5,a3
bfc05550:	01a9b021 	addu	s6,t5,t1
bfc05554:	01a8a821 	addu	s5,t5,t0
bfc05558:	01bf8821 	addu	s1,t5,ra
bfc0555c:	0194c82b 	sltu	t9,t4,s4
bfc05560:	a56a0000 	sh	t2,0(t3)
bfc05564:	a5700002 	sh	s0,2(t3)
bfc05568:	a5730004 	sh	s3,4(t3)
bfc0556c:	a5780006 	sh	t8,6(t3)
bfc05570:	a5660008 	sh	a2,8(t3)
bfc05574:	a576000a 	sh	s6,10(t3)
bfc05578:	a575000c 	sh	s5,12(t3)
bfc0557c:	a571000e 	sh	s1,14(t3)
bfc05580:	1720ffe5 	bnez	t9,bfc05518 <core_bench_matrix+0x1638>
bfc05584:	256b0010 	addiu	t3,t3,16
bfc05588:	8fbe0010 	lw	s8,16(sp)
bfc0558c:	25ce0001 	addiu	t6,t6,1
bfc05590:	03d26021 	addu	t4,s8,s2
bfc05594:	01d4582b 	sltu	t3,t6,s4
bfc05598:	1560ffa1 	bnez	t3,bfc05420 <core_bench_matrix+0x1540>
bfc0559c:	afac0010 	sw	t4,16(sp)
bfc055a0:	000f9400 	sll	s2,t7,0x10
bfc055a4:	8fa50038 	lw	a1,56(sp)
bfc055a8:	00122403 	sra	a0,s2,0x10
bfc055ac:	8fbf0064 	lw	ra,100(sp)
bfc055b0:	8fbe0060 	lw	s8,96(sp)
bfc055b4:	8fb7005c 	lw	s7,92(sp)
bfc055b8:	8fb60058 	lw	s6,88(sp)
bfc055bc:	8fb50054 	lw	s5,84(sp)
bfc055c0:	8fb40050 	lw	s4,80(sp)
bfc055c4:	8fb3004c 	lw	s3,76(sp)
bfc055c8:	8fb20048 	lw	s2,72(sp)
bfc055cc:	8fb10044 	lw	s1,68(sp)
bfc055d0:	8fb00040 	lw	s0,64(sp)
bfc055d4:	0bf0179c 	j	bfc05e70 <crc16>
bfc055d8:	27bd0068 	addiu	sp,sp,104
bfc055dc:	00002021 	move	a0,zero
bfc055e0:	0ff0179c 	jal	bfc05e70 <crc16>
bfc055e4:	00002821 	move	a1,zero
bfc055e8:	00402821 	move	a1,v0
bfc055ec:	0ff0179c 	jal	bfc05e70 <crc16>
bfc055f0:	00002021 	move	a0,zero
bfc055f4:	00402821 	move	a1,v0
bfc055f8:	0ff0179c 	jal	bfc05e70 <crc16>
bfc055fc:	00002021 	move	a0,zero
bfc05600:	00402821 	move	a1,v0
bfc05604:	0ff0179c 	jal	bfc05e70 <crc16>
bfc05608:	00002021 	move	a0,zero
bfc0560c:	0bf01568 	j	bfc055a0 <core_bench_matrix+0x16c0>
bfc05610:	00407821 	move	t7,v0
	...

bfc05620 <parseval>:
parseval():
bfc05620:	80870000 	lb	a3,0(a0)
bfc05624:	2402002d 	li	v0,45
bfc05628:	10e2003d 	beq	a3,v0,bfc05720 <parseval+0x100>
bfc0562c:	00802821 	move	a1,a0
bfc05630:	24030030 	li	v1,48
bfc05634:	10e3003f 	beq	a3,v1,bfc05734 <parseval+0x114>
bfc05638:	240a0001 	li	t2,1
bfc0563c:	24ebffd0 	addiu	t3,a3,-48
bfc05640:	316900ff 	andi	t1,t3,0xff
bfc05644:	2d28000a 	sltiu	t0,t1,10
bfc05648:	1100002b 	beqz	t0,bfc056f8 <parseval+0xd8>
bfc0564c:	00004021 	move	t0,zero
bfc05650:	000868c0 	sll	t5,t0,0x3
bfc05654:	00086040 	sll	t4,t0,0x1
bfc05658:	018d4021 	addu	t0,t4,t5
bfc0565c:	00e85821 	addu	t3,a3,t0
bfc05660:	80a70001 	lb	a3,1(a1)
bfc05664:	2568ffd0 	addiu	t0,t3,-48
bfc05668:	24e4ffd0 	addiu	a0,a3,-48
bfc0566c:	000848c0 	sll	t1,t0,0x3
bfc05670:	00083040 	sll	a2,t0,0x1
bfc05674:	308300ff 	andi	v1,a0,0xff
bfc05678:	00c91021 	addu	v0,a2,t1
bfc0567c:	2c79000a 	sltiu	t9,v1,10
bfc05680:	1320001d 	beqz	t9,bfc056f8 <parseval+0xd8>
bfc05684:	00e21021 	addu	v0,a3,v0
bfc05688:	80a70002 	lb	a3,2(a1)
bfc0568c:	2448ffd0 	addiu	t0,v0,-48
bfc05690:	24e4ffd0 	addiu	a0,a3,-48
bfc05694:	000810c0 	sll	v0,t0,0x3
bfc05698:	00083040 	sll	a2,t0,0x1
bfc0569c:	309900ff 	andi	t9,a0,0xff
bfc056a0:	00c21821 	addu	v1,a2,v0
bfc056a4:	2f38000a 	sltiu	t8,t9,10
bfc056a8:	13000013 	beqz	t8,bfc056f8 <parseval+0xd8>
bfc056ac:	00e31821 	addu	v1,a3,v1
bfc056b0:	80a70003 	lb	a3,3(a1)
bfc056b4:	24a50004 	addiu	a1,a1,4
bfc056b8:	24eeffd0 	addiu	t6,a3,-48
bfc056bc:	31c800ff 	andi	t0,t6,0xff
bfc056c0:	2d09000a 	sltiu	t1,t0,10
bfc056c4:	2468ffd0 	addiu	t0,v1,-48
bfc056c8:	000868c0 	sll	t5,t0,0x3
bfc056cc:	00086040 	sll	t4,t0,0x1
bfc056d0:	018d5821 	addu	t3,t4,t5
bfc056d4:	11200008 	beqz	t1,bfc056f8 <parseval+0xd8>
bfc056d8:	00eb1821 	addu	v1,a3,t3
bfc056dc:	80a70000 	lb	a3,0(a1)
bfc056e0:	00000000 	nop
bfc056e4:	24f9ffd0 	addiu	t9,a3,-48
bfc056e8:	333800ff 	andi	t8,t9,0xff
bfc056ec:	2f0f000a 	sltiu	t7,t8,10
bfc056f0:	15e0ffd7 	bnez	t7,bfc05650 <parseval+0x30>
bfc056f4:	2468ffd0 	addiu	t0,v1,-48
bfc056f8:	240e004b 	li	t6,75
bfc056fc:	10ee0028 	beq	a3,t6,bfc057a0 <parseval+0x180>
bfc05700:	240f004d 	li	t7,77
bfc05704:	14ef0003 	bne	a3,t7,bfc05714 <parseval+0xf4>
bfc05708:	010a0018 	mult	t0,t2
bfc0570c:	00084500 	sll	t0,t0,0x14
bfc05710:	010a0018 	mult	t0,t2
bfc05714:	00001012 	mflo	v0
bfc05718:	03e00008 	jr	ra
bfc0571c:	00000000 	nop
bfc05720:	24850001 	addiu	a1,a0,1
bfc05724:	80a70000 	lb	a3,0(a1)
bfc05728:	24030030 	li	v1,48
bfc0572c:	14e3ffc3 	bne	a3,v1,bfc0563c <parseval+0x1c>
bfc05730:	240affff 	li	t2,-1
bfc05734:	80a60001 	lb	a2,1(a1)
bfc05738:	24040078 	li	a0,120
bfc0573c:	14c4ffc0 	bne	a2,a0,bfc05640 <parseval+0x20>
bfc05740:	24ebffd0 	addiu	t3,a3,-48
bfc05744:	24a40002 	addiu	a0,a1,2
bfc05748:	00004021 	move	t0,zero
bfc0574c:	80870000 	lb	a3,0(a0)
bfc05750:	00084900 	sll	t1,t0,0x4
bfc05754:	30e500ff 	andi	a1,a3,0xff
bfc05758:	24b8ffd0 	addiu	t8,a1,-48
bfc0575c:	24afff9f 	addiu	t7,a1,-97
bfc05760:	330e00ff 	andi	t6,t8,0xff
bfc05764:	24e5ffd0 	addiu	a1,a3,-48
bfc05768:	31ed00ff 	andi	t5,t7,0xff
bfc0576c:	2dcc000a 	sltiu	t4,t6,10
bfc05770:	28a6000a 	slti	a2,a1,10
bfc05774:	24840001 	addiu	a0,a0,1
bfc05778:	15800003 	bnez	t4,bfc05788 <parseval+0x168>
bfc0577c:	2da30006 	sltiu	v1,t5,6
bfc05780:	1060ffde 	beqz	v1,bfc056fc <parseval+0xdc>
bfc05784:	240e004b 	li	t6,75
bfc05788:	14c00002 	bnez	a2,bfc05794 <parseval+0x174>
bfc0578c:	00000000 	nop
bfc05790:	24e5ffa9 	addiu	a1,a3,-87
bfc05794:	0bf015d3 	j	bfc0574c <parseval+0x12c>
bfc05798:	00a94021 	addu	t0,a1,t1
bfc0579c:	00000000 	nop
bfc057a0:	00084280 	sll	t0,t0,0xa
bfc057a4:	010a0018 	mult	t0,t2
bfc057a8:	00001012 	mflo	v0
bfc057ac:	03e00008 	jr	ra
bfc057b0:	00000000 	nop
	...

bfc057c0 <crcu8>:
crcu8():
bfc057c0:	30a5ffff 	andi	a1,a1,0xffff
bfc057c4:	308400ff 	andi	a0,a0,0xff
bfc057c8:	00853026 	xor	a2,a0,a1
bfc057cc:	38a74002 	xori	a3,a1,0x4002
bfc057d0:	00071042 	srl	v0,a3,0x1
bfc057d4:	30c30001 	andi	v1,a2,0x1
bfc057d8:	00042042 	srl	a0,a0,0x1
bfc057dc:	34468000 	ori	a2,v0,0x8000
bfc057e0:	14600043 	bnez	v1,bfc058f0 <crcu8+0x130>
bfc057e4:	00051042 	srl	v0,a1,0x1
bfc057e8:	00402821 	move	a1,v0
bfc057ec:	00855026 	xor	t2,a0,a1
bfc057f0:	38ab4002 	xori	t3,a1,0x4002
bfc057f4:	000b4842 	srl	t1,t3,0x1
bfc057f8:	31480001 	andi	t0,t2,0x1
bfc057fc:	00042042 	srl	a0,a0,0x1
bfc05800:	35268000 	ori	a2,t1,0x8000
bfc05804:	15000043 	bnez	t0,bfc05914 <crcu8+0x154>
bfc05808:	00051042 	srl	v0,a1,0x1
bfc0580c:	00402821 	move	a1,v0
bfc05810:	00857026 	xor	t6,a0,a1
bfc05814:	38af4002 	xori	t7,a1,0x4002
bfc05818:	000f6842 	srl	t5,t7,0x1
bfc0581c:	31cc0001 	andi	t4,t6,0x1
bfc05820:	00042042 	srl	a0,a0,0x1
bfc05824:	35a68000 	ori	a2,t5,0x8000
bfc05828:	15800043 	bnez	t4,bfc05938 <crcu8+0x178>
bfc0582c:	00051042 	srl	v0,a1,0x1
bfc05830:	00402821 	move	a1,v0
bfc05834:	00851826 	xor	v1,a0,a1
bfc05838:	38a24002 	xori	v0,a1,0x4002
bfc0583c:	0002c842 	srl	t9,v0,0x1
bfc05840:	30780001 	andi	t8,v1,0x1
bfc05844:	00042042 	srl	a0,a0,0x1
bfc05848:	37268000 	ori	a2,t9,0x8000
bfc0584c:	17000043 	bnez	t8,bfc0595c <crcu8+0x19c>
bfc05850:	00051042 	srl	v0,a1,0x1
bfc05854:	00402821 	move	a1,v0
bfc05858:	00853026 	xor	a2,a0,a1
bfc0585c:	38a94002 	xori	t1,a1,0x4002
bfc05860:	00094042 	srl	t0,t1,0x1
bfc05864:	30c70001 	andi	a3,a2,0x1
bfc05868:	00042042 	srl	a0,a0,0x1
bfc0586c:	35068000 	ori	a2,t0,0x8000
bfc05870:	14e00043 	bnez	a3,bfc05980 <crcu8+0x1c0>
bfc05874:	00051042 	srl	v0,a1,0x1
bfc05878:	00402821 	move	a1,v0
bfc0587c:	00856026 	xor	t4,a0,a1
bfc05880:	38ad4002 	xori	t5,a1,0x4002
bfc05884:	000d5842 	srl	t3,t5,0x1
bfc05888:	318a0001 	andi	t2,t4,0x1
bfc0588c:	00042042 	srl	a0,a0,0x1
bfc05890:	35668000 	ori	a2,t3,0x8000
bfc05894:	15400043 	bnez	t2,bfc059a4 <crcu8+0x1e4>
bfc05898:	00051042 	srl	v0,a1,0x1
bfc0589c:	00402821 	move	a1,v0
bfc058a0:	0085c026 	xor	t8,a0,a1
bfc058a4:	38b94002 	xori	t9,a1,0x4002
bfc058a8:	00197842 	srl	t7,t9,0x1
bfc058ac:	330e0001 	andi	t6,t8,0x1
bfc058b0:	35e68000 	ori	a2,t7,0x8000
bfc058b4:	15c00043 	bnez	t6,bfc059c4 <crcu8+0x204>
bfc058b8:	00051042 	srl	v0,a1,0x1
bfc058bc:	00402821 	move	a1,v0
bfc058c0:	38a74002 	xori	a3,a1,0x4002
bfc058c4:	00071042 	srl	v0,a3,0x1
bfc058c8:	00042042 	srl	a0,a0,0x1
bfc058cc:	30a30001 	andi	v1,a1,0x1
bfc058d0:	34468000 	ori	a2,v0,0x8000
bfc058d4:	14640043 	bne	v1,a0,bfc059e4 <crcu8+0x224>
bfc058d8:	00051042 	srl	v0,a1,0x1
bfc058dc:	03e00008 	jr	ra
bfc058e0:	3042ffff 	andi	v0,v0,0xffff
	...
bfc058f0:	00c02821 	move	a1,a2
bfc058f4:	00855026 	xor	t2,a0,a1
bfc058f8:	38ab4002 	xori	t3,a1,0x4002
bfc058fc:	000b4842 	srl	t1,t3,0x1
bfc05900:	31480001 	andi	t0,t2,0x1
bfc05904:	00042042 	srl	a0,a0,0x1
bfc05908:	35268000 	ori	a2,t1,0x8000
bfc0590c:	1100ffbf 	beqz	t0,bfc0580c <crcu8+0x4c>
bfc05910:	00051042 	srl	v0,a1,0x1
bfc05914:	00c02821 	move	a1,a2
bfc05918:	00857026 	xor	t6,a0,a1
bfc0591c:	38af4002 	xori	t7,a1,0x4002
bfc05920:	000f6842 	srl	t5,t7,0x1
bfc05924:	31cc0001 	andi	t4,t6,0x1
bfc05928:	00042042 	srl	a0,a0,0x1
bfc0592c:	35a68000 	ori	a2,t5,0x8000
bfc05930:	1180ffbf 	beqz	t4,bfc05830 <crcu8+0x70>
bfc05934:	00051042 	srl	v0,a1,0x1
bfc05938:	00c02821 	move	a1,a2
bfc0593c:	00851826 	xor	v1,a0,a1
bfc05940:	38a24002 	xori	v0,a1,0x4002
bfc05944:	0002c842 	srl	t9,v0,0x1
bfc05948:	30780001 	andi	t8,v1,0x1
bfc0594c:	00042042 	srl	a0,a0,0x1
bfc05950:	37268000 	ori	a2,t9,0x8000
bfc05954:	1300ffbf 	beqz	t8,bfc05854 <crcu8+0x94>
bfc05958:	00051042 	srl	v0,a1,0x1
bfc0595c:	00c02821 	move	a1,a2
bfc05960:	00853026 	xor	a2,a0,a1
bfc05964:	38a94002 	xori	t1,a1,0x4002
bfc05968:	00094042 	srl	t0,t1,0x1
bfc0596c:	30c70001 	andi	a3,a2,0x1
bfc05970:	00042042 	srl	a0,a0,0x1
bfc05974:	35068000 	ori	a2,t0,0x8000
bfc05978:	10e0ffbf 	beqz	a3,bfc05878 <crcu8+0xb8>
bfc0597c:	00051042 	srl	v0,a1,0x1
bfc05980:	00c02821 	move	a1,a2
bfc05984:	00856026 	xor	t4,a0,a1
bfc05988:	38ad4002 	xori	t5,a1,0x4002
bfc0598c:	000d5842 	srl	t3,t5,0x1
bfc05990:	318a0001 	andi	t2,t4,0x1
bfc05994:	00042042 	srl	a0,a0,0x1
bfc05998:	35668000 	ori	a2,t3,0x8000
bfc0599c:	1140ffbf 	beqz	t2,bfc0589c <crcu8+0xdc>
bfc059a0:	00051042 	srl	v0,a1,0x1
bfc059a4:	00c02821 	move	a1,a2
bfc059a8:	0085c026 	xor	t8,a0,a1
bfc059ac:	38b94002 	xori	t9,a1,0x4002
bfc059b0:	00197842 	srl	t7,t9,0x1
bfc059b4:	330e0001 	andi	t6,t8,0x1
bfc059b8:	35e68000 	ori	a2,t7,0x8000
bfc059bc:	11c0ffbf 	beqz	t6,bfc058bc <crcu8+0xfc>
bfc059c0:	00051042 	srl	v0,a1,0x1
bfc059c4:	00c02821 	move	a1,a2
bfc059c8:	38a74002 	xori	a3,a1,0x4002
bfc059cc:	00071042 	srl	v0,a3,0x1
bfc059d0:	00042042 	srl	a0,a0,0x1
bfc059d4:	30a30001 	andi	v1,a1,0x1
bfc059d8:	34468000 	ori	a2,v0,0x8000
bfc059dc:	1064ffbf 	beq	v1,a0,bfc058dc <crcu8+0x11c>
bfc059e0:	00051042 	srl	v0,a1,0x1
bfc059e4:	00c01021 	move	v0,a2
bfc059e8:	03e00008 	jr	ra
bfc059ec:	3042ffff 	andi	v0,v0,0xffff

bfc059f0 <check_data_types>:
check_data_types():
bfc059f0:	03e00008 	jr	ra
bfc059f4:	00001021 	move	v0,zero
	...

bfc05a00 <crcu16>:
crcu16():
bfc05a00:	3087ffff 	andi	a3,a0,0xffff
bfc05a04:	30a5ffff 	andi	a1,a1,0xffff
bfc05a08:	30e400ff 	andi	a0,a3,0xff
bfc05a0c:	00853026 	xor	a2,a0,a1
bfc05a10:	38a84002 	xori	t0,a1,0x4002
bfc05a14:	00081042 	srl	v0,t0,0x1
bfc05a18:	30c30001 	andi	v1,a2,0x1
bfc05a1c:	00042042 	srl	a0,a0,0x1
bfc05a20:	34468000 	ori	a2,v0,0x8000
bfc05a24:	1460008a 	bnez	v1,bfc05c50 <crcu16+0x250>
bfc05a28:	00051042 	srl	v0,a1,0x1
bfc05a2c:	00402821 	move	a1,v0
bfc05a30:	00855826 	xor	t3,a0,a1
bfc05a34:	38ac4002 	xori	t4,a1,0x4002
bfc05a38:	000c5042 	srl	t2,t4,0x1
bfc05a3c:	31690001 	andi	t1,t3,0x1
bfc05a40:	00042042 	srl	a0,a0,0x1
bfc05a44:	35468000 	ori	a2,t2,0x8000
bfc05a48:	1520008a 	bnez	t1,bfc05c74 <crcu16+0x274>
bfc05a4c:	00051042 	srl	v0,a1,0x1
bfc05a50:	00402821 	move	a1,v0
bfc05a54:	00857826 	xor	t7,a0,a1
bfc05a58:	38b84002 	xori	t8,a1,0x4002
bfc05a5c:	00187042 	srl	t6,t8,0x1
bfc05a60:	31ed0001 	andi	t5,t7,0x1
bfc05a64:	00042042 	srl	a0,a0,0x1
bfc05a68:	35c68000 	ori	a2,t6,0x8000
bfc05a6c:	15a0008a 	bnez	t5,bfc05c98 <crcu16+0x298>
bfc05a70:	00051042 	srl	v0,a1,0x1
bfc05a74:	00402821 	move	a1,v0
bfc05a78:	00851826 	xor	v1,a0,a1
bfc05a7c:	38a64002 	xori	a2,a1,0x4002
bfc05a80:	00061042 	srl	v0,a2,0x1
bfc05a84:	30790001 	andi	t9,v1,0x1
bfc05a88:	34468000 	ori	a2,v0,0x8000
bfc05a8c:	00042042 	srl	a0,a0,0x1
bfc05a90:	1720008a 	bnez	t9,bfc05cbc <crcu16+0x2bc>
bfc05a94:	00051042 	srl	v0,a1,0x1
bfc05a98:	00402821 	move	a1,v0
bfc05a9c:	00855026 	xor	t2,a0,a1
bfc05aa0:	38ab4002 	xori	t3,a1,0x4002
bfc05aa4:	000b4842 	srl	t1,t3,0x1
bfc05aa8:	31480001 	andi	t0,t2,0x1
bfc05aac:	00042042 	srl	a0,a0,0x1
bfc05ab0:	35268000 	ori	a2,t1,0x8000
bfc05ab4:	1500008a 	bnez	t0,bfc05ce0 <crcu16+0x2e0>
bfc05ab8:	00051042 	srl	v0,a1,0x1
bfc05abc:	00402821 	move	a1,v0
bfc05ac0:	00857026 	xor	t6,a0,a1
bfc05ac4:	38af4002 	xori	t7,a1,0x4002
bfc05ac8:	000f6842 	srl	t5,t7,0x1
bfc05acc:	31cc0001 	andi	t4,t6,0x1
bfc05ad0:	00042042 	srl	a0,a0,0x1
bfc05ad4:	35a68000 	ori	a2,t5,0x8000
bfc05ad8:	1580008a 	bnez	t4,bfc05d04 <crcu16+0x304>
bfc05adc:	00051042 	srl	v0,a1,0x1
bfc05ae0:	00402821 	move	a1,v0
bfc05ae4:	38a24002 	xori	v0,a1,0x4002
bfc05ae8:	00851826 	xor	v1,a0,a1
bfc05aec:	0002c842 	srl	t9,v0,0x1
bfc05af0:	30780001 	andi	t8,v1,0x1
bfc05af4:	37268000 	ori	a2,t9,0x8000
bfc05af8:	1700008a 	bnez	t8,bfc05d24 <crcu16+0x324>
bfc05afc:	00051042 	srl	v0,a1,0x1
bfc05b00:	00402821 	move	a1,v0
bfc05b04:	38a64002 	xori	a2,a1,0x4002
bfc05b08:	00064842 	srl	t1,a2,0x1
bfc05b0c:	00042042 	srl	a0,a0,0x1
bfc05b10:	30a80001 	andi	t0,a1,0x1
bfc05b14:	35268000 	ori	a2,t1,0x8000
bfc05b18:	1504008a 	bne	t0,a0,bfc05d44 <crcu16+0x344>
bfc05b1c:	00051042 	srl	v0,a1,0x1
bfc05b20:	00402821 	move	a1,v0
bfc05b24:	00075a02 	srl	t3,a3,0x8
bfc05b28:	01656026 	xor	t4,t3,a1
bfc05b2c:	38ad4002 	xori	t5,a1,0x4002
bfc05b30:	000d5042 	srl	t2,t5,0x1
bfc05b34:	31870001 	andi	a3,t4,0x1
bfc05b38:	000b2042 	srl	a0,t3,0x1
bfc05b3c:	35468000 	ori	a2,t2,0x8000
bfc05b40:	14e0008a 	bnez	a3,bfc05d6c <crcu16+0x36c>
bfc05b44:	00051042 	srl	v0,a1,0x1
bfc05b48:	00402821 	move	a1,v0
bfc05b4c:	0085c026 	xor	t8,a0,a1
bfc05b50:	38b94002 	xori	t9,a1,0x4002
bfc05b54:	00197842 	srl	t7,t9,0x1
bfc05b58:	330e0001 	andi	t6,t8,0x1
bfc05b5c:	00042042 	srl	a0,a0,0x1
bfc05b60:	35e68000 	ori	a2,t7,0x8000
bfc05b64:	15c0008a 	bnez	t6,bfc05d90 <crcu16+0x390>
bfc05b68:	00051042 	srl	v0,a1,0x1
bfc05b6c:	00402821 	move	a1,v0
bfc05b70:	00854026 	xor	t0,a0,a1
bfc05b74:	38a94002 	xori	t1,a1,0x4002
bfc05b78:	00091042 	srl	v0,t1,0x1
bfc05b7c:	31030001 	andi	v1,t0,0x1
bfc05b80:	34468000 	ori	a2,v0,0x8000
bfc05b84:	00042042 	srl	a0,a0,0x1
bfc05b88:	1460008a 	bnez	v1,bfc05db4 <crcu16+0x3b4>
bfc05b8c:	00051042 	srl	v0,a1,0x1
bfc05b90:	00402821 	move	a1,v0
bfc05b94:	00853026 	xor	a2,a0,a1
bfc05b98:	38ab4002 	xori	t3,a1,0x4002
bfc05b9c:	000b5042 	srl	t2,t3,0x1
bfc05ba0:	30c70001 	andi	a3,a2,0x1
bfc05ba4:	00042042 	srl	a0,a0,0x1
bfc05ba8:	35468000 	ori	a2,t2,0x8000
bfc05bac:	14e0008a 	bnez	a3,bfc05dd8 <crcu16+0x3d8>
bfc05bb0:	00051042 	srl	v0,a1,0x1
bfc05bb4:	00402821 	move	a1,v0
bfc05bb8:	00857026 	xor	t6,a0,a1
bfc05bbc:	38af4002 	xori	t7,a1,0x4002
bfc05bc0:	000f6842 	srl	t5,t7,0x1
bfc05bc4:	31cc0001 	andi	t4,t6,0x1
bfc05bc8:	00042042 	srl	a0,a0,0x1
bfc05bcc:	35a68000 	ori	a2,t5,0x8000
bfc05bd0:	1580008a 	bnez	t4,bfc05dfc <crcu16+0x3fc>
bfc05bd4:	00051042 	srl	v0,a1,0x1
bfc05bd8:	00402821 	move	a1,v0
bfc05bdc:	00851826 	xor	v1,a0,a1
bfc05be0:	38a24002 	xori	v0,a1,0x4002
bfc05be4:	0002c842 	srl	t9,v0,0x1
bfc05be8:	30780001 	andi	t8,v1,0x1
bfc05bec:	00042042 	srl	a0,a0,0x1
bfc05bf0:	37268000 	ori	a2,t9,0x8000
bfc05bf4:	1700008a 	bnez	t8,bfc05e20 <crcu16+0x420>
bfc05bf8:	00051042 	srl	v0,a1,0x1
bfc05bfc:	00402821 	move	a1,v0
bfc05c00:	00853826 	xor	a3,a0,a1
bfc05c04:	38aa4002 	xori	t2,a1,0x4002
bfc05c08:	000a4842 	srl	t1,t2,0x1
bfc05c0c:	30e80001 	andi	t0,a3,0x1
bfc05c10:	35268000 	ori	a2,t1,0x8000
bfc05c14:	1500008a 	bnez	t0,bfc05e40 <crcu16+0x440>
bfc05c18:	00051042 	srl	v0,a1,0x1
bfc05c1c:	00402821 	move	a1,v0
bfc05c20:	38a64002 	xori	a2,a1,0x4002
bfc05c24:	00066042 	srl	t4,a2,0x1
bfc05c28:	00042042 	srl	a0,a0,0x1
bfc05c2c:	30ab0001 	andi	t3,a1,0x1
bfc05c30:	35868000 	ori	a2,t4,0x8000
bfc05c34:	1564008a 	bne	t3,a0,bfc05e60 <crcu16+0x460>
bfc05c38:	00051042 	srl	v0,a1,0x1
bfc05c3c:	03e00008 	jr	ra
bfc05c40:	3042ffff 	andi	v0,v0,0xffff
	...
bfc05c50:	00c02821 	move	a1,a2
bfc05c54:	00855826 	xor	t3,a0,a1
bfc05c58:	38ac4002 	xori	t4,a1,0x4002
bfc05c5c:	000c5042 	srl	t2,t4,0x1
bfc05c60:	31690001 	andi	t1,t3,0x1
bfc05c64:	00042042 	srl	a0,a0,0x1
bfc05c68:	35468000 	ori	a2,t2,0x8000
bfc05c6c:	1120ff78 	beqz	t1,bfc05a50 <crcu16+0x50>
bfc05c70:	00051042 	srl	v0,a1,0x1
bfc05c74:	00c02821 	move	a1,a2
bfc05c78:	00857826 	xor	t7,a0,a1
bfc05c7c:	38b84002 	xori	t8,a1,0x4002
bfc05c80:	00187042 	srl	t6,t8,0x1
bfc05c84:	31ed0001 	andi	t5,t7,0x1
bfc05c88:	00042042 	srl	a0,a0,0x1
bfc05c8c:	35c68000 	ori	a2,t6,0x8000
bfc05c90:	11a0ff78 	beqz	t5,bfc05a74 <crcu16+0x74>
bfc05c94:	00051042 	srl	v0,a1,0x1
bfc05c98:	00c02821 	move	a1,a2
bfc05c9c:	00851826 	xor	v1,a0,a1
bfc05ca0:	38a64002 	xori	a2,a1,0x4002
bfc05ca4:	00061042 	srl	v0,a2,0x1
bfc05ca8:	30790001 	andi	t9,v1,0x1
bfc05cac:	34468000 	ori	a2,v0,0x8000
bfc05cb0:	00042042 	srl	a0,a0,0x1
bfc05cb4:	1320ff78 	beqz	t9,bfc05a98 <crcu16+0x98>
bfc05cb8:	00051042 	srl	v0,a1,0x1
bfc05cbc:	00c02821 	move	a1,a2
bfc05cc0:	00855026 	xor	t2,a0,a1
bfc05cc4:	38ab4002 	xori	t3,a1,0x4002
bfc05cc8:	000b4842 	srl	t1,t3,0x1
bfc05ccc:	31480001 	andi	t0,t2,0x1
bfc05cd0:	00042042 	srl	a0,a0,0x1
bfc05cd4:	35268000 	ori	a2,t1,0x8000
bfc05cd8:	1100ff78 	beqz	t0,bfc05abc <crcu16+0xbc>
bfc05cdc:	00051042 	srl	v0,a1,0x1
bfc05ce0:	00c02821 	move	a1,a2
bfc05ce4:	00857026 	xor	t6,a0,a1
bfc05ce8:	38af4002 	xori	t7,a1,0x4002
bfc05cec:	000f6842 	srl	t5,t7,0x1
bfc05cf0:	31cc0001 	andi	t4,t6,0x1
bfc05cf4:	00042042 	srl	a0,a0,0x1
bfc05cf8:	35a68000 	ori	a2,t5,0x8000
bfc05cfc:	1180ff78 	beqz	t4,bfc05ae0 <crcu16+0xe0>
bfc05d00:	00051042 	srl	v0,a1,0x1
bfc05d04:	00c02821 	move	a1,a2
bfc05d08:	38a24002 	xori	v0,a1,0x4002
bfc05d0c:	00851826 	xor	v1,a0,a1
bfc05d10:	0002c842 	srl	t9,v0,0x1
bfc05d14:	30780001 	andi	t8,v1,0x1
bfc05d18:	37268000 	ori	a2,t9,0x8000
bfc05d1c:	1300ff78 	beqz	t8,bfc05b00 <crcu16+0x100>
bfc05d20:	00051042 	srl	v0,a1,0x1
bfc05d24:	00c02821 	move	a1,a2
bfc05d28:	38a64002 	xori	a2,a1,0x4002
bfc05d2c:	00064842 	srl	t1,a2,0x1
bfc05d30:	00042042 	srl	a0,a0,0x1
bfc05d34:	30a80001 	andi	t0,a1,0x1
bfc05d38:	35268000 	ori	a2,t1,0x8000
bfc05d3c:	1104ff78 	beq	t0,a0,bfc05b20 <crcu16+0x120>
bfc05d40:	00051042 	srl	v0,a1,0x1
bfc05d44:	00c02821 	move	a1,a2
bfc05d48:	00075a02 	srl	t3,a3,0x8
bfc05d4c:	01656026 	xor	t4,t3,a1
bfc05d50:	38ad4002 	xori	t5,a1,0x4002
bfc05d54:	000d5042 	srl	t2,t5,0x1
bfc05d58:	31870001 	andi	a3,t4,0x1
bfc05d5c:	000b2042 	srl	a0,t3,0x1
bfc05d60:	35468000 	ori	a2,t2,0x8000
bfc05d64:	10e0ff78 	beqz	a3,bfc05b48 <crcu16+0x148>
bfc05d68:	00051042 	srl	v0,a1,0x1
bfc05d6c:	00c02821 	move	a1,a2
bfc05d70:	0085c026 	xor	t8,a0,a1
bfc05d74:	38b94002 	xori	t9,a1,0x4002
bfc05d78:	00197842 	srl	t7,t9,0x1
bfc05d7c:	330e0001 	andi	t6,t8,0x1
bfc05d80:	00042042 	srl	a0,a0,0x1
bfc05d84:	35e68000 	ori	a2,t7,0x8000
bfc05d88:	11c0ff78 	beqz	t6,bfc05b6c <crcu16+0x16c>
bfc05d8c:	00051042 	srl	v0,a1,0x1
bfc05d90:	00c02821 	move	a1,a2
bfc05d94:	00854026 	xor	t0,a0,a1
bfc05d98:	38a94002 	xori	t1,a1,0x4002
bfc05d9c:	00091042 	srl	v0,t1,0x1
bfc05da0:	31030001 	andi	v1,t0,0x1
bfc05da4:	34468000 	ori	a2,v0,0x8000
bfc05da8:	00042042 	srl	a0,a0,0x1
bfc05dac:	1060ff78 	beqz	v1,bfc05b90 <crcu16+0x190>
bfc05db0:	00051042 	srl	v0,a1,0x1
bfc05db4:	00c02821 	move	a1,a2
bfc05db8:	00853026 	xor	a2,a0,a1
bfc05dbc:	38ab4002 	xori	t3,a1,0x4002
bfc05dc0:	000b5042 	srl	t2,t3,0x1
bfc05dc4:	30c70001 	andi	a3,a2,0x1
bfc05dc8:	00042042 	srl	a0,a0,0x1
bfc05dcc:	35468000 	ori	a2,t2,0x8000
bfc05dd0:	10e0ff78 	beqz	a3,bfc05bb4 <crcu16+0x1b4>
bfc05dd4:	00051042 	srl	v0,a1,0x1
bfc05dd8:	00c02821 	move	a1,a2
bfc05ddc:	00857026 	xor	t6,a0,a1
bfc05de0:	38af4002 	xori	t7,a1,0x4002
bfc05de4:	000f6842 	srl	t5,t7,0x1
bfc05de8:	31cc0001 	andi	t4,t6,0x1
bfc05dec:	00042042 	srl	a0,a0,0x1
bfc05df0:	35a68000 	ori	a2,t5,0x8000
bfc05df4:	1180ff78 	beqz	t4,bfc05bd8 <crcu16+0x1d8>
bfc05df8:	00051042 	srl	v0,a1,0x1
bfc05dfc:	00c02821 	move	a1,a2
bfc05e00:	00851826 	xor	v1,a0,a1
bfc05e04:	38a24002 	xori	v0,a1,0x4002
bfc05e08:	0002c842 	srl	t9,v0,0x1
bfc05e0c:	30780001 	andi	t8,v1,0x1
bfc05e10:	00042042 	srl	a0,a0,0x1
bfc05e14:	37268000 	ori	a2,t9,0x8000
bfc05e18:	1300ff78 	beqz	t8,bfc05bfc <crcu16+0x1fc>
bfc05e1c:	00051042 	srl	v0,a1,0x1
bfc05e20:	00c02821 	move	a1,a2
bfc05e24:	00853826 	xor	a3,a0,a1
bfc05e28:	38aa4002 	xori	t2,a1,0x4002
bfc05e2c:	000a4842 	srl	t1,t2,0x1
bfc05e30:	30e80001 	andi	t0,a3,0x1
bfc05e34:	35268000 	ori	a2,t1,0x8000
bfc05e38:	1100ff78 	beqz	t0,bfc05c1c <crcu16+0x21c>
bfc05e3c:	00051042 	srl	v0,a1,0x1
bfc05e40:	00c02821 	move	a1,a2
bfc05e44:	38a64002 	xori	a2,a1,0x4002
bfc05e48:	00066042 	srl	t4,a2,0x1
bfc05e4c:	00042042 	srl	a0,a0,0x1
bfc05e50:	30ab0001 	andi	t3,a1,0x1
bfc05e54:	35868000 	ori	a2,t4,0x8000
bfc05e58:	1164ff78 	beq	t3,a0,bfc05c3c <crcu16+0x23c>
bfc05e5c:	00051042 	srl	v0,a1,0x1
bfc05e60:	00c01021 	move	v0,a2
bfc05e64:	03e00008 	jr	ra
bfc05e68:	3042ffff 	andi	v0,v0,0xffff
bfc05e6c:	00000000 	nop

bfc05e70 <crc16>:
crc16():
bfc05e70:	3087ffff 	andi	a3,a0,0xffff
bfc05e74:	30a5ffff 	andi	a1,a1,0xffff
bfc05e78:	30e400ff 	andi	a0,a3,0xff
bfc05e7c:	00a43026 	xor	a2,a1,a0
bfc05e80:	38a84002 	xori	t0,a1,0x4002
bfc05e84:	00081042 	srl	v0,t0,0x1
bfc05e88:	30c30001 	andi	v1,a2,0x1
bfc05e8c:	00042042 	srl	a0,a0,0x1
bfc05e90:	34468000 	ori	a2,v0,0x8000
bfc05e94:	1460008a 	bnez	v1,bfc060c0 <crc16+0x250>
bfc05e98:	00051042 	srl	v0,a1,0x1
bfc05e9c:	00402821 	move	a1,v0
bfc05ea0:	00855826 	xor	t3,a0,a1
bfc05ea4:	38ac4002 	xori	t4,a1,0x4002
bfc05ea8:	000c5042 	srl	t2,t4,0x1
bfc05eac:	31690001 	andi	t1,t3,0x1
bfc05eb0:	00042042 	srl	a0,a0,0x1
bfc05eb4:	35468000 	ori	a2,t2,0x8000
bfc05eb8:	1520008a 	bnez	t1,bfc060e4 <crc16+0x274>
bfc05ebc:	00051042 	srl	v0,a1,0x1
bfc05ec0:	00402821 	move	a1,v0
bfc05ec4:	00857826 	xor	t7,a0,a1
bfc05ec8:	38b84002 	xori	t8,a1,0x4002
bfc05ecc:	00187042 	srl	t6,t8,0x1
bfc05ed0:	31ed0001 	andi	t5,t7,0x1
bfc05ed4:	00042042 	srl	a0,a0,0x1
bfc05ed8:	35c68000 	ori	a2,t6,0x8000
bfc05edc:	15a0008a 	bnez	t5,bfc06108 <crc16+0x298>
bfc05ee0:	00051042 	srl	v0,a1,0x1
bfc05ee4:	00402821 	move	a1,v0
bfc05ee8:	00851826 	xor	v1,a0,a1
bfc05eec:	38a64002 	xori	a2,a1,0x4002
bfc05ef0:	00061042 	srl	v0,a2,0x1
bfc05ef4:	30790001 	andi	t9,v1,0x1
bfc05ef8:	34468000 	ori	a2,v0,0x8000
bfc05efc:	00042042 	srl	a0,a0,0x1
bfc05f00:	1720008a 	bnez	t9,bfc0612c <crc16+0x2bc>
bfc05f04:	00051042 	srl	v0,a1,0x1
bfc05f08:	00402821 	move	a1,v0
bfc05f0c:	00855026 	xor	t2,a0,a1
bfc05f10:	38ab4002 	xori	t3,a1,0x4002
bfc05f14:	000b4842 	srl	t1,t3,0x1
bfc05f18:	31480001 	andi	t0,t2,0x1
bfc05f1c:	00042042 	srl	a0,a0,0x1
bfc05f20:	35268000 	ori	a2,t1,0x8000
bfc05f24:	1500008a 	bnez	t0,bfc06150 <crc16+0x2e0>
bfc05f28:	00051042 	srl	v0,a1,0x1
bfc05f2c:	00402821 	move	a1,v0
bfc05f30:	00857026 	xor	t6,a0,a1
bfc05f34:	38af4002 	xori	t7,a1,0x4002
bfc05f38:	000f6842 	srl	t5,t7,0x1
bfc05f3c:	31cc0001 	andi	t4,t6,0x1
bfc05f40:	00042042 	srl	a0,a0,0x1
bfc05f44:	35a68000 	ori	a2,t5,0x8000
bfc05f48:	1580008a 	bnez	t4,bfc06174 <crc16+0x304>
bfc05f4c:	00051042 	srl	v0,a1,0x1
bfc05f50:	00402821 	move	a1,v0
bfc05f54:	38a24002 	xori	v0,a1,0x4002
bfc05f58:	00851826 	xor	v1,a0,a1
bfc05f5c:	0002c842 	srl	t9,v0,0x1
bfc05f60:	30780001 	andi	t8,v1,0x1
bfc05f64:	37268000 	ori	a2,t9,0x8000
bfc05f68:	1700008a 	bnez	t8,bfc06194 <crc16+0x324>
bfc05f6c:	00051042 	srl	v0,a1,0x1
bfc05f70:	00402821 	move	a1,v0
bfc05f74:	38a64002 	xori	a2,a1,0x4002
bfc05f78:	00064842 	srl	t1,a2,0x1
bfc05f7c:	00042042 	srl	a0,a0,0x1
bfc05f80:	30a80001 	andi	t0,a1,0x1
bfc05f84:	35268000 	ori	a2,t1,0x8000
bfc05f88:	1504008a 	bne	t0,a0,bfc061b4 <crc16+0x344>
bfc05f8c:	00051042 	srl	v0,a1,0x1
bfc05f90:	00402821 	move	a1,v0
bfc05f94:	00075a02 	srl	t3,a3,0x8
bfc05f98:	01656026 	xor	t4,t3,a1
bfc05f9c:	38ad4002 	xori	t5,a1,0x4002
bfc05fa0:	000d5042 	srl	t2,t5,0x1
bfc05fa4:	31870001 	andi	a3,t4,0x1
bfc05fa8:	000b2042 	srl	a0,t3,0x1
bfc05fac:	35468000 	ori	a2,t2,0x8000
bfc05fb0:	14e0008a 	bnez	a3,bfc061dc <crc16+0x36c>
bfc05fb4:	00051042 	srl	v0,a1,0x1
bfc05fb8:	00402821 	move	a1,v0
bfc05fbc:	0085c026 	xor	t8,a0,a1
bfc05fc0:	38b94002 	xori	t9,a1,0x4002
bfc05fc4:	00197842 	srl	t7,t9,0x1
bfc05fc8:	330e0001 	andi	t6,t8,0x1
bfc05fcc:	00042042 	srl	a0,a0,0x1
bfc05fd0:	35e68000 	ori	a2,t7,0x8000
bfc05fd4:	15c0008a 	bnez	t6,bfc06200 <crc16+0x390>
bfc05fd8:	00051042 	srl	v0,a1,0x1
bfc05fdc:	00402821 	move	a1,v0
bfc05fe0:	00854026 	xor	t0,a0,a1
bfc05fe4:	38a94002 	xori	t1,a1,0x4002
bfc05fe8:	00091042 	srl	v0,t1,0x1
bfc05fec:	31030001 	andi	v1,t0,0x1
bfc05ff0:	34468000 	ori	a2,v0,0x8000
bfc05ff4:	00042042 	srl	a0,a0,0x1
bfc05ff8:	1460008a 	bnez	v1,bfc06224 <crc16+0x3b4>
bfc05ffc:	00051042 	srl	v0,a1,0x1
bfc06000:	00402821 	move	a1,v0
bfc06004:	00853026 	xor	a2,a0,a1
bfc06008:	38ab4002 	xori	t3,a1,0x4002
bfc0600c:	000b5042 	srl	t2,t3,0x1
bfc06010:	30c70001 	andi	a3,a2,0x1
bfc06014:	00042042 	srl	a0,a0,0x1
bfc06018:	35468000 	ori	a2,t2,0x8000
bfc0601c:	14e0008a 	bnez	a3,bfc06248 <crc16+0x3d8>
bfc06020:	00051042 	srl	v0,a1,0x1
bfc06024:	00402821 	move	a1,v0
bfc06028:	00857026 	xor	t6,a0,a1
bfc0602c:	38af4002 	xori	t7,a1,0x4002
bfc06030:	000f6842 	srl	t5,t7,0x1
bfc06034:	31cc0001 	andi	t4,t6,0x1
bfc06038:	00042042 	srl	a0,a0,0x1
bfc0603c:	35a68000 	ori	a2,t5,0x8000
bfc06040:	1580008a 	bnez	t4,bfc0626c <crc16+0x3fc>
bfc06044:	00051042 	srl	v0,a1,0x1
bfc06048:	00402821 	move	a1,v0
bfc0604c:	00851826 	xor	v1,a0,a1
bfc06050:	38a24002 	xori	v0,a1,0x4002
bfc06054:	0002c842 	srl	t9,v0,0x1
bfc06058:	30780001 	andi	t8,v1,0x1
bfc0605c:	00042042 	srl	a0,a0,0x1
bfc06060:	37268000 	ori	a2,t9,0x8000
bfc06064:	1700008a 	bnez	t8,bfc06290 <crc16+0x420>
bfc06068:	00051042 	srl	v0,a1,0x1
bfc0606c:	00402821 	move	a1,v0
bfc06070:	00853826 	xor	a3,a0,a1
bfc06074:	38aa4002 	xori	t2,a1,0x4002
bfc06078:	000a4842 	srl	t1,t2,0x1
bfc0607c:	30e80001 	andi	t0,a3,0x1
bfc06080:	35268000 	ori	a2,t1,0x8000
bfc06084:	1500008a 	bnez	t0,bfc062b0 <crc16+0x440>
bfc06088:	00051042 	srl	v0,a1,0x1
bfc0608c:	00402821 	move	a1,v0
bfc06090:	38a64002 	xori	a2,a1,0x4002
bfc06094:	00066042 	srl	t4,a2,0x1
bfc06098:	00042042 	srl	a0,a0,0x1
bfc0609c:	30ab0001 	andi	t3,a1,0x1
bfc060a0:	35868000 	ori	a2,t4,0x8000
bfc060a4:	1564008a 	bne	t3,a0,bfc062d0 <crc16+0x460>
bfc060a8:	00051042 	srl	v0,a1,0x1
bfc060ac:	03e00008 	jr	ra
bfc060b0:	3042ffff 	andi	v0,v0,0xffff
	...
bfc060c0:	00c02821 	move	a1,a2
bfc060c4:	00855826 	xor	t3,a0,a1
bfc060c8:	38ac4002 	xori	t4,a1,0x4002
bfc060cc:	000c5042 	srl	t2,t4,0x1
bfc060d0:	31690001 	andi	t1,t3,0x1
bfc060d4:	00042042 	srl	a0,a0,0x1
bfc060d8:	35468000 	ori	a2,t2,0x8000
bfc060dc:	1120ff78 	beqz	t1,bfc05ec0 <crc16+0x50>
bfc060e0:	00051042 	srl	v0,a1,0x1
bfc060e4:	00c02821 	move	a1,a2
bfc060e8:	00857826 	xor	t7,a0,a1
bfc060ec:	38b84002 	xori	t8,a1,0x4002
bfc060f0:	00187042 	srl	t6,t8,0x1
bfc060f4:	31ed0001 	andi	t5,t7,0x1
bfc060f8:	00042042 	srl	a0,a0,0x1
bfc060fc:	35c68000 	ori	a2,t6,0x8000
bfc06100:	11a0ff78 	beqz	t5,bfc05ee4 <crc16+0x74>
bfc06104:	00051042 	srl	v0,a1,0x1
bfc06108:	00c02821 	move	a1,a2
bfc0610c:	00851826 	xor	v1,a0,a1
bfc06110:	38a64002 	xori	a2,a1,0x4002
bfc06114:	00061042 	srl	v0,a2,0x1
bfc06118:	30790001 	andi	t9,v1,0x1
bfc0611c:	34468000 	ori	a2,v0,0x8000
bfc06120:	00042042 	srl	a0,a0,0x1
bfc06124:	1320ff78 	beqz	t9,bfc05f08 <crc16+0x98>
bfc06128:	00051042 	srl	v0,a1,0x1
bfc0612c:	00c02821 	move	a1,a2
bfc06130:	00855026 	xor	t2,a0,a1
bfc06134:	38ab4002 	xori	t3,a1,0x4002
bfc06138:	000b4842 	srl	t1,t3,0x1
bfc0613c:	31480001 	andi	t0,t2,0x1
bfc06140:	00042042 	srl	a0,a0,0x1
bfc06144:	35268000 	ori	a2,t1,0x8000
bfc06148:	1100ff78 	beqz	t0,bfc05f2c <crc16+0xbc>
bfc0614c:	00051042 	srl	v0,a1,0x1
bfc06150:	00c02821 	move	a1,a2
bfc06154:	00857026 	xor	t6,a0,a1
bfc06158:	38af4002 	xori	t7,a1,0x4002
bfc0615c:	000f6842 	srl	t5,t7,0x1
bfc06160:	31cc0001 	andi	t4,t6,0x1
bfc06164:	00042042 	srl	a0,a0,0x1
bfc06168:	35a68000 	ori	a2,t5,0x8000
bfc0616c:	1180ff78 	beqz	t4,bfc05f50 <crc16+0xe0>
bfc06170:	00051042 	srl	v0,a1,0x1
bfc06174:	00c02821 	move	a1,a2
bfc06178:	38a24002 	xori	v0,a1,0x4002
bfc0617c:	00851826 	xor	v1,a0,a1
bfc06180:	0002c842 	srl	t9,v0,0x1
bfc06184:	30780001 	andi	t8,v1,0x1
bfc06188:	37268000 	ori	a2,t9,0x8000
bfc0618c:	1300ff78 	beqz	t8,bfc05f70 <crc16+0x100>
bfc06190:	00051042 	srl	v0,a1,0x1
bfc06194:	00c02821 	move	a1,a2
bfc06198:	38a64002 	xori	a2,a1,0x4002
bfc0619c:	00064842 	srl	t1,a2,0x1
bfc061a0:	00042042 	srl	a0,a0,0x1
bfc061a4:	30a80001 	andi	t0,a1,0x1
bfc061a8:	35268000 	ori	a2,t1,0x8000
bfc061ac:	1104ff78 	beq	t0,a0,bfc05f90 <crc16+0x120>
bfc061b0:	00051042 	srl	v0,a1,0x1
bfc061b4:	00c02821 	move	a1,a2
bfc061b8:	00075a02 	srl	t3,a3,0x8
bfc061bc:	01656026 	xor	t4,t3,a1
bfc061c0:	38ad4002 	xori	t5,a1,0x4002
bfc061c4:	000d5042 	srl	t2,t5,0x1
bfc061c8:	31870001 	andi	a3,t4,0x1
bfc061cc:	000b2042 	srl	a0,t3,0x1
bfc061d0:	35468000 	ori	a2,t2,0x8000
bfc061d4:	10e0ff78 	beqz	a3,bfc05fb8 <crc16+0x148>
bfc061d8:	00051042 	srl	v0,a1,0x1
bfc061dc:	00c02821 	move	a1,a2
bfc061e0:	0085c026 	xor	t8,a0,a1
bfc061e4:	38b94002 	xori	t9,a1,0x4002
bfc061e8:	00197842 	srl	t7,t9,0x1
bfc061ec:	330e0001 	andi	t6,t8,0x1
bfc061f0:	00042042 	srl	a0,a0,0x1
bfc061f4:	35e68000 	ori	a2,t7,0x8000
bfc061f8:	11c0ff78 	beqz	t6,bfc05fdc <crc16+0x16c>
bfc061fc:	00051042 	srl	v0,a1,0x1
bfc06200:	00c02821 	move	a1,a2
bfc06204:	00854026 	xor	t0,a0,a1
bfc06208:	38a94002 	xori	t1,a1,0x4002
bfc0620c:	00091042 	srl	v0,t1,0x1
bfc06210:	31030001 	andi	v1,t0,0x1
bfc06214:	34468000 	ori	a2,v0,0x8000
bfc06218:	00042042 	srl	a0,a0,0x1
bfc0621c:	1060ff78 	beqz	v1,bfc06000 <crc16+0x190>
bfc06220:	00051042 	srl	v0,a1,0x1
bfc06224:	00c02821 	move	a1,a2
bfc06228:	00853026 	xor	a2,a0,a1
bfc0622c:	38ab4002 	xori	t3,a1,0x4002
bfc06230:	000b5042 	srl	t2,t3,0x1
bfc06234:	30c70001 	andi	a3,a2,0x1
bfc06238:	00042042 	srl	a0,a0,0x1
bfc0623c:	35468000 	ori	a2,t2,0x8000
bfc06240:	10e0ff78 	beqz	a3,bfc06024 <crc16+0x1b4>
bfc06244:	00051042 	srl	v0,a1,0x1
bfc06248:	00c02821 	move	a1,a2
bfc0624c:	00857026 	xor	t6,a0,a1
bfc06250:	38af4002 	xori	t7,a1,0x4002
bfc06254:	000f6842 	srl	t5,t7,0x1
bfc06258:	31cc0001 	andi	t4,t6,0x1
bfc0625c:	00042042 	srl	a0,a0,0x1
bfc06260:	35a68000 	ori	a2,t5,0x8000
bfc06264:	1180ff78 	beqz	t4,bfc06048 <crc16+0x1d8>
bfc06268:	00051042 	srl	v0,a1,0x1
bfc0626c:	00c02821 	move	a1,a2
bfc06270:	00851826 	xor	v1,a0,a1
bfc06274:	38a24002 	xori	v0,a1,0x4002
bfc06278:	0002c842 	srl	t9,v0,0x1
bfc0627c:	30780001 	andi	t8,v1,0x1
bfc06280:	00042042 	srl	a0,a0,0x1
bfc06284:	37268000 	ori	a2,t9,0x8000
bfc06288:	1300ff78 	beqz	t8,bfc0606c <crc16+0x1fc>
bfc0628c:	00051042 	srl	v0,a1,0x1
bfc06290:	00c02821 	move	a1,a2
bfc06294:	00853826 	xor	a3,a0,a1
bfc06298:	38aa4002 	xori	t2,a1,0x4002
bfc0629c:	000a4842 	srl	t1,t2,0x1
bfc062a0:	30e80001 	andi	t0,a3,0x1
bfc062a4:	35268000 	ori	a2,t1,0x8000
bfc062a8:	1100ff78 	beqz	t0,bfc0608c <crc16+0x21c>
bfc062ac:	00051042 	srl	v0,a1,0x1
bfc062b0:	00c02821 	move	a1,a2
bfc062b4:	38a64002 	xori	a2,a1,0x4002
bfc062b8:	00066042 	srl	t4,a2,0x1
bfc062bc:	00042042 	srl	a0,a0,0x1
bfc062c0:	30ab0001 	andi	t3,a1,0x1
bfc062c4:	35868000 	ori	a2,t4,0x8000
bfc062c8:	1164ff78 	beq	t3,a0,bfc060ac <crc16+0x23c>
bfc062cc:	00051042 	srl	v0,a1,0x1
bfc062d0:	00c01021 	move	v0,a2
bfc062d4:	03e00008 	jr	ra
bfc062d8:	3042ffff 	andi	v0,v0,0xffff
bfc062dc:	00000000 	nop

bfc062e0 <crcu32>:
crcu32():
bfc062e0:	3087ffff 	andi	a3,a0,0xffff
bfc062e4:	30a5ffff 	andi	a1,a1,0xffff
bfc062e8:	00804021 	move	t0,a0
bfc062ec:	30e400ff 	andi	a0,a3,0xff
bfc062f0:	00a43026 	xor	a2,a1,a0
bfc062f4:	38a94002 	xori	t1,a1,0x4002
bfc062f8:	00091042 	srl	v0,t1,0x1
bfc062fc:	30c30001 	andi	v1,a2,0x1
bfc06300:	00042042 	srl	a0,a0,0x1
bfc06304:	34468000 	ori	a2,v0,0x8000
bfc06308:	14600119 	bnez	v1,bfc06770 <crcu32+0x490>
bfc0630c:	00051042 	srl	v0,a1,0x1
bfc06310:	00402821 	move	a1,v0
bfc06314:	00856026 	xor	t4,a0,a1
bfc06318:	38ad4002 	xori	t5,a1,0x4002
bfc0631c:	000d5842 	srl	t3,t5,0x1
bfc06320:	318a0001 	andi	t2,t4,0x1
bfc06324:	00042042 	srl	a0,a0,0x1
bfc06328:	35668000 	ori	a2,t3,0x8000
bfc0632c:	15400119 	bnez	t2,bfc06794 <crcu32+0x4b4>
bfc06330:	00051042 	srl	v0,a1,0x1
bfc06334:	00402821 	move	a1,v0
bfc06338:	0085c026 	xor	t8,a0,a1
bfc0633c:	38b94002 	xori	t9,a1,0x4002
bfc06340:	00197842 	srl	t7,t9,0x1
bfc06344:	330e0001 	andi	t6,t8,0x1
bfc06348:	00042042 	srl	a0,a0,0x1
bfc0634c:	35e68000 	ori	a2,t7,0x8000
bfc06350:	15c00119 	bnez	t6,bfc067b8 <crcu32+0x4d8>
bfc06354:	00051042 	srl	v0,a1,0x1
bfc06358:	00402821 	move	a1,v0
bfc0635c:	00853026 	xor	a2,a0,a1
bfc06360:	38a94002 	xori	t1,a1,0x4002
bfc06364:	00091042 	srl	v0,t1,0x1
bfc06368:	30c30001 	andi	v1,a2,0x1
bfc0636c:	00042042 	srl	a0,a0,0x1
bfc06370:	34468000 	ori	a2,v0,0x8000
bfc06374:	14600119 	bnez	v1,bfc067dc <crcu32+0x4fc>
bfc06378:	00051042 	srl	v0,a1,0x1
bfc0637c:	00402821 	move	a1,v0
bfc06380:	00856026 	xor	t4,a0,a1
bfc06384:	38ad4002 	xori	t5,a1,0x4002
bfc06388:	000d5842 	srl	t3,t5,0x1
bfc0638c:	318a0001 	andi	t2,t4,0x1
bfc06390:	00042042 	srl	a0,a0,0x1
bfc06394:	35668000 	ori	a2,t3,0x8000
bfc06398:	15400119 	bnez	t2,bfc06800 <crcu32+0x520>
bfc0639c:	00051042 	srl	v0,a1,0x1
bfc063a0:	00402821 	move	a1,v0
bfc063a4:	0085c026 	xor	t8,a0,a1
bfc063a8:	38b94002 	xori	t9,a1,0x4002
bfc063ac:	00197842 	srl	t7,t9,0x1
bfc063b0:	330e0001 	andi	t6,t8,0x1
bfc063b4:	00042042 	srl	a0,a0,0x1
bfc063b8:	35e68000 	ori	a2,t7,0x8000
bfc063bc:	15c00119 	bnez	t6,bfc06824 <crcu32+0x544>
bfc063c0:	00051042 	srl	v0,a1,0x1
bfc063c4:	00402821 	move	a1,v0
bfc063c8:	00853026 	xor	a2,a0,a1
bfc063cc:	38a94002 	xori	t1,a1,0x4002
bfc063d0:	00091042 	srl	v0,t1,0x1
bfc063d4:	30c30001 	andi	v1,a2,0x1
bfc063d8:	34468000 	ori	a2,v0,0x8000
bfc063dc:	14600119 	bnez	v1,bfc06844 <crcu32+0x564>
bfc063e0:	00051042 	srl	v0,a1,0x1
bfc063e4:	00402821 	move	a1,v0
bfc063e8:	38ac4002 	xori	t4,a1,0x4002
bfc063ec:	000c5842 	srl	t3,t4,0x1
bfc063f0:	00042042 	srl	a0,a0,0x1
bfc063f4:	30aa0001 	andi	t2,a1,0x1
bfc063f8:	35668000 	ori	a2,t3,0x8000
bfc063fc:	15440119 	bne	t2,a0,bfc06864 <crcu32+0x584>
bfc06400:	00051042 	srl	v0,a1,0x1
bfc06404:	00402821 	move	a1,v0
bfc06408:	00077202 	srl	t6,a3,0x8
bfc0640c:	01c57826 	xor	t7,t6,a1
bfc06410:	38b84002 	xori	t8,a1,0x4002
bfc06414:	00186842 	srl	t5,t8,0x1
bfc06418:	31e70001 	andi	a3,t7,0x1
bfc0641c:	000e2042 	srl	a0,t6,0x1
bfc06420:	35a68000 	ori	a2,t5,0x8000
bfc06424:	14e00119 	bnez	a3,bfc0688c <crcu32+0x5ac>
bfc06428:	00051042 	srl	v0,a1,0x1
bfc0642c:	00402821 	move	a1,v0
bfc06430:	00851826 	xor	v1,a0,a1
bfc06434:	38a64002 	xori	a2,a1,0x4002
bfc06438:	00061042 	srl	v0,a2,0x1
bfc0643c:	30790001 	andi	t9,v1,0x1
bfc06440:	34468000 	ori	a2,v0,0x8000
bfc06444:	00042042 	srl	a0,a0,0x1
bfc06448:	17200119 	bnez	t9,bfc068b0 <crcu32+0x5d0>
bfc0644c:	00051042 	srl	v0,a1,0x1
bfc06450:	00402821 	move	a1,v0
bfc06454:	00855826 	xor	t3,a0,a1
bfc06458:	38ac4002 	xori	t4,a1,0x4002
bfc0645c:	000c5042 	srl	t2,t4,0x1
bfc06460:	31690001 	andi	t1,t3,0x1
bfc06464:	00042042 	srl	a0,a0,0x1
bfc06468:	35468000 	ori	a2,t2,0x8000
bfc0646c:	15200119 	bnez	t1,bfc068d4 <crcu32+0x5f4>
bfc06470:	00051042 	srl	v0,a1,0x1
bfc06474:	00402821 	move	a1,v0
bfc06478:	00857026 	xor	t6,a0,a1
bfc0647c:	38af4002 	xori	t7,a1,0x4002
bfc06480:	000f6842 	srl	t5,t7,0x1
bfc06484:	31c70001 	andi	a3,t6,0x1
bfc06488:	00042042 	srl	a0,a0,0x1
bfc0648c:	35a68000 	ori	a2,t5,0x8000
bfc06490:	14e00119 	bnez	a3,bfc068f8 <crcu32+0x618>
bfc06494:	00051042 	srl	v0,a1,0x1
bfc06498:	00402821 	move	a1,v0
bfc0649c:	00851826 	xor	v1,a0,a1
bfc064a0:	38a24002 	xori	v0,a1,0x4002
bfc064a4:	0002c842 	srl	t9,v0,0x1
bfc064a8:	30780001 	andi	t8,v1,0x1
bfc064ac:	00042042 	srl	a0,a0,0x1
bfc064b0:	37268000 	ori	a2,t9,0x8000
bfc064b4:	17000119 	bnez	t8,bfc0691c <crcu32+0x63c>
bfc064b8:	00051042 	srl	v0,a1,0x1
bfc064bc:	00402821 	move	a1,v0
bfc064c0:	00853026 	xor	a2,a0,a1
bfc064c4:	38ab4002 	xori	t3,a1,0x4002
bfc064c8:	000b5042 	srl	t2,t3,0x1
bfc064cc:	30c90001 	andi	t1,a2,0x1
bfc064d0:	00042042 	srl	a0,a0,0x1
bfc064d4:	35468000 	ori	a2,t2,0x8000
bfc064d8:	15200119 	bnez	t1,bfc06940 <crcu32+0x660>
bfc064dc:	00051042 	srl	v0,a1,0x1
bfc064e0:	00402821 	move	a1,v0
bfc064e4:	00856826 	xor	t5,a0,a1
bfc064e8:	38ae4002 	xori	t6,a1,0x4002
bfc064ec:	000e3842 	srl	a3,t6,0x1
bfc064f0:	31ac0001 	andi	t4,t5,0x1
bfc064f4:	34e68000 	ori	a2,a3,0x8000
bfc064f8:	15800119 	bnez	t4,bfc06960 <crcu32+0x680>
bfc064fc:	00051042 	srl	v0,a1,0x1
bfc06500:	00402821 	move	a1,v0
bfc06504:	38b94002 	xori	t9,a1,0x4002
bfc06508:	0019c042 	srl	t8,t9,0x1
bfc0650c:	00042042 	srl	a0,a0,0x1
bfc06510:	30af0001 	andi	t7,a1,0x1
bfc06514:	37068000 	ori	a2,t8,0x8000
bfc06518:	15e40119 	bne	t7,a0,bfc06980 <crcu32+0x6a0>
bfc0651c:	00051042 	srl	v0,a1,0x1
bfc06520:	00083c02 	srl	a3,t0,0x10
bfc06524:	00402821 	move	a1,v0
bfc06528:	30e900ff 	andi	t1,a3,0xff
bfc0652c:	01251826 	xor	v1,t1,a1
bfc06530:	38aa4002 	xori	t2,a1,0x4002
bfc06534:	000a1042 	srl	v0,t2,0x1
bfc06538:	30680001 	andi	t0,v1,0x1
bfc0653c:	34468000 	ori	a2,v0,0x8000
bfc06540:	00092042 	srl	a0,t1,0x1
bfc06544:	15000119 	bnez	t0,bfc069ac <crcu32+0x6cc>
bfc06548:	00051042 	srl	v0,a1,0x1
bfc0654c:	00402821 	move	a1,v0
bfc06550:	00853026 	xor	a2,a0,a1
bfc06554:	38ad4002 	xori	t5,a1,0x4002
bfc06558:	000d6042 	srl	t4,t5,0x1
bfc0655c:	30cb0001 	andi	t3,a2,0x1
bfc06560:	00042042 	srl	a0,a0,0x1
bfc06564:	35868000 	ori	a2,t4,0x8000
bfc06568:	15600119 	bnez	t3,bfc069d0 <crcu32+0x6f0>
bfc0656c:	00051042 	srl	v0,a1,0x1
bfc06570:	00402821 	move	a1,v0
bfc06574:	0085c026 	xor	t8,a0,a1
bfc06578:	38b94002 	xori	t9,a1,0x4002
bfc0657c:	00197842 	srl	t7,t9,0x1
bfc06580:	330e0001 	andi	t6,t8,0x1
bfc06584:	00042042 	srl	a0,a0,0x1
bfc06588:	35e68000 	ori	a2,t7,0x8000
bfc0658c:	15c00119 	bnez	t6,bfc069f4 <crcu32+0x714>
bfc06590:	00051042 	srl	v0,a1,0x1
bfc06594:	00402821 	move	a1,v0
bfc06598:	00854826 	xor	t1,a0,a1
bfc0659c:	38a34002 	xori	v1,a1,0x4002
bfc065a0:	00031042 	srl	v0,v1,0x1
bfc065a4:	31280001 	andi	t0,t1,0x1
bfc065a8:	34468000 	ori	a2,v0,0x8000
bfc065ac:	00042042 	srl	a0,a0,0x1
bfc065b0:	15000119 	bnez	t0,bfc06a18 <crcu32+0x738>
bfc065b4:	00051042 	srl	v0,a1,0x1
bfc065b8:	00402821 	move	a1,v0
bfc065bc:	00856026 	xor	t4,a0,a1
bfc065c0:	38a64002 	xori	a2,a1,0x4002
bfc065c4:	00065842 	srl	t3,a2,0x1
bfc065c8:	318a0001 	andi	t2,t4,0x1
bfc065cc:	00042042 	srl	a0,a0,0x1
bfc065d0:	35668000 	ori	a2,t3,0x8000
bfc065d4:	15400119 	bnez	t2,bfc06a3c <crcu32+0x75c>
bfc065d8:	00051042 	srl	v0,a1,0x1
bfc065dc:	00402821 	move	a1,v0
bfc065e0:	00857826 	xor	t7,a0,a1
bfc065e4:	38b84002 	xori	t8,a1,0x4002
bfc065e8:	00187042 	srl	t6,t8,0x1
bfc065ec:	31ed0001 	andi	t5,t7,0x1
bfc065f0:	00042042 	srl	a0,a0,0x1
bfc065f4:	35c68000 	ori	a2,t6,0x8000
bfc065f8:	15a00119 	bnez	t5,bfc06a60 <crcu32+0x780>
bfc065fc:	00051042 	srl	v0,a1,0x1
bfc06600:	00402821 	move	a1,v0
bfc06604:	38a24002 	xori	v0,a1,0x4002
bfc06608:	00854826 	xor	t1,a0,a1
bfc0660c:	00024042 	srl	t0,v0,0x1
bfc06610:	31390001 	andi	t9,t1,0x1
bfc06614:	35068000 	ori	a2,t0,0x8000
bfc06618:	17200119 	bnez	t9,bfc06a80 <crcu32+0x7a0>
bfc0661c:	00051042 	srl	v0,a1,0x1
bfc06620:	00402821 	move	a1,v0
bfc06624:	38ab4002 	xori	t3,a1,0x4002
bfc06628:	000b5042 	srl	t2,t3,0x1
bfc0662c:	00042042 	srl	a0,a0,0x1
bfc06630:	30a30001 	andi	v1,a1,0x1
bfc06634:	35468000 	ori	a2,t2,0x8000
bfc06638:	14640119 	bne	v1,a0,bfc06aa0 <crcu32+0x7c0>
bfc0663c:	00051042 	srl	v0,a1,0x1
bfc06640:	00073202 	srl	a2,a3,0x8
bfc06644:	00402821 	move	a1,v0
bfc06648:	00c56826 	xor	t5,a2,a1
bfc0664c:	38ae4002 	xori	t6,a1,0x4002
bfc06650:	000e6042 	srl	t4,t6,0x1
bfc06654:	31a70001 	andi	a3,t5,0x1
bfc06658:	00062042 	srl	a0,a2,0x1
bfc0665c:	00051042 	srl	v0,a1,0x1
bfc06660:	14e00119 	bnez	a3,bfc06ac8 <crcu32+0x7e8>
bfc06664:	35868000 	ori	a2,t4,0x8000
bfc06668:	00402821 	move	a1,v0
bfc0666c:	0085c826 	xor	t9,a0,a1
bfc06670:	38a84002 	xori	t0,a1,0x4002
bfc06674:	0008c042 	srl	t8,t0,0x1
bfc06678:	332f0001 	andi	t7,t9,0x1
bfc0667c:	00042042 	srl	a0,a0,0x1
bfc06680:	37068000 	ori	a2,t8,0x8000
bfc06684:	15e00119 	bnez	t7,bfc06aec <crcu32+0x80c>
bfc06688:	00051042 	srl	v0,a1,0x1
bfc0668c:	00402821 	move	a1,v0
bfc06690:	00851826 	xor	v1,a0,a1
bfc06694:	38aa4002 	xori	t2,a1,0x4002
bfc06698:	000a1042 	srl	v0,t2,0x1
bfc0669c:	30690001 	andi	t1,v1,0x1
bfc066a0:	34468000 	ori	a2,v0,0x8000
bfc066a4:	00042042 	srl	a0,a0,0x1
bfc066a8:	15200119 	bnez	t1,bfc06b10 <crcu32+0x830>
bfc066ac:	00051042 	srl	v0,a1,0x1
bfc066b0:	00402821 	move	a1,v0
bfc066b4:	00856026 	xor	t4,a0,a1
bfc066b8:	38a64002 	xori	a2,a1,0x4002
bfc066bc:	00063842 	srl	a3,a2,0x1
bfc066c0:	318b0001 	andi	t3,t4,0x1
bfc066c4:	00042042 	srl	a0,a0,0x1
bfc066c8:	34e68000 	ori	a2,a3,0x8000
bfc066cc:	15600119 	bnez	t3,bfc06b34 <crcu32+0x854>
bfc066d0:	00051042 	srl	v0,a1,0x1
bfc066d4:	00402821 	move	a1,v0
bfc066d8:	00857826 	xor	t7,a0,a1
bfc066dc:	38b84002 	xori	t8,a1,0x4002
bfc066e0:	00187042 	srl	t6,t8,0x1
bfc066e4:	31ed0001 	andi	t5,t7,0x1
bfc066e8:	00042042 	srl	a0,a0,0x1
bfc066ec:	35c68000 	ori	a2,t6,0x8000
bfc066f0:	15a00119 	bnez	t5,bfc06b58 <crcu32+0x878>
bfc066f4:	00051042 	srl	v0,a1,0x1
bfc066f8:	00402821 	move	a1,v0
bfc066fc:	00854826 	xor	t1,a0,a1
bfc06700:	38a24002 	xori	v0,a1,0x4002
bfc06704:	00024042 	srl	t0,v0,0x1
bfc06708:	31390001 	andi	t9,t1,0x1
bfc0670c:	00042042 	srl	a0,a0,0x1
bfc06710:	35068000 	ori	a2,t0,0x8000
bfc06714:	17200119 	bnez	t9,bfc06b7c <crcu32+0x89c>
bfc06718:	00051042 	srl	v0,a1,0x1
bfc0671c:	00402821 	move	a1,v0
bfc06720:	00855826 	xor	t3,a0,a1
bfc06724:	38a74002 	xori	a3,a1,0x4002
bfc06728:	00075042 	srl	t2,a3,0x1
bfc0672c:	31630001 	andi	v1,t3,0x1
bfc06730:	35468000 	ori	a2,t2,0x8000
bfc06734:	14600119 	bnez	v1,bfc06b9c <crcu32+0x8bc>
bfc06738:	00051042 	srl	v0,a1,0x1
bfc0673c:	00402821 	move	a1,v0
bfc06740:	38a64002 	xori	a2,a1,0x4002
bfc06744:	00066842 	srl	t5,a2,0x1
bfc06748:	00042042 	srl	a0,a0,0x1
bfc0674c:	30ac0001 	andi	t4,a1,0x1
bfc06750:	35a68000 	ori	a2,t5,0x8000
bfc06754:	15840119 	bne	t4,a0,bfc06bbc <crcu32+0x8dc>
bfc06758:	00051042 	srl	v0,a1,0x1
bfc0675c:	03e00008 	jr	ra
bfc06760:	3042ffff 	andi	v0,v0,0xffff
	...
bfc06770:	00c02821 	move	a1,a2
bfc06774:	00856026 	xor	t4,a0,a1
bfc06778:	38ad4002 	xori	t5,a1,0x4002
bfc0677c:	000d5842 	srl	t3,t5,0x1
bfc06780:	318a0001 	andi	t2,t4,0x1
bfc06784:	00042042 	srl	a0,a0,0x1
bfc06788:	35668000 	ori	a2,t3,0x8000
bfc0678c:	1140fee9 	beqz	t2,bfc06334 <crcu32+0x54>
bfc06790:	00051042 	srl	v0,a1,0x1
bfc06794:	00c02821 	move	a1,a2
bfc06798:	0085c026 	xor	t8,a0,a1
bfc0679c:	38b94002 	xori	t9,a1,0x4002
bfc067a0:	00197842 	srl	t7,t9,0x1
bfc067a4:	330e0001 	andi	t6,t8,0x1
bfc067a8:	00042042 	srl	a0,a0,0x1
bfc067ac:	35e68000 	ori	a2,t7,0x8000
bfc067b0:	11c0fee9 	beqz	t6,bfc06358 <crcu32+0x78>
bfc067b4:	00051042 	srl	v0,a1,0x1
bfc067b8:	00c02821 	move	a1,a2
bfc067bc:	00853026 	xor	a2,a0,a1
bfc067c0:	38a94002 	xori	t1,a1,0x4002
bfc067c4:	00091042 	srl	v0,t1,0x1
bfc067c8:	30c30001 	andi	v1,a2,0x1
bfc067cc:	00042042 	srl	a0,a0,0x1
bfc067d0:	34468000 	ori	a2,v0,0x8000
bfc067d4:	1060fee9 	beqz	v1,bfc0637c <crcu32+0x9c>
bfc067d8:	00051042 	srl	v0,a1,0x1
bfc067dc:	00c02821 	move	a1,a2
bfc067e0:	00856026 	xor	t4,a0,a1
bfc067e4:	38ad4002 	xori	t5,a1,0x4002
bfc067e8:	000d5842 	srl	t3,t5,0x1
bfc067ec:	318a0001 	andi	t2,t4,0x1
bfc067f0:	00042042 	srl	a0,a0,0x1
bfc067f4:	35668000 	ori	a2,t3,0x8000
bfc067f8:	1140fee9 	beqz	t2,bfc063a0 <crcu32+0xc0>
bfc067fc:	00051042 	srl	v0,a1,0x1
bfc06800:	00c02821 	move	a1,a2
bfc06804:	0085c026 	xor	t8,a0,a1
bfc06808:	38b94002 	xori	t9,a1,0x4002
bfc0680c:	00197842 	srl	t7,t9,0x1
bfc06810:	330e0001 	andi	t6,t8,0x1
bfc06814:	00042042 	srl	a0,a0,0x1
bfc06818:	35e68000 	ori	a2,t7,0x8000
bfc0681c:	11c0fee9 	beqz	t6,bfc063c4 <crcu32+0xe4>
bfc06820:	00051042 	srl	v0,a1,0x1
bfc06824:	00c02821 	move	a1,a2
bfc06828:	00853026 	xor	a2,a0,a1
bfc0682c:	38a94002 	xori	t1,a1,0x4002
bfc06830:	00091042 	srl	v0,t1,0x1
bfc06834:	30c30001 	andi	v1,a2,0x1
bfc06838:	34468000 	ori	a2,v0,0x8000
bfc0683c:	1060fee9 	beqz	v1,bfc063e4 <crcu32+0x104>
bfc06840:	00051042 	srl	v0,a1,0x1
bfc06844:	00c02821 	move	a1,a2
bfc06848:	38ac4002 	xori	t4,a1,0x4002
bfc0684c:	000c5842 	srl	t3,t4,0x1
bfc06850:	00042042 	srl	a0,a0,0x1
bfc06854:	30aa0001 	andi	t2,a1,0x1
bfc06858:	35668000 	ori	a2,t3,0x8000
bfc0685c:	1144fee9 	beq	t2,a0,bfc06404 <crcu32+0x124>
bfc06860:	00051042 	srl	v0,a1,0x1
bfc06864:	00c02821 	move	a1,a2
bfc06868:	00077202 	srl	t6,a3,0x8
bfc0686c:	01c57826 	xor	t7,t6,a1
bfc06870:	38b84002 	xori	t8,a1,0x4002
bfc06874:	00186842 	srl	t5,t8,0x1
bfc06878:	31e70001 	andi	a3,t7,0x1
bfc0687c:	000e2042 	srl	a0,t6,0x1
bfc06880:	35a68000 	ori	a2,t5,0x8000
bfc06884:	10e0fee9 	beqz	a3,bfc0642c <crcu32+0x14c>
bfc06888:	00051042 	srl	v0,a1,0x1
bfc0688c:	00c02821 	move	a1,a2
bfc06890:	00851826 	xor	v1,a0,a1
bfc06894:	38a64002 	xori	a2,a1,0x4002
bfc06898:	00061042 	srl	v0,a2,0x1
bfc0689c:	30790001 	andi	t9,v1,0x1
bfc068a0:	34468000 	ori	a2,v0,0x8000
bfc068a4:	00042042 	srl	a0,a0,0x1
bfc068a8:	1320fee9 	beqz	t9,bfc06450 <crcu32+0x170>
bfc068ac:	00051042 	srl	v0,a1,0x1
bfc068b0:	00c02821 	move	a1,a2
bfc068b4:	00855826 	xor	t3,a0,a1
bfc068b8:	38ac4002 	xori	t4,a1,0x4002
bfc068bc:	000c5042 	srl	t2,t4,0x1
bfc068c0:	31690001 	andi	t1,t3,0x1
bfc068c4:	00042042 	srl	a0,a0,0x1
bfc068c8:	35468000 	ori	a2,t2,0x8000
bfc068cc:	1120fee9 	beqz	t1,bfc06474 <crcu32+0x194>
bfc068d0:	00051042 	srl	v0,a1,0x1
bfc068d4:	00c02821 	move	a1,a2
bfc068d8:	00857026 	xor	t6,a0,a1
bfc068dc:	38af4002 	xori	t7,a1,0x4002
bfc068e0:	000f6842 	srl	t5,t7,0x1
bfc068e4:	31c70001 	andi	a3,t6,0x1
bfc068e8:	00042042 	srl	a0,a0,0x1
bfc068ec:	35a68000 	ori	a2,t5,0x8000
bfc068f0:	10e0fee9 	beqz	a3,bfc06498 <crcu32+0x1b8>
bfc068f4:	00051042 	srl	v0,a1,0x1
bfc068f8:	00c02821 	move	a1,a2
bfc068fc:	00851826 	xor	v1,a0,a1
bfc06900:	38a24002 	xori	v0,a1,0x4002
bfc06904:	0002c842 	srl	t9,v0,0x1
bfc06908:	30780001 	andi	t8,v1,0x1
bfc0690c:	00042042 	srl	a0,a0,0x1
bfc06910:	37268000 	ori	a2,t9,0x8000
bfc06914:	1300fee9 	beqz	t8,bfc064bc <crcu32+0x1dc>
bfc06918:	00051042 	srl	v0,a1,0x1
bfc0691c:	00c02821 	move	a1,a2
bfc06920:	00853026 	xor	a2,a0,a1
bfc06924:	38ab4002 	xori	t3,a1,0x4002
bfc06928:	000b5042 	srl	t2,t3,0x1
bfc0692c:	30c90001 	andi	t1,a2,0x1
bfc06930:	00042042 	srl	a0,a0,0x1
bfc06934:	35468000 	ori	a2,t2,0x8000
bfc06938:	1120fee9 	beqz	t1,bfc064e0 <crcu32+0x200>
bfc0693c:	00051042 	srl	v0,a1,0x1
bfc06940:	00c02821 	move	a1,a2
bfc06944:	00856826 	xor	t5,a0,a1
bfc06948:	38ae4002 	xori	t6,a1,0x4002
bfc0694c:	000e3842 	srl	a3,t6,0x1
bfc06950:	31ac0001 	andi	t4,t5,0x1
bfc06954:	34e68000 	ori	a2,a3,0x8000
bfc06958:	1180fee9 	beqz	t4,bfc06500 <crcu32+0x220>
bfc0695c:	00051042 	srl	v0,a1,0x1
bfc06960:	00c02821 	move	a1,a2
bfc06964:	38b94002 	xori	t9,a1,0x4002
bfc06968:	0019c042 	srl	t8,t9,0x1
bfc0696c:	00042042 	srl	a0,a0,0x1
bfc06970:	30af0001 	andi	t7,a1,0x1
bfc06974:	37068000 	ori	a2,t8,0x8000
bfc06978:	11e4fee9 	beq	t7,a0,bfc06520 <crcu32+0x240>
bfc0697c:	00051042 	srl	v0,a1,0x1
bfc06980:	00083c02 	srl	a3,t0,0x10
bfc06984:	00c02821 	move	a1,a2
bfc06988:	30e900ff 	andi	t1,a3,0xff
bfc0698c:	01251826 	xor	v1,t1,a1
bfc06990:	38aa4002 	xori	t2,a1,0x4002
bfc06994:	000a1042 	srl	v0,t2,0x1
bfc06998:	30680001 	andi	t0,v1,0x1
bfc0699c:	34468000 	ori	a2,v0,0x8000
bfc069a0:	00092042 	srl	a0,t1,0x1
bfc069a4:	1100fee9 	beqz	t0,bfc0654c <crcu32+0x26c>
bfc069a8:	00051042 	srl	v0,a1,0x1
bfc069ac:	00c02821 	move	a1,a2
bfc069b0:	00853026 	xor	a2,a0,a1
bfc069b4:	38ad4002 	xori	t5,a1,0x4002
bfc069b8:	000d6042 	srl	t4,t5,0x1
bfc069bc:	30cb0001 	andi	t3,a2,0x1
bfc069c0:	00042042 	srl	a0,a0,0x1
bfc069c4:	35868000 	ori	a2,t4,0x8000
bfc069c8:	1160fee9 	beqz	t3,bfc06570 <crcu32+0x290>
bfc069cc:	00051042 	srl	v0,a1,0x1
bfc069d0:	00c02821 	move	a1,a2
bfc069d4:	0085c026 	xor	t8,a0,a1
bfc069d8:	38b94002 	xori	t9,a1,0x4002
bfc069dc:	00197842 	srl	t7,t9,0x1
bfc069e0:	330e0001 	andi	t6,t8,0x1
bfc069e4:	00042042 	srl	a0,a0,0x1
bfc069e8:	35e68000 	ori	a2,t7,0x8000
bfc069ec:	11c0fee9 	beqz	t6,bfc06594 <crcu32+0x2b4>
bfc069f0:	00051042 	srl	v0,a1,0x1
bfc069f4:	00c02821 	move	a1,a2
bfc069f8:	00854826 	xor	t1,a0,a1
bfc069fc:	38a34002 	xori	v1,a1,0x4002
bfc06a00:	00031042 	srl	v0,v1,0x1
bfc06a04:	31280001 	andi	t0,t1,0x1
bfc06a08:	34468000 	ori	a2,v0,0x8000
bfc06a0c:	00042042 	srl	a0,a0,0x1
bfc06a10:	1100fee9 	beqz	t0,bfc065b8 <crcu32+0x2d8>
bfc06a14:	00051042 	srl	v0,a1,0x1
bfc06a18:	00c02821 	move	a1,a2
bfc06a1c:	00856026 	xor	t4,a0,a1
bfc06a20:	38a64002 	xori	a2,a1,0x4002
bfc06a24:	00065842 	srl	t3,a2,0x1
bfc06a28:	318a0001 	andi	t2,t4,0x1
bfc06a2c:	00042042 	srl	a0,a0,0x1
bfc06a30:	35668000 	ori	a2,t3,0x8000
bfc06a34:	1140fee9 	beqz	t2,bfc065dc <crcu32+0x2fc>
bfc06a38:	00051042 	srl	v0,a1,0x1
bfc06a3c:	00c02821 	move	a1,a2
bfc06a40:	00857826 	xor	t7,a0,a1
bfc06a44:	38b84002 	xori	t8,a1,0x4002
bfc06a48:	00187042 	srl	t6,t8,0x1
bfc06a4c:	31ed0001 	andi	t5,t7,0x1
bfc06a50:	00042042 	srl	a0,a0,0x1
bfc06a54:	35c68000 	ori	a2,t6,0x8000
bfc06a58:	11a0fee9 	beqz	t5,bfc06600 <crcu32+0x320>
bfc06a5c:	00051042 	srl	v0,a1,0x1
bfc06a60:	00c02821 	move	a1,a2
bfc06a64:	38a24002 	xori	v0,a1,0x4002
bfc06a68:	00854826 	xor	t1,a0,a1
bfc06a6c:	00024042 	srl	t0,v0,0x1
bfc06a70:	31390001 	andi	t9,t1,0x1
bfc06a74:	35068000 	ori	a2,t0,0x8000
bfc06a78:	1320fee9 	beqz	t9,bfc06620 <crcu32+0x340>
bfc06a7c:	00051042 	srl	v0,a1,0x1
bfc06a80:	00c02821 	move	a1,a2
bfc06a84:	38ab4002 	xori	t3,a1,0x4002
bfc06a88:	000b5042 	srl	t2,t3,0x1
bfc06a8c:	00042042 	srl	a0,a0,0x1
bfc06a90:	30a30001 	andi	v1,a1,0x1
bfc06a94:	35468000 	ori	a2,t2,0x8000
bfc06a98:	1064fee9 	beq	v1,a0,bfc06640 <crcu32+0x360>
bfc06a9c:	00051042 	srl	v0,a1,0x1
bfc06aa0:	00c02821 	move	a1,a2
bfc06aa4:	00073202 	srl	a2,a3,0x8
bfc06aa8:	00c56826 	xor	t5,a2,a1
bfc06aac:	38ae4002 	xori	t6,a1,0x4002
bfc06ab0:	000e6042 	srl	t4,t6,0x1
bfc06ab4:	31a70001 	andi	a3,t5,0x1
bfc06ab8:	00062042 	srl	a0,a2,0x1
bfc06abc:	00051042 	srl	v0,a1,0x1
bfc06ac0:	10e0fee9 	beqz	a3,bfc06668 <crcu32+0x388>
bfc06ac4:	35868000 	ori	a2,t4,0x8000
bfc06ac8:	00c02821 	move	a1,a2
bfc06acc:	0085c826 	xor	t9,a0,a1
bfc06ad0:	38a84002 	xori	t0,a1,0x4002
bfc06ad4:	0008c042 	srl	t8,t0,0x1
bfc06ad8:	332f0001 	andi	t7,t9,0x1
bfc06adc:	00042042 	srl	a0,a0,0x1
bfc06ae0:	37068000 	ori	a2,t8,0x8000
bfc06ae4:	11e0fee9 	beqz	t7,bfc0668c <crcu32+0x3ac>
bfc06ae8:	00051042 	srl	v0,a1,0x1
bfc06aec:	00c02821 	move	a1,a2
bfc06af0:	00851826 	xor	v1,a0,a1
bfc06af4:	38aa4002 	xori	t2,a1,0x4002
bfc06af8:	000a1042 	srl	v0,t2,0x1
bfc06afc:	30690001 	andi	t1,v1,0x1
bfc06b00:	34468000 	ori	a2,v0,0x8000
bfc06b04:	00042042 	srl	a0,a0,0x1
bfc06b08:	1120fee9 	beqz	t1,bfc066b0 <crcu32+0x3d0>
bfc06b0c:	00051042 	srl	v0,a1,0x1
bfc06b10:	00c02821 	move	a1,a2
bfc06b14:	00856026 	xor	t4,a0,a1
bfc06b18:	38a64002 	xori	a2,a1,0x4002
bfc06b1c:	00063842 	srl	a3,a2,0x1
bfc06b20:	318b0001 	andi	t3,t4,0x1
bfc06b24:	00042042 	srl	a0,a0,0x1
bfc06b28:	34e68000 	ori	a2,a3,0x8000
bfc06b2c:	1160fee9 	beqz	t3,bfc066d4 <crcu32+0x3f4>
bfc06b30:	00051042 	srl	v0,a1,0x1
bfc06b34:	00c02821 	move	a1,a2
bfc06b38:	00857826 	xor	t7,a0,a1
bfc06b3c:	38b84002 	xori	t8,a1,0x4002
bfc06b40:	00187042 	srl	t6,t8,0x1
bfc06b44:	31ed0001 	andi	t5,t7,0x1
bfc06b48:	00042042 	srl	a0,a0,0x1
bfc06b4c:	35c68000 	ori	a2,t6,0x8000
bfc06b50:	11a0fee9 	beqz	t5,bfc066f8 <crcu32+0x418>
bfc06b54:	00051042 	srl	v0,a1,0x1
bfc06b58:	00c02821 	move	a1,a2
bfc06b5c:	00854826 	xor	t1,a0,a1
bfc06b60:	38a24002 	xori	v0,a1,0x4002
bfc06b64:	00024042 	srl	t0,v0,0x1
bfc06b68:	31390001 	andi	t9,t1,0x1
bfc06b6c:	00042042 	srl	a0,a0,0x1
bfc06b70:	35068000 	ori	a2,t0,0x8000
bfc06b74:	1320fee9 	beqz	t9,bfc0671c <crcu32+0x43c>
bfc06b78:	00051042 	srl	v0,a1,0x1
bfc06b7c:	00c02821 	move	a1,a2
bfc06b80:	00855826 	xor	t3,a0,a1
bfc06b84:	38a74002 	xori	a3,a1,0x4002
bfc06b88:	00075042 	srl	t2,a3,0x1
bfc06b8c:	31630001 	andi	v1,t3,0x1
bfc06b90:	35468000 	ori	a2,t2,0x8000
bfc06b94:	1060fee9 	beqz	v1,bfc0673c <crcu32+0x45c>
bfc06b98:	00051042 	srl	v0,a1,0x1
bfc06b9c:	00c02821 	move	a1,a2
bfc06ba0:	38a64002 	xori	a2,a1,0x4002
bfc06ba4:	00066842 	srl	t5,a2,0x1
bfc06ba8:	00042042 	srl	a0,a0,0x1
bfc06bac:	30ac0001 	andi	t4,a1,0x1
bfc06bb0:	35a68000 	ori	a2,t5,0x8000
bfc06bb4:	1184fee9 	beq	t4,a0,bfc0675c <crcu32+0x47c>
bfc06bb8:	00051042 	srl	v0,a1,0x1
bfc06bbc:	00c01021 	move	v0,a2
bfc06bc0:	03e00008 	jr	ra
bfc06bc4:	3042ffff 	andi	v0,v0,0xffff
	...

bfc06bd0 <get_seed_args>:
get_seed_args():
bfc06bd0:	0085282a 	slt	a1,a0,a1
bfc06bd4:	10a00042 	beqz	a1,bfc06ce0 <get_seed_args+0x110>
bfc06bd8:	00001021 	move	v0,zero
bfc06bdc:	00043880 	sll	a3,a0,0x2
bfc06be0:	00c71821 	addu	v1,a2,a3
bfc06be4:	8c660000 	lw	a2,0(v1)
bfc06be8:	2402002d 	li	v0,45
bfc06bec:	80c70000 	lb	a3,0(a2)
bfc06bf0:	00000000 	nop
bfc06bf4:	10e2003e 	beq	a3,v0,bfc06cf0 <get_seed_args+0x120>
bfc06bf8:	24040030 	li	a0,48
bfc06bfc:	10e40041 	beq	a3,a0,bfc06d04 <get_seed_args+0x134>
bfc06c00:	240a0001 	li	t2,1
bfc06c04:	24edffd0 	addiu	t5,a3,-48
bfc06c08:	31ac00ff 	andi	t4,t5,0xff
bfc06c0c:	2d8b000a 	sltiu	t3,t4,10
bfc06c10:	1160002b 	beqz	t3,bfc06cc0 <get_seed_args+0xf0>
bfc06c14:	00004021 	move	t0,zero
bfc06c18:	000878c0 	sll	t7,t0,0x3
bfc06c1c:	00087040 	sll	t6,t0,0x1
bfc06c20:	01cf4021 	addu	t0,t6,t7
bfc06c24:	00e86821 	addu	t5,a3,t0
bfc06c28:	80c70001 	lb	a3,1(a2)
bfc06c2c:	25a8ffd0 	addiu	t0,t5,-48
bfc06c30:	24e9ffd0 	addiu	t1,a3,-48
bfc06c34:	000860c0 	sll	t4,t0,0x3
bfc06c38:	00085840 	sll	t3,t0,0x1
bfc06c3c:	312400ff 	andi	a0,t1,0xff
bfc06c40:	016c1021 	addu	v0,t3,t4
bfc06c44:	2c83000a 	sltiu	v1,a0,10
bfc06c48:	1060001d 	beqz	v1,bfc06cc0 <get_seed_args+0xf0>
bfc06c4c:	00e21021 	addu	v0,a3,v0
bfc06c50:	80c70002 	lb	a3,2(a2)
bfc06c54:	2448ffd0 	addiu	t0,v0,-48
bfc06c58:	24e4ffd0 	addiu	a0,a3,-48
bfc06c5c:	000810c0 	sll	v0,t0,0x3
bfc06c60:	00084840 	sll	t1,t0,0x1
bfc06c64:	308500ff 	andi	a1,a0,0xff
bfc06c68:	01221821 	addu	v1,t1,v0
bfc06c6c:	2cb9000a 	sltiu	t9,a1,10
bfc06c70:	13200013 	beqz	t9,bfc06cc0 <get_seed_args+0xf0>
bfc06c74:	00e31821 	addu	v1,a3,v1
bfc06c78:	80c70003 	lb	a3,3(a2)
bfc06c7c:	24c60004 	addiu	a2,a2,4
bfc06c80:	24efffd0 	addiu	t7,a3,-48
bfc06c84:	31e800ff 	andi	t0,t7,0xff
bfc06c88:	2d0b000a 	sltiu	t3,t0,10
bfc06c8c:	2468ffd0 	addiu	t0,v1,-48
bfc06c90:	000870c0 	sll	t6,t0,0x3
bfc06c94:	00086840 	sll	t5,t0,0x1
bfc06c98:	01ae6021 	addu	t4,t5,t6
bfc06c9c:	11600008 	beqz	t3,bfc06cc0 <get_seed_args+0xf0>
bfc06ca0:	00ec1821 	addu	v1,a3,t4
bfc06ca4:	80c70000 	lb	a3,0(a2)
bfc06ca8:	00000000 	nop
bfc06cac:	24e5ffd0 	addiu	a1,a3,-48
bfc06cb0:	30b900ff 	andi	t9,a1,0xff
bfc06cb4:	2f38000a 	sltiu	t8,t9,10
bfc06cb8:	1700ffd7 	bnez	t8,bfc06c18 <get_seed_args+0x48>
bfc06cbc:	2468ffd0 	addiu	t0,v1,-48
bfc06cc0:	2418004b 	li	t8,75
bfc06cc4:	10f8002a 	beq	a3,t8,bfc06d70 <get_seed_args+0x1a0>
bfc06cc8:	2406004d 	li	a2,77
bfc06ccc:	14e60003 	bne	a3,a2,bfc06cdc <get_seed_args+0x10c>
bfc06cd0:	010a0018 	mult	t0,t2
bfc06cd4:	00084500 	sll	t0,t0,0x14
bfc06cd8:	010a0018 	mult	t0,t2
bfc06cdc:	00001012 	mflo	v0
bfc06ce0:	03e00008 	jr	ra
bfc06ce4:	00000000 	nop
	...
bfc06cf0:	24c60001 	addiu	a2,a2,1
bfc06cf4:	80c70000 	lb	a3,0(a2)
bfc06cf8:	00000000 	nop
bfc06cfc:	14e4ffc1 	bne	a3,a0,bfc06c04 <get_seed_args+0x34>
bfc06d00:	240affff 	li	t2,-1
bfc06d04:	80c90001 	lb	t1,1(a2)
bfc06d08:	24080078 	li	t0,120
bfc06d0c:	1528ffbe 	bne	t1,t0,bfc06c08 <get_seed_args+0x38>
bfc06d10:	24edffd0 	addiu	t5,a3,-48
bfc06d14:	24c40002 	addiu	a0,a2,2
bfc06d18:	00004021 	move	t0,zero
bfc06d1c:	80870000 	lb	a3,0(a0)
bfc06d20:	00084900 	sll	t1,t0,0x4
bfc06d24:	30e500ff 	andi	a1,a3,0xff
bfc06d28:	24b9ffd0 	addiu	t9,a1,-48
bfc06d2c:	24a6ff9f 	addiu	a2,a1,-97
bfc06d30:	333800ff 	andi	t8,t9,0xff
bfc06d34:	30cf00ff 	andi	t7,a2,0xff
bfc06d38:	24e5ffd0 	addiu	a1,a3,-48
bfc06d3c:	2f0e000a 	sltiu	t6,t8,10
bfc06d40:	28a6000a 	slti	a2,a1,10
bfc06d44:	24840001 	addiu	a0,a0,1
bfc06d48:	15c00003 	bnez	t6,bfc06d58 <get_seed_args+0x188>
bfc06d4c:	2de30006 	sltiu	v1,t7,6
bfc06d50:	1060ffdc 	beqz	v1,bfc06cc4 <get_seed_args+0xf4>
bfc06d54:	2418004b 	li	t8,75
bfc06d58:	14c00002 	bnez	a2,bfc06d64 <get_seed_args+0x194>
bfc06d5c:	00000000 	nop
bfc06d60:	24e5ffa9 	addiu	a1,a3,-87
bfc06d64:	0bf01b47 	j	bfc06d1c <get_seed_args+0x14c>
bfc06d68:	00a94021 	addu	t0,a1,t1
bfc06d6c:	00000000 	nop
bfc06d70:	00084280 	sll	t0,t0,0xa
bfc06d74:	010a0018 	mult	t0,t2
bfc06d78:	00001012 	mflo	v0
bfc06d7c:	03e00008 	jr	ra
bfc06d80:	00000000 	nop
	...

bfc06d90 <core_init_state>:
core_init_state():
bfc06d90:	27bdffe0 	addiu	sp,sp,-32
bfc06d94:	00c0c821 	move	t9,a2
bfc06d98:	3c068000 	lui	a2,0x8000
bfc06d9c:	afb40010 	sw	s4,16(sp)
bfc06da0:	00006021 	move	t4,zero
bfc06da4:	24d40660 	addiu	s4,a2,1632
bfc06da8:	00003021 	move	a2,zero
bfc06dac:	afb20008 	sw	s2,8(sp)
bfc06db0:	00ccc021 	addu	t8,a2,t4
bfc06db4:	00809021 	move	s2,a0
bfc06db8:	afb00000 	sw	s0,0(sp)
bfc06dbc:	270f0001 	addiu	t7,t8,1
bfc06dc0:	2650ffff 	addiu	s0,s2,-1
bfc06dc4:	00052c00 	sll	a1,a1,0x10
bfc06dc8:	3c078000 	lui	a3,0x8000
bfc06dcc:	3c048000 	lui	a0,0x8000
bfc06dd0:	3c038000 	lui	v1,0x8000
bfc06dd4:	3c028000 	lui	v0,0x8000
bfc06dd8:	01f0502b 	sltu	t2,t7,s0
bfc06ddc:	afb7001c 	sw	s7,28(sp)
bfc06de0:	afb60018 	sw	s6,24(sp)
bfc06de4:	afb50014 	sw	s5,20(sp)
bfc06de8:	afb3000c 	sw	s3,12(sp)
bfc06dec:	afb10004 	sw	s1,4(sp)
bfc06df0:	00052c03 	sra	a1,a1,0x10
bfc06df4:	24f105b0 	addiu	s1,a3,1456
bfc06df8:	24950650 	addiu	s5,a0,1616
bfc06dfc:	24760640 	addiu	s6,v1,1600
bfc06e00:	24570630 	addiu	s7,v0,1584
bfc06e04:	00005821 	move	t3,zero
bfc06e08:	1140001c 	beqz	t2,bfc06e7c <core_init_state+0xec>
bfc06e0c:	2413002c 	li	s3,44
bfc06e10:	1580007b 	bnez	t4,bfc07000 <core_init_state+0x270>
bfc06e14:	2d880004 	sltiu	t0,t4,4
bfc06e18:	00c07821 	move	t7,a2
bfc06e1c:	24aa0001 	addiu	t2,a1,1
bfc06e20:	000a2c00 	sll	a1,t2,0x10
bfc06e24:	00052c03 	sra	a1,a1,0x10
bfc06e28:	30a80007 	andi	t0,a1,0x7
bfc06e2c:	00085880 	sll	t3,t0,0x2
bfc06e30:	022b3821 	addu	a3,s1,t3
bfc06e34:	8cf80000 	lw	t8,0(a3)
bfc06e38:	00000000 	nop
bfc06e3c:	03000008 	jr	t8
bfc06e40:	00000000 	nop
	...
bfc06e50:	00054042 	srl	t0,a1,0x1
bfc06e54:	310b000c 	andi	t3,t0,0xc
bfc06e58:	01743821 	addu	a3,t3,s4
bfc06e5c:	8ceb0000 	lw	t3,0(a3)
bfc06e60:	240c0008 	li	t4,8
bfc06e64:	01e03021 	move	a2,t7
bfc06e68:	00ccc021 	addu	t8,a2,t4
bfc06e6c:	270f0001 	addiu	t7,t8,1
bfc06e70:	01f0502b 	sltu	t2,t7,s0
bfc06e74:	1540ffe6 	bnez	t2,bfc06e10 <core_init_state+0x80>
bfc06e78:	00000000 	nop
bfc06e7c:	00d2782b 	sltu	t7,a2,s2
bfc06e80:	11e0003a 	beqz	t7,bfc06f6c <core_init_state+0x1dc>
bfc06e84:	00069827 	nor	s3,zero,a2
bfc06e88:	24c50001 	addiu	a1,a2,1
bfc06e8c:	02728821 	addu	s1,s3,s2
bfc06e90:	03263021 	addu	a2,t9,a2
bfc06e94:	00b2802b 	sltu	s0,a1,s2
bfc06e98:	32270007 	andi	a3,s1,0x7
bfc06e9c:	a0c00000 	sb	zero,0(a2)
bfc06ea0:	12000032 	beqz	s0,bfc06f6c <core_init_state+0x1dc>
bfc06ea4:	24c40001 	addiu	a0,a2,1
bfc06ea8:	10e00024 	beqz	a3,bfc06f3c <core_init_state+0x1ac>
bfc06eac:	24150001 	li	s5,1
bfc06eb0:	10f5001d 	beq	a3,s5,bfc06f28 <core_init_state+0x198>
bfc06eb4:	24160002 	li	s6,2
bfc06eb8:	10f60018 	beq	a3,s6,bfc06f1c <core_init_state+0x18c>
bfc06ebc:	24170003 	li	s7,3
bfc06ec0:	10f70013 	beq	a3,s7,bfc06f10 <core_init_state+0x180>
bfc06ec4:	24190004 	li	t9,4
bfc06ec8:	10f9000e 	beq	a3,t9,bfc06f04 <core_init_state+0x174>
bfc06ecc:	24020005 	li	v0,5
bfc06ed0:	10e20009 	beq	a3,v0,bfc06ef8 <core_init_state+0x168>
bfc06ed4:	240e0006 	li	t6,6
bfc06ed8:	10ee0004 	beq	a3,t6,bfc06eec <core_init_state+0x15c>
bfc06edc:	00000000 	nop
bfc06ee0:	a0c00001 	sb	zero,1(a2)
bfc06ee4:	24a50001 	addiu	a1,a1,1
bfc06ee8:	24840001 	addiu	a0,a0,1
bfc06eec:	a0800000 	sb	zero,0(a0)
bfc06ef0:	24a50001 	addiu	a1,a1,1
bfc06ef4:	24840001 	addiu	a0,a0,1
bfc06ef8:	a0800000 	sb	zero,0(a0)
bfc06efc:	24a50001 	addiu	a1,a1,1
bfc06f00:	24840001 	addiu	a0,a0,1
bfc06f04:	a0800000 	sb	zero,0(a0)
bfc06f08:	24a50001 	addiu	a1,a1,1
bfc06f0c:	24840001 	addiu	a0,a0,1
bfc06f10:	a0800000 	sb	zero,0(a0)
bfc06f14:	24a50001 	addiu	a1,a1,1
bfc06f18:	24840001 	addiu	a0,a0,1
bfc06f1c:	a0800000 	sb	zero,0(a0)
bfc06f20:	24a50001 	addiu	a1,a1,1
bfc06f24:	24840001 	addiu	a0,a0,1
bfc06f28:	24a50001 	addiu	a1,a1,1
bfc06f2c:	00b2302b 	sltu	a2,a1,s2
bfc06f30:	a0800000 	sb	zero,0(a0)
bfc06f34:	10c0000d 	beqz	a2,bfc06f6c <core_init_state+0x1dc>
bfc06f38:	24840001 	addiu	a0,a0,1
bfc06f3c:	24a50008 	addiu	a1,a1,8
bfc06f40:	00b2a02b 	sltu	s4,a1,s2
bfc06f44:	a0800000 	sb	zero,0(a0)
bfc06f48:	a0800001 	sb	zero,1(a0)
bfc06f4c:	a0800002 	sb	zero,2(a0)
bfc06f50:	a0800003 	sb	zero,3(a0)
bfc06f54:	a0800004 	sb	zero,4(a0)
bfc06f58:	a0800005 	sb	zero,5(a0)
bfc06f5c:	a0800006 	sb	zero,6(a0)
bfc06f60:	a0800007 	sb	zero,7(a0)
bfc06f64:	1680fff5 	bnez	s4,bfc06f3c <core_init_state+0x1ac>
bfc06f68:	24840008 	addiu	a0,a0,8
bfc06f6c:	8fb7001c 	lw	s7,28(sp)
bfc06f70:	8fb60018 	lw	s6,24(sp)
bfc06f74:	8fb50014 	lw	s5,20(sp)
bfc06f78:	8fb40010 	lw	s4,16(sp)
bfc06f7c:	8fb3000c 	lw	s3,12(sp)
bfc06f80:	8fb20008 	lw	s2,8(sp)
bfc06f84:	8fb10004 	lw	s1,4(sp)
bfc06f88:	8fb00000 	lw	s0,0(sp)
bfc06f8c:	03e00008 	jr	ra
bfc06f90:	27bd0020 	addiu	sp,sp,32
	...
bfc06fa0:	0005c042 	srl	t8,a1,0x1
bfc06fa4:	330c000c 	andi	t4,t8,0xc
bfc06fa8:	01952021 	addu	a0,t4,s5
bfc06fac:	8c8b0000 	lw	t3,0(a0)
bfc06fb0:	240c0008 	li	t4,8
bfc06fb4:	0bf01b9a 	j	bfc06e68 <core_init_state+0xd8>
bfc06fb8:	01e03021 	move	a2,t7
bfc06fbc:	00000000 	nop
bfc06fc0:	00051842 	srl	v1,a1,0x1
bfc06fc4:	306d000c 	andi	t5,v1,0xc
bfc06fc8:	01b64821 	addu	t1,t5,s6
bfc06fcc:	8d2b0000 	lw	t3,0(t1)
bfc06fd0:	240c0008 	li	t4,8
bfc06fd4:	0bf01b9a 	j	bfc06e68 <core_init_state+0xd8>
bfc06fd8:	01e03021 	move	a2,t7
bfc06fdc:	00000000 	nop
bfc06fe0:	00057042 	srl	t6,a1,0x1
bfc06fe4:	31c6000c 	andi	a2,t6,0xc
bfc06fe8:	00d71021 	addu	v0,a2,s7
bfc06fec:	8c4b0000 	lw	t3,0(v0)
bfc06ff0:	240c0004 	li	t4,4
bfc06ff4:	0bf01b9a 	j	bfc06e68 <core_init_state+0xd8>
bfc06ff8:	01e03021 	move	a2,t7
bfc06ffc:	00000000 	nop
bfc07000:	1100005b 	beqz	t0,bfc07170 <core_init_state+0x3e0>
bfc07004:	03265021 	addu	t2,t9,a2
bfc07008:	916d0000 	lbu	t5,0(t3)
bfc0700c:	24070001 	li	a3,1
bfc07010:	2588ffff 	addiu	t0,t4,-1
bfc07014:	00ec482b 	sltu	t1,a3,t4
bfc07018:	31030007 	andi	v1,t0,0x7
bfc0701c:	a14d0000 	sb	t5,0(t2)
bfc07020:	1120004e 	beqz	t1,bfc0715c <core_init_state+0x3cc>
bfc07024:	25480001 	addiu	t0,t2,1
bfc07028:	10600032 	beqz	v1,bfc070f4 <core_init_state+0x364>
bfc0702c:	01672021 	addu	a0,t3,a3
bfc07030:	10670029 	beq	v1,a3,bfc070d8 <core_init_state+0x348>
bfc07034:	24090002 	li	t1,2
bfc07038:	10690021 	beq	v1,t1,bfc070c0 <core_init_state+0x330>
bfc0703c:	240d0003 	li	t5,3
bfc07040:	106d001a 	beq	v1,t5,bfc070ac <core_init_state+0x31c>
bfc07044:	24040004 	li	a0,4
bfc07048:	10640013 	beq	v1,a0,bfc07098 <core_init_state+0x308>
bfc0704c:	24020005 	li	v0,5
bfc07050:	1062000c 	beq	v1,v0,bfc07084 <core_init_state+0x2f4>
bfc07054:	240e0006 	li	t6,6
bfc07058:	106e0006 	beq	v1,t6,bfc07074 <core_init_state+0x2e4>
bfc0705c:	01673021 	addu	a2,t3,a3
bfc07060:	91630001 	lbu	v1,1(t3)
bfc07064:	25480002 	addiu	t0,t2,2
bfc07068:	a1430001 	sb	v1,1(t2)
bfc0706c:	24070002 	li	a3,2
bfc07070:	01673021 	addu	a2,t3,a3
bfc07074:	90ca0000 	lbu	t2,0(a2)
bfc07078:	24e70001 	addiu	a3,a3,1
bfc0707c:	a10a0000 	sb	t2,0(t0)
bfc07080:	25080001 	addiu	t0,t0,1
bfc07084:	01676821 	addu	t5,t3,a3
bfc07088:	91a90000 	lbu	t1,0(t5)
bfc0708c:	24e70001 	addiu	a3,a3,1
bfc07090:	a1090000 	sb	t1,0(t0)
bfc07094:	25080001 	addiu	t0,t0,1
bfc07098:	01671021 	addu	v0,t3,a3
bfc0709c:	90440000 	lbu	a0,0(v0)
bfc070a0:	24e70001 	addiu	a3,a3,1
bfc070a4:	a1040000 	sb	a0,0(t0)
bfc070a8:	25080001 	addiu	t0,t0,1
bfc070ac:	01671821 	addu	v1,t3,a3
bfc070b0:	906e0000 	lbu	t6,0(v1)
bfc070b4:	24e70001 	addiu	a3,a3,1
bfc070b8:	a10e0000 	sb	t6,0(t0)
bfc070bc:	25080001 	addiu	t0,t0,1
bfc070c0:	01673021 	addu	a2,t3,a3
bfc070c4:	90ca0000 	lbu	t2,0(a2)
bfc070c8:	24e70001 	addiu	a3,a3,1
bfc070cc:	a10a0000 	sb	t2,0(t0)
bfc070d0:	25080001 	addiu	t0,t0,1
bfc070d4:	01672021 	addu	a0,t3,a3
bfc070d8:	908d0000 	lbu	t5,0(a0)
bfc070dc:	24e70001 	addiu	a3,a3,1
bfc070e0:	00ec482b 	sltu	t1,a3,t4
bfc070e4:	a10d0000 	sb	t5,0(t0)
bfc070e8:	1120001c 	beqz	t1,bfc0715c <core_init_state+0x3cc>
bfc070ec:	25080001 	addiu	t0,t0,1
bfc070f0:	01672021 	addu	a0,t3,a3
bfc070f4:	90830000 	lbu	v1,0(a0)
bfc070f8:	24e70008 	addiu	a3,a3,8
bfc070fc:	a1030000 	sb	v1,0(t0)
bfc07100:	90890001 	lbu	t1,1(a0)
bfc07104:	00000000 	nop
bfc07108:	a1090001 	sb	t1,1(t0)
bfc0710c:	90860002 	lbu	a2,2(a0)
bfc07110:	00000000 	nop
bfc07114:	a1060002 	sb	a2,2(t0)
bfc07118:	908a0003 	lbu	t2,3(a0)
bfc0711c:	00000000 	nop
bfc07120:	a10a0003 	sb	t2,3(t0)
bfc07124:	908d0004 	lbu	t5,4(a0)
bfc07128:	00000000 	nop
bfc0712c:	a10d0004 	sb	t5,4(t0)
bfc07130:	90890005 	lbu	t1,5(a0)
bfc07134:	00000000 	nop
bfc07138:	a1090005 	sb	t1,5(t0)
bfc0713c:	90860006 	lbu	a2,6(a0)
bfc07140:	00000000 	nop
bfc07144:	a1060006 	sb	a2,6(t0)
bfc07148:	90820007 	lbu	v0,7(a0)
bfc0714c:	00ec202b 	sltu	a0,a3,t4
bfc07150:	a1020007 	sb	v0,7(t0)
bfc07154:	1480ffe6 	bnez	a0,bfc070f0 <core_init_state+0x360>
bfc07158:	25080008 	addiu	t0,t0,8
bfc0715c:	03386021 	addu	t4,t9,t8
bfc07160:	0bf01b87 	j	bfc06e1c <core_init_state+0x8c>
bfc07164:	a1930000 	sb	s3,0(t4)
	...
bfc07170:	014b6825 	or	t5,t2,t3
bfc07174:	31a90003 	andi	t1,t5,0x3
bfc07178:	1520ffa3 	bnez	t1,bfc07008 <core_init_state+0x278>
bfc0717c:	25620004 	addiu	v0,t3,4
bfc07180:	004a702b 	sltu	t6,v0,t2
bfc07184:	15c00005 	bnez	t6,bfc0719c <core_init_state+0x40c>
bfc07188:	000c7082 	srl	t6,t4,0x2
bfc0718c:	25440004 	addiu	a0,t2,4
bfc07190:	008b182b 	sltu	v1,a0,t3
bfc07194:	1060ff9c 	beqz	v1,bfc07008 <core_init_state+0x278>
bfc07198:	00000000 	nop
bfc0719c:	000e6880 	sll	t5,t6,0x2
bfc071a0:	11a00058 	beqz	t5,bfc07304 <core_init_state+0x574>
bfc071a4:	24090001 	li	t1,1
bfc071a8:	8d680000 	lw	t0,0(t3)
bfc071ac:	25c7ffff 	addiu	a3,t6,-1
bfc071b0:	012e202b 	sltu	a0,t1,t6
bfc071b4:	ad480000 	sw	t0,0(t2)
bfc071b8:	30e30007 	andi	v1,a3,0x7
bfc071bc:	25480004 	addiu	t0,t2,4
bfc071c0:	1080004e 	beqz	a0,bfc072fc <core_init_state+0x56c>
bfc071c4:	25670004 	addiu	a3,t3,4
bfc071c8:	10600032 	beqz	v1,bfc07294 <core_init_state+0x504>
bfc071cc:	00000000 	nop
bfc071d0:	10690029 	beq	v1,t1,bfc07278 <core_init_state+0x4e8>
bfc071d4:	24040002 	li	a0,2
bfc071d8:	10640022 	beq	v1,a0,bfc07264 <core_init_state+0x4d4>
bfc071dc:	24020003 	li	v0,3
bfc071e0:	1062001b 	beq	v1,v0,bfc07250 <core_init_state+0x4c0>
bfc071e4:	24040004 	li	a0,4
bfc071e8:	10640014 	beq	v1,a0,bfc0723c <core_init_state+0x4ac>
bfc071ec:	24020005 	li	v0,5
bfc071f0:	1062000d 	beq	v1,v0,bfc07228 <core_init_state+0x498>
bfc071f4:	24040006 	li	a0,6
bfc071f8:	10640006 	beq	v1,a0,bfc07214 <core_init_state+0x484>
bfc071fc:	00000000 	nop
bfc07200:	8ce90000 	lw	t1,0(a3)
bfc07204:	25480008 	addiu	t0,t2,8
bfc07208:	ad490004 	sw	t1,4(t2)
bfc0720c:	25670008 	addiu	a3,t3,8
bfc07210:	24090002 	li	t1,2
bfc07214:	8cea0000 	lw	t2,0(a3)
bfc07218:	25290001 	addiu	t1,t1,1
bfc0721c:	ad0a0000 	sw	t2,0(t0)
bfc07220:	24e70004 	addiu	a3,a3,4
bfc07224:	25080004 	addiu	t0,t0,4
bfc07228:	8ce30000 	lw	v1,0(a3)
bfc0722c:	25290001 	addiu	t1,t1,1
bfc07230:	ad030000 	sw	v1,0(t0)
bfc07234:	24e70004 	addiu	a3,a3,4
bfc07238:	25080004 	addiu	t0,t0,4
bfc0723c:	8ce20000 	lw	v0,0(a3)
bfc07240:	25290001 	addiu	t1,t1,1
bfc07244:	ad020000 	sw	v0,0(t0)
bfc07248:	24e70004 	addiu	a3,a3,4
bfc0724c:	25080004 	addiu	t0,t0,4
bfc07250:	8ce40000 	lw	a0,0(a3)
bfc07254:	25290001 	addiu	t1,t1,1
bfc07258:	ad040000 	sw	a0,0(t0)
bfc0725c:	24e70004 	addiu	a3,a3,4
bfc07260:	25080004 	addiu	t0,t0,4
bfc07264:	8cea0000 	lw	t2,0(a3)
bfc07268:	25290001 	addiu	t1,t1,1
bfc0726c:	ad0a0000 	sw	t2,0(t0)
bfc07270:	24e70004 	addiu	a3,a3,4
bfc07274:	25080004 	addiu	t0,t0,4
bfc07278:	8ce20000 	lw	v0,0(a3)
bfc0727c:	25290001 	addiu	t1,t1,1
bfc07280:	012e182b 	sltu	v1,t1,t6
bfc07284:	ad020000 	sw	v0,0(t0)
bfc07288:	24e70004 	addiu	a3,a3,4
bfc0728c:	1060001b 	beqz	v1,bfc072fc <core_init_state+0x56c>
bfc07290:	25080004 	addiu	t0,t0,4
bfc07294:	8cea0000 	lw	t2,0(a3)
bfc07298:	25290008 	addiu	t1,t1,8
bfc0729c:	ad0a0000 	sw	t2,0(t0)
bfc072a0:	8ce20004 	lw	v0,4(a3)
bfc072a4:	012e502b 	sltu	t2,t1,t6
bfc072a8:	ad020004 	sw	v0,4(t0)
bfc072ac:	8ce40008 	lw	a0,8(a3)
bfc072b0:	00000000 	nop
bfc072b4:	ad040008 	sw	a0,8(t0)
bfc072b8:	8ce3000c 	lw	v1,12(a3)
bfc072bc:	00000000 	nop
bfc072c0:	ad03000c 	sw	v1,12(t0)
bfc072c4:	8ce20010 	lw	v0,16(a3)
bfc072c8:	00000000 	nop
bfc072cc:	ad020010 	sw	v0,16(t0)
bfc072d0:	8ce40014 	lw	a0,20(a3)
bfc072d4:	00000000 	nop
bfc072d8:	ad040014 	sw	a0,20(t0)
bfc072dc:	8ce30018 	lw	v1,24(a3)
bfc072e0:	00000000 	nop
bfc072e4:	ad030018 	sw	v1,24(t0)
bfc072e8:	8ce2001c 	lw	v0,28(a3)
bfc072ec:	24e70020 	addiu	a3,a3,32
bfc072f0:	ad02001c 	sw	v0,28(t0)
bfc072f4:	1540ffe7 	bnez	t2,bfc07294 <core_init_state+0x504>
bfc072f8:	25080020 	addiu	t0,t0,32
bfc072fc:	118dff97 	beq	t4,t5,bfc0715c <core_init_state+0x3cc>
bfc07300:	00000000 	nop
bfc07304:	016d5821 	addu	t3,t3,t5
bfc07308:	01a61821 	addu	v1,t5,a2
bfc0730c:	000d4027 	nor	t0,zero,t5
bfc07310:	91670000 	lbu	a3,0(t3)
bfc07314:	25a90001 	addiu	t1,t5,1
bfc07318:	03235021 	addu	t2,t9,v1
bfc0731c:	010c7021 	addu	t6,t0,t4
bfc07320:	012c302b 	sltu	a2,t1,t4
bfc07324:	a1470000 	sb	a3,0(t2)
bfc07328:	31c40007 	andi	a0,t6,0x7
bfc0732c:	25680001 	addiu	t0,t3,1
bfc07330:	10c0ff8a 	beqz	a2,bfc0715c <core_init_state+0x3cc>
bfc07334:	25470001 	addiu	a3,t2,1
bfc07338:	10800032 	beqz	a0,bfc07404 <core_init_state+0x674>
bfc0733c:	24020001 	li	v0,1
bfc07340:	10820029 	beq	a0,v0,bfc073e8 <core_init_state+0x658>
bfc07344:	240e0002 	li	t6,2
bfc07348:	108e0022 	beq	a0,t6,bfc073d4 <core_init_state+0x644>
bfc0734c:	24030003 	li	v1,3
bfc07350:	1083001b 	beq	a0,v1,bfc073c0 <core_init_state+0x630>
bfc07354:	24060004 	li	a2,4
bfc07358:	10860014 	beq	a0,a2,bfc073ac <core_init_state+0x61c>
bfc0735c:	24020005 	li	v0,5
bfc07360:	1082000d 	beq	a0,v0,bfc07398 <core_init_state+0x608>
bfc07364:	240e0006 	li	t6,6
bfc07368:	108e0006 	beq	a0,t6,bfc07384 <core_init_state+0x5f4>
bfc0736c:	00000000 	nop
bfc07370:	91670001 	lbu	a3,1(t3)
bfc07374:	25a90002 	addiu	t1,t5,2
bfc07378:	a1470001 	sb	a3,1(t2)
bfc0737c:	25680002 	addiu	t0,t3,2
bfc07380:	25470002 	addiu	a3,t2,2
bfc07384:	910b0000 	lbu	t3,0(t0)
bfc07388:	25290001 	addiu	t1,t1,1
bfc0738c:	a0eb0000 	sb	t3,0(a3)
bfc07390:	25080001 	addiu	t0,t0,1
bfc07394:	24e70001 	addiu	a3,a3,1
bfc07398:	910a0000 	lbu	t2,0(t0)
bfc0739c:	25290001 	addiu	t1,t1,1
bfc073a0:	a0ea0000 	sb	t2,0(a3)
bfc073a4:	25080001 	addiu	t0,t0,1
bfc073a8:	24e70001 	addiu	a3,a3,1
bfc073ac:	910d0000 	lbu	t5,0(t0)
bfc073b0:	25290001 	addiu	t1,t1,1
bfc073b4:	a0ed0000 	sb	t5,0(a3)
bfc073b8:	25080001 	addiu	t0,t0,1
bfc073bc:	24e70001 	addiu	a3,a3,1
bfc073c0:	91040000 	lbu	a0,0(t0)
bfc073c4:	25290001 	addiu	t1,t1,1
bfc073c8:	a0e40000 	sb	a0,0(a3)
bfc073cc:	25080001 	addiu	t0,t0,1
bfc073d0:	24e70001 	addiu	a3,a3,1
bfc073d4:	91030000 	lbu	v1,0(t0)
bfc073d8:	25290001 	addiu	t1,t1,1
bfc073dc:	a0e30000 	sb	v1,0(a3)
bfc073e0:	25080001 	addiu	t0,t0,1
bfc073e4:	24e70001 	addiu	a3,a3,1
bfc073e8:	91020000 	lbu	v0,0(t0)
bfc073ec:	25290001 	addiu	t1,t1,1
bfc073f0:	012c302b 	sltu	a2,t1,t4
bfc073f4:	a0e20000 	sb	v0,0(a3)
bfc073f8:	25080001 	addiu	t0,t0,1
bfc073fc:	10c0ff57 	beqz	a2,bfc0715c <core_init_state+0x3cc>
bfc07400:	24e70001 	addiu	a3,a3,1
bfc07404:	910b0000 	lbu	t3,0(t0)
bfc07408:	25290008 	addiu	t1,t1,8
bfc0740c:	a0eb0000 	sb	t3,0(a3)
bfc07410:	91030001 	lbu	v1,1(t0)
bfc07414:	012c582b 	sltu	t3,t1,t4
bfc07418:	a0e30001 	sb	v1,1(a3)
bfc0741c:	910e0002 	lbu	t6,2(t0)
bfc07420:	00000000 	nop
bfc07424:	a0ee0002 	sb	t6,2(a3)
bfc07428:	91060003 	lbu	a2,3(t0)
bfc0742c:	00000000 	nop
bfc07430:	a0e60003 	sb	a2,3(a3)
bfc07434:	910a0004 	lbu	t2,4(t0)
bfc07438:	00000000 	nop
bfc0743c:	a0ea0004 	sb	t2,4(a3)
bfc07440:	91020005 	lbu	v0,5(t0)
bfc07444:	00000000 	nop
bfc07448:	a0e20005 	sb	v0,5(a3)
bfc0744c:	91040006 	lbu	a0,6(t0)
bfc07450:	00000000 	nop
bfc07454:	a0e40006 	sb	a0,6(a3)
bfc07458:	910d0007 	lbu	t5,7(t0)
bfc0745c:	25080008 	addiu	t0,t0,8
bfc07460:	a0ed0007 	sb	t5,7(a3)
bfc07464:	1560ffe7 	bnez	t3,bfc07404 <core_init_state+0x674>
bfc07468:	24e70008 	addiu	a3,a3,8
bfc0746c:	03386021 	addu	t4,t9,t8
bfc07470:	0bf01b87 	j	bfc06e1c <core_init_state+0x8c>
bfc07474:	a1930000 	sb	s3,0(t4)
	...

bfc07480 <core_state_transition>:
core_state_transition():
bfc07480:	27bdffe8 	addiu	sp,sp,-24
bfc07484:	8c880000 	lw	t0,0(a0)
bfc07488:	afb10008 	sw	s1,8(sp)
bfc0748c:	afb40014 	sw	s4,20(sp)
bfc07490:	afb30010 	sw	s3,16(sp)
bfc07494:	afb2000c 	sw	s2,12(sp)
bfc07498:	afb00004 	sw	s0,4(sp)
bfc0749c:	91060000 	lbu	a2,0(t0)
bfc074a0:	00000000 	nop
bfc074a4:	10c000bd 	beqz	a2,bfc0779c <core_state_transition+0x31c>
bfc074a8:	00808821 	move	s1,a0
bfc074ac:	2402002c 	li	v0,44
bfc074b0:	10c200bc 	beq	a2,v0,bfc077a4 <core_state_transition+0x324>
bfc074b4:	3c038000 	lui	v1,0x8000
bfc074b8:	246405d0 	addiu	a0,v1,1488
bfc074bc:	00003821 	move	a3,zero
bfc074c0:	24b80004 	addiu	t8,a1,4
bfc074c4:	240f0001 	li	t7,1
bfc074c8:	24ab0018 	addiu	t3,a1,24
bfc074cc:	2410002b 	li	s0,43
bfc074d0:	24aa000c 	addiu	t2,a1,12
bfc074d4:	2412002d 	li	s2,45
bfc074d8:	24130045 	li	s3,69
bfc074dc:	24ac0014 	addiu	t4,a1,20
bfc074e0:	24140065 	li	s4,101
bfc074e4:	2419002e 	li	t9,46
bfc074e8:	24ae0010 	addiu	t6,a1,16
bfc074ec:	24a90008 	addiu	t1,a1,8
bfc074f0:	240d002c 	li	t5,44
bfc074f4:	00071880 	sll	v1,a3,0x2
bfc074f8:	00831021 	addu	v0,a0,v1
bfc074fc:	8c430000 	lw	v1,0(v0)
bfc07500:	00000000 	nop
bfc07504:	00600008 	jr	v1
bfc07508:	00000000 	nop
bfc0750c:	00000000 	nop
bfc07510:	24c3ffd0 	addiu	v1,a2,-48
bfc07514:	306200ff 	andi	v0,v1,0xff
bfc07518:	2c47000a 	sltiu	a3,v0,10
bfc0751c:	10e00084 	beqz	a3,bfc07730 <core_state_transition+0x2b0>
bfc07520:	24070004 	li	a3,4
bfc07524:	8ca60000 	lw	a2,0(a1)
bfc07528:	00000000 	nop
bfc0752c:	24c30001 	addiu	v1,a2,1
bfc07530:	aca30000 	sw	v1,0(a1)
bfc07534:	25080001 	addiu	t0,t0,1
bfc07538:	91060000 	lbu	a2,0(t0)
bfc0753c:	00000000 	nop
bfc07540:	10c00006 	beqz	a2,bfc0755c <core_state_transition+0xdc>
bfc07544:	00000000 	nop
bfc07548:	10ef0004 	beq	a3,t7,bfc0755c <core_state_transition+0xdc>
bfc0754c:	00000000 	nop
bfc07550:	14cdffe9 	bne	a2,t5,bfc074f8 <core_state_transition+0x78>
bfc07554:	00071880 	sll	v1,a3,0x2
bfc07558:	25080001 	addiu	t0,t0,1
bfc0755c:	ae280000 	sw	t0,0(s1)
bfc07560:	00e01021 	move	v0,a3
bfc07564:	8fb40014 	lw	s4,20(sp)
bfc07568:	8fb30010 	lw	s3,16(sp)
bfc0756c:	8fb2000c 	lw	s2,12(sp)
bfc07570:	8fb10008 	lw	s1,8(sp)
bfc07574:	8fb00004 	lw	s0,4(sp)
bfc07578:	03e00008 	jr	ra
bfc0757c:	27bd0018 	addiu	sp,sp,24
bfc07580:	24c3ffd0 	addiu	v1,a2,-48
bfc07584:	306200ff 	andi	v0,v1,0xff
bfc07588:	2c46000a 	sltiu	a2,v0,10
bfc0758c:	14c0ffe9 	bnez	a2,bfc07534 <core_state_transition+0xb4>
bfc07590:	00000000 	nop
bfc07594:	8f020000 	lw	v0,0(t8)
bfc07598:	24070001 	li	a3,1
bfc0759c:	24460001 	addiu	a2,v0,1
bfc075a0:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc075a4:	af060000 	sw	a2,0(t8)
	...
bfc075b0:	24c2ffd0 	addiu	v0,a2,-48
bfc075b4:	304600ff 	andi	a2,v0,0xff
bfc075b8:	2cc7000a 	sltiu	a3,a2,10
bfc075bc:	10e0004c 	beqz	a3,bfc076f0 <core_state_transition+0x270>
bfc075c0:	00000000 	nop
bfc075c4:	8d660000 	lw	a2,0(t3)
bfc075c8:	24070007 	li	a3,7
bfc075cc:	24c30001 	addiu	v1,a2,1
bfc075d0:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc075d4:	ad630000 	sw	v1,0(t3)
	...
bfc075e0:	10d30033 	beq	a2,s3,bfc076b0 <core_state_transition+0x230>
bfc075e4:	00000000 	nop
bfc075e8:	10d40031 	beq	a2,s4,bfc076b0 <core_state_transition+0x230>
bfc075ec:	24c3ffd0 	addiu	v1,a2,-48
bfc075f0:	306200ff 	andi	v0,v1,0xff
bfc075f4:	2c46000a 	sltiu	a2,v0,10
bfc075f8:	14c0ffce 	bnez	a2,bfc07534 <core_state_transition+0xb4>
bfc075fc:	00000000 	nop
bfc07600:	8d820000 	lw	v0,0(t4)
bfc07604:	24070001 	li	a3,1
bfc07608:	24460001 	addiu	a2,v0,1
bfc0760c:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07610:	ad860000 	sw	a2,0(t4)
	...
bfc07620:	10d90057 	beq	a2,t9,bfc07780 <core_state_transition+0x300>
bfc07624:	24c2ffd0 	addiu	v0,a2,-48
bfc07628:	304600ff 	andi	a2,v0,0xff
bfc0762c:	2cc3000a 	sltiu	v1,a2,10
bfc07630:	1460ffc0 	bnez	v1,bfc07534 <core_state_transition+0xb4>
bfc07634:	00000000 	nop
bfc07638:	8dc60000 	lw	a2,0(t6)
bfc0763c:	24070001 	li	a3,1
bfc07640:	24c30001 	addiu	v1,a2,1
bfc07644:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07648:	adc30000 	sw	v1,0(t6)
bfc0764c:	00000000 	nop
bfc07650:	24c3ffd0 	addiu	v1,a2,-48
bfc07654:	306200ff 	andi	v0,v1,0xff
bfc07658:	2c47000a 	sltiu	a3,v0,10
bfc0765c:	10e0002c 	beqz	a3,bfc07710 <core_state_transition+0x290>
bfc07660:	24070004 	li	a3,4
bfc07664:	8d220000 	lw	v0,0(t1)
bfc07668:	00000000 	nop
bfc0766c:	24460001 	addiu	a2,v0,1
bfc07670:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07674:	ad260000 	sw	a2,0(t1)
	...
bfc07680:	10d00013 	beq	a2,s0,bfc076d0 <core_state_transition+0x250>
bfc07684:	00000000 	nop
bfc07688:	10d20011 	beq	a2,s2,bfc076d0 <core_state_transition+0x250>
bfc0768c:	00000000 	nop
bfc07690:	8d430000 	lw	v1,0(t2)
bfc07694:	24070001 	li	a3,1
bfc07698:	24620001 	addiu	v0,v1,1
bfc0769c:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc076a0:	ad420000 	sw	v0,0(t2)
	...
bfc076b0:	8d830000 	lw	v1,0(t4)
bfc076b4:	24070003 	li	a3,3
bfc076b8:	24620001 	addiu	v0,v1,1
bfc076bc:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc076c0:	ad820000 	sw	v0,0(t4)
	...
bfc076d0:	8d460000 	lw	a2,0(t2)
bfc076d4:	24070006 	li	a3,6
bfc076d8:	24c30001 	addiu	v1,a2,1
bfc076dc:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc076e0:	ad430000 	sw	v1,0(t2)
	...
bfc076f0:	8d630000 	lw	v1,0(t3)
bfc076f4:	24070001 	li	a3,1
bfc076f8:	24620001 	addiu	v0,v1,1
bfc076fc:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07700:	ad620000 	sw	v0,0(t3)
	...
bfc07710:	10d90013 	beq	a2,t9,bfc07760 <core_state_transition+0x2e0>
bfc07714:	00000000 	nop
bfc07718:	8d230000 	lw	v1,0(t1)
bfc0771c:	24070001 	li	a3,1
bfc07720:	24620001 	addiu	v0,v1,1
bfc07724:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07728:	ad220000 	sw	v0,0(t1)
bfc0772c:	00000000 	nop
bfc07730:	10d0ff7c 	beq	a2,s0,bfc07524 <core_state_transition+0xa4>
bfc07734:	24070002 	li	a3,2
bfc07738:	10d2ff7a 	beq	a2,s2,bfc07524 <core_state_transition+0xa4>
bfc0773c:	00000000 	nop
bfc07740:	10d90014 	beq	a2,t9,bfc07794 <core_state_transition+0x314>
bfc07744:	00000000 	nop
bfc07748:	8f020000 	lw	v0,0(t8)
bfc0774c:	24070001 	li	a3,1
bfc07750:	24460001 	addiu	a2,v0,1
bfc07754:	0bf01d49 	j	bfc07524 <core_state_transition+0xa4>
bfc07758:	af060000 	sw	a2,0(t8)
bfc0775c:	00000000 	nop
bfc07760:	8d260000 	lw	a2,0(t1)
bfc07764:	24070005 	li	a3,5
bfc07768:	24c30001 	addiu	v1,a2,1
bfc0776c:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07770:	ad230000 	sw	v1,0(t1)
	...
bfc07780:	8dc20000 	lw	v0,0(t6)
bfc07784:	24070005 	li	a3,5
bfc07788:	24460001 	addiu	a2,v0,1
bfc0778c:	0bf01d4d 	j	bfc07534 <core_state_transition+0xb4>
bfc07790:	adc60000 	sw	a2,0(t6)
bfc07794:	0bf01d49 	j	bfc07524 <core_state_transition+0xa4>
bfc07798:	24070005 	li	a3,5
bfc0779c:	0bf01d57 	j	bfc0755c <core_state_transition+0xdc>
bfc077a0:	00003821 	move	a3,zero
bfc077a4:	00003821 	move	a3,zero
bfc077a8:	0bf01d57 	j	bfc0755c <core_state_transition+0xdc>
bfc077ac:	25080001 	addiu	t0,t0,1

bfc077b0 <core_bench_state>:
core_bench_state():
bfc077b0:	27bdff98 	addiu	sp,sp,-104
bfc077b4:	afb40060 	sw	s4,96(sp)
bfc077b8:	afb3005c 	sw	s3,92(sp)
bfc077bc:	afb20058 	sw	s2,88(sp)
bfc077c0:	afb00050 	sw	s0,80(sp)
bfc077c4:	afbf0064 	sw	ra,100(sp)
bfc077c8:	afb10054 	sw	s1,84(sp)
bfc077cc:	90ab0000 	lbu	t3,0(a1)
bfc077d0:	00068400 	sll	s0,a2,0x10
bfc077d4:	00079400 	sll	s2,a3,0x10
bfc077d8:	00809821 	move	s3,a0
bfc077dc:	00108403 	sra	s0,s0,0x10
bfc077e0:	afa00030 	sw	zero,48(sp)
bfc077e4:	afa00010 	sw	zero,16(sp)
bfc077e8:	afa00034 	sw	zero,52(sp)
bfc077ec:	afa00014 	sw	zero,20(sp)
bfc077f0:	afa00038 	sw	zero,56(sp)
bfc077f4:	afa00018 	sw	zero,24(sp)
bfc077f8:	afa0003c 	sw	zero,60(sp)
bfc077fc:	afa0001c 	sw	zero,28(sp)
bfc07800:	afa00040 	sw	zero,64(sp)
bfc07804:	afa00020 	sw	zero,32(sp)
bfc07808:	afa00044 	sw	zero,68(sp)
bfc0780c:	afa00024 	sw	zero,36(sp)
bfc07810:	afa00048 	sw	zero,72(sp)
bfc07814:	afa00028 	sw	zero,40(sp)
bfc07818:	afa0004c 	sw	zero,76(sp)
bfc0781c:	afa0002c 	sw	zero,44(sp)
bfc07820:	87ad0078 	lh	t5,120(sp)
bfc07824:	97b4007c 	lhu	s4,124(sp)
bfc07828:	11600054 	beqz	t3,bfc0797c <core_bench_state+0x1cc>
bfc0782c:	00129403 	sra	s2,s2,0x10
bfc07830:	3c028000 	lui	v0,0x8000
bfc07834:	01604821 	move	t1,t3
bfc07838:	240e002c 	li	t6,44
bfc0783c:	245905f0 	addiu	t9,v0,1520
bfc07840:	00a06021 	move	t4,a1
bfc07844:	27b10010 	addiu	s1,sp,16
bfc07848:	240f0001 	li	t7,1
bfc0784c:	241f002b 	li	ra,43
bfc07850:	2404002d 	li	a0,45
bfc07854:	24060045 	li	a2,69
bfc07858:	112e0028 	beq	t1,t6,bfc078fc <core_bench_state+0x14c>
bfc0785c:	24070065 	li	a3,101
bfc07860:	00005021 	move	t2,zero
bfc07864:	2418002e 	li	t8,46
bfc07868:	000a4080 	sll	t0,t2,0x2
bfc0786c:	03281021 	addu	v0,t9,t0
bfc07870:	8c430000 	lw	v1,0(v0)
bfc07874:	00000000 	nop
bfc07878:	00600008 	jr	v1
bfc0787c:	00000000 	nop
bfc07880:	1126008f 	beq	t1,a2,bfc07ac0 <core_bench_state+0x310>
bfc07884:	00000000 	nop
bfc07888:	1127008d 	beq	t1,a3,bfc07ac0 <core_bench_state+0x310>
bfc0788c:	2522ffd0 	addiu	v0,t1,-48
bfc07890:	304900ff 	andi	t1,v0,0xff
bfc07894:	2d23000a 	sltiu	v1,t1,10
bfc07898:	14600005 	bnez	v1,bfc078b0 <core_bench_state+0x100>
bfc0789c:	00000000 	nop
bfc078a0:	8fa30044 	lw	v1,68(sp)
bfc078a4:	240a0001 	li	t2,1
bfc078a8:	24680001 	addiu	t0,v1,1
bfc078ac:	afa80044 	sw	t0,68(sp)
bfc078b0:	258c0001 	addiu	t4,t4,1
bfc078b4:	91880000 	lbu	t0,0(t4)
bfc078b8:	00000000 	nop
bfc078bc:	11000029 	beqz	t0,bfc07964 <core_bench_state+0x1b4>
bfc078c0:	01004821 	move	t1,t0
bfc078c4:	114f00b2 	beq	t2,t7,bfc07b90 <core_bench_state+0x3e0>
bfc078c8:	00000000 	nop
bfc078cc:	152effe7 	bne	t1,t6,bfc0786c <core_bench_state+0xbc>
bfc078d0:	000a4080 	sll	t0,t2,0x2
bfc078d4:	02281821 	addu	v1,s1,t0
bfc078d8:	8c6a0000 	lw	t2,0(v1)
bfc078dc:	258c0001 	addiu	t4,t4,1
bfc078e0:	91880000 	lbu	t0,0(t4)
bfc078e4:	25490001 	addiu	t1,t2,1
bfc078e8:	11000024 	beqz	t0,bfc0797c <core_bench_state+0x1cc>
bfc078ec:	ac690000 	sw	t1,0(v1)
bfc078f0:	01004821 	move	t1,t0
bfc078f4:	152effdb 	bne	t1,t6,bfc07864 <core_bench_state+0xb4>
bfc078f8:	00005021 	move	t2,zero
bfc078fc:	00005021 	move	t2,zero
bfc07900:	000a4080 	sll	t0,t2,0x2
bfc07904:	02281821 	addu	v1,s1,t0
bfc07908:	8c6a0000 	lw	t2,0(v1)
bfc0790c:	258c0001 	addiu	t4,t4,1
bfc07910:	91880000 	lbu	t0,0(t4)
bfc07914:	25490001 	addiu	t1,t2,1
bfc07918:	1500fff5 	bnez	t0,bfc078f0 <core_bench_state+0x140>
bfc0791c:	ac690000 	sw	t1,0(v1)
bfc07920:	0bf01e60 	j	bfc07980 <core_bench_state+0x1d0>
bfc07924:	00b32021 	addu	a0,a1,s3
	...
bfc07930:	2522ffd0 	addiu	v0,t1,-48
bfc07934:	304300ff 	andi	v1,v0,0xff
bfc07938:	2c68000a 	sltiu	t0,v1,10
bfc0793c:	1500ffdc 	bnez	t0,bfc078b0 <core_bench_state+0x100>
bfc07940:	00000000 	nop
bfc07944:	8fa80034 	lw	t0,52(sp)
bfc07948:	258c0001 	addiu	t4,t4,1
bfc0794c:	25090001 	addiu	t1,t0,1
bfc07950:	afa90034 	sw	t1,52(sp)
bfc07954:	91880000 	lbu	t0,0(t4)
bfc07958:	240a0001 	li	t2,1
bfc0795c:	1500ffd9 	bnez	t0,bfc078c4 <core_bench_state+0x114>
bfc07960:	01004821 	move	t1,t0
bfc07964:	000a6080 	sll	t4,t2,0x2
bfc07968:	022cc821 	addu	t9,s1,t4
bfc0796c:	8f3f0000 	lw	ra,0(t9)
bfc07970:	00000000 	nop
bfc07974:	27e40001 	addiu	a0,ra,1
bfc07978:	af240000 	sw	a0,0(t9)
bfc0797c:	00b32021 	addu	a0,a1,s3
bfc07980:	00a4382b 	sltu	a3,a1,a0
bfc07984:	10e00091 	beqz	a3,bfc07bcc <core_bench_state+0x41c>
bfc07988:	00ad1821 	addu	v1,a1,t5
bfc0798c:	00a04021 	move	t0,a1
bfc07990:	240a002c 	li	t2,44
bfc07994:	000d4823 	negu	t1,t5
bfc07998:	116a0002 	beq	t3,t2,bfc079a4 <core_bench_state+0x1f4>
bfc0799c:	01703026 	xor	a2,t3,s0
bfc079a0:	a1060000 	sb	a2,0(t0)
bfc079a4:	006d1821 	addu	v1,v1,t5
bfc079a8:	006d6023 	subu	t4,v1,t5
bfc079ac:	0184582b 	sltu	t3,t4,a0
bfc079b0:	11600084 	beqz	t3,bfc07bc4 <core_bench_state+0x414>
bfc079b4:	010d4021 	addu	t0,t0,t5
bfc079b8:	00697021 	addu	t6,v1,t1
bfc079bc:	91cb0000 	lbu	t3,0(t6)
bfc079c0:	0bf01e66 	j	bfc07998 <core_bench_state+0x1e8>
bfc079c4:	00000000 	nop
	...
bfc079d0:	11380067 	beq	t1,t8,bfc07b70 <core_bench_state+0x3c0>
bfc079d4:	2528ffd0 	addiu	t0,t1,-48
bfc079d8:	310200ff 	andi	v0,t0,0xff
bfc079dc:	2c49000a 	sltiu	t1,v0,10
bfc079e0:	1520ffb3 	bnez	t1,bfc078b0 <core_bench_state+0x100>
bfc079e4:	00000000 	nop
bfc079e8:	8fa90040 	lw	t1,64(sp)
bfc079ec:	240a0001 	li	t2,1
bfc079f0:	25230001 	addiu	v1,t1,1
bfc079f4:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc079f8:	afa30040 	sw	v1,64(sp)
bfc079fc:	00000000 	nop
bfc07a00:	113f0037 	beq	t1,ra,bfc07ae0 <core_bench_state+0x330>
bfc07a04:	00000000 	nop
bfc07a08:	11240035 	beq	t1,a0,bfc07ae0 <core_bench_state+0x330>
bfc07a0c:	00000000 	nop
bfc07a10:	8fa3003c 	lw	v1,60(sp)
bfc07a14:	240a0001 	li	t2,1
bfc07a18:	24680001 	addiu	t0,v1,1
bfc07a1c:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07a20:	afa8003c 	sw	t0,60(sp)
	...
bfc07a30:	2522ffd0 	addiu	v0,t1,-48
bfc07a34:	304900ff 	andi	t1,v0,0xff
bfc07a38:	2d2a000a 	sltiu	t2,t1,10
bfc07a3c:	11400038 	beqz	t2,bfc07b20 <core_bench_state+0x370>
bfc07a40:	00000000 	nop
bfc07a44:	8fa30048 	lw	v1,72(sp)
bfc07a48:	240a0007 	li	t2,7
bfc07a4c:	24680001 	addiu	t0,v1,1
bfc07a50:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07a54:	afa80048 	sw	t0,72(sp)
	...
bfc07a60:	2522ffd0 	addiu	v0,t1,-48
bfc07a64:	304300ff 	andi	v1,v0,0xff
bfc07a68:	2c6a000a 	sltiu	t2,v1,10
bfc07a6c:	11400034 	beqz	t2,bfc07b40 <core_bench_state+0x390>
bfc07a70:	240a0004 	li	t2,4
bfc07a74:	8fa20030 	lw	v0,48(sp)
bfc07a78:	00000000 	nop
bfc07a7c:	24430001 	addiu	v1,v0,1
bfc07a80:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07a84:	afa30030 	sw	v1,48(sp)
	...
bfc07a90:	2523ffd0 	addiu	v1,t1,-48
bfc07a94:	306800ff 	andi	t0,v1,0xff
bfc07a98:	2d0a000a 	sltiu	t2,t0,10
bfc07a9c:	11400018 	beqz	t2,bfc07b00 <core_bench_state+0x350>
bfc07aa0:	240a0004 	li	t2,4
bfc07aa4:	8fa20038 	lw	v0,56(sp)
bfc07aa8:	00000000 	nop
bfc07aac:	24490001 	addiu	t1,v0,1
bfc07ab0:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07ab4:	afa90038 	sw	t1,56(sp)
	...
bfc07ac0:	8fa80044 	lw	t0,68(sp)
bfc07ac4:	240a0003 	li	t2,3
bfc07ac8:	25020001 	addiu	v0,t0,1
bfc07acc:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07ad0:	afa20044 	sw	v0,68(sp)
	...
bfc07ae0:	8fa2003c 	lw	v0,60(sp)
bfc07ae4:	240a0006 	li	t2,6
bfc07ae8:	24490001 	addiu	t1,v0,1
bfc07aec:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07af0:	afa9003c 	sw	t1,60(sp)
	...
bfc07b00:	1138002b 	beq	t1,t8,bfc07bb0 <core_bench_state+0x400>
bfc07b04:	00000000 	nop
bfc07b08:	8fa20038 	lw	v0,56(sp)
bfc07b0c:	240a0001 	li	t2,1
bfc07b10:	24490001 	addiu	t1,v0,1
bfc07b14:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07b18:	afa90038 	sw	t1,56(sp)
bfc07b1c:	00000000 	nop
bfc07b20:	8fa20048 	lw	v0,72(sp)
bfc07b24:	240a0001 	li	t2,1
bfc07b28:	24490001 	addiu	t1,v0,1
bfc07b2c:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07b30:	afa90048 	sw	t1,72(sp)
	...
bfc07b40:	113fffcc 	beq	t1,ra,bfc07a74 <core_bench_state+0x2c4>
bfc07b44:	240a0002 	li	t2,2
bfc07b48:	1124ffca 	beq	t1,a0,bfc07a74 <core_bench_state+0x2c4>
bfc07b4c:	00000000 	nop
bfc07b50:	11380136 	beq	t1,t8,bfc0802c <core_bench_state+0x87c>
bfc07b54:	00000000 	nop
bfc07b58:	8fa80034 	lw	t0,52(sp)
bfc07b5c:	240a0001 	li	t2,1
bfc07b60:	25090001 	addiu	t1,t0,1
bfc07b64:	0bf01e9d 	j	bfc07a74 <core_bench_state+0x2c4>
bfc07b68:	afa90034 	sw	t1,52(sp)
bfc07b6c:	00000000 	nop
bfc07b70:	8fa30040 	lw	v1,64(sp)
bfc07b74:	240a0005 	li	t2,5
bfc07b78:	24680001 	addiu	t0,v1,1
bfc07b7c:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07b80:	afa80040 	sw	t0,64(sp)
	...
bfc07b90:	8fa90014 	lw	t1,20(sp)
bfc07b94:	00000000 	nop
bfc07b98:	252a0001 	addiu	t2,t1,1
bfc07b9c:	afaa0014 	sw	t2,20(sp)
bfc07ba0:	0bf01e3d 	j	bfc078f4 <core_bench_state+0x144>
bfc07ba4:	01004821 	move	t1,t0
	...
bfc07bb0:	8fa30038 	lw	v1,56(sp)
bfc07bb4:	240a0005 	li	t2,5
bfc07bb8:	24680001 	addiu	t0,v1,1
bfc07bbc:	0bf01e2c 	j	bfc078b0 <core_bench_state+0x100>
bfc07bc0:	afa80038 	sw	t0,56(sp)
bfc07bc4:	90ab0000 	lbu	t3,0(a1)
bfc07bc8:	00000000 	nop
bfc07bcc:	11600053 	beqz	t3,bfc07d1c <core_bench_state+0x56c>
bfc07bd0:	3c118000 	lui	s1,0x8000
bfc07bd4:	240a002c 	li	t2,44
bfc07bd8:	262f0610 	addiu	t7,s1,1552
bfc07bdc:	00a04821 	move	t1,a1
bfc07be0:	27b10010 	addiu	s1,sp,16
bfc07be4:	240c0001 	li	t4,1
bfc07be8:	2418002b 	li	t8,43
bfc07bec:	2419002d 	li	t9,45
bfc07bf0:	241f0045 	li	ra,69
bfc07bf4:	116a002a 	beq	t3,t2,bfc07ca0 <core_bench_state+0x4f0>
bfc07bf8:	24100065 	li	s0,101
bfc07bfc:	00004021 	move	t0,zero
bfc07c00:	240e002e 	li	t6,46
bfc07c04:	00081080 	sll	v0,t0,0x2
bfc07c08:	01e21821 	addu	v1,t7,v0
bfc07c0c:	8c730000 	lw	s3,0(v1)
bfc07c10:	00000000 	nop
bfc07c14:	02600008 	jr	s3
bfc07c18:	00000000 	nop
bfc07c1c:	00000000 	nop
bfc07c20:	117f00bf 	beq	t3,ra,bfc07f20 <core_bench_state+0x770>
bfc07c24:	00000000 	nop
bfc07c28:	117000bd 	beq	t3,s0,bfc07f20 <core_bench_state+0x770>
bfc07c2c:	2566ffd0 	addiu	a2,t3,-48
bfc07c30:	30cb00ff 	andi	t3,a2,0xff
bfc07c34:	2d62000a 	sltiu	v0,t3,10
bfc07c38:	14400005 	bnez	v0,bfc07c50 <core_bench_state+0x4a0>
bfc07c3c:	00000000 	nop
bfc07c40:	8fa30044 	lw	v1,68(sp)
bfc07c44:	24080001 	li	t0,1
bfc07c48:	24730001 	addiu	s3,v1,1
bfc07c4c:	afb30044 	sw	s3,68(sp)
bfc07c50:	25290001 	addiu	t1,t1,1
bfc07c54:	91260000 	lbu	a2,0(t1)
bfc07c58:	00000000 	nop
bfc07c5c:	10c00029 	beqz	a2,bfc07d04 <core_bench_state+0x554>
bfc07c60:	00c05821 	move	t3,a2
bfc07c64:	110c00e2 	beq	t0,t4,bfc07ff0 <core_bench_state+0x840>
bfc07c68:	00000000 	nop
bfc07c6c:	156affe6 	bne	t3,t2,bfc07c08 <core_bench_state+0x458>
bfc07c70:	00081080 	sll	v0,t0,0x2
bfc07c74:	00083080 	sll	a2,t0,0x2
bfc07c78:	02261821 	addu	v1,s1,a2
bfc07c7c:	8c620000 	lw	v0,0(v1)
bfc07c80:	25290001 	addiu	t1,t1,1
bfc07c84:	91260000 	lbu	a2,0(t1)
bfc07c88:	24530001 	addiu	s3,v0,1
bfc07c8c:	10c00023 	beqz	a2,bfc07d1c <core_bench_state+0x56c>
bfc07c90:	ac730000 	sw	s3,0(v1)
bfc07c94:	00c05821 	move	t3,a2
bfc07c98:	156affd9 	bne	t3,t2,bfc07c00 <core_bench_state+0x450>
bfc07c9c:	00004021 	move	t0,zero
bfc07ca0:	00004021 	move	t0,zero
bfc07ca4:	00083080 	sll	a2,t0,0x2
bfc07ca8:	02261821 	addu	v1,s1,a2
bfc07cac:	8c620000 	lw	v0,0(v1)
bfc07cb0:	25290001 	addiu	t1,t1,1
bfc07cb4:	91260000 	lbu	a2,0(t1)
bfc07cb8:	24530001 	addiu	s3,v0,1
bfc07cbc:	14c0fff5 	bnez	a2,bfc07c94 <core_bench_state+0x4e4>
bfc07cc0:	ac730000 	sw	s3,0(v1)
bfc07cc4:	0bf01f47 	j	bfc07d1c <core_bench_state+0x56c>
bfc07cc8:	00000000 	nop
bfc07ccc:	00000000 	nop
bfc07cd0:	2566ffd0 	addiu	a2,t3,-48
bfc07cd4:	30cb00ff 	andi	t3,a2,0xff
bfc07cd8:	2d62000a 	sltiu	v0,t3,10
bfc07cdc:	1440ffdc 	bnez	v0,bfc07c50 <core_bench_state+0x4a0>
bfc07ce0:	00000000 	nop
bfc07ce4:	8fa30034 	lw	v1,52(sp)
bfc07ce8:	25290001 	addiu	t1,t1,1
bfc07cec:	24730001 	addiu	s3,v1,1
bfc07cf0:	afb30034 	sw	s3,52(sp)
bfc07cf4:	91260000 	lbu	a2,0(t1)
bfc07cf8:	24080001 	li	t0,1
bfc07cfc:	14c0ffd9 	bnez	a2,bfc07c64 <core_bench_state+0x4b4>
bfc07d00:	00c05821 	move	t3,a2
bfc07d04:	00081080 	sll	v0,t0,0x2
bfc07d08:	02225821 	addu	t3,s1,v0
bfc07d0c:	8d710000 	lw	s1,0(t3)
bfc07d10:	00000000 	nop
bfc07d14:	26300001 	addiu	s0,s1,1
bfc07d18:	ad700000 	sw	s0,0(t3)
bfc07d1c:	10e0000d 	beqz	a3,bfc07d54 <core_bench_state+0x5a4>
bfc07d20:	00a01821 	move	v1,a1
bfc07d24:	2406002c 	li	a2,44
bfc07d28:	00ad2821 	addu	a1,a1,t5
bfc07d2c:	90620000 	lbu	v0,0(v1)
bfc07d30:	00000000 	nop
bfc07d34:	10460002 	beq	v0,a2,bfc07d40 <core_bench_state+0x590>
bfc07d38:	00523826 	xor	a3,v0,s2
bfc07d3c:	a0670000 	sb	a3,0(v1)
bfc07d40:	00ad2821 	addu	a1,a1,t5
bfc07d44:	00adc023 	subu	t8,a1,t5
bfc07d48:	0304782b 	sltu	t7,t8,a0
bfc07d4c:	15e0fff7 	bnez	t7,bfc07d2c <core_bench_state+0x57c>
bfc07d50:	006d1821 	addu	v1,v1,t5
bfc07d54:	8fa40010 	lw	a0,16(sp)
bfc07d58:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d5c:	02802821 	move	a1,s4
bfc07d60:	8fa40030 	lw	a0,48(sp)
bfc07d64:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d68:	00402821 	move	a1,v0
bfc07d6c:	8fa40014 	lw	a0,20(sp)
bfc07d70:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d74:	00402821 	move	a1,v0
bfc07d78:	8fa40034 	lw	a0,52(sp)
bfc07d7c:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d80:	00402821 	move	a1,v0
bfc07d84:	8fa40018 	lw	a0,24(sp)
bfc07d88:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d8c:	00402821 	move	a1,v0
bfc07d90:	8fa40038 	lw	a0,56(sp)
bfc07d94:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07d98:	00402821 	move	a1,v0
bfc07d9c:	8fa4001c 	lw	a0,28(sp)
bfc07da0:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07da4:	00402821 	move	a1,v0
bfc07da8:	8fa4003c 	lw	a0,60(sp)
bfc07dac:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07db0:	00402821 	move	a1,v0
bfc07db4:	8fa40020 	lw	a0,32(sp)
bfc07db8:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07dbc:	00402821 	move	a1,v0
bfc07dc0:	8fa40040 	lw	a0,64(sp)
bfc07dc4:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07dc8:	00402821 	move	a1,v0
bfc07dcc:	8fa40024 	lw	a0,36(sp)
bfc07dd0:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07dd4:	00402821 	move	a1,v0
bfc07dd8:	8fa40044 	lw	a0,68(sp)
bfc07ddc:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07de0:	00402821 	move	a1,v0
bfc07de4:	8fa40028 	lw	a0,40(sp)
bfc07de8:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07dec:	00402821 	move	a1,v0
bfc07df0:	8fa40048 	lw	a0,72(sp)
bfc07df4:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07df8:	00402821 	move	a1,v0
bfc07dfc:	8fa4002c 	lw	a0,44(sp)
bfc07e00:	0ff018b8 	jal	bfc062e0 <crcu32>
bfc07e04:	00402821 	move	a1,v0
bfc07e08:	8fa4004c 	lw	a0,76(sp)
bfc07e0c:	8fbf0064 	lw	ra,100(sp)
bfc07e10:	8fb40060 	lw	s4,96(sp)
bfc07e14:	8fb3005c 	lw	s3,92(sp)
bfc07e18:	8fb20058 	lw	s2,88(sp)
bfc07e1c:	8fb10054 	lw	s1,84(sp)
bfc07e20:	8fb00050 	lw	s0,80(sp)
bfc07e24:	00402821 	move	a1,v0
bfc07e28:	0bf018b8 	j	bfc062e0 <crcu32>
bfc07e2c:	27bd0068 	addiu	sp,sp,104
bfc07e30:	2562ffd0 	addiu	v0,t3,-48
bfc07e34:	304300ff 	andi	v1,v0,0xff
bfc07e38:	2c68000a 	sltiu	t0,v1,10
bfc07e3c:	11000048 	beqz	t0,bfc07f60 <core_bench_state+0x7b0>
bfc07e40:	00000000 	nop
bfc07e44:	8fa60048 	lw	a2,72(sp)
bfc07e48:	24080007 	li	t0,7
bfc07e4c:	24cb0001 	addiu	t3,a2,1
bfc07e50:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07e54:	afab0048 	sw	t3,72(sp)
	...
bfc07e60:	2573ffd0 	addiu	s3,t3,-48
bfc07e64:	326600ff 	andi	a2,s3,0xff
bfc07e68:	2cc8000a 	sltiu	t0,a2,10
bfc07e6c:	11000044 	beqz	t0,bfc07f80 <core_bench_state+0x7d0>
bfc07e70:	24080004 	li	t0,4
bfc07e74:	8fa60030 	lw	a2,48(sp)
bfc07e78:	00000000 	nop
bfc07e7c:	24c20001 	addiu	v0,a2,1
bfc07e80:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07e84:	afa20030 	sw	v0,48(sp)
	...
bfc07e90:	1178002b 	beq	t3,t8,bfc07f40 <core_bench_state+0x790>
bfc07e94:	00000000 	nop
bfc07e98:	11790029 	beq	t3,t9,bfc07f40 <core_bench_state+0x790>
bfc07e9c:	00000000 	nop
bfc07ea0:	8fb3003c 	lw	s3,60(sp)
bfc07ea4:	24080001 	li	t0,1
bfc07ea8:	26660001 	addiu	a2,s3,1
bfc07eac:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07eb0:	afa6003c 	sw	a2,60(sp)
	...
bfc07ec0:	116e0043 	beq	t3,t6,bfc07fd0 <core_bench_state+0x820>
bfc07ec4:	2562ffd0 	addiu	v0,t3,-48
bfc07ec8:	304300ff 	andi	v1,v0,0xff
bfc07ecc:	2c73000a 	sltiu	s3,v1,10
bfc07ed0:	1660ff5f 	bnez	s3,bfc07c50 <core_bench_state+0x4a0>
bfc07ed4:	00000000 	nop
bfc07ed8:	8fa60040 	lw	a2,64(sp)
bfc07edc:	24080001 	li	t0,1
bfc07ee0:	24cb0001 	addiu	t3,a2,1
bfc07ee4:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07ee8:	afab0040 	sw	t3,64(sp)
bfc07eec:	00000000 	nop
bfc07ef0:	2563ffd0 	addiu	v1,t3,-48
bfc07ef4:	307300ff 	andi	s3,v1,0xff
bfc07ef8:	2e68000a 	sltiu	t0,s3,10
bfc07efc:	1100002c 	beqz	t0,bfc07fb0 <core_bench_state+0x800>
bfc07f00:	24080004 	li	t0,4
bfc07f04:	8fa20038 	lw	v0,56(sp)
bfc07f08:	00000000 	nop
bfc07f0c:	244b0001 	addiu	t3,v0,1
bfc07f10:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07f14:	afab0038 	sw	t3,56(sp)
	...
bfc07f20:	8fa30044 	lw	v1,68(sp)
bfc07f24:	24080003 	li	t0,3
bfc07f28:	24730001 	addiu	s3,v1,1
bfc07f2c:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07f30:	afb30044 	sw	s3,68(sp)
	...
bfc07f40:	8fab003c 	lw	t3,60(sp)
bfc07f44:	24080006 	li	t0,6
bfc07f48:	25620001 	addiu	v0,t3,1
bfc07f4c:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07f50:	afa2003c 	sw	v0,60(sp)
	...
bfc07f60:	8fa30048 	lw	v1,72(sp)
bfc07f64:	24080001 	li	t0,1
bfc07f68:	24730001 	addiu	s3,v1,1
bfc07f6c:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07f70:	afb30048 	sw	s3,72(sp)
	...
bfc07f80:	1178ffbc 	beq	t3,t8,bfc07e74 <core_bench_state+0x6c4>
bfc07f84:	24080002 	li	t0,2
bfc07f88:	1179ffba 	beq	t3,t9,bfc07e74 <core_bench_state+0x6c4>
bfc07f8c:	00000000 	nop
bfc07f90:	116e0024 	beq	t3,t6,bfc08024 <core_bench_state+0x874>
bfc07f94:	00000000 	nop
bfc07f98:	8fa30034 	lw	v1,52(sp)
bfc07f9c:	24080001 	li	t0,1
bfc07fa0:	246b0001 	addiu	t3,v1,1
bfc07fa4:	0bf01f9d 	j	bfc07e74 <core_bench_state+0x6c4>
bfc07fa8:	afab0034 	sw	t3,52(sp)
bfc07fac:	00000000 	nop
bfc07fb0:	116e0017 	beq	t3,t6,bfc08010 <core_bench_state+0x860>
bfc07fb4:	00000000 	nop
bfc07fb8:	8fab0038 	lw	t3,56(sp)
bfc07fbc:	24080001 	li	t0,1
bfc07fc0:	25630001 	addiu	v1,t3,1
bfc07fc4:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07fc8:	afa30038 	sw	v1,56(sp)
bfc07fcc:	00000000 	nop
bfc07fd0:	8fa60040 	lw	a2,64(sp)
bfc07fd4:	24080005 	li	t0,5
bfc07fd8:	24c20001 	addiu	v0,a2,1
bfc07fdc:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc07fe0:	afa20040 	sw	v0,64(sp)
	...
bfc07ff0:	8fa80014 	lw	t0,20(sp)
bfc07ff4:	00c05821 	move	t3,a2
bfc07ff8:	250e0001 	addiu	t6,t0,1
bfc07ffc:	0bf01f26 	j	bfc07c98 <core_bench_state+0x4e8>
bfc08000:	afae0014 	sw	t6,20(sp)
	...
bfc08010:	8fb30038 	lw	s3,56(sp)
bfc08014:	24080005 	li	t0,5
bfc08018:	26660001 	addiu	a2,s3,1
bfc0801c:	0bf01f14 	j	bfc07c50 <core_bench_state+0x4a0>
bfc08020:	afa60038 	sw	a2,56(sp)
bfc08024:	0bf01f9d 	j	bfc07e74 <core_bench_state+0x6c4>
bfc08028:	24080005 	li	t0,5
bfc0802c:	0bf01e9d 	j	bfc07a74 <core_bench_state+0x2c4>
bfc08030:	240a0005 	li	t2,5
	...

bfc08040 <cmp_idx>:
cmp_idx():
bfc08040:	10c00007 	beqz	a2,bfc08060 <cmp_idx+0x20>
bfc08044:	00803821 	move	a3,a0
bfc08048:	84ef0002 	lh	t7,2(a3)
bfc0804c:	84a70002 	lh	a3,2(a1)
bfc08050:	03e00008 	jr	ra
bfc08054:	01e71023 	subu	v0,t7,a3
	...
bfc08060:	848d0000 	lh	t5,0(a0)
bfc08064:	2409ff00 	li	t1,-256
bfc08068:	31aeffff 	andi	t6,t5,0xffff
bfc0806c:	000e5a02 	srl	t3,t6,0x8
bfc08070:	01a96024 	and	t4,t5,t1
bfc08074:	016c5025 	or	t2,t3,t4
bfc08078:	a48a0000 	sh	t2,0(a0)
bfc0807c:	84a80000 	lh	t0,0(a1)
bfc08080:	84ef0002 	lh	t7,2(a3)
bfc08084:	3106ffff 	andi	a2,t0,0xffff
bfc08088:	01091824 	and	v1,t0,t1
bfc0808c:	00062202 	srl	a0,a2,0x8
bfc08090:	84a70002 	lh	a3,2(a1)
bfc08094:	00831025 	or	v0,a0,v1
bfc08098:	a4a20000 	sh	v0,0(a1)
bfc0809c:	03e00008 	jr	ra
bfc080a0:	01e71023 	subu	v0,t7,a3
	...

bfc080b0 <copy_info>:
copy_info():
bfc080b0:	94a20002 	lhu	v0,2(a1)
bfc080b4:	94a30000 	lhu	v1,0(a1)
bfc080b8:	a4820002 	sh	v0,2(a0)
bfc080bc:	03e00008 	jr	ra
bfc080c0:	a4830000 	sh	v1,0(a0)
	...

bfc080d0 <core_list_insert_new>:
core_list_insert_new():
bfc080d0:	8cc80000 	lw	t0,0(a2)
bfc080d4:	8fa30010 	lw	v1,16(sp)
bfc080d8:	25090008 	addiu	t1,t0,8
bfc080dc:	0123102b 	sltu	v0,t1,v1
bfc080e0:	00805021 	move	t2,a0
bfc080e4:	14400006 	bnez	v0,bfc08100 <core_list_insert_new+0x30>
bfc080e8:	00a01821 	move	v1,a1
bfc080ec:	00004021 	move	t0,zero
bfc080f0:	03e00008 	jr	ra
bfc080f4:	01001021 	move	v0,t0
	...
bfc08100:	8ce40000 	lw	a0,0(a3)
bfc08104:	8fa50014 	lw	a1,20(sp)
bfc08108:	248c0004 	addiu	t4,a0,4
bfc0810c:	0185582b 	sltu	t3,t4,a1
bfc08110:	1160fff6 	beqz	t3,bfc080ec <core_list_insert_new+0x1c>
bfc08114:	00000000 	nop
bfc08118:	ad040004 	sw	a0,4(t0)
bfc0811c:	8cee0000 	lw	t6,0(a3)
bfc08120:	acc90000 	sw	t1,0(a2)
bfc08124:	25cd0004 	addiu	t5,t6,4
bfc08128:	aced0000 	sw	t5,0(a3)
bfc0812c:	8d490000 	lw	t1,0(t2)
bfc08130:	8d060004 	lw	a2,4(t0)
bfc08134:	94640002 	lhu	a0,2(v1)
bfc08138:	94670000 	lhu	a3,0(v1)
bfc0813c:	ad090000 	sw	t1,0(t0)
bfc08140:	a4c40002 	sh	a0,2(a2)
bfc08144:	a4c70000 	sh	a3,0(a2)
bfc08148:	0bf0203c 	j	bfc080f0 <core_list_insert_new+0x20>
bfc0814c:	ad480000 	sw	t0,0(t2)

bfc08150 <core_list_remove>:
core_list_remove():
bfc08150:	8c820000 	lw	v0,0(a0)
bfc08154:	8c860004 	lw	a2,4(a0)
bfc08158:	8c430004 	lw	v1,4(v0)
bfc0815c:	8c450000 	lw	a1,0(v0)
bfc08160:	ac830004 	sw	v1,4(a0)
bfc08164:	ac850000 	sw	a1,0(a0)
bfc08168:	ac460004 	sw	a2,4(v0)
bfc0816c:	03e00008 	jr	ra
bfc08170:	ac400000 	sw	zero,0(v0)
	...

bfc08180 <core_list_undo_remove>:
core_list_undo_remove():
bfc08180:	00801021 	move	v0,a0
bfc08184:	8c860004 	lw	a2,4(a0)
bfc08188:	8ca30004 	lw	v1,4(a1)
bfc0818c:	8ca40000 	lw	a0,0(a1)
bfc08190:	ac430004 	sw	v1,4(v0)
bfc08194:	ac440000 	sw	a0,0(v0)
bfc08198:	aca60004 	sw	a2,4(a1)
bfc0819c:	03e00008 	jr	ra
bfc081a0:	aca20000 	sw	v0,0(a1)
	...

bfc081b0 <core_list_find>:
core_list_find():
bfc081b0:	84a60002 	lh	a2,2(a1)
bfc081b4:	00000000 	nop
bfc081b8:	04c00011 	bltz	a2,bfc08200 <core_list_find+0x50>
bfc081bc:	00000000 	nop
bfc081c0:	1080000b 	beqz	a0,bfc081f0 <core_list_find+0x40>
bfc081c4:	00000000 	nop
bfc081c8:	8c870004 	lw	a3,4(a0)
bfc081cc:	00000000 	nop
bfc081d0:	84e50002 	lh	a1,2(a3)
bfc081d4:	00000000 	nop
bfc081d8:	10a60005 	beq	a1,a2,bfc081f0 <core_list_find+0x40>
bfc081dc:	00000000 	nop
bfc081e0:	8c840000 	lw	a0,0(a0)
bfc081e4:	00000000 	nop
bfc081e8:	1480fff7 	bnez	a0,bfc081c8 <core_list_find+0x18>
bfc081ec:	00000000 	nop
bfc081f0:	03e00008 	jr	ra
bfc081f4:	00801021 	move	v0,a0
	...
bfc08200:	1080fffb 	beqz	a0,bfc081f0 <core_list_find+0x40>
bfc08204:	00000000 	nop
bfc08208:	8c830004 	lw	v1,4(a0)
bfc0820c:	84a50000 	lh	a1,0(a1)
bfc08210:	90620000 	lbu	v0,0(v1)
bfc08214:	00000000 	nop
bfc08218:	1445000b 	bne	v0,a1,bfc08248 <core_list_find+0x98>
bfc0821c:	00000000 	nop
bfc08220:	0bf0207c 	j	bfc081f0 <core_list_find+0x40>
bfc08224:	00000000 	nop
	...
bfc08230:	8c880004 	lw	t0,4(a0)
bfc08234:	00000000 	nop
bfc08238:	91060000 	lbu	a2,0(t0)
bfc0823c:	00000000 	nop
bfc08240:	10c5ffeb 	beq	a2,a1,bfc081f0 <core_list_find+0x40>
bfc08244:	00000000 	nop
bfc08248:	8c840000 	lw	a0,0(a0)
bfc0824c:	00000000 	nop
bfc08250:	1480fff7 	bnez	a0,bfc08230 <core_list_find+0x80>
bfc08254:	00801021 	move	v0,a0
bfc08258:	03e00008 	jr	ra
bfc0825c:	00000000 	nop

bfc08260 <core_list_reverse>:
core_list_reverse():
bfc08260:	10800027 	beqz	a0,bfc08300 <core_list_reverse+0xa0>
bfc08264:	00801021 	move	v0,a0
bfc08268:	8c430000 	lw	v1,0(v0)
bfc0826c:	00002021 	move	a0,zero
bfc08270:	10600023 	beqz	v1,bfc08300 <core_list_reverse+0xa0>
bfc08274:	ac440000 	sw	a0,0(v0)
bfc08278:	8c640000 	lw	a0,0(v1)
bfc0827c:	ac620000 	sw	v0,0(v1)
bfc08280:	1080001f 	beqz	a0,bfc08300 <core_list_reverse+0xa0>
bfc08284:	00601021 	move	v0,v1
bfc08288:	8c850000 	lw	a1,0(a0)
bfc0828c:	00801021 	move	v0,a0
bfc08290:	10a0001b 	beqz	a1,bfc08300 <core_list_reverse+0xa0>
bfc08294:	ac830000 	sw	v1,0(a0)
bfc08298:	8ca30000 	lw	v1,0(a1)
bfc0829c:	00a01021 	move	v0,a1
bfc082a0:	10600017 	beqz	v1,bfc08300 <core_list_reverse+0xa0>
bfc082a4:	aca40000 	sw	a0,0(a1)
bfc082a8:	8c640000 	lw	a0,0(v1)
bfc082ac:	00601021 	move	v0,v1
bfc082b0:	10800013 	beqz	a0,bfc08300 <core_list_reverse+0xa0>
bfc082b4:	ac650000 	sw	a1,0(v1)
bfc082b8:	8c850000 	lw	a1,0(a0)
bfc082bc:	00801021 	move	v0,a0
bfc082c0:	10a0000f 	beqz	a1,bfc08300 <core_list_reverse+0xa0>
bfc082c4:	ac830000 	sw	v1,0(a0)
bfc082c8:	8ca30000 	lw	v1,0(a1)
bfc082cc:	00a01021 	move	v0,a1
bfc082d0:	1060000b 	beqz	v1,bfc08300 <core_list_reverse+0xa0>
bfc082d4:	aca40000 	sw	a0,0(a1)
bfc082d8:	00601021 	move	v0,v1
bfc082dc:	8c630000 	lw	v1,0(v1)
bfc082e0:	00402021 	move	a0,v0
bfc082e4:	10600006 	beqz	v1,bfc08300 <core_list_reverse+0xa0>
bfc082e8:	ac450000 	sw	a1,0(v0)
bfc082ec:	00601021 	move	v0,v1
bfc082f0:	8c430000 	lw	v1,0(v0)
bfc082f4:	00000000 	nop
bfc082f8:	1460ffdf 	bnez	v1,bfc08278 <core_list_reverse+0x18>
bfc082fc:	ac440000 	sw	a0,0(v0)
bfc08300:	03e00008 	jr	ra
bfc08304:	00000000 	nop
	...

bfc08310 <core_list_mergesort>:
core_list_mergesort():
bfc08310:	27bdffc8 	addiu	sp,sp,-56
bfc08314:	afb60028 	sw	s6,40(sp)
bfc08318:	0080b021 	move	s6,a0
bfc0831c:	afbe0030 	sw	s8,48(sp)
bfc08320:	afb50024 	sw	s5,36(sp)
bfc08324:	afbf0034 	sw	ra,52(sp)
bfc08328:	afb7002c 	sw	s7,44(sp)
bfc0832c:	afb40020 	sw	s4,32(sp)
bfc08330:	afb3001c 	sw	s3,28(sp)
bfc08334:	afb20018 	sw	s2,24(sp)
bfc08338:	afb10014 	sw	s1,20(sp)
bfc0833c:	afb00010 	sw	s0,16(sp)
bfc08340:	00a0f021 	move	s8,a1
bfc08344:	afa60040 	sw	a2,64(sp)
bfc08348:	12c00090 	beqz	s6,bfc0858c <core_list_mergesort+0x27c>
bfc0834c:	24150001 	li	s5,1
bfc08350:	02c09821 	move	s3,s6
bfc08354:	0000a021 	move	s4,zero
bfc08358:	0000b021 	move	s6,zero
bfc0835c:	0000b821 	move	s7,zero
bfc08360:	8e700000 	lw	s0,0(s3)
bfc08364:	26a2ffff 	addiu	v0,s5,-1
bfc08368:	26f70001 	addiu	s7,s7,1
bfc0836c:	30430007 	andi	v1,v0,0x7
bfc08370:	12000053 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08374:	24110001 	li	s1,1
bfc08378:	0235202a 	slt	a0,s1,s5
bfc0837c:	10800050 	beqz	a0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08380:	00000000 	nop
bfc08384:	1060002c 	beqz	v1,bfc08438 <core_list_mergesort+0x128>
bfc08388:	00000000 	nop
bfc0838c:	10710023 	beq	v1,s1,bfc0841c <core_list_mergesort+0x10c>
bfc08390:	24050002 	li	a1,2
bfc08394:	1065001d 	beq	v1,a1,bfc0840c <core_list_mergesort+0xfc>
bfc08398:	24060003 	li	a2,3
bfc0839c:	10660017 	beq	v1,a2,bfc083fc <core_list_mergesort+0xec>
bfc083a0:	24070004 	li	a3,4
bfc083a4:	10670011 	beq	v1,a3,bfc083ec <core_list_mergesort+0xdc>
bfc083a8:	24080005 	li	t0,5
bfc083ac:	1068000b 	beq	v1,t0,bfc083dc <core_list_mergesort+0xcc>
bfc083b0:	24090006 	li	t1,6
bfc083b4:	10690005 	beq	v1,t1,bfc083cc <core_list_mergesort+0xbc>
bfc083b8:	00000000 	nop
bfc083bc:	8e100000 	lw	s0,0(s0)
bfc083c0:	00000000 	nop
bfc083c4:	1200003e 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc083c8:	24110002 	li	s1,2
bfc083cc:	8e100000 	lw	s0,0(s0)
bfc083d0:	00000000 	nop
bfc083d4:	1200003a 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc083d8:	26310001 	addiu	s1,s1,1
bfc083dc:	8e100000 	lw	s0,0(s0)
bfc083e0:	00000000 	nop
bfc083e4:	12000036 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc083e8:	26310001 	addiu	s1,s1,1
bfc083ec:	8e100000 	lw	s0,0(s0)
bfc083f0:	00000000 	nop
bfc083f4:	12000032 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc083f8:	26310001 	addiu	s1,s1,1
bfc083fc:	8e100000 	lw	s0,0(s0)
bfc08400:	00000000 	nop
bfc08404:	1200002e 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08408:	26310001 	addiu	s1,s1,1
bfc0840c:	8e100000 	lw	s0,0(s0)
bfc08410:	00000000 	nop
bfc08414:	1200002a 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08418:	26310001 	addiu	s1,s1,1
bfc0841c:	8e100000 	lw	s0,0(s0)
bfc08420:	00000000 	nop
bfc08424:	12000026 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08428:	26310001 	addiu	s1,s1,1
bfc0842c:	0235502a 	slt	t2,s1,s5
bfc08430:	11400023 	beqz	t2,bfc084c0 <core_list_mergesort+0x1b0>
bfc08434:	00000000 	nop
bfc08438:	8e100000 	lw	s0,0(s0)
bfc0843c:	26310001 	addiu	s1,s1,1
bfc08440:	1200001f 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08444:	02201021 	move	v0,s1
bfc08448:	8e100000 	lw	s0,0(s0)
bfc0844c:	00000000 	nop
bfc08450:	1200001b 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08454:	26310001 	addiu	s1,s1,1
bfc08458:	8e100000 	lw	s0,0(s0)
bfc0845c:	00000000 	nop
bfc08460:	12000017 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08464:	24510002 	addiu	s1,v0,2
bfc08468:	8e100000 	lw	s0,0(s0)
bfc0846c:	00000000 	nop
bfc08470:	12000013 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08474:	24510003 	addiu	s1,v0,3
bfc08478:	8e100000 	lw	s0,0(s0)
bfc0847c:	00000000 	nop
bfc08480:	1200000f 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08484:	24510004 	addiu	s1,v0,4
bfc08488:	8e100000 	lw	s0,0(s0)
bfc0848c:	00000000 	nop
bfc08490:	1200000b 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc08494:	24510005 	addiu	s1,v0,5
bfc08498:	8e100000 	lw	s0,0(s0)
bfc0849c:	00000000 	nop
bfc084a0:	12000007 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc084a4:	24510006 	addiu	s1,v0,6
bfc084a8:	8e100000 	lw	s0,0(s0)
bfc084ac:	24510007 	addiu	s1,v0,7
bfc084b0:	12000003 	beqz	s0,bfc084c0 <core_list_mergesort+0x1b0>
bfc084b4:	0235102a 	slt	v0,s1,s5
bfc084b8:	1440ffdf 	bnez	v0,bfc08438 <core_list_mergesort+0x128>
bfc084bc:	00000000 	nop
bfc084c0:	12200017 	beqz	s1,bfc08520 <core_list_mergesort+0x210>
bfc084c4:	02a09021 	move	s2,s5
bfc084c8:	12400021 	beqz	s2,bfc08550 <core_list_mergesort+0x240>
bfc084cc:	00000000 	nop
bfc084d0:	1200001f 	beqz	s0,bfc08550 <core_list_mergesort+0x240>
bfc084d4:	00000000 	nop
bfc084d8:	8e640004 	lw	a0,4(s3)
bfc084dc:	8e050004 	lw	a1,4(s0)
bfc084e0:	8fa60040 	lw	a2,64(sp)
bfc084e4:	03c0f809 	jalr	s8
bfc084e8:	00000000 	nop
bfc084ec:	18400018 	blez	v0,bfc08550 <core_list_mergesort+0x240>
bfc084f0:	00000000 	nop
bfc084f4:	8e040000 	lw	a0,0(s0)
bfc084f8:	2652ffff 	addiu	s2,s2,-1
bfc084fc:	02601821 	move	v1,s3
bfc08500:	02001021 	move	v0,s0
bfc08504:	1280000e 	beqz	s4,bfc08540 <core_list_mergesort+0x230>
bfc08508:	00000000 	nop
bfc0850c:	ae820000 	sw	v0,0(s4)
bfc08510:	0040a021 	move	s4,v0
bfc08514:	00609821 	move	s3,v1
bfc08518:	1620ffeb 	bnez	s1,bfc084c8 <core_list_mergesort+0x1b8>
bfc0851c:	00808021 	move	s0,a0
bfc08520:	12400013 	beqz	s2,bfc08570 <core_list_mergesort+0x260>
bfc08524:	00000000 	nop
bfc08528:	12000013 	beqz	s0,bfc08578 <core_list_mergesort+0x268>
bfc0852c:	2652ffff 	addiu	s2,s2,-1
bfc08530:	02601821 	move	v1,s3
bfc08534:	8e040000 	lw	a0,0(s0)
bfc08538:	1680fff4 	bnez	s4,bfc0850c <core_list_mergesort+0x1fc>
bfc0853c:	02001021 	move	v0,s0
bfc08540:	0bf02144 	j	bfc08510 <core_list_mergesort+0x200>
bfc08544:	0040b021 	move	s6,v0
	...
bfc08550:	2631ffff 	addiu	s1,s1,-1
bfc08554:	02002021 	move	a0,s0
bfc08558:	8e630000 	lw	v1,0(s3)
bfc0855c:	0bf02141 	j	bfc08504 <core_list_mergesort+0x1f4>
bfc08560:	02601021 	move	v0,s3
	...
bfc08570:	1600ff7b 	bnez	s0,bfc08360 <core_list_mergesort+0x50>
bfc08574:	02009821 	move	s3,s0
bfc08578:	24030001 	li	v1,1
bfc0857c:	12e30004 	beq	s7,v1,bfc08590 <core_list_mergesort+0x280>
bfc08580:	ae800000 	sw	zero,0(s4)
bfc08584:	16c0ff72 	bnez	s6,bfc08350 <core_list_mergesort+0x40>
bfc08588:	0015a840 	sll	s5,s5,0x1
bfc0858c:	aec00000 	sw	zero,0(s6)
bfc08590:	8fbf0034 	lw	ra,52(sp)
bfc08594:	02c01021 	move	v0,s6
bfc08598:	8fbe0030 	lw	s8,48(sp)
bfc0859c:	8fb7002c 	lw	s7,44(sp)
bfc085a0:	8fb60028 	lw	s6,40(sp)
bfc085a4:	8fb50024 	lw	s5,36(sp)
bfc085a8:	8fb40020 	lw	s4,32(sp)
bfc085ac:	8fb3001c 	lw	s3,28(sp)
bfc085b0:	8fb20018 	lw	s2,24(sp)
bfc085b4:	8fb10014 	lw	s1,20(sp)
bfc085b8:	8fb00010 	lw	s0,16(sp)
bfc085bc:	03e00008 	jr	ra
bfc085c0:	27bd0038 	addiu	sp,sp,56
	...

bfc085d0 <calc_func>:
calc_func():
bfc085d0:	27bdffd0 	addiu	sp,sp,-48
bfc085d4:	afb10020 	sw	s1,32(sp)
bfc085d8:	84910000 	lh	s1,0(a0)
bfc085dc:	afb30028 	sw	s3,40(sp)
bfc085e0:	32220080 	andi	v0,s1,0x80
bfc085e4:	afb20024 	sw	s2,36(sp)
bfc085e8:	afbf002c 	sw	ra,44(sp)
bfc085ec:	afb0001c 	sw	s0,28(sp)
bfc085f0:	00809821 	move	s3,a0
bfc085f4:	14400036 	bnez	v0,bfc086d0 <calc_func+0x100>
bfc085f8:	00a09021 	move	s2,a1
bfc085fc:	001120c3 	sra	a0,s1,0x3
bfc08600:	3086000f 	andi	a2,a0,0xf
bfc08604:	00061900 	sll	v1,a2,0x4
bfc08608:	32240007 	andi	a0,s1,0x7
bfc0860c:	14800028 	bnez	a0,bfc086b0 <calc_func+0xe0>
bfc08610:	00662825 	or	a1,v1,a2
bfc08614:	28a80022 	slti	t0,a1,34
bfc08618:	11000002 	beqz	t0,bfc08624 <calc_func+0x54>
bfc0861c:	00a01821 	move	v1,a1
bfc08620:	24030022 	li	v1,34
bfc08624:	8e450014 	lw	a1,20(s2)
bfc08628:	8e440018 	lw	a0,24(s2)
bfc0862c:	86460000 	lh	a2,0(s2)
bfc08630:	86470002 	lh	a3,2(s2)
bfc08634:	96490038 	lhu	t1,56(s2)
bfc08638:	afa30010 	sw	v1,16(sp)
bfc0863c:	0ff01dec 	jal	bfc077b0 <core_bench_state>
bfc08640:	afa90014 	sw	t1,20(sp)
bfc08644:	9645003e 	lhu	a1,62(s2)
bfc08648:	00028400 	sll	s0,v0,0x10
bfc0864c:	14a00002 	bnez	a1,bfc08658 <calc_func+0x88>
bfc08650:	00108403 	sra	s0,s0,0x10
bfc08654:	a642003e 	sh	v0,62(s2)
bfc08658:	3210ffff 	andi	s0,s0,0xffff
bfc0865c:	96450038 	lhu	a1,56(s2)
bfc08660:	0ff01680 	jal	bfc05a00 <crcu16>
bfc08664:	02002021 	move	a0,s0
bfc08668:	240fff00 	li	t7,-256
bfc0866c:	022f7024 	and	t6,s1,t7
bfc08670:	3210007f 	andi	s0,s0,0x7f
bfc08674:	35cd0080 	ori	t5,t6,0x80
bfc08678:	8fbf002c 	lw	ra,44(sp)
bfc0867c:	020d6025 	or	t4,s0,t5
bfc08680:	a6420038 	sh	v0,56(s2)
bfc08684:	8fb10020 	lw	s1,32(sp)
bfc08688:	02001021 	move	v0,s0
bfc0868c:	a66c0000 	sh	t4,0(s3)
bfc08690:	8fb20024 	lw	s2,36(sp)
bfc08694:	8fb30028 	lw	s3,40(sp)
bfc08698:	8fb0001c 	lw	s0,28(sp)
bfc0869c:	03e00008 	jr	ra
bfc086a0:	27bd0030 	addiu	sp,sp,48
	...
bfc086b0:	24070001 	li	a3,1
bfc086b4:	10870012 	beq	a0,a3,bfc08700 <calc_func+0x130>
bfc086b8:	02208021 	move	s0,s1
bfc086bc:	0bf02197 	j	bfc0865c <calc_func+0x8c>
bfc086c0:	3210ffff 	andi	s0,s0,0xffff
	...
bfc086d0:	8fbf002c 	lw	ra,44(sp)
bfc086d4:	3230007f 	andi	s0,s1,0x7f
bfc086d8:	02001021 	move	v0,s0
bfc086dc:	8fb30028 	lw	s3,40(sp)
bfc086e0:	8fb20024 	lw	s2,36(sp)
bfc086e4:	8fb10020 	lw	s1,32(sp)
bfc086e8:	8fb0001c 	lw	s0,28(sp)
bfc086ec:	03e00008 	jr	ra
bfc086f0:	27bd0030 	addiu	sp,sp,48
	...
bfc08700:	96460038 	lhu	a2,56(s2)
bfc08704:	0ff00fb8 	jal	bfc03ee0 <core_bench_matrix>
bfc08708:	26440028 	addiu	a0,s2,40
bfc0870c:	964a003c 	lhu	t2,60(s2)
bfc08710:	00025c00 	sll	t3,v0,0x10
bfc08714:	1540ffd0 	bnez	t2,bfc08658 <calc_func+0x88>
bfc08718:	000b8403 	sra	s0,t3,0x10
bfc0871c:	0bf02196 	j	bfc08658 <calc_func+0x88>
bfc08720:	a642003c 	sh	v0,60(s2)
	...

bfc08730 <core_list_init>:
core_list_init():
bfc08730:	24090014 	li	t1,20
bfc08734:	15200002 	bnez	t1,bfc08740 <core_list_init+0x10>
bfc08738:	0089001b 	divu	zero,a0,t1
bfc0873c:	0007000d 	break	0x7
bfc08740:	27bdffc8 	addiu	sp,sp,-56
bfc08744:	afb10014 	sw	s1,20(sp)
bfc08748:	24a90010 	addiu	t1,a1,16
bfc0874c:	00063400 	sll	a2,a2,0x10
bfc08750:	24028080 	li	v0,-32640
bfc08754:	afb00010 	sw	s0,16(sp)
bfc08758:	afbf0034 	sw	ra,52(sp)
bfc0875c:	afbe0030 	sw	s8,48(sp)
bfc08760:	afb7002c 	sw	s7,44(sp)
bfc08764:	afb60028 	sw	s6,40(sp)
bfc08768:	afb50024 	sw	s5,36(sp)
bfc0876c:	afb40020 	sw	s4,32(sp)
bfc08770:	afb3001c 	sw	s3,28(sp)
bfc08774:	afb20018 	sw	s2,24(sp)
bfc08778:	00063403 	sra	a2,a2,0x10
bfc0877c:	aca00000 	sw	zero,0(a1)
bfc08780:	24ab0008 	addiu	t3,a1,8
bfc08784:	00004012 	mflo	t0
bfc08788:	2511fffe 	addiu	s1,t0,-2
bfc0878c:	001138c0 	sll	a3,s1,0x3
bfc08790:	00a76821 	addu	t5,a1,a3
bfc08794:	00111880 	sll	v1,s1,0x2
bfc08798:	012d202b 	sltu	a0,t1,t5
bfc0879c:	a5a20000 	sh	v0,0(t5)
bfc087a0:	01a38021 	addu	s0,t5,v1
bfc087a4:	acad0004 	sw	t5,4(a1)
bfc087a8:	a5a00002 	sh	zero,2(t5)
bfc087ac:	10800188 	beqz	a0,bfc08dd0 <core_list_init+0x6a0>
bfc087b0:	25aa0004 	addiu	t2,t5,4
bfc087b4:	25a70008 	addiu	a3,t5,8
bfc087b8:	00f0602b 	sltu	t4,a3,s0
bfc087bc:	11800184 	beqz	t4,bfc08dd0 <core_list_init+0x6a0>
bfc087c0:	240f7fff 	li	t7,32767
bfc087c4:	240effff 	li	t6,-1
bfc087c8:	ad600000 	sw	zero,0(t3)
bfc087cc:	01604021 	move	t0,t3
bfc087d0:	a54f0002 	sh	t7,2(t2)
bfc087d4:	a5ae0004 	sh	t6,4(t5)
bfc087d8:	ad6a0004 	sw	t2,4(t3)
bfc087dc:	acab0000 	sw	t3,0(a1)
bfc087e0:	122000c4 	beqz	s1,bfc08af4 <core_list_init+0x3c4>
bfc087e4:	262affff 	addiu	t2,s1,-1
bfc087e8:	31440003 	andi	a0,t2,0x3
bfc087ec:	30cfffff 	andi	t7,a2,0xffff
bfc087f0:	00006021 	move	t4,zero
bfc087f4:	10800077 	beqz	a0,bfc089d4 <core_list_init+0x2a4>
bfc087f8:	24127fff 	li	s2,32767
bfc087fc:	252b0008 	addiu	t3,t1,8
bfc08800:	016da02b 	sltu	s4,t3,t5
bfc08804:	1680007a 	bnez	s4,bfc089f0 <core_list_init+0x2c0>
bfc08808:	24ea0004 	addiu	t2,a3,4
bfc0880c:	01205821 	move	t3,t1
bfc08810:	00e05021 	move	t2,a3
bfc08814:	240c0001 	li	t4,1
bfc08818:	01604821 	move	t1,t3
bfc0881c:	108c006d 	beq	a0,t4,bfc089d4 <core_list_init+0x2a4>
bfc08820:	01403821 	move	a3,t2
bfc08824:	241e0002 	li	s8,2
bfc08828:	109e000a 	beq	a0,s8,bfc08854 <core_list_init+0x124>
bfc0882c:	00000000 	nop
bfc08830:	25670008 	addiu	a3,t3,8
bfc08834:	00edf82b 	sltu	ra,a3,t5
bfc08838:	17e0007d 	bnez	ra,bfc08a30 <core_list_init+0x300>
bfc0883c:	254e0004 	addiu	t6,t2,4
bfc08840:	01603821 	move	a3,t3
bfc08844:	01407021 	move	t6,t2
bfc08848:	00e04821 	move	t1,a3
bfc0884c:	258c0001 	addiu	t4,t4,1
bfc08850:	01c03821 	move	a3,t6
bfc08854:	252a0008 	addiu	t2,t1,8
bfc08858:	014d582b 	sltu	t3,t2,t5
bfc0885c:	15600088 	bnez	t3,bfc08a80 <core_list_init+0x350>
bfc08860:	24eb0004 	addiu	t3,a3,4
bfc08864:	01205021 	move	t2,t1
bfc08868:	00e05821 	move	t3,a3
bfc0886c:	258c0001 	addiu	t4,t4,1
bfc08870:	01404821 	move	t1,t2
bfc08874:	0bf02275 	j	bfc089d4 <core_list_init+0x2a4>
bfc08878:	01603821 	move	a3,t3
bfc0887c:	24ea0004 	addiu	t2,a3,4
bfc08880:	0150a02b 	sltu	s4,t2,s0
bfc08884:	12800057 	beqz	s4,bfc089e4 <core_list_init+0x2b4>
bfc08888:	319effff 	andi	s8,t4,0xffff
bfc0888c:	03cf2026 	xor	a0,s8,t7
bfc08890:	309f000f 	andi	ra,a0,0xf
bfc08894:	001fc0c0 	sll	t8,ra,0x3
bfc08898:	33d90007 	andi	t9,s8,0x7
bfc0889c:	0319b825 	or	s7,t8,t9
bfc088a0:	0017b200 	sll	s6,s7,0x8
bfc088a4:	02d7a825 	or	s5,s6,s7
bfc088a8:	ad280000 	sw	t0,0(t1)
bfc088ac:	a4f50000 	sh	s5,0(a3)
bfc088b0:	01204021 	move	t0,t1
bfc088b4:	a4f20002 	sh	s2,2(a3)
bfc088b8:	aca90000 	sw	t1,0(a1)
bfc088bc:	ad270004 	sw	a3,4(t1)
bfc088c0:	258e0001 	addiu	t6,t4,1
bfc088c4:	01d1182b 	sltu	v1,t6,s1
bfc088c8:	1060008a 	beqz	v1,bfc08af4 <core_list_init+0x3c4>
bfc088cc:	256c0008 	addiu	t4,t3,8
bfc088d0:	018d102b 	sltu	v0,t4,t5
bfc088d4:	10400084 	beqz	v0,bfc08ae8 <core_list_init+0x3b8>
bfc088d8:	00000000 	nop
bfc088dc:	25470004 	addiu	a3,t2,4
bfc088e0:	00f0482b 	sltu	t1,a3,s0
bfc088e4:	11200080 	beqz	t1,bfc08ae8 <core_list_init+0x3b8>
bfc088e8:	31d9ffff 	andi	t9,t6,0xffff
bfc088ec:	032ff826 	xor	ra,t9,t7
bfc088f0:	33fe000f 	andi	s8,ra,0xf
bfc088f4:	001eb8c0 	sll	s7,s8,0x3
bfc088f8:	33380007 	andi	t8,t9,0x7
bfc088fc:	02f8b025 	or	s6,s7,t8
bfc08900:	0016aa00 	sll	s5,s6,0x8
bfc08904:	02b6a025 	or	s4,s5,s6
bfc08908:	ad680000 	sw	t0,0(t3)
bfc0890c:	a5540000 	sh	s4,0(t2)
bfc08910:	01604021 	move	t0,t3
bfc08914:	a5520002 	sh	s2,2(t2)
bfc08918:	acab0000 	sw	t3,0(a1)
bfc0891c:	ad6a0004 	sw	t2,4(t3)
bfc08920:	258a0008 	addiu	t2,t4,8
bfc08924:	014d582b 	sltu	t3,t2,t5
bfc08928:	1160006c 	beqz	t3,bfc08adc <core_list_init+0x3ac>
bfc0892c:	25c30001 	addiu	v1,t6,1
bfc08930:	24e90004 	addiu	t1,a3,4
bfc08934:	0130202b 	sltu	a0,t1,s0
bfc08938:	10800068 	beqz	a0,bfc08adc <core_list_init+0x3ac>
bfc0893c:	3076ffff 	andi	s6,v1,0xffff
bfc08940:	02cfc026 	xor	t8,s6,t7
bfc08944:	3317000f 	andi	s7,t8,0xf
bfc08948:	0017a0c0 	sll	s4,s7,0x3
bfc0894c:	32d50007 	andi	s5,s6,0x7
bfc08950:	02951825 	or	v1,s4,s5
bfc08954:	00039a00 	sll	s3,v1,0x8
bfc08958:	02631025 	or	v0,s3,v1
bfc0895c:	ad880000 	sw	t0,0(t4)
bfc08960:	a4e20000 	sh	v0,0(a3)
bfc08964:	01804021 	move	t0,t4
bfc08968:	a4f20002 	sh	s2,2(a3)
bfc0896c:	acac0000 	sw	t4,0(a1)
bfc08970:	ad870004 	sw	a3,4(t4)
bfc08974:	25470008 	addiu	a3,t2,8
bfc08978:	00ed602b 	sltu	t4,a3,t5
bfc0897c:	11800054 	beqz	t4,bfc08ad0 <core_list_init+0x3a0>
bfc08980:	25c30002 	addiu	v1,t6,2
bfc08984:	252b0004 	addiu	t3,t1,4
bfc08988:	0170c82b 	sltu	t9,t3,s0
bfc0898c:	13200050 	beqz	t9,bfc08ad0 <core_list_init+0x3a0>
bfc08990:	3074ffff 	andi	s4,v1,0xffff
bfc08994:	028fa826 	xor	s5,s4,t7
bfc08998:	32a3000f 	andi	v1,s5,0xf
bfc0899c:	000398c0 	sll	s3,v1,0x3
bfc089a0:	32820007 	andi	v0,s4,0x7
bfc089a4:	02622025 	or	a0,s3,v0
bfc089a8:	0004fa00 	sll	ra,a0,0x8
bfc089ac:	03e4f025 	or	s8,ra,a0
bfc089b0:	ad480000 	sw	t0,0(t2)
bfc089b4:	a53e0000 	sh	s8,0(t1)
bfc089b8:	01404021 	move	t0,t2
bfc089bc:	a5320002 	sh	s2,2(t1)
bfc089c0:	acaa0000 	sw	t2,0(a1)
bfc089c4:	ad490004 	sw	t1,4(t2)
bfc089c8:	00e04821 	move	t1,a3
bfc089cc:	25cc0003 	addiu	t4,t6,3
bfc089d0:	01603821 	move	a3,t3
bfc089d4:	252b0008 	addiu	t3,t1,8
bfc089d8:	016d982b 	sltu	s3,t3,t5
bfc089dc:	1660ffa7 	bnez	s3,bfc0887c <core_list_init+0x14c>
bfc089e0:	00000000 	nop
bfc089e4:	01205821 	move	t3,t1
bfc089e8:	0bf02230 	j	bfc088c0 <core_list_init+0x190>
bfc089ec:	00e05021 	move	t2,a3
bfc089f0:	0150a82b 	sltu	s5,t2,s0
bfc089f4:	12a0ff85 	beqz	s5,bfc0880c <core_list_init+0xdc>
bfc089f8:	31f9000f 	andi	t9,t7,0xf
bfc089fc:	0019c0c0 	sll	t8,t9,0x3
bfc08a00:	0018ba00 	sll	s7,t8,0x8
bfc08a04:	02f8b025 	or	s6,s7,t8
bfc08a08:	ad280000 	sw	t0,0(t1)
bfc08a0c:	a4f60000 	sh	s6,0(a3)
bfc08a10:	01204021 	move	t0,t1
bfc08a14:	a4f20002 	sh	s2,2(a3)
bfc08a18:	aca90000 	sw	t1,0(a1)
bfc08a1c:	0bf02205 	j	bfc08814 <core_list_init+0xe4>
bfc08a20:	ad270004 	sw	a3,4(t1)
	...
bfc08a30:	01d0202b 	sltu	a0,t6,s0
bfc08a34:	1080ff82 	beqz	a0,bfc08840 <core_list_init+0x110>
bfc08a38:	3195ffff 	andi	s5,t4,0xffff
bfc08a3c:	02afb826 	xor	s7,s5,t7
bfc08a40:	32f6000f 	andi	s6,s7,0xf
bfc08a44:	001698c0 	sll	s3,s6,0x3
bfc08a48:	32b40007 	andi	s4,s5,0x7
bfc08a4c:	02741825 	or	v1,s3,s4
bfc08a50:	00034a00 	sll	t1,v1,0x8
bfc08a54:	01231025 	or	v0,t1,v1
bfc08a58:	ad680000 	sw	t0,0(t3)
bfc08a5c:	a5420000 	sh	v0,0(t2)
bfc08a60:	01604021 	move	t0,t3
bfc08a64:	a5520002 	sh	s2,2(t2)
bfc08a68:	acab0000 	sw	t3,0(a1)
bfc08a6c:	0bf02212 	j	bfc08848 <core_list_init+0x118>
bfc08a70:	ad6a0004 	sw	t2,4(t3)
	...
bfc08a80:	0170702b 	sltu	t6,t3,s0
bfc08a84:	11c0ff77 	beqz	t6,bfc08864 <core_list_init+0x134>
bfc08a88:	3182ffff 	andi	v0,t4,0xffff
bfc08a8c:	004f9826 	xor	s3,v0,t7
bfc08a90:	3263000f 	andi	v1,s3,0xf
bfc08a94:	0003f8c0 	sll	ra,v1,0x3
bfc08a98:	30440007 	andi	a0,v0,0x7
bfc08a9c:	03e4f025 	or	s8,ra,a0
bfc08aa0:	001eca00 	sll	t9,s8,0x8
bfc08aa4:	033ec025 	or	t8,t9,s8
bfc08aa8:	ad280000 	sw	t0,0(t1)
bfc08aac:	a4f80000 	sh	t8,0(a3)
bfc08ab0:	01204021 	move	t0,t1
bfc08ab4:	a4f20002 	sh	s2,2(a3)
bfc08ab8:	aca90000 	sw	t1,0(a1)
bfc08abc:	0bf0221b 	j	bfc0886c <core_list_init+0x13c>
bfc08ac0:	ad270004 	sw	a3,4(t1)
	...
bfc08ad0:	01403821 	move	a3,t2
bfc08ad4:	0bf02272 	j	bfc089c8 <core_list_init+0x298>
bfc08ad8:	01205821 	move	t3,t1
bfc08adc:	01805021 	move	t2,t4
bfc08ae0:	0bf0225d 	j	bfc08974 <core_list_init+0x244>
bfc08ae4:	00e04821 	move	t1,a3
bfc08ae8:	01606021 	move	t4,t3
bfc08aec:	0bf02248 	j	bfc08920 <core_list_init+0x1f0>
bfc08af0:	01403821 	move	a3,t2
bfc08af4:	240b0005 	li	t3,5
bfc08af8:	15600002 	bnez	t3,bfc08b04 <core_list_init+0x3d4>
bfc08afc:	022b001b 	divu	zero,s1,t3
bfc08b00:	0007000d 	break	0x7
bfc08b04:	24090002 	li	t1,2
bfc08b08:	00002012 	mflo	a0
bfc08b0c:	0bf022cb 	j	bfc08b2c <core_list_init+0x3fc>
bfc08b10:	24070001 	li	a3,1
bfc08b14:	8d0d0004 	lw	t5,4(t0)
bfc08b18:	00000000 	nop
bfc08b1c:	a5a70002 	sh	a3,2(t5)
bfc08b20:	25290001 	addiu	t1,t1,1
bfc08b24:	24e70001 	addiu	a3,a3,1
bfc08b28:	00604021 	move	t0,v1
bfc08b2c:	312e0007 	andi	t6,t1,0x7
bfc08b30:	000e9200 	sll	s2,t6,0x8
bfc08b34:	00c76026 	xor	t4,a2,a3
bfc08b38:	8d030000 	lw	v1,0(t0)
bfc08b3c:	024c8825 	or	s1,s2,t4
bfc08b40:	322a3fff 	andi	t2,s1,0x3fff
bfc08b44:	10600006 	beqz	v1,bfc08b60 <core_list_init+0x430>
bfc08b48:	00e4102b 	sltu	v0,a3,a0
bfc08b4c:	1440fff1 	bnez	v0,bfc08b14 <core_list_init+0x3e4>
bfc08b50:	00000000 	nop
bfc08b54:	8d100004 	lw	s0,4(t0)
bfc08b58:	0bf022c8 	j	bfc08b20 <core_list_init+0x3f0>
bfc08b5c:	a60a0002 	sh	t2,2(s0)
bfc08b60:	24150001 	li	s5,1
bfc08b64:	10a0008b 	beqz	a1,bfc08d94 <core_list_init+0x664>
bfc08b68:	241e0001 	li	s8,1
bfc08b6c:	00a08821 	move	s1,a1
bfc08b70:	0000b821 	move	s7,zero
bfc08b74:	0000a021 	move	s4,zero
bfc08b78:	0000b021 	move	s6,zero
bfc08b7c:	8e300000 	lw	s0,0(s1)
bfc08b80:	26a5ffff 	addiu	a1,s5,-1
bfc08b84:	26f70001 	addiu	s7,s7,1
bfc08b88:	30a30007 	andi	v1,a1,0x7
bfc08b8c:	12000053 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08b90:	24120001 	li	s2,1
bfc08b94:	0255382a 	slt	a3,s2,s5
bfc08b98:	10e00050 	beqz	a3,bfc08cdc <core_list_init+0x5ac>
bfc08b9c:	00000000 	nop
bfc08ba0:	1060002c 	beqz	v1,bfc08c54 <core_list_init+0x524>
bfc08ba4:	00000000 	nop
bfc08ba8:	10720023 	beq	v1,s2,bfc08c38 <core_list_init+0x508>
bfc08bac:	24080002 	li	t0,2
bfc08bb0:	1068001d 	beq	v1,t0,bfc08c28 <core_list_init+0x4f8>
bfc08bb4:	24060003 	li	a2,3
bfc08bb8:	10660017 	beq	v1,a2,bfc08c18 <core_list_init+0x4e8>
bfc08bbc:	24090004 	li	t1,4
bfc08bc0:	10690011 	beq	v1,t1,bfc08c08 <core_list_init+0x4d8>
bfc08bc4:	240f0005 	li	t7,5
bfc08bc8:	106f000b 	beq	v1,t7,bfc08bf8 <core_list_init+0x4c8>
bfc08bcc:	240a0006 	li	t2,6
bfc08bd0:	106a0005 	beq	v1,t2,bfc08be8 <core_list_init+0x4b8>
bfc08bd4:	00000000 	nop
bfc08bd8:	8e100000 	lw	s0,0(s0)
bfc08bdc:	00000000 	nop
bfc08be0:	1200003e 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08be4:	24120002 	li	s2,2
bfc08be8:	8e100000 	lw	s0,0(s0)
bfc08bec:	00000000 	nop
bfc08bf0:	1200003a 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08bf4:	26520001 	addiu	s2,s2,1
bfc08bf8:	8e100000 	lw	s0,0(s0)
bfc08bfc:	00000000 	nop
bfc08c00:	12000036 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c04:	26520001 	addiu	s2,s2,1
bfc08c08:	8e100000 	lw	s0,0(s0)
bfc08c0c:	00000000 	nop
bfc08c10:	12000032 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c14:	26520001 	addiu	s2,s2,1
bfc08c18:	8e100000 	lw	s0,0(s0)
bfc08c1c:	00000000 	nop
bfc08c20:	1200002e 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c24:	26520001 	addiu	s2,s2,1
bfc08c28:	8e100000 	lw	s0,0(s0)
bfc08c2c:	00000000 	nop
bfc08c30:	1200002a 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c34:	26520001 	addiu	s2,s2,1
bfc08c38:	8e100000 	lw	s0,0(s0)
bfc08c3c:	00000000 	nop
bfc08c40:	12000026 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c44:	26520001 	addiu	s2,s2,1
bfc08c48:	0255982a 	slt	s3,s2,s5
bfc08c4c:	12600023 	beqz	s3,bfc08cdc <core_list_init+0x5ac>
bfc08c50:	00000000 	nop
bfc08c54:	8e100000 	lw	s0,0(s0)
bfc08c58:	26520001 	addiu	s2,s2,1
bfc08c5c:	1200001f 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c60:	02401021 	move	v0,s2
bfc08c64:	8e100000 	lw	s0,0(s0)
bfc08c68:	00000000 	nop
bfc08c6c:	1200001b 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c70:	26520001 	addiu	s2,s2,1
bfc08c74:	8e100000 	lw	s0,0(s0)
bfc08c78:	00000000 	nop
bfc08c7c:	12000017 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c80:	24520002 	addiu	s2,v0,2
bfc08c84:	8e100000 	lw	s0,0(s0)
bfc08c88:	00000000 	nop
bfc08c8c:	12000013 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08c90:	24520003 	addiu	s2,v0,3
bfc08c94:	8e100000 	lw	s0,0(s0)
bfc08c98:	00000000 	nop
bfc08c9c:	1200000f 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08ca0:	24520004 	addiu	s2,v0,4
bfc08ca4:	8e100000 	lw	s0,0(s0)
bfc08ca8:	00000000 	nop
bfc08cac:	1200000b 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08cb0:	24520005 	addiu	s2,v0,5
bfc08cb4:	8e100000 	lw	s0,0(s0)
bfc08cb8:	00000000 	nop
bfc08cbc:	12000007 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08cc0:	24520006 	addiu	s2,v0,6
bfc08cc4:	8e100000 	lw	s0,0(s0)
bfc08cc8:	24520007 	addiu	s2,v0,7
bfc08ccc:	12000003 	beqz	s0,bfc08cdc <core_list_init+0x5ac>
bfc08cd0:	0255102a 	slt	v0,s2,s5
bfc08cd4:	1440ffdf 	bnez	v0,bfc08c54 <core_list_init+0x524>
bfc08cd8:	00000000 	nop
bfc08cdc:	12400016 	beqz	s2,bfc08d38 <core_list_init+0x608>
bfc08ce0:	02a09821 	move	s3,s5
bfc08ce4:	1260001e 	beqz	s3,bfc08d60 <core_list_init+0x630>
bfc08ce8:	00000000 	nop
bfc08cec:	1200001c 	beqz	s0,bfc08d60 <core_list_init+0x630>
bfc08cf0:	00000000 	nop
bfc08cf4:	8e240004 	lw	a0,4(s1)
bfc08cf8:	8e050004 	lw	a1,4(s0)
bfc08cfc:	0ff02010 	jal	bfc08040 <cmp_idx>
bfc08d00:	00003021 	move	a2,zero
bfc08d04:	18400016 	blez	v0,bfc08d60 <core_list_init+0x630>
bfc08d08:	00000000 	nop
bfc08d0c:	8e020000 	lw	v0,0(s0)
bfc08d10:	02201821 	move	v1,s1
bfc08d14:	2673ffff 	addiu	s3,s3,-1
bfc08d18:	02008821 	move	s1,s0
bfc08d1c:	1280000e 	beqz	s4,bfc08d58 <core_list_init+0x628>
bfc08d20:	00000000 	nop
bfc08d24:	ae910000 	sw	s1,0(s4)
bfc08d28:	0220a021 	move	s4,s1
bfc08d2c:	00408021 	move	s0,v0
bfc08d30:	1640ffec 	bnez	s2,bfc08ce4 <core_list_init+0x5b4>
bfc08d34:	00608821 	move	s1,v1
bfc08d38:	1260000d 	beqz	s3,bfc08d70 <core_list_init+0x640>
bfc08d3c:	00000000 	nop
bfc08d40:	1200000f 	beqz	s0,bfc08d80 <core_list_init+0x650>
bfc08d44:	02201821 	move	v1,s1
bfc08d48:	2673ffff 	addiu	s3,s3,-1
bfc08d4c:	8e020000 	lw	v0,0(s0)
bfc08d50:	1680fff4 	bnez	s4,bfc08d24 <core_list_init+0x5f4>
bfc08d54:	02008821 	move	s1,s0
bfc08d58:	0bf0234a 	j	bfc08d28 <core_list_init+0x5f8>
bfc08d5c:	0220b021 	move	s6,s1
bfc08d60:	2652ffff 	addiu	s2,s2,-1
bfc08d64:	8e230000 	lw	v1,0(s1)
bfc08d68:	0bf02347 	j	bfc08d1c <core_list_init+0x5ec>
bfc08d6c:	02001021 	move	v0,s0
bfc08d70:	1600ff82 	bnez	s0,bfc08b7c <core_list_init+0x44c>
bfc08d74:	02008821 	move	s1,s0
	...
bfc08d80:	12fe0006 	beq	s7,s8,bfc08d9c <core_list_init+0x66c>
bfc08d84:	ae800000 	sw	zero,0(s4)
bfc08d88:	02c02821 	move	a1,s6
bfc08d8c:	14a0ff77 	bnez	a1,bfc08b6c <core_list_init+0x43c>
bfc08d90:	0015a840 	sll	s5,s5,0x1
bfc08d94:	aca00000 	sw	zero,0(a1)
bfc08d98:	0000b021 	move	s6,zero
bfc08d9c:	8fbf0034 	lw	ra,52(sp)
bfc08da0:	02c01021 	move	v0,s6
bfc08da4:	8fbe0030 	lw	s8,48(sp)
bfc08da8:	8fb7002c 	lw	s7,44(sp)
bfc08dac:	8fb60028 	lw	s6,40(sp)
bfc08db0:	8fb50024 	lw	s5,36(sp)
bfc08db4:	8fb40020 	lw	s4,32(sp)
bfc08db8:	8fb3001c 	lw	s3,28(sp)
bfc08dbc:	8fb20018 	lw	s2,24(sp)
bfc08dc0:	8fb10014 	lw	s1,20(sp)
bfc08dc4:	8fb00010 	lw	s0,16(sp)
bfc08dc8:	03e00008 	jr	ra
bfc08dcc:	27bd0038 	addiu	sp,sp,56
bfc08dd0:	8ca80000 	lw	t0,0(a1)
bfc08dd4:	01604821 	move	t1,t3
bfc08dd8:	0bf021f8 	j	bfc087e0 <core_list_init+0xb0>
bfc08ddc:	01403821 	move	a3,t2

bfc08de0 <cmp_complex>:
cmp_complex():
bfc08de0:	27bdffc8 	addiu	sp,sp,-56
bfc08de4:	afb10020 	sw	s1,32(sp)
bfc08de8:	84910000 	lh	s1,0(a0)
bfc08dec:	afb50030 	sw	s5,48(sp)
bfc08df0:	32220080 	andi	v0,s1,0x80
bfc08df4:	afb4002c 	sw	s4,44(sp)
bfc08df8:	afb20024 	sw	s2,36(sp)
bfc08dfc:	afbf0034 	sw	ra,52(sp)
bfc08e00:	afb30028 	sw	s3,40(sp)
bfc08e04:	afb0001c 	sw	s0,28(sp)
bfc08e08:	0080a021 	move	s4,a0
bfc08e0c:	00a0a821 	move	s5,a1
bfc08e10:	1440003b 	bnez	v0,bfc08f00 <cmp_complex+0x120>
bfc08e14:	00c09021 	move	s2,a2
bfc08e18:	001120c3 	sra	a0,s1,0x3
bfc08e1c:	3086000f 	andi	a2,a0,0xf
bfc08e20:	00061900 	sll	v1,a2,0x4
bfc08e24:	32240007 	andi	a0,s1,0x7
bfc08e28:	1480002d 	bnez	a0,bfc08ee0 <cmp_complex+0x100>
bfc08e2c:	00662825 	or	a1,v1,a2
bfc08e30:	28a80022 	slti	t0,a1,34
bfc08e34:	11000002 	beqz	t0,bfc08e40 <cmp_complex+0x60>
bfc08e38:	00a01821 	move	v1,a1
bfc08e3c:	24030022 	li	v1,34
bfc08e40:	8e450014 	lw	a1,20(s2)
bfc08e44:	8e440018 	lw	a0,24(s2)
bfc08e48:	86460000 	lh	a2,0(s2)
bfc08e4c:	86470002 	lh	a3,2(s2)
bfc08e50:	96490038 	lhu	t1,56(s2)
bfc08e54:	afa30010 	sw	v1,16(sp)
bfc08e58:	0ff01dec 	jal	bfc077b0 <core_bench_state>
bfc08e5c:	afa90014 	sw	t1,20(sp)
bfc08e60:	9645003e 	lhu	a1,62(s2)
bfc08e64:	00028400 	sll	s0,v0,0x10
bfc08e68:	14a00002 	bnez	a1,bfc08e74 <cmp_complex+0x94>
bfc08e6c:	00108403 	sra	s0,s0,0x10
bfc08e70:	a642003e 	sh	v0,62(s2)
bfc08e74:	3210ffff 	andi	s0,s0,0xffff
bfc08e78:	96450038 	lhu	a1,56(s2)
bfc08e7c:	0ff01680 	jal	bfc05a00 <crcu16>
bfc08e80:	02002021 	move	a0,s0
bfc08e84:	240fff00 	li	t7,-256
bfc08e88:	022f7024 	and	t6,s1,t7
bfc08e8c:	3213007f 	andi	s3,s0,0x7f
bfc08e90:	35cd0080 	ori	t5,t6,0x80
bfc08e94:	026d6025 	or	t4,s3,t5
bfc08e98:	a6420038 	sh	v0,56(s2)
bfc08e9c:	a68c0000 	sh	t4,0(s4)
bfc08ea0:	86b10000 	lh	s1,0(s5)
bfc08ea4:	00000000 	nop
bfc08ea8:	32340080 	andi	s4,s1,0x80
bfc08eac:	1280001a 	beqz	s4,bfc08f18 <cmp_complex+0x138>
bfc08eb0:	0011f8c3 	sra	ra,s1,0x3
bfc08eb4:	3230007f 	andi	s0,s1,0x7f
bfc08eb8:	8fbf0034 	lw	ra,52(sp)
bfc08ebc:	02701023 	subu	v0,s3,s0
bfc08ec0:	8fb50030 	lw	s5,48(sp)
bfc08ec4:	8fb4002c 	lw	s4,44(sp)
bfc08ec8:	8fb30028 	lw	s3,40(sp)
bfc08ecc:	8fb20024 	lw	s2,36(sp)
bfc08ed0:	8fb10020 	lw	s1,32(sp)
bfc08ed4:	8fb0001c 	lw	s0,28(sp)
bfc08ed8:	03e00008 	jr	ra
bfc08edc:	27bd0038 	addiu	sp,sp,56
bfc08ee0:	24070001 	li	a3,1
bfc08ee4:	10870042 	beq	a0,a3,bfc08ff0 <cmp_complex+0x210>
bfc08ee8:	02208021 	move	s0,s1
bfc08eec:	0bf0239e 	j	bfc08e78 <cmp_complex+0x98>
bfc08ef0:	3210ffff 	andi	s0,s0,0xffff
	...
bfc08f00:	3233007f 	andi	s3,s1,0x7f
bfc08f04:	86b10000 	lh	s1,0(s5)
bfc08f08:	00000000 	nop
bfc08f0c:	32340080 	andi	s4,s1,0x80
bfc08f10:	1680ffe8 	bnez	s4,bfc08eb4 <cmp_complex+0xd4>
bfc08f14:	0011f8c3 	sra	ra,s1,0x3
bfc08f18:	33f8000f 	andi	t8,ra,0xf
bfc08f1c:	0018c900 	sll	t9,t8,0x4
bfc08f20:	32240007 	andi	a0,s1,0x7
bfc08f24:	14800016 	bnez	a0,bfc08f80 <cmp_complex+0x1a0>
bfc08f28:	03382825 	or	a1,t9,t8
bfc08f2c:	28a60022 	slti	a2,a1,34
bfc08f30:	14c00002 	bnez	a2,bfc08f3c <cmp_complex+0x15c>
bfc08f34:	24030022 	li	v1,34
bfc08f38:	00a01821 	move	v1,a1
bfc08f3c:	8e440018 	lw	a0,24(s2)
bfc08f40:	86470002 	lh	a3,2(s2)
bfc08f44:	8e450014 	lw	a1,20(s2)
bfc08f48:	86460000 	lh	a2,0(s2)
bfc08f4c:	96480038 	lhu	t0,56(s2)
bfc08f50:	afa30010 	sw	v1,16(sp)
bfc08f54:	0ff01dec 	jal	bfc077b0 <core_bench_state>
bfc08f58:	afa80014 	sw	t0,20(sp)
bfc08f5c:	9644003e 	lhu	a0,62(s2)
bfc08f60:	00023c00 	sll	a3,v0,0x10
bfc08f64:	14800009 	bnez	a0,bfc08f8c <cmp_complex+0x1ac>
bfc08f68:	00078403 	sra	s0,a3,0x10
bfc08f6c:	0bf023e3 	j	bfc08f8c <cmp_complex+0x1ac>
bfc08f70:	a642003e 	sh	v0,62(s2)
	...
bfc08f80:	24020001 	li	v0,1
bfc08f84:	1082000e 	beq	a0,v0,bfc08fc0 <cmp_complex+0x1e0>
bfc08f88:	02208021 	move	s0,s1
bfc08f8c:	3210ffff 	andi	s0,s0,0xffff
bfc08f90:	96450038 	lhu	a1,56(s2)
bfc08f94:	0ff01680 	jal	bfc05a00 <crcu16>
bfc08f98:	02002021 	move	a0,s0
bfc08f9c:	240bff00 	li	t3,-256
bfc08fa0:	022b5024 	and	t2,s1,t3
bfc08fa4:	3210007f 	andi	s0,s0,0x7f
bfc08fa8:	35430080 	ori	v1,t2,0x80
bfc08fac:	02038825 	or	s1,s0,v1
bfc08fb0:	a6420038 	sh	v0,56(s2)
bfc08fb4:	0bf023ae 	j	bfc08eb8 <cmp_complex+0xd8>
bfc08fb8:	a6b10000 	sh	s1,0(s5)
bfc08fbc:	00000000 	nop
bfc08fc0:	96460038 	lhu	a2,56(s2)
bfc08fc4:	0ff00fb8 	jal	bfc03ee0 <core_bench_matrix>
bfc08fc8:	26440028 	addiu	a0,s2,40
bfc08fcc:	9645003c 	lhu	a1,60(s2)
bfc08fd0:	00024c00 	sll	t1,v0,0x10
bfc08fd4:	14a0ffed 	bnez	a1,bfc08f8c <cmp_complex+0x1ac>
bfc08fd8:	00098403 	sra	s0,t1,0x10
bfc08fdc:	0bf023e3 	j	bfc08f8c <cmp_complex+0x1ac>
bfc08fe0:	a642003c 	sh	v0,60(s2)
	...
bfc08ff0:	96460038 	lhu	a2,56(s2)
bfc08ff4:	0ff00fb8 	jal	bfc03ee0 <core_bench_matrix>
bfc08ff8:	26440028 	addiu	a0,s2,40
bfc08ffc:	964a003c 	lhu	t2,60(s2)
bfc09000:	00025c00 	sll	t3,v0,0x10
bfc09004:	1540ff9b 	bnez	t2,bfc08e74 <cmp_complex+0x94>
bfc09008:	000b8403 	sra	s0,t3,0x10
bfc0900c:	0bf0239d 	j	bfc08e74 <cmp_complex+0x94>
bfc09010:	a642003c 	sh	v0,60(s2)
	...

bfc09020 <core_bench_list>:
core_bench_list():
bfc09020:	848a0004 	lh	t2,4(a0)
bfc09024:	27bdffc0 	addiu	sp,sp,-64
bfc09028:	00052c00 	sll	a1,a1,0x10
bfc0902c:	afb5002c 	sw	s5,44(sp)
bfc09030:	afbf003c 	sw	ra,60(sp)
bfc09034:	afbe0038 	sw	s8,56(sp)
bfc09038:	afb70034 	sw	s7,52(sp)
bfc0903c:	afb60030 	sw	s6,48(sp)
bfc09040:	afb40028 	sw	s4,40(sp)
bfc09044:	afb30024 	sw	s3,36(sp)
bfc09048:	afb20020 	sw	s2,32(sp)
bfc0904c:	afb1001c 	sw	s1,28(sp)
bfc09050:	afb00018 	sw	s0,24(sp)
bfc09054:	afa40040 	sw	a0,64(sp)
bfc09058:	8c950024 	lw	s5,36(a0)
bfc0905c:	1940028f 	blez	t2,bfc09a9c <core_bench_list+0xa7c>
bfc09060:	00052c03 	sra	a1,a1,0x10
bfc09064:	afa50010 	sw	a1,16(sp)
bfc09068:	00004821 	move	t1,zero
bfc0906c:	00004021 	move	t0,zero
bfc09070:	00005821 	move	t3,zero
bfc09074:	00003821 	move	a3,zero
bfc09078:	8fa30010 	lw	v1,16(sp)
bfc0907c:	30e200ff 	andi	v0,a3,0xff
bfc09080:	04600160 	bltz	v1,bfc09604 <core_bench_list+0x5e4>
bfc09084:	afa20014 	sw	v0,20(sp)
bfc09088:	12a00174 	beqz	s5,bfc0965c <core_bench_list+0x63c>
bfc0908c:	00000000 	nop
bfc09090:	8eaf0004 	lw	t7,4(s5)
bfc09094:	8fad0010 	lw	t5,16(sp)
bfc09098:	85ee0002 	lh	t6,2(t7)
bfc0909c:	00000000 	nop
bfc090a0:	11cd000d 	beq	t6,t5,bfc090d8 <core_bench_list+0xb8>
bfc090a4:	02a03021 	move	a2,s5
bfc090a8:	0bf02432 	j	bfc090c8 <core_bench_list+0xa8>
bfc090ac:	02a02021 	move	a0,s5
bfc090b0:	8c920004 	lw	s2,4(a0)
bfc090b4:	8fb00010 	lw	s0,16(sp)
bfc090b8:	86510002 	lh	s1,2(s2)
bfc090bc:	00000000 	nop
bfc090c0:	12300005 	beq	s1,s0,bfc090d8 <core_bench_list+0xb8>
bfc090c4:	00803021 	move	a2,a0
bfc090c8:	8c840000 	lw	a0,0(a0)
bfc090cc:	00000000 	nop
bfc090d0:	1480fff7 	bnez	a0,bfc090b0 <core_bench_list+0x90>
bfc090d4:	00003021 	move	a2,zero
bfc090d8:	8ea20000 	lw	v0,0(s5)
bfc090dc:	00001821 	move	v1,zero
bfc090e0:	10400023 	beqz	v0,bfc09170 <core_bench_list+0x150>
bfc090e4:	aea30000 	sw	v1,0(s5)
bfc090e8:	8c430000 	lw	v1,0(v0)
bfc090ec:	ac550000 	sw	s5,0(v0)
bfc090f0:	1060001f 	beqz	v1,bfc09170 <core_bench_list+0x150>
bfc090f4:	0040a821 	move	s5,v0
bfc090f8:	8c640000 	lw	a0,0(v1)
bfc090fc:	0060a821 	move	s5,v1
bfc09100:	1080001b 	beqz	a0,bfc09170 <core_bench_list+0x150>
bfc09104:	ac620000 	sw	v0,0(v1)
bfc09108:	8c820000 	lw	v0,0(a0)
bfc0910c:	0080a821 	move	s5,a0
bfc09110:	10400017 	beqz	v0,bfc09170 <core_bench_list+0x150>
bfc09114:	ac830000 	sw	v1,0(a0)
bfc09118:	8c430000 	lw	v1,0(v0)
bfc0911c:	0040a821 	move	s5,v0
bfc09120:	10600013 	beqz	v1,bfc09170 <core_bench_list+0x150>
bfc09124:	ac440000 	sw	a0,0(v0)
bfc09128:	8c640000 	lw	a0,0(v1)
bfc0912c:	0060a821 	move	s5,v1
bfc09130:	1080000f 	beqz	a0,bfc09170 <core_bench_list+0x150>
bfc09134:	ac620000 	sw	v0,0(v1)
bfc09138:	8c820000 	lw	v0,0(a0)
bfc0913c:	0080a821 	move	s5,a0
bfc09140:	1040000b 	beqz	v0,bfc09170 <core_bench_list+0x150>
bfc09144:	ac830000 	sw	v1,0(a0)
bfc09148:	0040a821 	move	s5,v0
bfc0914c:	8c420000 	lw	v0,0(v0)
bfc09150:	02a01821 	move	v1,s5
bfc09154:	10400006 	beqz	v0,bfc09170 <core_bench_list+0x150>
bfc09158:	aea40000 	sw	a0,0(s5)
bfc0915c:	0040a821 	move	s5,v0
bfc09160:	8ea20000 	lw	v0,0(s5)
bfc09164:	00000000 	nop
bfc09168:	1440ffdf 	bnez	v0,bfc090e8 <core_bench_list+0xc8>
bfc0916c:	aea30000 	sw	v1,0(s5)
bfc09170:	10c0013c 	beqz	a2,bfc09664 <core_bench_list+0x644>
bfc09174:	02a01021 	move	v0,s5
bfc09178:	8ccd0004 	lw	t5,4(a2)
bfc0917c:	250c0001 	addiu	t4,t0,1
bfc09180:	85a40000 	lh	a0,0(t5)
bfc09184:	00000000 	nop
bfc09188:	30820001 	andi	v0,a0,0x1
bfc0918c:	10400005 	beqz	v0,bfc091a4 <core_bench_list+0x184>
bfc09190:	3188ffff 	andi	t0,t4,0xffff
bfc09194:	00047a43 	sra	t7,a0,0x9
bfc09198:	31ee0001 	andi	t6,t7,0x1
bfc0919c:	012e2021 	addu	a0,t1,t6
bfc091a0:	3089ffff 	andi	t1,a0,0xffff
bfc091a4:	8cc40000 	lw	a0,0(a2)
bfc091a8:	00000000 	nop
bfc091ac:	10800008 	beqz	a0,bfc091d0 <core_bench_list+0x1b0>
bfc091b0:	00000000 	nop
bfc091b4:	8c900000 	lw	s0,0(a0)
bfc091b8:	00000000 	nop
bfc091bc:	acd00000 	sw	s0,0(a2)
bfc091c0:	8ea60000 	lw	a2,0(s5)
bfc091c4:	00000000 	nop
bfc091c8:	ac860000 	sw	a2,0(a0)
bfc091cc:	aea40000 	sw	a0,0(s5)
bfc091d0:	8fa30010 	lw	v1,16(sp)
bfc091d4:	00000000 	nop
bfc091d8:	04600004 	bltz	v1,bfc091ec <core_bench_list+0x1cc>
bfc091dc:	24730001 	addiu	s3,v1,1
bfc091e0:	00139400 	sll	s2,s3,0x10
bfc091e4:	00128c03 	sra	s1,s2,0x10
bfc091e8:	afb10010 	sw	s1,16(sp)
bfc091ec:	24f60001 	addiu	s6,a3,1
bfc091f0:	00163c00 	sll	a3,s6,0x10
bfc091f4:	00073c03 	sra	a3,a3,0x10
bfc091f8:	00eaa02a 	slt	s4,a3,t2
bfc091fc:	1680ff9e 	bnez	s4,bfc09078 <core_bench_list+0x58>
bfc09200:	00000000 	nop
bfc09204:	012b5023 	subu	t2,t1,t3
bfc09208:	00084880 	sll	t1,t0,0x2
bfc0920c:	01494021 	addu	t0,t2,t1
bfc09210:	311effff 	andi	s8,t0,0xffff
bfc09214:	18a00090 	blez	a1,bfc09458 <core_bench_list+0x438>
bfc09218:	00000000 	nop
bfc0921c:	12a0008d 	beqz	s5,bfc09454 <core_bench_list+0x434>
bfc09220:	24160001 	li	s6,1
bfc09224:	0000b821 	move	s7,zero
bfc09228:	0000a021 	move	s4,zero
bfc0922c:	00002021 	move	a0,zero
bfc09230:	8eb10000 	lw	s1,0(s5)
bfc09234:	26cbffff 	addiu	t3,s6,-1
bfc09238:	26f70001 	addiu	s7,s7,1
bfc0923c:	31630007 	andi	v1,t3,0x7
bfc09240:	12200053 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09244:	24130001 	li	s3,1
bfc09248:	0276502a 	slt	t2,s3,s6
bfc0924c:	11400051 	beqz	t2,bfc09394 <core_bench_list+0x374>
bfc09250:	02a08021 	move	s0,s5
bfc09254:	1060002c 	beqz	v1,bfc09308 <core_bench_list+0x2e8>
bfc09258:	00000000 	nop
bfc0925c:	10730023 	beq	v1,s3,bfc092ec <core_bench_list+0x2cc>
bfc09260:	24060002 	li	a2,2
bfc09264:	1066001d 	beq	v1,a2,bfc092dc <core_bench_list+0x2bc>
bfc09268:	24090003 	li	t1,3
bfc0926c:	10690017 	beq	v1,t1,bfc092cc <core_bench_list+0x2ac>
bfc09270:	240b0004 	li	t3,4
bfc09274:	106b0011 	beq	v1,t3,bfc092bc <core_bench_list+0x29c>
bfc09278:	24180005 	li	t8,5
bfc0927c:	1078000b 	beq	v1,t8,bfc092ac <core_bench_list+0x28c>
bfc09280:	24190006 	li	t9,6
bfc09284:	10790005 	beq	v1,t9,bfc0929c <core_bench_list+0x27c>
bfc09288:	00000000 	nop
bfc0928c:	8e310000 	lw	s1,0(s1)
bfc09290:	00000000 	nop
bfc09294:	1220003f 	beqz	s1,bfc09394 <core_bench_list+0x374>
bfc09298:	24130002 	li	s3,2
bfc0929c:	8e310000 	lw	s1,0(s1)
bfc092a0:	00000000 	nop
bfc092a4:	1220003a 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092a8:	26730001 	addiu	s3,s3,1
bfc092ac:	8e310000 	lw	s1,0(s1)
bfc092b0:	00000000 	nop
bfc092b4:	12200036 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092b8:	26730001 	addiu	s3,s3,1
bfc092bc:	8e310000 	lw	s1,0(s1)
bfc092c0:	00000000 	nop
bfc092c4:	12200032 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092c8:	26730001 	addiu	s3,s3,1
bfc092cc:	8e310000 	lw	s1,0(s1)
bfc092d0:	00000000 	nop
bfc092d4:	1220002e 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092d8:	26730001 	addiu	s3,s3,1
bfc092dc:	8e310000 	lw	s1,0(s1)
bfc092e0:	00000000 	nop
bfc092e4:	1220002a 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092e8:	26730001 	addiu	s3,s3,1
bfc092ec:	8e310000 	lw	s1,0(s1)
bfc092f0:	00000000 	nop
bfc092f4:	12200026 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc092f8:	26730001 	addiu	s3,s3,1
bfc092fc:	0276f82a 	slt	ra,s3,s6
bfc09300:	13e00024 	beqz	ra,bfc09394 <core_bench_list+0x374>
bfc09304:	02a08021 	move	s0,s5
bfc09308:	8e310000 	lw	s1,0(s1)
bfc0930c:	26730001 	addiu	s3,s3,1
bfc09310:	1220001f 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09314:	02601021 	move	v0,s3
bfc09318:	8e310000 	lw	s1,0(s1)
bfc0931c:	00000000 	nop
bfc09320:	1220001b 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09324:	26730001 	addiu	s3,s3,1
bfc09328:	8e310000 	lw	s1,0(s1)
bfc0932c:	00000000 	nop
bfc09330:	12200017 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09334:	24530002 	addiu	s3,v0,2
bfc09338:	8e310000 	lw	s1,0(s1)
bfc0933c:	00000000 	nop
bfc09340:	12200013 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09344:	24530003 	addiu	s3,v0,3
bfc09348:	8e310000 	lw	s1,0(s1)
bfc0934c:	00000000 	nop
bfc09350:	1220000f 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09354:	24530004 	addiu	s3,v0,4
bfc09358:	8e310000 	lw	s1,0(s1)
bfc0935c:	00000000 	nop
bfc09360:	1220000b 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09364:	24530005 	addiu	s3,v0,5
bfc09368:	8e310000 	lw	s1,0(s1)
bfc0936c:	00000000 	nop
bfc09370:	12200007 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09374:	24530006 	addiu	s3,v0,6
bfc09378:	8e310000 	lw	s1,0(s1)
bfc0937c:	24530007 	addiu	s3,v0,7
bfc09380:	12200003 	beqz	s1,bfc09390 <core_bench_list+0x370>
bfc09384:	0276102a 	slt	v0,s3,s6
bfc09388:	1440ffdf 	bnez	v0,bfc09308 <core_bench_list+0x2e8>
bfc0938c:	00000000 	nop
bfc09390:	02a08021 	move	s0,s5
bfc09394:	02c09021 	move	s2,s6
bfc09398:	12600017 	beqz	s3,bfc093f8 <core_bench_list+0x3d8>
bfc0939c:	0080a821 	move	s5,a0
bfc093a0:	1240001f 	beqz	s2,bfc09420 <core_bench_list+0x400>
bfc093a4:	00000000 	nop
bfc093a8:	1220001d 	beqz	s1,bfc09420 <core_bench_list+0x400>
bfc093ac:	00000000 	nop
bfc093b0:	8e040004 	lw	a0,4(s0)
bfc093b4:	8e250004 	lw	a1,4(s1)
bfc093b8:	8fa60040 	lw	a2,64(sp)
bfc093bc:	0ff02378 	jal	bfc08de0 <cmp_complex>
bfc093c0:	00000000 	nop
bfc093c4:	18400016 	blez	v0,bfc09420 <core_bench_list+0x400>
bfc093c8:	00000000 	nop
bfc093cc:	8e220000 	lw	v0,0(s1)
bfc093d0:	02001821 	move	v1,s0
bfc093d4:	2652ffff 	addiu	s2,s2,-1
bfc093d8:	02208021 	move	s0,s1
bfc093dc:	1280000e 	beqz	s4,bfc09418 <core_bench_list+0x3f8>
bfc093e0:	00000000 	nop
bfc093e4:	ae900000 	sw	s0,0(s4)
bfc093e8:	0200a021 	move	s4,s0
bfc093ec:	00408821 	move	s1,v0
bfc093f0:	1660ffeb 	bnez	s3,bfc093a0 <core_bench_list+0x380>
bfc093f4:	00608021 	move	s0,v1
bfc093f8:	1240000d 	beqz	s2,bfc09430 <core_bench_list+0x410>
bfc093fc:	00000000 	nop
bfc09400:	1220000f 	beqz	s1,bfc09440 <core_bench_list+0x420>
bfc09404:	02001821 	move	v1,s0
bfc09408:	2652ffff 	addiu	s2,s2,-1
bfc0940c:	8e220000 	lw	v0,0(s1)
bfc09410:	1680fff4 	bnez	s4,bfc093e4 <core_bench_list+0x3c4>
bfc09414:	02208021 	move	s0,s1
bfc09418:	0bf024fa 	j	bfc093e8 <core_bench_list+0x3c8>
bfc0941c:	0200a821 	move	s5,s0
bfc09420:	2673ffff 	addiu	s3,s3,-1
bfc09424:	8e030000 	lw	v1,0(s0)
bfc09428:	0bf024f7 	j	bfc093dc <core_bench_list+0x3bc>
bfc0942c:	02201021 	move	v0,s1
bfc09430:	12200003 	beqz	s1,bfc09440 <core_bench_list+0x420>
bfc09434:	02a02021 	move	a0,s5
bfc09438:	0bf0248c 	j	bfc09230 <core_bench_list+0x210>
bfc0943c:	0220a821 	move	s5,s1
bfc09440:	24050001 	li	a1,1
bfc09444:	12e50004 	beq	s7,a1,bfc09458 <core_bench_list+0x438>
bfc09448:	ae800000 	sw	zero,0(s4)
bfc0944c:	16a0ff75 	bnez	s5,bfc09224 <core_bench_list+0x204>
bfc09450:	0016b040 	sll	s6,s6,0x1
bfc09454:	aea00000 	sw	zero,0(s5)
bfc09458:	8eb80000 	lw	t8,0(s5)
bfc0945c:	8fb70010 	lw	s7,16(sp)
bfc09460:	8f110000 	lw	s1,0(t8)
bfc09464:	8f030004 	lw	v1,4(t8)
bfc09468:	8e390004 	lw	t9,4(s1)
bfc0946c:	8e3f0000 	lw	ra,0(s1)
bfc09470:	af190004 	sw	t9,4(t8)
bfc09474:	af1f0000 	sw	ra,0(t8)
bfc09478:	00603021 	move	a2,v1
bfc0947c:	ae200000 	sw	zero,0(s1)
bfc09480:	06e00172 	bltz	s7,bfc09a4c <core_bench_list+0xa2c>
bfc09484:	ae230004 	sw	v1,4(s1)
bfc09488:	8ea50004 	lw	a1,4(s5)
bfc0948c:	8fa40010 	lw	a0,16(sp)
bfc09490:	84ad0002 	lh	t5,2(a1)
bfc09494:	00000000 	nop
bfc09498:	11a4000f 	beq	t5,a0,bfc094d8 <core_bench_list+0x4b8>
bfc0949c:	02a08021 	move	s0,s5
bfc094a0:	0bf02530 	j	bfc094c0 <core_bench_list+0x4a0>
bfc094a4:	02a02021 	move	a0,s5
bfc094a8:	8c900004 	lw	s0,4(a0)
bfc094ac:	8fae0010 	lw	t6,16(sp)
bfc094b0:	860f0002 	lh	t7,2(s0)
bfc094b4:	00000000 	nop
bfc094b8:	11ee0007 	beq	t7,t6,bfc094d8 <core_bench_list+0x4b8>
bfc094bc:	00808021 	move	s0,a0
bfc094c0:	8c840000 	lw	a0,0(a0)
bfc094c4:	00000000 	nop
bfc094c8:	1480fff7 	bnez	a0,bfc094a8 <core_bench_list+0x488>
bfc094cc:	00000000 	nop
bfc094d0:	8eb00000 	lw	s0,0(s5)
bfc094d4:	00000000 	nop
bfc094d8:	1200006d 	beqz	s0,bfc09690 <core_bench_list+0x670>
bfc094dc:	00000000 	nop
bfc094e0:	84a40000 	lh	a0,0(a1)
bfc094e4:	0ff0179c 	jal	bfc05e70 <crc16>
bfc094e8:	03c02821 	move	a1,s8
bfc094ec:	8e100000 	lw	s0,0(s0)
bfc094f0:	0040f021 	move	s8,v0
bfc094f4:	12000065 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc094f8:	00402821 	move	a1,v0
bfc094fc:	8ebe0004 	lw	s8,4(s5)
bfc09500:	00000000 	nop
bfc09504:	87c40000 	lh	a0,0(s8)
bfc09508:	0ff0179c 	jal	bfc05e70 <crc16>
bfc0950c:	00000000 	nop
bfc09510:	8e100000 	lw	s0,0(s0)
bfc09514:	0040f021 	move	s8,v0
bfc09518:	1200005c 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc0951c:	00402821 	move	a1,v0
bfc09520:	8eb20004 	lw	s2,4(s5)
bfc09524:	00000000 	nop
bfc09528:	86440000 	lh	a0,0(s2)
bfc0952c:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09530:	00000000 	nop
bfc09534:	8e100000 	lw	s0,0(s0)
bfc09538:	0040f021 	move	s8,v0
bfc0953c:	12000053 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc09540:	00402821 	move	a1,v0
bfc09544:	8eb30004 	lw	s3,4(s5)
bfc09548:	00000000 	nop
bfc0954c:	86640000 	lh	a0,0(s3)
bfc09550:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09554:	00000000 	nop
bfc09558:	8e100000 	lw	s0,0(s0)
bfc0955c:	0040f021 	move	s8,v0
bfc09560:	1200004a 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc09564:	00402821 	move	a1,v0
bfc09568:	8eb40004 	lw	s4,4(s5)
bfc0956c:	00000000 	nop
bfc09570:	86840000 	lh	a0,0(s4)
bfc09574:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09578:	00000000 	nop
bfc0957c:	8e100000 	lw	s0,0(s0)
bfc09580:	0040f021 	move	s8,v0
bfc09584:	12000041 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc09588:	00402821 	move	a1,v0
bfc0958c:	8ebe0004 	lw	s8,4(s5)
bfc09590:	00000000 	nop
bfc09594:	87c40000 	lh	a0,0(s8)
bfc09598:	0ff0179c 	jal	bfc05e70 <crc16>
bfc0959c:	00000000 	nop
bfc095a0:	8e100000 	lw	s0,0(s0)
bfc095a4:	0040f021 	move	s8,v0
bfc095a8:	12000038 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc095ac:	00402821 	move	a1,v0
bfc095b0:	8ea70004 	lw	a3,4(s5)
bfc095b4:	00000000 	nop
bfc095b8:	84e40000 	lh	a0,0(a3)
bfc095bc:	0ff0179c 	jal	bfc05e70 <crc16>
bfc095c0:	00000000 	nop
bfc095c4:	8e100000 	lw	s0,0(s0)
bfc095c8:	0040f021 	move	s8,v0
bfc095cc:	1200002f 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc095d0:	00402821 	move	a1,v0
bfc095d4:	8ea80004 	lw	t0,4(s5)
bfc095d8:	00000000 	nop
bfc095dc:	85040000 	lh	a0,0(t0)
bfc095e0:	0ff0179c 	jal	bfc05e70 <crc16>
bfc095e4:	00000000 	nop
bfc095e8:	8e100000 	lw	s0,0(s0)
bfc095ec:	00000000 	nop
bfc095f0:	12000026 	beqz	s0,bfc0968c <core_bench_list+0x66c>
bfc095f4:	0040f021 	move	s8,v0
bfc095f8:	8ea50004 	lw	a1,4(s5)
bfc095fc:	0bf02538 	j	bfc094e0 <core_bench_list+0x4c0>
bfc09600:	00000000 	nop
bfc09604:	12a00016 	beqz	s5,bfc09660 <core_bench_list+0x640>
bfc09608:	00001021 	move	v0,zero
bfc0960c:	8eac0004 	lw	t4,4(s5)
bfc09610:	8fa40014 	lw	a0,20(sp)
bfc09614:	91860000 	lbu	a2,0(t4)
bfc09618:	00000000 	nop
bfc0961c:	10c4feae 	beq	a2,a0,bfc090d8 <core_bench_list+0xb8>
bfc09620:	02a03021 	move	a2,s5
bfc09624:	0bf02591 	j	bfc09644 <core_bench_list+0x624>
bfc09628:	02a02021 	move	a0,s5
bfc0962c:	8c960004 	lw	s6,4(a0)
bfc09630:	8fb30014 	lw	s3,20(sp)
bfc09634:	92d40000 	lbu	s4,0(s6)
bfc09638:	00000000 	nop
bfc0963c:	1293fea6 	beq	s4,s3,bfc090d8 <core_bench_list+0xb8>
bfc09640:	00803021 	move	a2,a0
bfc09644:	8c840000 	lw	a0,0(a0)
bfc09648:	00000000 	nop
bfc0964c:	1480fff7 	bnez	a0,bfc0962c <core_bench_list+0x60c>
bfc09650:	00003021 	move	a2,zero
bfc09654:	0bf02436 	j	bfc090d8 <core_bench_list+0xb8>
bfc09658:	00000000 	nop
bfc0965c:	00001021 	move	v0,zero
bfc09660:	0000a821 	move	s5,zero
bfc09664:	8c430000 	lw	v1,0(v0)
bfc09668:	257f0001 	addiu	ra,t3,1
bfc0966c:	8c7e0004 	lw	s8,4(v1)
bfc09670:	33ebffff 	andi	t3,ra,0xffff
bfc09674:	83d90001 	lb	t9,1(s8)
bfc09678:	00000000 	nop
bfc0967c:	33380001 	andi	t8,t9,0x1
bfc09680:	0138b821 	addu	s7,t1,t8
bfc09684:	0bf02474 	j	bfc091d0 <core_bench_list+0x1b0>
bfc09688:	32e9ffff 	andi	t1,s7,0xffff
bfc0968c:	8e260004 	lw	a2,4(s1)
bfc09690:	8ea70000 	lw	a3,0(s5)
bfc09694:	24160001 	li	s6,1
bfc09698:	8cea0004 	lw	t2,4(a3)
bfc0969c:	8ce80000 	lw	t0,0(a3)
bfc096a0:	ae2a0004 	sw	t2,4(s1)
bfc096a4:	ae280000 	sw	t0,0(s1)
bfc096a8:	ace60004 	sw	a2,4(a3)
bfc096ac:	12a0008d 	beqz	s5,bfc098e4 <core_bench_list+0x8c4>
bfc096b0:	acf10000 	sw	s1,0(a3)
bfc096b4:	0000b821 	move	s7,zero
bfc096b8:	0000a021 	move	s4,zero
bfc096bc:	00002021 	move	a0,zero
bfc096c0:	8eb10000 	lw	s1,0(s5)
bfc096c4:	26c6ffff 	addiu	a2,s6,-1
bfc096c8:	26f70001 	addiu	s7,s7,1
bfc096cc:	30c30007 	andi	v1,a2,0x7
bfc096d0:	12200053 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc096d4:	24130001 	li	s3,1
bfc096d8:	0276282a 	slt	a1,s3,s6
bfc096dc:	10a00051 	beqz	a1,bfc09824 <core_bench_list+0x804>
bfc096e0:	02a08021 	move	s0,s5
bfc096e4:	1060002c 	beqz	v1,bfc09798 <core_bench_list+0x778>
bfc096e8:	00000000 	nop
bfc096ec:	10730023 	beq	v1,s3,bfc0977c <core_bench_list+0x75c>
bfc096f0:	24020002 	li	v0,2
bfc096f4:	1062001d 	beq	v1,v0,bfc0976c <core_bench_list+0x74c>
bfc096f8:	240c0003 	li	t4,3
bfc096fc:	106c0017 	beq	v1,t4,bfc0975c <core_bench_list+0x73c>
bfc09700:	240d0004 	li	t5,4
bfc09704:	106d0011 	beq	v1,t5,bfc0974c <core_bench_list+0x72c>
bfc09708:	240e0005 	li	t6,5
bfc0970c:	106e000b 	beq	v1,t6,bfc0973c <core_bench_list+0x71c>
bfc09710:	240f0006 	li	t7,6
bfc09714:	106f0005 	beq	v1,t7,bfc0972c <core_bench_list+0x70c>
bfc09718:	00000000 	nop
bfc0971c:	8e310000 	lw	s1,0(s1)
bfc09720:	00000000 	nop
bfc09724:	1220003f 	beqz	s1,bfc09824 <core_bench_list+0x804>
bfc09728:	24130002 	li	s3,2
bfc0972c:	8e310000 	lw	s1,0(s1)
bfc09730:	00000000 	nop
bfc09734:	1220003a 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09738:	26730001 	addiu	s3,s3,1
bfc0973c:	8e310000 	lw	s1,0(s1)
bfc09740:	00000000 	nop
bfc09744:	12200036 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09748:	26730001 	addiu	s3,s3,1
bfc0974c:	8e310000 	lw	s1,0(s1)
bfc09750:	00000000 	nop
bfc09754:	12200032 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09758:	26730001 	addiu	s3,s3,1
bfc0975c:	8e310000 	lw	s1,0(s1)
bfc09760:	00000000 	nop
bfc09764:	1220002e 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09768:	26730001 	addiu	s3,s3,1
bfc0976c:	8e310000 	lw	s1,0(s1)
bfc09770:	00000000 	nop
bfc09774:	1220002a 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09778:	26730001 	addiu	s3,s3,1
bfc0977c:	8e310000 	lw	s1,0(s1)
bfc09780:	00000000 	nop
bfc09784:	12200026 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09788:	26730001 	addiu	s3,s3,1
bfc0978c:	0276802a 	slt	s0,s3,s6
bfc09790:	12000024 	beqz	s0,bfc09824 <core_bench_list+0x804>
bfc09794:	02a08021 	move	s0,s5
bfc09798:	8e310000 	lw	s1,0(s1)
bfc0979c:	26730001 	addiu	s3,s3,1
bfc097a0:	1220001f 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097a4:	02601021 	move	v0,s3
bfc097a8:	8e310000 	lw	s1,0(s1)
bfc097ac:	00000000 	nop
bfc097b0:	1220001b 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097b4:	26730001 	addiu	s3,s3,1
bfc097b8:	8e310000 	lw	s1,0(s1)
bfc097bc:	00000000 	nop
bfc097c0:	12200017 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097c4:	24530002 	addiu	s3,v0,2
bfc097c8:	8e310000 	lw	s1,0(s1)
bfc097cc:	00000000 	nop
bfc097d0:	12200013 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097d4:	24530003 	addiu	s3,v0,3
bfc097d8:	8e310000 	lw	s1,0(s1)
bfc097dc:	00000000 	nop
bfc097e0:	1220000f 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097e4:	24530004 	addiu	s3,v0,4
bfc097e8:	8e310000 	lw	s1,0(s1)
bfc097ec:	00000000 	nop
bfc097f0:	1220000b 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc097f4:	24530005 	addiu	s3,v0,5
bfc097f8:	8e310000 	lw	s1,0(s1)
bfc097fc:	00000000 	nop
bfc09800:	12200007 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09804:	24530006 	addiu	s3,v0,6
bfc09808:	8e310000 	lw	s1,0(s1)
bfc0980c:	24530007 	addiu	s3,v0,7
bfc09810:	12200003 	beqz	s1,bfc09820 <core_bench_list+0x800>
bfc09814:	0276102a 	slt	v0,s3,s6
bfc09818:	1440ffdf 	bnez	v0,bfc09798 <core_bench_list+0x778>
bfc0981c:	00000000 	nop
bfc09820:	02a08021 	move	s0,s5
bfc09824:	02c09021 	move	s2,s6
bfc09828:	12600016 	beqz	s3,bfc09884 <core_bench_list+0x864>
bfc0982c:	0080a821 	move	s5,a0
bfc09830:	1240001f 	beqz	s2,bfc098b0 <core_bench_list+0x890>
bfc09834:	00000000 	nop
bfc09838:	1220001d 	beqz	s1,bfc098b0 <core_bench_list+0x890>
bfc0983c:	00000000 	nop
bfc09840:	8e040004 	lw	a0,4(s0)
bfc09844:	8e250004 	lw	a1,4(s1)
bfc09848:	0ff02010 	jal	bfc08040 <cmp_idx>
bfc0984c:	00003021 	move	a2,zero
bfc09850:	18400017 	blez	v0,bfc098b0 <core_bench_list+0x890>
bfc09854:	00000000 	nop
bfc09858:	8e220000 	lw	v0,0(s1)
bfc0985c:	02001821 	move	v1,s0
bfc09860:	2652ffff 	addiu	s2,s2,-1
bfc09864:	02208021 	move	s0,s1
bfc09868:	1280000e 	beqz	s4,bfc098a4 <core_bench_list+0x884>
bfc0986c:	00000000 	nop
bfc09870:	ae900000 	sw	s0,0(s4)
bfc09874:	0200a021 	move	s4,s0
bfc09878:	00408821 	move	s1,v0
bfc0987c:	1660ffec 	bnez	s3,bfc09830 <core_bench_list+0x810>
bfc09880:	00608021 	move	s0,v1
bfc09884:	1240000e 	beqz	s2,bfc098c0 <core_bench_list+0x8a0>
bfc09888:	00000000 	nop
bfc0988c:	12200010 	beqz	s1,bfc098d0 <core_bench_list+0x8b0>
bfc09890:	02001821 	move	v1,s0
bfc09894:	2652ffff 	addiu	s2,s2,-1
bfc09898:	8e220000 	lw	v0,0(s1)
bfc0989c:	1680fff4 	bnez	s4,bfc09870 <core_bench_list+0x850>
bfc098a0:	02208021 	move	s0,s1
bfc098a4:	0bf0261d 	j	bfc09874 <core_bench_list+0x854>
bfc098a8:	0200a821 	move	s5,s0
bfc098ac:	00000000 	nop
bfc098b0:	2673ffff 	addiu	s3,s3,-1
bfc098b4:	8e030000 	lw	v1,0(s0)
bfc098b8:	0bf0261a 	j	bfc09868 <core_bench_list+0x848>
bfc098bc:	02201021 	move	v0,s1
bfc098c0:	12200003 	beqz	s1,bfc098d0 <core_bench_list+0x8b0>
bfc098c4:	02a02021 	move	a0,s5
bfc098c8:	0bf025b0 	j	bfc096c0 <core_bench_list+0x6a0>
bfc098cc:	0220a821 	move	s5,s1
bfc098d0:	24110001 	li	s1,1
bfc098d4:	12f10004 	beq	s7,s1,bfc098e8 <core_bench_list+0x8c8>
bfc098d8:	ae800000 	sw	zero,0(s4)
bfc098dc:	16a0ff75 	bnez	s5,bfc096b4 <core_bench_list+0x694>
bfc098e0:	0016b040 	sll	s6,s6,0x1
bfc098e4:	aea00000 	sw	zero,0(s5)
bfc098e8:	8eb00000 	lw	s0,0(s5)
bfc098ec:	00000000 	nop
bfc098f0:	12000049 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc098f4:	00000000 	nop
bfc098f8:	8eb60004 	lw	s6,4(s5)
bfc098fc:	00000000 	nop
bfc09900:	86c40000 	lh	a0,0(s6)
bfc09904:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09908:	03c02821 	move	a1,s8
bfc0990c:	8e100000 	lw	s0,0(s0)
bfc09910:	0040f021 	move	s8,v0
bfc09914:	12000040 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc09918:	00402821 	move	a1,v0
bfc0991c:	8ea90004 	lw	t1,4(s5)
bfc09920:	00000000 	nop
bfc09924:	85240000 	lh	a0,0(t1)
bfc09928:	0ff0179c 	jal	bfc05e70 <crc16>
bfc0992c:	00000000 	nop
bfc09930:	8e100000 	lw	s0,0(s0)
bfc09934:	0040f021 	move	s8,v0
bfc09938:	12000037 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc0993c:	00402821 	move	a1,v0
bfc09940:	8eab0004 	lw	t3,4(s5)
bfc09944:	00000000 	nop
bfc09948:	85640000 	lh	a0,0(t3)
bfc0994c:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09950:	00000000 	nop
bfc09954:	8e100000 	lw	s0,0(s0)
bfc09958:	0040f021 	move	s8,v0
bfc0995c:	1200002e 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc09960:	00402821 	move	a1,v0
bfc09964:	8eb70004 	lw	s7,4(s5)
bfc09968:	00000000 	nop
bfc0996c:	86e40000 	lh	a0,0(s7)
bfc09970:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09974:	00000000 	nop
bfc09978:	8e100000 	lw	s0,0(s0)
bfc0997c:	0040f021 	move	s8,v0
bfc09980:	12000025 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc09984:	00402821 	move	a1,v0
bfc09988:	8eb80004 	lw	t8,4(s5)
bfc0998c:	00000000 	nop
bfc09990:	87040000 	lh	a0,0(t8)
bfc09994:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09998:	00000000 	nop
bfc0999c:	8e100000 	lw	s0,0(s0)
bfc099a0:	0040f021 	move	s8,v0
bfc099a4:	1200001c 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc099a8:	00402821 	move	a1,v0
bfc099ac:	8eb90004 	lw	t9,4(s5)
bfc099b0:	00000000 	nop
bfc099b4:	87240000 	lh	a0,0(t9)
bfc099b8:	0ff0179c 	jal	bfc05e70 <crc16>
bfc099bc:	00000000 	nop
bfc099c0:	8e100000 	lw	s0,0(s0)
bfc099c4:	0040f021 	move	s8,v0
bfc099c8:	12000013 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc099cc:	00402821 	move	a1,v0
bfc099d0:	8ebf0004 	lw	ra,4(s5)
bfc099d4:	00000000 	nop
bfc099d8:	87e40000 	lh	a0,0(ra)
bfc099dc:	0ff0179c 	jal	bfc05e70 <crc16>
bfc099e0:	00000000 	nop
bfc099e4:	8e100000 	lw	s0,0(s0)
bfc099e8:	0040f021 	move	s8,v0
bfc099ec:	1200000a 	beqz	s0,bfc09a18 <core_bench_list+0x9f8>
bfc099f0:	00402821 	move	a1,v0
bfc099f4:	8ea30004 	lw	v1,4(s5)
bfc099f8:	00000000 	nop
bfc099fc:	84640000 	lh	a0,0(v1)
bfc09a00:	0ff0179c 	jal	bfc05e70 <crc16>
bfc09a04:	00000000 	nop
bfc09a08:	8e100000 	lw	s0,0(s0)
bfc09a0c:	00000000 	nop
bfc09a10:	1600ffb9 	bnez	s0,bfc098f8 <core_bench_list+0x8d8>
bfc09a14:	0040f021 	move	s8,v0
bfc09a18:	8fbf003c 	lw	ra,60(sp)
bfc09a1c:	03c01021 	move	v0,s8
bfc09a20:	8fbe0038 	lw	s8,56(sp)
bfc09a24:	8fb70034 	lw	s7,52(sp)
bfc09a28:	8fb60030 	lw	s6,48(sp)
bfc09a2c:	8fb5002c 	lw	s5,44(sp)
bfc09a30:	8fb40028 	lw	s4,40(sp)
bfc09a34:	8fb30024 	lw	s3,36(sp)
bfc09a38:	8fb20020 	lw	s2,32(sp)
bfc09a3c:	8fb1001c 	lw	s1,28(sp)
bfc09a40:	8fb00018 	lw	s0,24(sp)
bfc09a44:	03e00008 	jr	ra
bfc09a48:	27bd0040 	addiu	sp,sp,64
bfc09a4c:	8ea50004 	lw	a1,4(s5)
bfc09a50:	8fac0014 	lw	t4,20(sp)
bfc09a54:	90a20000 	lbu	v0,0(a1)
bfc09a58:	00000000 	nop
bfc09a5c:	104cfe9e 	beq	v0,t4,bfc094d8 <core_bench_list+0x4b8>
bfc09a60:	02a08021 	move	s0,s5
bfc09a64:	0bf026a1 	j	bfc09a84 <core_bench_list+0xa64>
bfc09a68:	02a02021 	move	a0,s5
bfc09a6c:	8c940004 	lw	s4,4(a0)
bfc09a70:	8fb20014 	lw	s2,20(sp)
bfc09a74:	92930000 	lbu	s3,0(s4)
bfc09a78:	00000000 	nop
bfc09a7c:	1253fe96 	beq	s2,s3,bfc094d8 <core_bench_list+0x4b8>
bfc09a80:	00808021 	move	s0,a0
bfc09a84:	8c840000 	lw	a0,0(a0)
bfc09a88:	00000000 	nop
bfc09a8c:	1480fff7 	bnez	a0,bfc09a6c <core_bench_list+0xa4c>
bfc09a90:	00000000 	nop
bfc09a94:	0bf02534 	j	bfc094d0 <core_bench_list+0x4b0>
bfc09a98:	00000000 	nop
bfc09a9c:	afa50010 	sw	a1,16(sp)
bfc09aa0:	0bf02485 	j	bfc09214 <core_bench_list+0x1f4>
bfc09aa4:	0000f021 	move	s8,zero
	...

bfc09ab0 <portable_malloc>:
portable_malloc():
bfc09ab0:	03e00008 	jr	ra
bfc09ab4:	00001021 	move	v0,zero
	...

bfc09ac0 <portable_free>:
portable_free():
bfc09ac0:	03e00008 	jr	ra
bfc09ac4:	00000000 	nop
	...

bfc09ad0 <get_time>:
get_time():
bfc09ad0:	3c0c8000 	lui	t4,0x8000
bfc09ad4:	3c0b8000 	lui	t3,0x8000
bfc09ad8:	25820920 	addiu	v0,t4,2336
bfc09adc:	25650910 	addiu	a1,t3,2320
bfc09ae0:	8c580004 	lw	t8,4(v0)
bfc09ae4:	8cb90004 	lw	t9,4(a1)
bfc09ae8:	3c0f000f 	lui	t7,0xf
bfc09aec:	03197023 	subu	t6,t8,t9
bfc09af0:	35ed4240 	ori	t5,t7,0x4240
bfc09af4:	15a00002 	bnez	t5,bfc09b00 <get_time+0x30>
bfc09af8:	01cd001b 	divu	zero,t6,t5
bfc09afc:	0007000d 	break	0x7
bfc09b00:	8d890920 	lw	t1,2336(t4)
bfc09b04:	8d6a0910 	lw	t2,2320(t3)
bfc09b08:	00000000 	nop
bfc09b0c:	012a1823 	subu	v1,t1,t2
bfc09b10:	00034080 	sll	t0,v1,0x2
bfc09b14:	000339c0 	sll	a3,v1,0x7
bfc09b18:	00e83023 	subu	a2,a3,t0
bfc09b1c:	00c32021 	addu	a0,a2,v1
bfc09b20:	000410c0 	sll	v0,a0,0x3
bfc09b24:	00002812 	mflo	a1
bfc09b28:	03e00008 	jr	ra
bfc09b2c:	00a21021 	addu	v0,a1,v0

bfc09b30 <time_in_secs>:
time_in_secs():
bfc09b30:	240203e8 	li	v0,1000
bfc09b34:	14400002 	bnez	v0,bfc09b40 <time_in_secs+0x10>
bfc09b38:	0082001b 	divu	zero,a0,v0
bfc09b3c:	0007000d 	break	0x7
bfc09b40:	00001012 	mflo	v0
bfc09b44:	03e00008 	jr	ra
bfc09b48:	00000000 	nop
bfc09b4c:	00000000 	nop

bfc09b50 <portable_init>:
portable_init():
bfc09b50:	24020001 	li	v0,1
bfc09b54:	03e00008 	jr	ra
bfc09b58:	a0820000 	sb	v0,0(a0)
bfc09b5c:	00000000 	nop

bfc09b60 <portable_fini>:
portable_fini():
bfc09b60:	03e00008 	jr	ra
bfc09b64:	a0800000 	sb	zero,0(a0)
	...

bfc09b70 <stop_time>:
stop_time():
bfc09b70:	3c058000 	lui	a1,0x8000
bfc09b74:	24a50920 	addiu	a1,a1,2336
bfc09b78:	0bf0280c 	j	bfc0a030 <clock_gettime>
bfc09b7c:	00002021 	move	a0,zero

bfc09b80 <start_time>:
start_time():
bfc09b80:	3c058000 	lui	a1,0x8000
bfc09b84:	24a50910 	addiu	a1,a1,2320
bfc09b88:	0bf0280c 	j	bfc0a030 <clock_gettime>
bfc09b8c:	00002021 	move	a0,zero

bfc09b90 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc09b90:	27bdffc8 	addiu	sp,sp,-56
bfc09b94:	afb30024 	sw	s3,36(sp)
bfc09b98:	afbf0034 	sw	ra,52(sp)
bfc09b9c:	afb60030 	sw	s6,48(sp)
bfc09ba0:	afb5002c 	sw	s5,44(sp)
bfc09ba4:	afb40028 	sw	s4,40(sp)
bfc09ba8:	afb20020 	sw	s2,32(sp)
bfc09bac:	afb1001c 	sw	s1,28(sp)
bfc09bb0:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc09bb4:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc09bb8:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc09bbc:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc09bc0:	afa5003c 	sw	a1,60(sp)
bfc09bc4:	afa60040 	sw	a2,64(sp)
bfc09bc8:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc09bcc:	12000013 	beqz	s0,bfc09c1c <printf+0x8c>
bfc09bd0:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc09bd4:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc09bd8:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc09bdc:	24560720 	addiu	s6,v0,1824
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc09be0:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc09be4:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc09be8:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc09bec:	12140016 	beq	s0,s4,bfc09c48 <printf+0xb8>
bfc09bf0:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc09bf4:	1215002f 	beq	s0,s5,bfc09cb4 <printf+0x124>
bfc09bf8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc09bfc:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09c00:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc09c04:	26310001 	addiu	s1,s1,1
bfc09c08:	02711021 	addu	v0,s3,s1
bfc09c0c:	80500000 	lb	s0,0(v0)
bfc09c10:	00000000 	nop
bfc09c14:	1600fff5 	bnez	s0,bfc09bec <printf+0x5c>
bfc09c18:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc09c1c:	8fbf0034 	lw	ra,52(sp)
bfc09c20:	00001021 	move	v0,zero
bfc09c24:	8fb60030 	lw	s6,48(sp)
bfc09c28:	8fb5002c 	lw	s5,44(sp)
bfc09c2c:	8fb40028 	lw	s4,40(sp)
bfc09c30:	8fb30024 	lw	s3,36(sp)
bfc09c34:	8fb20020 	lw	s2,32(sp)
bfc09c38:	8fb1001c 	lw	s1,28(sp)
bfc09c3c:	8fb00018 	lw	s0,24(sp)
bfc09c40:	03e00008 	jr	ra
bfc09c44:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc09c48:	80440001 	lb	a0,1(v0)
bfc09c4c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc09c50:	2482ffdb 	addiu	v0,a0,-37
bfc09c54:	304200ff 	andi	v0,v0,0xff
bfc09c58:	2c430054 	sltiu	v1,v0,84
bfc09c5c:	14600005 	bnez	v1,bfc09c74 <printf+0xe4>
bfc09c60:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc09c64:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09c68:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc09c6c:	0bf02702 	j	bfc09c08 <printf+0x78>
bfc09c70:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc09c74:	02c21021 	addu	v0,s6,v0
bfc09c78:	8c430000 	lw	v1,0(v0)
bfc09c7c:	00000000 	nop
bfc09c80:	00600008 	jr	v1
bfc09c84:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc09c88:	26310001 	addiu	s1,s1,1
bfc09c8c:	02711021 	addu	v0,s3,s1
bfc09c90:	80440001 	lb	a0,1(v0)
bfc09c94:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc09c98:	2482ffcf 	addiu	v0,a0,-49
bfc09c9c:	304200ff 	andi	v0,v0,0xff
bfc09ca0:	2c420009 	sltiu	v0,v0,9
bfc09ca4:	1440003f 	bnez	v0,bfc09da4 <printf+0x214>
bfc09ca8:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc09cac:	0bf02715 	j	bfc09c54 <printf+0xc4>
bfc09cb0:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc09cb4:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09cb8:	2404000d 	li	a0,13
bfc09cbc:	0bf026ff 	j	bfc09bfc <printf+0x6c>
bfc09cc0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc09cc4:	8e440000 	lw	a0,0(s2)
bfc09cc8:	2406000a 	li	a2,10
bfc09ccc:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09cd0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc09cd4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc09cd8:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09cdc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc09ce0:	8e440000 	lw	a0,0(s2)
bfc09ce4:	0ff02788 	jal	bfc09e20 <putstring>
bfc09ce8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc09cec:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09cf0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc09cf4:	8e440000 	lw	a0,0(s2)
bfc09cf8:	24060010 	li	a2,16
bfc09cfc:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09d00:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc09d04:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc09d08:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d0c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc09d10:	8e440000 	lw	a0,0(s2)
bfc09d14:	24060008 	li	a2,8
bfc09d18:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09d1c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc09d20:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc09d24:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d28:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc09d2c:	8e440000 	lw	a0,0(s2)
bfc09d30:	2406000a 	li	a2,10
bfc09d34:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09d38:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc09d3c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc09d40:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d44:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc09d48:	8e440000 	lw	a0,0(s2)
bfc09d4c:	2406000a 	li	a2,10
bfc09d50:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09d54:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc09d58:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc09d5c:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d60:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc09d64:	8e440000 	lw	a0,0(s2)
bfc09d68:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09d6c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc09d70:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d74:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc09d78:	8e440000 	lw	a0,0(s2)
bfc09d7c:	24060002 	li	a2,2
bfc09d80:	0ff027b8 	jal	bfc09ee0 <printbase>
bfc09d84:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc09d88:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc09d8c:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09d90:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc09d94:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09d98:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc09d9c:	0bf02701 	j	bfc09c04 <printf+0x74>
bfc09da0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc09da4:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc09da8:	000510c0 	sll	v0,a1,0x3
bfc09dac:	00051840 	sll	v1,a1,0x1
bfc09db0:	00621821 	addu	v1,v1,v0
bfc09db4:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc09db8:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc09dbc:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc09dc0:	2482ffcf 	addiu	v0,a0,-49
bfc09dc4:	304200ff 	andi	v0,v0,0xff
bfc09dc8:	2c420009 	sltiu	v0,v0,9
bfc09dcc:	26310001 	addiu	s1,s1,1
bfc09dd0:	1040ff9f 	beqz	v0,bfc09c50 <printf+0xc0>
bfc09dd4:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc09dd8:	0bf0276b 	j	bfc09dac <printf+0x21c>
bfc09ddc:	000510c0 	sll	v0,a1,0x3

bfc09de0 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc09de0:	3c018000 	lui	at,0x8000
bfc09de4:	03e00008 	jr	ra
bfc09de8:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc09dec:	03e00008 	jr	ra
bfc09df0:	00000000 	nop

bfc09df4 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc09df4:	27bdffe8 	addiu	sp,sp,-24
bfc09df8:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc09dfc:	0ff02778 	jal	bfc09de0 <tgt_putchar>
bfc09e00:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc09e04:	8fbf0014 	lw	ra,20(sp)
bfc09e08:	00001021 	move	v0,zero
bfc09e0c:	03e00008 	jr	ra
bfc09e10:	27bd0018 	addiu	sp,sp,24
	...

bfc09e20 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc09e20:	27bdffe0 	addiu	sp,sp,-32
bfc09e24:	afb10014 	sw	s1,20(sp)
bfc09e28:	afbf001c 	sw	ra,28(sp)
bfc09e2c:	afb20018 	sw	s2,24(sp)
bfc09e30:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc09e34:	80900000 	lb	s0,0(a0)
bfc09e38:	00000000 	nop
bfc09e3c:	12000013 	beqz	s0,bfc09e8c <putstring+0x6c>
bfc09e40:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc09e44:	0bf02799 	j	bfc09e64 <putstring+0x44>
bfc09e48:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc09e4c:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09e50:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc09e54:	82300000 	lb	s0,0(s1)
bfc09e58:	00000000 	nop
bfc09e5c:	1200000b 	beqz	s0,bfc09e8c <putstring+0x6c>
bfc09e60:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc09e64:	1612fff9 	bne	s0,s2,bfc09e4c <putstring+0x2c>
bfc09e68:	26310001 	addiu	s1,s1,1
bfc09e6c:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09e70:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc09e74:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09e78:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc09e7c:	82300000 	lb	s0,0(s1)
bfc09e80:	00000000 	nop
bfc09e84:	1600fff7 	bnez	s0,bfc09e64 <putstring+0x44>
bfc09e88:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc09e8c:	8fbf001c 	lw	ra,28(sp)
bfc09e90:	00001021 	move	v0,zero
bfc09e94:	8fb20018 	lw	s2,24(sp)
bfc09e98:	8fb10014 	lw	s1,20(sp)
bfc09e9c:	8fb00010 	lw	s0,16(sp)
bfc09ea0:	03e00008 	jr	ra
bfc09ea4:	27bd0020 	addiu	sp,sp,32

bfc09ea8 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc09ea8:	27bdffe8 	addiu	sp,sp,-24
bfc09eac:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc09eb0:	0ff02788 	jal	bfc09e20 <putstring>
bfc09eb4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc09eb8:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09ebc:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc09ec0:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09ec4:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc09ec8:	8fbf0014 	lw	ra,20(sp)
bfc09ecc:	00001021 	move	v0,zero
bfc09ed0:	03e00008 	jr	ra
bfc09ed4:	27bd0018 	addiu	sp,sp,24
	...

bfc09ee0 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc09ee0:	27bdff98 	addiu	sp,sp,-104
bfc09ee4:	afb30060 	sw	s3,96(sp)
bfc09ee8:	afb2005c 	sw	s2,92(sp)
bfc09eec:	afbf0064 	sw	ra,100(sp)
bfc09ef0:	afb10058 	sw	s1,88(sp)
bfc09ef4:	afb00054 	sw	s0,84(sp)
bfc09ef8:	00801821 	move	v1,a0
bfc09efc:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc09f00:	10e00003 	beqz	a3,bfc09f10 <printbase+0x30>
bfc09f04:	00c09021 	move	s2,a2
bfc09f08:	0480002f 	bltz	a0,bfc09fc8 <printbase+0xe8>
bfc09f0c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc09f10:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc09f14:	1200000c 	beqz	s0,bfc09f48 <printbase+0x68>
bfc09f18:	00008821 	move	s1,zero
bfc09f1c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc09f20:	16400002 	bnez	s2,bfc09f2c <printbase+0x4c>
bfc09f24:	0212001b 	divu	zero,s0,s2
bfc09f28:	0007000d 	break	0x7
bfc09f2c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc09f30:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc09f34:	00001010 	mfhi	v0
bfc09f38:	a0820000 	sb	v0,0(a0)
bfc09f3c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc09f40:	1460fff7 	bnez	v1,bfc09f20 <printbase+0x40>
bfc09f44:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc09f48:	0233102a 	slt	v0,s1,s3
bfc09f4c:	10400002 	beqz	v0,bfc09f58 <printbase+0x78>
bfc09f50:	02201821 	move	v1,s1
bfc09f54:	02601821 	move	v1,s3
bfc09f58:	1060000c 	beqz	v1,bfc09f8c <printbase+0xac>
bfc09f5c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc09f60:	27a20010 	addiu	v0,sp,16
bfc09f64:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc09f68:	26020001 	addiu	v0,s0,1
bfc09f6c:	0222102a 	slt	v0,s1,v0
bfc09f70:	1040000e 	beqz	v0,bfc09fac <printbase+0xcc>
bfc09f74:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc09f78:	02009821 	move	s3,s0
bfc09f7c:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09f80:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc09f84:	1660fff8 	bnez	s3,bfc09f68 <printbase+0x88>
bfc09f88:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc09f8c:	8fbf0064 	lw	ra,100(sp)
bfc09f90:	00001021 	move	v0,zero
bfc09f94:	8fb30060 	lw	s3,96(sp)
bfc09f98:	8fb2005c 	lw	s2,92(sp)
bfc09f9c:	8fb10058 	lw	s1,88(sp)
bfc09fa0:	8fb00054 	lw	s0,84(sp)
bfc09fa4:	03e00008 	jr	ra
bfc09fa8:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc09fac:	82440000 	lb	a0,0(s2)
bfc09fb0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc09fb4:	2882000a 	slti	v0,a0,10
bfc09fb8:	14400007 	bnez	v0,bfc09fd8 <printbase+0xf8>
bfc09fbc:	02009821 	move	s3,s0
bfc09fc0:	0bf027df 	j	bfc09f7c <printbase+0x9c>
bfc09fc4:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc09fc8:	0ff0277d 	jal	bfc09df4 <putchar>
bfc09fcc:	00038023 	negu	s0,v1
bfc09fd0:	0bf027c5 	j	bfc09f14 <printbase+0x34>
bfc09fd4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc09fd8:	0bf027de 	j	bfc09f78 <printbase+0x98>
bfc09fdc:	24840030 	addiu	a0,a0,48

bfc09fe0 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc09fe0:	3c01bfd0 	lui	at,0xbfd0
bfc09fe4:	3421e000 	ori	at,at,0xe000
bfc09fe8:	8c220000 	lw	v0,0(at)
bfc09fec:	03e00008 	jr	ra
bfc09ff0:	00000000 	nop

bfc09ff4 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc09ff4:	3c01bfd0 	lui	at,0xbfd0
bfc09ff8:	3421e000 	ori	at,at,0xe000
bfc09ffc:	8c220000 	lw	v0,0(at)
bfc0a000:	03e00008 	jr	ra
bfc0a004:	00000000 	nop

bfc0a008 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc0a008:	3c01bfd0 	lui	at,0xbfd0
bfc0a00c:	3421e000 	ori	at,at,0xe000
bfc0a010:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc0a014:	03e00008 	jr	ra
bfc0a018:	00021040 	sll	v0,v0,0x1

bfc0a01c <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc0a01c:	3c01bfd0 	lui	at,0xbfd0
bfc0a020:	3421e000 	ori	at,at,0xe000
bfc0a024:	8c220000 	lw	v0,0(at)
bfc0a028:	03e00008 	jr	ra
bfc0a02c:	00000000 	nop

bfc0a030 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc0a030:	27bdffe8 	addiu	sp,sp,-24
bfc0a034:	afbf0014 	sw	ra,20(sp)
bfc0a038:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc0a03c:	3c01bfd0 	lui	at,0xbfd0
bfc0a040:	3421e000 	ori	at,at,0xe000
bfc0a044:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc0a048:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0a04c:	14400002 	bnez	v0,bfc0a058 <clock_gettime+0x28>
bfc0a050:	0062001b 	divu	zero,v1,v0
bfc0a054:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc0a058:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc0a05c:	3c073b9a 	lui	a3,0x3b9a
bfc0a060:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc0a064:	3c048000 	lui	a0,0x8000
bfc0a068:	24840870 	addiu	a0,a0,2160
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0a06c:	00003012 	mflo	a2
bfc0a070:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc0a074:	14400002 	bnez	v0,bfc0a080 <clock_gettime+0x50>
bfc0a078:	0062001b 	divu	zero,v1,v0
bfc0a07c:	0007000d 	break	0x7
bfc0a080:	00002810 	mfhi	a1
bfc0a084:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0a088:	14400002 	bnez	v0,bfc0a094 <clock_gettime+0x64>
bfc0a08c:	00c2001b 	divu	zero,a2,v0
bfc0a090:	0007000d 	break	0x7
bfc0a094:	00005010 	mfhi	t2
bfc0a098:	ad2a0008 	sw	t2,8(t1)
bfc0a09c:	00004012 	mflo	t0
bfc0a0a0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc0a0a4:	14e00002 	bnez	a3,bfc0a0b0 <clock_gettime+0x80>
bfc0a0a8:	00c7001b 	divu	zero,a2,a3
bfc0a0ac:	0007000d 	break	0x7
bfc0a0b0:	00003012 	mflo	a2
bfc0a0b4:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc0a0b8:	14400002 	bnez	v0,bfc0a0c4 <clock_gettime+0x94>
bfc0a0bc:	0102001b 	divu	zero,t0,v0
bfc0a0c0:	0007000d 	break	0x7
bfc0a0c4:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc0a0c8:	0ff026e4 	jal	bfc09b90 <printf>
bfc0a0cc:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc0a0d0:	8fbf0014 	lw	ra,20(sp)
bfc0a0d4:	00001021 	move	v0,zero
bfc0a0d8:	03e00008 	jr	ra
bfc0a0dc:	27bd0018 	addiu	sp,sp,24

bfc0a0e0 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc0a0e0:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc0a0e4:	03e00008 	jr	ra
bfc0a0e8:	00000000 	nop

bfc0a0ec <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0a0ec:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc0a0f0:	03e00008 	jr	ra
bfc0a0f4:	00000000 	nop

bfc0a0f8 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc0a0f8:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc0a0fc:	27bdffe8 	addiu	sp,sp,-24
bfc0a100:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc0a104:	0ff026e4 	jal	bfc09b90 <printf>
bfc0a108:	24840884 	addiu	a0,a0,2180
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc0a10c:	3c048000 	lui	a0,0x8000
bfc0a110:	248408a0 	addiu	a0,a0,2208
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc0a114:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc0a118:	0ff026e4 	jal	bfc09b90 <printf>
bfc0a11c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc0a120:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc0a124:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc0a128:	248408b0 	addiu	a0,a0,2224
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc0a12c:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0a130:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc0a134:	0bf026e4 	j	bfc09b90 <printf>
bfc0a138:	00000000 	nop
bfc0a13c:	00000000 	nop
