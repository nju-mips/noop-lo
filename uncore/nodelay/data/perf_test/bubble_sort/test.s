
obj/bubble_sort/main.elf:     file format elf32-tradlittlemips
obj/bubble_sort/main.elf


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
bfc00010:	27bd420c 	addiu	sp,sp,16908
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279ca170 	addiu	gp,gp,-24208
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
bfc00380:	0ff003f2 	jal	bfc00fc8 <exception>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:69
bfc00384:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:70
bfc00388:	0bf00009 	j	bfc00024 <exit>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:71
bfc0038c:	00000000 	nop

bfc00390 <shell>:
shell():
bfc00390:	3c078000 	lui	a3,0x8000
bfc00394:	27bdffe0 	addiu	sp,sp,-32
bfc00398:	24e40000 	addiu	a0,a3,0
bfc0039c:	afbf001c 	sw	ra,28(sp)
bfc003a0:	afb10018 	sw	s1,24(sp)
bfc003a4:	0ff0035e 	jal	bfc00d78 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff003b1 	jal	bfc00ec4 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	3c068000 	lui	a2,0x8000
bfc003b8:	24c40230 	addiu	a0,a2,560
bfc003bc:	240503e8 	li	a1,1000
bfc003c0:	0ff00184 	jal	bfc00610 <bubble_sort>
bfc003c4:	00408021 	move	s0,v0
bfc003c8:	0ff003b1 	jal	bfc00ec4 <get_count>
bfc003cc:	00408821 	move	s1,v0
bfc003d0:	3c038000 	lui	v1,0x8000
bfc003d4:	8c6511d0 	lw	a1,4560(v1)
bfc003d8:	8e240000 	lw	a0,0(s1)
bfc003dc:	00508023 	subu	s0,v0,s0
bfc003e0:	3c028000 	lui	v0,0x8000
bfc003e4:	24472170 	addiu	a3,v0,8560
bfc003e8:	14850071 	bne	a0,a1,bfc005b0 <shell+0x220>
bfc003ec:	246611d0 	addiu	a2,v1,4560
bfc003f0:	8e2c0004 	lw	t4,4(s1)
bfc003f4:	8ccb0004 	lw	t3,4(a2)
bfc003f8:	26240004 	addiu	a0,s1,4
bfc003fc:	158b006c 	bne	t4,t3,bfc005b0 <shell+0x220>
bfc00400:	24c50004 	addiu	a1,a2,4
bfc00404:	24840004 	addiu	a0,a0,4
bfc00408:	24a50004 	addiu	a1,a1,4
bfc0040c:	8c8e0000 	lw	t6,0(a0)
bfc00410:	8cad0000 	lw	t5,0(a1)
bfc00414:	00000000 	nop
bfc00418:	15cd0065 	bne	t6,t5,bfc005b0 <shell+0x220>
bfc0041c:	24840004 	addiu	a0,a0,4
bfc00420:	24a50004 	addiu	a1,a1,4
bfc00424:	8c910000 	lw	s1,0(a0)
bfc00428:	8caf0000 	lw	t7,0(a1)
bfc0042c:	00000000 	nop
bfc00430:	162f005f 	bne	s1,t7,bfc005b0 <shell+0x220>
bfc00434:	24840004 	addiu	a0,a0,4
bfc00438:	24a50004 	addiu	a1,a1,4
bfc0043c:	8c990000 	lw	t9,0(a0)
bfc00440:	8cb80000 	lw	t8,0(a1)
bfc00444:	00000000 	nop
bfc00448:	17380059 	bne	t9,t8,bfc005b0 <shell+0x220>
bfc0044c:	24840004 	addiu	a0,a0,4
bfc00450:	24a50004 	addiu	a1,a1,4
bfc00454:	8c830000 	lw	v1,0(a0)
bfc00458:	8cbf0000 	lw	ra,0(a1)
bfc0045c:	00000000 	nop
bfc00460:	147f0053 	bne	v1,ra,bfc005b0 <shell+0x220>
bfc00464:	24840004 	addiu	a0,a0,4
bfc00468:	24a50004 	addiu	a1,a1,4
bfc0046c:	8c860000 	lw	a2,0(a0)
bfc00470:	8ca20000 	lw	v0,0(a1)
bfc00474:	00000000 	nop
bfc00478:	14c2004d 	bne	a2,v0,bfc005b0 <shell+0x220>
bfc0047c:	24840004 	addiu	a0,a0,4
bfc00480:	24a50004 	addiu	a1,a1,4
bfc00484:	8c890000 	lw	t1,0(a0)
bfc00488:	8ca80000 	lw	t0,0(a1)
bfc0048c:	00000000 	nop
bfc00490:	15280047 	bne	t1,t0,bfc005b0 <shell+0x220>
bfc00494:	24a50004 	addiu	a1,a1,4
bfc00498:	10a7002b 	beq	a1,a3,bfc00548 <shell+0x1b8>
bfc0049c:	24840004 	addiu	a0,a0,4
bfc004a0:	8c890000 	lw	t1,0(a0)
bfc004a4:	8ca80000 	lw	t0,0(a1)
bfc004a8:	00000000 	nop
bfc004ac:	15280041 	bne	t1,t0,bfc005b4 <shell+0x224>
bfc004b0:	3c198000 	lui	t9,0x8000
bfc004b4:	8c8b0004 	lw	t3,4(a0)
bfc004b8:	8caa0004 	lw	t2,4(a1)
bfc004bc:	00000000 	nop
bfc004c0:	156a003c 	bne	t3,t2,bfc005b4 <shell+0x224>
bfc004c4:	00000000 	nop
bfc004c8:	8c8b0008 	lw	t3,8(a0)
bfc004cc:	8caa0008 	lw	t2,8(a1)
bfc004d0:	00000000 	nop
bfc004d4:	156a0037 	bne	t3,t2,bfc005b4 <shell+0x224>
bfc004d8:	00000000 	nop
bfc004dc:	8c8d000c 	lw	t5,12(a0)
bfc004e0:	8cac000c 	lw	t4,12(a1)
bfc004e4:	00000000 	nop
bfc004e8:	15ac0032 	bne	t5,t4,bfc005b4 <shell+0x224>
bfc004ec:	00000000 	nop
bfc004f0:	8c8f0010 	lw	t7,16(a0)
bfc004f4:	8cae0010 	lw	t6,16(a1)
bfc004f8:	00000000 	nop
bfc004fc:	15ee002d 	bne	t7,t6,bfc005b4 <shell+0x224>
bfc00500:	00000000 	nop
bfc00504:	8c980014 	lw	t8,20(a0)
bfc00508:	8cb10014 	lw	s1,20(a1)
bfc0050c:	00000000 	nop
bfc00510:	17110028 	bne	t8,s1,bfc005b4 <shell+0x224>
bfc00514:	00000000 	nop
bfc00518:	8c9f0018 	lw	ra,24(a0)
bfc0051c:	8cb90018 	lw	t9,24(a1)
bfc00520:	00000000 	nop
bfc00524:	17f90022 	bne	ra,t9,bfc005b0 <shell+0x220>
bfc00528:	00000000 	nop
bfc0052c:	8c83001c 	lw	v1,28(a0)
bfc00530:	8ca2001c 	lw	v0,28(a1)
bfc00534:	24840020 	addiu	a0,a0,32
bfc00538:	1462001d 	bne	v1,v0,bfc005b0 <shell+0x220>
bfc0053c:	24a50020 	addiu	a1,a1,32
bfc00540:	14a7ffd7 	bne	a1,a3,bfc004a0 <shell+0x110>
bfc00544:	00000000 	nop
bfc00548:	3c0a8000 	lui	t2,0x8000
bfc0054c:	0ff0035e 	jal	bfc00d78 <puts>
bfc00550:	25440054 	addiu	a0,t2,84
bfc00554:	3c09bfd0 	lui	t1,0xbfd0
bfc00558:	3c03bfd0 	lui	v1,0xbfd0
bfc0055c:	24070001 	li	a3,1
bfc00560:	3525f008 	ori	a1,t1,0xf008
bfc00564:	347ff010 	ori	ra,v1,0xf010
bfc00568:	3526f000 	ori	a2,t1,0xf000
bfc0056c:	3528f004 	ori	t0,t1,0xf004
bfc00570:	3402ffff 	li	v0,0xffff
bfc00574:	3c048000 	lui	a0,0x8000
bfc00578:	ad070000 	sw	a3,0(t0)
bfc0057c:	8fb10018 	lw	s1,24(sp)
bfc00580:	acc20000 	sw	v0,0(a2)
bfc00584:	24840030 	addiu	a0,a0,48
bfc00588:	aca70000 	sw	a3,0(a1)
bfc0058c:	aff00000 	sw	s0,0(ra)
bfc00590:	02002821 	move	a1,s0
bfc00594:	8fbf001c 	lw	ra,28(sp)
bfc00598:	8fb00014 	lw	s0,20(sp)
bfc0059c:	0bf00298 	j	bfc00a60 <printf>
bfc005a0:	27bd0020 	addiu	sp,sp,32
	...
bfc005b0:	3c198000 	lui	t9,0x8000
bfc005b4:	0ff0035e 	jal	bfc00d78 <puts>
bfc005b8:	27240018 	addiu	a0,t9,24
bfc005bc:	3c18bfd0 	lui	t8,0xbfd0
bfc005c0:	3c03bfd0 	lui	v1,0xbfd0
bfc005c4:	3711f008 	ori	s1,t8,0xf008
bfc005c8:	347ff010 	ori	ra,v1,0xf010
bfc005cc:	370cf000 	ori	t4,t8,0xf000
bfc005d0:	370ef004 	ori	t6,t8,0xf004
bfc005d4:	240f0001 	li	t7,1
bfc005d8:	240d0002 	li	t5,2
bfc005dc:	3c048000 	lui	a0,0x8000
bfc005e0:	ae2f0000 	sw	t7,0(s1)
bfc005e4:	02002821 	move	a1,s0
bfc005e8:	adcd0000 	sw	t5,0(t6)
bfc005ec:	8fb10018 	lw	s1,24(sp)
bfc005f0:	ad800000 	sw	zero,0(t4)
bfc005f4:	24840030 	addiu	a0,a0,48
bfc005f8:	aff00000 	sw	s0,0(ra)
bfc005fc:	8fbf001c 	lw	ra,28(sp)
bfc00600:	8fb00014 	lw	s0,20(sp)
bfc00604:	0bf00298 	j	bfc00a60 <printf>
bfc00608:	27bd0020 	addiu	sp,sp,32
bfc0060c:	00000000 	nop

bfc00610 <bubble_sort>:
bubble_sort():
bfc00610:	00a05821 	move	t3,a1
bfc00614:	04a0010d 	bltz	a1,bfc00a4c <bubble_sort+0x43c>
bfc00618:	00804021 	move	t0,a0
bfc0061c:	24a70001 	addiu	a3,a1,1
bfc00620:	00075080 	sll	t2,a3,0x2
bfc00624:	2546fffc 	addiu	a2,t2,-4
bfc00628:	8c840000 	lw	a0,0(a0)
bfc0062c:	3c058000 	lui	a1,0x8000
bfc00630:	00061882 	srl	v1,a2,0x2
bfc00634:	24070004 	li	a3,4
bfc00638:	aca42180 	sw	a0,8576(a1)
bfc0063c:	30630007 	andi	v1,v1,0x7
bfc00640:	10ea005a 	beq	a3,t2,bfc007ac <bubble_sort+0x19c>
bfc00644:	24a92180 	addiu	t1,a1,8576
bfc00648:	1060002f 	beqz	v1,bfc00708 <bubble_sort+0xf8>
bfc0064c:	24060001 	li	a2,1
bfc00650:	10660027 	beq	v1,a2,bfc006f0 <bubble_sort+0xe0>
bfc00654:	24050002 	li	a1,2
bfc00658:	10650020 	beq	v1,a1,bfc006dc <bubble_sort+0xcc>
bfc0065c:	24040003 	li	a0,3
bfc00660:	1064001a 	beq	v1,a0,bfc006cc <bubble_sort+0xbc>
bfc00664:	01076021 	addu	t4,t0,a3
bfc00668:	10670012 	beq	v1,a3,bfc006b4 <bubble_sort+0xa4>
bfc0066c:	24190005 	li	t9,5
bfc00670:	1079000b 	beq	v1,t9,bfc006a0 <bubble_sort+0x90>
bfc00674:	24020006 	li	v0,6
bfc00678:	10620005 	beq	v1,v0,bfc00690 <bubble_sort+0x80>
bfc0067c:	01077021 	addu	t6,t0,a3
bfc00680:	8d030004 	lw	v1,4(t0)
bfc00684:	24070008 	li	a3,8
bfc00688:	ad230004 	sw	v1,4(t1)
bfc0068c:	01077021 	addu	t6,t0,a3
bfc00690:	8dcd0000 	lw	t5,0(t6)
bfc00694:	01276021 	addu	t4,t1,a3
bfc00698:	ad8d0000 	sw	t5,0(t4)
bfc0069c:	24e70004 	addiu	a3,a3,4
bfc006a0:	01073021 	addu	a2,t0,a3
bfc006a4:	8cd80000 	lw	t8,0(a2)
bfc006a8:	01277821 	addu	t7,t1,a3
bfc006ac:	adf80000 	sw	t8,0(t7)
bfc006b0:	24e70004 	addiu	a3,a3,4
bfc006b4:	0107c821 	addu	t9,t0,a3
bfc006b8:	8f240000 	lw	a0,0(t9)
bfc006bc:	01272821 	addu	a1,t1,a3
bfc006c0:	aca40000 	sw	a0,0(a1)
bfc006c4:	24e70004 	addiu	a3,a3,4
bfc006c8:	01076021 	addu	t4,t0,a3
bfc006cc:	8d830000 	lw	v1,0(t4)
bfc006d0:	01271021 	addu	v0,t1,a3
bfc006d4:	ac430000 	sw	v1,0(v0)
bfc006d8:	24e70004 	addiu	a3,a3,4
bfc006dc:	01077821 	addu	t7,t0,a3
bfc006e0:	8dee0000 	lw	t6,0(t7)
bfc006e4:	01276821 	addu	t5,t1,a3
bfc006e8:	adae0000 	sw	t6,0(t5)
bfc006ec:	24e70004 	addiu	a3,a3,4
bfc006f0:	01072821 	addu	a1,t0,a3
bfc006f4:	8ca60000 	lw	a2,0(a1)
bfc006f8:	0127c021 	addu	t8,t1,a3
bfc006fc:	24e70004 	addiu	a3,a3,4
bfc00700:	10ea002a 	beq	a3,t2,bfc007ac <bubble_sort+0x19c>
bfc00704:	af060000 	sw	a2,0(t8)
bfc00708:	01071021 	addu	v0,t0,a3
bfc0070c:	8c430000 	lw	v1,0(v0)
bfc00710:	24f80004 	addiu	t8,a3,4
bfc00714:	01272021 	addu	a0,t1,a3
bfc00718:	ac830000 	sw	v1,0(a0)
bfc0071c:	0118c821 	addu	t9,t0,t8
bfc00720:	8f2f0000 	lw	t7,0(t9)
bfc00724:	24ec0008 	addiu	t4,a3,8
bfc00728:	01387021 	addu	t6,t1,t8
bfc0072c:	adcf0000 	sw	t7,0(t6)
bfc00730:	010c6821 	addu	t5,t0,t4
bfc00734:	8da60000 	lw	a2,0(t5)
bfc00738:	24e3000c 	addiu	v1,a3,12
bfc0073c:	012c2821 	addu	a1,t1,t4
bfc00740:	aca60000 	sw	a2,0(a1)
bfc00744:	01031021 	addu	v0,t0,v1
bfc00748:	8c440000 	lw	a0,0(v0)
bfc0074c:	24ef0010 	addiu	t7,a3,16
bfc00750:	0123c821 	addu	t9,t1,v1
bfc00754:	af240000 	sw	a0,0(t9)
bfc00758:	010fc021 	addu	t8,t0,t7
bfc0075c:	8f0e0000 	lw	t6,0(t8)
bfc00760:	24e60014 	addiu	a2,a3,20
bfc00764:	012f6821 	addu	t5,t1,t7
bfc00768:	adae0000 	sw	t6,0(t5)
bfc0076c:	01066021 	addu	t4,t0,a2
bfc00770:	8d850000 	lw	a1,0(t4)
bfc00774:	24e40018 	addiu	a0,a3,24
bfc00778:	01261821 	addu	v1,t1,a2
bfc0077c:	ac650000 	sw	a1,0(v1)
bfc00780:	01041021 	addu	v0,t0,a0
bfc00784:	8c590000 	lw	t9,0(v0)
bfc00788:	24ee001c 	addiu	t6,a3,28
bfc0078c:	0124c021 	addu	t8,t1,a0
bfc00790:	af190000 	sw	t9,0(t8)
bfc00794:	010e7821 	addu	t7,t0,t6
bfc00798:	8ded0000 	lw	t5,0(t7)
bfc0079c:	012e6021 	addu	t4,t1,t6
bfc007a0:	24e70020 	addiu	a3,a3,32
bfc007a4:	14eaffd8 	bne	a3,t2,bfc00708 <bubble_sort+0xf8>
bfc007a8:	ad8d0000 	sw	t5,0(t4)
bfc007ac:	196000a5 	blez	t3,bfc00a44 <bubble_sort+0x434>
bfc007b0:	2565ffff 	addiu	a1,t3,-1
bfc007b4:	01205021 	move	t2,t1
bfc007b8:	240bffff 	li	t3,-1
bfc007bc:	30a30007 	andi	v1,a1,0x7
bfc007c0:	01403021 	move	a2,t2
bfc007c4:	1060004f 	beqz	v1,bfc00904 <bubble_sort+0x2f4>
bfc007c8:	00004021 	move	t0,zero
bfc007cc:	18a0009a 	blez	a1,bfc00a38 <bubble_sort+0x428>
bfc007d0:	00000000 	nop
bfc007d4:	8d470000 	lw	a3,0(t2)
bfc007d8:	8d440004 	lw	a0,4(t2)
bfc007dc:	00000000 	nop
bfc007e0:	0087702a 	slt	t6,a0,a3
bfc007e4:	11c00003 	beqz	t6,bfc007f4 <bubble_sort+0x1e4>
bfc007e8:	24080001 	li	t0,1
bfc007ec:	ad440000 	sw	a0,0(t2)
bfc007f0:	ad470004 	sw	a3,4(t2)
bfc007f4:	240f0001 	li	t7,1
bfc007f8:	106f0042 	beq	v1,t7,bfc00904 <bubble_sort+0x2f4>
bfc007fc:	24c60004 	addiu	a2,a2,4
bfc00800:	24180002 	li	t8,2
bfc00804:	10780036 	beq	v1,t8,bfc008e0 <bubble_sort+0x2d0>
bfc00808:	24190003 	li	t9,3
bfc0080c:	1079002b 	beq	v1,t9,bfc008bc <bubble_sort+0x2ac>
bfc00810:	24040004 	li	a0,4
bfc00814:	10640020 	beq	v1,a0,bfc00898 <bubble_sort+0x288>
bfc00818:	24020005 	li	v0,5
bfc0081c:	10620015 	beq	v1,v0,bfc00874 <bubble_sort+0x264>
bfc00820:	24070006 	li	a3,6
bfc00824:	1067000a 	beq	v1,a3,bfc00850 <bubble_sort+0x240>
bfc00828:	00000000 	nop
bfc0082c:	8cc40000 	lw	a0,0(a2)
bfc00830:	8cc30004 	lw	v1,4(a2)
bfc00834:	00000000 	nop
bfc00838:	0064602a 	slt	t4,v1,a0
bfc0083c:	11800003 	beqz	t4,bfc0084c <bubble_sort+0x23c>
bfc00840:	25080001 	addiu	t0,t0,1
bfc00844:	acc30000 	sw	v1,0(a2)
bfc00848:	acc40004 	sw	a0,4(a2)
bfc0084c:	24c60004 	addiu	a2,a2,4
bfc00850:	8cc40000 	lw	a0,0(a2)
bfc00854:	8cc30004 	lw	v1,4(a2)
bfc00858:	00000000 	nop
bfc0085c:	0064682a 	slt	t5,v1,a0
bfc00860:	11a00003 	beqz	t5,bfc00870 <bubble_sort+0x260>
bfc00864:	25080001 	addiu	t0,t0,1
bfc00868:	acc30000 	sw	v1,0(a2)
bfc0086c:	acc40004 	sw	a0,4(a2)
bfc00870:	24c60004 	addiu	a2,a2,4
bfc00874:	8cc40000 	lw	a0,0(a2)
bfc00878:	8cc30004 	lw	v1,4(a2)
bfc0087c:	00000000 	nop
bfc00880:	0064702a 	slt	t6,v1,a0
bfc00884:	11c00003 	beqz	t6,bfc00894 <bubble_sort+0x284>
bfc00888:	25080001 	addiu	t0,t0,1
bfc0088c:	acc30000 	sw	v1,0(a2)
bfc00890:	acc40004 	sw	a0,4(a2)
bfc00894:	24c60004 	addiu	a2,a2,4
bfc00898:	8cc40000 	lw	a0,0(a2)
bfc0089c:	8cc30004 	lw	v1,4(a2)
bfc008a0:	00000000 	nop
bfc008a4:	0064782a 	slt	t7,v1,a0
bfc008a8:	11e00003 	beqz	t7,bfc008b8 <bubble_sort+0x2a8>
bfc008ac:	25080001 	addiu	t0,t0,1
bfc008b0:	acc30000 	sw	v1,0(a2)
bfc008b4:	acc40004 	sw	a0,4(a2)
bfc008b8:	24c60004 	addiu	a2,a2,4
bfc008bc:	8cc40000 	lw	a0,0(a2)
bfc008c0:	8cc30004 	lw	v1,4(a2)
bfc008c4:	00000000 	nop
bfc008c8:	0064c02a 	slt	t8,v1,a0
bfc008cc:	13000003 	beqz	t8,bfc008dc <bubble_sort+0x2cc>
bfc008d0:	25080001 	addiu	t0,t0,1
bfc008d4:	acc30000 	sw	v1,0(a2)
bfc008d8:	acc40004 	sw	a0,4(a2)
bfc008dc:	24c60004 	addiu	a2,a2,4
bfc008e0:	8cc40000 	lw	a0,0(a2)
bfc008e4:	8cc30004 	lw	v1,4(a2)
bfc008e8:	00000000 	nop
bfc008ec:	0064c82a 	slt	t9,v1,a0
bfc008f0:	13200003 	beqz	t9,bfc00900 <bubble_sort+0x2f0>
bfc008f4:	25080001 	addiu	t0,t0,1
bfc008f8:	acc30000 	sw	v1,0(a2)
bfc008fc:	acc40004 	sw	a0,4(a2)
bfc00900:	24c60004 	addiu	a2,a2,4
bfc00904:	0105682a 	slt	t5,t0,a1
bfc00908:	11a0004b 	beqz	t5,bfc00a38 <bubble_sort+0x428>
bfc0090c:	00000000 	nop
bfc00910:	8cc40000 	lw	a0,0(a2)
bfc00914:	8cc30004 	lw	v1,4(a2)
bfc00918:	00000000 	nop
bfc0091c:	0064382a 	slt	a3,v1,a0
bfc00920:	10e00003 	beqz	a3,bfc00930 <bubble_sort+0x320>
bfc00924:	25080001 	addiu	t0,t0,1
bfc00928:	acc30000 	sw	v1,0(a2)
bfc0092c:	acc40004 	sw	a0,4(a2)
bfc00930:	24c30004 	addiu	v1,a2,4
bfc00934:	8cc70004 	lw	a3,4(a2)
bfc00938:	8c640004 	lw	a0,4(v1)
bfc0093c:	00000000 	nop
bfc00940:	0087602a 	slt	t4,a0,a3
bfc00944:	11800003 	beqz	t4,bfc00954 <bubble_sort+0x344>
bfc00948:	00000000 	nop
bfc0094c:	acc40004 	sw	a0,4(a2)
bfc00950:	ac670004 	sw	a3,4(v1)
bfc00954:	24670004 	addiu	a3,v1,4
bfc00958:	8c660004 	lw	a2,4(v1)
bfc0095c:	8ce40004 	lw	a0,4(a3)
bfc00960:	00000000 	nop
bfc00964:	0086102a 	slt	v0,a0,a2
bfc00968:	10400003 	beqz	v0,bfc00978 <bubble_sort+0x368>
bfc0096c:	00000000 	nop
bfc00970:	ac640004 	sw	a0,4(v1)
bfc00974:	ace60004 	sw	a2,4(a3)
bfc00978:	24670008 	addiu	a3,v1,8
bfc0097c:	8c660008 	lw	a2,8(v1)
bfc00980:	8ce40004 	lw	a0,4(a3)
bfc00984:	00000000 	nop
bfc00988:	0086602a 	slt	t4,a0,a2
bfc0098c:	11800003 	beqz	t4,bfc0099c <bubble_sort+0x38c>
bfc00990:	00000000 	nop
bfc00994:	ac640008 	sw	a0,8(v1)
bfc00998:	ace60004 	sw	a2,4(a3)
bfc0099c:	2467000c 	addiu	a3,v1,12
bfc009a0:	8c66000c 	lw	a2,12(v1)
bfc009a4:	8ce40004 	lw	a0,4(a3)
bfc009a8:	00000000 	nop
bfc009ac:	0086682a 	slt	t5,a0,a2
bfc009b0:	11a00003 	beqz	t5,bfc009c0 <bubble_sort+0x3b0>
bfc009b4:	00000000 	nop
bfc009b8:	ac64000c 	sw	a0,12(v1)
bfc009bc:	ace60004 	sw	a2,4(a3)
bfc009c0:	24670010 	addiu	a3,v1,16
bfc009c4:	8c660010 	lw	a2,16(v1)
bfc009c8:	8ce40004 	lw	a0,4(a3)
bfc009cc:	00000000 	nop
bfc009d0:	0086702a 	slt	t6,a0,a2
bfc009d4:	11c00003 	beqz	t6,bfc009e4 <bubble_sort+0x3d4>
bfc009d8:	00000000 	nop
bfc009dc:	ac640010 	sw	a0,16(v1)
bfc009e0:	ace60004 	sw	a2,4(a3)
bfc009e4:	24670014 	addiu	a3,v1,20
bfc009e8:	8c660014 	lw	a2,20(v1)
bfc009ec:	8ce40004 	lw	a0,4(a3)
bfc009f0:	00000000 	nop
bfc009f4:	0086782a 	slt	t7,a0,a2
bfc009f8:	11e00003 	beqz	t7,bfc00a08 <bubble_sort+0x3f8>
bfc009fc:	00000000 	nop
bfc00a00:	ac640014 	sw	a0,20(v1)
bfc00a04:	ace60004 	sw	a2,4(a3)
bfc00a08:	24670018 	addiu	a3,v1,24
bfc00a0c:	8c660018 	lw	a2,24(v1)
bfc00a10:	8ce40004 	lw	a0,4(a3)
bfc00a14:	00000000 	nop
bfc00a18:	0086c02a 	slt	t8,a0,a2
bfc00a1c:	13000003 	beqz	t8,bfc00a2c <bubble_sort+0x41c>
bfc00a20:	25080007 	addiu	t0,t0,7
bfc00a24:	ac640018 	sw	a0,24(v1)
bfc00a28:	ace60004 	sw	a2,4(a3)
bfc00a2c:	0105682a 	slt	t5,t0,a1
bfc00a30:	15a0ffb7 	bnez	t5,bfc00910 <bubble_sort+0x300>
bfc00a34:	2466001c 	addiu	a2,v1,28
bfc00a38:	24a5ffff 	addiu	a1,a1,-1
bfc00a3c:	14abff60 	bne	a1,t3,bfc007c0 <bubble_sort+0x1b0>
bfc00a40:	30a30007 	andi	v1,a1,0x7
bfc00a44:	03e00008 	jr	ra
bfc00a48:	01201021 	move	v0,t1
bfc00a4c:	3c028000 	lui	v0,0x8000
bfc00a50:	0bf00291 	j	bfc00a44 <bubble_sort+0x434>
bfc00a54:	24492180 	addiu	t1,v0,8576
	...

bfc00a60 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00a60:	27bdffc8 	addiu	sp,sp,-56
bfc00a64:	afb30024 	sw	s3,36(sp)
bfc00a68:	afbf0034 	sw	ra,52(sp)
bfc00a6c:	afb60030 	sw	s6,48(sp)
bfc00a70:	afb5002c 	sw	s5,44(sp)
bfc00a74:	afb40028 	sw	s4,40(sp)
bfc00a78:	afb20020 	sw	s2,32(sp)
bfc00a7c:	afb1001c 	sw	s1,28(sp)
bfc00a80:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00a84:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00a88:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc00a8c:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00a90:	afa5003c 	sw	a1,60(sp)
bfc00a94:	afa60040 	sw	a2,64(sp)
bfc00a98:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00a9c:	12000013 	beqz	s0,bfc00aec <printf+0x8c>
bfc00aa0:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00aa4:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00aa8:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00aac:	24560070 	addiu	s6,v0,112
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00ab0:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00ab4:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00ab8:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00abc:	12140016 	beq	s0,s4,bfc00b18 <printf+0xb8>
bfc00ac0:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00ac4:	1215002f 	beq	s0,s5,bfc00b84 <printf+0x124>
bfc00ac8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc00acc:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00ad0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00ad4:	26310001 	addiu	s1,s1,1
bfc00ad8:	02711021 	addu	v0,s3,s1
bfc00adc:	80500000 	lb	s0,0(v0)
bfc00ae0:	00000000 	nop
bfc00ae4:	1600fff5 	bnez	s0,bfc00abc <printf+0x5c>
bfc00ae8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc00aec:	8fbf0034 	lw	ra,52(sp)
bfc00af0:	00001021 	move	v0,zero
bfc00af4:	8fb60030 	lw	s6,48(sp)
bfc00af8:	8fb5002c 	lw	s5,44(sp)
bfc00afc:	8fb40028 	lw	s4,40(sp)
bfc00b00:	8fb30024 	lw	s3,36(sp)
bfc00b04:	8fb20020 	lw	s2,32(sp)
bfc00b08:	8fb1001c 	lw	s1,28(sp)
bfc00b0c:	8fb00018 	lw	s0,24(sp)
bfc00b10:	03e00008 	jr	ra
bfc00b14:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00b18:	80440001 	lb	a0,1(v0)
bfc00b1c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00b20:	2482ffdb 	addiu	v0,a0,-37
bfc00b24:	304200ff 	andi	v0,v0,0xff
bfc00b28:	2c430054 	sltiu	v1,v0,84
bfc00b2c:	14600005 	bnez	v1,bfc00b44 <printf+0xe4>
bfc00b30:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc00b34:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00b38:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00b3c:	0bf002b6 	j	bfc00ad8 <printf+0x78>
bfc00b40:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00b44:	02c21021 	addu	v0,s6,v0
bfc00b48:	8c430000 	lw	v1,0(v0)
bfc00b4c:	00000000 	nop
bfc00b50:	00600008 	jr	v1
bfc00b54:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00b58:	26310001 	addiu	s1,s1,1
bfc00b5c:	02711021 	addu	v0,s3,s1
bfc00b60:	80440001 	lb	a0,1(v0)
bfc00b64:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00b68:	2482ffcf 	addiu	v0,a0,-49
bfc00b6c:	304200ff 	andi	v0,v0,0xff
bfc00b70:	2c420009 	sltiu	v0,v0,9
bfc00b74:	1440003f 	bnez	v0,bfc00c74 <printf+0x214>
bfc00b78:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00b7c:	0bf002c9 	j	bfc00b24 <printf+0xc4>
bfc00b80:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00b84:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00b88:	2404000d 	li	a0,13
bfc00b8c:	0bf002b3 	j	bfc00acc <printf+0x6c>
bfc00b90:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00b94:	8e440000 	lw	a0,0(s2)
bfc00b98:	2406000a 	li	a2,10
bfc00b9c:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00ba0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00ba4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00ba8:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00bac:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00bb0:	8e440000 	lw	a0,0(s2)
bfc00bb4:	0ff0033c 	jal	bfc00cf0 <putstring>
bfc00bb8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc00bbc:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00bc0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00bc4:	8e440000 	lw	a0,0(s2)
bfc00bc8:	24060010 	li	a2,16
bfc00bcc:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00bd0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00bd4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00bd8:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00bdc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc00be0:	8e440000 	lw	a0,0(s2)
bfc00be4:	24060008 	li	a2,8
bfc00be8:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00bec:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc00bf0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc00bf4:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00bf8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc00bfc:	8e440000 	lw	a0,0(s2)
bfc00c00:	2406000a 	li	a2,10
bfc00c04:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00c08:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc00c0c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc00c10:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00c14:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc00c18:	8e440000 	lw	a0,0(s2)
bfc00c1c:	2406000a 	li	a2,10
bfc00c20:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00c24:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc00c28:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc00c2c:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00c30:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc00c34:	8e440000 	lw	a0,0(s2)
bfc00c38:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00c3c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00c40:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00c44:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00c48:	8e440000 	lw	a0,0(s2)
bfc00c4c:	24060002 	li	a2,2
bfc00c50:	0ff0036c 	jal	bfc00db0 <printbase>
bfc00c54:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00c58:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc00c5c:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00c60:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00c64:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00c68:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc00c6c:	0bf002b5 	j	bfc00ad4 <printf+0x74>
bfc00c70:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00c74:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00c78:	000510c0 	sll	v0,a1,0x3
bfc00c7c:	00051840 	sll	v1,a1,0x1
bfc00c80:	00621821 	addu	v1,v1,v0
bfc00c84:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00c88:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00c8c:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00c90:	2482ffcf 	addiu	v0,a0,-49
bfc00c94:	304200ff 	andi	v0,v0,0xff
bfc00c98:	2c420009 	sltiu	v0,v0,9
bfc00c9c:	26310001 	addiu	s1,s1,1
bfc00ca0:	1040ff9f 	beqz	v0,bfc00b20 <printf+0xc0>
bfc00ca4:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00ca8:	0bf0031f 	j	bfc00c7c <printf+0x21c>
bfc00cac:	000510c0 	sll	v0,a1,0x3

bfc00cb0 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00cb0:	3c018000 	lui	at,0x8000
bfc00cb4:	03e00008 	jr	ra
bfc00cb8:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc00cbc:	03e00008 	jr	ra
bfc00cc0:	00000000 	nop

bfc00cc4 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00cc4:	27bdffe8 	addiu	sp,sp,-24
bfc00cc8:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc00ccc:	0ff0032c 	jal	bfc00cb0 <tgt_putchar>
bfc00cd0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00cd4:	8fbf0014 	lw	ra,20(sp)
bfc00cd8:	00001021 	move	v0,zero
bfc00cdc:	03e00008 	jr	ra
bfc00ce0:	27bd0018 	addiu	sp,sp,24
	...

bfc00cf0 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc00cf0:	27bdffe0 	addiu	sp,sp,-32
bfc00cf4:	afb10014 	sw	s1,20(sp)
bfc00cf8:	afbf001c 	sw	ra,28(sp)
bfc00cfc:	afb20018 	sw	s2,24(sp)
bfc00d00:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00d04:	80900000 	lb	s0,0(a0)
bfc00d08:	00000000 	nop
bfc00d0c:	12000013 	beqz	s0,bfc00d5c <putstring+0x6c>
bfc00d10:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00d14:	0bf0034d 	j	bfc00d34 <putstring+0x44>
bfc00d18:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00d1c:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00d20:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00d24:	82300000 	lb	s0,0(s1)
bfc00d28:	00000000 	nop
bfc00d2c:	1200000b 	beqz	s0,bfc00d5c <putstring+0x6c>
bfc00d30:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00d34:	1612fff9 	bne	s0,s2,bfc00d1c <putstring+0x2c>
bfc00d38:	26310001 	addiu	s1,s1,1
bfc00d3c:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00d40:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00d44:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00d48:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00d4c:	82300000 	lb	s0,0(s1)
bfc00d50:	00000000 	nop
bfc00d54:	1600fff7 	bnez	s0,bfc00d34 <putstring+0x44>
bfc00d58:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc00d5c:	8fbf001c 	lw	ra,28(sp)
bfc00d60:	00001021 	move	v0,zero
bfc00d64:	8fb20018 	lw	s2,24(sp)
bfc00d68:	8fb10014 	lw	s1,20(sp)
bfc00d6c:	8fb00010 	lw	s0,16(sp)
bfc00d70:	03e00008 	jr	ra
bfc00d74:	27bd0020 	addiu	sp,sp,32

bfc00d78 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc00d78:	27bdffe8 	addiu	sp,sp,-24
bfc00d7c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc00d80:	0ff0033c 	jal	bfc00cf0 <putstring>
bfc00d84:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc00d88:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00d8c:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc00d90:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00d94:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc00d98:	8fbf0014 	lw	ra,20(sp)
bfc00d9c:	00001021 	move	v0,zero
bfc00da0:	03e00008 	jr	ra
bfc00da4:	27bd0018 	addiu	sp,sp,24
	...

bfc00db0 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00db0:	27bdff98 	addiu	sp,sp,-104
bfc00db4:	afb30060 	sw	s3,96(sp)
bfc00db8:	afb2005c 	sw	s2,92(sp)
bfc00dbc:	afbf0064 	sw	ra,100(sp)
bfc00dc0:	afb10058 	sw	s1,88(sp)
bfc00dc4:	afb00054 	sw	s0,84(sp)
bfc00dc8:	00801821 	move	v1,a0
bfc00dcc:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc00dd0:	10e00003 	beqz	a3,bfc00de0 <printbase+0x30>
bfc00dd4:	00c09021 	move	s2,a2
bfc00dd8:	0480002f 	bltz	a0,bfc00e98 <printbase+0xe8>
bfc00ddc:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc00de0:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00de4:	1200000c 	beqz	s0,bfc00e18 <printbase+0x68>
bfc00de8:	00008821 	move	s1,zero
bfc00dec:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00df0:	16400002 	bnez	s2,bfc00dfc <printbase+0x4c>
bfc00df4:	0212001b 	divu	zero,s0,s2
bfc00df8:	0007000d 	break	0x7
bfc00dfc:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00e00:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00e04:	00001010 	mfhi	v0
bfc00e08:	a0820000 	sb	v0,0(a0)
bfc00e0c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00e10:	1460fff7 	bnez	v1,bfc00df0 <printbase+0x40>
bfc00e14:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00e18:	0233102a 	slt	v0,s1,s3
bfc00e1c:	10400002 	beqz	v0,bfc00e28 <printbase+0x78>
bfc00e20:	02201821 	move	v1,s1
bfc00e24:	02601821 	move	v1,s3
bfc00e28:	1060000c 	beqz	v1,bfc00e5c <printbase+0xac>
bfc00e2c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00e30:	27a20010 	addiu	v0,sp,16
bfc00e34:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00e38:	26020001 	addiu	v0,s0,1
bfc00e3c:	0222102a 	slt	v0,s1,v0
bfc00e40:	1040000e 	beqz	v0,bfc00e7c <printbase+0xcc>
bfc00e44:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00e48:	02009821 	move	s3,s0
bfc00e4c:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00e50:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00e54:	1660fff8 	bnez	s3,bfc00e38 <printbase+0x88>
bfc00e58:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc00e5c:	8fbf0064 	lw	ra,100(sp)
bfc00e60:	00001021 	move	v0,zero
bfc00e64:	8fb30060 	lw	s3,96(sp)
bfc00e68:	8fb2005c 	lw	s2,92(sp)
bfc00e6c:	8fb10058 	lw	s1,88(sp)
bfc00e70:	8fb00054 	lw	s0,84(sp)
bfc00e74:	03e00008 	jr	ra
bfc00e78:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00e7c:	82440000 	lb	a0,0(s2)
bfc00e80:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00e84:	2882000a 	slti	v0,a0,10
bfc00e88:	14400007 	bnez	v0,bfc00ea8 <printbase+0xf8>
bfc00e8c:	02009821 	move	s3,s0
bfc00e90:	0bf00393 	j	bfc00e4c <printbase+0x9c>
bfc00e94:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc00e98:	0ff00331 	jal	bfc00cc4 <putchar>
bfc00e9c:	00038023 	negu	s0,v1
bfc00ea0:	0bf00379 	j	bfc00de4 <printbase+0x34>
bfc00ea4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00ea8:	0bf00392 	j	bfc00e48 <printbase+0x98>
bfc00eac:	24840030 	addiu	a0,a0,48

bfc00eb0 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc00eb0:	3c01bfd0 	lui	at,0xbfd0
bfc00eb4:	3421e000 	ori	at,at,0xe000
bfc00eb8:	8c220000 	lw	v0,0(at)
bfc00ebc:	03e00008 	jr	ra
bfc00ec0:	00000000 	nop

bfc00ec4 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc00ec4:	3c01bfd0 	lui	at,0xbfd0
bfc00ec8:	3421e000 	ori	at,at,0xe000
bfc00ecc:	8c220000 	lw	v0,0(at)
bfc00ed0:	03e00008 	jr	ra
bfc00ed4:	00000000 	nop

bfc00ed8 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00ed8:	3c01bfd0 	lui	at,0xbfd0
bfc00edc:	3421e000 	ori	at,at,0xe000
bfc00ee0:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc00ee4:	03e00008 	jr	ra
bfc00ee8:	00021040 	sll	v0,v0,0x1

bfc00eec <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc00eec:	3c01bfd0 	lui	at,0xbfd0
bfc00ef0:	3421e000 	ori	at,at,0xe000
bfc00ef4:	8c220000 	lw	v0,0(at)
bfc00ef8:	03e00008 	jr	ra
bfc00efc:	00000000 	nop

bfc00f00 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc00f00:	27bdffe8 	addiu	sp,sp,-24
bfc00f04:	afbf0014 	sw	ra,20(sp)
bfc00f08:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00f0c:	3c01bfd0 	lui	at,0xbfd0
bfc00f10:	3421e000 	ori	at,at,0xe000
bfc00f14:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00f18:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00f1c:	14400002 	bnez	v0,bfc00f28 <clock_gettime+0x28>
bfc00f20:	0062001b 	divu	zero,v1,v0
bfc00f24:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00f28:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00f2c:	3c073b9a 	lui	a3,0x3b9a
bfc00f30:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00f34:	3c048000 	lui	a0,0x8000
bfc00f38:	248401c0 	addiu	a0,a0,448
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00f3c:	00003012 	mflo	a2
bfc00f40:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00f44:	14400002 	bnez	v0,bfc00f50 <clock_gettime+0x50>
bfc00f48:	0062001b 	divu	zero,v1,v0
bfc00f4c:	0007000d 	break	0x7
bfc00f50:	00002810 	mfhi	a1
bfc00f54:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00f58:	14400002 	bnez	v0,bfc00f64 <clock_gettime+0x64>
bfc00f5c:	00c2001b 	divu	zero,a2,v0
bfc00f60:	0007000d 	break	0x7
bfc00f64:	00005010 	mfhi	t2
bfc00f68:	ad2a0008 	sw	t2,8(t1)
bfc00f6c:	00004012 	mflo	t0
bfc00f70:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00f74:	14e00002 	bnez	a3,bfc00f80 <clock_gettime+0x80>
bfc00f78:	00c7001b 	divu	zero,a2,a3
bfc00f7c:	0007000d 	break	0x7
bfc00f80:	00003012 	mflo	a2
bfc00f84:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc00f88:	14400002 	bnez	v0,bfc00f94 <clock_gettime+0x94>
bfc00f8c:	0102001b 	divu	zero,t0,v0
bfc00f90:	0007000d 	break	0x7
bfc00f94:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00f98:	0ff00298 	jal	bfc00a60 <printf>
bfc00f9c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc00fa0:	8fbf0014 	lw	ra,20(sp)
bfc00fa4:	00001021 	move	v0,zero
bfc00fa8:	03e00008 	jr	ra
bfc00fac:	27bd0018 	addiu	sp,sp,24

bfc00fb0 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00fb0:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc00fb4:	03e00008 	jr	ra
bfc00fb8:	00000000 	nop

bfc00fbc <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc00fbc:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc00fc0:	03e00008 	jr	ra
bfc00fc4:	00000000 	nop

bfc00fc8 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00fc8:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc00fcc:	27bdffe8 	addiu	sp,sp,-24
bfc00fd0:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00fd4:	0ff00298 	jal	bfc00a60 <printf>
bfc00fd8:	248401d4 	addiu	a0,a0,468
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00fdc:	3c048000 	lui	a0,0x8000
bfc00fe0:	248401f0 	addiu	a0,a0,496
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00fe4:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00fe8:	0ff00298 	jal	bfc00a60 <printf>
bfc00fec:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00ff0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00ff4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00ff8:	24840200 	addiu	a0,a0,512
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00ffc:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc01000:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01004:	0bf00298 	j	bfc00a60 <printf>
bfc01008:	00000000 	nop
bfc0100c:	00000000 	nop
