
obj/stream_copy/main.elf:     file format elf32-tradlittlemips
obj/stream_copy/main.elf


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
bfc00018:	279c91c0 	addiu	gp,gp,-28224
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
bfc00380:	0ff00322 	jal	bfc00c88 <exception>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:69
bfc00384:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:70
bfc00388:	0bf00009 	j	bfc00024 <exit>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:71
bfc0038c:	00000000 	nop

bfc00390 <shell>:
shell():
bfc00390:	27bdffe0 	addiu	sp,sp,-32
bfc00394:	3c048000 	lui	a0,0x8000
bfc00398:	24840000 	addiu	a0,a0,0
bfc0039c:	afb20018 	sw	s2,24(sp)
bfc003a0:	afb10014 	sw	s1,20(sp)
bfc003a4:	3c128000 	lui	s2,0x8000
bfc003a8:	3c118000 	lui	s1,0x8000
bfc003ac:	afbf001c 	sw	ra,28(sp)
bfc003b0:	0ff0028e 	jal	bfc00a38 <puts>
bfc003b4:	afb00010 	sw	s0,16(sp)
bfc003b8:	0ff002e1 	jal	bfc00b84 <get_count>
bfc003bc:	00000000 	nop
bfc003c0:	26440220 	addiu	a0,s2,544
bfc003c4:	262511d0 	addiu	a1,s1,4560
bfc003c8:	240603e8 	li	a2,1000
bfc003cc:	0ff0016c 	jal	bfc005b0 <stream_copy>
bfc003d0:	00408021 	move	s0,v0
bfc003d4:	0ff002e1 	jal	bfc00b84 <get_count>
bfc003d8:	263111d0 	addiu	s1,s1,4560
bfc003dc:	00508023 	subu	s0,v0,s0
bfc003e0:	26520220 	addiu	s2,s2,544
bfc003e4:	00003821 	move	a3,zero
bfc003e8:	00003021 	move	a2,zero
bfc003ec:	24080fa0 	li	t0,4000
bfc003f0:	02261821 	addu	v1,s1,a2
bfc003f4:	02464821 	addu	t1,s2,a2
bfc003f8:	8c650000 	lw	a1,0(v1)
bfc003fc:	8d220000 	lw	v0,0(t1)
bfc00400:	00000000 	nop
bfc00404:	10a20002 	beq	a1,v0,bfc00410 <shell+0x80>
bfc00408:	00000000 	nop
bfc0040c:	24070001 	li	a3,1
bfc00410:	24c60004 	addiu	a2,a2,4
bfc00414:	02266821 	addu	t5,s1,a2
bfc00418:	02466021 	addu	t4,s2,a2
bfc0041c:	8dab0000 	lw	t3,0(t5)
bfc00420:	8d8a0000 	lw	t2,0(t4)
bfc00424:	00000000 	nop
bfc00428:	116a0002 	beq	t3,t2,bfc00434 <shell+0xa4>
bfc0042c:	24d80004 	addiu	t8,a2,4
bfc00430:	24070001 	li	a3,1
bfc00434:	02587021 	addu	t6,s2,t8
bfc00438:	02387821 	addu	t7,s1,t8
bfc0043c:	8ded0000 	lw	t5,0(t7)
bfc00440:	8dcc0000 	lw	t4,0(t6)
bfc00444:	00000000 	nop
bfc00448:	11ac0002 	beq	t5,t4,bfc00454 <shell+0xc4>
bfc0044c:	24c90008 	addiu	t1,a2,8
bfc00450:	24070001 	li	a3,1
bfc00454:	02492821 	addu	a1,s2,t1
bfc00458:	02291021 	addu	v0,s1,t1
bfc0045c:	8c440000 	lw	a0,0(v0)
bfc00460:	8cb90000 	lw	t9,0(a1)
bfc00464:	00000000 	nop
bfc00468:	10990002 	beq	a0,t9,bfc00474 <shell+0xe4>
bfc0046c:	24cc000c 	addiu	t4,a2,12
bfc00470:	24070001 	li	a3,1
bfc00474:	024c5021 	addu	t2,s2,t4
bfc00478:	022c5821 	addu	t3,s1,t4
bfc0047c:	8d630000 	lw	v1,0(t3)
bfc00480:	8d5f0000 	lw	ra,0(t2)
bfc00484:	00000000 	nop
bfc00488:	107f0002 	beq	v1,ra,bfc00494 <shell+0x104>
bfc0048c:	24d90010 	addiu	t9,a2,16
bfc00490:	24070001 	li	a3,1
bfc00494:	02597821 	addu	t7,s2,t9
bfc00498:	0239c021 	addu	t8,s1,t9
bfc0049c:	8f0e0000 	lw	t6,0(t8)
bfc004a0:	8ded0000 	lw	t5,0(t7)
bfc004a4:	00000000 	nop
bfc004a8:	11cd0002 	beq	t6,t5,bfc004b4 <shell+0x124>
bfc004ac:	24df0014 	addiu	ra,a2,20
bfc004b0:	24070001 	li	a3,1
bfc004b4:	025f2821 	addu	a1,s2,ra
bfc004b8:	023f4821 	addu	t1,s1,ra
bfc004bc:	8d240000 	lw	a0,0(t1)
bfc004c0:	8ca20000 	lw	v0,0(a1)
bfc004c4:	00000000 	nop
bfc004c8:	10820002 	beq	a0,v0,bfc004d4 <shell+0x144>
bfc004cc:	24cd0018 	addiu	t5,a2,24
bfc004d0:	24070001 	li	a3,1
bfc004d4:	024d5821 	addu	t3,s2,t5
bfc004d8:	022d6021 	addu	t4,s1,t5
bfc004dc:	8d8a0000 	lw	t2,0(t4)
bfc004e0:	8d630000 	lw	v1,0(t3)
bfc004e4:	00000000 	nop
bfc004e8:	11430002 	beq	t2,v1,bfc004f4 <shell+0x164>
bfc004ec:	00000000 	nop
bfc004f0:	24070001 	li	a3,1
bfc004f4:	24c6001c 	addiu	a2,a2,28
bfc004f8:	14c8ffbe 	bne	a2,t0,bfc003f4 <shell+0x64>
bfc004fc:	02261821 	addu	v1,s1,a2
bfc00500:	10e0001b 	beqz	a3,bfc00570 <shell+0x1e0>
bfc00504:	3c1f8000 	lui	ra,0x8000
bfc00508:	27e4002c 	addiu	a0,ra,44
bfc0050c:	0ff0028e 	jal	bfc00a38 <puts>
bfc00510:	24110002 	li	s1,2
bfc00514:	3c09bfd0 	lui	t1,0xbfd0
bfc00518:	3532f000 	ori	s2,t1,0xf000
bfc0051c:	3525f008 	ori	a1,t1,0xf008
bfc00520:	3524f004 	ori	a0,t1,0xf004
bfc00524:	24020001 	li	v0,1
bfc00528:	aca20000 	sw	v0,0(a1)
bfc0052c:	ac910000 	sw	s1,0(a0)
bfc00530:	ae400000 	sw	zero,0(s2)
bfc00534:	3c0abfd0 	lui	t2,0xbfd0
bfc00538:	3c0b8000 	lui	t3,0x8000
bfc0053c:	3543f010 	ori	v1,t2,0xf010
bfc00540:	02002821 	move	a1,s0
bfc00544:	ac700000 	sw	s0,0(v1)
bfc00548:	8fbf001c 	lw	ra,28(sp)
bfc0054c:	8fb20018 	lw	s2,24(sp)
bfc00550:	8fb10014 	lw	s1,20(sp)
bfc00554:	8fb00010 	lw	s0,16(sp)
bfc00558:	25640044 	addiu	a0,t3,68
bfc0055c:	0bf001c8 	j	bfc00720 <printf>
bfc00560:	27bd0020 	addiu	sp,sp,32
	...
bfc00570:	3c198000 	lui	t9,0x8000
bfc00574:	0ff0028e 	jal	bfc00a38 <puts>
bfc00578:	27240018 	addiu	a0,t9,24
bfc0057c:	3c18bfd0 	lui	t8,0xbfd0
bfc00580:	24070001 	li	a3,1
bfc00584:	3706f000 	ori	a2,t8,0xf000
bfc00588:	3708f008 	ori	t0,t8,0xf008
bfc0058c:	370ff004 	ori	t7,t8,0xf004
bfc00590:	340effff 	li	t6,0xffff
bfc00594:	ade70000 	sw	a3,0(t7)
bfc00598:	acce0000 	sw	t6,0(a2)
bfc0059c:	0bf0014d 	j	bfc00534 <shell+0x1a4>
bfc005a0:	ad070000 	sw	a3,0(t0)
	...

bfc005b0 <stream_copy>:
stream_copy():
bfc005b0:	18c00057 	blez	a2,bfc00710 <stream_copy+0x160>
bfc005b4:	00805021 	move	t2,a0
bfc005b8:	8c820000 	lw	v0,0(a0)
bfc005bc:	24090001 	li	t1,1
bfc005c0:	24c3ffff 	addiu	v1,a2,-1
bfc005c4:	0126202a 	slt	a0,t1,a2
bfc005c8:	aca20000 	sw	v0,0(a1)
bfc005cc:	30630007 	andi	v1,v1,0x7
bfc005d0:	25480004 	addiu	t0,t2,4
bfc005d4:	1080004e 	beqz	a0,bfc00710 <stream_copy+0x160>
bfc005d8:	24a70004 	addiu	a3,a1,4
bfc005dc:	10600032 	beqz	v1,bfc006a8 <stream_copy+0xf8>
bfc005e0:	00000000 	nop
bfc005e4:	10690029 	beq	v1,t1,bfc0068c <stream_copy+0xdc>
bfc005e8:	24040002 	li	a0,2
bfc005ec:	10640022 	beq	v1,a0,bfc00678 <stream_copy+0xc8>
bfc005f0:	24020003 	li	v0,3
bfc005f4:	1062001b 	beq	v1,v0,bfc00664 <stream_copy+0xb4>
bfc005f8:	240b0004 	li	t3,4
bfc005fc:	106b0014 	beq	v1,t3,bfc00650 <stream_copy+0xa0>
bfc00600:	240c0005 	li	t4,5
bfc00604:	106c000d 	beq	v1,t4,bfc0063c <stream_copy+0x8c>
bfc00608:	240d0006 	li	t5,6
bfc0060c:	106d0006 	beq	v1,t5,bfc00628 <stream_copy+0x78>
bfc00610:	00000000 	nop
bfc00614:	8d470004 	lw	a3,4(t2)
bfc00618:	25480008 	addiu	t0,t2,8
bfc0061c:	aca70004 	sw	a3,4(a1)
bfc00620:	24090002 	li	t1,2
bfc00624:	24a70008 	addiu	a3,a1,8
bfc00628:	8d030000 	lw	v1,0(t0)
bfc0062c:	25290001 	addiu	t1,t1,1
bfc00630:	ace30000 	sw	v1,0(a3)
bfc00634:	25080004 	addiu	t0,t0,4
bfc00638:	24e70004 	addiu	a3,a3,4
bfc0063c:	8d050000 	lw	a1,0(t0)
bfc00640:	25290001 	addiu	t1,t1,1
bfc00644:	ace50000 	sw	a1,0(a3)
bfc00648:	25080004 	addiu	t0,t0,4
bfc0064c:	24e70004 	addiu	a3,a3,4
bfc00650:	8d0a0000 	lw	t2,0(t0)
bfc00654:	25290001 	addiu	t1,t1,1
bfc00658:	acea0000 	sw	t2,0(a3)
bfc0065c:	25080004 	addiu	t0,t0,4
bfc00660:	24e70004 	addiu	a3,a3,4
bfc00664:	8d0e0000 	lw	t6,0(t0)
bfc00668:	25290001 	addiu	t1,t1,1
bfc0066c:	acee0000 	sw	t6,0(a3)
bfc00670:	25080004 	addiu	t0,t0,4
bfc00674:	24e70004 	addiu	a3,a3,4
bfc00678:	8d0f0000 	lw	t7,0(t0)
bfc0067c:	25290001 	addiu	t1,t1,1
bfc00680:	acef0000 	sw	t7,0(a3)
bfc00684:	25080004 	addiu	t0,t0,4
bfc00688:	24e70004 	addiu	a3,a3,4
bfc0068c:	8d190000 	lw	t9,0(t0)
bfc00690:	25290001 	addiu	t1,t1,1
bfc00694:	0126c02a 	slt	t8,t1,a2
bfc00698:	acf90000 	sw	t9,0(a3)
bfc0069c:	25080004 	addiu	t0,t0,4
bfc006a0:	1300001b 	beqz	t8,bfc00710 <stream_copy+0x160>
bfc006a4:	24e70004 	addiu	a3,a3,4
bfc006a8:	8d190000 	lw	t9,0(t0)
bfc006ac:	25290008 	addiu	t1,t1,8
bfc006b0:	acf90000 	sw	t9,0(a3)
bfc006b4:	8d180004 	lw	t8,4(t0)
bfc006b8:	0126282a 	slt	a1,t1,a2
bfc006bc:	acf80004 	sw	t8,4(a3)
bfc006c0:	8d0f0008 	lw	t7,8(t0)
bfc006c4:	00000000 	nop
bfc006c8:	acef0008 	sw	t7,8(a3)
bfc006cc:	8d0e000c 	lw	t6,12(t0)
bfc006d0:	00000000 	nop
bfc006d4:	acee000c 	sw	t6,12(a3)
bfc006d8:	8d0d0010 	lw	t5,16(t0)
bfc006dc:	00000000 	nop
bfc006e0:	aced0010 	sw	t5,16(a3)
bfc006e4:	8d0c0014 	lw	t4,20(t0)
bfc006e8:	00000000 	nop
bfc006ec:	acec0014 	sw	t4,20(a3)
bfc006f0:	8d0b0018 	lw	t3,24(t0)
bfc006f4:	00000000 	nop
bfc006f8:	aceb0018 	sw	t3,24(a3)
bfc006fc:	8d0a001c 	lw	t2,28(t0)
bfc00700:	25080020 	addiu	t0,t0,32
bfc00704:	acea001c 	sw	t2,28(a3)
bfc00708:	14a0ffe7 	bnez	a1,bfc006a8 <stream_copy+0xf8>
bfc0070c:	24e70020 	addiu	a3,a3,32
bfc00710:	03e00008 	jr	ra
bfc00714:	00000000 	nop
	...

bfc00720 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00720:	27bdffc8 	addiu	sp,sp,-56
bfc00724:	afb30024 	sw	s3,36(sp)
bfc00728:	afbf0034 	sw	ra,52(sp)
bfc0072c:	afb60030 	sw	s6,48(sp)
bfc00730:	afb5002c 	sw	s5,44(sp)
bfc00734:	afb40028 	sw	s4,40(sp)
bfc00738:	afb20020 	sw	s2,32(sp)
bfc0073c:	afb1001c 	sw	s1,28(sp)
bfc00740:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00744:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00748:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc0074c:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00750:	afa5003c 	sw	a1,60(sp)
bfc00754:	afa60040 	sw	a2,64(sp)
bfc00758:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc0075c:	12000013 	beqz	s0,bfc007ac <printf+0x8c>
bfc00760:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00764:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00768:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0076c:	24560060 	addiu	s6,v0,96
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00770:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00774:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00778:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc0077c:	12140016 	beq	s0,s4,bfc007d8 <printf+0xb8>
bfc00780:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00784:	1215002f 	beq	s0,s5,bfc00844 <printf+0x124>
bfc00788:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc0078c:	0ff00261 	jal	bfc00984 <putchar>
bfc00790:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00794:	26310001 	addiu	s1,s1,1
bfc00798:	02711021 	addu	v0,s3,s1
bfc0079c:	80500000 	lb	s0,0(v0)
bfc007a0:	00000000 	nop
bfc007a4:	1600fff5 	bnez	s0,bfc0077c <printf+0x5c>
bfc007a8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc007ac:	8fbf0034 	lw	ra,52(sp)
bfc007b0:	00001021 	move	v0,zero
bfc007b4:	8fb60030 	lw	s6,48(sp)
bfc007b8:	8fb5002c 	lw	s5,44(sp)
bfc007bc:	8fb40028 	lw	s4,40(sp)
bfc007c0:	8fb30024 	lw	s3,36(sp)
bfc007c4:	8fb20020 	lw	s2,32(sp)
bfc007c8:	8fb1001c 	lw	s1,28(sp)
bfc007cc:	8fb00018 	lw	s0,24(sp)
bfc007d0:	03e00008 	jr	ra
bfc007d4:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc007d8:	80440001 	lb	a0,1(v0)
bfc007dc:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc007e0:	2482ffdb 	addiu	v0,a0,-37
bfc007e4:	304200ff 	andi	v0,v0,0xff
bfc007e8:	2c430054 	sltiu	v1,v0,84
bfc007ec:	14600005 	bnez	v1,bfc00804 <printf+0xe4>
bfc007f0:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc007f4:	0ff00261 	jal	bfc00984 <putchar>
bfc007f8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc007fc:	0bf001e6 	j	bfc00798 <printf+0x78>
bfc00800:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00804:	02c21021 	addu	v0,s6,v0
bfc00808:	8c430000 	lw	v1,0(v0)
bfc0080c:	00000000 	nop
bfc00810:	00600008 	jr	v1
bfc00814:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00818:	26310001 	addiu	s1,s1,1
bfc0081c:	02711021 	addu	v0,s3,s1
bfc00820:	80440001 	lb	a0,1(v0)
bfc00824:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00828:	2482ffcf 	addiu	v0,a0,-49
bfc0082c:	304200ff 	andi	v0,v0,0xff
bfc00830:	2c420009 	sltiu	v0,v0,9
bfc00834:	1440003f 	bnez	v0,bfc00934 <printf+0x214>
bfc00838:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0083c:	0bf001f9 	j	bfc007e4 <printf+0xc4>
bfc00840:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00844:	0ff00261 	jal	bfc00984 <putchar>
bfc00848:	2404000d 	li	a0,13
bfc0084c:	0bf001e3 	j	bfc0078c <printf+0x6c>
bfc00850:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00854:	8e440000 	lw	a0,0(s2)
bfc00858:	2406000a 	li	a2,10
bfc0085c:	0ff0029c 	jal	bfc00a70 <printbase>
bfc00860:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00864:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00868:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc0086c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00870:	8e440000 	lw	a0,0(s2)
bfc00874:	0ff0026c 	jal	bfc009b0 <putstring>
bfc00878:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc0087c:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc00880:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00884:	8e440000 	lw	a0,0(s2)
bfc00888:	24060010 	li	a2,16
bfc0088c:	0ff0029c 	jal	bfc00a70 <printbase>
bfc00890:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00894:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00898:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc0089c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc008a0:	8e440000 	lw	a0,0(s2)
bfc008a4:	24060008 	li	a2,8
bfc008a8:	0ff0029c 	jal	bfc00a70 <printbase>
bfc008ac:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc008b0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc008b4:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc008b8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc008bc:	8e440000 	lw	a0,0(s2)
bfc008c0:	2406000a 	li	a2,10
bfc008c4:	0ff0029c 	jal	bfc00a70 <printbase>
bfc008c8:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc008cc:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc008d0:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc008d4:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc008d8:	8e440000 	lw	a0,0(s2)
bfc008dc:	2406000a 	li	a2,10
bfc008e0:	0ff0029c 	jal	bfc00a70 <printbase>
bfc008e4:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc008e8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc008ec:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc008f0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc008f4:	8e440000 	lw	a0,0(s2)
bfc008f8:	0ff00261 	jal	bfc00984 <putchar>
bfc008fc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00900:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc00904:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00908:	8e440000 	lw	a0,0(s2)
bfc0090c:	24060002 	li	a2,2
bfc00910:	0ff0029c 	jal	bfc00a70 <printbase>
bfc00914:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00918:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc0091c:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc00920:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00924:	0ff00261 	jal	bfc00984 <putchar>
bfc00928:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc0092c:	0bf001e5 	j	bfc00794 <printf+0x74>
bfc00930:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00934:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00938:	000510c0 	sll	v0,a1,0x3
bfc0093c:	00051840 	sll	v1,a1,0x1
bfc00940:	00621821 	addu	v1,v1,v0
bfc00944:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00948:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc0094c:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00950:	2482ffcf 	addiu	v0,a0,-49
bfc00954:	304200ff 	andi	v0,v0,0xff
bfc00958:	2c420009 	sltiu	v0,v0,9
bfc0095c:	26310001 	addiu	s1,s1,1
bfc00960:	1040ff9f 	beqz	v0,bfc007e0 <printf+0xc0>
bfc00964:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00968:	0bf0024f 	j	bfc0093c <printf+0x21c>
bfc0096c:	000510c0 	sll	v0,a1,0x3

bfc00970 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00970:	3c018000 	lui	at,0x8000
bfc00974:	03e00008 	jr	ra
bfc00978:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc0097c:	03e00008 	jr	ra
bfc00980:	00000000 	nop

bfc00984 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00984:	27bdffe8 	addiu	sp,sp,-24
bfc00988:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc0098c:	0ff0025c 	jal	bfc00970 <tgt_putchar>
bfc00990:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00994:	8fbf0014 	lw	ra,20(sp)
bfc00998:	00001021 	move	v0,zero
bfc0099c:	03e00008 	jr	ra
bfc009a0:	27bd0018 	addiu	sp,sp,24
	...

bfc009b0 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc009b0:	27bdffe0 	addiu	sp,sp,-32
bfc009b4:	afb10014 	sw	s1,20(sp)
bfc009b8:	afbf001c 	sw	ra,28(sp)
bfc009bc:	afb20018 	sw	s2,24(sp)
bfc009c0:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc009c4:	80900000 	lb	s0,0(a0)
bfc009c8:	00000000 	nop
bfc009cc:	12000013 	beqz	s0,bfc00a1c <putstring+0x6c>
bfc009d0:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc009d4:	0bf0027d 	j	bfc009f4 <putstring+0x44>
bfc009d8:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc009dc:	0ff00261 	jal	bfc00984 <putchar>
bfc009e0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc009e4:	82300000 	lb	s0,0(s1)
bfc009e8:	00000000 	nop
bfc009ec:	1200000b 	beqz	s0,bfc00a1c <putstring+0x6c>
bfc009f0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc009f4:	1612fff9 	bne	s0,s2,bfc009dc <putstring+0x2c>
bfc009f8:	26310001 	addiu	s1,s1,1
bfc009fc:	0ff00261 	jal	bfc00984 <putchar>
bfc00a00:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00a04:	0ff00261 	jal	bfc00984 <putchar>
bfc00a08:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00a0c:	82300000 	lb	s0,0(s1)
bfc00a10:	00000000 	nop
bfc00a14:	1600fff7 	bnez	s0,bfc009f4 <putstring+0x44>
bfc00a18:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc00a1c:	8fbf001c 	lw	ra,28(sp)
bfc00a20:	00001021 	move	v0,zero
bfc00a24:	8fb20018 	lw	s2,24(sp)
bfc00a28:	8fb10014 	lw	s1,20(sp)
bfc00a2c:	8fb00010 	lw	s0,16(sp)
bfc00a30:	03e00008 	jr	ra
bfc00a34:	27bd0020 	addiu	sp,sp,32

bfc00a38 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc00a38:	27bdffe8 	addiu	sp,sp,-24
bfc00a3c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc00a40:	0ff0026c 	jal	bfc009b0 <putstring>
bfc00a44:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc00a48:	0ff00261 	jal	bfc00984 <putchar>
bfc00a4c:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc00a50:	0ff00261 	jal	bfc00984 <putchar>
bfc00a54:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc00a58:	8fbf0014 	lw	ra,20(sp)
bfc00a5c:	00001021 	move	v0,zero
bfc00a60:	03e00008 	jr	ra
bfc00a64:	27bd0018 	addiu	sp,sp,24
	...

bfc00a70 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00a70:	27bdff98 	addiu	sp,sp,-104
bfc00a74:	afb30060 	sw	s3,96(sp)
bfc00a78:	afb2005c 	sw	s2,92(sp)
bfc00a7c:	afbf0064 	sw	ra,100(sp)
bfc00a80:	afb10058 	sw	s1,88(sp)
bfc00a84:	afb00054 	sw	s0,84(sp)
bfc00a88:	00801821 	move	v1,a0
bfc00a8c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc00a90:	10e00003 	beqz	a3,bfc00aa0 <printbase+0x30>
bfc00a94:	00c09021 	move	s2,a2
bfc00a98:	0480002f 	bltz	a0,bfc00b58 <printbase+0xe8>
bfc00a9c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc00aa0:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00aa4:	1200000c 	beqz	s0,bfc00ad8 <printbase+0x68>
bfc00aa8:	00008821 	move	s1,zero
bfc00aac:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00ab0:	16400002 	bnez	s2,bfc00abc <printbase+0x4c>
bfc00ab4:	0212001b 	divu	zero,s0,s2
bfc00ab8:	0007000d 	break	0x7
bfc00abc:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00ac0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc00ac4:	00001010 	mfhi	v0
bfc00ac8:	a0820000 	sb	v0,0(a0)
bfc00acc:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc00ad0:	1460fff7 	bnez	v1,bfc00ab0 <printbase+0x40>
bfc00ad4:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00ad8:	0233102a 	slt	v0,s1,s3
bfc00adc:	10400002 	beqz	v0,bfc00ae8 <printbase+0x78>
bfc00ae0:	02201821 	move	v1,s1
bfc00ae4:	02601821 	move	v1,s3
bfc00ae8:	1060000c 	beqz	v1,bfc00b1c <printbase+0xac>
bfc00aec:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc00af0:	27a20010 	addiu	v0,sp,16
bfc00af4:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00af8:	26020001 	addiu	v0,s0,1
bfc00afc:	0222102a 	slt	v0,s1,v0
bfc00b00:	1040000e 	beqz	v0,bfc00b3c <printbase+0xcc>
bfc00b04:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00b08:	02009821 	move	s3,s0
bfc00b0c:	0ff00261 	jal	bfc00984 <putchar>
bfc00b10:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc00b14:	1660fff8 	bnez	s3,bfc00af8 <printbase+0x88>
bfc00b18:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc00b1c:	8fbf0064 	lw	ra,100(sp)
bfc00b20:	00001021 	move	v0,zero
bfc00b24:	8fb30060 	lw	s3,96(sp)
bfc00b28:	8fb2005c 	lw	s2,92(sp)
bfc00b2c:	8fb10058 	lw	s1,88(sp)
bfc00b30:	8fb00054 	lw	s0,84(sp)
bfc00b34:	03e00008 	jr	ra
bfc00b38:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc00b3c:	82440000 	lb	a0,0(s2)
bfc00b40:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00b44:	2882000a 	slti	v0,a0,10
bfc00b48:	14400007 	bnez	v0,bfc00b68 <printbase+0xf8>
bfc00b4c:	02009821 	move	s3,s0
bfc00b50:	0bf002c3 	j	bfc00b0c <printbase+0x9c>
bfc00b54:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc00b58:	0ff00261 	jal	bfc00984 <putchar>
bfc00b5c:	00038023 	negu	s0,v1
bfc00b60:	0bf002a9 	j	bfc00aa4 <printbase+0x34>
bfc00b64:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc00b68:	0bf002c2 	j	bfc00b08 <printbase+0x98>
bfc00b6c:	24840030 	addiu	a0,a0,48

bfc00b70 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc00b70:	3c01bfd0 	lui	at,0xbfd0
bfc00b74:	3421e000 	ori	at,at,0xe000
bfc00b78:	8c220000 	lw	v0,0(at)
bfc00b7c:	03e00008 	jr	ra
bfc00b80:	00000000 	nop

bfc00b84 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc00b84:	3c01bfd0 	lui	at,0xbfd0
bfc00b88:	3421e000 	ori	at,at,0xe000
bfc00b8c:	8c220000 	lw	v0,0(at)
bfc00b90:	03e00008 	jr	ra
bfc00b94:	00000000 	nop

bfc00b98 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00b98:	3c01bfd0 	lui	at,0xbfd0
bfc00b9c:	3421e000 	ori	at,at,0xe000
bfc00ba0:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc00ba4:	03e00008 	jr	ra
bfc00ba8:	00021040 	sll	v0,v0,0x1

bfc00bac <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc00bac:	3c01bfd0 	lui	at,0xbfd0
bfc00bb0:	3421e000 	ori	at,at,0xe000
bfc00bb4:	8c220000 	lw	v0,0(at)
bfc00bb8:	03e00008 	jr	ra
bfc00bbc:	00000000 	nop

bfc00bc0 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc00bc0:	27bdffe8 	addiu	sp,sp,-24
bfc00bc4:	afbf0014 	sw	ra,20(sp)
bfc00bc8:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc00bcc:	3c01bfd0 	lui	at,0xbfd0
bfc00bd0:	3421e000 	ori	at,at,0xe000
bfc00bd4:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00bd8:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00bdc:	14400002 	bnez	v0,bfc00be8 <clock_gettime+0x28>
bfc00be0:	0062001b 	divu	zero,v1,v0
bfc00be4:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00be8:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00bec:	3c073b9a 	lui	a3,0x3b9a
bfc00bf0:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00bf4:	3c048000 	lui	a0,0x8000
bfc00bf8:	248401b0 	addiu	a0,a0,432
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00bfc:	00003012 	mflo	a2
bfc00c00:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc00c04:	14400002 	bnez	v0,bfc00c10 <clock_gettime+0x50>
bfc00c08:	0062001b 	divu	zero,v1,v0
bfc00c0c:	0007000d 	break	0x7
bfc00c10:	00002810 	mfhi	a1
bfc00c14:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc00c18:	14400002 	bnez	v0,bfc00c24 <clock_gettime+0x64>
bfc00c1c:	00c2001b 	divu	zero,a2,v0
bfc00c20:	0007000d 	break	0x7
bfc00c24:	00005010 	mfhi	t2
bfc00c28:	ad2a0008 	sw	t2,8(t1)
bfc00c2c:	00004012 	mflo	t0
bfc00c30:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc00c34:	14e00002 	bnez	a3,bfc00c40 <clock_gettime+0x80>
bfc00c38:	00c7001b 	divu	zero,a2,a3
bfc00c3c:	0007000d 	break	0x7
bfc00c40:	00003012 	mflo	a2
bfc00c44:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc00c48:	14400002 	bnez	v0,bfc00c54 <clock_gettime+0x94>
bfc00c4c:	0102001b 	divu	zero,t0,v0
bfc00c50:	0007000d 	break	0x7
bfc00c54:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc00c58:	0ff001c8 	jal	bfc00720 <printf>
bfc00c5c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc00c60:	8fbf0014 	lw	ra,20(sp)
bfc00c64:	00001021 	move	v0,zero
bfc00c68:	03e00008 	jr	ra
bfc00c6c:	27bd0018 	addiu	sp,sp,24

bfc00c70 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00c70:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc00c74:	03e00008 	jr	ra
bfc00c78:	00000000 	nop

bfc00c7c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc00c7c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc00c80:	03e00008 	jr	ra
bfc00c84:	00000000 	nop

bfc00c88 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00c88:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc00c8c:	27bdffe8 	addiu	sp,sp,-24
bfc00c90:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc00c94:	0ff001c8 	jal	bfc00720 <printf>
bfc00c98:	248401c4 	addiu	a0,a0,452
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00c9c:	3c048000 	lui	a0,0x8000
bfc00ca0:	248401e0 	addiu	a0,a0,480
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc00ca4:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc00ca8:	0ff001c8 	jal	bfc00720 <printf>
bfc00cac:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00cb0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00cb4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00cb8:	248401f0 	addiu	a0,a0,496
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc00cbc:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc00cc0:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc00cc4:	0bf001c8 	j	bfc00720 <printf>
bfc00cc8:	00000000 	nop
bfc00ccc:	00000000 	nop
