
obj/quick_sort/main.elf:     file format elf32-tradlittlemips
obj/quick_sort/main.elf


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
bfc00380:	0ff00966 	jal	bfc02598 <exception>
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
bfc003a4:	0ff008d2 	jal	bfc02348 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff00925 	jal	bfc02494 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	3c068000 	lui	a2,0x8000
bfc003b8:	24c40220 	addiu	a0,a2,544
bfc003bc:	240503e8 	li	a1,1000
bfc003c0:	0ff00794 	jal	bfc01e50 <quick_sort>
bfc003c4:	00408021 	move	s0,v0
bfc003c8:	0ff00925 	jal	bfc02494 <get_count>
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
bfc0054c:	0ff008d2 	jal	bfc02348 <puts>
bfc00550:	25440048 	addiu	a0,t2,72
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
bfc00584:	2484002c 	addiu	a0,a0,44
bfc00588:	aca70000 	sw	a3,0(a1)
bfc0058c:	aff00000 	sw	s0,0(ra)
bfc00590:	02002821 	move	a1,s0
bfc00594:	8fbf001c 	lw	ra,28(sp)
bfc00598:	8fb00014 	lw	s0,20(sp)
bfc0059c:	0bf0080c 	j	bfc02030 <printf>
bfc005a0:	27bd0020 	addiu	sp,sp,32
	...
bfc005b0:	3c198000 	lui	t9,0x8000
bfc005b4:	0ff008d2 	jal	bfc02348 <puts>
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
bfc005f4:	2484002c 	addiu	a0,a0,44
bfc005f8:	aff00000 	sw	s0,0(ra)
bfc005fc:	8fbf001c 	lw	ra,28(sp)
bfc00600:	8fb00014 	lw	s0,20(sp)
bfc00604:	0bf0080c 	j	bfc02030 <printf>
bfc00608:	27bd0020 	addiu	sp,sp,32
bfc0060c:	00000000 	nop

bfc00610 <partition>:
partition():
bfc00610:	00053880 	sll	a3,a1,0x2
bfc00614:	00871821 	addu	v1,a0,a3
bfc00618:	00a6102a 	slt	v0,a1,a2
bfc0061c:	8c6a0000 	lw	t2,0(v1)
bfc00620:	1040008e 	beqz	v0,bfc0085c <partition+0x24c>
bfc00624:	00e05821 	move	t3,a3
bfc00628:	00063880 	sll	a3,a2,0x2
bfc0062c:	00874021 	addu	t0,a0,a3
bfc00630:	8d070000 	lw	a3,0(t0)
bfc00634:	00054827 	nor	t1,zero,a1
bfc00638:	01266021 	addu	t4,t1,a2
bfc0063c:	0147182a 	slt	v1,t2,a3
bfc00640:	31890007 	andi	t1,t4,0x7
bfc00644:	1060008a 	beqz	v1,bfc00870 <partition+0x260>
bfc00648:	01006021 	move	t4,t0
bfc0064c:	24c6ffff 	addiu	a2,a2,-1
bfc00650:	00a6182a 	slt	v1,a1,a2
bfc00654:	10600078 	beqz	v1,bfc00838 <partition+0x228>
bfc00658:	2508fffc 	addiu	t0,t0,-4
bfc0065c:	11200041 	beqz	t1,bfc00764 <partition+0x154>
bfc00660:	00000000 	nop
bfc00664:	240c0001 	li	t4,1
bfc00668:	112c0035 	beq	t1,t4,bfc00740 <partition+0x130>
bfc0066c:	240d0002 	li	t5,2
bfc00670:	112d002c 	beq	t1,t5,bfc00724 <partition+0x114>
bfc00674:	240e0003 	li	t6,3
bfc00678:	112e0023 	beq	t1,t6,bfc00708 <partition+0xf8>
bfc0067c:	240f0004 	li	t7,4
bfc00680:	112f001a 	beq	t1,t7,bfc006ec <partition+0xdc>
bfc00684:	24180005 	li	t8,5
bfc00688:	11380011 	beq	t1,t8,bfc006d0 <partition+0xc0>
bfc0068c:	24190006 	li	t9,6
bfc00690:	11390008 	beq	t1,t9,bfc006b4 <partition+0xa4>
bfc00694:	00000000 	nop
bfc00698:	8d070000 	lw	a3,0(t0)
bfc0069c:	00000000 	nop
bfc006a0:	0147102a 	slt	v0,t2,a3
bfc006a4:	10400072 	beqz	v0,bfc00870 <partition+0x260>
bfc006a8:	01006021 	move	t4,t0
bfc006ac:	24c6ffff 	addiu	a2,a2,-1
bfc006b0:	2508fffc 	addiu	t0,t0,-4
bfc006b4:	8d070000 	lw	a3,0(t0)
bfc006b8:	00000000 	nop
bfc006bc:	0147482a 	slt	t1,t2,a3
bfc006c0:	1120006b 	beqz	t1,bfc00870 <partition+0x260>
bfc006c4:	01006021 	move	t4,t0
bfc006c8:	24c6ffff 	addiu	a2,a2,-1
bfc006cc:	2508fffc 	addiu	t0,t0,-4
bfc006d0:	8d070000 	lw	a3,0(t0)
bfc006d4:	00000000 	nop
bfc006d8:	0147182a 	slt	v1,t2,a3
bfc006dc:	10600064 	beqz	v1,bfc00870 <partition+0x260>
bfc006e0:	01006021 	move	t4,t0
bfc006e4:	24c6ffff 	addiu	a2,a2,-1
bfc006e8:	2508fffc 	addiu	t0,t0,-4
bfc006ec:	8d070000 	lw	a3,0(t0)
bfc006f0:	00000000 	nop
bfc006f4:	0147682a 	slt	t5,t2,a3
bfc006f8:	11a0005d 	beqz	t5,bfc00870 <partition+0x260>
bfc006fc:	01006021 	move	t4,t0
bfc00700:	24c6ffff 	addiu	a2,a2,-1
bfc00704:	2508fffc 	addiu	t0,t0,-4
bfc00708:	8d070000 	lw	a3,0(t0)
bfc0070c:	00000000 	nop
bfc00710:	0147702a 	slt	t6,t2,a3
bfc00714:	11c00056 	beqz	t6,bfc00870 <partition+0x260>
bfc00718:	01006021 	move	t4,t0
bfc0071c:	24c6ffff 	addiu	a2,a2,-1
bfc00720:	2508fffc 	addiu	t0,t0,-4
bfc00724:	8d070000 	lw	a3,0(t0)
bfc00728:	00000000 	nop
bfc0072c:	0147782a 	slt	t7,t2,a3
bfc00730:	11e0004f 	beqz	t7,bfc00870 <partition+0x260>
bfc00734:	01006021 	move	t4,t0
bfc00738:	24c6ffff 	addiu	a2,a2,-1
bfc0073c:	2508fffc 	addiu	t0,t0,-4
bfc00740:	8d070000 	lw	a3,0(t0)
bfc00744:	00000000 	nop
bfc00748:	0147c02a 	slt	t8,t2,a3
bfc0074c:	13000048 	beqz	t8,bfc00870 <partition+0x260>
bfc00750:	01006021 	move	t4,t0
bfc00754:	24c6ffff 	addiu	a2,a2,-1
bfc00758:	00a6382a 	slt	a3,a1,a2
bfc0075c:	10e00036 	beqz	a3,bfc00838 <partition+0x228>
bfc00760:	2508fffc 	addiu	t0,t0,-4
bfc00764:	8d070000 	lw	a3,0(t0)
bfc00768:	00000000 	nop
bfc0076c:	0147702a 	slt	t6,t2,a3
bfc00770:	11c0003f 	beqz	t6,bfc00870 <partition+0x260>
bfc00774:	01006021 	move	t4,t0
bfc00778:	2508fffc 	addiu	t0,t0,-4
bfc0077c:	8d070000 	lw	a3,0(t0)
bfc00780:	24c6ffff 	addiu	a2,a2,-1
bfc00784:	0147682a 	slt	t5,t2,a3
bfc00788:	01001821 	move	v1,t0
bfc0078c:	00c04821 	move	t1,a2
bfc00790:	11a00037 	beqz	t5,bfc00870 <partition+0x260>
bfc00794:	01006021 	move	t4,t0
bfc00798:	2508fffc 	addiu	t0,t0,-4
bfc0079c:	8d070000 	lw	a3,0(t0)
bfc007a0:	24c6ffff 	addiu	a2,a2,-1
bfc007a4:	0147c82a 	slt	t9,t2,a3
bfc007a8:	13200031 	beqz	t9,bfc00870 <partition+0x260>
bfc007ac:	01006021 	move	t4,t0
bfc007b0:	8c67fff8 	lw	a3,-8(v1)
bfc007b4:	2468fff8 	addiu	t0,v1,-8
bfc007b8:	0147102a 	slt	v0,t2,a3
bfc007bc:	01006021 	move	t4,t0
bfc007c0:	1040002b 	beqz	v0,bfc00870 <partition+0x260>
bfc007c4:	2526fffe 	addiu	a2,t1,-2
bfc007c8:	8c67fff4 	lw	a3,-12(v1)
bfc007cc:	2468fff4 	addiu	t0,v1,-12
bfc007d0:	0147682a 	slt	t5,t2,a3
bfc007d4:	01006021 	move	t4,t0
bfc007d8:	11a00025 	beqz	t5,bfc00870 <partition+0x260>
bfc007dc:	2526fffd 	addiu	a2,t1,-3
bfc007e0:	8c67fff0 	lw	a3,-16(v1)
bfc007e4:	2468fff0 	addiu	t0,v1,-16
bfc007e8:	0147702a 	slt	t6,t2,a3
bfc007ec:	01006021 	move	t4,t0
bfc007f0:	11c0001f 	beqz	t6,bfc00870 <partition+0x260>
bfc007f4:	2526fffc 	addiu	a2,t1,-4
bfc007f8:	8c67ffec 	lw	a3,-20(v1)
bfc007fc:	2468ffec 	addiu	t0,v1,-20
bfc00800:	0147782a 	slt	t7,t2,a3
bfc00804:	01006021 	move	t4,t0
bfc00808:	11e00019 	beqz	t7,bfc00870 <partition+0x260>
bfc0080c:	2526fffb 	addiu	a2,t1,-5
bfc00810:	8c67ffe8 	lw	a3,-24(v1)
bfc00814:	2468ffe8 	addiu	t0,v1,-24
bfc00818:	0147c02a 	slt	t8,t2,a3
bfc0081c:	2526fffa 	addiu	a2,t1,-6
bfc00820:	13000013 	beqz	t8,bfc00870 <partition+0x260>
bfc00824:	01006021 	move	t4,t0
bfc00828:	2526fff9 	addiu	a2,t1,-7
bfc0082c:	00a6602a 	slt	t4,a1,a2
bfc00830:	1580ffcc 	bnez	t4,bfc00764 <partition+0x154>
bfc00834:	2468ffe4 	addiu	t0,v1,-28
bfc00838:	00064880 	sll	t1,a2,0x2
bfc0083c:	00896021 	addu	t4,a0,t1
bfc00840:	8d880000 	lw	t0,0(t4)
bfc00844:	008b3021 	addu	a2,a0,t3
bfc00848:	acc80000 	sw	t0,0(a2)
bfc0084c:	008b1821 	addu	v1,a0,t3
bfc00850:	8c640000 	lw	a0,0(v1)
bfc00854:	00000000 	nop
bfc00858:	ad840000 	sw	a0,0(t4)
bfc0085c:	ac6a0000 	sw	t2,0(v1)
bfc00860:	03e00008 	jr	ra
bfc00864:	00a01021 	move	v0,a1
	...
bfc00870:	008bc021 	addu	t8,a0,t3
bfc00874:	00a6782a 	slt	t7,a1,a2
bfc00878:	11e0fff4 	beqz	t7,bfc0084c <partition+0x23c>
bfc0087c:	af070000 	sw	a3,0(t8)
bfc00880:	24a70001 	addiu	a3,a1,1
bfc00884:	00c75823 	subu	t3,a2,a3
bfc00888:	00072880 	sll	a1,a3,0x2
bfc0088c:	31690007 	andi	t1,t3,0x7
bfc00890:	11200038 	beqz	t1,bfc00974 <partition+0x364>
bfc00894:	00851821 	addu	v1,a0,a1
bfc00898:	8c650000 	lw	a1,0(v1)
bfc0089c:	24630004 	addiu	v1,v1,4
bfc008a0:	0145c02a 	slt	t8,t2,a1
bfc008a4:	1700006a 	bnez	t8,bfc00a50 <partition+0x440>
bfc008a8:	00e02821 	move	a1,a3
bfc008ac:	240b0001 	li	t3,1
bfc008b0:	112b0030 	beq	t1,t3,bfc00974 <partition+0x364>
bfc008b4:	24e70001 	addiu	a3,a3,1
bfc008b8:	24190002 	li	t9,2
bfc008bc:	11390027 	beq	t1,t9,bfc0095c <partition+0x34c>
bfc008c0:	24020003 	li	v0,3
bfc008c4:	1122001f 	beq	t1,v0,bfc00944 <partition+0x334>
bfc008c8:	240d0004 	li	t5,4
bfc008cc:	112d0017 	beq	t1,t5,bfc0092c <partition+0x31c>
bfc008d0:	240e0005 	li	t6,5
bfc008d4:	112e000f 	beq	t1,t6,bfc00914 <partition+0x304>
bfc008d8:	240f0006 	li	t7,6
bfc008dc:	112f0007 	beq	t1,t7,bfc008fc <partition+0x2ec>
bfc008e0:	00000000 	nop
bfc008e4:	8c780000 	lw	t8,0(v1)
bfc008e8:	00e02821 	move	a1,a3
bfc008ec:	0158482a 	slt	t1,t2,t8
bfc008f0:	15200057 	bnez	t1,bfc00a50 <partition+0x440>
bfc008f4:	24630004 	addiu	v1,v1,4
bfc008f8:	24e70001 	addiu	a3,a3,1
bfc008fc:	8c650000 	lw	a1,0(v1)
bfc00900:	24630004 	addiu	v1,v1,4
bfc00904:	0145582a 	slt	t3,t2,a1
bfc00908:	15600051 	bnez	t3,bfc00a50 <partition+0x440>
bfc0090c:	00e02821 	move	a1,a3
bfc00910:	24e70001 	addiu	a3,a3,1
bfc00914:	8c620000 	lw	v0,0(v1)
bfc00918:	00e02821 	move	a1,a3
bfc0091c:	0142c82a 	slt	t9,t2,v0
bfc00920:	1720004b 	bnez	t9,bfc00a50 <partition+0x440>
bfc00924:	24630004 	addiu	v1,v1,4
bfc00928:	24e70001 	addiu	a3,a3,1
bfc0092c:	8c6e0000 	lw	t6,0(v1)
bfc00930:	00e02821 	move	a1,a3
bfc00934:	014e682a 	slt	t5,t2,t6
bfc00938:	15a00045 	bnez	t5,bfc00a50 <partition+0x440>
bfc0093c:	24630004 	addiu	v1,v1,4
bfc00940:	24e70001 	addiu	a3,a3,1
bfc00944:	8c690000 	lw	t1,0(v1)
bfc00948:	00e02821 	move	a1,a3
bfc0094c:	0149782a 	slt	t7,t2,t1
bfc00950:	15e0003f 	bnez	t7,bfc00a50 <partition+0x440>
bfc00954:	24630004 	addiu	v1,v1,4
bfc00958:	24e70001 	addiu	a3,a3,1
bfc0095c:	8c6b0000 	lw	t3,0(v1)
bfc00960:	00e02821 	move	a1,a3
bfc00964:	014bc02a 	slt	t8,t2,t3
bfc00968:	17000039 	bnez	t8,bfc00a50 <partition+0x440>
bfc0096c:	24630004 	addiu	v1,v1,4
bfc00970:	24e70001 	addiu	a3,a3,1
bfc00974:	00e6c82a 	slt	t9,a3,a2
bfc00978:	00e04821 	move	t1,a3
bfc0097c:	13200030 	beqz	t9,bfc00a40 <partition+0x430>
bfc00980:	00e02821 	move	a1,a3
bfc00984:	8c6d0000 	lw	t5,0(v1)
bfc00988:	00000000 	nop
bfc0098c:	014d102a 	slt	v0,t2,t5
bfc00990:	14400030 	bnez	v0,bfc00a54 <partition+0x444>
bfc00994:	00075880 	sll	t3,a3,0x2
bfc00998:	8c6f0004 	lw	t7,4(v1)
bfc0099c:	24e70001 	addiu	a3,a3,1
bfc009a0:	014f702a 	slt	t6,t2,t7
bfc009a4:	00e05821 	move	t3,a3
bfc009a8:	15c00029 	bnez	t6,bfc00a50 <partition+0x440>
bfc009ac:	25250001 	addiu	a1,t1,1
bfc009b0:	8c650008 	lw	a1,8(v1)
bfc009b4:	24e70001 	addiu	a3,a3,1
bfc009b8:	0145c82a 	slt	t9,t2,a1
bfc009bc:	17200024 	bnez	t9,bfc00a50 <partition+0x440>
bfc009c0:	25250002 	addiu	a1,t1,2
bfc009c4:	8c6d000c 	lw	t5,12(v1)
bfc009c8:	25670002 	addiu	a3,t3,2
bfc009cc:	014d102a 	slt	v0,t2,t5
bfc009d0:	1440001f 	bnez	v0,bfc00a50 <partition+0x440>
bfc009d4:	25250003 	addiu	a1,t1,3
bfc009d8:	8c6f0010 	lw	t7,16(v1)
bfc009dc:	25670003 	addiu	a3,t3,3
bfc009e0:	014f702a 	slt	t6,t2,t7
bfc009e4:	15c0001a 	bnez	t6,bfc00a50 <partition+0x440>
bfc009e8:	25250004 	addiu	a1,t1,4
bfc009ec:	8c790014 	lw	t9,20(v1)
bfc009f0:	25670004 	addiu	a3,t3,4
bfc009f4:	0159c02a 	slt	t8,t2,t9
bfc009f8:	17000015 	bnez	t8,bfc00a50 <partition+0x440>
bfc009fc:	25250005 	addiu	a1,t1,5
bfc00a00:	8c650018 	lw	a1,24(v1)
bfc00a04:	25670005 	addiu	a3,t3,5
bfc00a08:	0145102a 	slt	v0,t2,a1
bfc00a0c:	14400010 	bnez	v0,bfc00a50 <partition+0x440>
bfc00a10:	25250006 	addiu	a1,t1,6
bfc00a14:	8c67001c 	lw	a3,28(v1)
bfc00a18:	25250007 	addiu	a1,t1,7
bfc00a1c:	0147482a 	slt	t1,t2,a3
bfc00a20:	24630020 	addiu	v1,v1,32
bfc00a24:	1520000a 	bnez	t1,bfc00a50 <partition+0x440>
bfc00a28:	25670006 	addiu	a3,t3,6
bfc00a2c:	25670007 	addiu	a3,t3,7
bfc00a30:	00e6c82a 	slt	t9,a3,a2
bfc00a34:	00e04821 	move	t1,a3
bfc00a38:	1720ffd2 	bnez	t9,bfc00984 <partition+0x374>
bfc00a3c:	00e02821 	move	a1,a3
bfc00a40:	0bf00213 	j	bfc0084c <partition+0x23c>
bfc00a44:	00075880 	sll	t3,a3,0x2
	...
bfc00a50:	00075880 	sll	t3,a3,0x2
bfc00a54:	008b6021 	addu	t4,a0,t3
bfc00a58:	8d830000 	lw	v1,0(t4)
bfc00a5c:	0bf0018a 	j	bfc00628 <partition+0x18>
bfc00a60:	ad030000 	sw	v1,0(t0)
	...

bfc00a70 <_quick_sort>:
_quick_sort():
bfc00a70:	27bdffa0 	addiu	sp,sp,-96
bfc00a74:	00a6102a 	slt	v0,a1,a2
bfc00a78:	afb20040 	sw	s2,64(sp)
bfc00a7c:	afbf005c 	sw	ra,92(sp)
bfc00a80:	afbe0058 	sw	s8,88(sp)
bfc00a84:	afb70054 	sw	s7,84(sp)
bfc00a88:	afb60050 	sw	s6,80(sp)
bfc00a8c:	afb5004c 	sw	s5,76(sp)
bfc00a90:	afb40048 	sw	s4,72(sp)
bfc00a94:	afb30044 	sw	s3,68(sp)
bfc00a98:	afb1003c 	sw	s1,60(sp)
bfc00a9c:	afb00038 	sw	s0,56(sp)
bfc00aa0:	afa60068 	sw	a2,104(sp)
bfc00aa4:	104000ab 	beqz	v0,bfc00d54 <_quick_sort+0x2e4>
bfc00aa8:	00809021 	move	s2,a0
bfc00aac:	00056080 	sll	t4,a1,0x2
bfc00ab0:	024c1821 	addu	v1,s2,t4
bfc00ab4:	8c6a0000 	lw	t2,0(v1)
bfc00ab8:	8fa60068 	lw	a2,104(sp)
bfc00abc:	afa50030 	sw	a1,48(sp)
bfc00ac0:	01803821 	move	a3,t4
bfc00ac4:	0006f880 	sll	ra,a2,0x2
bfc00ac8:	025f4021 	addu	t0,s2,ra
bfc00acc:	8d040000 	lw	a0,0(t0)
bfc00ad0:	00000000 	nop
bfc00ad4:	0144582a 	slt	t3,t2,a0
bfc00ad8:	116000aa 	beqz	t3,bfc00d84 <_quick_sort+0x314>
bfc00adc:	01004821 	move	t1,t0
bfc00ae0:	8fa80030 	lw	t0,48(sp)
bfc00ae4:	24c6ffff 	addiu	a2,a2,-1
bfc00ae8:	0106202a 	slt	a0,t0,a2
bfc00aec:	1480fff7 	bnez	a0,bfc00acc <_quick_sort+0x5c>
bfc00af0:	2528fffc 	addiu	t0,t1,-4
bfc00af4:	00067080 	sll	t6,a2,0x2
bfc00af8:	024e4821 	addu	t1,s2,t6
bfc00afc:	8d230000 	lw	v1,0(t1)
bfc00b00:	02474021 	addu	t0,s2,a3
bfc00b04:	ad030000 	sw	v1,0(t0)
bfc00b08:	8fbe0030 	lw	s8,48(sp)
bfc00b0c:	0247b821 	addu	s7,s2,a3
bfc00b10:	8ef80000 	lw	t8,0(s7)
bfc00b14:	27d9ffff 	addiu	t9,s8,-1
bfc00b18:	00b9b02a 	slt	s6,a1,t9
bfc00b1c:	ad380000 	sw	t8,0(t1)
bfc00b20:	afb9002c 	sw	t9,44(sp)
bfc00b24:	12c00085 	beqz	s6,bfc00d3c <_quick_sort+0x2cc>
bfc00b28:	aeea0000 	sw	t2,0(s7)
bfc00b2c:	024c1021 	addu	v0,s2,t4
bfc00b30:	8c4a0000 	lw	t2,0(v0)
bfc00b34:	8fa6002c 	lw	a2,44(sp)
bfc00b38:	afa5001c 	sw	a1,28(sp)
bfc00b3c:	00053880 	sll	a3,a1,0x2
bfc00b40:	0006f080 	sll	s8,a2,0x2
bfc00b44:	025e4021 	addu	t0,s2,s8
bfc00b48:	8d040000 	lw	a0,0(t0)
bfc00b4c:	00000000 	nop
bfc00b50:	0144582a 	slt	t3,t2,a0
bfc00b54:	116000a5 	beqz	t3,bfc00dec <_quick_sort+0x37c>
bfc00b58:	01004821 	move	t1,t0
bfc00b5c:	8fa4001c 	lw	a0,28(sp)
bfc00b60:	24c6ffff 	addiu	a2,a2,-1
bfc00b64:	0086182a 	slt	v1,a0,a2
bfc00b68:	1460fff7 	bnez	v1,bfc00b48 <_quick_sort+0xd8>
bfc00b6c:	2528fffc 	addiu	t0,t1,-4
bfc00b70:	00069880 	sll	s3,a2,0x2
bfc00b74:	02534821 	addu	t1,s2,s3
bfc00b78:	8d310000 	lw	s1,0(t1)
bfc00b7c:	02477821 	addu	t7,s2,a3
bfc00b80:	adf10000 	sw	s1,0(t7)
bfc00b84:	8fb9001c 	lw	t9,28(sp)
bfc00b88:	0247b021 	addu	s6,s2,a3
bfc00b8c:	8ed70000 	lw	s7,0(s6)
bfc00b90:	2738ffff 	addiu	t8,t9,-1
bfc00b94:	00b8302a 	slt	a2,a1,t8
bfc00b98:	ad370000 	sw	s7,0(t1)
bfc00b9c:	afb80028 	sw	t8,40(sp)
bfc00ba0:	10c000cc 	beqz	a2,bfc00ed4 <_quick_sort+0x464>
bfc00ba4:	aeca0000 	sw	t2,0(s6)
bfc00ba8:	024cf821 	addu	ra,s2,t4
bfc00bac:	8fea0000 	lw	t2,0(ra)
bfc00bb0:	8fa60028 	lw	a2,40(sp)
bfc00bb4:	afa50014 	sw	a1,20(sp)
bfc00bb8:	00053880 	sll	a3,a1,0x2
bfc00bbc:	0006c880 	sll	t9,a2,0x2
bfc00bc0:	02594021 	addu	t0,s2,t9
bfc00bc4:	8d040000 	lw	a0,0(t0)
bfc00bc8:	00000000 	nop
bfc00bcc:	0144582a 	slt	t3,t2,a0
bfc00bd0:	116000a6 	beqz	t3,bfc00e6c <_quick_sort+0x3fc>
bfc00bd4:	01004821 	move	t1,t0
bfc00bd8:	8fa30014 	lw	v1,20(sp)
bfc00bdc:	24c6ffff 	addiu	a2,a2,-1
bfc00be0:	0066102a 	slt	v0,v1,a2
bfc00be4:	1440fff7 	bnez	v0,bfc00bc4 <_quick_sort+0x154>
bfc00be8:	2528fffc 	addiu	t0,t1,-4
bfc00bec:	0006a880 	sll	s5,a2,0x2
bfc00bf0:	02554821 	addu	t1,s2,s5
bfc00bf4:	8d260000 	lw	a2,0(t1)
bfc00bf8:	0247a021 	addu	s4,s2,a3
bfc00bfc:	ae860000 	sw	a2,0(s4)
bfc00c00:	8fb80014 	lw	t8,20(sp)
bfc00c04:	02473021 	addu	a2,s2,a3
bfc00c08:	8cd60000 	lw	s6,0(a2)
bfc00c0c:	2717ffff 	addiu	s7,t8,-1
bfc00c10:	00b7402a 	slt	t0,a1,s7
bfc00c14:	ad360000 	sw	s6,0(t1)
bfc00c18:	afb70018 	sw	s7,24(sp)
bfc00c1c:	110000cf 	beqz	t0,bfc00f5c <_quick_sort+0x4ec>
bfc00c20:	acca0000 	sw	t2,0(a2)
bfc00c24:	024cf021 	addu	s8,s2,t4
bfc00c28:	8fa60018 	lw	a2,24(sp)
bfc00c2c:	8fca0000 	lw	t2,0(s8)
bfc00c30:	00053880 	sll	a3,a1,0x2
bfc00c34:	00a0f021 	move	s8,a1
bfc00c38:	00064880 	sll	t1,a2,0x2
bfc00c3c:	02494021 	addu	t0,s2,t1
bfc00c40:	8d040000 	lw	a0,0(t0)
bfc00c44:	00000000 	nop
bfc00c48:	0144102a 	slt	v0,t2,a0
bfc00c4c:	104000a9 	beqz	v0,bfc00ef4 <_quick_sort+0x484>
bfc00c50:	01004821 	move	t1,t0
bfc00c54:	24c6ffff 	addiu	a2,a2,-1
bfc00c58:	03c6f82a 	slt	ra,s8,a2
bfc00c5c:	17e0fff8 	bnez	ra,bfc00c40 <_quick_sort+0x1d0>
bfc00c60:	2528fffc 	addiu	t0,t1,-4
bfc00c64:	00068080 	sll	s0,a2,0x2
bfc00c68:	02504821 	addu	t1,s2,s0
bfc00c6c:	8d360000 	lw	s6,0(t1)
bfc00c70:	0247b821 	addu	s7,s2,a3
bfc00c74:	aef60000 	sw	s6,0(s7)
bfc00c78:	02479821 	addu	s3,s2,a3
bfc00c7c:	8e740000 	lw	s4,0(s3)
bfc00c80:	27d5ffff 	addiu	s5,s8,-1
bfc00c84:	00b5882a 	slt	s1,a1,s5
bfc00c88:	ad340000 	sw	s4,0(t1)
bfc00c8c:	afb50010 	sw	s5,16(sp)
bfc00c90:	12200460 	beqz	s1,bfc01e14 <_quick_sort+0x13a4>
bfc00c94:	ae6a0000 	sw	t2,0(s3)
bfc00c98:	024c4021 	addu	t0,s2,t4
bfc00c9c:	8d0a0000 	lw	t2,0(t0)
bfc00ca0:	8fa60010 	lw	a2,16(sp)
bfc00ca4:	00a0b021 	move	s6,a1
bfc00ca8:	00053880 	sll	a3,a1,0x2
bfc00cac:	00068080 	sll	s0,a2,0x2
bfc00cb0:	0bf00334 	j	bfc00cd0 <_quick_sort+0x260>
bfc00cb4:	02504021 	addu	t0,s2,s0
	...
bfc00cc0:	24c6ffff 	addiu	a2,a2,-1
bfc00cc4:	02c6b82a 	slt	s7,s6,a2
bfc00cc8:	12e000ac 	beqz	s7,bfc00f7c <_quick_sort+0x50c>
bfc00ccc:	2528fffc 	addiu	t0,t1,-4
bfc00cd0:	8d040000 	lw	a0,0(t0)
bfc00cd4:	00000000 	nop
bfc00cd8:	0144c02a 	slt	t8,t2,a0
bfc00cdc:	1700fff8 	bnez	t8,bfc00cc0 <_quick_sort+0x250>
bfc00ce0:	01004821 	move	t1,t0
bfc00ce4:	0247f821 	addu	ra,s2,a3
bfc00ce8:	02c6c82a 	slt	t9,s6,a2
bfc00cec:	132000a8 	beqz	t9,bfc00f90 <_quick_sort+0x520>
bfc00cf0:	afe40000 	sw	a0,0(ra)
bfc00cf4:	26c40001 	addiu	a0,s6,1
bfc00cf8:	0004b080 	sll	s6,a0,0x2
bfc00cfc:	0bf00349 	j	bfc00d24 <_quick_sort+0x2b4>
bfc00d00:	02561821 	addu	v1,s2,s6
	...
bfc00d10:	8c6d0000 	lw	t5,0(v1)
bfc00d14:	00000000 	nop
bfc00d18:	014d582a 	slt	t3,t2,t5
bfc00d1c:	15600438 	bnez	t3,bfc01e00 <_quick_sort+0x1390>
bfc00d20:	24630004 	addiu	v1,v1,4
bfc00d24:	0080b021 	move	s6,a0
bfc00d28:	02c6102a 	slt	v0,s6,a2
bfc00d2c:	1440fff8 	bnez	v0,bfc00d10 <_quick_sort+0x2a0>
bfc00d30:	24840001 	addiu	a0,a0,1
bfc00d34:	0bf003e4 	j	bfc00f90 <_quick_sort+0x520>
bfc00d38:	00163880 	sll	a3,s6,0x2
bfc00d3c:	8fa90030 	lw	t1,48(sp)
bfc00d40:	8fab0068 	lw	t3,104(sp)
bfc00d44:	25250001 	addiu	a1,t1,1
bfc00d48:	00ab202a 	slt	a0,a1,t3
bfc00d4c:	1480ff58 	bnez	a0,bfc00ab0 <_quick_sort+0x40>
bfc00d50:	00056080 	sll	t4,a1,0x2
bfc00d54:	8fbf005c 	lw	ra,92(sp)
bfc00d58:	8fbe0058 	lw	s8,88(sp)
bfc00d5c:	8fb70054 	lw	s7,84(sp)
bfc00d60:	8fb60050 	lw	s6,80(sp)
bfc00d64:	8fb5004c 	lw	s5,76(sp)
bfc00d68:	8fb40048 	lw	s4,72(sp)
bfc00d6c:	8fb30044 	lw	s3,68(sp)
bfc00d70:	8fb20040 	lw	s2,64(sp)
bfc00d74:	8fb1003c 	lw	s1,60(sp)
bfc00d78:	8fb00038 	lw	s0,56(sp)
bfc00d7c:	03e00008 	jr	ra
bfc00d80:	27bd0060 	addiu	sp,sp,96
bfc00d84:	8fab0030 	lw	t3,48(sp)
bfc00d88:	02477021 	addu	t6,s2,a3
bfc00d8c:	0166682a 	slt	t5,t3,a2
bfc00d90:	11a0ff5d 	beqz	t5,bfc00b08 <_quick_sort+0x98>
bfc00d94:	adc40000 	sw	a0,0(t6)
bfc00d98:	25640001 	addiu	a0,t3,1
bfc00d9c:	00043880 	sll	a3,a0,0x2
bfc00da0:	02471821 	addu	v1,s2,a3
bfc00da4:	afa40030 	sw	a0,48(sp)
bfc00da8:	8fb00030 	lw	s0,48(sp)
bfc00dac:	00000000 	nop
bfc00db0:	0206782a 	slt	t7,s0,a2
bfc00db4:	11e0002a 	beqz	t7,bfc00e60 <_quick_sort+0x3f0>
bfc00db8:	24840001 	addiu	a0,a0,1
bfc00dbc:	8c730000 	lw	s3,0(v1)
bfc00dc0:	00000000 	nop
bfc00dc4:	0153882a 	slt	s1,t2,s3
bfc00dc8:	1220fff6 	beqz	s1,bfc00da4 <_quick_sort+0x334>
bfc00dcc:	24630004 	addiu	v1,v1,4
bfc00dd0:	8fb50030 	lw	s5,48(sp)
bfc00dd4:	00000000 	nop
bfc00dd8:	00153880 	sll	a3,s5,0x2
bfc00ddc:	0247a021 	addu	s4,s2,a3
bfc00de0:	8e890000 	lw	t1,0(s4)
bfc00de4:	0bf002b1 	j	bfc00ac4 <_quick_sort+0x54>
bfc00de8:	ad090000 	sw	t1,0(t0)
bfc00dec:	8fab001c 	lw	t3,28(sp)
bfc00df0:	02477021 	addu	t6,s2,a3
bfc00df4:	0166682a 	slt	t5,t3,a2
bfc00df8:	11a0ff62 	beqz	t5,bfc00b84 <_quick_sort+0x114>
bfc00dfc:	adc40000 	sw	a0,0(t6)
bfc00e00:	25640001 	addiu	a0,t3,1
bfc00e04:	00043880 	sll	a3,a0,0x2
bfc00e08:	02471821 	addu	v1,s2,a3
bfc00e0c:	afa4001c 	sw	a0,28(sp)
bfc00e10:	8fb0001c 	lw	s0,28(sp)
bfc00e14:	00000000 	nop
bfc00e18:	0206782a 	slt	t7,s0,a2
bfc00e1c:	11e0000d 	beqz	t7,bfc00e54 <_quick_sort+0x3e4>
bfc00e20:	24840001 	addiu	a0,a0,1
bfc00e24:	8c730000 	lw	s3,0(v1)
bfc00e28:	00000000 	nop
bfc00e2c:	0153882a 	slt	s1,t2,s3
bfc00e30:	1220fff6 	beqz	s1,bfc00e0c <_quick_sort+0x39c>
bfc00e34:	24630004 	addiu	v1,v1,4
bfc00e38:	8fb5001c 	lw	s5,28(sp)
bfc00e3c:	00000000 	nop
bfc00e40:	00153880 	sll	a3,s5,0x2
bfc00e44:	0247a021 	addu	s4,s2,a3
bfc00e48:	8e890000 	lw	t1,0(s4)
bfc00e4c:	0bf002d0 	j	bfc00b40 <_quick_sort+0xd0>
bfc00e50:	ad090000 	sw	t1,0(t0)
bfc00e54:	8fa8001c 	lw	t0,28(sp)
bfc00e58:	0bf002e1 	j	bfc00b84 <_quick_sort+0x114>
bfc00e5c:	00083880 	sll	a3,t0,0x2
bfc00e60:	8fa60030 	lw	a2,48(sp)
bfc00e64:	0bf002c2 	j	bfc00b08 <_quick_sort+0x98>
bfc00e68:	00063880 	sll	a3,a2,0x2
bfc00e6c:	8fab0014 	lw	t3,20(sp)
bfc00e70:	02477021 	addu	t6,s2,a3
bfc00e74:	0166682a 	slt	t5,t3,a2
bfc00e78:	11a0ff61 	beqz	t5,bfc00c00 <_quick_sort+0x190>
bfc00e7c:	adc40000 	sw	a0,0(t6)
bfc00e80:	25640001 	addiu	a0,t3,1
bfc00e84:	00043880 	sll	a3,a0,0x2
bfc00e88:	02471821 	addu	v1,s2,a3
bfc00e8c:	afa40014 	sw	a0,20(sp)
bfc00e90:	8fb00014 	lw	s0,20(sp)
bfc00e94:	00000000 	nop
bfc00e98:	0206782a 	slt	t7,s0,a2
bfc00e9c:	11e0002a 	beqz	t7,bfc00f48 <_quick_sort+0x4d8>
bfc00ea0:	24840001 	addiu	a0,a0,1
bfc00ea4:	8c730000 	lw	s3,0(v1)
bfc00ea8:	00000000 	nop
bfc00eac:	0153882a 	slt	s1,t2,s3
bfc00eb0:	1220fff6 	beqz	s1,bfc00e8c <_quick_sort+0x41c>
bfc00eb4:	24630004 	addiu	v1,v1,4
bfc00eb8:	8fb50014 	lw	s5,20(sp)
bfc00ebc:	00000000 	nop
bfc00ec0:	00153880 	sll	a3,s5,0x2
bfc00ec4:	0247a021 	addu	s4,s2,a3
bfc00ec8:	8e890000 	lw	t1,0(s4)
bfc00ecc:	0bf002ef 	j	bfc00bbc <_quick_sort+0x14c>
bfc00ed0:	ad090000 	sw	t1,0(t0)
bfc00ed4:	8fad001c 	lw	t5,28(sp)
bfc00ed8:	8fa2002c 	lw	v0,44(sp)
bfc00edc:	25a50001 	addiu	a1,t5,1
bfc00ee0:	00a2f82a 	slt	ra,a1,v0
bfc00ee4:	13e0ff95 	beqz	ra,bfc00d3c <_quick_sort+0x2cc>
bfc00ee8:	00056080 	sll	t4,a1,0x2
bfc00eec:	0bf002cc 	j	bfc00b30 <_quick_sort+0xc0>
bfc00ef0:	024c1021 	addu	v0,s2,t4
bfc00ef4:	02475821 	addu	t3,s2,a3
bfc00ef8:	03c6182a 	slt	v1,s8,a2
bfc00efc:	1060ff5e 	beqz	v1,bfc00c78 <_quick_sort+0x208>
bfc00f00:	ad640000 	sw	a0,0(t3)
bfc00f04:	27c40001 	addiu	a0,s8,1
bfc00f08:	00046880 	sll	t5,a0,0x2
bfc00f0c:	024d1821 	addu	v1,s2,t5
bfc00f10:	0080f021 	move	s8,a0
bfc00f14:	03c6702a 	slt	t6,s8,a2
bfc00f18:	11c0000e 	beqz	t6,bfc00f54 <_quick_sort+0x4e4>
bfc00f1c:	24840001 	addiu	a0,a0,1
bfc00f20:	8c6f0000 	lw	t7,0(v1)
bfc00f24:	00000000 	nop
bfc00f28:	014f382a 	slt	a3,t2,t7
bfc00f2c:	10e0fff8 	beqz	a3,bfc00f10 <_quick_sort+0x4a0>
bfc00f30:	24630004 	addiu	v1,v1,4
bfc00f34:	001e3880 	sll	a3,s8,0x2
bfc00f38:	02472021 	addu	a0,s2,a3
bfc00f3c:	8c900000 	lw	s0,0(a0)
bfc00f40:	0bf0030e 	j	bfc00c38 <_quick_sort+0x1c8>
bfc00f44:	ad100000 	sw	s0,0(t0)
bfc00f48:	8fa40014 	lw	a0,20(sp)
bfc00f4c:	0bf00300 	j	bfc00c00 <_quick_sort+0x190>
bfc00f50:	00043880 	sll	a3,a0,0x2
bfc00f54:	0bf0031e 	j	bfc00c78 <_quick_sort+0x208>
bfc00f58:	001e3880 	sll	a3,s8,0x2
bfc00f5c:	8fb90014 	lw	t9,20(sp)
bfc00f60:	8fb80028 	lw	t8,40(sp)
bfc00f64:	27250001 	addiu	a1,t9,1
bfc00f68:	00b8502a 	slt	t2,a1,t8
bfc00f6c:	1140ffd9 	beqz	t2,bfc00ed4 <_quick_sort+0x464>
bfc00f70:	00056080 	sll	t4,a1,0x2
bfc00f74:	0bf002eb 	j	bfc00bac <_quick_sort+0x13c>
bfc00f78:	024cf821 	addu	ra,s2,t4
bfc00f7c:	0006f880 	sll	ra,a2,0x2
bfc00f80:	025f4821 	addu	t1,s2,ra
bfc00f84:	8d390000 	lw	t9,0(t1)
bfc00f88:	0247c021 	addu	t8,s2,a3
bfc00f8c:	af190000 	sw	t9,0(t8)
bfc00f90:	02477821 	addu	t7,s2,a3
bfc00f94:	8de70000 	lw	a3,0(t7)
bfc00f98:	26d7ffff 	addiu	s7,s6,-1
bfc00f9c:	00b7302a 	slt	a2,a1,s7
bfc00fa0:	ad270000 	sw	a3,0(t1)
bfc00fa4:	10c00025 	beqz	a2,bfc0103c <_quick_sort+0x5cc>
bfc00fa8:	adea0000 	sw	t2,0(t7)
bfc00fac:	024c2021 	addu	a0,s2,t4
bfc00fb0:	8c8a0000 	lw	t2,0(a0)
bfc00fb4:	02e03021 	move	a2,s7
bfc00fb8:	00a0a821 	move	s5,a1
bfc00fbc:	00053880 	sll	a3,a1,0x2
bfc00fc0:	00067880 	sll	t7,a2,0x2
bfc00fc4:	0bf003f7 	j	bfc00fdc <_quick_sort+0x56c>
bfc00fc8:	024f4021 	addu	t0,s2,t7
bfc00fcc:	24c6ffff 	addiu	a2,a2,-1
bfc00fd0:	02a6882a 	slt	s1,s5,a2
bfc00fd4:	12200021 	beqz	s1,bfc0105c <_quick_sort+0x5ec>
bfc00fd8:	2528fffc 	addiu	t0,t1,-4
bfc00fdc:	8d040000 	lw	a0,0(t0)
bfc00fe0:	00000000 	nop
bfc00fe4:	0144982a 	slt	s3,t2,a0
bfc00fe8:	1660fff8 	bnez	s3,bfc00fcc <_quick_sort+0x55c>
bfc00fec:	01004821 	move	t1,t0
bfc00ff0:	0247c021 	addu	t8,s2,a3
bfc00ff4:	02a6a02a 	slt	s4,s5,a2
bfc00ff8:	1280001d 	beqz	s4,bfc01070 <_quick_sort+0x600>
bfc00ffc:	af040000 	sw	a0,0(t8)
bfc01000:	26a40001 	addiu	a0,s5,1
bfc01004:	0004a880 	sll	s5,a0,0x2
bfc01008:	0bf00409 	j	bfc01024 <_quick_sort+0x5b4>
bfc0100c:	02551821 	addu	v1,s2,s5
bfc01010:	8c620000 	lw	v0,0(v1)
bfc01014:	00000000 	nop
bfc01018:	0142f82a 	slt	ra,t2,v0
bfc0101c:	17e00384 	bnez	ra,bfc01e30 <_quick_sort+0x13c0>
bfc01020:	24630004 	addiu	v1,v1,4
bfc01024:	0080a821 	move	s5,a0
bfc01028:	02a6c82a 	slt	t9,s5,a2
bfc0102c:	1720fff8 	bnez	t9,bfc01010 <_quick_sort+0x5a0>
bfc01030:	24840001 	addiu	a0,a0,1
bfc01034:	0bf0041c 	j	bfc01070 <_quick_sort+0x600>
bfc01038:	00153880 	sll	a3,s5,0x2
bfc0103c:	26c50001 	addiu	a1,s6,1
bfc01040:	8fb60010 	lw	s6,16(sp)
bfc01044:	00000000 	nop
bfc01048:	00b6b82a 	slt	s7,a1,s6
bfc0104c:	12e00371 	beqz	s7,bfc01e14 <_quick_sort+0x13a4>
bfc01050:	00056080 	sll	t4,a1,0x2
bfc01054:	0bf00327 	j	bfc00c9c <_quick_sort+0x22c>
bfc01058:	024c4021 	addu	t0,s2,t4
bfc0105c:	00062080 	sll	a0,a2,0x2
bfc01060:	02444821 	addu	t1,s2,a0
bfc01064:	8d2d0000 	lw	t5,0(t1)
bfc01068:	02471021 	addu	v0,s2,a3
bfc0106c:	ac4d0000 	sw	t5,0(v0)
bfc01070:	02476821 	addu	t5,s2,a3
bfc01074:	8da30000 	lw	v1,0(t5)
bfc01078:	26aeffff 	addiu	t6,s5,-1
bfc0107c:	00ae402a 	slt	t0,a1,t6
bfc01080:	ad230000 	sw	v1,0(t1)
bfc01084:	afae0024 	sw	t6,36(sp)
bfc01088:	11000357 	beqz	t0,bfc01de8 <_quick_sort+0x1378>
bfc0108c:	adaa0000 	sw	t2,0(t5)
bfc01090:	024c5021 	addu	t2,s2,t4
bfc01094:	8d490000 	lw	t1,0(t2)
bfc01098:	8fa80024 	lw	t0,36(sp)
bfc0109c:	00a0a021 	move	s4,a1
bfc010a0:	00055880 	sll	t3,a1,0x2
bfc010a4:	00088880 	sll	s1,t0,0x2
bfc010a8:	02513821 	addu	a3,s2,s1
bfc010ac:	8ce40000 	lw	a0,0(a3)
bfc010b0:	00143027 	nor	a2,zero,s4
bfc010b4:	00c85021 	addu	t2,a2,t0
bfc010b8:	0124802a 	slt	s0,t1,a0
bfc010bc:	31460007 	andi	a2,t2,0x7
bfc010c0:	120001bc 	beqz	s0,bfc017b4 <_quick_sort+0xd44>
bfc010c4:	00e05021 	move	t2,a3
bfc010c8:	2508ffff 	addiu	t0,t0,-1
bfc010cc:	0288502a 	slt	t2,s4,t0
bfc010d0:	11400077 	beqz	t2,bfc012b0 <_quick_sort+0x840>
bfc010d4:	24e7fffc 	addiu	a3,a3,-4
bfc010d8:	10c00040 	beqz	a2,bfc011dc <_quick_sort+0x76c>
bfc010dc:	24030001 	li	v1,1
bfc010e0:	10c30035 	beq	a2,v1,bfc011b8 <_quick_sort+0x748>
bfc010e4:	240f0002 	li	t7,2
bfc010e8:	10cf002c 	beq	a2,t7,bfc0119c <_quick_sort+0x72c>
bfc010ec:	24130003 	li	s3,3
bfc010f0:	10d30023 	beq	a2,s3,bfc01180 <_quick_sort+0x710>
bfc010f4:	24100004 	li	s0,4
bfc010f8:	10d0001a 	beq	a2,s0,bfc01164 <_quick_sort+0x6f4>
bfc010fc:	24180005 	li	t8,5
bfc01100:	10d80011 	beq	a2,t8,bfc01148 <_quick_sort+0x6d8>
bfc01104:	24190006 	li	t9,6
bfc01108:	10d90008 	beq	a2,t9,bfc0112c <_quick_sort+0x6bc>
bfc0110c:	00000000 	nop
bfc01110:	8ce40000 	lw	a0,0(a3)
bfc01114:	00000000 	nop
bfc01118:	0124882a 	slt	s1,t1,a0
bfc0111c:	122001a5 	beqz	s1,bfc017b4 <_quick_sort+0xd44>
bfc01120:	00e05021 	move	t2,a3
bfc01124:	2508ffff 	addiu	t0,t0,-1
bfc01128:	24e7fffc 	addiu	a3,a3,-4
bfc0112c:	8ce40000 	lw	a0,0(a3)
bfc01130:	00000000 	nop
bfc01134:	0124f82a 	slt	ra,t1,a0
bfc01138:	13e0019e 	beqz	ra,bfc017b4 <_quick_sort+0xd44>
bfc0113c:	00e05021 	move	t2,a3
bfc01140:	2508ffff 	addiu	t0,t0,-1
bfc01144:	24e7fffc 	addiu	a3,a3,-4
bfc01148:	8ce40000 	lw	a0,0(a3)
bfc0114c:	00000000 	nop
bfc01150:	0124102a 	slt	v0,t1,a0
bfc01154:	10400197 	beqz	v0,bfc017b4 <_quick_sort+0xd44>
bfc01158:	00e05021 	move	t2,a3
bfc0115c:	2508ffff 	addiu	t0,t0,-1
bfc01160:	24e7fffc 	addiu	a3,a3,-4
bfc01164:	8ce40000 	lw	a0,0(a3)
bfc01168:	00000000 	nop
bfc0116c:	0124682a 	slt	t5,t1,a0
bfc01170:	11a00190 	beqz	t5,bfc017b4 <_quick_sort+0xd44>
bfc01174:	00e05021 	move	t2,a3
bfc01178:	2508ffff 	addiu	t0,t0,-1
bfc0117c:	24e7fffc 	addiu	a3,a3,-4
bfc01180:	8ce40000 	lw	a0,0(a3)
bfc01184:	00000000 	nop
bfc01188:	0124702a 	slt	t6,t1,a0
bfc0118c:	11c00189 	beqz	t6,bfc017b4 <_quick_sort+0xd44>
bfc01190:	00e05021 	move	t2,a3
bfc01194:	2508ffff 	addiu	t0,t0,-1
bfc01198:	24e7fffc 	addiu	a3,a3,-4
bfc0119c:	8ce40000 	lw	a0,0(a3)
bfc011a0:	00000000 	nop
bfc011a4:	0124302a 	slt	a2,t1,a0
bfc011a8:	10c00182 	beqz	a2,bfc017b4 <_quick_sort+0xd44>
bfc011ac:	00e05021 	move	t2,a3
bfc011b0:	2508ffff 	addiu	t0,t0,-1
bfc011b4:	24e7fffc 	addiu	a3,a3,-4
bfc011b8:	8ce40000 	lw	a0,0(a3)
bfc011bc:	00000000 	nop
bfc011c0:	0124182a 	slt	v1,t1,a0
bfc011c4:	1060017b 	beqz	v1,bfc017b4 <_quick_sort+0xd44>
bfc011c8:	00e05021 	move	t2,a3
bfc011cc:	2508ffff 	addiu	t0,t0,-1
bfc011d0:	0288202a 	slt	a0,s4,t0
bfc011d4:	10800036 	beqz	a0,bfc012b0 <_quick_sort+0x840>
bfc011d8:	24e7fffc 	addiu	a3,a3,-4
bfc011dc:	8ce40000 	lw	a0,0(a3)
bfc011e0:	00000000 	nop
bfc011e4:	0124302a 	slt	a2,t1,a0
bfc011e8:	10c00172 	beqz	a2,bfc017b4 <_quick_sort+0xd44>
bfc011ec:	00e05021 	move	t2,a3
bfc011f0:	24e7fffc 	addiu	a3,a3,-4
bfc011f4:	8ce40000 	lw	a0,0(a3)
bfc011f8:	2508ffff 	addiu	t0,t0,-1
bfc011fc:	0124802a 	slt	s0,t1,a0
bfc01200:	00e01821 	move	v1,a3
bfc01204:	01003021 	move	a2,t0
bfc01208:	1200016a 	beqz	s0,bfc017b4 <_quick_sort+0xd44>
bfc0120c:	00e05021 	move	t2,a3
bfc01210:	24e7fffc 	addiu	a3,a3,-4
bfc01214:	8ce40000 	lw	a0,0(a3)
bfc01218:	2508ffff 	addiu	t0,t0,-1
bfc0121c:	0124782a 	slt	t7,t1,a0
bfc01220:	11e00164 	beqz	t7,bfc017b4 <_quick_sort+0xd44>
bfc01224:	00e05021 	move	t2,a3
bfc01228:	8c64fff8 	lw	a0,-8(v1)
bfc0122c:	2467fff8 	addiu	a3,v1,-8
bfc01230:	0124982a 	slt	s3,t1,a0
bfc01234:	00e05021 	move	t2,a3
bfc01238:	1260015e 	beqz	s3,bfc017b4 <_quick_sort+0xd44>
bfc0123c:	24c8fffe 	addiu	t0,a2,-2
bfc01240:	8c64fff4 	lw	a0,-12(v1)
bfc01244:	2467fff4 	addiu	a3,v1,-12
bfc01248:	0124802a 	slt	s0,t1,a0
bfc0124c:	00e05021 	move	t2,a3
bfc01250:	12000158 	beqz	s0,bfc017b4 <_quick_sort+0xd44>
bfc01254:	24c8fffd 	addiu	t0,a2,-3
bfc01258:	8c64fff0 	lw	a0,-16(v1)
bfc0125c:	2467fff0 	addiu	a3,v1,-16
bfc01260:	0124c02a 	slt	t8,t1,a0
bfc01264:	00e05021 	move	t2,a3
bfc01268:	13000152 	beqz	t8,bfc017b4 <_quick_sort+0xd44>
bfc0126c:	24c8fffc 	addiu	t0,a2,-4
bfc01270:	8c64ffec 	lw	a0,-20(v1)
bfc01274:	2467ffec 	addiu	a3,v1,-20
bfc01278:	0124c82a 	slt	t9,t1,a0
bfc0127c:	00e05021 	move	t2,a3
bfc01280:	1320014c 	beqz	t9,bfc017b4 <_quick_sort+0xd44>
bfc01284:	24c8fffb 	addiu	t0,a2,-5
bfc01288:	8c64ffe8 	lw	a0,-24(v1)
bfc0128c:	2467ffe8 	addiu	a3,v1,-24
bfc01290:	0124882a 	slt	s1,t1,a0
bfc01294:	24c8fffa 	addiu	t0,a2,-6
bfc01298:	12200146 	beqz	s1,bfc017b4 <_quick_sort+0xd44>
bfc0129c:	00e05021 	move	t2,a3
bfc012a0:	24c8fff9 	addiu	t0,a2,-7
bfc012a4:	0288502a 	slt	t2,s4,t0
bfc012a8:	1540ffcc 	bnez	t2,bfc011dc <_quick_sort+0x76c>
bfc012ac:	2467ffe4 	addiu	a3,v1,-28
bfc012b0:	00081880 	sll	v1,t0,0x2
bfc012b4:	02435021 	addu	t2,s2,v1
bfc012b8:	8d480000 	lw	t0,0(t2)
bfc012bc:	024b3821 	addu	a3,s2,t3
bfc012c0:	ace80000 	sw	t0,0(a3)
bfc012c4:	024b4021 	addu	t0,s2,t3
bfc012c8:	8d0e0000 	lw	t6,0(t0)
bfc012cc:	268fffff 	addiu	t7,s4,-1
bfc012d0:	00af382a 	slt	a3,a1,t7
bfc012d4:	ad4e0000 	sw	t6,0(t2)
bfc012d8:	afaf0020 	sw	t7,32(sp)
bfc012dc:	10e002bd 	beqz	a3,bfc01dd4 <_quick_sort+0x1364>
bfc012e0:	ad090000 	sw	t1,0(t0)
bfc012e4:	024c9821 	addu	s3,s2,t4
bfc012e8:	8e690000 	lw	t1,0(s3)
bfc012ec:	8fa80020 	lw	t0,32(sp)
bfc012f0:	00a08821 	move	s1,a1
bfc012f4:	00055080 	sll	t2,a1,0x2
bfc012f8:	00081080 	sll	v0,t0,0x2
bfc012fc:	02423021 	addu	a2,s2,v0
bfc01300:	8cc40000 	lw	a0,0(a2)
bfc01304:	0011f827 	nor	ra,zero,s1
bfc01308:	03e8c821 	addu	t9,ra,t0
bfc0130c:	0124c02a 	slt	t8,t1,a0
bfc01310:	33270007 	andi	a3,t9,0x7
bfc01314:	13000232 	beqz	t8,bfc01be0 <_quick_sort+0x1170>
bfc01318:	00c05821 	move	t3,a2
bfc0131c:	2508ffff 	addiu	t0,t0,-1
bfc01320:	0228182a 	slt	v1,s1,t0
bfc01324:	10600078 	beqz	v1,bfc01508 <_quick_sort+0xa98>
bfc01328:	24c6fffc 	addiu	a2,a2,-4
bfc0132c:	10e00041 	beqz	a3,bfc01434 <_quick_sort+0x9c4>
bfc01330:	00000000 	nop
bfc01334:	240b0001 	li	t3,1
bfc01338:	10eb0035 	beq	a3,t3,bfc01410 <_quick_sort+0x9a0>
bfc0133c:	240d0002 	li	t5,2
bfc01340:	10ed002c 	beq	a3,t5,bfc013f4 <_quick_sort+0x984>
bfc01344:	240e0003 	li	t6,3
bfc01348:	10ee0023 	beq	a3,t6,bfc013d8 <_quick_sort+0x968>
bfc0134c:	240f0004 	li	t7,4
bfc01350:	10ef001a 	beq	a3,t7,bfc013bc <_quick_sort+0x94c>
bfc01354:	24130005 	li	s3,5
bfc01358:	10f30011 	beq	a3,s3,bfc013a0 <_quick_sort+0x930>
bfc0135c:	24100006 	li	s0,6
bfc01360:	10f00008 	beq	a3,s0,bfc01384 <_quick_sort+0x914>
bfc01364:	00000000 	nop
bfc01368:	8cc40000 	lw	a0,0(a2)
bfc0136c:	00000000 	nop
bfc01370:	0124c02a 	slt	t8,t1,a0
bfc01374:	1300021a 	beqz	t8,bfc01be0 <_quick_sort+0x1170>
bfc01378:	00c05821 	move	t3,a2
bfc0137c:	2508ffff 	addiu	t0,t0,-1
bfc01380:	24c6fffc 	addiu	a2,a2,-4
bfc01384:	8cc40000 	lw	a0,0(a2)
bfc01388:	00000000 	nop
bfc0138c:	0124c82a 	slt	t9,t1,a0
bfc01390:	13200213 	beqz	t9,bfc01be0 <_quick_sort+0x1170>
bfc01394:	00c05821 	move	t3,a2
bfc01398:	2508ffff 	addiu	t0,t0,-1
bfc0139c:	24c6fffc 	addiu	a2,a2,-4
bfc013a0:	8cc40000 	lw	a0,0(a2)
bfc013a4:	00000000 	nop
bfc013a8:	0124f82a 	slt	ra,t1,a0
bfc013ac:	13e0020c 	beqz	ra,bfc01be0 <_quick_sort+0x1170>
bfc013b0:	00c05821 	move	t3,a2
bfc013b4:	2508ffff 	addiu	t0,t0,-1
bfc013b8:	24c6fffc 	addiu	a2,a2,-4
bfc013bc:	8cc40000 	lw	a0,0(a2)
bfc013c0:	00000000 	nop
bfc013c4:	0124102a 	slt	v0,t1,a0
bfc013c8:	10400205 	beqz	v0,bfc01be0 <_quick_sort+0x1170>
bfc013cc:	00c05821 	move	t3,a2
bfc013d0:	2508ffff 	addiu	t0,t0,-1
bfc013d4:	24c6fffc 	addiu	a2,a2,-4
bfc013d8:	8cc40000 	lw	a0,0(a2)
bfc013dc:	00000000 	nop
bfc013e0:	0124382a 	slt	a3,t1,a0
bfc013e4:	10e001fe 	beqz	a3,bfc01be0 <_quick_sort+0x1170>
bfc013e8:	00c05821 	move	t3,a2
bfc013ec:	2508ffff 	addiu	t0,t0,-1
bfc013f0:	24c6fffc 	addiu	a2,a2,-4
bfc013f4:	8cc40000 	lw	a0,0(a2)
bfc013f8:	00000000 	nop
bfc013fc:	0124182a 	slt	v1,t1,a0
bfc01400:	106001f7 	beqz	v1,bfc01be0 <_quick_sort+0x1170>
bfc01404:	00c05821 	move	t3,a2
bfc01408:	2508ffff 	addiu	t0,t0,-1
bfc0140c:	24c6fffc 	addiu	a2,a2,-4
bfc01410:	8cc40000 	lw	a0,0(a2)
bfc01414:	00000000 	nop
bfc01418:	0124682a 	slt	t5,t1,a0
bfc0141c:	11a001f0 	beqz	t5,bfc01be0 <_quick_sort+0x1170>
bfc01420:	00c05821 	move	t3,a2
bfc01424:	2508ffff 	addiu	t0,t0,-1
bfc01428:	0228202a 	slt	a0,s1,t0
bfc0142c:	10800036 	beqz	a0,bfc01508 <_quick_sort+0xa98>
bfc01430:	24c6fffc 	addiu	a2,a2,-4
bfc01434:	8cc40000 	lw	a0,0(a2)
bfc01438:	00000000 	nop
bfc0143c:	0124c82a 	slt	t9,t1,a0
bfc01440:	132001e7 	beqz	t9,bfc01be0 <_quick_sort+0x1170>
bfc01444:	00c05821 	move	t3,a2
bfc01448:	24c6fffc 	addiu	a2,a2,-4
bfc0144c:	8cc40000 	lw	a0,0(a2)
bfc01450:	2508ffff 	addiu	t0,t0,-1
bfc01454:	0124c02a 	slt	t8,t1,a0
bfc01458:	00c01821 	move	v1,a2
bfc0145c:	01003821 	move	a3,t0
bfc01460:	130001df 	beqz	t8,bfc01be0 <_quick_sort+0x1170>
bfc01464:	00c05821 	move	t3,a2
bfc01468:	24c6fffc 	addiu	a2,a2,-4
bfc0146c:	8cc40000 	lw	a0,0(a2)
bfc01470:	2508ffff 	addiu	t0,t0,-1
bfc01474:	0124702a 	slt	t6,t1,a0
bfc01478:	11c001d9 	beqz	t6,bfc01be0 <_quick_sort+0x1170>
bfc0147c:	00c05821 	move	t3,a2
bfc01480:	8c64fff8 	lw	a0,-8(v1)
bfc01484:	2466fff8 	addiu	a2,v1,-8
bfc01488:	0124782a 	slt	t7,t1,a0
bfc0148c:	00c05821 	move	t3,a2
bfc01490:	11e001d3 	beqz	t7,bfc01be0 <_quick_sort+0x1170>
bfc01494:	24e8fffe 	addiu	t0,a3,-2
bfc01498:	8c64fff4 	lw	a0,-12(v1)
bfc0149c:	2466fff4 	addiu	a2,v1,-12
bfc014a0:	0124982a 	slt	s3,t1,a0
bfc014a4:	00c05821 	move	t3,a2
bfc014a8:	126001cd 	beqz	s3,bfc01be0 <_quick_sort+0x1170>
bfc014ac:	24e8fffd 	addiu	t0,a3,-3
bfc014b0:	8c64fff0 	lw	a0,-16(v1)
bfc014b4:	2466fff0 	addiu	a2,v1,-16
bfc014b8:	0124802a 	slt	s0,t1,a0
bfc014bc:	00c05821 	move	t3,a2
bfc014c0:	120001c7 	beqz	s0,bfc01be0 <_quick_sort+0x1170>
bfc014c4:	24e8fffc 	addiu	t0,a3,-4
bfc014c8:	8c64ffec 	lw	a0,-20(v1)
bfc014cc:	2466ffec 	addiu	a2,v1,-20
bfc014d0:	0124c02a 	slt	t8,t1,a0
bfc014d4:	00c05821 	move	t3,a2
bfc014d8:	130001c1 	beqz	t8,bfc01be0 <_quick_sort+0x1170>
bfc014dc:	24e8fffb 	addiu	t0,a3,-5
bfc014e0:	8c64ffe8 	lw	a0,-24(v1)
bfc014e4:	2466ffe8 	addiu	a2,v1,-24
bfc014e8:	0124c82a 	slt	t9,t1,a0
bfc014ec:	24e8fffa 	addiu	t0,a3,-6
bfc014f0:	132001bb 	beqz	t9,bfc01be0 <_quick_sort+0x1170>
bfc014f4:	00c05821 	move	t3,a2
bfc014f8:	24e8fff9 	addiu	t0,a3,-7
bfc014fc:	0228582a 	slt	t3,s1,t0
bfc01500:	1560ffcc 	bnez	t3,bfc01434 <_quick_sort+0x9c4>
bfc01504:	2466ffe4 	addiu	a2,v1,-28
bfc01508:	00089880 	sll	s3,t0,0x2
bfc0150c:	02535821 	addu	t3,s2,s3
bfc01510:	8d6f0000 	lw	t7,0(t3)
bfc01514:	024a7021 	addu	t6,s2,t2
bfc01518:	adcf0000 	sw	t7,0(t6)
bfc0151c:	024a4021 	addu	t0,s2,t2
bfc01520:	8d060000 	lw	a2,0(t0)
bfc01524:	2633ffff 	addiu	s3,s1,-1
bfc01528:	00b3382a 	slt	a3,a1,s3
bfc0152c:	ad660000 	sw	a2,0(t3)
bfc01530:	10e0019b 	beqz	a3,bfc01ba0 <_quick_sort+0x1130>
bfc01534:	ad090000 	sw	t1,0(t0)
bfc01538:	024c6821 	addu	t5,s2,t4
bfc0153c:	8da90000 	lw	t1,0(t5)
bfc01540:	02604021 	move	t0,s3
bfc01544:	00a08021 	move	s0,a1
bfc01548:	00055080 	sll	t2,a1,0x2
bfc0154c:	00087880 	sll	t7,t0,0x2
bfc01550:	024f3021 	addu	a2,s2,t7
bfc01554:	8cc40000 	lw	a0,0(a2)
bfc01558:	00107027 	nor	t6,zero,s0
bfc0155c:	01c81821 	addu	v1,t6,t0
bfc01560:	0124602a 	slt	t4,t1,a0
bfc01564:	30670007 	andi	a3,v1,0x7
bfc01568:	1180010d 	beqz	t4,bfc019a0 <_quick_sort+0xf30>
bfc0156c:	00c05821 	move	t3,a2
bfc01570:	2508ffff 	addiu	t0,t0,-1
bfc01574:	0208582a 	slt	t3,s0,t0
bfc01578:	1160007c 	beqz	t3,bfc0176c <_quick_sort+0xcfc>
bfc0157c:	24c6fffc 	addiu	a2,a2,-4
bfc01580:	10e00045 	beqz	a3,bfc01698 <_quick_sort+0xc28>
bfc01584:	24030001 	li	v1,1
bfc01588:	10e3003a 	beq	a3,v1,bfc01674 <_quick_sort+0xc04>
bfc0158c:	00000000 	nop
bfc01590:	24180002 	li	t8,2
bfc01594:	10f80030 	beq	a3,t8,bfc01658 <_quick_sort+0xbe8>
bfc01598:	00000000 	nop
bfc0159c:	24190003 	li	t9,3
bfc015a0:	10f90026 	beq	a3,t9,bfc0163c <_quick_sort+0xbcc>
bfc015a4:	00000000 	nop
bfc015a8:	241f0004 	li	ra,4
bfc015ac:	10ff001c 	beq	a3,ra,bfc01620 <_quick_sort+0xbb0>
bfc015b0:	00000000 	nop
bfc015b4:	24020005 	li	v0,5
bfc015b8:	10e20012 	beq	a3,v0,bfc01604 <_quick_sort+0xb94>
bfc015bc:	00000000 	nop
bfc015c0:	240d0006 	li	t5,6
bfc015c4:	10ed0008 	beq	a3,t5,bfc015e8 <_quick_sort+0xb78>
bfc015c8:	00000000 	nop
bfc015cc:	8cc40000 	lw	a0,0(a2)
bfc015d0:	00000000 	nop
bfc015d4:	0124702a 	slt	t6,t1,a0
bfc015d8:	11c000f1 	beqz	t6,bfc019a0 <_quick_sort+0xf30>
bfc015dc:	00c05821 	move	t3,a2
bfc015e0:	2508ffff 	addiu	t0,t0,-1
bfc015e4:	24c6fffc 	addiu	a2,a2,-4
bfc015e8:	8cc40000 	lw	a0,0(a2)
bfc015ec:	00000000 	nop
bfc015f0:	0124782a 	slt	t7,t1,a0
bfc015f4:	11e000ea 	beqz	t7,bfc019a0 <_quick_sort+0xf30>
bfc015f8:	00c05821 	move	t3,a2
bfc015fc:	2508ffff 	addiu	t0,t0,-1
bfc01600:	24c6fffc 	addiu	a2,a2,-4
bfc01604:	8cc40000 	lw	a0,0(a2)
bfc01608:	00000000 	nop
bfc0160c:	0124602a 	slt	t4,t1,a0
bfc01610:	118000e3 	beqz	t4,bfc019a0 <_quick_sort+0xf30>
bfc01614:	00c05821 	move	t3,a2
bfc01618:	2508ffff 	addiu	t0,t0,-1
bfc0161c:	24c6fffc 	addiu	a2,a2,-4
bfc01620:	8cc40000 	lw	a0,0(a2)
bfc01624:	00000000 	nop
bfc01628:	0124382a 	slt	a3,t1,a0
bfc0162c:	10e000dc 	beqz	a3,bfc019a0 <_quick_sort+0xf30>
bfc01630:	00c05821 	move	t3,a2
bfc01634:	2508ffff 	addiu	t0,t0,-1
bfc01638:	24c6fffc 	addiu	a2,a2,-4
bfc0163c:	8cc40000 	lw	a0,0(a2)
bfc01640:	00000000 	nop
bfc01644:	0124182a 	slt	v1,t1,a0
bfc01648:	106000d5 	beqz	v1,bfc019a0 <_quick_sort+0xf30>
bfc0164c:	00c05821 	move	t3,a2
bfc01650:	2508ffff 	addiu	t0,t0,-1
bfc01654:	24c6fffc 	addiu	a2,a2,-4
bfc01658:	8cc40000 	lw	a0,0(a2)
bfc0165c:	00000000 	nop
bfc01660:	0124c02a 	slt	t8,t1,a0
bfc01664:	130000ce 	beqz	t8,bfc019a0 <_quick_sort+0xf30>
bfc01668:	00c05821 	move	t3,a2
bfc0166c:	2508ffff 	addiu	t0,t0,-1
bfc01670:	24c6fffc 	addiu	a2,a2,-4
bfc01674:	8cc40000 	lw	a0,0(a2)
bfc01678:	00000000 	nop
bfc0167c:	0124c82a 	slt	t9,t1,a0
bfc01680:	132000c7 	beqz	t9,bfc019a0 <_quick_sort+0xf30>
bfc01684:	00c05821 	move	t3,a2
bfc01688:	2508ffff 	addiu	t0,t0,-1
bfc0168c:	0208202a 	slt	a0,s0,t0
bfc01690:	10800036 	beqz	a0,bfc0176c <_quick_sort+0xcfc>
bfc01694:	24c6fffc 	addiu	a2,a2,-4
bfc01698:	8cc40000 	lw	a0,0(a2)
bfc0169c:	00000000 	nop
bfc016a0:	0124182a 	slt	v1,t1,a0
bfc016a4:	106000be 	beqz	v1,bfc019a0 <_quick_sort+0xf30>
bfc016a8:	00c05821 	move	t3,a2
bfc016ac:	24c6fffc 	addiu	a2,a2,-4
bfc016b0:	8cc40000 	lw	a0,0(a2)
bfc016b4:	2508ffff 	addiu	t0,t0,-1
bfc016b8:	0124602a 	slt	t4,t1,a0
bfc016bc:	00c01821 	move	v1,a2
bfc016c0:	01003821 	move	a3,t0
bfc016c4:	118000b6 	beqz	t4,bfc019a0 <_quick_sort+0xf30>
bfc016c8:	00c05821 	move	t3,a2
bfc016cc:	24c6fffc 	addiu	a2,a2,-4
bfc016d0:	8cc40000 	lw	a0,0(a2)
bfc016d4:	2508ffff 	addiu	t0,t0,-1
bfc016d8:	0124f82a 	slt	ra,t1,a0
bfc016dc:	13e000b0 	beqz	ra,bfc019a0 <_quick_sort+0xf30>
bfc016e0:	00c05821 	move	t3,a2
bfc016e4:	8c64fff8 	lw	a0,-8(v1)
bfc016e8:	2466fff8 	addiu	a2,v1,-8
bfc016ec:	0124102a 	slt	v0,t1,a0
bfc016f0:	00c05821 	move	t3,a2
bfc016f4:	104000aa 	beqz	v0,bfc019a0 <_quick_sort+0xf30>
bfc016f8:	24e8fffe 	addiu	t0,a3,-2
bfc016fc:	8c64fff4 	lw	a0,-12(v1)
bfc01700:	2466fff4 	addiu	a2,v1,-12
bfc01704:	0124682a 	slt	t5,t1,a0
bfc01708:	00c05821 	move	t3,a2
bfc0170c:	11a000a4 	beqz	t5,bfc019a0 <_quick_sort+0xf30>
bfc01710:	24e8fffd 	addiu	t0,a3,-3
bfc01714:	8c64fff0 	lw	a0,-16(v1)
bfc01718:	2466fff0 	addiu	a2,v1,-16
bfc0171c:	0124702a 	slt	t6,t1,a0
bfc01720:	00c05821 	move	t3,a2
bfc01724:	11c0009e 	beqz	t6,bfc019a0 <_quick_sort+0xf30>
bfc01728:	24e8fffc 	addiu	t0,a3,-4
bfc0172c:	8c64ffec 	lw	a0,-20(v1)
bfc01730:	2466ffec 	addiu	a2,v1,-20
bfc01734:	0124782a 	slt	t7,t1,a0
bfc01738:	00c05821 	move	t3,a2
bfc0173c:	11e00098 	beqz	t7,bfc019a0 <_quick_sort+0xf30>
bfc01740:	24e8fffb 	addiu	t0,a3,-5
bfc01744:	8c64ffe8 	lw	a0,-24(v1)
bfc01748:	2466ffe8 	addiu	a2,v1,-24
bfc0174c:	0124602a 	slt	t4,t1,a0
bfc01750:	24e8fffa 	addiu	t0,a3,-6
bfc01754:	11800092 	beqz	t4,bfc019a0 <_quick_sort+0xf30>
bfc01758:	00c05821 	move	t3,a2
bfc0175c:	24e8fff9 	addiu	t0,a3,-7
bfc01760:	0208582a 	slt	t3,s0,t0
bfc01764:	1560ffcc 	bnez	t3,bfc01698 <_quick_sort+0xc28>
bfc01768:	2466ffe4 	addiu	a2,v1,-28
bfc0176c:	0008c080 	sll	t8,t0,0x2
bfc01770:	02585821 	addu	t3,s2,t8
bfc01774:	8d660000 	lw	a2,0(t3)
bfc01778:	024a6021 	addu	t4,s2,t2
bfc0177c:	ad860000 	sw	a2,0(t4)
bfc01780:	024a3821 	addu	a3,s2,t2
bfc01784:	8ce80000 	lw	t0,0(a3)
bfc01788:	02402021 	move	a0,s2
bfc0178c:	ad680000 	sw	t0,0(t3)
bfc01790:	2606ffff 	addiu	a2,s0,-1
bfc01794:	0ff0029c 	jal	bfc00a70 <_quick_sort>
bfc01798:	ace90000 	sw	t1,0(a3)
bfc0179c:	26050001 	addiu	a1,s0,1
bfc017a0:	00b3482a 	slt	t1,a1,s3
bfc017a4:	112000fe 	beqz	t1,bfc01ba0 <_quick_sort+0x1130>
bfc017a8:	00056080 	sll	t4,a1,0x2
bfc017ac:	0bf0054e 	j	bfc01538 <_quick_sort+0xac8>
bfc017b0:	00000000 	nop
bfc017b4:	024b9821 	addu	s3,s2,t3
bfc017b8:	0288882a 	slt	s1,s4,t0
bfc017bc:	1220fec1 	beqz	s1,bfc012c4 <_quick_sort+0x854>
bfc017c0:	ae640000 	sw	a0,0(s3)
bfc017c4:	26840001 	addiu	a0,s4,1
bfc017c8:	0104c023 	subu	t8,t0,a0
bfc017cc:	0004a080 	sll	s4,a0,0x2
bfc017d0:	33060007 	andi	a2,t8,0x7
bfc017d4:	10c00038 	beqz	a2,bfc018b8 <_quick_sort+0xe48>
bfc017d8:	02541821 	addu	v1,s2,s4
bfc017dc:	8c740000 	lw	s4,0(v1)
bfc017e0:	24630004 	addiu	v1,v1,4
bfc017e4:	0134882a 	slt	s1,t1,s4
bfc017e8:	16200068 	bnez	s1,bfc0198c <_quick_sort+0xf1c>
bfc017ec:	0080a021 	move	s4,a0
bfc017f0:	241f0001 	li	ra,1
bfc017f4:	10df0030 	beq	a2,ra,bfc018b8 <_quick_sort+0xe48>
bfc017f8:	24840001 	addiu	a0,a0,1
bfc017fc:	24020002 	li	v0,2
bfc01800:	10c20027 	beq	a2,v0,bfc018a0 <_quick_sort+0xe30>
bfc01804:	240d0003 	li	t5,3
bfc01808:	10cd001f 	beq	a2,t5,bfc01888 <_quick_sort+0xe18>
bfc0180c:	240e0004 	li	t6,4
bfc01810:	10ce0017 	beq	a2,t6,bfc01870 <_quick_sort+0xe00>
bfc01814:	240f0005 	li	t7,5
bfc01818:	10cf000f 	beq	a2,t7,bfc01858 <_quick_sort+0xde8>
bfc0181c:	24130006 	li	s3,6
bfc01820:	10d30007 	beq	a2,s3,bfc01840 <_quick_sort+0xdd0>
bfc01824:	0080a021 	move	s4,a0
bfc01828:	8c700000 	lw	s0,0(v1)
bfc0182c:	00000000 	nop
bfc01830:	0130302a 	slt	a2,t1,s0
bfc01834:	14c00055 	bnez	a2,bfc0198c <_quick_sort+0xf1c>
bfc01838:	24630004 	addiu	v1,v1,4
bfc0183c:	24840001 	addiu	a0,a0,1
bfc01840:	8c790000 	lw	t9,0(v1)
bfc01844:	0080a021 	move	s4,a0
bfc01848:	0139c02a 	slt	t8,t1,t9
bfc0184c:	1700004f 	bnez	t8,bfc0198c <_quick_sort+0xf1c>
bfc01850:	24630004 	addiu	v1,v1,4
bfc01854:	24840001 	addiu	a0,a0,1
bfc01858:	8c710000 	lw	s1,0(v1)
bfc0185c:	0080a021 	move	s4,a0
bfc01860:	0131582a 	slt	t3,t1,s1
bfc01864:	15600049 	bnez	t3,bfc0198c <_quick_sort+0xf1c>
bfc01868:	24630004 	addiu	v1,v1,4
bfc0186c:	24840001 	addiu	a0,a0,1
bfc01870:	8c740000 	lw	s4,0(v1)
bfc01874:	24630004 	addiu	v1,v1,4
bfc01878:	0134f82a 	slt	ra,t1,s4
bfc0187c:	17e00043 	bnez	ra,bfc0198c <_quick_sort+0xf1c>
bfc01880:	0080a021 	move	s4,a0
bfc01884:	24840001 	addiu	a0,a0,1
bfc01888:	8c6d0000 	lw	t5,0(v1)
bfc0188c:	0080a021 	move	s4,a0
bfc01890:	012d102a 	slt	v0,t1,t5
bfc01894:	1440003d 	bnez	v0,bfc0198c <_quick_sort+0xf1c>
bfc01898:	24630004 	addiu	v1,v1,4
bfc0189c:	24840001 	addiu	a0,a0,1
bfc018a0:	8c6f0000 	lw	t7,0(v1)
bfc018a4:	0080a021 	move	s4,a0
bfc018a8:	012f702a 	slt	t6,t1,t7
bfc018ac:	15c00037 	bnez	t6,bfc0198c <_quick_sort+0xf1c>
bfc018b0:	24630004 	addiu	v1,v1,4
bfc018b4:	24840001 	addiu	a0,a0,1
bfc018b8:	0088c82a 	slt	t9,a0,t0
bfc018bc:	00803021 	move	a2,a0
bfc018c0:	13200030 	beqz	t9,bfc01984 <_quick_sort+0xf14>
bfc018c4:	0080a021 	move	s4,a0
bfc018c8:	8c620000 	lw	v0,0(v1)
bfc018cc:	00000000 	nop
bfc018d0:	0122f82a 	slt	ra,t1,v0
bfc018d4:	17e0002d 	bnez	ra,bfc0198c <_quick_sort+0xf1c>
bfc018d8:	00000000 	nop
bfc018dc:	8c6b0004 	lw	t3,4(v1)
bfc018e0:	24840001 	addiu	a0,a0,1
bfc018e4:	012b682a 	slt	t5,t1,t3
bfc018e8:	24d40001 	addiu	s4,a2,1
bfc018ec:	15a00027 	bnez	t5,bfc0198c <_quick_sort+0xf1c>
bfc018f0:	00805821 	move	t3,a0
bfc018f4:	8c700008 	lw	s0,8(v1)
bfc018f8:	24840001 	addiu	a0,a0,1
bfc018fc:	0130982a 	slt	s3,t1,s0
bfc01900:	16600022 	bnez	s3,bfc0198c <_quick_sort+0xf1c>
bfc01904:	24d40002 	addiu	s4,a2,2
bfc01908:	8c79000c 	lw	t9,12(v1)
bfc0190c:	25640002 	addiu	a0,t3,2
bfc01910:	0139c02a 	slt	t8,t1,t9
bfc01914:	1700001d 	bnez	t8,bfc0198c <_quick_sort+0xf1c>
bfc01918:	24d40003 	addiu	s4,a2,3
bfc0191c:	8c7f0010 	lw	ra,16(v1)
bfc01920:	25640003 	addiu	a0,t3,3
bfc01924:	013f882a 	slt	s1,t1,ra
bfc01928:	16200018 	bnez	s1,bfc0198c <_quick_sort+0xf1c>
bfc0192c:	24d40004 	addiu	s4,a2,4
bfc01930:	8c740014 	lw	s4,20(v1)
bfc01934:	25640004 	addiu	a0,t3,4
bfc01938:	0134102a 	slt	v0,t1,s4
bfc0193c:	14400013 	bnez	v0,bfc0198c <_quick_sort+0xf1c>
bfc01940:	24d40005 	addiu	s4,a2,5
bfc01944:	8c6e0018 	lw	t6,24(v1)
bfc01948:	25640005 	addiu	a0,t3,5
bfc0194c:	012e682a 	slt	t5,t1,t6
bfc01950:	15a0000e 	bnez	t5,bfc0198c <_quick_sort+0xf1c>
bfc01954:	24d40006 	addiu	s4,a2,6
bfc01958:	8c64001c 	lw	a0,28(v1)
bfc0195c:	24d40007 	addiu	s4,a2,7
bfc01960:	0124302a 	slt	a2,t1,a0
bfc01964:	24630020 	addiu	v1,v1,32
bfc01968:	14c00008 	bnez	a2,bfc0198c <_quick_sort+0xf1c>
bfc0196c:	25640006 	addiu	a0,t3,6
bfc01970:	25640007 	addiu	a0,t3,7
bfc01974:	0088c82a 	slt	t9,a0,t0
bfc01978:	00803021 	move	a2,a0
bfc0197c:	1720ffd2 	bnez	t9,bfc018c8 <_quick_sort+0xe58>
bfc01980:	0080a021 	move	s4,a0
bfc01984:	0bf004b1 	j	bfc012c4 <_quick_sort+0x854>
bfc01988:	00045880 	sll	t3,a0,0x2
bfc0198c:	00045880 	sll	t3,a0,0x2
bfc01990:	024b1821 	addu	v1,s2,t3
bfc01994:	8c640000 	lw	a0,0(v1)
bfc01998:	0bf00429 	j	bfc010a4 <_quick_sort+0x634>
bfc0199c:	ace40000 	sw	a0,0(a3)
bfc019a0:	024a7821 	addu	t7,s2,t2
bfc019a4:	0208702a 	slt	t6,s0,t0
bfc019a8:	11c0ff75 	beqz	t6,bfc01780 <_quick_sort+0xd10>
bfc019ac:	ade40000 	sw	a0,0(t7)
bfc019b0:	26040001 	addiu	a0,s0,1
bfc019b4:	01045023 	subu	t2,t0,a0
bfc019b8:	00048080 	sll	s0,a0,0x2
bfc019bc:	31470007 	andi	a3,t2,0x7
bfc019c0:	10e00038 	beqz	a3,bfc01aa4 <_quick_sort+0x1034>
bfc019c4:	02501821 	addu	v1,s2,s0
bfc019c8:	8c700000 	lw	s0,0(v1)
bfc019cc:	24630004 	addiu	v1,v1,4
bfc019d0:	0130502a 	slt	t2,t1,s0
bfc019d4:	1540007a 	bnez	t2,bfc01bc0 <_quick_sort+0x1150>
bfc019d8:	00808021 	move	s0,a0
bfc019dc:	24190001 	li	t9,1
bfc019e0:	10f90030 	beq	a3,t9,bfc01aa4 <_quick_sort+0x1034>
bfc019e4:	24840001 	addiu	a0,a0,1
bfc019e8:	241f0002 	li	ra,2
bfc019ec:	10ff0027 	beq	a3,ra,bfc01a8c <_quick_sort+0x101c>
bfc019f0:	24020003 	li	v0,3
bfc019f4:	10e2001f 	beq	a3,v0,bfc01a74 <_quick_sort+0x1004>
bfc019f8:	240d0004 	li	t5,4
bfc019fc:	10ed0017 	beq	a3,t5,bfc01a5c <_quick_sort+0xfec>
bfc01a00:	240e0005 	li	t6,5
bfc01a04:	10ee000f 	beq	a3,t6,bfc01a44 <_quick_sort+0xfd4>
bfc01a08:	240f0006 	li	t7,6
bfc01a0c:	10ef0007 	beq	a3,t7,bfc01a2c <_quick_sort+0xfbc>
bfc01a10:	00808021 	move	s0,a0
bfc01a14:	8c6c0000 	lw	t4,0(v1)
bfc01a18:	00000000 	nop
bfc01a1c:	012c382a 	slt	a3,t1,t4
bfc01a20:	14e00067 	bnez	a3,bfc01bc0 <_quick_sort+0x1150>
bfc01a24:	24630004 	addiu	v1,v1,4
bfc01a28:	24840001 	addiu	a0,a0,1
bfc01a2c:	8c6a0000 	lw	t2,0(v1)
bfc01a30:	00808021 	move	s0,a0
bfc01a34:	012ac02a 	slt	t8,t1,t2
bfc01a38:	17000061 	bnez	t8,bfc01bc0 <_quick_sort+0x1150>
bfc01a3c:	24630004 	addiu	v1,v1,4
bfc01a40:	24840001 	addiu	a0,a0,1
bfc01a44:	8c700000 	lw	s0,0(v1)
bfc01a48:	24630004 	addiu	v1,v1,4
bfc01a4c:	0130c82a 	slt	t9,t1,s0
bfc01a50:	1720005b 	bnez	t9,bfc01bc0 <_quick_sort+0x1150>
bfc01a54:	00808021 	move	s0,a0
bfc01a58:	24840001 	addiu	a0,a0,1
bfc01a5c:	8c620000 	lw	v0,0(v1)
bfc01a60:	00808021 	move	s0,a0
bfc01a64:	0122f82a 	slt	ra,t1,v0
bfc01a68:	17e00055 	bnez	ra,bfc01bc0 <_quick_sort+0x1150>
bfc01a6c:	24630004 	addiu	v1,v1,4
bfc01a70:	24840001 	addiu	a0,a0,1
bfc01a74:	8c6e0000 	lw	t6,0(v1)
bfc01a78:	00808021 	move	s0,a0
bfc01a7c:	012e682a 	slt	t5,t1,t6
bfc01a80:	15a0004f 	bnez	t5,bfc01bc0 <_quick_sort+0x1150>
bfc01a84:	24630004 	addiu	v1,v1,4
bfc01a88:	24840001 	addiu	a0,a0,1
bfc01a8c:	8c670000 	lw	a3,0(v1)
bfc01a90:	00808021 	move	s0,a0
bfc01a94:	0127782a 	slt	t7,t1,a3
bfc01a98:	15e00049 	bnez	t7,bfc01bc0 <_quick_sort+0x1150>
bfc01a9c:	24630004 	addiu	v1,v1,4
bfc01aa0:	24840001 	addiu	a0,a0,1
bfc01aa4:	0088c02a 	slt	t8,a0,t0
bfc01aa8:	00803821 	move	a3,a0
bfc01aac:	13000030 	beqz	t8,bfc01b70 <_quick_sort+0x1100>
bfc01ab0:	00808021 	move	s0,a0
bfc01ab4:	8c7f0000 	lw	ra,0(v1)
bfc01ab8:	00000000 	nop
bfc01abc:	013fc82a 	slt	t9,t1,ra
bfc01ac0:	17200040 	bnez	t9,bfc01bc4 <_quick_sort+0x1154>
bfc01ac4:	00045080 	sll	t2,a0,0x2
bfc01ac8:	8c6d0004 	lw	t5,4(v1)
bfc01acc:	24840001 	addiu	a0,a0,1
bfc01ad0:	012d102a 	slt	v0,t1,t5
bfc01ad4:	00805021 	move	t2,a0
bfc01ad8:	14400039 	bnez	v0,bfc01bc0 <_quick_sort+0x1150>
bfc01adc:	24f00001 	addiu	s0,a3,1
bfc01ae0:	8c780008 	lw	t8,8(v1)
bfc01ae4:	24840001 	addiu	a0,a0,1
bfc01ae8:	0138602a 	slt	t4,t1,t8
bfc01aec:	15800034 	bnez	t4,bfc01bc0 <_quick_sort+0x1150>
bfc01af0:	24f00002 	addiu	s0,a3,2
bfc01af4:	8c70000c 	lw	s0,12(v1)
bfc01af8:	25440002 	addiu	a0,t2,2
bfc01afc:	0130c82a 	slt	t9,t1,s0
bfc01b00:	1720002f 	bnez	t9,bfc01bc0 <_quick_sort+0x1150>
bfc01b04:	24f00003 	addiu	s0,a3,3
bfc01b08:	8c620010 	lw	v0,16(v1)
bfc01b0c:	25440003 	addiu	a0,t2,3
bfc01b10:	0122f82a 	slt	ra,t1,v0
bfc01b14:	17e0002a 	bnez	ra,bfc01bc0 <_quick_sort+0x1150>
bfc01b18:	24f00004 	addiu	s0,a3,4
bfc01b1c:	8c6e0014 	lw	t6,20(v1)
bfc01b20:	25440004 	addiu	a0,t2,4
bfc01b24:	012e682a 	slt	t5,t1,t6
bfc01b28:	15a00025 	bnez	t5,bfc01bc0 <_quick_sort+0x1150>
bfc01b2c:	24f00005 	addiu	s0,a3,5
bfc01b30:	8c6c0018 	lw	t4,24(v1)
bfc01b34:	25440005 	addiu	a0,t2,5
bfc01b38:	012c782a 	slt	t7,t1,t4
bfc01b3c:	15e00020 	bnez	t7,bfc01bc0 <_quick_sort+0x1150>
bfc01b40:	24f00006 	addiu	s0,a3,6
bfc01b44:	8c64001c 	lw	a0,28(v1)
bfc01b48:	24f00007 	addiu	s0,a3,7
bfc01b4c:	0124382a 	slt	a3,t1,a0
bfc01b50:	24630020 	addiu	v1,v1,32
bfc01b54:	14e0001a 	bnez	a3,bfc01bc0 <_quick_sort+0x1150>
bfc01b58:	25440006 	addiu	a0,t2,6
bfc01b5c:	25440007 	addiu	a0,t2,7
bfc01b60:	0088c02a 	slt	t8,a0,t0
bfc01b64:	00803821 	move	a3,a0
bfc01b68:	1700ffd2 	bnez	t8,bfc01ab4 <_quick_sort+0x1044>
bfc01b6c:	00808021 	move	s0,a0
bfc01b70:	00045080 	sll	t2,a0,0x2
bfc01b74:	024a3821 	addu	a3,s2,t2
bfc01b78:	8ce80000 	lw	t0,0(a3)
bfc01b7c:	02402021 	move	a0,s2
bfc01b80:	ad680000 	sw	t0,0(t3)
bfc01b84:	2606ffff 	addiu	a2,s0,-1
bfc01b88:	0ff0029c 	jal	bfc00a70 <_quick_sort>
bfc01b8c:	ace90000 	sw	t1,0(a3)
bfc01b90:	26050001 	addiu	a1,s0,1
bfc01b94:	00b3482a 	slt	t1,a1,s3
bfc01b98:	1520fe67 	bnez	t1,bfc01538 <_quick_sort+0xac8>
bfc01b9c:	00056080 	sll	t4,a1,0x2
bfc01ba0:	8fb30020 	lw	s3,32(sp)
bfc01ba4:	26250001 	addiu	a1,s1,1
bfc01ba8:	00b3882a 	slt	s1,a1,s3
bfc01bac:	12200089 	beqz	s1,bfc01dd4 <_quick_sort+0x1364>
bfc01bb0:	00056080 	sll	t4,a1,0x2
bfc01bb4:	0bf004ba 	j	bfc012e8 <_quick_sort+0x878>
bfc01bb8:	024c9821 	addu	s3,s2,t4
bfc01bbc:	00000000 	nop
bfc01bc0:	00045080 	sll	t2,a0,0x2
bfc01bc4:	024a2021 	addu	a0,s2,t2
bfc01bc8:	8c8b0000 	lw	t3,0(a0)
bfc01bcc:	0bf00553 	j	bfc0154c <_quick_sort+0xadc>
bfc01bd0:	accb0000 	sw	t3,0(a2)
	...
bfc01be0:	024a1021 	addu	v0,s2,t2
bfc01be4:	0228f82a 	slt	ra,s1,t0
bfc01be8:	13e0fe4c 	beqz	ra,bfc0151c <_quick_sort+0xaac>
bfc01bec:	ac440000 	sw	a0,0(v0)
bfc01bf0:	26240001 	addiu	a0,s1,1
bfc01bf4:	01041823 	subu	v1,t0,a0
bfc01bf8:	30670007 	andi	a3,v1,0x7
bfc01bfc:	00046880 	sll	t5,a0,0x2
bfc01c00:	10e00038 	beqz	a3,bfc01ce4 <_quick_sort+0x1274>
bfc01c04:	024d1821 	addu	v1,s2,t5
bfc01c08:	8c710000 	lw	s1,0(v1)
bfc01c0c:	24630004 	addiu	v1,v1,4
bfc01c10:	0131982a 	slt	s3,t1,s1
bfc01c14:	1660006a 	bnez	s3,bfc01dc0 <_quick_sort+0x1350>
bfc01c18:	00808821 	move	s1,a0
bfc01c1c:	240a0001 	li	t2,1
bfc01c20:	10ea0030 	beq	a3,t2,bfc01ce4 <_quick_sort+0x1274>
bfc01c24:	24840001 	addiu	a0,a0,1
bfc01c28:	24100002 	li	s0,2
bfc01c2c:	10f00027 	beq	a3,s0,bfc01ccc <_quick_sort+0x125c>
bfc01c30:	24180003 	li	t8,3
bfc01c34:	10f8001f 	beq	a3,t8,bfc01cb4 <_quick_sort+0x1244>
bfc01c38:	24190004 	li	t9,4
bfc01c3c:	10f90017 	beq	a3,t9,bfc01c9c <_quick_sort+0x122c>
bfc01c40:	241f0005 	li	ra,5
bfc01c44:	10ff000f 	beq	a3,ra,bfc01c84 <_quick_sort+0x1214>
bfc01c48:	24020006 	li	v0,6
bfc01c4c:	10e20007 	beq	a3,v0,bfc01c6c <_quick_sort+0x11fc>
bfc01c50:	00808821 	move	s1,a0
bfc01c54:	8c6d0000 	lw	t5,0(v1)
bfc01c58:	00000000 	nop
bfc01c5c:	012d382a 	slt	a3,t1,t5
bfc01c60:	14e00057 	bnez	a3,bfc01dc0 <_quick_sort+0x1350>
bfc01c64:	24630004 	addiu	v1,v1,4
bfc01c68:	24840001 	addiu	a0,a0,1
bfc01c6c:	8c6f0000 	lw	t7,0(v1)
bfc01c70:	00808821 	move	s1,a0
bfc01c74:	012f702a 	slt	t6,t1,t7
bfc01c78:	15c00051 	bnez	t6,bfc01dc0 <_quick_sort+0x1350>
bfc01c7c:	24630004 	addiu	v1,v1,4
bfc01c80:	24840001 	addiu	a0,a0,1
bfc01c84:	8c710000 	lw	s1,0(v1)
bfc01c88:	24630004 	addiu	v1,v1,4
bfc01c8c:	0131982a 	slt	s3,t1,s1
bfc01c90:	1660004b 	bnez	s3,bfc01dc0 <_quick_sort+0x1350>
bfc01c94:	00808821 	move	s1,a0
bfc01c98:	24840001 	addiu	a0,a0,1
bfc01c9c:	8c700000 	lw	s0,0(v1)
bfc01ca0:	00808821 	move	s1,a0
bfc01ca4:	0130502a 	slt	t2,t1,s0
bfc01ca8:	15400045 	bnez	t2,bfc01dc0 <_quick_sort+0x1350>
bfc01cac:	24630004 	addiu	v1,v1,4
bfc01cb0:	24840001 	addiu	a0,a0,1
bfc01cb4:	8c790000 	lw	t9,0(v1)
bfc01cb8:	00808821 	move	s1,a0
bfc01cbc:	0139c02a 	slt	t8,t1,t9
bfc01cc0:	1700003f 	bnez	t8,bfc01dc0 <_quick_sort+0x1350>
bfc01cc4:	24630004 	addiu	v1,v1,4
bfc01cc8:	24840001 	addiu	a0,a0,1
bfc01ccc:	8c620000 	lw	v0,0(v1)
bfc01cd0:	00808821 	move	s1,a0
bfc01cd4:	0122f82a 	slt	ra,t1,v0
bfc01cd8:	17e00039 	bnez	ra,bfc01dc0 <_quick_sort+0x1350>
bfc01cdc:	24630004 	addiu	v1,v1,4
bfc01ce0:	24840001 	addiu	a0,a0,1
bfc01ce4:	0088702a 	slt	t6,a0,t0
bfc01ce8:	00803821 	move	a3,a0
bfc01cec:	11c00030 	beqz	t6,bfc01db0 <_quick_sort+0x1340>
bfc01cf0:	00808821 	move	s1,a0
bfc01cf4:	8c700000 	lw	s0,0(v1)
bfc01cf8:	00000000 	nop
bfc01cfc:	0130782a 	slt	t7,t1,s0
bfc01d00:	15e0002f 	bnez	t7,bfc01dc0 <_quick_sort+0x1350>
bfc01d04:	00000000 	nop
bfc01d08:	8c6a0004 	lw	t2,4(v1)
bfc01d0c:	24840001 	addiu	a0,a0,1
bfc01d10:	012a982a 	slt	s3,t1,t2
bfc01d14:	24f10001 	addiu	s1,a3,1
bfc01d18:	16600029 	bnez	s3,bfc01dc0 <_quick_sort+0x1350>
bfc01d1c:	00805021 	move	t2,a0
bfc01d20:	8c6e0008 	lw	t6,8(v1)
bfc01d24:	24840001 	addiu	a0,a0,1
bfc01d28:	012e682a 	slt	t5,t1,t6
bfc01d2c:	15a00024 	bnez	t5,bfc01dc0 <_quick_sort+0x1350>
bfc01d30:	24f10002 	addiu	s1,a3,2
bfc01d34:	8c73000c 	lw	s3,12(v1)
bfc01d38:	25440002 	addiu	a0,t2,2
bfc01d3c:	0133782a 	slt	t7,t1,s3
bfc01d40:	15e0001f 	bnez	t7,bfc01dc0 <_quick_sort+0x1350>
bfc01d44:	24f10003 	addiu	s1,a3,3
bfc01d48:	8c710010 	lw	s1,16(v1)
bfc01d4c:	25440003 	addiu	a0,t2,3
bfc01d50:	0131802a 	slt	s0,t1,s1
bfc01d54:	1600001a 	bnez	s0,bfc01dc0 <_quick_sort+0x1350>
bfc01d58:	24f10004 	addiu	s1,a3,4
bfc01d5c:	8c790014 	lw	t9,20(v1)
bfc01d60:	25440004 	addiu	a0,t2,4
bfc01d64:	0139c02a 	slt	t8,t1,t9
bfc01d68:	17000015 	bnez	t8,bfc01dc0 <_quick_sort+0x1350>
bfc01d6c:	24f10005 	addiu	s1,a3,5
bfc01d70:	8c620018 	lw	v0,24(v1)
bfc01d74:	25440005 	addiu	a0,t2,5
bfc01d78:	0122f82a 	slt	ra,t1,v0
bfc01d7c:	17e00010 	bnez	ra,bfc01dc0 <_quick_sort+0x1350>
bfc01d80:	24f10006 	addiu	s1,a3,6
bfc01d84:	8c64001c 	lw	a0,28(v1)
bfc01d88:	24f10007 	addiu	s1,a3,7
bfc01d8c:	0124382a 	slt	a3,t1,a0
bfc01d90:	24630020 	addiu	v1,v1,32
bfc01d94:	14e0000a 	bnez	a3,bfc01dc0 <_quick_sort+0x1350>
bfc01d98:	25440006 	addiu	a0,t2,6
bfc01d9c:	25440007 	addiu	a0,t2,7
bfc01da0:	0088702a 	slt	t6,a0,t0
bfc01da4:	00803821 	move	a3,a0
bfc01da8:	15c0ffd2 	bnez	t6,bfc01cf4 <_quick_sort+0x1284>
bfc01dac:	00808821 	move	s1,a0
bfc01db0:	0bf00547 	j	bfc0151c <_quick_sort+0xaac>
bfc01db4:	00045080 	sll	t2,a0,0x2
	...
bfc01dc0:	00045080 	sll	t2,a0,0x2
bfc01dc4:	024a2021 	addu	a0,s2,t2
bfc01dc8:	8c8b0000 	lw	t3,0(a0)
bfc01dcc:	0bf004be 	j	bfc012f8 <_quick_sort+0x888>
bfc01dd0:	accb0000 	sw	t3,0(a2)
bfc01dd4:	8fa60024 	lw	a2,36(sp)
bfc01dd8:	26850001 	addiu	a1,s4,1
bfc01ddc:	00a6a02a 	slt	s4,a1,a2
bfc01de0:	1680fcab 	bnez	s4,bfc01090 <_quick_sort+0x620>
bfc01de4:	00056080 	sll	t4,a1,0x2
bfc01de8:	26a50001 	addiu	a1,s5,1
bfc01dec:	00b7a82a 	slt	s5,a1,s7
bfc01df0:	12a0fc92 	beqz	s5,bfc0103c <_quick_sort+0x5cc>
bfc01df4:	00056080 	sll	t4,a1,0x2
bfc01df8:	0bf003ec 	j	bfc00fb0 <_quick_sort+0x540>
bfc01dfc:	024c2021 	addu	a0,s2,t4
bfc01e00:	00163880 	sll	a3,s6,0x2
bfc01e04:	02477021 	addu	t6,s2,a3
bfc01e08:	8dc30000 	lw	v1,0(t6)
bfc01e0c:	0bf0032b 	j	bfc00cac <_quick_sort+0x23c>
bfc01e10:	ad030000 	sw	v1,0(t0)
bfc01e14:	8fb00018 	lw	s0,24(sp)
bfc01e18:	27c50001 	addiu	a1,s8,1
bfc01e1c:	00b0f02a 	slt	s8,a1,s0
bfc01e20:	13c0fc4e 	beqz	s8,bfc00f5c <_quick_sort+0x4ec>
bfc01e24:	00056080 	sll	t4,a1,0x2
bfc01e28:	0bf0030a 	j	bfc00c28 <_quick_sort+0x1b8>
bfc01e2c:	024cf021 	addu	s8,s2,t4
bfc01e30:	00153880 	sll	a3,s5,0x2
bfc01e34:	02475821 	addu	t3,s2,a3
bfc01e38:	8d690000 	lw	t1,0(t3)
bfc01e3c:	0bf003f0 	j	bfc00fc0 <_quick_sort+0x550>
bfc01e40:	ad090000 	sw	t1,0(t0)
	...

bfc01e50 <quick_sort>:
quick_sort():
bfc01e50:	27bdffe8 	addiu	sp,sp,-24
bfc01e54:	afbf0014 	sw	ra,20(sp)
bfc01e58:	afb00010 	sw	s0,16(sp)
bfc01e5c:	00a05821 	move	t3,a1
bfc01e60:	18a0006d 	blez	a1,bfc02018 <quick_sort+0x1c8>
bfc01e64:	00804021 	move	t0,a0
bfc01e68:	00054880 	sll	t1,a1,0x2
bfc01e6c:	8d030000 	lw	v1,0(t0)
bfc01e70:	2524fffc 	addiu	a0,t1,-4
bfc01e74:	3c0a8000 	lui	t2,0x8000
bfc01e78:	00041082 	srl	v0,a0,0x2
bfc01e7c:	24070004 	li	a3,4
bfc01e80:	ad432170 	sw	v1,8560(t2)
bfc01e84:	25502170 	addiu	s0,t2,8560
bfc01e88:	10e9005a 	beq	a3,t1,bfc01ff4 <quick_sort+0x1a4>
bfc01e8c:	30430007 	andi	v1,v0,0x7
bfc01e90:	1060002f 	beqz	v1,bfc01f50 <quick_sort+0x100>
bfc01e94:	24190001 	li	t9,1
bfc01e98:	10790027 	beq	v1,t9,bfc01f38 <quick_sort+0xe8>
bfc01e9c:	241f0002 	li	ra,2
bfc01ea0:	107f0020 	beq	v1,ra,bfc01f24 <quick_sort+0xd4>
bfc01ea4:	24040003 	li	a0,3
bfc01ea8:	10640019 	beq	v1,a0,bfc01f10 <quick_sort+0xc0>
bfc01eac:	00000000 	nop
bfc01eb0:	10670012 	beq	v1,a3,bfc01efc <quick_sort+0xac>
bfc01eb4:	24020005 	li	v0,5
bfc01eb8:	1062000b 	beq	v1,v0,bfc01ee8 <quick_sort+0x98>
bfc01ebc:	24050006 	li	a1,6
bfc01ec0:	10650005 	beq	v1,a1,bfc01ed8 <quick_sort+0x88>
bfc01ec4:	01076821 	addu	t5,t0,a3
bfc01ec8:	8d030004 	lw	v1,4(t0)
bfc01ecc:	24070008 	li	a3,8
bfc01ed0:	ae030004 	sw	v1,4(s0)
bfc01ed4:	01076821 	addu	t5,t0,a3
bfc01ed8:	8dac0000 	lw	t4,0(t5)
bfc01edc:	02073021 	addu	a2,s0,a3
bfc01ee0:	accc0000 	sw	t4,0(a2)
bfc01ee4:	24e70004 	addiu	a3,a3,4
bfc01ee8:	0107c021 	addu	t8,t0,a3
bfc01eec:	8f0f0000 	lw	t7,0(t8)
bfc01ef0:	02077021 	addu	t6,s0,a3
bfc01ef4:	adcf0000 	sw	t7,0(t6)
bfc01ef8:	24e70004 	addiu	a3,a3,4
bfc01efc:	01072021 	addu	a0,t0,a3
bfc01f00:	8c9f0000 	lw	ra,0(a0)
bfc01f04:	0207c821 	addu	t9,s0,a3
bfc01f08:	af3f0000 	sw	ra,0(t9)
bfc01f0c:	24e70004 	addiu	a3,a3,4
bfc01f10:	01071821 	addu	v1,t0,a3
bfc01f14:	8c650000 	lw	a1,0(v1)
bfc01f18:	02071021 	addu	v0,s0,a3
bfc01f1c:	ac450000 	sw	a1,0(v0)
bfc01f20:	24e70004 	addiu	a3,a3,4
bfc01f24:	01076821 	addu	t5,t0,a3
bfc01f28:	8dac0000 	lw	t4,0(t5)
bfc01f2c:	02073021 	addu	a2,s0,a3
bfc01f30:	accc0000 	sw	t4,0(a2)
bfc01f34:	24e70004 	addiu	a3,a3,4
bfc01f38:	0107c021 	addu	t8,t0,a3
bfc01f3c:	8f0f0000 	lw	t7,0(t8)
bfc01f40:	02077021 	addu	t6,s0,a3
bfc01f44:	24e70004 	addiu	a3,a3,4
bfc01f48:	10e9002a 	beq	a3,t1,bfc01ff4 <quick_sort+0x1a4>
bfc01f4c:	adcf0000 	sw	t7,0(t6)
bfc01f50:	0107c021 	addu	t8,t0,a3
bfc01f54:	8f0f0000 	lw	t7,0(t8)
bfc01f58:	24ec0004 	addiu	t4,a3,4
bfc01f5c:	02077021 	addu	t6,s0,a3
bfc01f60:	adcf0000 	sw	t7,0(t6)
bfc01f64:	010c6821 	addu	t5,t0,t4
bfc01f68:	8da60000 	lw	a2,0(t5)
bfc01f6c:	24e30008 	addiu	v1,a3,8
bfc01f70:	020c2821 	addu	a1,s0,t4
bfc01f74:	aca60000 	sw	a2,0(a1)
bfc01f78:	01031021 	addu	v0,t0,v1
bfc01f7c:	8c5f0000 	lw	ra,0(v0)
bfc01f80:	24f8000c 	addiu	t8,a3,12
bfc01f84:	02032021 	addu	a0,s0,v1
bfc01f88:	ac9f0000 	sw	ra,0(a0)
bfc01f8c:	0118c821 	addu	t9,t0,t8
bfc01f90:	8f2f0000 	lw	t7,0(t9)
bfc01f94:	24ec0010 	addiu	t4,a3,16
bfc01f98:	02187021 	addu	t6,s0,t8
bfc01f9c:	adcf0000 	sw	t7,0(t6)
bfc01fa0:	010c6821 	addu	t5,t0,t4
bfc01fa4:	8da50000 	lw	a1,0(t5)
bfc01fa8:	24e30014 	addiu	v1,a3,20
bfc01fac:	020c3021 	addu	a2,s0,t4
bfc01fb0:	acc50000 	sw	a1,0(a2)
bfc01fb4:	01031021 	addu	v0,t0,v1
bfc01fb8:	8c440000 	lw	a0,0(v0)
bfc01fbc:	24f80018 	addiu	t8,a3,24
bfc01fc0:	0203f821 	addu	ra,s0,v1
bfc01fc4:	afe40000 	sw	a0,0(ra)
bfc01fc8:	0118c821 	addu	t9,t0,t8
bfc01fcc:	8f2f0000 	lw	t7,0(t9)
bfc01fd0:	24ec001c 	addiu	t4,a3,28
bfc01fd4:	02187021 	addu	t6,s0,t8
bfc01fd8:	adcf0000 	sw	t7,0(t6)
bfc01fdc:	010c6821 	addu	t5,t0,t4
bfc01fe0:	8da60000 	lw	a2,0(t5)
bfc01fe4:	020c2821 	addu	a1,s0,t4
bfc01fe8:	24e70020 	addiu	a3,a3,32
bfc01fec:	14e9ffd8 	bne	a3,t1,bfc01f50 <quick_sort+0x100>
bfc01ff0:	aca60000 	sw	a2,0(a1)
bfc01ff4:	25442170 	addiu	a0,t2,8560
bfc01ff8:	2566ffff 	addiu	a2,t3,-1
bfc01ffc:	0ff0029c 	jal	bfc00a70 <_quick_sort>
bfc02000:	00002821 	move	a1,zero
bfc02004:	8fbf0014 	lw	ra,20(sp)
bfc02008:	02001021 	move	v0,s0
bfc0200c:	8fb00010 	lw	s0,16(sp)
bfc02010:	03e00008 	jr	ra
bfc02014:	27bd0018 	addiu	sp,sp,24
bfc02018:	3c0a8000 	lui	t2,0x8000
bfc0201c:	0bf007fd 	j	bfc01ff4 <quick_sort+0x1a4>
bfc02020:	25502170 	addiu	s0,t2,8560
	...

bfc02030 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc02030:	27bdffc8 	addiu	sp,sp,-56
bfc02034:	afb30024 	sw	s3,36(sp)
bfc02038:	afbf0034 	sw	ra,52(sp)
bfc0203c:	afb60030 	sw	s6,48(sp)
bfc02040:	afb5002c 	sw	s5,44(sp)
bfc02044:	afb40028 	sw	s4,40(sp)
bfc02048:	afb20020 	sw	s2,32(sp)
bfc0204c:	afb1001c 	sw	s1,28(sp)
bfc02050:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc02054:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc02058:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc0205c:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc02060:	afa5003c 	sw	a1,60(sp)
bfc02064:	afa60040 	sw	a2,64(sp)
bfc02068:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc0206c:	12000013 	beqz	s0,bfc020bc <printf+0x8c>
bfc02070:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc02074:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc02078:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0207c:	24560060 	addiu	s6,v0,96
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc02080:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc02084:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc02088:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc0208c:	12140016 	beq	s0,s4,bfc020e8 <printf+0xb8>
bfc02090:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc02094:	1215002f 	beq	s0,s5,bfc02154 <printf+0x124>
bfc02098:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc0209c:	0ff008a5 	jal	bfc02294 <putchar>
bfc020a0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc020a4:	26310001 	addiu	s1,s1,1
bfc020a8:	02711021 	addu	v0,s3,s1
bfc020ac:	80500000 	lb	s0,0(v0)
bfc020b0:	00000000 	nop
bfc020b4:	1600fff5 	bnez	s0,bfc0208c <printf+0x5c>
bfc020b8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc020bc:	8fbf0034 	lw	ra,52(sp)
bfc020c0:	00001021 	move	v0,zero
bfc020c4:	8fb60030 	lw	s6,48(sp)
bfc020c8:	8fb5002c 	lw	s5,44(sp)
bfc020cc:	8fb40028 	lw	s4,40(sp)
bfc020d0:	8fb30024 	lw	s3,36(sp)
bfc020d4:	8fb20020 	lw	s2,32(sp)
bfc020d8:	8fb1001c 	lw	s1,28(sp)
bfc020dc:	8fb00018 	lw	s0,24(sp)
bfc020e0:	03e00008 	jr	ra
bfc020e4:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc020e8:	80440001 	lb	a0,1(v0)
bfc020ec:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc020f0:	2482ffdb 	addiu	v0,a0,-37
bfc020f4:	304200ff 	andi	v0,v0,0xff
bfc020f8:	2c430054 	sltiu	v1,v0,84
bfc020fc:	14600005 	bnez	v1,bfc02114 <printf+0xe4>
bfc02100:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc02104:	0ff008a5 	jal	bfc02294 <putchar>
bfc02108:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc0210c:	0bf0082a 	j	bfc020a8 <printf+0x78>
bfc02110:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc02114:	02c21021 	addu	v0,s6,v0
bfc02118:	8c430000 	lw	v1,0(v0)
bfc0211c:	00000000 	nop
bfc02120:	00600008 	jr	v1
bfc02124:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc02128:	26310001 	addiu	s1,s1,1
bfc0212c:	02711021 	addu	v0,s3,s1
bfc02130:	80440001 	lb	a0,1(v0)
bfc02134:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02138:	2482ffcf 	addiu	v0,a0,-49
bfc0213c:	304200ff 	andi	v0,v0,0xff
bfc02140:	2c420009 	sltiu	v0,v0,9
bfc02144:	1440003f 	bnez	v0,bfc02244 <printf+0x214>
bfc02148:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0214c:	0bf0083d 	j	bfc020f4 <printf+0xc4>
bfc02150:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc02154:	0ff008a5 	jal	bfc02294 <putchar>
bfc02158:	2404000d 	li	a0,13
bfc0215c:	0bf00827 	j	bfc0209c <printf+0x6c>
bfc02160:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc02164:	8e440000 	lw	a0,0(s2)
bfc02168:	2406000a 	li	a2,10
bfc0216c:	0ff008e0 	jal	bfc02380 <printbase>
bfc02170:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc02174:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc02178:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc0217c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc02180:	8e440000 	lw	a0,0(s2)
bfc02184:	0ff008b0 	jal	bfc022c0 <putstring>
bfc02188:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc0218c:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc02190:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc02194:	8e440000 	lw	a0,0(s2)
bfc02198:	24060010 	li	a2,16
bfc0219c:	0ff008e0 	jal	bfc02380 <printbase>
bfc021a0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc021a4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc021a8:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc021ac:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc021b0:	8e440000 	lw	a0,0(s2)
bfc021b4:	24060008 	li	a2,8
bfc021b8:	0ff008e0 	jal	bfc02380 <printbase>
bfc021bc:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc021c0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc021c4:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc021c8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc021cc:	8e440000 	lw	a0,0(s2)
bfc021d0:	2406000a 	li	a2,10
bfc021d4:	0ff008e0 	jal	bfc02380 <printbase>
bfc021d8:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc021dc:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc021e0:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc021e4:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc021e8:	8e440000 	lw	a0,0(s2)
bfc021ec:	2406000a 	li	a2,10
bfc021f0:	0ff008e0 	jal	bfc02380 <printbase>
bfc021f4:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc021f8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc021fc:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc02200:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc02204:	8e440000 	lw	a0,0(s2)
bfc02208:	0ff008a5 	jal	bfc02294 <putchar>
bfc0220c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc02210:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc02214:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc02218:	8e440000 	lw	a0,0(s2)
bfc0221c:	24060002 	li	a2,2
bfc02220:	0ff008e0 	jal	bfc02380 <printbase>
bfc02224:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc02228:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc0222c:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc02230:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc02234:	0ff008a5 	jal	bfc02294 <putchar>
bfc02238:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc0223c:	0bf00829 	j	bfc020a4 <printf+0x74>
bfc02240:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02244:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc02248:	000510c0 	sll	v0,a1,0x3
bfc0224c:	00051840 	sll	v1,a1,0x1
bfc02250:	00621821 	addu	v1,v1,v0
bfc02254:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02258:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc0225c:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02260:	2482ffcf 	addiu	v0,a0,-49
bfc02264:	304200ff 	andi	v0,v0,0xff
bfc02268:	2c420009 	sltiu	v0,v0,9
bfc0226c:	26310001 	addiu	s1,s1,1
bfc02270:	1040ff9f 	beqz	v0,bfc020f0 <printf+0xc0>
bfc02274:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc02278:	0bf00893 	j	bfc0224c <printf+0x21c>
bfc0227c:	000510c0 	sll	v0,a1,0x3

bfc02280 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc02280:	3c018000 	lui	at,0x8000
bfc02284:	03e00008 	jr	ra
bfc02288:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc0228c:	03e00008 	jr	ra
bfc02290:	00000000 	nop

bfc02294 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc02294:	27bdffe8 	addiu	sp,sp,-24
bfc02298:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc0229c:	0ff008a0 	jal	bfc02280 <tgt_putchar>
bfc022a0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc022a4:	8fbf0014 	lw	ra,20(sp)
bfc022a8:	00001021 	move	v0,zero
bfc022ac:	03e00008 	jr	ra
bfc022b0:	27bd0018 	addiu	sp,sp,24
	...

bfc022c0 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc022c0:	27bdffe0 	addiu	sp,sp,-32
bfc022c4:	afb10014 	sw	s1,20(sp)
bfc022c8:	afbf001c 	sw	ra,28(sp)
bfc022cc:	afb20018 	sw	s2,24(sp)
bfc022d0:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc022d4:	80900000 	lb	s0,0(a0)
bfc022d8:	00000000 	nop
bfc022dc:	12000013 	beqz	s0,bfc0232c <putstring+0x6c>
bfc022e0:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc022e4:	0bf008c1 	j	bfc02304 <putstring+0x44>
bfc022e8:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc022ec:	0ff008a5 	jal	bfc02294 <putchar>
bfc022f0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc022f4:	82300000 	lb	s0,0(s1)
bfc022f8:	00000000 	nop
bfc022fc:	1200000b 	beqz	s0,bfc0232c <putstring+0x6c>
bfc02300:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc02304:	1612fff9 	bne	s0,s2,bfc022ec <putstring+0x2c>
bfc02308:	26310001 	addiu	s1,s1,1
bfc0230c:	0ff008a5 	jal	bfc02294 <putchar>
bfc02310:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc02314:	0ff008a5 	jal	bfc02294 <putchar>
bfc02318:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc0231c:	82300000 	lb	s0,0(s1)
bfc02320:	00000000 	nop
bfc02324:	1600fff7 	bnez	s0,bfc02304 <putstring+0x44>
bfc02328:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc0232c:	8fbf001c 	lw	ra,28(sp)
bfc02330:	00001021 	move	v0,zero
bfc02334:	8fb20018 	lw	s2,24(sp)
bfc02338:	8fb10014 	lw	s1,20(sp)
bfc0233c:	8fb00010 	lw	s0,16(sp)
bfc02340:	03e00008 	jr	ra
bfc02344:	27bd0020 	addiu	sp,sp,32

bfc02348 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc02348:	27bdffe8 	addiu	sp,sp,-24
bfc0234c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc02350:	0ff008b0 	jal	bfc022c0 <putstring>
bfc02354:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc02358:	0ff008a5 	jal	bfc02294 <putchar>
bfc0235c:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc02360:	0ff008a5 	jal	bfc02294 <putchar>
bfc02364:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc02368:	8fbf0014 	lw	ra,20(sp)
bfc0236c:	00001021 	move	v0,zero
bfc02370:	03e00008 	jr	ra
bfc02374:	27bd0018 	addiu	sp,sp,24
	...

bfc02380 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc02380:	27bdff98 	addiu	sp,sp,-104
bfc02384:	afb30060 	sw	s3,96(sp)
bfc02388:	afb2005c 	sw	s2,92(sp)
bfc0238c:	afbf0064 	sw	ra,100(sp)
bfc02390:	afb10058 	sw	s1,88(sp)
bfc02394:	afb00054 	sw	s0,84(sp)
bfc02398:	00801821 	move	v1,a0
bfc0239c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc023a0:	10e00003 	beqz	a3,bfc023b0 <printbase+0x30>
bfc023a4:	00c09021 	move	s2,a2
bfc023a8:	0480002f 	bltz	a0,bfc02468 <printbase+0xe8>
bfc023ac:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc023b0:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc023b4:	1200000c 	beqz	s0,bfc023e8 <printbase+0x68>
bfc023b8:	00008821 	move	s1,zero
bfc023bc:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc023c0:	16400002 	bnez	s2,bfc023cc <printbase+0x4c>
bfc023c4:	0212001b 	divu	zero,s0,s2
bfc023c8:	0007000d 	break	0x7
bfc023cc:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc023d0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc023d4:	00001010 	mfhi	v0
bfc023d8:	a0820000 	sb	v0,0(a0)
bfc023dc:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc023e0:	1460fff7 	bnez	v1,bfc023c0 <printbase+0x40>
bfc023e4:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc023e8:	0233102a 	slt	v0,s1,s3
bfc023ec:	10400002 	beqz	v0,bfc023f8 <printbase+0x78>
bfc023f0:	02201821 	move	v1,s1
bfc023f4:	02601821 	move	v1,s3
bfc023f8:	1060000c 	beqz	v1,bfc0242c <printbase+0xac>
bfc023fc:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc02400:	27a20010 	addiu	v0,sp,16
bfc02404:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc02408:	26020001 	addiu	v0,s0,1
bfc0240c:	0222102a 	slt	v0,s1,v0
bfc02410:	1040000e 	beqz	v0,bfc0244c <printbase+0xcc>
bfc02414:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02418:	02009821 	move	s3,s0
bfc0241c:	0ff008a5 	jal	bfc02294 <putchar>
bfc02420:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc02424:	1660fff8 	bnez	s3,bfc02408 <printbase+0x88>
bfc02428:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc0242c:	8fbf0064 	lw	ra,100(sp)
bfc02430:	00001021 	move	v0,zero
bfc02434:	8fb30060 	lw	s3,96(sp)
bfc02438:	8fb2005c 	lw	s2,92(sp)
bfc0243c:	8fb10058 	lw	s1,88(sp)
bfc02440:	8fb00054 	lw	s0,84(sp)
bfc02444:	03e00008 	jr	ra
bfc02448:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc0244c:	82440000 	lb	a0,0(s2)
bfc02450:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02454:	2882000a 	slti	v0,a0,10
bfc02458:	14400007 	bnez	v0,bfc02478 <printbase+0xf8>
bfc0245c:	02009821 	move	s3,s0
bfc02460:	0bf00907 	j	bfc0241c <printbase+0x9c>
bfc02464:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc02468:	0ff008a5 	jal	bfc02294 <putchar>
bfc0246c:	00038023 	negu	s0,v1
bfc02470:	0bf008ed 	j	bfc023b4 <printbase+0x34>
bfc02474:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02478:	0bf00906 	j	bfc02418 <printbase+0x98>
bfc0247c:	24840030 	addiu	a0,a0,48

bfc02480 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc02480:	3c01bfd0 	lui	at,0xbfd0
bfc02484:	3421e000 	ori	at,at,0xe000
bfc02488:	8c220000 	lw	v0,0(at)
bfc0248c:	03e00008 	jr	ra
bfc02490:	00000000 	nop

bfc02494 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc02494:	3c01bfd0 	lui	at,0xbfd0
bfc02498:	3421e000 	ori	at,at,0xe000
bfc0249c:	8c220000 	lw	v0,0(at)
bfc024a0:	03e00008 	jr	ra
bfc024a4:	00000000 	nop

bfc024a8 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc024a8:	3c01bfd0 	lui	at,0xbfd0
bfc024ac:	3421e000 	ori	at,at,0xe000
bfc024b0:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc024b4:	03e00008 	jr	ra
bfc024b8:	00021040 	sll	v0,v0,0x1

bfc024bc <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc024bc:	3c01bfd0 	lui	at,0xbfd0
bfc024c0:	3421e000 	ori	at,at,0xe000
bfc024c4:	8c220000 	lw	v0,0(at)
bfc024c8:	03e00008 	jr	ra
bfc024cc:	00000000 	nop

bfc024d0 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc024d0:	27bdffe8 	addiu	sp,sp,-24
bfc024d4:	afbf0014 	sw	ra,20(sp)
bfc024d8:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc024dc:	3c01bfd0 	lui	at,0xbfd0
bfc024e0:	3421e000 	ori	at,at,0xe000
bfc024e4:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc024e8:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc024ec:	14400002 	bnez	v0,bfc024f8 <clock_gettime+0x28>
bfc024f0:	0062001b 	divu	zero,v1,v0
bfc024f4:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc024f8:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc024fc:	3c073b9a 	lui	a3,0x3b9a
bfc02500:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc02504:	3c048000 	lui	a0,0x8000
bfc02508:	248401b0 	addiu	a0,a0,432
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0250c:	00003012 	mflo	a2
bfc02510:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc02514:	14400002 	bnez	v0,bfc02520 <clock_gettime+0x50>
bfc02518:	0062001b 	divu	zero,v1,v0
bfc0251c:	0007000d 	break	0x7
bfc02520:	00002810 	mfhi	a1
bfc02524:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc02528:	14400002 	bnez	v0,bfc02534 <clock_gettime+0x64>
bfc0252c:	00c2001b 	divu	zero,a2,v0
bfc02530:	0007000d 	break	0x7
bfc02534:	00005010 	mfhi	t2
bfc02538:	ad2a0008 	sw	t2,8(t1)
bfc0253c:	00004012 	mflo	t0
bfc02540:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc02544:	14e00002 	bnez	a3,bfc02550 <clock_gettime+0x80>
bfc02548:	00c7001b 	divu	zero,a2,a3
bfc0254c:	0007000d 	break	0x7
bfc02550:	00003012 	mflo	a2
bfc02554:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc02558:	14400002 	bnez	v0,bfc02564 <clock_gettime+0x94>
bfc0255c:	0102001b 	divu	zero,t0,v0
bfc02560:	0007000d 	break	0x7
bfc02564:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc02568:	0ff0080c 	jal	bfc02030 <printf>
bfc0256c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc02570:	8fbf0014 	lw	ra,20(sp)
bfc02574:	00001021 	move	v0,zero
bfc02578:	03e00008 	jr	ra
bfc0257c:	27bd0018 	addiu	sp,sp,24

bfc02580 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc02580:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc02584:	03e00008 	jr	ra
bfc02588:	00000000 	nop

bfc0258c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0258c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc02590:	03e00008 	jr	ra
bfc02594:	00000000 	nop

bfc02598 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc02598:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc0259c:	27bdffe8 	addiu	sp,sp,-24
bfc025a0:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc025a4:	0ff0080c 	jal	bfc02030 <printf>
bfc025a8:	248401c4 	addiu	a0,a0,452
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc025ac:	3c048000 	lui	a0,0x8000
bfc025b0:	248401e0 	addiu	a0,a0,480
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc025b4:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc025b8:	0ff0080c 	jal	bfc02030 <printf>
bfc025bc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc025c0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc025c4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc025c8:	248401f0 	addiu	a0,a0,496
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc025cc:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc025d0:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc025d4:	0bf0080c 	j	bfc02030 <printf>
bfc025d8:	00000000 	nop
bfc025dc:	00000000 	nop
