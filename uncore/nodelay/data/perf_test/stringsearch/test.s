
obj/stringsearch/main.elf:     file format elf32-tradlittlemips
obj/stringsearch/main.elf


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
bfc00010:	27bd4ccc 	addiu	sp,sp,19660
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c8cf0 	addiu	gp,gp,-29456
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
bfc00380:	0ff00586 	jal	bfc01618 <exception>
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
bfc003a4:	0ff0040e 	jal	bfc01038 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff00545 	jal	bfc01514 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	0ff001f8 	jal	bfc007e0 <search_small>
bfc003b8:	00408821 	move	s1,v0
bfc003bc:	0ff00545 	jal	bfc01514 <get_count>
bfc003c0:	00408021 	move	s0,v0
bfc003c4:	1200001a 	beqz	s0,bfc00430 <shell+0xa0>
bfc003c8:	00518823 	subu	s1,v0,s1
bfc003cc:	3c188000 	lui	t8,0x8000
bfc003d0:	0ff0040e 	jal	bfc01038 <puts>
bfc003d4:	27040030 	addiu	a0,t8,48
bfc003d8:	3c0fbfd0 	lui	t7,0xbfd0
bfc003dc:	3c1fbfd0 	lui	ra,0xbfd0
bfc003e0:	3c108000 	lui	s0,0x8000
bfc003e4:	37f9f010 	ori	t9,ra,0xf010
bfc003e8:	35eaf000 	ori	t2,t7,0xf000
bfc003ec:	35eef008 	ori	t6,t7,0xf008
bfc003f0:	35ecf004 	ori	t4,t7,0xf004
bfc003f4:	240d0001 	li	t5,1
bfc003f8:	240b0002 	li	t3,2
bfc003fc:	adcd0000 	sw	t5,0(t6)
bfc00400:	26040048 	addiu	a0,s0,72
bfc00404:	ad8b0000 	sw	t3,0(t4)
bfc00408:	02202821 	move	a1,s1
bfc0040c:	ad400000 	sw	zero,0(t2)
bfc00410:	8fbf001c 	lw	ra,28(sp)
bfc00414:	af310000 	sw	s1,0(t9)
bfc00418:	8fb00014 	lw	s0,20(sp)
bfc0041c:	8fb10018 	lw	s1,24(sp)
bfc00420:	0bf00348 	j	bfc00d20 <printf>
bfc00424:	27bd0020 	addiu	sp,sp,32
	...
bfc00430:	3c098000 	lui	t1,0x8000
bfc00434:	0ff0040e 	jal	bfc01038 <puts>
bfc00438:	2524001c 	addiu	a0,t1,28
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
bfc00464:	26040048 	addiu	a0,s0,72
bfc00468:	acc20000 	sw	v0,0(a2)
bfc0046c:	8fbf001c 	lw	ra,28(sp)
bfc00470:	aca70000 	sw	a3,0(a1)
bfc00474:	8fb00014 	lw	s0,20(sp)
bfc00478:	02202821 	move	a1,s1
bfc0047c:	af310000 	sw	s1,0(t9)
bfc00480:	8fb10018 	lw	s1,24(sp)
bfc00484:	0bf00348 	j	bfc00d20 <printf>
bfc00488:	27bd0020 	addiu	sp,sp,32
bfc0048c:	00000000 	nop

bfc00490 <init_search>:
init_search():
bfc00490:	27bdffe8 	addiu	sp,sp,-24
bfc00494:	afb00010 	sw	s0,16(sp)
bfc00498:	afbf0014 	sw	ra,20(sp)
bfc0049c:	0ff0045c 	jal	bfc01170 <strlen>
bfc004a0:	00808021 	move	s0,a0
bfc004a4:	3c038000 	lui	v1,0x8000
bfc004a8:	00403021 	move	a2,v0
bfc004ac:	24690d10 	addiu	t1,v1,3344
bfc004b0:	af828010 	sw	v0,-32752(gp)
bfc004b4:	3c028000 	lui	v0,0x8000
bfc004b8:	24421110 	addiu	v0,v0,4368
bfc004bc:	01201821 	move	v1,t1
bfc004c0:	ac660000 	sw	a2,0(v1)
bfc004c4:	ac660004 	sw	a2,4(v1)
bfc004c8:	ac660008 	sw	a2,8(v1)
bfc004cc:	ac66000c 	sw	a2,12(v1)
bfc004d0:	ac660010 	sw	a2,16(v1)
bfc004d4:	ac660014 	sw	a2,20(v1)
bfc004d8:	ac660018 	sw	a2,24(v1)
bfc004dc:	ac66001c 	sw	a2,28(v1)
bfc004e0:	24630020 	addiu	v1,v1,32
bfc004e4:	1462fff6 	bne	v1,v0,bfc004c0 <init_search+0x30>
bfc004e8:	00000000 	nop
bfc004ec:	10c00078 	beqz	a2,bfc006d0 <init_search+0x240>
bfc004f0:	24c5ffff 	addiu	a1,a2,-1
bfc004f4:	920b0000 	lbu	t3,0(s0)
bfc004f8:	24070001 	li	a3,1
bfc004fc:	000b5080 	sll	t2,t3,0x2
bfc00500:	01494021 	addu	t0,t2,t1
bfc00504:	00e6202b 	sltu	a0,a3,a2
bfc00508:	ad050000 	sw	a1,0(t0)
bfc0050c:	30a30007 	andi	v1,a1,0x7
bfc00510:	1080006f 	beqz	a0,bfc006d0 <init_search+0x240>
bfc00514:	24c8fffe 	addiu	t0,a2,-2
bfc00518:	1060003f 	beqz	v1,bfc00618 <init_search+0x188>
bfc0051c:	00000000 	nop
bfc00520:	10670034 	beq	v1,a3,bfc005f4 <init_search+0x164>
bfc00524:	240a0002 	li	t2,2
bfc00528:	106a002b 	beq	v1,t2,bfc005d8 <init_search+0x148>
bfc0052c:	24190003 	li	t9,3
bfc00530:	10790022 	beq	v1,t9,bfc005bc <init_search+0x12c>
bfc00534:	24050004 	li	a1,4
bfc00538:	10650019 	beq	v1,a1,bfc005a0 <init_search+0x110>
bfc0053c:	240b0005 	li	t3,5
bfc00540:	106b0010 	beq	v1,t3,bfc00584 <init_search+0xf4>
bfc00544:	240c0006 	li	t4,6
bfc00548:	106c0008 	beq	v1,t4,bfc0056c <init_search+0xdc>
bfc0054c:	02071821 	addu	v1,s0,a3
bfc00550:	920f0001 	lbu	t7,1(s0)
bfc00554:	24070002 	li	a3,2
bfc00558:	000f7080 	sll	t6,t7,0x2
bfc0055c:	01c96821 	addu	t5,t6,t1
bfc00560:	ada80000 	sw	t0,0(t5)
bfc00564:	2508ffff 	addiu	t0,t0,-1
bfc00568:	02071821 	addu	v1,s0,a3
bfc0056c:	90620000 	lbu	v0,0(v1)
bfc00570:	24e70001 	addiu	a3,a3,1
bfc00574:	0002f880 	sll	ra,v0,0x2
bfc00578:	03e9c021 	addu	t8,ra,t1
bfc0057c:	af080000 	sw	t0,0(t8)
bfc00580:	2508ffff 	addiu	t0,t0,-1
bfc00584:	02072821 	addu	a1,s0,a3
bfc00588:	90b90000 	lbu	t9,0(a1)
bfc0058c:	24e70001 	addiu	a3,a3,1
bfc00590:	00195080 	sll	t2,t9,0x2
bfc00594:	01492021 	addu	a0,t2,t1
bfc00598:	ac880000 	sw	t0,0(a0)
bfc0059c:	2508ffff 	addiu	t0,t0,-1
bfc005a0:	02077021 	addu	t6,s0,a3
bfc005a4:	91cd0000 	lbu	t5,0(t6)
bfc005a8:	24e70001 	addiu	a3,a3,1
bfc005ac:	000d6080 	sll	t4,t5,0x2
bfc005b0:	01895821 	addu	t3,t4,t1
bfc005b4:	ad680000 	sw	t0,0(t3)
bfc005b8:	2508ffff 	addiu	t0,t0,-1
bfc005bc:	02071021 	addu	v0,s0,a3
bfc005c0:	905f0000 	lbu	ra,0(v0)
bfc005c4:	24e70001 	addiu	a3,a3,1
bfc005c8:	001fc080 	sll	t8,ra,0x2
bfc005cc:	03097821 	addu	t7,t8,t1
bfc005d0:	ade80000 	sw	t0,0(t7)
bfc005d4:	2508ffff 	addiu	t0,t0,-1
bfc005d8:	0207c821 	addu	t9,s0,a3
bfc005dc:	932a0000 	lbu	t2,0(t9)
bfc005e0:	24e70001 	addiu	a3,a3,1
bfc005e4:	000a2080 	sll	a0,t2,0x2
bfc005e8:	00891821 	addu	v1,a0,t1
bfc005ec:	ac680000 	sw	t0,0(v1)
bfc005f0:	2508ffff 	addiu	t0,t0,-1
bfc005f4:	02077021 	addu	t6,s0,a3
bfc005f8:	91cd0000 	lbu	t5,0(t6)
bfc005fc:	24e70001 	addiu	a3,a3,1
bfc00600:	000d6080 	sll	t4,t5,0x2
bfc00604:	01895821 	addu	t3,t4,t1
bfc00608:	00e6282b 	sltu	a1,a3,a2
bfc0060c:	ad680000 	sw	t0,0(t3)
bfc00610:	10a0002f 	beqz	a1,bfc006d0 <init_search+0x240>
bfc00614:	2508ffff 	addiu	t0,t0,-1
bfc00618:	02072021 	addu	a0,s0,a3
bfc0061c:	90820000 	lbu	v0,0(a0)
bfc00620:	250dffff 	addiu	t5,t0,-1
bfc00624:	00021880 	sll	v1,v0,0x2
bfc00628:	0069f821 	addu	ra,v1,t1
bfc0062c:	afe80000 	sw	t0,0(ra)
bfc00630:	90980001 	lbu	t8,1(a0)
bfc00634:	2505fffe 	addiu	a1,t0,-2
bfc00638:	00187880 	sll	t7,t8,0x2
bfc0063c:	01e97021 	addu	t6,t7,t1
bfc00640:	adcd0000 	sw	t5,0(t6)
bfc00644:	908c0002 	lbu	t4,2(a0)
bfc00648:	00805021 	move	t2,a0
bfc0064c:	000c5880 	sll	t3,t4,0x2
bfc00650:	0169c821 	addu	t9,t3,t1
bfc00654:	af250000 	sw	a1,0(t9)
bfc00658:	0080c821 	move	t9,a0
bfc0065c:	90840003 	lbu	a0,3(a0)
bfc00660:	2503fffd 	addiu	v1,t0,-3
bfc00664:	00041080 	sll	v0,a0,0x2
bfc00668:	0049f821 	addu	ra,v0,t1
bfc0066c:	afe30000 	sw	v1,0(ra)
bfc00670:	91580004 	lbu	t8,4(t2)
bfc00674:	250efffc 	addiu	t6,t0,-4
bfc00678:	00187880 	sll	t7,t8,0x2
bfc0067c:	01e96821 	addu	t5,t7,t1
bfc00680:	adae0000 	sw	t6,0(t5)
bfc00684:	914c0005 	lbu	t4,5(t2)
bfc00688:	250afffb 	addiu	t2,t0,-5
bfc0068c:	000c5880 	sll	t3,t4,0x2
bfc00690:	01692821 	addu	a1,t3,t1
bfc00694:	acaa0000 	sw	t2,0(a1)
bfc00698:	93240006 	lbu	a0,6(t9)
bfc0069c:	2503fffa 	addiu	v1,t0,-6
bfc006a0:	00041080 	sll	v0,a0,0x2
bfc006a4:	0049f821 	addu	ra,v0,t1
bfc006a8:	afe30000 	sw	v1,0(ra)
bfc006ac:	93380007 	lbu	t8,7(t9)
bfc006b0:	24e70008 	addiu	a3,a3,8
bfc006b4:	00187880 	sll	t7,t8,0x2
bfc006b8:	250efff9 	addiu	t6,t0,-7
bfc006bc:	01e96821 	addu	t5,t7,t1
bfc006c0:	00e6602b 	sltu	t4,a3,a2
bfc006c4:	adae0000 	sw	t6,0(t5)
bfc006c8:	1580ffd3 	bnez	t4,bfc00618 <init_search+0x188>
bfc006cc:	2508fff8 	addiu	t0,t0,-8
bfc006d0:	8fbf0014 	lw	ra,20(sp)
bfc006d4:	af908014 	sw	s0,-32748(gp)
bfc006d8:	8fb00010 	lw	s0,16(sp)
bfc006dc:	03e00008 	jr	ra
bfc006e0:	27bd0018 	addiu	sp,sp,24
	...

bfc006f0 <strsearch>:
strsearch():
bfc006f0:	27bdffc8 	addiu	sp,sp,-56
bfc006f4:	afb50028 	sw	s5,40(sp)
bfc006f8:	8f958010 	lw	s5,-32752(gp)
bfc006fc:	afb40024 	sw	s4,36(sp)
bfc00700:	afb10018 	sw	s1,24(sp)
bfc00704:	afb00014 	sw	s0,20(sp)
bfc00708:	afbf0034 	sw	ra,52(sp)
bfc0070c:	afb70030 	sw	s7,48(sp)
bfc00710:	afb6002c 	sw	s6,44(sp)
bfc00714:	afb30020 	sw	s3,32(sp)
bfc00718:	afb2001c 	sw	s2,28(sp)
bfc0071c:	0080a021 	move	s4,a0
bfc00720:	0ff0045c 	jal	bfc01170 <strlen>
bfc00724:	26b0ffff 	addiu	s0,s5,-1
bfc00728:	00408821 	move	s1,v0
bfc0072c:	0202102b 	sltu	v0,s0,v0
bfc00730:	10400012 	beqz	v0,bfc0077c <strsearch+0x8c>
bfc00734:	3c058000 	lui	a1,0x8000
bfc00738:	24040001 	li	a0,1
bfc0073c:	8f978014 	lw	s7,-32748(gp)
bfc00740:	24b20d10 	addiu	s2,a1,3344
bfc00744:	0095b023 	subu	s6,a0,s5
bfc00748:	02904821 	addu	t1,s4,s0
bfc0074c:	91280000 	lbu	t0,0(t1)
bfc00750:	00000000 	nop
bfc00754:	00083880 	sll	a3,t0,0x2
bfc00758:	00f23021 	addu	a2,a3,s2
bfc0075c:	8cc20000 	lw	v0,0(a2)
bfc00760:	00000000 	nop
bfc00764:	10400012 	beqz	v0,bfc007b0 <strsearch+0xc0>
bfc00768:	02d05021 	addu	t2,s6,s0
bfc0076c:	02028021 	addu	s0,s0,v0
bfc00770:	0211182b 	sltu	v1,s0,s1
bfc00774:	1460fff5 	bnez	v1,bfc0074c <strsearch+0x5c>
bfc00778:	02904821 	addu	t1,s4,s0
bfc0077c:	00009821 	move	s3,zero
bfc00780:	8fbf0034 	lw	ra,52(sp)
bfc00784:	02601021 	move	v0,s3
bfc00788:	8fb70030 	lw	s7,48(sp)
bfc0078c:	8fb6002c 	lw	s6,44(sp)
bfc00790:	8fb50028 	lw	s5,40(sp)
bfc00794:	8fb40024 	lw	s4,36(sp)
bfc00798:	8fb30020 	lw	s3,32(sp)
bfc0079c:	8fb2001c 	lw	s2,28(sp)
bfc007a0:	8fb10018 	lw	s1,24(sp)
bfc007a4:	8fb00014 	lw	s0,20(sp)
bfc007a8:	03e00008 	jr	ra
bfc007ac:	27bd0038 	addiu	sp,sp,56
bfc007b0:	028a9821 	addu	s3,s4,t2
bfc007b4:	02e02021 	move	a0,s7
bfc007b8:	02602821 	move	a1,s3
bfc007bc:	02a03021 	move	a2,s5
bfc007c0:	0ff004a7 	jal	bfc0129c <strncmp>
bfc007c4:	26100001 	addiu	s0,s0,1
bfc007c8:	1040ffed 	beqz	v0,bfc00780 <strsearch+0x90>
bfc007cc:	0211182b 	sltu	v1,s0,s1
bfc007d0:	1460ffde 	bnez	v1,bfc0074c <strsearch+0x5c>
bfc007d4:	02904821 	addu	t1,s4,s0
bfc007d8:	0bf001e0 	j	bfc00780 <strsearch+0x90>
bfc007dc:	00009821 	move	s3,zero

bfc007e0 <search_small>:
search_small():
bfc007e0:	3c028000 	lui	v0,0x8000
bfc007e4:	27bdfd10 	addiu	sp,sp,-752
bfc007e8:	24460a48 	addiu	a2,v0,2632
bfc007ec:	afbf02ec 	sw	ra,748(sp)
bfc007f0:	afbe02e8 	sw	s8,744(sp)
bfc007f4:	afb702e4 	sw	s7,740(sp)
bfc007f8:	afb602e0 	sw	s6,736(sp)
bfc007fc:	afb502dc 	sw	s5,732(sp)
bfc00800:	afb402d8 	sw	s4,728(sp)
bfc00804:	afb302d4 	sw	s3,724(sp)
bfc00808:	afb202d0 	sw	s2,720(sp)
bfc0080c:	afb102cc 	sw	s1,716(sp)
bfc00810:	afb002c8 	sw	s0,712(sp)
bfc00814:	27a701d8 	addiu	a3,sp,472
bfc00818:	24c800e0 	addiu	t0,a2,224
bfc0081c:	8cc90000 	lw	t1,0(a2)
bfc00820:	8cc30004 	lw	v1,4(a2)
bfc00824:	8cc40008 	lw	a0,8(a2)
bfc00828:	8cc5000c 	lw	a1,12(a2)
bfc0082c:	24c60010 	addiu	a2,a2,16
bfc00830:	ace90000 	sw	t1,0(a3)
bfc00834:	ace30004 	sw	v1,4(a3)
bfc00838:	ace40008 	sw	a0,8(a3)
bfc0083c:	ace5000c 	sw	a1,12(a3)
bfc00840:	14c8fff6 	bne	a2,t0,bfc0081c <search_small+0x3c>
bfc00844:	24e70010 	addiu	a3,a3,16
bfc00848:	8cc80000 	lw	t0,0(a2)
bfc0084c:	8cca0004 	lw	t2,4(a2)
bfc00850:	3c0b8000 	lui	t3,0x8000
bfc00854:	25660964 	addiu	a2,t3,2404
bfc00858:	27a90010 	addiu	t1,sp,16
bfc0085c:	ace80000 	sw	t0,0(a3)
bfc00860:	acea0004 	sw	t2,4(a3)
bfc00864:	24c800e0 	addiu	t0,a2,224
bfc00868:	01203821 	move	a3,t1
bfc0086c:	8ccf0000 	lw	t7,0(a2)
bfc00870:	8cce0004 	lw	t6,4(a2)
bfc00874:	8ccd0008 	lw	t5,8(a2)
bfc00878:	8ccc000c 	lw	t4,12(a2)
bfc0087c:	24c60010 	addiu	a2,a2,16
bfc00880:	acef0000 	sw	t7,0(a3)
bfc00884:	acee0004 	sw	t6,4(a3)
bfc00888:	aced0008 	sw	t5,8(a3)
bfc0088c:	acec000c 	sw	t4,12(a3)
bfc00890:	14c8fff6 	bne	a2,t0,bfc0086c <search_small+0x8c>
bfc00894:	24e70010 	addiu	a3,a3,16
bfc00898:	8cd00000 	lw	s0,0(a2)
bfc0089c:	3c118000 	lui	s1,0x8000
bfc008a0:	26260880 	addiu	a2,s1,2176
bfc008a4:	acf00000 	sw	s0,0(a3)
bfc008a8:	24c800e0 	addiu	t0,a2,224
bfc008ac:	27a700f4 	addiu	a3,sp,244
bfc008b0:	8cd50000 	lw	s5,0(a2)
bfc008b4:	8cd40004 	lw	s4,4(a2)
bfc008b8:	8cd30008 	lw	s3,8(a2)
bfc008bc:	8cd2000c 	lw	s2,12(a2)
bfc008c0:	24c60010 	addiu	a2,a2,16
bfc008c4:	acf50000 	sw	s5,0(a3)
bfc008c8:	acf40004 	sw	s4,4(a3)
bfc008cc:	acf30008 	sw	s3,8(a3)
bfc008d0:	acf2000c 	sw	s2,12(a3)
bfc008d4:	14c8fff6 	bne	a2,t0,bfc008b0 <search_small+0xd0>
bfc008d8:	24e70010 	addiu	a3,a3,16
bfc008dc:	8cd70000 	lw	s7,0(a2)
bfc008e0:	8fb601d8 	lw	s6,472(sp)
bfc008e4:	00000000 	nop
bfc008e8:	12c0010b 	beqz	s6,bfc00d18 <search_small+0x538>
bfc008ec:	acf70000 	sw	s7,0(a3)
bfc008f0:	3c068000 	lui	a2,0x8000
bfc008f4:	24d50d10 	addiu	s5,a2,3344
bfc008f8:	0120f021 	move	s8,t1
bfc008fc:	afa002c4 	sw	zero,708(sp)
bfc00900:	afa002c0 	sw	zero,704(sp)
bfc00904:	0ff0045c 	jal	bfc01170 <strlen>
bfc00908:	02c02021 	move	a0,s6
bfc0090c:	3c088000 	lui	t0,0x8000
bfc00910:	25030d10 	addiu	v1,t0,3344
bfc00914:	2469000c 	addiu	t1,v1,12
bfc00918:	25240004 	addiu	a0,t1,4
bfc0091c:	24850004 	addiu	a1,a0,4
bfc00920:	ac620000 	sw	v0,0(v1)
bfc00924:	ac620004 	sw	v0,4(v1)
bfc00928:	ac620008 	sw	v0,8(v1)
bfc0092c:	00409821 	move	s3,v0
bfc00930:	ad220000 	sw	v0,0(t1)
bfc00934:	ac820000 	sw	v0,0(a0)
bfc00938:	aca20000 	sw	v0,0(a1)
bfc0093c:	24a20004 	addiu	v0,a1,4
bfc00940:	24590004 	addiu	t9,v0,4
bfc00944:	3c188000 	lui	t8,0x8000
bfc00948:	ac530000 	sw	s3,0(v0)
bfc0094c:	27071110 	addiu	a3,t8,4368
bfc00950:	27220004 	addiu	v0,t9,4
bfc00954:	af330000 	sw	s3,0(t9)
bfc00958:	1047000e 	beq	v0,a3,bfc00994 <search_small+0x1b4>
bfc0095c:	af938010 	sw	s3,-32752(gp)
bfc00960:	3c0a8000 	lui	t2,0x8000
bfc00964:	ac530000 	sw	s3,0(v0)
bfc00968:	ac530004 	sw	s3,4(v0)
bfc0096c:	ac530008 	sw	s3,8(v0)
bfc00970:	ac53000c 	sw	s3,12(v0)
bfc00974:	ac530010 	sw	s3,16(v0)
bfc00978:	ac530014 	sw	s3,20(v0)
bfc0097c:	ac530018 	sw	s3,24(v0)
bfc00980:	ac53001c 	sw	s3,28(v0)
bfc00984:	255f1110 	addiu	ra,t2,4368
bfc00988:	24420020 	addiu	v0,v0,32
bfc0098c:	145ffff5 	bne	v0,ra,bfc00964 <search_small+0x184>
bfc00990:	00000000 	nop
bfc00994:	126000d7 	beqz	s3,bfc00cf4 <search_small+0x514>
bfc00998:	00000000 	nop
bfc0099c:	92ce0000 	lbu	t6,0(s6)
bfc009a0:	24060001 	li	a2,1
bfc009a4:	000e6880 	sll	t5,t6,0x2
bfc009a8:	2671ffff 	addiu	s1,s3,-1
bfc009ac:	01b56021 	addu	t4,t5,s5
bfc009b0:	00d3582b 	sltu	t3,a2,s3
bfc009b4:	ad910000 	sw	s1,0(t4)
bfc009b8:	32240007 	andi	a0,s1,0x7
bfc009bc:	1160006e 	beqz	t3,bfc00b78 <search_small+0x398>
bfc009c0:	2667fffe 	addiu	a3,s3,-2
bfc009c4:	1080003f 	beqz	a0,bfc00ac4 <search_small+0x2e4>
bfc009c8:	00000000 	nop
bfc009cc:	10860034 	beq	a0,a2,bfc00aa0 <search_small+0x2c0>
bfc009d0:	240c0002 	li	t4,2
bfc009d4:	108c002b 	beq	a0,t4,bfc00a84 <search_small+0x2a4>
bfc009d8:	240d0003 	li	t5,3
bfc009dc:	108d0022 	beq	a0,t5,bfc00a68 <search_small+0x288>
bfc009e0:	240e0004 	li	t6,4
bfc009e4:	108e0019 	beq	a0,t6,bfc00a4c <search_small+0x26c>
bfc009e8:	240f0005 	li	t7,5
bfc009ec:	108f0010 	beq	a0,t7,bfc00a30 <search_small+0x250>
bfc009f0:	24140006 	li	s4,6
bfc009f4:	10940008 	beq	a0,s4,bfc00a18 <search_small+0x238>
bfc009f8:	02c61021 	addu	v0,s6,a2
bfc009fc:	92d20001 	lbu	s2,1(s6)
bfc00a00:	24060002 	li	a2,2
bfc00a04:	00128080 	sll	s0,s2,0x2
bfc00a08:	0215c021 	addu	t8,s0,s5
bfc00a0c:	af070000 	sw	a3,0(t8)
bfc00a10:	2667fffd 	addiu	a3,s3,-3
bfc00a14:	02c61021 	addu	v0,s6,a2
bfc00a18:	90450000 	lbu	a1,0(v0)
bfc00a1c:	24c60001 	addiu	a2,a2,1
bfc00a20:	0005c880 	sll	t9,a1,0x2
bfc00a24:	0335b821 	addu	s7,t9,s5
bfc00a28:	aee70000 	sw	a3,0(s7)
bfc00a2c:	24e7ffff 	addiu	a3,a3,-1
bfc00a30:	02c61821 	addu	v1,s6,a2
bfc00a34:	90680000 	lbu	t0,0(v1)
bfc00a38:	24c60001 	addiu	a2,a2,1
bfc00a3c:	00084880 	sll	t1,t0,0x2
bfc00a40:	01352021 	addu	a0,t1,s5
bfc00a44:	ac870000 	sw	a3,0(a0)
bfc00a48:	24e7ffff 	addiu	a3,a3,-1
bfc00a4c:	02c66021 	addu	t4,s6,a2
bfc00a50:	918b0000 	lbu	t3,0(t4)
bfc00a54:	24c60001 	addiu	a2,a2,1
bfc00a58:	000b5080 	sll	t2,t3,0x2
bfc00a5c:	0155f821 	addu	ra,t2,s5
bfc00a60:	afe70000 	sw	a3,0(ra)
bfc00a64:	24e7ffff 	addiu	a3,a3,-1
bfc00a68:	02c6a021 	addu	s4,s6,a2
bfc00a6c:	928f0000 	lbu	t7,0(s4)
bfc00a70:	24c60001 	addiu	a2,a2,1
bfc00a74:	000f7080 	sll	t6,t7,0x2
bfc00a78:	01d56821 	addu	t5,t6,s5
bfc00a7c:	ada70000 	sw	a3,0(t5)
bfc00a80:	24e7ffff 	addiu	a3,a3,-1
bfc00a84:	02c6b821 	addu	s7,s6,a2
bfc00a88:	92f20000 	lbu	s2,0(s7)
bfc00a8c:	24c60001 	addiu	a2,a2,1
bfc00a90:	00128080 	sll	s0,s2,0x2
bfc00a94:	0215c021 	addu	t8,s0,s5
bfc00a98:	af070000 	sw	a3,0(t8)
bfc00a9c:	24e7ffff 	addiu	a3,a3,-1
bfc00aa0:	02c64821 	addu	t1,s6,a2
bfc00aa4:	91240000 	lbu	a0,0(t1)
bfc00aa8:	24c60001 	addiu	a2,a2,1
bfc00aac:	00041080 	sll	v0,a0,0x2
bfc00ab0:	00552821 	addu	a1,v0,s5
bfc00ab4:	00d3c82b 	sltu	t9,a2,s3
bfc00ab8:	aca70000 	sw	a3,0(a1)
bfc00abc:	1320002e 	beqz	t9,bfc00b78 <search_small+0x398>
bfc00ac0:	24e7ffff 	addiu	a3,a3,-1
bfc00ac4:	02c65821 	addu	t3,s6,a2
bfc00ac8:	916a0000 	lbu	t2,0(t3)
bfc00acc:	24e2ffff 	addiu	v0,a3,-1
bfc00ad0:	000af880 	sll	ra,t2,0x2
bfc00ad4:	03f54021 	addu	t0,ra,s5
bfc00ad8:	ad070000 	sw	a3,0(t0)
bfc00adc:	91630001 	lbu	v1,1(t3)
bfc00ae0:	24f8fffe 	addiu	t8,a3,-2
bfc00ae4:	00034880 	sll	t1,v1,0x2
bfc00ae8:	01352021 	addu	a0,t1,s5
bfc00aec:	ac820000 	sw	v0,0(a0)
bfc00af0:	91650002 	lbu	a1,2(t3)
bfc00af4:	24effffd 	addiu	t7,a3,-3
bfc00af8:	0005c880 	sll	t9,a1,0x2
bfc00afc:	0335b821 	addu	s7,t9,s5
bfc00b00:	aef80000 	sw	t8,0(s7)
bfc00b04:	91720003 	lbu	s2,3(t3)
bfc00b08:	0160a021 	move	s4,t3
bfc00b0c:	00128080 	sll	s0,s2,0x2
bfc00b10:	02157021 	addu	t6,s0,s5
bfc00b14:	adcf0000 	sw	t7,0(t6)
bfc00b18:	916d0004 	lbu	t5,4(t3)
bfc00b1c:	24ebfffc 	addiu	t3,a3,-4
bfc00b20:	000d6080 	sll	t4,t5,0x2
bfc00b24:	01955021 	addu	t2,t4,s5
bfc00b28:	ad4b0000 	sw	t3,0(t2)
bfc00b2c:	929f0005 	lbu	ra,5(s4)
bfc00b30:	24e3fffb 	addiu	v1,a3,-5
bfc00b34:	001f4080 	sll	t0,ra,0x2
bfc00b38:	01154821 	addu	t1,t0,s5
bfc00b3c:	ad230000 	sw	v1,0(t1)
bfc00b40:	92840006 	lbu	a0,6(s4)
bfc00b44:	24e5fffa 	addiu	a1,a3,-6
bfc00b48:	00041080 	sll	v0,a0,0x2
bfc00b4c:	0055c821 	addu	t9,v0,s5
bfc00b50:	af250000 	sw	a1,0(t9)
bfc00b54:	92970007 	lbu	s7,7(s4)
bfc00b58:	24c60008 	addiu	a2,a2,8
bfc00b5c:	0017a080 	sll	s4,s7,0x2
bfc00b60:	24f2fff9 	addiu	s2,a3,-7
bfc00b64:	02958021 	addu	s0,s4,s5
bfc00b68:	00d3782b 	sltu	t7,a2,s3
bfc00b6c:	ae120000 	sw	s2,0(s0)
bfc00b70:	15e0ffd4 	bnez	t7,bfc00ac4 <search_small+0x2e4>
bfc00b74:	24e7fff8 	addiu	a3,a3,-8
bfc00b78:	8fd20000 	lw	s2,0(s8)
bfc00b7c:	af968014 	sw	s6,-32748(gp)
bfc00b80:	0ff0045c 	jal	bfc01170 <strlen>
bfc00b84:	02402021 	move	a0,s2
bfc00b88:	0222302b 	sltu	a2,s1,v0
bfc00b8c:	10c00010 	beqz	a2,bfc00bd0 <search_small+0x3f0>
bfc00b90:	00408021 	move	s0,v0
bfc00b94:	240c0001 	li	t4,1
bfc00b98:	0193b823 	subu	s7,t4,s3
bfc00b9c:	0251a021 	addu	s4,s2,s1
bfc00ba0:	928f0000 	lbu	t7,0(s4)
bfc00ba4:	00000000 	nop
bfc00ba8:	000f7080 	sll	t6,t7,0x2
bfc00bac:	01d56821 	addu	t5,t6,s5
bfc00bb0:	8da20000 	lw	v0,0(t5)
bfc00bb4:	00000000 	nop
bfc00bb8:	1040002d 	beqz	v0,bfc00c70 <search_small+0x490>
bfc00bbc:	0237c021 	addu	t8,s1,s7
bfc00bc0:	02228821 	addu	s1,s1,v0
bfc00bc4:	0230382b 	sltu	a3,s1,s0
bfc00bc8:	14e0fff5 	bnez	a3,bfc00ba0 <search_small+0x3c0>
bfc00bcc:	0251a021 	addu	s4,s2,s1
bfc00bd0:	0000a021 	move	s4,zero
bfc00bd4:	3c068000 	lui	a2,0x8000
bfc00bd8:	3c0b8000 	lui	t3,0x8000
bfc00bdc:	24c4006c 	addiu	a0,a2,108
bfc00be0:	02c02821 	move	a1,s6
bfc00be4:	02403821 	move	a3,s2
bfc00be8:	0ff00348 	jal	bfc00d20 <printf>
bfc00bec:	256602cc 	addiu	a2,t3,716
bfc00bf0:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00bf4:	2404000a 	li	a0,10
bfc00bf8:	8fb902c0 	lw	t9,704(sp)
bfc00bfc:	27b700f4 	addiu	s7,sp,244
bfc00c00:	02f99021 	addu	s2,s7,t9
bfc00c04:	8e500000 	lw	s0,0(s2)
bfc00c08:	00000000 	nop
bfc00c0c:	12000024 	beqz	s0,bfc00ca0 <search_small+0x4c0>
bfc00c10:	00000000 	nop
bfc00c14:	1280003b 	beqz	s4,bfc00d04 <search_small+0x524>
bfc00c18:	00000000 	nop
bfc00c1c:	8fa802c0 	lw	t0,704(sp)
bfc00c20:	27aa01d8 	addiu	t2,sp,472
bfc00c24:	0148f821 	addu	ra,t2,t0
bfc00c28:	8ff60004 	lw	s6,4(ra)
bfc00c2c:	25030004 	addiu	v1,t0,4
bfc00c30:	afa302c0 	sw	v1,704(sp)
bfc00c34:	16c0ff33 	bnez	s6,bfc00904 <search_small+0x124>
bfc00c38:	27de0004 	addiu	s8,s8,4
bfc00c3c:	8fbf02ec 	lw	ra,748(sp)
bfc00c40:	8fa202c4 	lw	v0,708(sp)
bfc00c44:	8fbe02e8 	lw	s8,744(sp)
bfc00c48:	8fb702e4 	lw	s7,740(sp)
bfc00c4c:	8fb602e0 	lw	s6,736(sp)
bfc00c50:	8fb502dc 	lw	s5,732(sp)
bfc00c54:	8fb402d8 	lw	s4,728(sp)
bfc00c58:	8fb302d4 	lw	s3,724(sp)
bfc00c5c:	8fb202d0 	lw	s2,720(sp)
bfc00c60:	8fb102cc 	lw	s1,716(sp)
bfc00c64:	8fb002c8 	lw	s0,712(sp)
bfc00c68:	03e00008 	jr	ra
bfc00c6c:	27bd02f0 	addiu	sp,sp,752
bfc00c70:	0258a021 	addu	s4,s2,t8
bfc00c74:	02c02021 	move	a0,s6
bfc00c78:	02802821 	move	a1,s4
bfc00c7c:	02603021 	move	a2,s3
bfc00c80:	0ff004a7 	jal	bfc0129c <strncmp>
bfc00c84:	26310001 	addiu	s1,s1,1
bfc00c88:	1040000c 	beqz	v0,bfc00cbc <search_small+0x4dc>
bfc00c8c:	0230182b 	sltu	v1,s1,s0
bfc00c90:	1460ffc2 	bnez	v1,bfc00b9c <search_small+0x3bc>
bfc00c94:	0000a021 	move	s4,zero
bfc00c98:	0bf002f6 	j	bfc00bd8 <search_small+0x3f8>
bfc00c9c:	3c068000 	lui	a2,0x8000
bfc00ca0:	1280ffde 	beqz	s4,bfc00c1c <search_small+0x43c>
bfc00ca4:	00000000 	nop
bfc00ca8:	8fa902c4 	lw	t1,708(sp)
bfc00cac:	00000000 	nop
bfc00cb0:	25240001 	addiu	a0,t1,1
bfc00cb4:	0bf00307 	j	bfc00c1c <search_small+0x43c>
bfc00cb8:	afa402c4 	sw	a0,708(sp)
bfc00cbc:	1280ffc5 	beqz	s4,bfc00bd4 <search_small+0x3f4>
bfc00cc0:	02c02821 	move	a1,s6
bfc00cc4:	3c138000 	lui	s3,0x8000
bfc00cc8:	3c118000 	lui	s1,0x8000
bfc00ccc:	2664006c 	addiu	a0,s3,108
bfc00cd0:	02403821 	move	a3,s2
bfc00cd4:	26260cac 	addiu	a2,s1,3244
bfc00cd8:	0ff00348 	jal	bfc00d20 <printf>
bfc00cdc:	3c168000 	lui	s6,0x8000
bfc00ce0:	26c40080 	addiu	a0,s6,128
bfc00ce4:	0ff00348 	jal	bfc00d20 <printf>
bfc00ce8:	02802821 	move	a1,s4
bfc00cec:	0bf002fc 	j	bfc00bf0 <search_small+0x410>
bfc00cf0:	00000000 	nop
bfc00cf4:	af968014 	sw	s6,-32748(gp)
bfc00cf8:	8fd20000 	lw	s2,0(s8)
bfc00cfc:	0bf002f5 	j	bfc00bd4 <search_small+0x3f4>
bfc00d00:	0000a021 	move	s4,zero
bfc00d04:	8fa202c4 	lw	v0,708(sp)
bfc00d08:	00000000 	nop
bfc00d0c:	24450001 	addiu	a1,v0,1
bfc00d10:	0bf00307 	j	bfc00c1c <search_small+0x43c>
bfc00d14:	afa502c4 	sw	a1,708(sp)
bfc00d18:	0bf0030f 	j	bfc00c3c <search_small+0x45c>
bfc00d1c:	afa002c4 	sw	zero,708(sp)

bfc00d20 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00d20:	27bdffc8 	addiu	sp,sp,-56
bfc00d24:	afb30024 	sw	s3,36(sp)
bfc00d28:	afbf0034 	sw	ra,52(sp)
bfc00d2c:	afb60030 	sw	s6,48(sp)
bfc00d30:	afb5002c 	sw	s5,44(sp)
bfc00d34:	afb40028 	sw	s4,40(sp)
bfc00d38:	afb20020 	sw	s2,32(sp)
bfc00d3c:	afb1001c 	sw	s1,28(sp)
bfc00d40:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d44:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00d48:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc00d4c:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00d50:	afa5003c 	sw	a1,60(sp)
bfc00d54:	afa60040 	sw	a2,64(sp)
bfc00d58:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d5c:	12000013 	beqz	s0,bfc00dac <printf+0x8c>
bfc00d60:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d64:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d68:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d6c:	24560b30 	addiu	s6,v0,2864
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d70:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d74:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d78:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d7c:	12140016 	beq	s0,s4,bfc00dd8 <printf+0xb8>
bfc00d80:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d84:	1215002f 	beq	s0,s5,bfc00e44 <printf+0x124>
bfc00d88:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc00d8c:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00d90:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d94:	26310001 	addiu	s1,s1,1
bfc00d98:	02711021 	addu	v0,s3,s1
bfc00d9c:	80500000 	lb	s0,0(v0)
bfc00da0:	00000000 	nop
bfc00da4:	1600fff5 	bnez	s0,bfc00d7c <printf+0x5c>
bfc00da8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc00dac:	8fbf0034 	lw	ra,52(sp)
bfc00db0:	00001021 	move	v0,zero
bfc00db4:	8fb60030 	lw	s6,48(sp)
bfc00db8:	8fb5002c 	lw	s5,44(sp)
bfc00dbc:	8fb40028 	lw	s4,40(sp)
bfc00dc0:	8fb30024 	lw	s3,36(sp)
bfc00dc4:	8fb20020 	lw	s2,32(sp)
bfc00dc8:	8fb1001c 	lw	s1,28(sp)
bfc00dcc:	8fb00018 	lw	s0,24(sp)
bfc00dd0:	03e00008 	jr	ra
bfc00dd4:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00dd8:	80440001 	lb	a0,1(v0)
bfc00ddc:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00de0:	2482ffdb 	addiu	v0,a0,-37
bfc00de4:	304200ff 	andi	v0,v0,0xff
bfc00de8:	2c430054 	sltiu	v1,v0,84
bfc00dec:	14600005 	bnez	v1,bfc00e04 <printf+0xe4>
bfc00df0:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc00df4:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00df8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00dfc:	0bf00366 	j	bfc00d98 <printf+0x78>
bfc00e00:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00e04:	02c21021 	addu	v0,s6,v0
bfc00e08:	8c430000 	lw	v1,0(v0)
bfc00e0c:	00000000 	nop
bfc00e10:	00600008 	jr	v1
bfc00e14:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00e18:	26310001 	addiu	s1,s1,1
bfc00e1c:	02711021 	addu	v0,s3,s1
bfc00e20:	80440001 	lb	a0,1(v0)
bfc00e24:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00e28:	2482ffcf 	addiu	v0,a0,-49
bfc00e2c:	304200ff 	andi	v0,v0,0xff
bfc00e30:	2c420009 	sltiu	v0,v0,9
bfc00e34:	1440003f 	bnez	v0,bfc00f34 <printf+0x214>
bfc00e38:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00e3c:	0bf00379 	j	bfc00de4 <printf+0xc4>
bfc00e40:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00e44:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00e48:	2404000d 	li	a0,13
bfc00e4c:	0bf00363 	j	bfc00d8c <printf+0x6c>
bfc00e50:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00e54:	8e440000 	lw	a0,0(s2)
bfc00e58:	2406000a 	li	a2,10
bfc00e5c:	0ff0041c 	jal	bfc01070 <printbase>
bfc00e60:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00e64:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00e68:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00e6c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00e70:	8e440000 	lw	a0,0(s2)
bfc00e74:	0ff003ec 	jal	bfc00fb0 <putstring>
bfc00e78:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc00e7c:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00e80:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00e84:	8e440000 	lw	a0,0(s2)
bfc00e88:	24060010 	li	a2,16
bfc00e8c:	0ff0041c 	jal	bfc01070 <printbase>
bfc00e90:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00e94:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00e98:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00e9c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc00ea0:	8e440000 	lw	a0,0(s2)
bfc00ea4:	24060008 	li	a2,8
bfc00ea8:	0ff0041c 	jal	bfc01070 <printbase>
bfc00eac:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc00eb0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc00eb4:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00eb8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc00ebc:	8e440000 	lw	a0,0(s2)
bfc00ec0:	2406000a 	li	a2,10
bfc00ec4:	0ff0041c 	jal	bfc01070 <printbase>
bfc00ec8:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc00ecc:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc00ed0:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00ed4:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc00ed8:	8e440000 	lw	a0,0(s2)
bfc00edc:	2406000a 	li	a2,10
bfc00ee0:	0ff0041c 	jal	bfc01070 <printbase>
bfc00ee4:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc00ee8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc00eec:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00ef0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc00ef4:	8e440000 	lw	a0,0(s2)
bfc00ef8:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00efc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00f00:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00f04:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00f08:	8e440000 	lw	a0,0(s2)
bfc00f0c:	24060002 	li	a2,2
bfc00f10:	0ff0041c 	jal	bfc01070 <printbase>
bfc00f14:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00f18:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc00f1c:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00f20:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00f24:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00f28:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc00f2c:	0bf00365 	j	bfc00d94 <printf+0x74>
bfc00f30:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00f34:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00f38:	000510c0 	sll	v0,a1,0x3
bfc00f3c:	00051840 	sll	v1,a1,0x1
bfc00f40:	00621821 	addu	v1,v1,v0
bfc00f44:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00f48:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00f4c:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00f50:	2482ffcf 	addiu	v0,a0,-49
bfc00f54:	304200ff 	andi	v0,v0,0xff
bfc00f58:	2c420009 	sltiu	v0,v0,9
bfc00f5c:	26310001 	addiu	s1,s1,1
bfc00f60:	1040ff9f 	beqz	v0,bfc00de0 <printf+0xc0>
bfc00f64:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00f68:	0bf003cf 	j	bfc00f3c <printf+0x21c>
bfc00f6c:	000510c0 	sll	v0,a1,0x3

bfc00f70 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00f70:	3c018000 	lui	at,0x8000
bfc00f74:	03e00008 	jr	ra
bfc00f78:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc00f7c:	03e00008 	jr	ra
bfc00f80:	00000000 	nop

bfc00f84 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00f84:	27bdffe8 	addiu	sp,sp,-24
bfc00f88:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc00f8c:	0ff003dc 	jal	bfc00f70 <tgt_putchar>
bfc00f90:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00f94:	8fbf0014 	lw	ra,20(sp)
bfc00f98:	00001021 	move	v0,zero
bfc00f9c:	03e00008 	jr	ra
bfc00fa0:	27bd0018 	addiu	sp,sp,24
	...

bfc00fb0 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc00fb0:	27bdffe0 	addiu	sp,sp,-32
bfc00fb4:	afb10014 	sw	s1,20(sp)
bfc00fb8:	afbf001c 	sw	ra,28(sp)
bfc00fbc:	afb20018 	sw	s2,24(sp)
bfc00fc0:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00fc4:	80900000 	lb	s0,0(a0)
bfc00fc8:	00000000 	nop
bfc00fcc:	12000013 	beqz	s0,bfc0101c <putstring+0x6c>
bfc00fd0:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00fd4:	0bf003fd 	j	bfc00ff4 <putstring+0x44>
bfc00fd8:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00fdc:	0ff003e1 	jal	bfc00f84 <putchar>
bfc00fe0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00fe4:	82300000 	lb	s0,0(s1)
bfc00fe8:	00000000 	nop
bfc00fec:	1200000b 	beqz	s0,bfc0101c <putstring+0x6c>
bfc00ff0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00ff4:	1612fff9 	bne	s0,s2,bfc00fdc <putstring+0x2c>
bfc00ff8:	26310001 	addiu	s1,s1,1
bfc00ffc:	0ff003e1 	jal	bfc00f84 <putchar>
bfc01000:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc01004:	0ff003e1 	jal	bfc00f84 <putchar>
bfc01008:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc0100c:	82300000 	lb	s0,0(s1)
bfc01010:	00000000 	nop
bfc01014:	1600fff7 	bnez	s0,bfc00ff4 <putstring+0x44>
bfc01018:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc0101c:	8fbf001c 	lw	ra,28(sp)
bfc01020:	00001021 	move	v0,zero
bfc01024:	8fb20018 	lw	s2,24(sp)
bfc01028:	8fb10014 	lw	s1,20(sp)
bfc0102c:	8fb00010 	lw	s0,16(sp)
bfc01030:	03e00008 	jr	ra
bfc01034:	27bd0020 	addiu	sp,sp,32

bfc01038 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc01038:	27bdffe8 	addiu	sp,sp,-24
bfc0103c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc01040:	0ff003ec 	jal	bfc00fb0 <putstring>
bfc01044:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc01048:	0ff003e1 	jal	bfc00f84 <putchar>
bfc0104c:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc01050:	0ff003e1 	jal	bfc00f84 <putchar>
bfc01054:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc01058:	8fbf0014 	lw	ra,20(sp)
bfc0105c:	00001021 	move	v0,zero
bfc01060:	03e00008 	jr	ra
bfc01064:	27bd0018 	addiu	sp,sp,24
	...

bfc01070 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc01070:	27bdff98 	addiu	sp,sp,-104
bfc01074:	afb30060 	sw	s3,96(sp)
bfc01078:	afb2005c 	sw	s2,92(sp)
bfc0107c:	afbf0064 	sw	ra,100(sp)
bfc01080:	afb10058 	sw	s1,88(sp)
bfc01084:	afb00054 	sw	s0,84(sp)
bfc01088:	00801821 	move	v1,a0
bfc0108c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc01090:	10e00003 	beqz	a3,bfc010a0 <printbase+0x30>
bfc01094:	00c09021 	move	s2,a2
bfc01098:	0480002f 	bltz	a0,bfc01158 <printbase+0xe8>
bfc0109c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc010a0:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc010a4:	1200000c 	beqz	s0,bfc010d8 <printbase+0x68>
bfc010a8:	00008821 	move	s1,zero
bfc010ac:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc010b0:	16400002 	bnez	s2,bfc010bc <printbase+0x4c>
bfc010b4:	0212001b 	divu	zero,s0,s2
bfc010b8:	0007000d 	break	0x7
bfc010bc:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc010c0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc010c4:	00001010 	mfhi	v0
bfc010c8:	a0820000 	sb	v0,0(a0)
bfc010cc:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc010d0:	1460fff7 	bnez	v1,bfc010b0 <printbase+0x40>
bfc010d4:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc010d8:	0233102a 	slt	v0,s1,s3
bfc010dc:	10400002 	beqz	v0,bfc010e8 <printbase+0x78>
bfc010e0:	02201821 	move	v1,s1
bfc010e4:	02601821 	move	v1,s3
bfc010e8:	1060000c 	beqz	v1,bfc0111c <printbase+0xac>
bfc010ec:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc010f0:	27a20010 	addiu	v0,sp,16
bfc010f4:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc010f8:	26020001 	addiu	v0,s0,1
bfc010fc:	0222102a 	slt	v0,s1,v0
bfc01100:	1040000e 	beqz	v0,bfc0113c <printbase+0xcc>
bfc01104:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01108:	02009821 	move	s3,s0
bfc0110c:	0ff003e1 	jal	bfc00f84 <putchar>
bfc01110:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc01114:	1660fff8 	bnez	s3,bfc010f8 <printbase+0x88>
bfc01118:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc0111c:	8fbf0064 	lw	ra,100(sp)
bfc01120:	00001021 	move	v0,zero
bfc01124:	8fb30060 	lw	s3,96(sp)
bfc01128:	8fb2005c 	lw	s2,92(sp)
bfc0112c:	8fb10058 	lw	s1,88(sp)
bfc01130:	8fb00054 	lw	s0,84(sp)
bfc01134:	03e00008 	jr	ra
bfc01138:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc0113c:	82440000 	lb	a0,0(s2)
bfc01140:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01144:	2882000a 	slti	v0,a0,10
bfc01148:	14400007 	bnez	v0,bfc01168 <printbase+0xf8>
bfc0114c:	02009821 	move	s3,s0
bfc01150:	0bf00443 	j	bfc0110c <printbase+0x9c>
bfc01154:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc01158:	0ff003e1 	jal	bfc00f84 <putchar>
bfc0115c:	00038023 	negu	s0,v1
bfc01160:	0bf00429 	j	bfc010a4 <printbase+0x34>
bfc01164:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01168:	0bf00442 	j	bfc01108 <printbase+0x98>
bfc0116c:	24840030 	addiu	a0,a0,48

bfc01170 <strlen>:
strlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc01170:	80820000 	lb	v0,0(a0)
bfc01174:	00000000 	nop
bfc01178:	10400008 	beqz	v0,bfc0119c <strlen+0x2c>
bfc0117c:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:15
bfc01180:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc01184:	00851021 	addu	v0,a0,a1
bfc01188:	80430000 	lb	v1,0(v0)
bfc0118c:	00000000 	nop
bfc01190:	1460fffc 	bnez	v1,bfc01184 <strlen+0x14>
bfc01194:	24a50001 	addiu	a1,a1,1
bfc01198:	24a5ffff 	addiu	a1,a1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:18
bfc0119c:	03e00008 	jr	ra
bfc011a0:	00a01021 	move	v0,a1

bfc011a4 <strnlen>:
strnlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc011a4:	10a00010 	beqz	a1,bfc011e8 <strnlen+0x44>
bfc011a8:	00001821 	move	v1,zero
bfc011ac:	80820000 	lb	v0,0(a0)
bfc011b0:	00000000 	nop
bfc011b4:	14400009 	bnez	v0,bfc011dc <strnlen+0x38>
bfc011b8:	24630001 	addiu	v1,v1,1
bfc011bc:	2463ffff 	addiu	v1,v1,-1
bfc011c0:	0bf0047a 	j	bfc011e8 <strnlen+0x44>
bfc011c4:	00000000 	nop
bfc011c8:	80c20000 	lb	v0,0(a2)
bfc011cc:	00000000 	nop
bfc011d0:	10400005 	beqz	v0,bfc011e8 <strnlen+0x44>
bfc011d4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:37
bfc011d8:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc011dc:	0065102b 	sltu	v0,v1,a1
bfc011e0:	1440fff9 	bnez	v0,bfc011c8 <strnlen+0x24>
bfc011e4:	00833021 	addu	a2,a0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:40
bfc011e8:	03e00008 	jr	ra
bfc011ec:	00601021 	move	v0,v1

bfc011f0 <strcpy>:
strcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:55
bfc011f0:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:60
bfc011f4:	80a20000 	lb	v0,0(a1)
bfc011f8:	24a50001 	addiu	a1,a1,1
bfc011fc:	a0620000 	sb	v0,0(v1)
bfc01200:	1440fffc 	bnez	v0,bfc011f4 <strcpy+0x4>
bfc01204:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:64
bfc01208:	03e00008 	jr	ra
bfc0120c:	00801021 	move	v0,a0

bfc01210 <strncpy>:
strncpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc01210:	10c00009 	beqz	a2,bfc01238 <strncpy+0x28>
bfc01214:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc01218:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:83
bfc0121c:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc01220:	a0620000 	sb	v0,0(v1)
bfc01224:	10400002 	beqz	v0,bfc01230 <strncpy+0x20>
bfc01228:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:81
bfc0122c:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc01230:	14c0fff9 	bnez	a2,bfc01218 <strncpy+0x8>
bfc01234:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:86
bfc01238:	03e00008 	jr	ra
bfc0123c:	00801021 	move	v0,a0

bfc01240 <strcmp>:
strcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc01240:	80820000 	lb	v0,0(a0)
bfc01244:	00000000 	nop
bfc01248:	14400007 	bnez	v0,bfc01268 <strcmp+0x28>
bfc0124c:	00000000 	nop
bfc01250:	0bf004a2 	j	bfc01288 <strcmp+0x48>
bfc01254:	00000000 	nop
bfc01258:	80820000 	lb	v0,0(a0)
bfc0125c:	00000000 	nop
bfc01260:	10400009 	beqz	v0,bfc01288 <strcmp+0x48>
bfc01264:	24a50001 	addiu	a1,a1,1
bfc01268:	80a30000 	lb	v1,0(a1)
bfc0126c:	00000000 	nop
bfc01270:	1043fff9 	beq	v0,v1,bfc01258 <strcmp+0x18>
bfc01274:	24840001 	addiu	a0,a0,1
bfc01278:	304400ff 	andi	a0,v0,0xff
bfc0127c:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc01280:	03e00008 	jr	ra
bfc01284:	00821023 	subu	v0,a0,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc01288:	80a30000 	lb	v1,0(a1)
bfc0128c:	00002021 	move	a0,zero
bfc01290:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc01294:	03e00008 	jr	ra
bfc01298:	00821023 	subu	v0,a0,v0

bfc0129c <strncmp>:
strncmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc0129c:	10c00016 	beqz	a2,bfc012f8 <strncmp+0x5c>
bfc012a0:	00000000 	nop
bfc012a4:	80830000 	lb	v1,0(a0)
bfc012a8:	00000000 	nop
bfc012ac:	14600009 	bnez	v1,bfc012d4 <strncmp+0x38>
bfc012b0:	00000000 	nop
bfc012b4:	0bf004c0 	j	bfc01300 <strncmp+0x64>
bfc012b8:	00000000 	nop
bfc012bc:	10c0000e 	beqz	a2,bfc012f8 <strncmp+0x5c>
bfc012c0:	24840001 	addiu	a0,a0,1
bfc012c4:	80830000 	lb	v1,0(a0)
bfc012c8:	00000000 	nop
bfc012cc:	1060000c 	beqz	v1,bfc01300 <strncmp+0x64>
bfc012d0:	24a50001 	addiu	a1,a1,1
bfc012d4:	80a20000 	lb	v0,0(a1)
bfc012d8:	00000000 	nop
bfc012dc:	1062fff7 	beq	v1,v0,bfc012bc <strncmp+0x20>
bfc012e0:	24c6ffff 	addiu	a2,a2,-1
bfc012e4:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc012e8:	306300ff 	andi	v1,v1,0xff
bfc012ec:	304200ff 	andi	v0,v0,0xff
bfc012f0:	03e00008 	jr	ra
bfc012f4:	00621023 	subu	v0,v1,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:132
bfc012f8:	03e00008 	jr	ra
bfc012fc:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc01300:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc01304:	306300ff 	andi	v1,v1,0xff
bfc01308:	304200ff 	andi	v0,v0,0xff
bfc0130c:	03e00008 	jr	ra
bfc01310:	00621023 	subu	v0,v1,v0

bfc01314 <strchr>:
strchr():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc01314:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:143
bfc01318:	00052e00 	sll	a1,a1,0x18
bfc0131c:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc01320:	1060000c 	beqz	v1,bfc01354 <strchr+0x40>
bfc01324:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:145
bfc01328:	14650006 	bne	v1,a1,bfc01344 <strchr+0x30>
bfc0132c:	24420001 	addiu	v0,v0,1
bfc01330:	03e00008 	jr	ra
bfc01334:	2442ffff 	addiu	v0,v0,-1
bfc01338:	10650008 	beq	v1,a1,bfc0135c <strchr+0x48>
bfc0133c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:148
bfc01340:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc01344:	80430000 	lb	v1,0(v0)
bfc01348:	00000000 	nop
bfc0134c:	1460fffa 	bnez	v1,bfc01338 <strchr+0x24>
bfc01350:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:151
bfc01354:	03e00008 	jr	ra
bfc01358:	00001021 	move	v0,zero
bfc0135c:	03e00008 	jr	ra
bfc01360:	00000000 	nop

bfc01364 <strfind>:
strfind():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01364:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:163
bfc01368:	00052e00 	sll	a1,a1,0x18
bfc0136c:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01370:	1060000c 	beqz	v1,bfc013a4 <strfind+0x40>
bfc01374:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:165
bfc01378:	14650006 	bne	v1,a1,bfc01394 <strfind+0x30>
bfc0137c:	24420001 	addiu	v0,v0,1
bfc01380:	03e00008 	jr	ra
bfc01384:	2442ffff 	addiu	v0,v0,-1
bfc01388:	10650008 	beq	v1,a1,bfc013ac <strfind+0x48>
bfc0138c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:168
bfc01390:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01394:	80430000 	lb	v1,0(v0)
bfc01398:	00000000 	nop
bfc0139c:	1460fffa 	bnez	v1,bfc01388 <strfind+0x24>
bfc013a0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:171
bfc013a4:	03e00008 	jr	ra
bfc013a8:	00000000 	nop
bfc013ac:	03e00008 	jr	ra
bfc013b0:	00000000 	nop

bfc013b4 <memset>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:273
bfc013b4:	00052e00 	sll	a1,a1,0x18
bfc013b8:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc013bc:	10c00006 	beqz	a2,bfc013d8 <memset+0x24>
bfc013c0:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:277
bfc013c4:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc013c8:	24c6ffff 	addiu	a2,a2,-1
bfc013cc:	a0650000 	sb	a1,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc013d0:	14c0fffd 	bnez	a2,bfc013c8 <memset+0x14>
bfc013d4:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:283
bfc013d8:	03e00008 	jr	ra
bfc013dc:	00000000 	nop

bfc013e0 <memcpy>:
memcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc013e0:	10c00008 	beqz	a2,bfc01404 <memcpy+0x24>
bfc013e4:	00804021 	move	t0,a0
bfc013e8:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:307
bfc013ec:	00a71021 	addu	v0,a1,a3
bfc013f0:	90440000 	lbu	a0,0(v0)
bfc013f4:	01071821 	addu	v1,t0,a3
bfc013f8:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc013fc:	14e6fffb 	bne	a3,a2,bfc013ec <memcpy+0xc>
bfc01400:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:311
bfc01404:	03e00008 	jr	ra
bfc01408:	01001021 	move	v0,t0

bfc0140c <memmove>:
memmove():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:329
bfc0140c:	00a4102b 	sltu	v0,a1,a0
bfc01410:	10400005 	beqz	v0,bfc01428 <memmove+0x1c>
bfc01414:	00804021 	move	t0,a0
bfc01418:	00a62021 	addu	a0,a1,a2
bfc0141c:	0104102b 	sltu	v0,t0,a0
bfc01420:	1440000b 	bnez	v0,bfc01450 <memmove+0x44>
bfc01424:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc01428:	10c00007 	beqz	a2,bfc01448 <memmove+0x3c>
bfc0142c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:336
bfc01430:	00a71021 	addu	v0,a1,a3
bfc01434:	90440000 	lbu	a0,0(v0)
bfc01438:	01071821 	addu	v1,t0,a3
bfc0143c:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc01440:	14c7fffb 	bne	a2,a3,bfc01430 <memmove+0x24>
bfc01444:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc01448:	03e00008 	jr	ra
bfc0144c:	01001021 	move	v0,t0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc01450:	10c0fffd 	beqz	a2,bfc01448 <memmove+0x3c>
bfc01454:	01061821 	addu	v1,t0,a2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:332
bfc01458:	2484ffff 	addiu	a0,a0,-1
bfc0145c:	90820000 	lbu	v0,0(a0)
bfc01460:	2463ffff 	addiu	v1,v1,-1
bfc01464:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc01468:	14c0fffb 	bnez	a2,bfc01458 <memmove+0x4c>
bfc0146c:	a0620000 	sb	v0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc01470:	03e00008 	jr	ra
bfc01474:	01001021 	move	v0,t0

bfc01478 <memcmp>:
memcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc01478:	10c00011 	beqz	a2,bfc014c0 <memcmp+0x48>
bfc0147c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc01480:	80830000 	lb	v1,0(a0)
bfc01484:	80a20000 	lb	v0,0(a1)
bfc01488:	00000000 	nop
bfc0148c:	1462000e 	bne	v1,v0,bfc014c8 <memcmp+0x50>
bfc01490:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc01494:	0bf0052c 	j	bfc014b0 <memcmp+0x38>
bfc01498:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc0149c:	80630001 	lb	v1,1(v1)
bfc014a0:	80420001 	lb	v0,1(v0)
bfc014a4:	00000000 	nop
bfc014a8:	14620007 	bne	v1,v0,bfc014c8 <memcmp+0x50>
bfc014ac:	24c6ffff 	addiu	a2,a2,-1
bfc014b0:	00871821 	addu	v1,a0,a3
bfc014b4:	00a71021 	addu	v0,a1,a3
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc014b8:	14c0fff8 	bnez	a2,bfc0149c <memcmp+0x24>
bfc014bc:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:368
bfc014c0:	03e00008 	jr	ra
bfc014c4:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:363
bfc014c8:	306300ff 	andi	v1,v1,0xff
bfc014cc:	304200ff 	andi	v0,v0,0xff
bfc014d0:	03e00008 	jr	ra
bfc014d4:	00621023 	subu	v0,v1,v0

bfc014d8 <bzero>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc014d8:	10a00005 	beqz	a1,bfc014f0 <bzero+0x18>
bfc014dc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc014e0:	24a5ffff 	addiu	a1,a1,-1
bfc014e4:	a0800000 	sb	zero,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc014e8:	14a0fffd 	bnez	a1,bfc014e0 <bzero+0x8>
bfc014ec:	24840001 	addiu	a0,a0,1
bfc014f0:	03e00008 	jr	ra
bfc014f4:	00000000 	nop
	...

bfc01500 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc01500:	3c01bfd0 	lui	at,0xbfd0
bfc01504:	3421e000 	ori	at,at,0xe000
bfc01508:	8c220000 	lw	v0,0(at)
bfc0150c:	03e00008 	jr	ra
bfc01510:	00000000 	nop

bfc01514 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc01514:	3c01bfd0 	lui	at,0xbfd0
bfc01518:	3421e000 	ori	at,at,0xe000
bfc0151c:	8c220000 	lw	v0,0(at)
bfc01520:	03e00008 	jr	ra
bfc01524:	00000000 	nop

bfc01528 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc01528:	3c01bfd0 	lui	at,0xbfd0
bfc0152c:	3421e000 	ori	at,at,0xe000
bfc01530:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc01534:	03e00008 	jr	ra
bfc01538:	00021040 	sll	v0,v0,0x1

bfc0153c <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc0153c:	3c01bfd0 	lui	at,0xbfd0
bfc01540:	3421e000 	ori	at,at,0xe000
bfc01544:	8c220000 	lw	v0,0(at)
bfc01548:	03e00008 	jr	ra
bfc0154c:	00000000 	nop

bfc01550 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc01550:	27bdffe8 	addiu	sp,sp,-24
bfc01554:	afbf0014 	sw	ra,20(sp)
bfc01558:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc0155c:	3c01bfd0 	lui	at,0xbfd0
bfc01560:	3421e000 	ori	at,at,0xe000
bfc01564:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01568:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0156c:	14400002 	bnez	v0,bfc01578 <clock_gettime+0x28>
bfc01570:	0062001b 	divu	zero,v1,v0
bfc01574:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01578:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc0157c:	3c073b9a 	lui	a3,0x3b9a
bfc01580:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01584:	3c048000 	lui	a0,0x8000
bfc01588:	24840c80 	addiu	a0,a0,3200
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0158c:	00003012 	mflo	a2
bfc01590:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01594:	14400002 	bnez	v0,bfc015a0 <clock_gettime+0x50>
bfc01598:	0062001b 	divu	zero,v1,v0
bfc0159c:	0007000d 	break	0x7
bfc015a0:	00002810 	mfhi	a1
bfc015a4:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc015a8:	14400002 	bnez	v0,bfc015b4 <clock_gettime+0x64>
bfc015ac:	00c2001b 	divu	zero,a2,v0
bfc015b0:	0007000d 	break	0x7
bfc015b4:	00005010 	mfhi	t2
bfc015b8:	ad2a0008 	sw	t2,8(t1)
bfc015bc:	00004012 	mflo	t0
bfc015c0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc015c4:	14e00002 	bnez	a3,bfc015d0 <clock_gettime+0x80>
bfc015c8:	00c7001b 	divu	zero,a2,a3
bfc015cc:	0007000d 	break	0x7
bfc015d0:	00003012 	mflo	a2
bfc015d4:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc015d8:	14400002 	bnez	v0,bfc015e4 <clock_gettime+0x94>
bfc015dc:	0102001b 	divu	zero,t0,v0
bfc015e0:	0007000d 	break	0x7
bfc015e4:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc015e8:	0ff00348 	jal	bfc00d20 <printf>
bfc015ec:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc015f0:	8fbf0014 	lw	ra,20(sp)
bfc015f4:	00001021 	move	v0,zero
bfc015f8:	03e00008 	jr	ra
bfc015fc:	27bd0018 	addiu	sp,sp,24

bfc01600 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc01600:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc01604:	03e00008 	jr	ra
bfc01608:	00000000 	nop

bfc0160c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0160c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc01610:	03e00008 	jr	ra
bfc01614:	00000000 	nop

bfc01618 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc01618:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc0161c:	27bdffe8 	addiu	sp,sp,-24
bfc01620:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc01624:	0ff00348 	jal	bfc00d20 <printf>
bfc01628:	24840c94 	addiu	a0,a0,3220
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc0162c:	3c048000 	lui	a0,0x8000
bfc01630:	24840cb0 	addiu	a0,a0,3248
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc01634:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc01638:	0ff00348 	jal	bfc00d20 <printf>
bfc0163c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01640:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc01644:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01648:	24840cc0 	addiu	a0,a0,3264
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc0164c:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc01650:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01654:	0bf00348 	j	bfc00d20 <printf>
bfc01658:	00000000 	nop
bfc0165c:	00000000 	nop
