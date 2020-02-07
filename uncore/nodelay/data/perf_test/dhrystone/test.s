
obj/dhrystone/main.elf:     file format elf32-tradlittlemips
obj/dhrystone/main.elf


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
bfc00010:	27bd477c 	addiu	sp,sp,18300
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c87a0 	addiu	gp,gp,-30816
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
bfc00380:	0ff00666 	jal	bfc01998 <exception>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:69
bfc00384:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:70
bfc00388:	0bf00009 	j	bfc00024 <exit>
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:71
bfc0038c:	00000000 	nop

bfc00390 <shell>:
shell():
bfc00390:	3c048000 	lui	a0,0x8000
bfc00394:	27bdffe0 	addiu	sp,sp,-32
bfc00398:	24840000 	addiu	a0,a0,0
bfc0039c:	afbf001c 	sw	ra,28(sp)
bfc003a0:	afb10018 	sw	s1,24(sp)
bfc003a4:	0ff005c2 	jal	bfc01708 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff00625 	jal	bfc01894 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	24040064 	li	a0,100
bfc003b8:	0ff001b0 	jal	bfc006c0 <dhrystone>
bfc003bc:	00408821 	move	s1,v0
bfc003c0:	0ff00625 	jal	bfc01894 <get_count>
bfc003c4:	00408021 	move	s0,v0
bfc003c8:	12000019 	beqz	s0,bfc00430 <shell+0xa0>
bfc003cc:	00518823 	subu	s1,v0,s1
bfc003d0:	3c188000 	lui	t8,0x8000
bfc003d4:	0ff005c2 	jal	bfc01708 <puts>
bfc003d8:	27040028 	addiu	a0,t8,40
bfc003dc:	3c0fbfd0 	lui	t7,0xbfd0
bfc003e0:	3c1fbfd0 	lui	ra,0xbfd0
bfc003e4:	3c108000 	lui	s0,0x8000
bfc003e8:	37f9f010 	ori	t9,ra,0xf010
bfc003ec:	35eaf000 	ori	t2,t7,0xf000
bfc003f0:	35eef008 	ori	t6,t7,0xf008
bfc003f4:	35ecf004 	ori	t4,t7,0xf004
bfc003f8:	240d0001 	li	t5,1
bfc003fc:	240b0002 	li	t3,2
bfc00400:	adcd0000 	sw	t5,0(t6)
bfc00404:	2604003c 	addiu	a0,s0,60
bfc00408:	ad8b0000 	sw	t3,0(t4)
bfc0040c:	02202821 	move	a1,s1
bfc00410:	ad400000 	sw	zero,0(t2)
bfc00414:	8fbf001c 	lw	ra,28(sp)
bfc00418:	af310000 	sw	s1,0(t9)
bfc0041c:	8fb00014 	lw	s0,20(sp)
bfc00420:	8fb10018 	lw	s1,24(sp)
bfc00424:	0bf004fc 	j	bfc013f0 <printf>
bfc00428:	27bd0020 	addiu	sp,sp,32
bfc0042c:	00000000 	nop
bfc00430:	3c098000 	lui	t1,0x8000
bfc00434:	0ff005c2 	jal	bfc01708 <puts>
bfc00438:	25240018 	addiu	a0,t1,24
bfc0043c:	3c08bfd0 	lui	t0,0xbfd0
bfc00440:	3c1fbfd0 	lui	ra,0xbfd0
bfc00444:	24070001 	li	a3,1
bfc00448:	3505f008 	ori	a1,t0,0xf008
bfc0044c:	3c108000 	lui	s0,0x8000
bfc00450:	37f9f010 	ori	t9,ra,0xf010
bfc00454:	3506f000 	ori	a2,t0,0xf000
bfc00458:	3503f004 	ori	v1,t0,0xf004
bfc0045c:	3402ffff 	li	v0,0xffff
bfc00460:	ac670000 	sw	a3,0(v1)
bfc00464:	2604003c 	addiu	a0,s0,60
bfc00468:	acc20000 	sw	v0,0(a2)
bfc0046c:	8fbf001c 	lw	ra,28(sp)
bfc00470:	aca70000 	sw	a3,0(a1)
bfc00474:	8fb00014 	lw	s0,20(sp)
bfc00478:	02202821 	move	a1,s1
bfc0047c:	af310000 	sw	s1,0(t9)
bfc00480:	8fb10018 	lw	s1,24(sp)
bfc00484:	0bf004fc 	j	bfc013f0 <printf>
bfc00488:	27bd0020 	addiu	sp,sp,32
bfc0048c:	00000000 	nop

bfc00490 <Proc_2>:
Proc_2():
bfc00490:	83838030 	lb	v1,-32720(gp)
bfc00494:	24020041 	li	v0,65
bfc00498:	8c850000 	lw	a1,0(a0)
bfc0049c:	10620004 	beq	v1,v0,bfc004b0 <Proc_2+0x20>
bfc004a0:	00000000 	nop
bfc004a4:	03e00008 	jr	ra
bfc004a8:	00000000 	nop
bfc004ac:	00000000 	nop
bfc004b0:	8f87802c 	lw	a3,-32724(gp)
bfc004b4:	00000000 	nop
bfc004b8:	00a73023 	subu	a2,a1,a3
bfc004bc:	24c50009 	addiu	a1,a2,9
bfc004c0:	03e00008 	jr	ra
bfc004c4:	ac850000 	sw	a1,0(a0)
	...

bfc004d0 <Proc_4>:
Proc_4():
bfc004d0:	83878030 	lb	a3,-32720(gp)
bfc004d4:	8f858038 	lw	a1,-32712(gp)
bfc004d8:	38e60041 	xori	a2,a3,0x41
bfc004dc:	2cc20001 	sltiu	v0,a2,1
bfc004e0:	00a21825 	or	v1,a1,v0
bfc004e4:	24040042 	li	a0,66
bfc004e8:	af838038 	sw	v1,-32712(gp)
bfc004ec:	03e00008 	jr	ra
bfc004f0:	a3848031 	sb	a0,-32719(gp)
	...

bfc00500 <Proc_5>:
Proc_5():
bfc00500:	24020041 	li	v0,65
bfc00504:	a3828030 	sb	v0,-32720(gp)
bfc00508:	03e00008 	jr	ra
bfc0050c:	af808038 	sw	zero,-32712(gp)

bfc00510 <Proc_3>:
Proc_3():
bfc00510:	8f828034 	lw	v0,-32716(gp)
bfc00514:	00000000 	nop
bfc00518:	10400005 	beqz	v0,bfc00530 <Proc_3+0x20>
bfc0051c:	00000000 	nop
bfc00520:	8c420000 	lw	v0,0(v0)
bfc00524:	00000000 	nop
bfc00528:	ac820000 	sw	v0,0(a0)
bfc0052c:	8f828034 	lw	v0,-32716(gp)
bfc00530:	8f85802c 	lw	a1,-32724(gp)
bfc00534:	2446000c 	addiu	a2,v0,12
bfc00538:	0bf00478 	j	bfc011e0 <Proc_7>
bfc0053c:	2404000a 	li	a0,10

bfc00540 <Proc_1>:
Proc_1():
bfc00540:	8f8b8034 	lw	t3,-32716(gp)
bfc00544:	27bdffe0 	addiu	sp,sp,-32
bfc00548:	afb10018 	sw	s1,24(sp)
bfc0054c:	afb00014 	sw	s0,20(sp)
bfc00550:	afbf001c 	sw	ra,28(sp)
bfc00554:	8c900000 	lw	s0,0(a0)
bfc00558:	8d630000 	lw	v1,0(t3)
bfc0055c:	8d62000c 	lw	v0,12(t3)
bfc00560:	8d7f0008 	lw	ra,8(t3)
bfc00564:	00808821 	move	s1,a0
bfc00568:	8d640004 	lw	a0,4(t3)
bfc0056c:	25790010 	addiu	t9,t3,16
bfc00570:	ae030000 	sw	v1,0(s0)
bfc00574:	ae02000c 	sw	v0,12(s0)
bfc00578:	ae040004 	sw	a0,4(s0)
bfc0057c:	ae1f0008 	sw	ra,8(s0)
bfc00580:	8f2f000c 	lw	t7,12(t9)
bfc00584:	8d780010 	lw	t8,16(t3)
bfc00588:	8f2e0004 	lw	t6,4(t9)
bfc0058c:	8f2d0008 	lw	t5,8(t9)
bfc00590:	260c0010 	addiu	t4,s0,16
bfc00594:	ae180010 	sw	t8,16(s0)
bfc00598:	256a0020 	addiu	t2,t3,32
bfc0059c:	ad8f000c 	sw	t7,12(t4)
bfc005a0:	ad8e0004 	sw	t6,4(t4)
bfc005a4:	ad8d0008 	sw	t5,8(t4)
bfc005a8:	8d690020 	lw	t1,32(t3)
bfc005ac:	8d46000c 	lw	a2,12(t2)
bfc005b0:	8d450004 	lw	a1,4(t2)
bfc005b4:	8d470008 	lw	a3,8(t2)
bfc005b8:	26080020 	addiu	t0,s0,32
bfc005bc:	ae090020 	sw	t1,32(s0)
bfc005c0:	ad06000c 	sw	a2,12(t0)
bfc005c4:	ad050004 	sw	a1,4(t0)
bfc005c8:	ad070008 	sw	a3,8(t0)
bfc005cc:	8e220000 	lw	v0,0(s1)
bfc005d0:	24040005 	li	a0,5
bfc005d4:	ae24000c 	sw	a0,12(s1)
bfc005d8:	ae020000 	sw	v0,0(s0)
bfc005dc:	ae04000c 	sw	a0,12(s0)
bfc005e0:	0ff00144 	jal	bfc00510 <Proc_3>
bfc005e4:	02002021 	move	a0,s0
bfc005e8:	8e030004 	lw	v1,4(s0)
bfc005ec:	00000000 	nop
bfc005f0:	10600023 	beqz	v1,bfc00680 <Proc_1+0x140>
bfc005f4:	262e0010 	addiu	t6,s1,16
bfc005f8:	8e2c0000 	lw	t4,0(s1)
bfc005fc:	00000000 	nop
bfc00600:	8d820000 	lw	v0,0(t4)
bfc00604:	8d840004 	lw	a0,4(t4)
bfc00608:	8d880008 	lw	t0,8(t4)
bfc0060c:	8d83000c 	lw	v1,12(t4)
bfc00610:	259f0010 	addiu	ra,t4,16
bfc00614:	ae220000 	sw	v0,0(s1)
bfc00618:	ae240004 	sw	a0,4(s1)
bfc0061c:	ae280008 	sw	t0,8(s1)
bfc00620:	ae23000c 	sw	v1,12(s1)
bfc00624:	8ff8000c 	lw	t8,12(ra)
bfc00628:	8fef0004 	lw	t7,4(ra)
bfc0062c:	8fed0008 	lw	t5,8(ra)
bfc00630:	8d990010 	lw	t9,16(t4)
bfc00634:	258b0020 	addiu	t3,t4,32
bfc00638:	ae390010 	sw	t9,16(s1)
bfc0063c:	add8000c 	sw	t8,12(t6)
bfc00640:	adcf0004 	sw	t7,4(t6)
bfc00644:	adcd0008 	sw	t5,8(t6)
bfc00648:	8d8a0020 	lw	t2,32(t4)
bfc0064c:	8d65000c 	lw	a1,12(t3)
bfc00650:	8d660004 	lw	a2,4(t3)
bfc00654:	8d690008 	lw	t1,8(t3)
bfc00658:	26300020 	addiu	s0,s1,32
bfc0065c:	ae2a0020 	sw	t2,32(s1)
bfc00660:	ae05000c 	sw	a1,12(s0)
bfc00664:	ae060004 	sw	a2,4(s0)
bfc00668:	ae090008 	sw	t1,8(s0)
bfc0066c:	8fbf001c 	lw	ra,28(sp)
bfc00670:	8fb10018 	lw	s1,24(sp)
bfc00674:	8fb00014 	lw	s0,20(sp)
bfc00678:	03e00008 	jr	ra
bfc0067c:	27bd0020 	addiu	sp,sp,32
bfc00680:	8e240008 	lw	a0,8(s1)
bfc00684:	24070006 	li	a3,6
bfc00688:	26050008 	addiu	a1,s0,8
bfc0068c:	0ff00458 	jal	bfc01160 <Proc_6>
bfc00690:	ae07000c 	sw	a3,12(s0)
bfc00694:	8f888034 	lw	t0,-32716(gp)
bfc00698:	8e04000c 	lw	a0,12(s0)
bfc0069c:	8d110000 	lw	s1,0(t0)
bfc006a0:	2606000c 	addiu	a2,s0,12
bfc006a4:	ae110000 	sw	s1,0(s0)
bfc006a8:	8fbf001c 	lw	ra,28(sp)
bfc006ac:	8fb10018 	lw	s1,24(sp)
bfc006b0:	8fb00014 	lw	s0,20(sp)
bfc006b4:	2405000a 	li	a1,10
bfc006b8:	0bf00478 	j	bfc011e0 <Proc_7>
bfc006bc:	27bd0020 	addiu	sp,sp,32

bfc006c0 <dhrystone>:
dhrystone():
bfc006c0:	27bdff68 	addiu	sp,sp,-152
bfc006c4:	afb40080 	sw	s4,128(sp)
bfc006c8:	afa40098 	sw	a0,152(sp)
bfc006cc:	3c148000 	lui	s4,0x8000
bfc006d0:	2404000a 	li	a0,10
bfc006d4:	afbf0094 	sw	ra,148(sp)
bfc006d8:	afbe0090 	sw	s8,144(sp)
bfc006dc:	afb7008c 	sw	s7,140(sp)
bfc006e0:	afb60088 	sw	s6,136(sp)
bfc006e4:	afb50084 	sw	s5,132(sp)
bfc006e8:	afb3007c 	sw	s3,124(sp)
bfc006ec:	afb20078 	sw	s2,120(sp)
bfc006f0:	afb10074 	sw	s1,116(sp)
bfc006f4:	0ff00595 	jal	bfc01654 <putchar>
bfc006f8:	afb00070 	sw	s0,112(sp)
bfc006fc:	0ff005c2 	jal	bfc01708 <puts>
bfc00700:	2684005c 	addiu	a0,s4,92
bfc00704:	0ff00595 	jal	bfc01654 <putchar>
bfc00708:	2404000a 	li	a0,10
bfc0070c:	3c158000 	lui	s5,0x8000
bfc00710:	3c0c8000 	lui	t4,0x8000
bfc00714:	26ab008c 	addiu	t3,s5,140
bfc00718:	3c0a8000 	lui	t2,0x8000
bfc0071c:	259500ac 	addiu	s5,t4,172
bfc00720:	3c078000 	lui	a3,0x8000
bfc00724:	3c088000 	lui	t0,0x8000
bfc00728:	8d6d000c 	lw	t5,12(t3)
bfc0072c:	8d6e0010 	lw	t6,16(t3)
bfc00730:	8d6f0014 	lw	t7,20(t3)
bfc00734:	8d790018 	lw	t9,24(t3)
bfc00738:	9170001e 	lbu	s0,30(t3)
bfc0073c:	8d650004 	lw	a1,4(t3)
bfc00740:	8d7e0008 	lw	s8,8(t3)
bfc00744:	9571001c 	lhu	s1,28(t3)
bfc00748:	8eb20004 	lw	s2,4(s5)
bfc0074c:	8d1800ac 	lw	t8,172(t0)
bfc00750:	8ce9008c 	lw	t1,140(a3)
bfc00754:	25562f20 	addiu	s6,t2,12064
bfc00758:	3c068000 	lui	a2,0x8000
bfc0075c:	8eb30008 	lw	s3,8(s5)
bfc00760:	26c40010 	addiu	a0,s6,16
bfc00764:	24d72ef0 	addiu	s7,a2,12016
bfc00768:	24030028 	li	v1,40
bfc0076c:	24020002 	li	v0,2
bfc00770:	aec90010 	sw	t1,16(s6)
bfc00774:	aec3000c 	sw	v1,12(s6)
bfc00778:	ac8d000c 	sw	t5,12(a0)
bfc0077c:	ac8e0010 	sw	t6,16(a0)
bfc00780:	ac8f0014 	sw	t7,20(a0)
bfc00784:	ac990018 	sw	t9,24(a0)
bfc00788:	a090001e 	sb	s0,30(a0)
bfc0078c:	ac850004 	sw	a1,4(a0)
bfc00790:	aec20008 	sw	v0,8(s6)
bfc00794:	ac9e0008 	sw	s8,8(a0)
bfc00798:	a491001c 	sh	s1,28(a0)
bfc0079c:	ad572f20 	sw	s7,12064(t2)
bfc007a0:	afb8001c 	sw	t8,28(sp)
bfc007a4:	afb20020 	sw	s2,32(sp)
bfc007a8:	af978028 	sw	s7,-32728(gp)
bfc007ac:	af968034 	sw	s6,-32716(gp)
bfc007b0:	aec00004 	sw	zero,4(s6)
bfc007b4:	3c108000 	lui	s0,0x8000
bfc007b8:	8eac000c 	lw	t4,12(s5)
bfc007bc:	8eab0010 	lw	t3,16(s5)
bfc007c0:	8ea70014 	lw	a3,20(s5)
bfc007c4:	8ea80018 	lw	t0,24(s5)
bfc007c8:	260507e0 	addiu	a1,s0,2016
bfc007cc:	afb30024 	sw	s3,36(sp)
bfc007d0:	2402000a 	li	v0,10
bfc007d4:	92a9001e 	lbu	t1,30(s5)
bfc007d8:	96aa001c 	lhu	t2,28(s5)
bfc007dc:	2404000a 	li	a0,10
bfc007e0:	aca2065c 	sw	v0,1628(a1)
bfc007e4:	afac0028 	sw	t4,40(sp)
bfc007e8:	afab002c 	sw	t3,44(sp)
bfc007ec:	afa70030 	sw	a3,48(sp)
bfc007f0:	afa80034 	sw	t0,52(sp)
bfc007f4:	a7aa0038 	sh	t2,56(sp)
bfc007f8:	0ff00595 	jal	bfc01654 <putchar>
bfc007fc:	a3a9003a 	sb	t1,58(sp)
bfc00800:	0ff005c2 	jal	bfc01708 <puts>
bfc00804:	2684005c 	addiu	a0,s4,92
bfc00808:	0ff00595 	jal	bfc01654 <putchar>
bfc0080c:	2404000a 	li	a0,10
bfc00810:	8f838010 	lw	v1,-32752(gp)
bfc00814:	00000000 	nop
bfc00818:	10600230 	beqz	v1,bfc010dc <dhrystone+0xa1c>
bfc0081c:	3c1f8000 	lui	ra,0x8000
bfc00820:	27e400cc 	addiu	a0,ra,204
bfc00824:	0ff005c2 	jal	bfc01708 <puts>
bfc00828:	3c168000 	lui	s6,0x8000
bfc0082c:	0ff00595 	jal	bfc01654 <putchar>
bfc00830:	2404000a 	li	a0,10
bfc00834:	8fa50098 	lw	a1,152(sp)
bfc00838:	0ff004fc 	jal	bfc013f0 <printf>
bfc0083c:	26c40128 	addiu	a0,s6,296
bfc00840:	0ff0062f 	jal	bfc018bc <get_ns>
bfc00844:	00000000 	nop
bfc00848:	8fb30098 	lw	s3,152(sp)
bfc0084c:	00000000 	nop
bfc00850:	1a600231 	blez	s3,bfc01118 <dhrystone+0xa58>
bfc00854:	af828020 	sw	v0,-32736(gp)
bfc00858:	3c118000 	lui	s1,0x8000
bfc0085c:	3c178000 	lui	s7,0x8000
bfc00860:	3c048000 	lui	a0,0x8000
bfc00864:	afb70064 	sw	s7,100(sp)
bfc00868:	afb10068 	sw	s1,104(sp)
bfc0086c:	24140001 	li	s4,1
bfc00870:	27b7003c 	addiu	s7,sp,60
bfc00874:	26350158 	addiu	s5,s1,344
bfc00878:	241e0001 	li	s8,1
bfc0087c:	27b60014 	addiu	s6,sp,20
bfc00880:	24930178 	addiu	s3,a0,376
bfc00884:	8fa50068 	lw	a1,104(sp)
bfc00888:	8ea80010 	lw	t0,16(s5)
bfc0088c:	8eac0004 	lw	t4,4(s5)
bfc00890:	8ea60008 	lw	a2,8(s5)
bfc00894:	8ea7000c 	lw	a3,12(s5)
bfc00898:	8ea90014 	lw	t1,20(s5)
bfc0089c:	8eaa0018 	lw	t2,24(s5)
bfc008a0:	96ab001c 	lhu	t3,28(s5)
bfc008a4:	92b0001e 	lbu	s0,30(s5)
bfc008a8:	8ca20158 	lw	v0,344(a1)
bfc008ac:	24030041 	li	v1,65
bfc008b0:	aee80010 	sw	t0,16(s7)
bfc008b4:	240d0042 	li	t5,66
bfc008b8:	240e0002 	li	t6,2
bfc008bc:	27a4001c 	addiu	a0,sp,28
bfc008c0:	02e02821 	move	a1,s7
bfc008c4:	aee20000 	sw	v0,0(s7)
bfc008c8:	aeec0004 	sw	t4,4(s7)
bfc008cc:	aee60008 	sw	a2,8(s7)
bfc008d0:	aee7000c 	sw	a3,12(s7)
bfc008d4:	aee90014 	sw	t1,20(s7)
bfc008d8:	aeea0018 	sw	t2,24(s7)
bfc008dc:	a6eb001c 	sh	t3,28(s7)
bfc008e0:	a2f0001e 	sb	s0,30(s7)
bfc008e4:	a3838030 	sb	v1,-32720(gp)
bfc008e8:	af9e8038 	sw	s8,-32712(gp)
bfc008ec:	a38d8031 	sb	t5,-32719(gp)
bfc008f0:	afae0010 	sw	t6,16(sp)
bfc008f4:	0ff004b0 	jal	bfc012c0 <Func_2>
bfc008f8:	afbe0018 	sw	s8,24(sp)
bfc008fc:	8fa80010 	lw	t0,16(sp)
bfc00900:	2c4f0001 	sltiu	t7,v0,1
bfc00904:	29190003 	slti	t9,t0,3
bfc00908:	13200036 	beqz	t9,bfc009e4 <dhrystone+0x324>
bfc0090c:	af8f8038 	sw	t7,-32712(gp)
bfc00910:	00087880 	sll	t7,t0,0x2
bfc00914:	01e8c821 	addu	t9,t7,t0
bfc00918:	01002021 	move	a0,t0
bfc0091c:	273ffffd 	addiu	ra,t9,-3
bfc00920:	24050003 	li	a1,3
bfc00924:	afbf0014 	sw	ra,20(sp)
bfc00928:	0ff00478 	jal	bfc011e0 <Proc_7>
bfc0092c:	02c03021 	move	a2,s6
bfc00930:	8fb10010 	lw	s1,16(sp)
bfc00934:	24050003 	li	a1,3
bfc00938:	26280001 	addiu	t0,s1,1
bfc0093c:	00082080 	sll	a0,t0,0x2
bfc00940:	0088c021 	addu	t8,a0,t0
bfc00944:	29120003 	slti	s2,t0,3
bfc00948:	02c03021 	move	a2,s6
bfc0094c:	01002021 	move	a0,t0
bfc00950:	2702fffd 	addiu	v0,t8,-3
bfc00954:	12400023 	beqz	s2,bfc009e4 <dhrystone+0x324>
bfc00958:	afa80010 	sw	t0,16(sp)
bfc0095c:	0ff00478 	jal	bfc011e0 <Proc_7>
bfc00960:	afa20014 	sw	v0,20(sp)
bfc00964:	8fb80010 	lw	t8,16(sp)
bfc00968:	24050003 	li	a1,3
bfc0096c:	27080001 	addiu	t0,t8,1
bfc00970:	00081080 	sll	v0,t0,0x2
bfc00974:	00486021 	addu	t4,v0,t0
bfc00978:	29100003 	slti	s0,t0,3
bfc0097c:	02c03021 	move	a2,s6
bfc00980:	01002021 	move	a0,t0
bfc00984:	2583fffd 	addiu	v1,t4,-3
bfc00988:	12000016 	beqz	s0,bfc009e4 <dhrystone+0x324>
bfc0098c:	afa80010 	sw	t0,16(sp)
bfc00990:	0ff00478 	jal	bfc011e0 <Proc_7>
bfc00994:	afa30014 	sw	v1,20(sp)
bfc00998:	8fae0010 	lw	t6,16(sp)
bfc0099c:	24050003 	li	a1,3
bfc009a0:	25c80001 	addiu	t0,t6,1
bfc009a4:	00087880 	sll	t7,t0,0x2
bfc009a8:	01e89021 	addu	s2,t7,t0
bfc009ac:	29190003 	slti	t9,t0,3
bfc009b0:	02c03021 	move	a2,s6
bfc009b4:	2643fffd 	addiu	v1,s2,-3
bfc009b8:	01002021 	move	a0,t0
bfc009bc:	13200009 	beqz	t9,bfc009e4 <dhrystone+0x324>
bfc009c0:	afa80010 	sw	t0,16(sp)
bfc009c4:	0ff00478 	jal	bfc011e0 <Proc_7>
bfc009c8:	afa30014 	sw	v1,20(sp)
bfc009cc:	8fa50010 	lw	a1,16(sp)
bfc009d0:	00000000 	nop
bfc009d4:	24a80001 	addiu	t0,a1,1
bfc009d8:	29060003 	slti	a2,t0,3
bfc009dc:	14c0ffcc 	bnez	a2,bfc00910 <dhrystone+0x250>
bfc009e0:	afa80010 	sw	t0,16(sp)
bfc009e4:	3c038000 	lui	v1,0x8000
bfc009e8:	8fa70014 	lw	a3,20(sp)
bfc009ec:	3c108000 	lui	s0,0x8000
bfc009f0:	01003021 	move	a2,t0
bfc009f4:	26042f50 	addiu	a0,s0,12112
bfc009f8:	0ff0047c 	jal	bfc011f0 <Proc_8>
bfc009fc:	246507e0 	addiu	a1,v1,2016
bfc00a00:	8f848034 	lw	a0,-32716(gp)
bfc00a04:	0ff00150 	jal	bfc00540 <Proc_1>
bfc00a08:	00000000 	nop
bfc00a0c:	838d8031 	lb	t5,-32719(gp)
bfc00a10:	00000000 	nop
bfc00a14:	29ae0041 	slti	t6,t5,65
bfc00a18:	15c001ae 	bnez	t6,bfc010d4 <dhrystone+0xa14>
bfc00a1c:	24100041 	li	s0,65
bfc00a20:	24120003 	li	s2,3
bfc00a24:	0bf00293 	j	bfc00a4c <dhrystone+0x38c>
bfc00a28:	24110041 	li	s1,65
bfc00a2c:	00000000 	nop
bfc00a30:	260f0001 	addiu	t7,s0,1
bfc00a34:	839f8031 	lb	ra,-32719(gp)
bfc00a38:	000fce00 	sll	t9,t7,0x18
bfc00a3c:	00198603 	sra	s0,t9,0x18
bfc00a40:	03f0202a 	slt	a0,ra,s0
bfc00a44:	14800026 	bnez	a0,bfc00ae0 <dhrystone+0x420>
bfc00a48:	00000000 	nop
bfc00a4c:	02202021 	move	a0,s1
bfc00a50:	0ff004a0 	jal	bfc01280 <Func_1>
bfc00a54:	24050043 	li	a1,67
bfc00a58:	8fab0018 	lw	t3,24(sp)
bfc00a5c:	00000000 	nop
bfc00a60:	144bfff3 	bne	v0,t3,bfc00a30 <dhrystone+0x370>
bfc00a64:	26310001 	addiu	s1,s1,1
bfc00a68:	00002021 	move	a0,zero
bfc00a6c:	0ff00458 	jal	bfc01160 <Proc_6>
bfc00a70:	27a50018 	addiu	a1,sp,24
bfc00a74:	260f0001 	addiu	t7,s0,1
bfc00a78:	3c128000 	lui	s2,0x8000
bfc00a7c:	839f8031 	lb	ra,-32719(gp)
bfc00a80:	000fce00 	sll	t9,t7,0x18
bfc00a84:	8e580178 	lw	t8,376(s2)
bfc00a88:	8e620004 	lw	v0,4(s3)
bfc00a8c:	8e650008 	lw	a1,8(s3)
bfc00a90:	8e6c000c 	lw	t4,12(s3)
bfc00a94:	8e660010 	lw	a2,16(s3)
bfc00a98:	8e670014 	lw	a3,20(s3)
bfc00a9c:	8e680018 	lw	t0,24(s3)
bfc00aa0:	9669001c 	lhu	t1,28(s3)
bfc00aa4:	926a001e 	lbu	t2,30(s3)
bfc00aa8:	00198603 	sra	s0,t9,0x18
bfc00aac:	03f0202a 	slt	a0,ra,s0
bfc00ab0:	02809021 	move	s2,s4
bfc00ab4:	aef80000 	sw	t8,0(s7)
bfc00ab8:	aee20004 	sw	v0,4(s7)
bfc00abc:	aee50008 	sw	a1,8(s7)
bfc00ac0:	aeec000c 	sw	t4,12(s7)
bfc00ac4:	aee60010 	sw	a2,16(s7)
bfc00ac8:	aee70014 	sw	a3,20(s7)
bfc00acc:	aee80018 	sw	t0,24(s7)
bfc00ad0:	a6e9001c 	sh	t1,28(s7)
bfc00ad4:	a2ea001e 	sb	t2,30(s7)
bfc00ad8:	1080ffdc 	beqz	a0,bfc00a4c <dhrystone+0x38c>
bfc00adc:	af94802c 	sw	s4,-32724(gp)
bfc00ae0:	8fa70010 	lw	a3,16(sp)
bfc00ae4:	8fa80014 	lw	t0,20(sp)
bfc00ae8:	02470018 	mult	s2,a3
bfc00aec:	27a40010 	addiu	a0,sp,16
bfc00af0:	26940001 	addiu	s4,s4,1
bfc00af4:	00004812 	mflo	t1
bfc00af8:	01285023 	subu	t2,t1,t0
bfc00afc:	000a58c0 	sll	t3,t2,0x3
bfc00b00:	15000002 	bnez	t0,bfc00b0c <dhrystone+0x44c>
bfc00b04:	0128001a 	div	zero,t1,t0
bfc00b08:	0007000d 	break	0x7
bfc00b0c:	016a8023 	subu	s0,t3,t2
bfc00b10:	00006812 	mflo	t5
bfc00b14:	020d1823 	subu	v1,s0,t5
bfc00b18:	afa30060 	sw	v1,96(sp)
bfc00b1c:	0ff00124 	jal	bfc00490 <Proc_2>
bfc00b20:	afad0010 	sw	t5,16(sp)
bfc00b24:	8fae0098 	lw	t6,152(sp)
bfc00b28:	00000000 	nop
bfc00b2c:	01d4882a 	slt	s1,t6,s4
bfc00b30:	1220ff54 	beqz	s1,bfc00884 <dhrystone+0x1c4>
bfc00b34:	00000000 	nop
bfc00b38:	0ff0062f 	jal	bfc018bc <get_ns>
bfc00b3c:	3c158000 	lui	s5,0x8000
bfc00b40:	3c048000 	lui	a0,0x8000
bfc00b44:	24840198 	addiu	a0,a0,408
bfc00b48:	0ff005c2 	jal	bfc01708 <puts>
bfc00b4c:	af828024 	sw	v0,-32732(gp)
bfc00b50:	0ff00595 	jal	bfc01654 <putchar>
bfc00b54:	2404000a 	li	a0,10
bfc00b58:	0ff005c2 	jal	bfc01708 <puts>
bfc00b5c:	26a401a8 	addiu	a0,s5,424
bfc00b60:	0ff00595 	jal	bfc01654 <putchar>
bfc00b64:	2404000a 	li	a0,10
bfc00b68:	3c108000 	lui	s0,0x8000
bfc00b6c:	8f85802c 	lw	a1,-32724(gp)
bfc00b70:	260401e0 	addiu	a0,s0,480
bfc00b74:	0ff004fc 	jal	bfc013f0 <printf>
bfc00b78:	3c108000 	lui	s0,0x8000
bfc00b7c:	260401fc 	addiu	a0,s0,508
bfc00b80:	0ff004fc 	jal	bfc013f0 <printf>
bfc00b84:	24050005 	li	a1,5
bfc00b88:	3c0d8000 	lui	t5,0x8000
bfc00b8c:	8f858038 	lw	a1,-32712(gp)
bfc00b90:	0ff004fc 	jal	bfc013f0 <printf>
bfc00b94:	25a40218 	addiu	a0,t5,536
bfc00b98:	260401fc 	addiu	a0,s0,508
bfc00b9c:	0ff004fc 	jal	bfc013f0 <printf>
bfc00ba0:	24050001 	li	a1,1
bfc00ba4:	3c168000 	lui	s6,0x8000
bfc00ba8:	83858030 	lb	a1,-32720(gp)
bfc00bac:	26c40234 	addiu	a0,s6,564
bfc00bb0:	0ff004fc 	jal	bfc013f0 <printf>
bfc00bb4:	3c118000 	lui	s1,0x8000
bfc00bb8:	26240250 	addiu	a0,s1,592
bfc00bbc:	0ff004fc 	jal	bfc013f0 <printf>
bfc00bc0:	24050041 	li	a1,65
bfc00bc4:	3c0e8000 	lui	t6,0x8000
bfc00bc8:	83858031 	lb	a1,-32719(gp)
bfc00bcc:	0ff004fc 	jal	bfc013f0 <printf>
bfc00bd0:	25c4026c 	addiu	a0,t6,620
bfc00bd4:	26240250 	addiu	a0,s1,592
bfc00bd8:	0ff004fc 	jal	bfc013f0 <printf>
bfc00bdc:	24050042 	li	a1,66
bfc00be0:	3c0f8000 	lui	t7,0x8000
bfc00be4:	25f22f50 	addiu	s2,t7,12112
bfc00be8:	3c198000 	lui	t9,0x8000
bfc00bec:	8e450020 	lw	a1,32(s2)
bfc00bf0:	0ff004fc 	jal	bfc013f0 <printf>
bfc00bf4:	27240288 	addiu	a0,t9,648
bfc00bf8:	260401fc 	addiu	a0,s0,508
bfc00bfc:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c00:	24050007 	li	a1,7
bfc00c04:	3c058000 	lui	a1,0x8000
bfc00c08:	8fb80098 	lw	t8,152(sp)
bfc00c0c:	24b307e0 	addiu	s3,a1,2016
bfc00c10:	8e65065c 	lw	a1,1628(s3)
bfc00c14:	3c1e8000 	lui	s8,0x8000
bfc00c18:	27c402a4 	addiu	a0,s8,676
bfc00c1c:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c20:	271e000a 	addiu	s8,t8,10
bfc00c24:	03c02821 	move	a1,s8
bfc00c28:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c2c:	260401fc 	addiu	a0,s0,508
bfc00c30:	3c028000 	lui	v0,0x8000
bfc00c34:	0ff005c2 	jal	bfc01708 <puts>
bfc00c38:	244402c0 	addiu	a0,v0,704
bfc00c3c:	8f8c8034 	lw	t4,-32716(gp)
bfc00c40:	3c148000 	lui	s4,0x8000
bfc00c44:	8d850000 	lw	a1,0(t4)
bfc00c48:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c4c:	268402cc 	addiu	a0,s4,716
bfc00c50:	3c068000 	lui	a2,0x8000
bfc00c54:	0ff005c2 	jal	bfc01708 <puts>
bfc00c58:	24c402e8 	addiu	a0,a2,744
bfc00c5c:	8f878034 	lw	a3,-32716(gp)
bfc00c60:	3c158000 	lui	s5,0x8000
bfc00c64:	8ce50004 	lw	a1,4(a3)
bfc00c68:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c6c:	26a40318 	addiu	a0,s5,792
bfc00c70:	260401fc 	addiu	a0,s0,508
bfc00c74:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c78:	00002821 	move	a1,zero
bfc00c7c:	8f888034 	lw	t0,-32716(gp)
bfc00c80:	3c168000 	lui	s6,0x8000
bfc00c84:	8d050008 	lw	a1,8(t0)
bfc00c88:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c8c:	26c40334 	addiu	a0,s6,820
bfc00c90:	260401fc 	addiu	a0,s0,508
bfc00c94:	0ff004fc 	jal	bfc013f0 <printf>
bfc00c98:	24050002 	li	a1,2
bfc00c9c:	8f898034 	lw	t1,-32716(gp)
bfc00ca0:	3c118000 	lui	s1,0x8000
bfc00ca4:	8d25000c 	lw	a1,12(t1)
bfc00ca8:	0ff004fc 	jal	bfc013f0 <printf>
bfc00cac:	26240350 	addiu	a0,s1,848
bfc00cb0:	260401fc 	addiu	a0,s0,508
bfc00cb4:	0ff004fc 	jal	bfc013f0 <printf>
bfc00cb8:	24050011 	li	a1,17
bfc00cbc:	8f8a8034 	lw	t2,-32716(gp)
bfc00cc0:	3c128000 	lui	s2,0x8000
bfc00cc4:	25450010 	addiu	a1,t2,16
bfc00cc8:	2644036c 	addiu	a0,s2,876
bfc00ccc:	0ff004fc 	jal	bfc013f0 <printf>
bfc00cd0:	3c138000 	lui	s3,0x8000
bfc00cd4:	0ff005c2 	jal	bfc01708 <puts>
bfc00cd8:	26640388 	addiu	a0,s3,904
bfc00cdc:	3c0b8000 	lui	t3,0x8000
bfc00ce0:	0ff005c2 	jal	bfc01708 <puts>
bfc00ce4:	256403bc 	addiu	a0,t3,956
bfc00ce8:	8f838028 	lw	v1,-32728(gp)
bfc00cec:	268402cc 	addiu	a0,s4,716
bfc00cf0:	8c650000 	lw	a1,0(v1)
bfc00cf4:	0ff004fc 	jal	bfc013f0 <printf>
bfc00cf8:	24140001 	li	s4,1
bfc00cfc:	3c048000 	lui	a0,0x8000
bfc00d00:	0ff005c2 	jal	bfc01708 <puts>
bfc00d04:	248403cc 	addiu	a0,a0,972
bfc00d08:	8f8d8028 	lw	t5,-32728(gp)
bfc00d0c:	00000000 	nop
bfc00d10:	8da50004 	lw	a1,4(t5)
bfc00d14:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d18:	26a40318 	addiu	a0,s5,792
bfc00d1c:	260401fc 	addiu	a0,s0,508
bfc00d20:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d24:	00002821 	move	a1,zero
bfc00d28:	8f8e8028 	lw	t6,-32728(gp)
bfc00d2c:	26c40334 	addiu	a0,s6,820
bfc00d30:	8dc50008 	lw	a1,8(t6)
bfc00d34:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d38:	3c168000 	lui	s6,0x8000
bfc00d3c:	260401fc 	addiu	a0,s0,508
bfc00d40:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d44:	24050001 	li	a1,1
bfc00d48:	8f8f8028 	lw	t7,-32728(gp)
bfc00d4c:	00000000 	nop
bfc00d50:	8de5000c 	lw	a1,12(t7)
bfc00d54:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d58:	26240350 	addiu	a0,s1,848
bfc00d5c:	260401fc 	addiu	a0,s0,508
bfc00d60:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d64:	24050012 	li	a1,18
bfc00d68:	8f998028 	lw	t9,-32728(gp)
bfc00d6c:	2644036c 	addiu	a0,s2,876
bfc00d70:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d74:	27250010 	addiu	a1,t9,16
bfc00d78:	0ff005c2 	jal	bfc01708 <puts>
bfc00d7c:	26640388 	addiu	a0,s3,904
bfc00d80:	3c128000 	lui	s2,0x8000
bfc00d84:	8fa50010 	lw	a1,16(sp)
bfc00d88:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d8c:	2644040c 	addiu	a0,s2,1036
bfc00d90:	260401fc 	addiu	a0,s0,508
bfc00d94:	0ff004fc 	jal	bfc013f0 <printf>
bfc00d98:	24050005 	li	a1,5
bfc00d9c:	3c058000 	lui	a1,0x8000
bfc00da0:	24a40428 	addiu	a0,a1,1064
bfc00da4:	8fa50060 	lw	a1,96(sp)
bfc00da8:	0ff004fc 	jal	bfc013f0 <printf>
bfc00dac:	3c138000 	lui	s3,0x8000
bfc00db0:	260401fc 	addiu	a0,s0,508
bfc00db4:	0ff004fc 	jal	bfc013f0 <printf>
bfc00db8:	2405000d 	li	a1,13
bfc00dbc:	3c188000 	lui	t8,0x8000
bfc00dc0:	8fa50014 	lw	a1,20(sp)
bfc00dc4:	0ff004fc 	jal	bfc013f0 <printf>
bfc00dc8:	27040444 	addiu	a0,t8,1092
bfc00dcc:	260401fc 	addiu	a0,s0,508
bfc00dd0:	0ff004fc 	jal	bfc013f0 <printf>
bfc00dd4:	24050007 	li	a1,7
bfc00dd8:	8fa50018 	lw	a1,24(sp)
bfc00ddc:	3c028000 	lui	v0,0x8000
bfc00de0:	0ff004fc 	jal	bfc013f0 <printf>
bfc00de4:	24440460 	addiu	a0,v0,1120
bfc00de8:	260401fc 	addiu	a0,s0,508
bfc00dec:	0ff004fc 	jal	bfc013f0 <printf>
bfc00df0:	24050001 	li	a1,1
bfc00df4:	3c0c8000 	lui	t4,0x8000
bfc00df8:	2584047c 	addiu	a0,t4,1148
bfc00dfc:	0ff004fc 	jal	bfc013f0 <printf>
bfc00e00:	27a5001c 	addiu	a1,sp,28
bfc00e04:	3c068000 	lui	a2,0x8000
bfc00e08:	0ff005c2 	jal	bfc01708 <puts>
bfc00e0c:	24c40498 	addiu	a0,a2,1176
bfc00e10:	02e02821 	move	a1,s7
bfc00e14:	0ff004fc 	jal	bfc013f0 <printf>
bfc00e18:	26c404cc 	addiu	a0,s6,1228
bfc00e1c:	0ff005c2 	jal	bfc01708 <puts>
bfc00e20:	266404e8 	addiu	a0,s3,1256
bfc00e24:	0ff00595 	jal	bfc01654 <putchar>
bfc00e28:	2404000a 	li	a0,10
bfc00e2c:	8f958038 	lw	s5,-32712(gp)
bfc00e30:	8f84802c 	lw	a0,-32724(gp)
bfc00e34:	12b400c8 	beq	s5,s4,bfc01158 <dhrystone+0xa98>
bfc00e38:	389f0005 	xori	ra,a0,0x5
bfc00e3c:	24100001 	li	s0,1
bfc00e40:	83838030 	lb	v1,-32720(gp)
bfc00e44:	24140041 	li	s4,65
bfc00e48:	10740002 	beq	v1,s4,bfc00e54 <dhrystone+0x794>
bfc00e4c:	00000000 	nop
bfc00e50:	24100001 	li	s0,1
bfc00e54:	838a8031 	lb	t2,-32719(gp)
bfc00e58:	240b0042 	li	t3,66
bfc00e5c:	114b0002 	beq	t2,t3,bfc00e68 <dhrystone+0x7a8>
bfc00e60:	3c068000 	lui	a2,0x8000
bfc00e64:	24100001 	li	s0,1
bfc00e68:	24c72f50 	addiu	a3,a2,12112
bfc00e6c:	8ce80020 	lw	t0,32(a3)
bfc00e70:	24090007 	li	t1,7
bfc00e74:	11090002 	beq	t0,t1,bfc00e80 <dhrystone+0x7c0>
bfc00e78:	3c188000 	lui	t8,0x8000
bfc00e7c:	24100001 	li	s0,1
bfc00e80:	270207e0 	addiu	v0,t8,2016
bfc00e84:	8c4c065c 	lw	t4,1628(v0)
bfc00e88:	00000000 	nop
bfc00e8c:	13cc0002 	beq	s8,t4,bfc00e98 <dhrystone+0x7d8>
bfc00e90:	00000000 	nop
bfc00e94:	24100001 	li	s0,1
bfc00e98:	8f848034 	lw	a0,-32716(gp)
bfc00e9c:	8f918028 	lw	s1,-32728(gp)
bfc00ea0:	8c930000 	lw	s3,0(a0)
bfc00ea4:	8e3e0000 	lw	s8,0(s1)
bfc00ea8:	00000000 	nop
bfc00eac:	127e0002 	beq	s3,s8,bfc00eb8 <dhrystone+0x7f8>
bfc00eb0:	00000000 	nop
bfc00eb4:	24100001 	li	s0,1
bfc00eb8:	8c850004 	lw	a1,4(a0)
bfc00ebc:	00000000 	nop
bfc00ec0:	10a00002 	beqz	a1,bfc00ecc <dhrystone+0x80c>
bfc00ec4:	00000000 	nop
bfc00ec8:	24100001 	li	s0,1
bfc00ecc:	8c920008 	lw	s2,8(a0)
bfc00ed0:	24190002 	li	t9,2
bfc00ed4:	12590002 	beq	s2,t9,bfc00ee0 <dhrystone+0x820>
bfc00ed8:	00000000 	nop
bfc00edc:	24100001 	li	s0,1
bfc00ee0:	8c8e000c 	lw	t6,12(a0)
bfc00ee4:	240f0011 	li	t7,17
bfc00ee8:	11cf0002 	beq	t6,t7,bfc00ef4 <dhrystone+0x834>
bfc00eec:	3c168000 	lui	s6,0x8000
bfc00ef0:	24100001 	li	s0,1
bfc00ef4:	24840010 	addiu	a0,a0,16
bfc00ef8:	0ff00610 	jal	bfc01840 <strcmp>
bfc00efc:	26c5008c 	addiu	a1,s6,140
bfc00f00:	10400002 	beqz	v0,bfc00f0c <dhrystone+0x84c>
bfc00f04:	00000000 	nop
bfc00f08:	24100001 	li	s0,1
bfc00f0c:	8e2d0004 	lw	t5,4(s1)
bfc00f10:	00000000 	nop
bfc00f14:	11a00002 	beqz	t5,bfc00f20 <dhrystone+0x860>
bfc00f18:	00000000 	nop
bfc00f1c:	24100001 	li	s0,1
bfc00f20:	8e240008 	lw	a0,8(s1)
bfc00f24:	24150001 	li	s5,1
bfc00f28:	10950002 	beq	a0,s5,bfc00f34 <dhrystone+0x874>
bfc00f2c:	00000000 	nop
bfc00f30:	24100001 	li	s0,1
bfc00f34:	8e34000c 	lw	s4,12(s1)
bfc00f38:	241f0012 	li	ra,18
bfc00f3c:	129f0002 	beq	s4,ra,bfc00f48 <dhrystone+0x888>
bfc00f40:	26240010 	addiu	a0,s1,16
bfc00f44:	24100001 	li	s0,1
bfc00f48:	3c118000 	lui	s1,0x8000
bfc00f4c:	0ff00610 	jal	bfc01840 <strcmp>
bfc00f50:	2625008c 	addiu	a1,s1,140
bfc00f54:	10400002 	beqz	v0,bfc00f60 <dhrystone+0x8a0>
bfc00f58:	00000000 	nop
bfc00f5c:	24100001 	li	s0,1
bfc00f60:	8fab0010 	lw	t3,16(sp)
bfc00f64:	24030005 	li	v1,5
bfc00f68:	11630002 	beq	t3,v1,bfc00f74 <dhrystone+0x8b4>
bfc00f6c:	00000000 	nop
bfc00f70:	24100001 	li	s0,1
bfc00f74:	8fa90060 	lw	t1,96(sp)
bfc00f78:	240a000d 	li	t2,13
bfc00f7c:	112a0002 	beq	t1,t2,bfc00f88 <dhrystone+0x8c8>
bfc00f80:	00000000 	nop
bfc00f84:	24100001 	li	s0,1
bfc00f88:	8fa80014 	lw	t0,20(sp)
bfc00f8c:	24070007 	li	a3,7
bfc00f90:	11070002 	beq	t0,a3,bfc00f9c <dhrystone+0x8dc>
bfc00f94:	00000000 	nop
bfc00f98:	24100001 	li	s0,1
bfc00f9c:	8fa60018 	lw	a2,24(sp)
bfc00fa0:	240c0001 	li	t4,1
bfc00fa4:	10cc0002 	beq	a2,t4,bfc00fb0 <dhrystone+0x8f0>
bfc00fa8:	3c028000 	lui	v0,0x8000
bfc00fac:	24100001 	li	s0,1
bfc00fb0:	27a4001c 	addiu	a0,sp,28
bfc00fb4:	0ff00610 	jal	bfc01840 <strcmp>
bfc00fb8:	244500ac 	addiu	a1,v0,172
bfc00fbc:	10400002 	beqz	v0,bfc00fc8 <dhrystone+0x908>
bfc00fc0:	02e02021 	move	a0,s7
bfc00fc4:	24100001 	li	s0,1
bfc00fc8:	8fb70068 	lw	s7,104(sp)
bfc00fcc:	0ff00610 	jal	bfc01840 <strcmp>
bfc00fd0:	26e50158 	addiu	a1,s7,344
bfc00fd4:	10400002 	beqz	v0,bfc00fe0 <dhrystone+0x920>
bfc00fd8:	00000000 	nop
bfc00fdc:	24100001 	li	s0,1
bfc00fe0:	8f8f8024 	lw	t7,-32732(gp)
bfc00fe4:	8f858020 	lw	a1,-32736(gp)
bfc00fe8:	3c128000 	lui	s2,0x8000
bfc00fec:	01e5c823 	subu	t9,t7,a1
bfc00ff0:	2644051c 	addiu	a0,s2,1308
bfc00ff4:	af99801c 	sw	t9,-32740(gp)
bfc00ff8:	0ff004fc 	jal	bfc013f0 <printf>
bfc00ffc:	3c138000 	lui	s3,0x8000
bfc01000:	8f858024 	lw	a1,-32732(gp)
bfc01004:	0ff004fc 	jal	bfc013f0 <printf>
bfc01008:	2664052c 	addiu	a0,s3,1324
bfc0100c:	3c1e8000 	lui	s8,0x8000
bfc01010:	8f85801c 	lw	a1,-32740(gp)
bfc01014:	0ff004fc 	jal	bfc013f0 <printf>
bfc01018:	27c4053c 	addiu	a0,s8,1340
bfc0101c:	8f86801c 	lw	a2,-32740(gp)
bfc01020:	00000000 	nop
bfc01024:	28d80078 	slti	t8,a2,120
bfc01028:	17000041 	bnez	t8,bfc01130 <dhrystone+0xa70>
bfc0102c:	3c168000 	lui	s6,0x8000
bfc01030:	8fa70098 	lw	a3,152(sp)
bfc01034:	8fab0098 	lw	t3,152(sp)
bfc01038:	14e00002 	bnez	a3,bfc01044 <dhrystone+0x984>
bfc0103c:	00c7001a 	div	zero,a2,a3
bfc01040:	0007000d 	break	0x7
bfc01044:	000740c0 	sll	t0,a3,0x3
bfc01048:	00074a00 	sll	t1,a3,0x8
bfc0104c:	01281823 	subu	v1,t1,t0
bfc01050:	00035180 	sll	t2,v1,0x6
bfc01054:	01438823 	subu	s1,t2,v1
bfc01058:	022ba021 	addu	s4,s1,t3
bfc0105c:	0014f980 	sll	ra,s4,0x6
bfc01060:	3c048000 	lui	a0,0x8000
bfc01064:	248405a4 	addiu	a0,a0,1444
bfc01068:	0000a812 	mflo	s5
bfc0106c:	af958014 	sw	s5,-32748(gp)
bfc01070:	00000000 	nop
bfc01074:	14c00002 	bnez	a2,bfc01080 <dhrystone+0x9c0>
bfc01078:	03e6001a 	div	zero,ra,a2
bfc0107c:	0007000d 	break	0x7
bfc01080:	00006812 	mflo	t5
bfc01084:	0ff004fc 	jal	bfc013f0 <printf>
bfc01088:	af8d8018 	sw	t5,-32744(gp)
bfc0108c:	8f858018 	lw	a1,-32744(gp)
bfc01090:	0ff004fc 	jal	bfc013f0 <printf>
bfc01094:	26c405d0 	addiu	a0,s6,1488
bfc01098:	0ff00595 	jal	bfc01654 <putchar>
bfc0109c:	2404000a 	li	a0,10
bfc010a0:	8fbf0094 	lw	ra,148(sp)
bfc010a4:	02001021 	move	v0,s0
bfc010a8:	8fbe0090 	lw	s8,144(sp)
bfc010ac:	8fb7008c 	lw	s7,140(sp)
bfc010b0:	8fb60088 	lw	s6,136(sp)
bfc010b4:	8fb50084 	lw	s5,132(sp)
bfc010b8:	8fb40080 	lw	s4,128(sp)
bfc010bc:	8fb3007c 	lw	s3,124(sp)
bfc010c0:	8fb20078 	lw	s2,120(sp)
bfc010c4:	8fb10074 	lw	s1,116(sp)
bfc010c8:	8fb00070 	lw	s0,112(sp)
bfc010cc:	03e00008 	jr	ra
bfc010d0:	27bd0098 	addiu	sp,sp,152
bfc010d4:	0bf002b8 	j	bfc00ae0 <dhrystone+0x420>
bfc010d8:	24120003 	li	s2,3
bfc010dc:	3c148000 	lui	s4,0x8000
bfc010e0:	0ff005c2 	jal	bfc01708 <puts>
bfc010e4:	268400f8 	addiu	a0,s4,248
bfc010e8:	0ff00595 	jal	bfc01654 <putchar>
bfc010ec:	2404000a 	li	a0,10
bfc010f0:	3c168000 	lui	s6,0x8000
bfc010f4:	8fa50098 	lw	a1,152(sp)
bfc010f8:	0ff004fc 	jal	bfc013f0 <printf>
bfc010fc:	26c40128 	addiu	a0,s6,296
bfc01100:	0ff0062f 	jal	bfc018bc <get_ns>
bfc01104:	00000000 	nop
bfc01108:	8fb30098 	lw	s3,152(sp)
bfc0110c:	00000000 	nop
bfc01110:	1e60fdd1 	bgtz	s3,bfc00858 <dhrystone+0x198>
bfc01114:	af828020 	sw	v0,-32736(gp)
bfc01118:	3c188000 	lui	t8,0x8000
bfc0111c:	3c128000 	lui	s2,0x8000
bfc01120:	27b7003c 	addiu	s7,sp,60
bfc01124:	afb80068 	sw	t8,104(sp)
bfc01128:	0bf002ce 	j	bfc00b38 <dhrystone+0x478>
bfc0112c:	afb20064 	sw	s2,100(sp)
bfc01130:	3c0e8000 	lui	t6,0x8000
bfc01134:	0ff005c2 	jal	bfc01708 <puts>
bfc01138:	25c4054c 	addiu	a0,t6,1356
bfc0113c:	3c058000 	lui	a1,0x8000
bfc01140:	0ff005c2 	jal	bfc01708 <puts>
bfc01144:	24a40584 	addiu	a0,a1,1412
bfc01148:	0ff00595 	jal	bfc01654 <putchar>
bfc0114c:	2404000a 	li	a0,10
bfc01150:	0bf00428 	j	bfc010a0 <dhrystone+0x9e0>
bfc01154:	00000000 	nop
bfc01158:	0bf00390 	j	bfc00e40 <dhrystone+0x780>
bfc0115c:	001f802b 	sltu	s0,zero,ra

bfc01160 <Proc_6>:
Proc_6():
bfc01160:	24030002 	li	v1,2
bfc01164:	1083001a 	beq	a0,v1,bfc011d0 <Proc_6+0x70>
bfc01168:	24020001 	li	v0,1
bfc0116c:	1082000c 	beq	a0,v0,bfc011a0 <Proc_6+0x40>
bfc01170:	24060003 	li	a2,3
bfc01174:	1080000f 	beqz	a0,bfc011b4 <Proc_6+0x54>
bfc01178:	00000000 	nop
bfc0117c:	10830014 	beq	a0,v1,bfc011d0 <Proc_6+0x70>
bfc01180:	00000000 	nop
bfc01184:	24020004 	li	v0,4
bfc01188:	1482000d 	bne	a0,v0,bfc011c0 <Proc_6+0x60>
bfc0118c:	00000000 	nop
bfc01190:	03e00008 	jr	ra
bfc01194:	aca30000 	sw	v1,0(a1)
	...
bfc011a0:	8f82802c 	lw	v0,-32724(gp)
bfc011a4:	00000000 	nop
bfc011a8:	28420065 	slti	v0,v0,101
bfc011ac:	14400004 	bnez	v0,bfc011c0 <Proc_6+0x60>
bfc011b0:	00000000 	nop
bfc011b4:	03e00008 	jr	ra
bfc011b8:	aca00000 	sw	zero,0(a1)
bfc011bc:	00000000 	nop
bfc011c0:	03e00008 	jr	ra
bfc011c4:	aca60000 	sw	a2,0(a1)
	...
bfc011d0:	03e00008 	jr	ra
bfc011d4:	aca20000 	sw	v0,0(a1)
	...

bfc011e0 <Proc_7>:
Proc_7():
bfc011e0:	24820002 	addiu	v0,a0,2
bfc011e4:	00452021 	addu	a0,v0,a1
bfc011e8:	03e00008 	jr	ra
bfc011ec:	acc40000 	sw	a0,0(a2)

bfc011f0 <Proc_8>:
Proc_8():
bfc011f0:	24ca0005 	addiu	t2,a2,5
bfc011f4:	000a70c0 	sll	t6,t2,0x3
bfc011f8:	000a7940 	sll	t7,t2,0x5
bfc011fc:	01cf6821 	addu	t5,t6,t7
bfc01200:	000d4080 	sll	t0,t5,0x2
bfc01204:	01a81021 	addu	v0,t5,t0
bfc01208:	24c30006 	addiu	v1,a2,6
bfc0120c:	24cb0023 	addiu	t3,a2,35
bfc01210:	00a27021 	addu	t6,a1,v0
bfc01214:	0003c080 	sll	t8,v1,0x2
bfc01218:	000b6080 	sll	t4,t3,0x2
bfc0121c:	24c90004 	addiu	t1,a2,4
bfc01220:	000ac880 	sll	t9,t2,0x2
bfc01224:	008c4021 	addu	t0,a0,t4
bfc01228:	00097880 	sll	t7,t1,0x2
bfc0122c:	01d96021 	addu	t4,t6,t9
bfc01230:	00994821 	addu	t1,a0,t9
bfc01234:	00986821 	addu	t5,a0,t8
bfc01238:	01d85821 	addu	t3,t6,t8
bfc0123c:	ad270000 	sw	a3,0(t1)
bfc01240:	01cf2821 	addu	a1,t6,t7
bfc01244:	ada70000 	sw	a3,0(t5)
bfc01248:	ad0a0000 	sw	t2,0(t0)
bfc0124c:	ad8a0000 	sw	t2,0(t4)
bfc01250:	ad6a0000 	sw	t2,0(t3)
bfc01254:	8ca60000 	lw	a2,0(a1)
bfc01258:	24040005 	li	a0,5
bfc0125c:	24c20001 	addiu	v0,a2,1
bfc01260:	aca20000 	sw	v0,0(a1)
bfc01264:	8d230000 	lw	v1,0(t1)
bfc01268:	00000000 	nop
bfc0126c:	ad830fa0 	sw	v1,4000(t4)
bfc01270:	03e00008 	jr	ra
bfc01274:	af84802c 	sw	a0,-32724(gp)
	...

bfc01280 <Func_1>:
Func_1():
bfc01280:	00042600 	sll	a0,a0,0x18
bfc01284:	00051600 	sll	v0,a1,0x18
bfc01288:	00042603 	sra	a0,a0,0x18
bfc0128c:	00022e03 	sra	a1,v0,0x18
bfc01290:	10850003 	beq	a0,a1,bfc012a0 <Func_1+0x20>
bfc01294:	00000000 	nop
bfc01298:	03e00008 	jr	ra
bfc0129c:	00001021 	move	v0,zero
bfc012a0:	a3848030 	sb	a0,-32720(gp)
bfc012a4:	03e00008 	jr	ra
bfc012a8:	24020001 	li	v0,1
bfc012ac:	00000000 	nop

bfc012b0 <Func_3>:
Func_3():
bfc012b0:	38820002 	xori	v0,a0,0x2
bfc012b4:	03e00008 	jr	ra
bfc012b8:	2c420001 	sltiu	v0,v0,1
bfc012bc:	00000000 	nop

bfc012c0 <Func_2>:
Func_2():
bfc012c0:	80830002 	lb	v1,2(a0)
bfc012c4:	80a20003 	lb	v0,3(a1)
bfc012c8:	27bdffe8 	addiu	sp,sp,-24
bfc012cc:	afbf0014 	sw	ra,20(sp)
bfc012d0:	24870002 	addiu	a3,a0,2
bfc012d4:	10430038 	beq	v0,v1,bfc013b8 <Func_2+0xf8>
bfc012d8:	24a60003 	addiu	a2,a1,3
bfc012dc:	0ff00610 	jal	bfc01840 <strcmp>
bfc012e0:	00000000 	nop
bfc012e4:	1840003e 	blez	v0,bfc013e0 <Func_2+0x120>
bfc012e8:	00000000 	nop
bfc012ec:	8fbf0014 	lw	ra,20(sp)
bfc012f0:	2403000a 	li	v1,10
bfc012f4:	24020001 	li	v0,1
bfc012f8:	af83802c 	sw	v1,-32724(gp)
bfc012fc:	03e00008 	jr	ra
bfc01300:	27bd0018 	addiu	sp,sp,24
	...
bfc01310:	a3838030 	sb	v1,-32720(gp)
bfc01314:	80e90000 	lb	t1,0(a3)
bfc01318:	80c30000 	lb	v1,0(a2)
bfc0131c:	00000000 	nop
bfc01320:	1469ffee 	bne	v1,t1,bfc012dc <Func_2+0x1c>
bfc01324:	00000000 	nop
bfc01328:	a3838030 	sb	v1,-32720(gp)
bfc0132c:	80ea0000 	lb	t2,0(a3)
bfc01330:	80c30000 	lb	v1,0(a2)
bfc01334:	00000000 	nop
bfc01338:	146affe8 	bne	v1,t2,bfc012dc <Func_2+0x1c>
bfc0133c:	00000000 	nop
bfc01340:	a3838030 	sb	v1,-32720(gp)
bfc01344:	80eb0000 	lb	t3,0(a3)
bfc01348:	80c30000 	lb	v1,0(a2)
bfc0134c:	00000000 	nop
bfc01350:	146bffe2 	bne	v1,t3,bfc012dc <Func_2+0x1c>
bfc01354:	00000000 	nop
bfc01358:	a3838030 	sb	v1,-32720(gp)
bfc0135c:	80ec0000 	lb	t4,0(a3)
bfc01360:	80c30000 	lb	v1,0(a2)
bfc01364:	00000000 	nop
bfc01368:	146cffdc 	bne	v1,t4,bfc012dc <Func_2+0x1c>
bfc0136c:	00000000 	nop
bfc01370:	a3838030 	sb	v1,-32720(gp)
bfc01374:	80ed0000 	lb	t5,0(a3)
bfc01378:	80c30000 	lb	v1,0(a2)
bfc0137c:	00000000 	nop
bfc01380:	146dffd6 	bne	v1,t5,bfc012dc <Func_2+0x1c>
bfc01384:	00000000 	nop
bfc01388:	a3838030 	sb	v1,-32720(gp)
bfc0138c:	80ee0000 	lb	t6,0(a3)
bfc01390:	80c30000 	lb	v1,0(a2)
bfc01394:	00000000 	nop
bfc01398:	146effd0 	bne	v1,t6,bfc012dc <Func_2+0x1c>
bfc0139c:	00000000 	nop
bfc013a0:	a3838030 	sb	v1,-32720(gp)
bfc013a4:	80e30000 	lb	v1,0(a3)
bfc013a8:	80cf0000 	lb	t7,0(a2)
bfc013ac:	00000000 	nop
bfc013b0:	15e3ffca 	bne	t7,v1,bfc012dc <Func_2+0x1c>
bfc013b4:	00000000 	nop
bfc013b8:	a3838030 	sb	v1,-32720(gp)
bfc013bc:	80e80000 	lb	t0,0(a3)
bfc013c0:	80c30000 	lb	v1,0(a2)
bfc013c4:	00000000 	nop
bfc013c8:	1068ffd1 	beq	v1,t0,bfc01310 <Func_2+0x50>
bfc013cc:	00000000 	nop
bfc013d0:	0ff00610 	jal	bfc01840 <strcmp>
bfc013d4:	00000000 	nop
bfc013d8:	1c40ffc4 	bgtz	v0,bfc012ec <Func_2+0x2c>
bfc013dc:	00000000 	nop
bfc013e0:	8fbf0014 	lw	ra,20(sp)
bfc013e4:	00001021 	move	v0,zero
bfc013e8:	03e00008 	jr	ra
bfc013ec:	27bd0018 	addiu	sp,sp,24

bfc013f0 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc013f0:	27bdffc8 	addiu	sp,sp,-56
bfc013f4:	afb30024 	sw	s3,36(sp)
bfc013f8:	afbf0034 	sw	ra,52(sp)
bfc013fc:	afb60030 	sw	s6,48(sp)
bfc01400:	afb5002c 	sw	s5,44(sp)
bfc01404:	afb40028 	sw	s4,40(sp)
bfc01408:	afb20020 	sw	s2,32(sp)
bfc0140c:	afb1001c 	sw	s1,28(sp)
bfc01410:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc01414:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc01418:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc0141c:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc01420:	afa5003c 	sw	a1,60(sp)
bfc01424:	afa60040 	sw	a2,64(sp)
bfc01428:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc0142c:	12000013 	beqz	s0,bfc0147c <printf+0x8c>
bfc01430:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc01434:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc01438:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0143c:	245605e0 	addiu	s6,v0,1504
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc01440:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc01444:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc01448:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc0144c:	12140016 	beq	s0,s4,bfc014a8 <printf+0xb8>
bfc01450:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc01454:	1215002f 	beq	s0,s5,bfc01514 <printf+0x124>
bfc01458:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc0145c:	0ff00595 	jal	bfc01654 <putchar>
bfc01460:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc01464:	26310001 	addiu	s1,s1,1
bfc01468:	02711021 	addu	v0,s3,s1
bfc0146c:	80500000 	lb	s0,0(v0)
bfc01470:	00000000 	nop
bfc01474:	1600fff5 	bnez	s0,bfc0144c <printf+0x5c>
bfc01478:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc0147c:	8fbf0034 	lw	ra,52(sp)
bfc01480:	00001021 	move	v0,zero
bfc01484:	8fb60030 	lw	s6,48(sp)
bfc01488:	8fb5002c 	lw	s5,44(sp)
bfc0148c:	8fb40028 	lw	s4,40(sp)
bfc01490:	8fb30024 	lw	s3,36(sp)
bfc01494:	8fb20020 	lw	s2,32(sp)
bfc01498:	8fb1001c 	lw	s1,28(sp)
bfc0149c:	8fb00018 	lw	s0,24(sp)
bfc014a0:	03e00008 	jr	ra
bfc014a4:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc014a8:	80440001 	lb	a0,1(v0)
bfc014ac:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc014b0:	2482ffdb 	addiu	v0,a0,-37
bfc014b4:	304200ff 	andi	v0,v0,0xff
bfc014b8:	2c430054 	sltiu	v1,v0,84
bfc014bc:	14600005 	bnez	v1,bfc014d4 <printf+0xe4>
bfc014c0:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc014c4:	0ff00595 	jal	bfc01654 <putchar>
bfc014c8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc014cc:	0bf0051a 	j	bfc01468 <printf+0x78>
bfc014d0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc014d4:	02c21021 	addu	v0,s6,v0
bfc014d8:	8c430000 	lw	v1,0(v0)
bfc014dc:	00000000 	nop
bfc014e0:	00600008 	jr	v1
bfc014e4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc014e8:	26310001 	addiu	s1,s1,1
bfc014ec:	02711021 	addu	v0,s3,s1
bfc014f0:	80440001 	lb	a0,1(v0)
bfc014f4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc014f8:	2482ffcf 	addiu	v0,a0,-49
bfc014fc:	304200ff 	andi	v0,v0,0xff
bfc01500:	2c420009 	sltiu	v0,v0,9
bfc01504:	1440003f 	bnez	v0,bfc01604 <printf+0x214>
bfc01508:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0150c:	0bf0052d 	j	bfc014b4 <printf+0xc4>
bfc01510:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc01514:	0ff00595 	jal	bfc01654 <putchar>
bfc01518:	2404000d 	li	a0,13
bfc0151c:	0bf00517 	j	bfc0145c <printf+0x6c>
bfc01520:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc01524:	8e440000 	lw	a0,0(s2)
bfc01528:	2406000a 	li	a2,10
bfc0152c:	0ff005d0 	jal	bfc01740 <printbase>
bfc01530:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc01534:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc01538:	0bf00519 	j	bfc01464 <printf+0x74>
bfc0153c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc01540:	8e440000 	lw	a0,0(s2)
bfc01544:	0ff005a0 	jal	bfc01680 <putstring>
bfc01548:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc0154c:	0bf00519 	j	bfc01464 <printf+0x74>
bfc01550:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc01554:	8e440000 	lw	a0,0(s2)
bfc01558:	24060010 	li	a2,16
bfc0155c:	0ff005d0 	jal	bfc01740 <printbase>
bfc01560:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc01564:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc01568:	0bf00519 	j	bfc01464 <printf+0x74>
bfc0156c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc01570:	8e440000 	lw	a0,0(s2)
bfc01574:	24060008 	li	a2,8
bfc01578:	0ff005d0 	jal	bfc01740 <printbase>
bfc0157c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc01580:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc01584:	0bf00519 	j	bfc01464 <printf+0x74>
bfc01588:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc0158c:	8e440000 	lw	a0,0(s2)
bfc01590:	2406000a 	li	a2,10
bfc01594:	0ff005d0 	jal	bfc01740 <printbase>
bfc01598:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc0159c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc015a0:	0bf00519 	j	bfc01464 <printf+0x74>
bfc015a4:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc015a8:	8e440000 	lw	a0,0(s2)
bfc015ac:	2406000a 	li	a2,10
bfc015b0:	0ff005d0 	jal	bfc01740 <printbase>
bfc015b4:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc015b8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc015bc:	0bf00519 	j	bfc01464 <printf+0x74>
bfc015c0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc015c4:	8e440000 	lw	a0,0(s2)
bfc015c8:	0ff00595 	jal	bfc01654 <putchar>
bfc015cc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc015d0:	0bf00519 	j	bfc01464 <printf+0x74>
bfc015d4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc015d8:	8e440000 	lw	a0,0(s2)
bfc015dc:	24060002 	li	a2,2
bfc015e0:	0ff005d0 	jal	bfc01740 <printbase>
bfc015e4:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc015e8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc015ec:	0bf00519 	j	bfc01464 <printf+0x74>
bfc015f0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc015f4:	0ff00595 	jal	bfc01654 <putchar>
bfc015f8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc015fc:	0bf00519 	j	bfc01464 <printf+0x74>
bfc01600:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc01604:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc01608:	000510c0 	sll	v0,a1,0x3
bfc0160c:	00051840 	sll	v1,a1,0x1
bfc01610:	00621821 	addu	v1,v1,v0
bfc01614:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc01618:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc0161c:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc01620:	2482ffcf 	addiu	v0,a0,-49
bfc01624:	304200ff 	andi	v0,v0,0xff
bfc01628:	2c420009 	sltiu	v0,v0,9
bfc0162c:	26310001 	addiu	s1,s1,1
bfc01630:	1040ff9f 	beqz	v0,bfc014b0 <printf+0xc0>
bfc01634:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc01638:	0bf00583 	j	bfc0160c <printf+0x21c>
bfc0163c:	000510c0 	sll	v0,a1,0x3

bfc01640 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc01640:	3c018000 	lui	at,0x8000
bfc01644:	03e00008 	jr	ra
bfc01648:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc0164c:	03e00008 	jr	ra
bfc01650:	00000000 	nop

bfc01654 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc01654:	27bdffe8 	addiu	sp,sp,-24
bfc01658:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc0165c:	0ff00590 	jal	bfc01640 <tgt_putchar>
bfc01660:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc01664:	8fbf0014 	lw	ra,20(sp)
bfc01668:	00001021 	move	v0,zero
bfc0166c:	03e00008 	jr	ra
bfc01670:	27bd0018 	addiu	sp,sp,24
	...

bfc01680 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc01680:	27bdffe0 	addiu	sp,sp,-32
bfc01684:	afb10014 	sw	s1,20(sp)
bfc01688:	afbf001c 	sw	ra,28(sp)
bfc0168c:	afb20018 	sw	s2,24(sp)
bfc01690:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc01694:	80900000 	lb	s0,0(a0)
bfc01698:	00000000 	nop
bfc0169c:	12000013 	beqz	s0,bfc016ec <putstring+0x6c>
bfc016a0:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc016a4:	0bf005b1 	j	bfc016c4 <putstring+0x44>
bfc016a8:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc016ac:	0ff00595 	jal	bfc01654 <putchar>
bfc016b0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc016b4:	82300000 	lb	s0,0(s1)
bfc016b8:	00000000 	nop
bfc016bc:	1200000b 	beqz	s0,bfc016ec <putstring+0x6c>
bfc016c0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc016c4:	1612fff9 	bne	s0,s2,bfc016ac <putstring+0x2c>
bfc016c8:	26310001 	addiu	s1,s1,1
bfc016cc:	0ff00595 	jal	bfc01654 <putchar>
bfc016d0:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc016d4:	0ff00595 	jal	bfc01654 <putchar>
bfc016d8:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc016dc:	82300000 	lb	s0,0(s1)
bfc016e0:	00000000 	nop
bfc016e4:	1600fff7 	bnez	s0,bfc016c4 <putstring+0x44>
bfc016e8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc016ec:	8fbf001c 	lw	ra,28(sp)
bfc016f0:	00001021 	move	v0,zero
bfc016f4:	8fb20018 	lw	s2,24(sp)
bfc016f8:	8fb10014 	lw	s1,20(sp)
bfc016fc:	8fb00010 	lw	s0,16(sp)
bfc01700:	03e00008 	jr	ra
bfc01704:	27bd0020 	addiu	sp,sp,32

bfc01708 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc01708:	27bdffe8 	addiu	sp,sp,-24
bfc0170c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc01710:	0ff005a0 	jal	bfc01680 <putstring>
bfc01714:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc01718:	0ff00595 	jal	bfc01654 <putchar>
bfc0171c:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc01720:	0ff00595 	jal	bfc01654 <putchar>
bfc01724:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc01728:	8fbf0014 	lw	ra,20(sp)
bfc0172c:	00001021 	move	v0,zero
bfc01730:	03e00008 	jr	ra
bfc01734:	27bd0018 	addiu	sp,sp,24
	...

bfc01740 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc01740:	27bdff98 	addiu	sp,sp,-104
bfc01744:	afb30060 	sw	s3,96(sp)
bfc01748:	afb2005c 	sw	s2,92(sp)
bfc0174c:	afbf0064 	sw	ra,100(sp)
bfc01750:	afb10058 	sw	s1,88(sp)
bfc01754:	afb00054 	sw	s0,84(sp)
bfc01758:	00801821 	move	v1,a0
bfc0175c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc01760:	10e00003 	beqz	a3,bfc01770 <printbase+0x30>
bfc01764:	00c09021 	move	s2,a2
bfc01768:	0480002f 	bltz	a0,bfc01828 <printbase+0xe8>
bfc0176c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc01770:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01774:	1200000c 	beqz	s0,bfc017a8 <printbase+0x68>
bfc01778:	00008821 	move	s1,zero
bfc0177c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01780:	16400002 	bnez	s2,bfc0178c <printbase+0x4c>
bfc01784:	0212001b 	divu	zero,s0,s2
bfc01788:	0007000d 	break	0x7
bfc0178c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01790:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01794:	00001010 	mfhi	v0
bfc01798:	a0820000 	sb	v0,0(a0)
bfc0179c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc017a0:	1460fff7 	bnez	v1,bfc01780 <printbase+0x40>
bfc017a4:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc017a8:	0233102a 	slt	v0,s1,s3
bfc017ac:	10400002 	beqz	v0,bfc017b8 <printbase+0x78>
bfc017b0:	02201821 	move	v1,s1
bfc017b4:	02601821 	move	v1,s3
bfc017b8:	1060000c 	beqz	v1,bfc017ec <printbase+0xac>
bfc017bc:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc017c0:	27a20010 	addiu	v0,sp,16
bfc017c4:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc017c8:	26020001 	addiu	v0,s0,1
bfc017cc:	0222102a 	slt	v0,s1,v0
bfc017d0:	1040000e 	beqz	v0,bfc0180c <printbase+0xcc>
bfc017d4:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc017d8:	02009821 	move	s3,s0
bfc017dc:	0ff00595 	jal	bfc01654 <putchar>
bfc017e0:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc017e4:	1660fff8 	bnez	s3,bfc017c8 <printbase+0x88>
bfc017e8:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc017ec:	8fbf0064 	lw	ra,100(sp)
bfc017f0:	00001021 	move	v0,zero
bfc017f4:	8fb30060 	lw	s3,96(sp)
bfc017f8:	8fb2005c 	lw	s2,92(sp)
bfc017fc:	8fb10058 	lw	s1,88(sp)
bfc01800:	8fb00054 	lw	s0,84(sp)
bfc01804:	03e00008 	jr	ra
bfc01808:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc0180c:	82440000 	lb	a0,0(s2)
bfc01810:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01814:	2882000a 	slti	v0,a0,10
bfc01818:	14400007 	bnez	v0,bfc01838 <printbase+0xf8>
bfc0181c:	02009821 	move	s3,s0
bfc01820:	0bf005f7 	j	bfc017dc <printbase+0x9c>
bfc01824:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc01828:	0ff00595 	jal	bfc01654 <putchar>
bfc0182c:	00038023 	negu	s0,v1
bfc01830:	0bf005dd 	j	bfc01774 <printbase+0x34>
bfc01834:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01838:	0bf005f6 	j	bfc017d8 <printbase+0x98>
bfc0183c:	24840030 	addiu	a0,a0,48

bfc01840 <strcmp>:
strcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:6
bfc01840:	0bf00613 	j	bfc0184c <strcmp+0xc>
bfc01844:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:8
bfc01848:	00c02821 	move	a1,a2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:7
bfc0184c:	80a30000 	lb	v1,0(a1)
bfc01850:	80820000 	lb	v0,0(a0)
bfc01854:	00000000 	nop
bfc01858:	14620005 	bne	v1,v0,bfc01870 <strcmp+0x30>
bfc0185c:	24a60001 	addiu	a2,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:8
bfc01860:	1460fff9 	bnez	v1,bfc01848 <strcmp+0x8>
bfc01864:	24840001 	addiu	a0,a0,1
bfc01868:	03e00008 	jr	ra
bfc0186c:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:10
bfc01870:	90830000 	lbu	v1,0(a0)
bfc01874:	90a20000 	lbu	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/strcmp.c:11
bfc01878:	03e00008 	jr	ra
bfc0187c:	00621023 	subu	v0,v1,v0

bfc01880 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc01880:	3c01bfd0 	lui	at,0xbfd0
bfc01884:	3421e000 	ori	at,at,0xe000
bfc01888:	8c220000 	lw	v0,0(at)
bfc0188c:	03e00008 	jr	ra
bfc01890:	00000000 	nop

bfc01894 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc01894:	3c01bfd0 	lui	at,0xbfd0
bfc01898:	3421e000 	ori	at,at,0xe000
bfc0189c:	8c220000 	lw	v0,0(at)
bfc018a0:	03e00008 	jr	ra
bfc018a4:	00000000 	nop

bfc018a8 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc018a8:	3c01bfd0 	lui	at,0xbfd0
bfc018ac:	3421e000 	ori	at,at,0xe000
bfc018b0:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc018b4:	03e00008 	jr	ra
bfc018b8:	00021040 	sll	v0,v0,0x1

bfc018bc <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc018bc:	3c01bfd0 	lui	at,0xbfd0
bfc018c0:	3421e000 	ori	at,at,0xe000
bfc018c4:	8c220000 	lw	v0,0(at)
bfc018c8:	03e00008 	jr	ra
bfc018cc:	00000000 	nop

bfc018d0 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc018d0:	27bdffe8 	addiu	sp,sp,-24
bfc018d4:	afbf0014 	sw	ra,20(sp)
bfc018d8:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc018dc:	3c01bfd0 	lui	at,0xbfd0
bfc018e0:	3421e000 	ori	at,at,0xe000
bfc018e4:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc018e8:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc018ec:	14400002 	bnez	v0,bfc018f8 <clock_gettime+0x28>
bfc018f0:	0062001b 	divu	zero,v1,v0
bfc018f4:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc018f8:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc018fc:	3c073b9a 	lui	a3,0x3b9a
bfc01900:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01904:	3c048000 	lui	a0,0x8000
bfc01908:	24840730 	addiu	a0,a0,1840
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0190c:	00003012 	mflo	a2
bfc01910:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01914:	14400002 	bnez	v0,bfc01920 <clock_gettime+0x50>
bfc01918:	0062001b 	divu	zero,v1,v0
bfc0191c:	0007000d 	break	0x7
bfc01920:	00002810 	mfhi	a1
bfc01924:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc01928:	14400002 	bnez	v0,bfc01934 <clock_gettime+0x64>
bfc0192c:	00c2001b 	divu	zero,a2,v0
bfc01930:	0007000d 	break	0x7
bfc01934:	00005010 	mfhi	t2
bfc01938:	ad2a0008 	sw	t2,8(t1)
bfc0193c:	00004012 	mflo	t0
bfc01940:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc01944:	14e00002 	bnez	a3,bfc01950 <clock_gettime+0x80>
bfc01948:	00c7001b 	divu	zero,a2,a3
bfc0194c:	0007000d 	break	0x7
bfc01950:	00003012 	mflo	a2
bfc01954:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc01958:	14400002 	bnez	v0,bfc01964 <clock_gettime+0x94>
bfc0195c:	0102001b 	divu	zero,t0,v0
bfc01960:	0007000d 	break	0x7
bfc01964:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01968:	0ff004fc 	jal	bfc013f0 <printf>
bfc0196c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc01970:	8fbf0014 	lw	ra,20(sp)
bfc01974:	00001021 	move	v0,zero
bfc01978:	03e00008 	jr	ra
bfc0197c:	27bd0018 	addiu	sp,sp,24

bfc01980 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc01980:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc01984:	03e00008 	jr	ra
bfc01988:	00000000 	nop

bfc0198c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0198c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc01990:	03e00008 	jr	ra
bfc01994:	00000000 	nop

bfc01998 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc01998:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc0199c:	27bdffe8 	addiu	sp,sp,-24
bfc019a0:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc019a4:	0ff004fc 	jal	bfc013f0 <printf>
bfc019a8:	24840744 	addiu	a0,a0,1860
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc019ac:	3c048000 	lui	a0,0x8000
bfc019b0:	24840760 	addiu	a0,a0,1888
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc019b4:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc019b8:	0ff004fc 	jal	bfc013f0 <printf>
bfc019bc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc019c0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc019c4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc019c8:	24840770 	addiu	a0,a0,1904
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc019cc:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc019d0:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc019d4:	0bf004fc 	j	bfc013f0 <printf>
bfc019d8:	00000000 	nop
bfc019dc:	00000000 	nop
