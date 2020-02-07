
obj/select_sort/main.elf:     file format elf32-tradlittlemips
obj/select_sort/main.elf


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
bfc00010:	27bd41fc 	addiu	sp,sp,16892
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279ca160 	addiu	gp,gp,-24224
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
bfc00380:	0ff003ce 	jal	bfc00f38 <exception>
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
bfc003a4:	0ff0033a 	jal	bfc00ce8 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff0038d 	jal	bfc00e34 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	3c068000 	lui	a2,0x8000
bfc003b8:	24c40220 	addiu	a0,a2,544
bfc003bc:	240503e8 	li	a1,1000
bfc003c0:	0ff00184 	jal	bfc00610 <select_sort>
bfc003c4:	00408021 	move	s0,v0
bfc003c8:	0ff0038d 	jal	bfc00e34 <get_count>
bfc003cc:	00408821 	move	s1,v0
bfc003d0:	3c038000 	lui	v1,0x8000
bfc003d4:	8c6511c0 	lw	a1,4544(v1)
bfc003d8:	8e240000 	lw	a0,0(s1)
bfc003dc:	00508023 	subu	s0,v0,s0
bfc003e0:	3c028000 	lui	v0,0x8000
bfc003e4:	24472160 	addiu	a3,v0,8544
bfc003e8:	14850071 	bne	a0,a1,bfc005b0 <shell+0x220>
bfc003ec:	246611c0 	addiu	a2,v1,4544
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
bfc0054c:	0ff0033a 	jal	bfc00ce8 <puts>
bfc00550:	2544004c 	addiu	a0,t2,76
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
bfc0059c:	0bf00274 	j	bfc009d0 <printf>
bfc005a0:	27bd0020 	addiu	sp,sp,32
	...
bfc005b0:	3c198000 	lui	t9,0x8000
bfc005b4:	0ff0033a 	jal	bfc00ce8 <puts>
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
bfc00604:	0bf00274 	j	bfc009d0 <printf>
bfc00608:	27bd0020 	addiu	sp,sp,32
bfc0060c:	00000000 	nop

bfc00610 <select_sort>:
select_sort():
bfc00610:	00a05021 	move	t2,a1
bfc00614:	04a000e8 	bltz	a1,bfc009b8 <select_sort+0x3a8>
bfc00618:	00804021 	move	t0,a0
bfc0061c:	24a70001 	addiu	a3,a1,1
bfc00620:	00074880 	sll	t1,a3,0x2
bfc00624:	2526fffc 	addiu	a2,t1,-4
bfc00628:	8c840000 	lw	a0,0(a0)
bfc0062c:	3c058000 	lui	a1,0x8000
bfc00630:	00061882 	srl	v1,a2,0x2
bfc00634:	24070004 	li	a3,4
bfc00638:	aca42170 	sw	a0,8560(a1)
bfc0063c:	30630007 	andi	v1,v1,0x7
bfc00640:	10e9005a 	beq	a3,t1,bfc007ac <select_sort+0x19c>
bfc00644:	24ac2170 	addiu	t4,a1,8560
bfc00648:	1060002f 	beqz	v1,bfc00708 <select_sort+0xf8>
bfc0064c:	24050001 	li	a1,1
bfc00650:	10650027 	beq	v1,a1,bfc006f0 <select_sort+0xe0>
bfc00654:	240d0002 	li	t5,2
bfc00658:	106d0020 	beq	v1,t5,bfc006dc <select_sort+0xcc>
bfc0065c:	240f0003 	li	t7,3
bfc00660:	106f001a 	beq	v1,t7,bfc006cc <select_sort+0xbc>
bfc00664:	01077021 	addu	t6,t0,a3
bfc00668:	10670012 	beq	v1,a3,bfc006b4 <select_sort+0xa4>
bfc0066c:	24060005 	li	a2,5
bfc00670:	1066000b 	beq	v1,a2,bfc006a0 <select_sort+0x90>
bfc00674:	240b0006 	li	t3,6
bfc00678:	106b0005 	beq	v1,t3,bfc00690 <select_sort+0x80>
bfc0067c:	01071021 	addu	v0,t0,a3
bfc00680:	8d030004 	lw	v1,4(t0)
bfc00684:	24070008 	li	a3,8
bfc00688:	ad830004 	sw	v1,4(t4)
bfc0068c:	01071021 	addu	v0,t0,a3
bfc00690:	8c590000 	lw	t9,0(v0)
bfc00694:	01877021 	addu	t6,t4,a3
bfc00698:	add90000 	sw	t9,0(t6)
bfc0069c:	24e70004 	addiu	a3,a3,4
bfc006a0:	01072821 	addu	a1,t0,a3
bfc006a4:	8ca40000 	lw	a0,0(a1)
bfc006a8:	0187c021 	addu	t8,t4,a3
bfc006ac:	af040000 	sw	a0,0(t8)
bfc006b0:	24e70004 	addiu	a3,a3,4
bfc006b4:	01073021 	addu	a2,t0,a3
bfc006b8:	8ccf0000 	lw	t7,0(a2)
bfc006bc:	01876821 	addu	t5,t4,a3
bfc006c0:	adaf0000 	sw	t7,0(t5)
bfc006c4:	24e70004 	addiu	a3,a3,4
bfc006c8:	01077021 	addu	t6,t0,a3
bfc006cc:	8dc30000 	lw	v1,0(t6)
bfc006d0:	01875821 	addu	t3,t4,a3
bfc006d4:	ad630000 	sw	v1,0(t3)
bfc006d8:	24e70004 	addiu	a3,a3,4
bfc006dc:	01071021 	addu	v0,t0,a3
bfc006e0:	8c580000 	lw	t8,0(v0)
bfc006e4:	0187c821 	addu	t9,t4,a3
bfc006e8:	af380000 	sw	t8,0(t9)
bfc006ec:	24e70004 	addiu	a3,a3,4
bfc006f0:	01076821 	addu	t5,t0,a3
bfc006f4:	8da40000 	lw	a0,0(t5)
bfc006f8:	01872821 	addu	a1,t4,a3
bfc006fc:	24e70004 	addiu	a3,a3,4
bfc00700:	10e9002a 	beq	a3,t1,bfc007ac <select_sort+0x19c>
bfc00704:	aca40000 	sw	a0,0(a1)
bfc00708:	01071021 	addu	v0,t0,a3
bfc0070c:	8c430000 	lw	v1,0(v0)
bfc00710:	24f80004 	addiu	t8,a3,4
bfc00714:	01872021 	addu	a0,t4,a3
bfc00718:	ac830000 	sw	v1,0(a0)
bfc0071c:	0118c821 	addu	t9,t0,t8
bfc00720:	8f2f0000 	lw	t7,0(t9)
bfc00724:	24eb0008 	addiu	t3,a3,8
bfc00728:	01987021 	addu	t6,t4,t8
bfc0072c:	adcf0000 	sw	t7,0(t6)
bfc00730:	010b6821 	addu	t5,t0,t3
bfc00734:	8da60000 	lw	a2,0(t5)
bfc00738:	24e3000c 	addiu	v1,a3,12
bfc0073c:	018b2821 	addu	a1,t4,t3
bfc00740:	aca60000 	sw	a2,0(a1)
bfc00744:	01031021 	addu	v0,t0,v1
bfc00748:	8c440000 	lw	a0,0(v0)
bfc0074c:	24ef0010 	addiu	t7,a3,16
bfc00750:	0183c821 	addu	t9,t4,v1
bfc00754:	af240000 	sw	a0,0(t9)
bfc00758:	010fc021 	addu	t8,t0,t7
bfc0075c:	8f0e0000 	lw	t6,0(t8)
bfc00760:	24e60014 	addiu	a2,a3,20
bfc00764:	018f6821 	addu	t5,t4,t7
bfc00768:	adae0000 	sw	t6,0(t5)
bfc0076c:	01065821 	addu	t3,t0,a2
bfc00770:	8d650000 	lw	a1,0(t3)
bfc00774:	24e40018 	addiu	a0,a3,24
bfc00778:	01861821 	addu	v1,t4,a2
bfc0077c:	ac650000 	sw	a1,0(v1)
bfc00780:	01041021 	addu	v0,t0,a0
bfc00784:	8c590000 	lw	t9,0(v0)
bfc00788:	24ee001c 	addiu	t6,a3,28
bfc0078c:	0184c021 	addu	t8,t4,a0
bfc00790:	af190000 	sw	t9,0(t8)
bfc00794:	010e7821 	addu	t7,t0,t6
bfc00798:	8ded0000 	lw	t5,0(t7)
bfc0079c:	018e5821 	addu	t3,t4,t6
bfc007a0:	24e70020 	addiu	a3,a3,32
bfc007a4:	14e9ffd8 	bne	a3,t1,bfc00708 <select_sort+0xf8>
bfc007a8:	ad6d0000 	sw	t5,0(t3)
bfc007ac:	254fffff 	addiu	t7,t2,-1
bfc007b0:	19e00072 	blez	t7,bfc0097c <select_sort+0x36c>
bfc007b4:	01806821 	move	t5,t4
bfc007b8:	00002021 	move	a0,zero
bfc007bc:	248b0001 	addiu	t3,a0,1
bfc007c0:	016a402a 	slt	t0,t3,t2
bfc007c4:	11000078 	beqz	t0,bfc009a8 <select_sort+0x398>
bfc007c8:	000b3027 	nor	a2,zero,t3
bfc007cc:	000b3880 	sll	a3,t3,0x2
bfc007d0:	01874021 	addu	t0,t4,a3
bfc007d4:	8dae0000 	lw	t6,0(t5)
bfc007d8:	8d070000 	lw	a3,0(t0)
bfc007dc:	00ca4821 	addu	t1,a2,t2
bfc007e0:	00ee282a 	slt	a1,a3,t6
bfc007e4:	00801821 	move	v1,a0
bfc007e8:	10a0006d 	beqz	a1,bfc009a0 <select_sort+0x390>
bfc007ec:	31260003 	andi	a2,t1,0x3
bfc007f0:	00e04821 	move	t1,a3
bfc007f4:	10a00002 	beqz	a1,bfc00800 <select_sort+0x1f0>
bfc007f8:	25650001 	addiu	a1,t3,1
bfc007fc:	01601821 	move	v1,t3
bfc00800:	00aac82a 	slt	t9,a1,t2
bfc00804:	25070004 	addiu	a3,t0,4
bfc00808:	13200053 	beqz	t9,bfc00958 <select_sort+0x348>
bfc0080c:	01202021 	move	a0,t1
bfc00810:	10c0002a 	beqz	a2,bfc008bc <select_sort+0x2ac>
bfc00814:	24020001 	li	v0,1
bfc00818:	10c2001b 	beq	a2,v0,bfc00888 <select_sort+0x278>
bfc0081c:	24180002 	li	t8,2
bfc00820:	10d8000d 	beq	a2,t8,bfc00858 <select_sort+0x248>
bfc00824:	00000000 	nop
bfc00828:	8d020004 	lw	v0,4(t0)
bfc0082c:	00000000 	nop
bfc00830:	0049202a 	slt	a0,v0,t1
bfc00834:	14800002 	bnez	a0,bfc00840 <select_sort+0x230>
bfc00838:	00000000 	nop
bfc0083c:	01201021 	move	v0,t1
bfc00840:	10800002 	beqz	a0,bfc0084c <select_sort+0x23c>
bfc00844:	00000000 	nop
bfc00848:	00a01821 	move	v1,a1
bfc0084c:	24a50001 	addiu	a1,a1,1
bfc00850:	24e70004 	addiu	a3,a3,4
bfc00854:	00402021 	move	a0,v0
bfc00858:	8ce20000 	lw	v0,0(a3)
bfc0085c:	00000000 	nop
bfc00860:	0044302a 	slt	a2,v0,a0
bfc00864:	14c00002 	bnez	a2,bfc00870 <select_sort+0x260>
bfc00868:	00000000 	nop
bfc0086c:	00801021 	move	v0,a0
bfc00870:	10c00002 	beqz	a2,bfc0087c <select_sort+0x26c>
bfc00874:	00000000 	nop
bfc00878:	00a01821 	move	v1,a1
bfc0087c:	24a50001 	addiu	a1,a1,1
bfc00880:	24e70004 	addiu	a3,a3,4
bfc00884:	00402021 	move	a0,v0
bfc00888:	8ce20000 	lw	v0,0(a3)
bfc0088c:	00000000 	nop
bfc00890:	0044302a 	slt	a2,v0,a0
bfc00894:	10c00002 	beqz	a2,bfc008a0 <select_sort+0x290>
bfc00898:	00804821 	move	t1,a0
bfc0089c:	00404821 	move	t1,v0
bfc008a0:	10c00002 	beqz	a2,bfc008ac <select_sort+0x29c>
bfc008a4:	00000000 	nop
bfc008a8:	00a01821 	move	v1,a1
bfc008ac:	24a50001 	addiu	a1,a1,1
bfc008b0:	00aa202a 	slt	a0,a1,t2
bfc008b4:	10800028 	beqz	a0,bfc00958 <select_sort+0x348>
bfc008b8:	24e70004 	addiu	a3,a3,4
bfc008bc:	8ce20000 	lw	v0,0(a3)
bfc008c0:	00000000 	nop
bfc008c4:	0049202a 	slt	a0,v0,t1
bfc008c8:	14800002 	bnez	a0,bfc008d4 <select_sort+0x2c4>
bfc008cc:	00000000 	nop
bfc008d0:	01201021 	move	v0,t1
bfc008d4:	10800002 	beqz	a0,bfc008e0 <select_sort+0x2d0>
bfc008d8:	00000000 	nop
bfc008dc:	00a01821 	move	v1,a1
bfc008e0:	8ce40004 	lw	a0,4(a3)
bfc008e4:	24a60001 	addiu	a2,a1,1
bfc008e8:	0082282a 	slt	a1,a0,v0
bfc008ec:	10a00002 	beqz	a1,bfc008f8 <select_sort+0x2e8>
bfc008f0:	24e70004 	addiu	a3,a3,4
bfc008f4:	00801021 	move	v0,a0
bfc008f8:	10a00002 	beqz	a1,bfc00904 <select_sort+0x2f4>
bfc008fc:	00000000 	nop
bfc00900:	00c01821 	move	v1,a2
bfc00904:	8ce40004 	lw	a0,4(a3)
bfc00908:	00000000 	nop
bfc0090c:	0082282a 	slt	a1,a0,v0
bfc00910:	10a00002 	beqz	a1,bfc0091c <select_sort+0x30c>
bfc00914:	24c80001 	addiu	t0,a2,1
bfc00918:	00801021 	move	v0,a0
bfc0091c:	10a00002 	beqz	a1,bfc00928 <select_sort+0x318>
bfc00920:	00000000 	nop
bfc00924:	01001821 	move	v1,t0
bfc00928:	8ce40008 	lw	a0,8(a3)
bfc0092c:	00000000 	nop
bfc00930:	0082282a 	slt	a1,a0,v0
bfc00934:	10a00016 	beqz	a1,bfc00990 <select_sort+0x380>
bfc00938:	24c80002 	addiu	t0,a2,2
bfc0093c:	00804821 	move	t1,a0
bfc00940:	10a00002 	beqz	a1,bfc0094c <select_sort+0x33c>
bfc00944:	24c50003 	addiu	a1,a2,3
bfc00948:	01001821 	move	v1,t0
bfc0094c:	00aa402a 	slt	t0,a1,t2
bfc00950:	1500ffda 	bnez	t0,bfc008bc <select_sort+0x2ac>
bfc00954:	24e7000c 	addiu	a3,a3,12
bfc00958:	01c02821 	move	a1,t6
bfc0095c:	0003c080 	sll	t8,v1,0x2
bfc00960:	01602021 	move	a0,t3
bfc00964:	030c7021 	addu	t6,t8,t4
bfc00968:	016f582a 	slt	t3,t3,t7
bfc0096c:	ada90000 	sw	t1,0(t5)
bfc00970:	adc50000 	sw	a1,0(t6)
bfc00974:	1560ff91 	bnez	t3,bfc007bc <select_sort+0x1ac>
bfc00978:	25ad0004 	addiu	t5,t5,4
bfc0097c:	03e00008 	jr	ra
bfc00980:	01801021 	move	v0,t4
	...
bfc00990:	0bf00250 	j	bfc00940 <select_sort+0x330>
bfc00994:	00404821 	move	t1,v0
	...
bfc009a0:	0bf001fd 	j	bfc007f4 <select_sort+0x1e4>
bfc009a4:	01c04821 	move	t1,t6
bfc009a8:	8da50000 	lw	a1,0(t5)
bfc009ac:	00801821 	move	v1,a0
bfc009b0:	0bf00257 	j	bfc0095c <select_sort+0x34c>
bfc009b4:	00a04821 	move	t1,a1
bfc009b8:	3c028000 	lui	v0,0x8000
bfc009bc:	0bf001eb 	j	bfc007ac <select_sort+0x19c>
bfc009c0:	244c2170 	addiu	t4,v0,8560
	...

bfc009d0 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc009d0:	27bdffc8 	addiu	sp,sp,-56
bfc009d4:	afb30024 	sw	s3,36(sp)
bfc009d8:	afbf0034 	sw	ra,52(sp)
bfc009dc:	afb60030 	sw	s6,48(sp)
bfc009e0:	afb5002c 	sw	s5,44(sp)
bfc009e4:	afb40028 	sw	s4,40(sp)
bfc009e8:	afb20020 	sw	s2,32(sp)
bfc009ec:	afb1001c 	sw	s1,28(sp)
bfc009f0:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc009f4:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc009f8:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc009fc:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00a00:	afa5003c 	sw	a1,60(sp)
bfc00a04:	afa60040 	sw	a2,64(sp)
bfc00a08:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00a0c:	12000013 	beqz	s0,bfc00a5c <printf+0x8c>
bfc00a10:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00a14:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00a18:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00a1c:	24560060 	addiu	s6,v0,96
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00a20:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00a24:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00a28:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00a2c:	12140016 	beq	s0,s4,bfc00a88 <printf+0xb8>
bfc00a30:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00a34:	1215002f 	beq	s0,s5,bfc00af4 <printf+0x124>
bfc00a38:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc00a3c:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00a40:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00a44:	26310001 	addiu	s1,s1,1
bfc00a48:	02711021 	addu	v0,s3,s1
bfc00a4c:	80500000 	lb	s0,0(v0)
bfc00a50:	00000000 	nop
bfc00a54:	1600fff5 	bnez	s0,bfc00a2c <printf+0x5c>
bfc00a58:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc00a5c:	8fbf0034 	lw	ra,52(sp)
bfc00a60:	00001021 	move	v0,zero
bfc00a64:	8fb60030 	lw	s6,48(sp)
bfc00a68:	8fb5002c 	lw	s5,44(sp)
bfc00a6c:	8fb40028 	lw	s4,40(sp)
bfc00a70:	8fb30024 	lw	s3,36(sp)
bfc00a74:	8fb20020 	lw	s2,32(sp)
bfc00a78:	8fb1001c 	lw	s1,28(sp)
bfc00a7c:	8fb00018 	lw	s0,24(sp)
bfc00a80:	03e00008 	jr	ra
bfc00a84:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00a88:	80440001 	lb	a0,1(v0)
bfc00a8c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00a90:	2482ffdb 	addiu	v0,a0,-37
bfc00a94:	304200ff 	andi	v0,v0,0xff
bfc00a98:	2c430054 	sltiu	v1,v0,84
bfc00a9c:	14600005 	bnez	v1,bfc00ab4 <printf+0xe4>
bfc00aa0:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc00aa4:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00aa8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00aac:	0bf00292 	j	bfc00a48 <printf+0x78>
bfc00ab0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00ab4:	02c21021 	addu	v0,s6,v0
bfc00ab8:	8c430000 	lw	v1,0(v0)
bfc00abc:	00000000 	nop
bfc00ac0:	00600008 	jr	v1
bfc00ac4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00ac8:	26310001 	addiu	s1,s1,1
bfc00acc:	02711021 	addu	v0,s3,s1
bfc00ad0:	80440001 	lb	a0,1(v0)
bfc00ad4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ad8:	2482ffcf 	addiu	v0,a0,-49
bfc00adc:	304200ff 	andi	v0,v0,0xff
bfc00ae0:	2c420009 	sltiu	v0,v0,9
bfc00ae4:	1440003f 	bnez	v0,bfc00be4 <printf+0x214>
bfc00ae8:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00aec:	0bf002a5 	j	bfc00a94 <printf+0xc4>
bfc00af0:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00af4:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00af8:	2404000d 	li	a0,13
bfc00afc:	0bf0028f 	j	bfc00a3c <printf+0x6c>
bfc00b00:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00b04:	8e440000 	lw	a0,0(s2)
bfc00b08:	2406000a 	li	a2,10
bfc00b0c:	0ff00348 	jal	bfc00d20 <printbase>
bfc00b10:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00b14:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00b18:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00b1c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00b20:	8e440000 	lw	a0,0(s2)
bfc00b24:	0ff00318 	jal	bfc00c60 <putstring>
bfc00b28:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc00b2c:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00b30:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00b34:	8e440000 	lw	a0,0(s2)
bfc00b38:	24060010 	li	a2,16
bfc00b3c:	0ff00348 	jal	bfc00d20 <printbase>
bfc00b40:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00b44:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00b48:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00b4c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc00b50:	8e440000 	lw	a0,0(s2)
bfc00b54:	24060008 	li	a2,8
bfc00b58:	0ff00348 	jal	bfc00d20 <printbase>
bfc00b5c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc00b60:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc00b64:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00b68:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc00b6c:	8e440000 	lw	a0,0(s2)
bfc00b70:	2406000a 	li	a2,10
bfc00b74:	0ff00348 	jal	bfc00d20 <printbase>
bfc00b78:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc00b7c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc00b80:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00b84:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc00b88:	8e440000 	lw	a0,0(s2)
bfc00b8c:	2406000a 	li	a2,10
bfc00b90:	0ff00348 	jal	bfc00d20 <printbase>
bfc00b94:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc00b98:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc00b9c:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00ba0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc00ba4:	8e440000 	lw	a0,0(s2)
bfc00ba8:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00bac:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00bb0:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00bb4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00bb8:	8e440000 	lw	a0,0(s2)
bfc00bbc:	24060002 	li	a2,2
bfc00bc0:	0ff00348 	jal	bfc00d20 <printbase>
bfc00bc4:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00bc8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc00bcc:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00bd0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00bd4:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00bd8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc00bdc:	0bf00291 	j	bfc00a44 <printf+0x74>
bfc00be0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00be4:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00be8:	000510c0 	sll	v0,a1,0x3
bfc00bec:	00051840 	sll	v1,a1,0x1
bfc00bf0:	00621821 	addu	v1,v1,v0
bfc00bf4:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00bf8:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00bfc:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00c00:	2482ffcf 	addiu	v0,a0,-49
bfc00c04:	304200ff 	andi	v0,v0,0xff
bfc00c08:	2c420009 	sltiu	v0,v0,9
bfc00c0c:	26310001 	addiu	s1,s1,1
bfc00c10:	1040ff9f 	beqz	v0,bfc00a90 <printf+0xc0>
bfc00c14:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00c18:	0bf002fb 	j	bfc00bec <printf+0x21c>
bfc00c1c:	000510c0 	sll	v0,a1,0x3

bfc00c20 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00c20:	3c018000 	lui	at,0x8000
bfc00c24:	03e00008 	jr	ra
bfc00c28:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc00c2c:	03e00008 	jr	ra
bfc00c30:	00000000 	nop

bfc00c34 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00c34:	27bdffe8 	addiu	sp,sp,-24
bfc00c38:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc00c3c:	0ff00308 	jal	bfc00c20 <tgt_putchar>
bfc00c40:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00c44:	8fbf0014 	lw	ra,20(sp)
bfc00c48:	00001021 	move	v0,zero
bfc00c4c:	03e00008 	jr	ra
bfc00c50:	27bd0018 	addiu	sp,sp,24
	...

bfc00c60 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc00c60:	27bdffe0 	addiu	sp,sp,-32
bfc00c64:	afb10014 	sw	s1,20(sp)
bfc00c68:	afbf001c 	sw	ra,28(sp)
bfc00c6c:	afb20018 	sw	s2,24(sp)
bfc00c70:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00c74:	80900000 	lb	s0,0(a0)
bfc00c78:	00000000 	nop
bfc00c7c:	12000013 	beqz	s0,bfc00ccc <putstring+0x6c>
bfc00c80:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00c84:	0bf00329 	j	bfc00ca4 <putstring+0x44>
bfc00c88:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00c8c:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00c90:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00c94:	82300000 	lb	s0,0(s1)
bfc00c98:	00000000 	nop
bfc00c9c:	1200000b 	beqz	s0,bfc00ccc <putstring+0x6c>
bfc00ca0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00ca4:	1612fff9 	bne	s0,s2,bfc00c8c <putstring+0x2c>
bfc00ca8:	26310001 	addiu	s1,s1,1
bfc00cac:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00cb0:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00cb4:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00cb8:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00cbc:	82300000 	lb	s0,0(s1)
bfc00cc0:	00000000 	nop
bfc00cc4:	1600fff7 	bnez	s0,bfc00ca4 <putstring+0x44>
bfc00cc8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc00ccc:	8fbf001c 	lw	ra,28(sp)
bfc00cd0:	00001021 	move	v0,zero
bfc00cd4:	8fb20018 	lw	s2,24(sp)
bfc00cd8:	8fb10014 	lw	s1,20(sp)
bfc00cdc:	8fb00010 	lw	s0,16(sp)
bfc00ce0:	03e00008 	jr	ra
bfc00ce4:	27bd0020 	addiu	sp,sp,32

bfc00ce8 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc00ce8:	27bdffe8 	addiu	sp,sp,-24
bfc00cec:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc00cf0:	0ff00318 	jal	bfc00c60 <putstring>
bfc00cf4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc00cf8:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00cfc:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc00d00:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00d04:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc00d08:	8fbf0014 	lw	ra,20(sp)
bfc00d0c:	00001021 	move	v0,zero
bfc00d10:	03e00008 	jr	ra
bfc00d14:	27bd0018 	addiu	sp,sp,24
	...

bfc00d20 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00d20:	27bdff98 	addiu	sp,sp,-104
bfc00d24:	afb30060 	sw	s3,96(sp)
bfc00d28:	afb2005c 	sw	s2,92(sp)
bfc00d2c:	afbf0064 	sw	ra,100(sp)
bfc00d30:	afb10058 	sw	s1,88(sp)
bfc00d34:	afb00054 	sw	s0,84(sp)
bfc00d38:	00801821 	move	v1,a0
bfc00d3c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc00d40:	10e00003 	beqz	a3,bfc00d50 <printbase+0x30>
bfc00d44:	00c09021 	move	s2,a2
bfc00d48:	0480002f 	bltz	a0,bfc00e08 <printbase+0xe8>
bfc00d4c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc00d50:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00d54:	1200000c 	beqz	s0,bfc00d88 <printbase+0x68>
bfc00d58:	00008821 	move	s1,zero
bfc00d5c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00d60:	16400002 	bnez	s2,bfc00d6c <printbase+0x4c>
bfc00d64:	0212001b 	divu	zero,s0,s2
bfc00d68:	0007000d 	break	0x7
bfc00d6c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00d70:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00d74:	00001010 	mfhi	v0
bfc00d78:	a0820000 	sb	v0,0(a0)
bfc00d7c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00d80:	1460fff7 	bnez	v1,bfc00d60 <printbase+0x40>
bfc00d84:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00d88:	0233102a 	slt	v0,s1,s3
bfc00d8c:	10400002 	beqz	v0,bfc00d98 <printbase+0x78>
bfc00d90:	02201821 	move	v1,s1
bfc00d94:	02601821 	move	v1,s3
bfc00d98:	1060000c 	beqz	v1,bfc00dcc <printbase+0xac>
bfc00d9c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00da0:	27a20010 	addiu	v0,sp,16
bfc00da4:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00da8:	26020001 	addiu	v0,s0,1
bfc00dac:	0222102a 	slt	v0,s1,v0
bfc00db0:	1040000e 	beqz	v0,bfc00dec <printbase+0xcc>
bfc00db4:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00db8:	02009821 	move	s3,s0
bfc00dbc:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00dc0:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00dc4:	1660fff8 	bnez	s3,bfc00da8 <printbase+0x88>
bfc00dc8:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc00dcc:	8fbf0064 	lw	ra,100(sp)
bfc00dd0:	00001021 	move	v0,zero
bfc00dd4:	8fb30060 	lw	s3,96(sp)
bfc00dd8:	8fb2005c 	lw	s2,92(sp)
bfc00ddc:	8fb10058 	lw	s1,88(sp)
bfc00de0:	8fb00054 	lw	s0,84(sp)
bfc00de4:	03e00008 	jr	ra
bfc00de8:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00dec:	82440000 	lb	a0,0(s2)
bfc00df0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00df4:	2882000a 	slti	v0,a0,10
bfc00df8:	14400007 	bnez	v0,bfc00e18 <printbase+0xf8>
bfc00dfc:	02009821 	move	s3,s0
bfc00e00:	0bf0036f 	j	bfc00dbc <printbase+0x9c>
bfc00e04:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc00e08:	0ff0030d 	jal	bfc00c34 <putchar>
bfc00e0c:	00038023 	negu	s0,v1
bfc00e10:	0bf00355 	j	bfc00d54 <printbase+0x34>
bfc00e14:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00e18:	0bf0036e 	j	bfc00db8 <printbase+0x98>
bfc00e1c:	24840030 	addiu	a0,a0,48

bfc00e20 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc00e20:	3c01bfd0 	lui	at,0xbfd0
bfc00e24:	3421e000 	ori	at,at,0xe000
bfc00e28:	8c220000 	lw	v0,0(at)
bfc00e2c:	03e00008 	jr	ra
bfc00e30:	00000000 	nop

bfc00e34 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc00e34:	3c01bfd0 	lui	at,0xbfd0
bfc00e38:	3421e000 	ori	at,at,0xe000
bfc00e3c:	8c220000 	lw	v0,0(at)
bfc00e40:	03e00008 	jr	ra
bfc00e44:	00000000 	nop

bfc00e48 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00e48:	3c01bfd0 	lui	at,0xbfd0
bfc00e4c:	3421e000 	ori	at,at,0xe000
bfc00e50:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc00e54:	03e00008 	jr	ra
bfc00e58:	00021040 	sll	v0,v0,0x1

bfc00e5c <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc00e5c:	3c01bfd0 	lui	at,0xbfd0
bfc00e60:	3421e000 	ori	at,at,0xe000
bfc00e64:	8c220000 	lw	v0,0(at)
bfc00e68:	03e00008 	jr	ra
bfc00e6c:	00000000 	nop

bfc00e70 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc00e70:	27bdffe8 	addiu	sp,sp,-24
bfc00e74:	afbf0014 	sw	ra,20(sp)
bfc00e78:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00e7c:	3c01bfd0 	lui	at,0xbfd0
bfc00e80:	3421e000 	ori	at,at,0xe000
bfc00e84:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00e88:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00e8c:	14400002 	bnez	v0,bfc00e98 <clock_gettime+0x28>
bfc00e90:	0062001b 	divu	zero,v1,v0
bfc00e94:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00e98:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00e9c:	3c073b9a 	lui	a3,0x3b9a
bfc00ea0:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00ea4:	3c048000 	lui	a0,0x8000
bfc00ea8:	248401b0 	addiu	a0,a0,432
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00eac:	00003012 	mflo	a2
bfc00eb0:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00eb4:	14400002 	bnez	v0,bfc00ec0 <clock_gettime+0x50>
bfc00eb8:	0062001b 	divu	zero,v1,v0
bfc00ebc:	0007000d 	break	0x7
bfc00ec0:	00002810 	mfhi	a1
bfc00ec4:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00ec8:	14400002 	bnez	v0,bfc00ed4 <clock_gettime+0x64>
bfc00ecc:	00c2001b 	divu	zero,a2,v0
bfc00ed0:	0007000d 	break	0x7
bfc00ed4:	00005010 	mfhi	t2
bfc00ed8:	ad2a0008 	sw	t2,8(t1)
bfc00edc:	00004012 	mflo	t0
bfc00ee0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00ee4:	14e00002 	bnez	a3,bfc00ef0 <clock_gettime+0x80>
bfc00ee8:	00c7001b 	divu	zero,a2,a3
bfc00eec:	0007000d 	break	0x7
bfc00ef0:	00003012 	mflo	a2
bfc00ef4:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc00ef8:	14400002 	bnez	v0,bfc00f04 <clock_gettime+0x94>
bfc00efc:	0102001b 	divu	zero,t0,v0
bfc00f00:	0007000d 	break	0x7
bfc00f04:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00f08:	0ff00274 	jal	bfc009d0 <printf>
bfc00f0c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc00f10:	8fbf0014 	lw	ra,20(sp)
bfc00f14:	00001021 	move	v0,zero
bfc00f18:	03e00008 	jr	ra
bfc00f1c:	27bd0018 	addiu	sp,sp,24

bfc00f20 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00f20:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc00f24:	03e00008 	jr	ra
bfc00f28:	00000000 	nop

bfc00f2c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc00f2c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc00f30:	03e00008 	jr	ra
bfc00f34:	00000000 	nop

bfc00f38 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00f38:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc00f3c:	27bdffe8 	addiu	sp,sp,-24
bfc00f40:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00f44:	0ff00274 	jal	bfc009d0 <printf>
bfc00f48:	248401c4 	addiu	a0,a0,452
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00f4c:	3c048000 	lui	a0,0x8000
bfc00f50:	248401e0 	addiu	a0,a0,480
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00f54:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00f58:	0ff00274 	jal	bfc009d0 <printf>
bfc00f5c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00f60:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00f64:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00f68:	248401f0 	addiu	a0,a0,496
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00f6c:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc00f70:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00f74:	0bf00274 	j	bfc009d0 <printf>
bfc00f78:	00000000 	nop
bfc00f7c:	00000000 	nop
