
obj/crc32/main.elf:     file format elf32-tradlittlemips
obj/crc32/main.elf


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
bfc00010:	27bd476c 	addiu	sp,sp,18284
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c8790 	addiu	gp,gp,-30832
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
bfc00380:	0ff0056e 	jal	bfc015b8 <exception>
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
bfc003a4:	0ff003f6 	jal	bfc00fd8 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff0052d 	jal	bfc014b4 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	0ff00214 	jal	bfc00850 <crc32>
bfc003b8:	00408821 	move	s1,v0
bfc003bc:	0ff0052d 	jal	bfc014b4 <get_count>
bfc003c0:	00408021 	move	s0,v0
bfc003c4:	1200001a 	beqz	s0,bfc00430 <shell+0xa0>
bfc003c8:	00518823 	subu	s1,v0,s1
bfc003cc:	3c188000 	lui	t8,0x8000
bfc003d0:	0ff003f6 	jal	bfc00fd8 <puts>
bfc003d4:	27040020 	addiu	a0,t8,32
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
bfc00400:	26040030 	addiu	a0,s0,48
bfc00404:	ad8b0000 	sw	t3,0(t4)
bfc00408:	02202821 	move	a1,s1
bfc0040c:	ad400000 	sw	zero,0(t2)
bfc00410:	8fbf001c 	lw	ra,28(sp)
bfc00414:	af310000 	sw	s1,0(t9)
bfc00418:	8fb00014 	lw	s0,20(sp)
bfc0041c:	8fb10018 	lw	s1,24(sp)
bfc00420:	0bf00330 	j	bfc00cc0 <printf>
bfc00424:	27bd0020 	addiu	sp,sp,32
	...
bfc00430:	3c098000 	lui	t1,0x8000
bfc00434:	0ff003f6 	jal	bfc00fd8 <puts>
bfc00438:	25240014 	addiu	a0,t1,20
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
bfc00464:	26040030 	addiu	a0,s0,48
bfc00468:	acc20000 	sw	v0,0(a2)
bfc0046c:	8fbf001c 	lw	ra,28(sp)
bfc00470:	aca70000 	sw	a3,0(a1)
bfc00474:	8fb00014 	lw	s0,20(sp)
bfc00478:	02202821 	move	a1,s1
bfc0047c:	af310000 	sw	s1,0(t9)
bfc00480:	8fb10018 	lw	s1,24(sp)
bfc00484:	0bf00330 	j	bfc00cc0 <printf>
bfc00488:	27bd0020 	addiu	sp,sp,32
bfc0048c:	00000000 	nop

bfc00490 <updateCRC32>:
updateCRC32():
bfc00490:	00a44826 	xor	t1,a1,a0
bfc00494:	312800ff 	andi	t0,t1,0xff
bfc00498:	3c078000 	lui	a3,0x8000
bfc0049c:	00081880 	sll	v1,t0,0x2
bfc004a0:	24e60080 	addiu	a2,a3,128
bfc004a4:	00662021 	addu	a0,v1,a2
bfc004a8:	8c820000 	lw	v0,0(a0)
bfc004ac:	00052a02 	srl	a1,a1,0x8
bfc004b0:	03e00008 	jr	ra
bfc004b4:	00a21026 	xor	v0,a1,v0
	...

bfc004c0 <crc32buf>:
crc32buf():
bfc004c0:	10a0005b 	beqz	a1,bfc00630 <crc32buf+0x170>
bfc004c4:	00805021 	move	t2,a0
bfc004c8:	90890000 	lbu	t1,0(a0)
bfc004cc:	3c0c8000 	lui	t4,0x8000
bfc004d0:	00095880 	sll	t3,t1,0x2
bfc004d4:	396803fc 	xori	t0,t3,0x3fc
bfc004d8:	25890080 	addiu	t1,t4,128
bfc004dc:	01093821 	addu	a3,t0,t1
bfc004e0:	8ce40000 	lw	a0,0(a3)
bfc004e4:	24a3ffff 	addiu	v1,a1,-1
bfc004e8:	2406ffff 	li	a2,-1
bfc004ec:	00604021 	move	t0,v1
bfc004f0:	00061202 	srl	v0,a2,0x8
bfc004f4:	00823026 	xor	a2,a0,v0
bfc004f8:	30630003 	andi	v1,v1,0x3
bfc004fc:	11000049 	beqz	t0,bfc00624 <crc32buf+0x164>
bfc00500:	25470001 	addiu	a3,t2,1
bfc00504:	10600024 	beqz	v1,bfc00598 <crc32buf+0xd8>
bfc00508:	24180001 	li	t8,1
bfc0050c:	10780017 	beq	v1,t8,bfc0056c <crc32buf+0xac>
bfc00510:	24190002 	li	t9,2
bfc00514:	1079000b 	beq	v1,t9,bfc00544 <crc32buf+0x84>
bfc00518:	00061a02 	srl	v1,a2,0x8
bfc0051c:	91440001 	lbu	a0,1(t2)
bfc00520:	00000000 	nop
bfc00524:	00c45826 	xor	t3,a2,a0
bfc00528:	316600ff 	andi	a2,t3,0xff
bfc0052c:	00061080 	sll	v0,a2,0x2
bfc00530:	00494021 	addu	t0,v0,t1
bfc00534:	8d070000 	lw	a3,0(t0)
bfc00538:	24a8fffe 	addiu	t0,a1,-2
bfc0053c:	00e33026 	xor	a2,a3,v1
bfc00540:	25470002 	addiu	a3,t2,2
bfc00544:	90f80000 	lbu	t8,0(a3)
bfc00548:	00065202 	srl	t2,a2,0x8
bfc0054c:	00d87826 	xor	t7,a2,t8
bfc00550:	31e500ff 	andi	a1,t7,0xff
bfc00554:	00057080 	sll	t6,a1,0x2
bfc00558:	01c96821 	addu	t5,t6,t1
bfc0055c:	8dac0000 	lw	t4,0(t5)
bfc00560:	2508ffff 	addiu	t0,t0,-1
bfc00564:	018a3026 	xor	a2,t4,t2
bfc00568:	24e70001 	addiu	a3,a3,1
bfc0056c:	90ec0000 	lbu	t4,0(a3)
bfc00570:	00061a02 	srl	v1,a2,0x8
bfc00574:	00cc2026 	xor	a0,a2,t4
bfc00578:	308b00ff 	andi	t3,a0,0xff
bfc0057c:	000b3080 	sll	a2,t3,0x2
bfc00580:	00c91021 	addu	v0,a2,t1
bfc00584:	8c590000 	lw	t9,0(v0)
bfc00588:	2508ffff 	addiu	t0,t0,-1
bfc0058c:	03233026 	xor	a2,t9,v1
bfc00590:	11000024 	beqz	t0,bfc00624 <crc32buf+0x164>
bfc00594:	24e70001 	addiu	a3,a3,1
bfc00598:	90ef0000 	lbu	t7,0(a3)
bfc0059c:	00066202 	srl	t4,a2,0x8
bfc005a0:	00cf2826 	xor	a1,a2,t7
bfc005a4:	30ae00ff 	andi	t6,a1,0xff
bfc005a8:	000e6880 	sll	t5,t6,0x2
bfc005ac:	01a95021 	addu	t2,t5,t1
bfc005b0:	8d440000 	lw	a0,0(t2)
bfc005b4:	90eb0001 	lbu	t3,1(a3)
bfc005b8:	008cc026 	xor	t8,a0,t4
bfc005bc:	030b3026 	xor	a2,t8,t3
bfc005c0:	30c300ff 	andi	v1,a2,0xff
bfc005c4:	00031080 	sll	v0,v1,0x2
bfc005c8:	0049c821 	addu	t9,v0,t1
bfc005cc:	8f250000 	lw	a1,0(t9)
bfc005d0:	00187a02 	srl	t7,t8,0x8
bfc005d4:	90ee0002 	lbu	t6,2(a3)
bfc005d8:	00af3026 	xor	a2,a1,t7
bfc005dc:	00ce6826 	xor	t5,a2,t6
bfc005e0:	31aa00ff 	andi	t2,t5,0xff
bfc005e4:	000a6080 	sll	t4,t2,0x2
bfc005e8:	01895821 	addu	t3,t4,t1
bfc005ec:	8d630000 	lw	v1,0(t3)
bfc005f0:	00062202 	srl	a0,a2,0x8
bfc005f4:	90e20003 	lbu	v0,3(a3)
bfc005f8:	00646826 	xor	t5,v1,a0
bfc005fc:	01a2c826 	xor	t9,t5,v0
bfc00600:	333800ff 	andi	t8,t9,0xff
bfc00604:	00187880 	sll	t7,t8,0x2
bfc00608:	01e97021 	addu	t6,t7,t1
bfc0060c:	8dca0000 	lw	t2,0(t6)
bfc00610:	000d2a02 	srl	a1,t5,0x8
bfc00614:	2508fffc 	addiu	t0,t0,-4
bfc00618:	01453026 	xor	a2,t2,a1
bfc0061c:	1500ffde 	bnez	t0,bfc00598 <crc32buf+0xd8>
bfc00620:	24e70004 	addiu	a3,a3,4
bfc00624:	03e00008 	jr	ra
bfc00628:	00061027 	nor	v0,zero,a2
bfc0062c:	00000000 	nop
bfc00630:	03e00008 	jr	ra
bfc00634:	00001021 	move	v0,zero
	...

bfc00640 <crc32file>:
crc32file():
bfc00640:	8f848010 	lw	a0,-32752(gp)
bfc00644:	27bdffc8 	addiu	sp,sp,-56
bfc00648:	acc00000 	sw	zero,0(a2)
bfc0064c:	afbf0034 	sw	ra,52(sp)
bfc00650:	afb70030 	sw	s7,48(sp)
bfc00654:	afb6002c 	sw	s6,44(sp)
bfc00658:	afb50028 	sw	s5,40(sp)
bfc0065c:	afb40024 	sw	s4,36(sp)
bfc00660:	afb30020 	sw	s3,32(sp)
bfc00664:	afb2001c 	sw	s2,28(sp)
bfc00668:	afb10018 	sw	s1,24(sp)
bfc0066c:	00c09021 	move	s2,a2
bfc00670:	afb00014 	sw	s0,20(sp)
bfc00674:	0ff00294 	jal	bfc00a50 <fopen>
bfc00678:	00a0b821 	move	s7,a1
bfc0067c:	3c058000 	lui	a1,0x8000
bfc00680:	24a4004c 	addiu	a0,a1,76
bfc00684:	0ff003f6 	jal	bfc00fd8 <puts>
bfc00688:	00409821 	move	s3,v0
bfc0068c:	8e640000 	lw	a0,0(s3)
bfc00690:	0ff00444 	jal	bfc01110 <strlen>
bfc00694:	2414ffff 	li	s4,-1
bfc00698:	3c048000 	lui	a0,0x8000
bfc0069c:	24840054 	addiu	a0,a0,84
bfc006a0:	0ff00330 	jal	bfc00cc0 <printf>
bfc006a4:	00402821 	move	a1,v0
bfc006a8:	3c038000 	lui	v1,0x8000
bfc006ac:	3c028000 	lui	v0,0x8000
bfc006b0:	02602021 	move	a0,s3
bfc006b4:	24750060 	addiu	s5,v1,96
bfc006b8:	0ff002b1 	jal	bfc00ac4 <getc>
bfc006bc:	24560080 	addiu	s6,v0,128
bfc006c0:	2410ffff 	li	s0,-1
bfc006c4:	00408821 	move	s1,v0
bfc006c8:	10540049 	beq	v0,s4,bfc007f0 <crc32file+0x1b0>
bfc006cc:	02a02021 	move	a0,s5
bfc006d0:	8e4d0000 	lw	t5,0(s2)
bfc006d4:	00000000 	nop
bfc006d8:	25ac0001 	addiu	t4,t5,1
bfc006dc:	01802821 	move	a1,t4
bfc006e0:	0ff00330 	jal	bfc00cc0 <printf>
bfc006e4:	ae4c0000 	sw	t4,0(s2)
bfc006e8:	02115826 	xor	t3,s0,s1
bfc006ec:	316a00ff 	andi	t2,t3,0xff
bfc006f0:	000a4880 	sll	t1,t2,0x2
bfc006f4:	01364021 	addu	t0,t1,s6
bfc006f8:	8d070000 	lw	a3,0(t0)
bfc006fc:	00103202 	srl	a2,s0,0x8
bfc00700:	02602021 	move	a0,s3
bfc00704:	0ff002b1 	jal	bfc00ac4 <getc>
bfc00708:	00e68026 	xor	s0,a3,a2
bfc0070c:	00408821 	move	s1,v0
bfc00710:	10540037 	beq	v0,s4,bfc007f0 <crc32file+0x1b0>
bfc00714:	02a02021 	move	a0,s5
bfc00718:	8e460000 	lw	a2,0(s2)
bfc0071c:	00000000 	nop
bfc00720:	24df0001 	addiu	ra,a2,1
bfc00724:	03e02821 	move	a1,ra
bfc00728:	ae5f0000 	sw	ra,0(s2)
bfc0072c:	0ff00330 	jal	bfc00cc0 <printf>
bfc00730:	00000000 	nop
bfc00734:	02112826 	xor	a1,s0,s1
bfc00738:	30a400ff 	andi	a0,a1,0xff
bfc0073c:	00041880 	sll	v1,a0,0x2
bfc00740:	00761021 	addu	v0,v1,s6
bfc00744:	8c590000 	lw	t9,0(v0)
bfc00748:	0010c202 	srl	t8,s0,0x8
bfc0074c:	02602021 	move	a0,s3
bfc00750:	0ff002b1 	jal	bfc00ac4 <getc>
bfc00754:	03388026 	xor	s0,t9,t8
bfc00758:	00408821 	move	s1,v0
bfc0075c:	10540024 	beq	v0,s4,bfc007f0 <crc32file+0x1b0>
bfc00760:	02a02021 	move	a0,s5
bfc00764:	8e4e0000 	lw	t6,0(s2)
bfc00768:	00000000 	nop
bfc0076c:	25cd0001 	addiu	t5,t6,1
bfc00770:	01a02821 	move	a1,t5
bfc00774:	0ff00330 	jal	bfc00cc0 <printf>
bfc00778:	ae4d0000 	sw	t5,0(s2)
bfc0077c:	02116026 	xor	t4,s0,s1
bfc00780:	318b00ff 	andi	t3,t4,0xff
bfc00784:	000b5080 	sll	t2,t3,0x2
bfc00788:	01564821 	addu	t1,t2,s6
bfc0078c:	8d280000 	lw	t0,0(t1)
bfc00790:	00103a02 	srl	a3,s0,0x8
bfc00794:	02602021 	move	a0,s3
bfc00798:	0ff002b1 	jal	bfc00ac4 <getc>
bfc0079c:	01078026 	xor	s0,t0,a3
bfc007a0:	00408821 	move	s1,v0
bfc007a4:	10540012 	beq	v0,s4,bfc007f0 <crc32file+0x1b0>
bfc007a8:	02a02021 	move	a0,s5
bfc007ac:	8e450000 	lw	a1,0(s2)
bfc007b0:	00000000 	nop
bfc007b4:	24a50001 	addiu	a1,a1,1
bfc007b8:	0ff00330 	jal	bfc00cc0 <printf>
bfc007bc:	ae450000 	sw	a1,0(s2)
bfc007c0:	02111826 	xor	v1,s0,s1
bfc007c4:	306200ff 	andi	v0,v1,0xff
bfc007c8:	0002c880 	sll	t9,v0,0x2
bfc007cc:	0336c021 	addu	t8,t9,s6
bfc007d0:	8f110000 	lw	s1,0(t8)
bfc007d4:	00107a02 	srl	t7,s0,0x8
bfc007d8:	02602021 	move	a0,s3
bfc007dc:	0ff002b1 	jal	bfc00ac4 <getc>
bfc007e0:	022f8026 	xor	s0,s1,t7
bfc007e4:	00408821 	move	s1,v0
bfc007e8:	1454ffb9 	bne	v0,s4,bfc006d0 <crc32file+0x90>
bfc007ec:	02a02021 	move	a0,s5
bfc007f0:	3c118000 	lui	s1,0x8000
bfc007f4:	26240068 	addiu	a0,s1,104
bfc007f8:	0ff00330 	jal	bfc00cc0 <printf>
bfc007fc:	2405ffff 	li	a1,-1
bfc00800:	3c0f8000 	lui	t7,0x8000
bfc00804:	0ff003f6 	jal	bfc00fd8 <puts>
bfc00808:	25e4006c 	addiu	a0,t7,108
bfc0080c:	0ff002a5 	jal	bfc00a94 <fclose>
bfc00810:	02602021 	move	a0,s3
bfc00814:	8fbf0034 	lw	ra,52(sp)
bfc00818:	00107027 	nor	t6,zero,s0
bfc0081c:	aeee0000 	sw	t6,0(s7)
bfc00820:	00001021 	move	v0,zero
bfc00824:	8fb70030 	lw	s7,48(sp)
bfc00828:	8fb6002c 	lw	s6,44(sp)
bfc0082c:	8fb50028 	lw	s5,40(sp)
bfc00830:	8fb40024 	lw	s4,36(sp)
bfc00834:	8fb30020 	lw	s3,32(sp)
bfc00838:	8fb2001c 	lw	s2,28(sp)
bfc0083c:	8fb10018 	lw	s1,24(sp)
bfc00840:	8fb00014 	lw	s0,20(sp)
bfc00844:	03e00008 	jr	ra
bfc00848:	27bd0038 	addiu	sp,sp,56
bfc0084c:	00000000 	nop

bfc00850 <crc32>:
crc32():
bfc00850:	8f848010 	lw	a0,-32752(gp)
bfc00854:	27bdffc8 	addiu	sp,sp,-56
bfc00858:	afbf0034 	sw	ra,52(sp)
bfc0085c:	afb70030 	sw	s7,48(sp)
bfc00860:	afb6002c 	sw	s6,44(sp)
bfc00864:	afb50028 	sw	s5,40(sp)
bfc00868:	afb30020 	sw	s3,32(sp)
bfc0086c:	afb2001c 	sw	s2,28(sp)
bfc00870:	afb10018 	sw	s1,24(sp)
bfc00874:	afb00014 	sw	s0,20(sp)
bfc00878:	0ff00294 	jal	bfc00a50 <fopen>
bfc0087c:	afb40024 	sw	s4,36(sp)
bfc00880:	3c058000 	lui	a1,0x8000
bfc00884:	24a4004c 	addiu	a0,a1,76
bfc00888:	0ff003f6 	jal	bfc00fd8 <puts>
bfc0088c:	00409821 	move	s3,v0
bfc00890:	8e640000 	lw	a0,0(s3)
bfc00894:	0ff00444 	jal	bfc01110 <strlen>
bfc00898:	2415ffff 	li	s5,-1
bfc0089c:	3c048000 	lui	a0,0x8000
bfc008a0:	24840054 	addiu	a0,a0,84
bfc008a4:	0ff00330 	jal	bfc00cc0 <printf>
bfc008a8:	00402821 	move	a1,v0
bfc008ac:	3c038000 	lui	v1,0x8000
bfc008b0:	3c028000 	lui	v0,0x8000
bfc008b4:	02602021 	move	a0,s3
bfc008b8:	24760060 	addiu	s6,v1,96
bfc008bc:	0ff002b1 	jal	bfc00ac4 <getc>
bfc008c0:	24570080 	addiu	s7,v0,128
bfc008c4:	2411ffff 	li	s1,-1
bfc008c8:	00009021 	move	s2,zero
bfc008cc:	00408021 	move	s0,v0
bfc008d0:	1055003e 	beq	v0,s5,bfc009cc <crc32+0x17c>
bfc008d4:	02c02021 	move	a0,s6
bfc008d8:	26520001 	addiu	s2,s2,1
bfc008dc:	0ff00330 	jal	bfc00cc0 <printf>
bfc008e0:	02402821 	move	a1,s2
bfc008e4:	02305826 	xor	t3,s1,s0
bfc008e8:	316a00ff 	andi	t2,t3,0xff
bfc008ec:	000a4880 	sll	t1,t2,0x2
bfc008f0:	01374021 	addu	t0,t1,s7
bfc008f4:	8d070000 	lw	a3,0(t0)
bfc008f8:	00113202 	srl	a2,s1,0x8
bfc008fc:	02602021 	move	a0,s3
bfc00900:	0ff002b1 	jal	bfc00ac4 <getc>
bfc00904:	00e68826 	xor	s1,a3,a2
bfc00908:	00408021 	move	s0,v0
bfc0090c:	02c02021 	move	a0,s6
bfc00910:	1055002e 	beq	v0,s5,bfc009cc <crc32+0x17c>
bfc00914:	0240a021 	move	s4,s2
bfc00918:	26520001 	addiu	s2,s2,1
bfc0091c:	0ff00330 	jal	bfc00cc0 <printf>
bfc00920:	02402821 	move	a1,s2
bfc00924:	02302826 	xor	a1,s1,s0
bfc00928:	30a400ff 	andi	a0,a1,0xff
bfc0092c:	00041880 	sll	v1,a0,0x2
bfc00930:	00771021 	addu	v0,v1,s7
bfc00934:	8c590000 	lw	t9,0(v0)
bfc00938:	0011c202 	srl	t8,s1,0x8
bfc0093c:	02602021 	move	a0,s3
bfc00940:	0ff002b1 	jal	bfc00ac4 <getc>
bfc00944:	03388826 	xor	s1,t9,t8
bfc00948:	00408021 	move	s0,v0
bfc0094c:	1055001f 	beq	v0,s5,bfc009cc <crc32+0x17c>
bfc00950:	02c02021 	move	a0,s6
bfc00954:	26920002 	addiu	s2,s4,2
bfc00958:	0ff00330 	jal	bfc00cc0 <printf>
bfc0095c:	02402821 	move	a1,s2
bfc00960:	02305826 	xor	t3,s1,s0
bfc00964:	316a00ff 	andi	t2,t3,0xff
bfc00968:	000a4880 	sll	t1,t2,0x2
bfc0096c:	01374021 	addu	t0,t1,s7
bfc00970:	8d070000 	lw	a3,0(t0)
bfc00974:	00113202 	srl	a2,s1,0x8
bfc00978:	02602021 	move	a0,s3
bfc0097c:	0ff002b1 	jal	bfc00ac4 <getc>
bfc00980:	00e68826 	xor	s1,a3,a2
bfc00984:	00408021 	move	s0,v0
bfc00988:	10550010 	beq	v0,s5,bfc009cc <crc32+0x17c>
bfc0098c:	02c02021 	move	a0,s6
bfc00990:	26920003 	addiu	s2,s4,3
bfc00994:	02402821 	move	a1,s2
bfc00998:	0ff00330 	jal	bfc00cc0 <printf>
bfc0099c:	0230a026 	xor	s4,s1,s0
bfc009a0:	328f00ff 	andi	t7,s4,0xff
bfc009a4:	000f7080 	sll	t6,t7,0x2
bfc009a8:	01d76821 	addu	t5,t6,s7
bfc009ac:	8dac0000 	lw	t4,0(t5)
bfc009b0:	00118202 	srl	s0,s1,0x8
bfc009b4:	02602021 	move	a0,s3
bfc009b8:	0ff002b1 	jal	bfc00ac4 <getc>
bfc009bc:	01908826 	xor	s1,t4,s0
bfc009c0:	00408021 	move	s0,v0
bfc009c4:	1455ffc4 	bne	v0,s5,bfc008d8 <crc32+0x88>
bfc009c8:	02c02021 	move	a0,s6
bfc009cc:	3c148000 	lui	s4,0x8000
bfc009d0:	2405ffff 	li	a1,-1
bfc009d4:	0ff00330 	jal	bfc00cc0 <printf>
bfc009d8:	26840068 	addiu	a0,s4,104
bfc009dc:	3c0f8000 	lui	t7,0x8000
bfc009e0:	0ff003f6 	jal	bfc00fd8 <puts>
bfc009e4:	25e4006c 	addiu	a0,t7,108
bfc009e8:	0ff002a5 	jal	bfc00a94 <fclose>
bfc009ec:	02602021 	move	a0,s3
bfc009f0:	00119827 	nor	s3,zero,s1
bfc009f4:	3c0e8000 	lui	t6,0x8000
bfc009f8:	02403021 	move	a2,s2
bfc009fc:	02602821 	move	a1,s3
bfc00a00:	0ff00330 	jal	bfc00cc0 <printf>
bfc00a04:	25c40070 	addiu	a0,t6,112
bfc00a08:	3c0d66bd 	lui	t5,0x66bd
bfc00a0c:	35ac7c8b 	ori	t4,t5,0x7c8b
bfc00a10:	8fbf0034 	lw	ra,52(sp)
bfc00a14:	026c8021 	addu	s0,s3,t4
bfc00a18:	0010102b 	sltu	v0,zero,s0
bfc00a1c:	8fb70030 	lw	s7,48(sp)
bfc00a20:	8fb6002c 	lw	s6,44(sp)
bfc00a24:	8fb50028 	lw	s5,40(sp)
bfc00a28:	8fb40024 	lw	s4,36(sp)
bfc00a2c:	8fb30020 	lw	s3,32(sp)
bfc00a30:	8fb2001c 	lw	s2,28(sp)
bfc00a34:	8fb10018 	lw	s1,24(sp)
bfc00a38:	8fb00014 	lw	s0,20(sp)
bfc00a3c:	03e00008 	jr	ra
bfc00a40:	27bd0038 	addiu	sp,sp,56
	...

bfc00a50 <fopen>:
fopen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:20
bfc00a50:	3c028000 	lui	v0,0x8000
bfc00a54:	244707b0 	addiu	a3,v0,1968
bfc00a58:	00e02821 	move	a1,a3
bfc00a5c:	00001821 	move	v1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:22
bfc00a60:	2406000a 	li	a2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:23
bfc00a64:	8ca20000 	lw	v0,0(a1)
bfc00a68:	00000000 	nop
bfc00a6c:	10400004 	beqz	v0,bfc00a80 <fopen+0x30>
bfc00a70:	24a50008 	addiu	a1,a1,8
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:22
bfc00a74:	24630001 	addiu	v1,v1,1
bfc00a78:	1466fffa 	bne	v1,a2,bfc00a64 <fopen+0x14>
bfc00a7c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:27
bfc00a80:	000310c0 	sll	v0,v1,0x3
bfc00a84:	00471021 	addu	v0,v0,a3
bfc00a88:	ac440000 	sw	a0,0(v0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:30
bfc00a8c:	03e00008 	jr	ra
bfc00a90:	ac400004 	sw	zero,4(v0)

bfc00a94 <fclose>:
fclose():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:61
bfc00a94:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc00a98:	3c038000 	lui	v1,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:61
bfc00a9c:	244207b0 	addiu	v0,v0,1968
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc00aa0:	24630800 	addiu	v1,v1,2048
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:64
bfc00aa4:	10820004 	beq	a0,v0,bfc00ab8 <fclose+0x24>
bfc00aa8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:65
bfc00aac:	24420008 	addiu	v0,v0,8
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc00ab0:	1443fffc 	bne	v0,v1,bfc00aa4 <fclose+0x10>
bfc00ab4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:69
bfc00ab8:	ac800004 	sw	zero,4(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:70
bfc00abc:	03e00008 	jr	ra
bfc00ac0:	ac800000 	sw	zero,0(a0)

bfc00ac4 <getc>:
getc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:88
bfc00ac4:	27bdffe0 	addiu	sp,sp,-32
bfc00ac8:	afb00014 	sw	s0,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:89
bfc00acc:	8c900000 	lw	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:88
bfc00ad0:	afb10018 	sw	s1,24(sp)
bfc00ad4:	00808821 	move	s1,a0
bfc00ad8:	afbf001c 	sw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:90
bfc00adc:	0ff00444 	jal	bfc01110 <strlen>
bfc00ae0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:91
bfc00ae4:	8e230004 	lw	v1,4(s1)
bfc00ae8:	00000000 	nop
bfc00aec:	10620009 	beq	v1,v0,bfc00b14 <getc+0x50>
bfc00af0:	02031021 	addu	v0,s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc00af4:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:94
bfc00af8:	24630001 	addiu	v1,v1,1
bfc00afc:	90420000 	lbu	v0,0(v0)
bfc00b00:	ae230004 	sw	v1,4(s1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc00b04:	8fb00014 	lw	s0,20(sp)
bfc00b08:	8fb10018 	lw	s1,24(sp)
bfc00b0c:	03e00008 	jr	ra
bfc00b10:	27bd0020 	addiu	sp,sp,32
bfc00b14:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:91
bfc00b18:	2402ffff 	li	v0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc00b1c:	8fb10018 	lw	s1,24(sp)
bfc00b20:	8fb00014 	lw	s0,20(sp)
bfc00b24:	03e00008 	jr	ra
bfc00b28:	27bd0020 	addiu	sp,sp,32

bfc00b2c <fgets>:
fgets():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:72
bfc00b2c:	27bdffe0 	addiu	sp,sp,-32
bfc00b30:	afb10014 	sw	s1,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:73
bfc00b34:	8cd10000 	lw	s1,0(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:72
bfc00b38:	afb20018 	sw	s2,24(sp)
bfc00b3c:	afb00010 	sw	s0,16(sp)
bfc00b40:	00809021 	move	s2,a0
bfc00b44:	00c08021 	move	s0,a2
bfc00b48:	afbf001c 	sw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:74
bfc00b4c:	0ff00444 	jal	bfc01110 <strlen>
bfc00b50:	02202021 	move	a0,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:77
bfc00b54:	8e040004 	lw	a0,4(s0)
bfc00b58:	00000000 	nop
bfc00b5c:	10820012 	beq	a0,v0,bfc00ba8 <fgets+0x7c>
bfc00b60:	00403821 	move	a3,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:78
bfc00b64:	02242821 	addu	a1,s1,a0
bfc00b68:	80a30000 	lb	v1,0(a1)
bfc00b6c:	2402000a 	li	v0,10
bfc00b70:	10620014 	beq	v1,v0,bfc00bc4 <fgets+0x98>
bfc00b74:	00003021 	move	a2,zero
bfc00b78:	0bf002e4 	j	bfc00b90 <fgets+0x64>
bfc00b7c:	2408000a 	li	t0,10
bfc00b80:	80a30001 	lb	v1,1(a1)
bfc00b84:	00000000 	nop
bfc00b88:	1068000e 	beq	v1,t0,bfc00bc4 <fgets+0x98>
bfc00b8c:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:82
bfc00b90:	02461021 	addu	v0,s2,a2
bfc00b94:	24840001 	addiu	a0,a0,1
bfc00b98:	a0430000 	sb	v1,0(v0)
bfc00b9c:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:77
bfc00ba0:	14e4fff7 	bne	a3,a0,bfc00b80 <fgets+0x54>
bfc00ba4:	ae040004 	sw	a0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc00ba8:	8fbf001c 	lw	ra,28(sp)
bfc00bac:	00001021 	move	v0,zero
bfc00bb0:	8fb20018 	lw	s2,24(sp)
bfc00bb4:	8fb10014 	lw	s1,20(sp)
bfc00bb8:	8fb00010 	lw	s0,16(sp)
bfc00bbc:	03e00008 	jr	ra
bfc00bc0:	27bd0020 	addiu	sp,sp,32
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:79
bfc00bc4:	02461021 	addu	v0,s2,a2
bfc00bc8:	2403000a 	li	v1,10
bfc00bcc:	a0430000 	sb	v1,0(v0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc00bd0:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:79
bfc00bd4:	24840001 	addiu	a0,a0,1
bfc00bd8:	ae040004 	sw	a0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc00bdc:	00001021 	move	v0,zero
bfc00be0:	8fb20018 	lw	s2,24(sp)
bfc00be4:	8fb10014 	lw	s1,20(sp)
bfc00be8:	8fb00010 	lw	s0,16(sp)
bfc00bec:	03e00008 	jr	ra
bfc00bf0:	27bd0020 	addiu	sp,sp,32

bfc00bf4 <fread>:
fread():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc00bf4:	27bdffd8 	addiu	sp,sp,-40
bfc00bf8:	afb10014 	sw	s1,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:34
bfc00bfc:	8cf10000 	lw	s1,0(a3)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc00c00:	afb40020 	sw	s4,32(sp)
bfc00c04:	0080a021 	move	s4,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:35
bfc00c08:	02202021 	move	a0,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc00c0c:	afb3001c 	sw	s3,28(sp)
bfc00c10:	afb20018 	sw	s2,24(sp)
bfc00c14:	afb00010 	sw	s0,16(sp)
bfc00c18:	afbf0024 	sw	ra,36(sp)
bfc00c1c:	00e08021 	move	s0,a3
bfc00c20:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:35
bfc00c24:	0ff00444 	jal	bfc01110 <strlen>
bfc00c28:	00c09021 	move	s2,a2
bfc00c2c:	00404821 	move	t1,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:36
bfc00c30:	8e020004 	lw	v0,4(s0)
bfc00c34:	00000000 	nop
bfc00c38:	10490017 	beq	v0,t1,bfc00c98 <fread+0xa4>
bfc00c3c:	02530018 	mult	s2,s3
bfc00c40:	00003821 	move	a3,zero
bfc00c44:	00002812 	mflo	a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:40
bfc00c48:	00e5102b 	sltu	v0,a3,a1
bfc00c4c:	10400009 	beqz	v0,bfc00c74 <fread+0x80>
bfc00c50:	02874021 	addu	t0,s4,a3
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:41
bfc00c54:	8e020004 	lw	v0,4(s0)
bfc00c58:	24e70001 	addiu	a3,a3,1
bfc00c5c:	02221821 	addu	v1,s1,v0
bfc00c60:	90640000 	lbu	a0,0(v1)
bfc00c64:	24420001 	addiu	v0,v0,1
bfc00c68:	a1040000 	sb	a0,0(t0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:42
bfc00c6c:	1522fff6 	bne	t1,v0,bfc00c48 <fread+0x54>
bfc00c70:	ae020004 	sw	v0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:47
bfc00c74:	8fbf0024 	lw	ra,36(sp)
bfc00c78:	00e01021 	move	v0,a3
bfc00c7c:	8fb40020 	lw	s4,32(sp)
bfc00c80:	8fb3001c 	lw	s3,28(sp)
bfc00c84:	8fb20018 	lw	s2,24(sp)
bfc00c88:	8fb10014 	lw	s1,20(sp)
bfc00c8c:	8fb00010 	lw	s0,16(sp)
bfc00c90:	03e00008 	jr	ra
bfc00c94:	27bd0028 	addiu	sp,sp,40
bfc00c98:	8fbf0024 	lw	ra,36(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:36
bfc00c9c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:47
bfc00ca0:	00e01021 	move	v0,a3
bfc00ca4:	8fb40020 	lw	s4,32(sp)
bfc00ca8:	8fb3001c 	lw	s3,28(sp)
bfc00cac:	8fb20018 	lw	s2,24(sp)
bfc00cb0:	8fb10014 	lw	s1,20(sp)
bfc00cb4:	8fb00010 	lw	s0,16(sp)
bfc00cb8:	03e00008 	jr	ra
bfc00cbc:	27bd0028 	addiu	sp,sp,40

bfc00cc0 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00cc0:	27bdffc8 	addiu	sp,sp,-56
bfc00cc4:	afb30024 	sw	s3,36(sp)
bfc00cc8:	afbf0034 	sw	ra,52(sp)
bfc00ccc:	afb60030 	sw	s6,48(sp)
bfc00cd0:	afb5002c 	sw	s5,44(sp)
bfc00cd4:	afb40028 	sw	s4,40(sp)
bfc00cd8:	afb20020 	sw	s2,32(sp)
bfc00cdc:	afb1001c 	sw	s1,28(sp)
bfc00ce0:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00ce4:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00ce8:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc00cec:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00cf0:	afa5003c 	sw	a1,60(sp)
bfc00cf4:	afa60040 	sw	a2,64(sp)
bfc00cf8:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00cfc:	12000013 	beqz	s0,bfc00d4c <printf+0x8c>
bfc00d00:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d04:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d08:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d0c:	245605d0 	addiu	s6,v0,1488
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d10:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d14:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d18:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d1c:	12140016 	beq	s0,s4,bfc00d78 <printf+0xb8>
bfc00d20:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d24:	1215002f 	beq	s0,s5,bfc00de4 <printf+0x124>
bfc00d28:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc00d2c:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00d30:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d34:	26310001 	addiu	s1,s1,1
bfc00d38:	02711021 	addu	v0,s3,s1
bfc00d3c:	80500000 	lb	s0,0(v0)
bfc00d40:	00000000 	nop
bfc00d44:	1600fff5 	bnez	s0,bfc00d1c <printf+0x5c>
bfc00d48:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc00d4c:	8fbf0034 	lw	ra,52(sp)
bfc00d50:	00001021 	move	v0,zero
bfc00d54:	8fb60030 	lw	s6,48(sp)
bfc00d58:	8fb5002c 	lw	s5,44(sp)
bfc00d5c:	8fb40028 	lw	s4,40(sp)
bfc00d60:	8fb30024 	lw	s3,36(sp)
bfc00d64:	8fb20020 	lw	s2,32(sp)
bfc00d68:	8fb1001c 	lw	s1,28(sp)
bfc00d6c:	8fb00018 	lw	s0,24(sp)
bfc00d70:	03e00008 	jr	ra
bfc00d74:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d78:	80440001 	lb	a0,1(v0)
bfc00d7c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d80:	2482ffdb 	addiu	v0,a0,-37
bfc00d84:	304200ff 	andi	v0,v0,0xff
bfc00d88:	2c430054 	sltiu	v1,v0,84
bfc00d8c:	14600005 	bnez	v1,bfc00da4 <printf+0xe4>
bfc00d90:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc00d94:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00d98:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d9c:	0bf0034e 	j	bfc00d38 <printf+0x78>
bfc00da0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00da4:	02c21021 	addu	v0,s6,v0
bfc00da8:	8c430000 	lw	v1,0(v0)
bfc00dac:	00000000 	nop
bfc00db0:	00600008 	jr	v1
bfc00db4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00db8:	26310001 	addiu	s1,s1,1
bfc00dbc:	02711021 	addu	v0,s3,s1
bfc00dc0:	80440001 	lb	a0,1(v0)
bfc00dc4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00dc8:	2482ffcf 	addiu	v0,a0,-49
bfc00dcc:	304200ff 	andi	v0,v0,0xff
bfc00dd0:	2c420009 	sltiu	v0,v0,9
bfc00dd4:	1440003f 	bnez	v0,bfc00ed4 <printf+0x214>
bfc00dd8:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00ddc:	0bf00361 	j	bfc00d84 <printf+0xc4>
bfc00de0:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00de4:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00de8:	2404000d 	li	a0,13
bfc00dec:	0bf0034b 	j	bfc00d2c <printf+0x6c>
bfc00df0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00df4:	8e440000 	lw	a0,0(s2)
bfc00df8:	2406000a 	li	a2,10
bfc00dfc:	0ff00404 	jal	bfc01010 <printbase>
bfc00e00:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00e04:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00e08:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e0c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00e10:	8e440000 	lw	a0,0(s2)
bfc00e14:	0ff003d4 	jal	bfc00f50 <putstring>
bfc00e18:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc00e1c:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e20:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00e24:	8e440000 	lw	a0,0(s2)
bfc00e28:	24060010 	li	a2,16
bfc00e2c:	0ff00404 	jal	bfc01010 <printbase>
bfc00e30:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00e34:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00e38:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e3c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc00e40:	8e440000 	lw	a0,0(s2)
bfc00e44:	24060008 	li	a2,8
bfc00e48:	0ff00404 	jal	bfc01010 <printbase>
bfc00e4c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc00e50:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc00e54:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e58:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc00e5c:	8e440000 	lw	a0,0(s2)
bfc00e60:	2406000a 	li	a2,10
bfc00e64:	0ff00404 	jal	bfc01010 <printbase>
bfc00e68:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc00e6c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc00e70:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e74:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc00e78:	8e440000 	lw	a0,0(s2)
bfc00e7c:	2406000a 	li	a2,10
bfc00e80:	0ff00404 	jal	bfc01010 <printbase>
bfc00e84:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc00e88:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc00e8c:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00e90:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc00e94:	8e440000 	lw	a0,0(s2)
bfc00e98:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00e9c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00ea0:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00ea4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00ea8:	8e440000 	lw	a0,0(s2)
bfc00eac:	24060002 	li	a2,2
bfc00eb0:	0ff00404 	jal	bfc01010 <printbase>
bfc00eb4:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00eb8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc00ebc:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00ec0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00ec4:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00ec8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc00ecc:	0bf0034d 	j	bfc00d34 <printf+0x74>
bfc00ed0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ed4:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00ed8:	000510c0 	sll	v0,a1,0x3
bfc00edc:	00051840 	sll	v1,a1,0x1
bfc00ee0:	00621821 	addu	v1,v1,v0
bfc00ee4:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ee8:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00eec:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ef0:	2482ffcf 	addiu	v0,a0,-49
bfc00ef4:	304200ff 	andi	v0,v0,0xff
bfc00ef8:	2c420009 	sltiu	v0,v0,9
bfc00efc:	26310001 	addiu	s1,s1,1
bfc00f00:	1040ff9f 	beqz	v0,bfc00d80 <printf+0xc0>
bfc00f04:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00f08:	0bf003b7 	j	bfc00edc <printf+0x21c>
bfc00f0c:	000510c0 	sll	v0,a1,0x3

bfc00f10 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00f10:	3c018000 	lui	at,0x8000
bfc00f14:	03e00008 	jr	ra
bfc00f18:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc00f1c:	03e00008 	jr	ra
bfc00f20:	00000000 	nop

bfc00f24 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00f24:	27bdffe8 	addiu	sp,sp,-24
bfc00f28:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc00f2c:	0ff003c4 	jal	bfc00f10 <tgt_putchar>
bfc00f30:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00f34:	8fbf0014 	lw	ra,20(sp)
bfc00f38:	00001021 	move	v0,zero
bfc00f3c:	03e00008 	jr	ra
bfc00f40:	27bd0018 	addiu	sp,sp,24
	...

bfc00f50 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc00f50:	27bdffe0 	addiu	sp,sp,-32
bfc00f54:	afb10014 	sw	s1,20(sp)
bfc00f58:	afbf001c 	sw	ra,28(sp)
bfc00f5c:	afb20018 	sw	s2,24(sp)
bfc00f60:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00f64:	80900000 	lb	s0,0(a0)
bfc00f68:	00000000 	nop
bfc00f6c:	12000013 	beqz	s0,bfc00fbc <putstring+0x6c>
bfc00f70:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00f74:	0bf003e5 	j	bfc00f94 <putstring+0x44>
bfc00f78:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00f7c:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00f80:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00f84:	82300000 	lb	s0,0(s1)
bfc00f88:	00000000 	nop
bfc00f8c:	1200000b 	beqz	s0,bfc00fbc <putstring+0x6c>
bfc00f90:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00f94:	1612fff9 	bne	s0,s2,bfc00f7c <putstring+0x2c>
bfc00f98:	26310001 	addiu	s1,s1,1
bfc00f9c:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00fa0:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00fa4:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00fa8:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00fac:	82300000 	lb	s0,0(s1)
bfc00fb0:	00000000 	nop
bfc00fb4:	1600fff7 	bnez	s0,bfc00f94 <putstring+0x44>
bfc00fb8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc00fbc:	8fbf001c 	lw	ra,28(sp)
bfc00fc0:	00001021 	move	v0,zero
bfc00fc4:	8fb20018 	lw	s2,24(sp)
bfc00fc8:	8fb10014 	lw	s1,20(sp)
bfc00fcc:	8fb00010 	lw	s0,16(sp)
bfc00fd0:	03e00008 	jr	ra
bfc00fd4:	27bd0020 	addiu	sp,sp,32

bfc00fd8 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc00fd8:	27bdffe8 	addiu	sp,sp,-24
bfc00fdc:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc00fe0:	0ff003d4 	jal	bfc00f50 <putstring>
bfc00fe4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc00fe8:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00fec:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc00ff0:	0ff003c9 	jal	bfc00f24 <putchar>
bfc00ff4:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc00ff8:	8fbf0014 	lw	ra,20(sp)
bfc00ffc:	00001021 	move	v0,zero
bfc01000:	03e00008 	jr	ra
bfc01004:	27bd0018 	addiu	sp,sp,24
	...

bfc01010 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc01010:	27bdff98 	addiu	sp,sp,-104
bfc01014:	afb30060 	sw	s3,96(sp)
bfc01018:	afb2005c 	sw	s2,92(sp)
bfc0101c:	afbf0064 	sw	ra,100(sp)
bfc01020:	afb10058 	sw	s1,88(sp)
bfc01024:	afb00054 	sw	s0,84(sp)
bfc01028:	00801821 	move	v1,a0
bfc0102c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc01030:	10e00003 	beqz	a3,bfc01040 <printbase+0x30>
bfc01034:	00c09021 	move	s2,a2
bfc01038:	0480002f 	bltz	a0,bfc010f8 <printbase+0xe8>
bfc0103c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc01040:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01044:	1200000c 	beqz	s0,bfc01078 <printbase+0x68>
bfc01048:	00008821 	move	s1,zero
bfc0104c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01050:	16400002 	bnez	s2,bfc0105c <printbase+0x4c>
bfc01054:	0212001b 	divu	zero,s0,s2
bfc01058:	0007000d 	break	0x7
bfc0105c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01060:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01064:	00001010 	mfhi	v0
bfc01068:	a0820000 	sb	v0,0(a0)
bfc0106c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01070:	1460fff7 	bnez	v1,bfc01050 <printbase+0x40>
bfc01074:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc01078:	0233102a 	slt	v0,s1,s3
bfc0107c:	10400002 	beqz	v0,bfc01088 <printbase+0x78>
bfc01080:	02201821 	move	v1,s1
bfc01084:	02601821 	move	v1,s3
bfc01088:	1060000c 	beqz	v1,bfc010bc <printbase+0xac>
bfc0108c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc01090:	27a20010 	addiu	v0,sp,16
bfc01094:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc01098:	26020001 	addiu	v0,s0,1
bfc0109c:	0222102a 	slt	v0,s1,v0
bfc010a0:	1040000e 	beqz	v0,bfc010dc <printbase+0xcc>
bfc010a4:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc010a8:	02009821 	move	s3,s0
bfc010ac:	0ff003c9 	jal	bfc00f24 <putchar>
bfc010b0:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc010b4:	1660fff8 	bnez	s3,bfc01098 <printbase+0x88>
bfc010b8:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc010bc:	8fbf0064 	lw	ra,100(sp)
bfc010c0:	00001021 	move	v0,zero
bfc010c4:	8fb30060 	lw	s3,96(sp)
bfc010c8:	8fb2005c 	lw	s2,92(sp)
bfc010cc:	8fb10058 	lw	s1,88(sp)
bfc010d0:	8fb00054 	lw	s0,84(sp)
bfc010d4:	03e00008 	jr	ra
bfc010d8:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc010dc:	82440000 	lb	a0,0(s2)
bfc010e0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc010e4:	2882000a 	slti	v0,a0,10
bfc010e8:	14400007 	bnez	v0,bfc01108 <printbase+0xf8>
bfc010ec:	02009821 	move	s3,s0
bfc010f0:	0bf0042b 	j	bfc010ac <printbase+0x9c>
bfc010f4:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc010f8:	0ff003c9 	jal	bfc00f24 <putchar>
bfc010fc:	00038023 	negu	s0,v1
bfc01100:	0bf00411 	j	bfc01044 <printbase+0x34>
bfc01104:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01108:	0bf0042a 	j	bfc010a8 <printbase+0x98>
bfc0110c:	24840030 	addiu	a0,a0,48

bfc01110 <strlen>:
strlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc01110:	80820000 	lb	v0,0(a0)
bfc01114:	00000000 	nop
bfc01118:	10400008 	beqz	v0,bfc0113c <strlen+0x2c>
bfc0111c:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:15
bfc01120:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc01124:	00851021 	addu	v0,a0,a1
bfc01128:	80430000 	lb	v1,0(v0)
bfc0112c:	00000000 	nop
bfc01130:	1460fffc 	bnez	v1,bfc01124 <strlen+0x14>
bfc01134:	24a50001 	addiu	a1,a1,1
bfc01138:	24a5ffff 	addiu	a1,a1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:18
bfc0113c:	03e00008 	jr	ra
bfc01140:	00a01021 	move	v0,a1

bfc01144 <strnlen>:
strnlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc01144:	10a00010 	beqz	a1,bfc01188 <strnlen+0x44>
bfc01148:	00001821 	move	v1,zero
bfc0114c:	80820000 	lb	v0,0(a0)
bfc01150:	00000000 	nop
bfc01154:	14400009 	bnez	v0,bfc0117c <strnlen+0x38>
bfc01158:	24630001 	addiu	v1,v1,1
bfc0115c:	2463ffff 	addiu	v1,v1,-1
bfc01160:	0bf00462 	j	bfc01188 <strnlen+0x44>
bfc01164:	00000000 	nop
bfc01168:	80c20000 	lb	v0,0(a2)
bfc0116c:	00000000 	nop
bfc01170:	10400005 	beqz	v0,bfc01188 <strnlen+0x44>
bfc01174:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:37
bfc01178:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc0117c:	0065102b 	sltu	v0,v1,a1
bfc01180:	1440fff9 	bnez	v0,bfc01168 <strnlen+0x24>
bfc01184:	00833021 	addu	a2,a0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:40
bfc01188:	03e00008 	jr	ra
bfc0118c:	00601021 	move	v0,v1

bfc01190 <strcpy>:
strcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:55
bfc01190:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:60
bfc01194:	80a20000 	lb	v0,0(a1)
bfc01198:	24a50001 	addiu	a1,a1,1
bfc0119c:	a0620000 	sb	v0,0(v1)
bfc011a0:	1440fffc 	bnez	v0,bfc01194 <strcpy+0x4>
bfc011a4:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:64
bfc011a8:	03e00008 	jr	ra
bfc011ac:	00801021 	move	v0,a0

bfc011b0 <strncpy>:
strncpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc011b0:	10c00009 	beqz	a2,bfc011d8 <strncpy+0x28>
bfc011b4:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc011b8:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:83
bfc011bc:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc011c0:	a0620000 	sb	v0,0(v1)
bfc011c4:	10400002 	beqz	v0,bfc011d0 <strncpy+0x20>
bfc011c8:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:81
bfc011cc:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc011d0:	14c0fff9 	bnez	a2,bfc011b8 <strncpy+0x8>
bfc011d4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:86
bfc011d8:	03e00008 	jr	ra
bfc011dc:	00801021 	move	v0,a0

bfc011e0 <strcmp>:
strcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc011e0:	80820000 	lb	v0,0(a0)
bfc011e4:	00000000 	nop
bfc011e8:	14400007 	bnez	v0,bfc01208 <strcmp+0x28>
bfc011ec:	00000000 	nop
bfc011f0:	0bf0048a 	j	bfc01228 <strcmp+0x48>
bfc011f4:	00000000 	nop
bfc011f8:	80820000 	lb	v0,0(a0)
bfc011fc:	00000000 	nop
bfc01200:	10400009 	beqz	v0,bfc01228 <strcmp+0x48>
bfc01204:	24a50001 	addiu	a1,a1,1
bfc01208:	80a30000 	lb	v1,0(a1)
bfc0120c:	00000000 	nop
bfc01210:	1043fff9 	beq	v0,v1,bfc011f8 <strcmp+0x18>
bfc01214:	24840001 	addiu	a0,a0,1
bfc01218:	304400ff 	andi	a0,v0,0xff
bfc0121c:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc01220:	03e00008 	jr	ra
bfc01224:	00821023 	subu	v0,a0,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc01228:	80a30000 	lb	v1,0(a1)
bfc0122c:	00002021 	move	a0,zero
bfc01230:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc01234:	03e00008 	jr	ra
bfc01238:	00821023 	subu	v0,a0,v0

bfc0123c <strncmp>:
strncmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc0123c:	10c00016 	beqz	a2,bfc01298 <strncmp+0x5c>
bfc01240:	00000000 	nop
bfc01244:	80830000 	lb	v1,0(a0)
bfc01248:	00000000 	nop
bfc0124c:	14600009 	bnez	v1,bfc01274 <strncmp+0x38>
bfc01250:	00000000 	nop
bfc01254:	0bf004a8 	j	bfc012a0 <strncmp+0x64>
bfc01258:	00000000 	nop
bfc0125c:	10c0000e 	beqz	a2,bfc01298 <strncmp+0x5c>
bfc01260:	24840001 	addiu	a0,a0,1
bfc01264:	80830000 	lb	v1,0(a0)
bfc01268:	00000000 	nop
bfc0126c:	1060000c 	beqz	v1,bfc012a0 <strncmp+0x64>
bfc01270:	24a50001 	addiu	a1,a1,1
bfc01274:	80a20000 	lb	v0,0(a1)
bfc01278:	00000000 	nop
bfc0127c:	1062fff7 	beq	v1,v0,bfc0125c <strncmp+0x20>
bfc01280:	24c6ffff 	addiu	a2,a2,-1
bfc01284:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc01288:	306300ff 	andi	v1,v1,0xff
bfc0128c:	304200ff 	andi	v0,v0,0xff
bfc01290:	03e00008 	jr	ra
bfc01294:	00621023 	subu	v0,v1,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:132
bfc01298:	03e00008 	jr	ra
bfc0129c:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc012a0:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc012a4:	306300ff 	andi	v1,v1,0xff
bfc012a8:	304200ff 	andi	v0,v0,0xff
bfc012ac:	03e00008 	jr	ra
bfc012b0:	00621023 	subu	v0,v1,v0

bfc012b4 <strchr>:
strchr():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc012b4:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:143
bfc012b8:	00052e00 	sll	a1,a1,0x18
bfc012bc:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc012c0:	1060000c 	beqz	v1,bfc012f4 <strchr+0x40>
bfc012c4:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:145
bfc012c8:	14650006 	bne	v1,a1,bfc012e4 <strchr+0x30>
bfc012cc:	24420001 	addiu	v0,v0,1
bfc012d0:	03e00008 	jr	ra
bfc012d4:	2442ffff 	addiu	v0,v0,-1
bfc012d8:	10650008 	beq	v1,a1,bfc012fc <strchr+0x48>
bfc012dc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:148
bfc012e0:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc012e4:	80430000 	lb	v1,0(v0)
bfc012e8:	00000000 	nop
bfc012ec:	1460fffa 	bnez	v1,bfc012d8 <strchr+0x24>
bfc012f0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:151
bfc012f4:	03e00008 	jr	ra
bfc012f8:	00001021 	move	v0,zero
bfc012fc:	03e00008 	jr	ra
bfc01300:	00000000 	nop

bfc01304 <strfind>:
strfind():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01304:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:163
bfc01308:	00052e00 	sll	a1,a1,0x18
bfc0130c:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01310:	1060000c 	beqz	v1,bfc01344 <strfind+0x40>
bfc01314:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:165
bfc01318:	14650006 	bne	v1,a1,bfc01334 <strfind+0x30>
bfc0131c:	24420001 	addiu	v0,v0,1
bfc01320:	03e00008 	jr	ra
bfc01324:	2442ffff 	addiu	v0,v0,-1
bfc01328:	10650008 	beq	v1,a1,bfc0134c <strfind+0x48>
bfc0132c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:168
bfc01330:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc01334:	80430000 	lb	v1,0(v0)
bfc01338:	00000000 	nop
bfc0133c:	1460fffa 	bnez	v1,bfc01328 <strfind+0x24>
bfc01340:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:171
bfc01344:	03e00008 	jr	ra
bfc01348:	00000000 	nop
bfc0134c:	03e00008 	jr	ra
bfc01350:	00000000 	nop

bfc01354 <memset>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:273
bfc01354:	00052e00 	sll	a1,a1,0x18
bfc01358:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc0135c:	10c00006 	beqz	a2,bfc01378 <memset+0x24>
bfc01360:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:277
bfc01364:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc01368:	24c6ffff 	addiu	a2,a2,-1
bfc0136c:	a0650000 	sb	a1,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc01370:	14c0fffd 	bnez	a2,bfc01368 <memset+0x14>
bfc01374:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:283
bfc01378:	03e00008 	jr	ra
bfc0137c:	00000000 	nop

bfc01380 <memcpy>:
memcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc01380:	10c00008 	beqz	a2,bfc013a4 <memcpy+0x24>
bfc01384:	00804021 	move	t0,a0
bfc01388:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:307
bfc0138c:	00a71021 	addu	v0,a1,a3
bfc01390:	90440000 	lbu	a0,0(v0)
bfc01394:	01071821 	addu	v1,t0,a3
bfc01398:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc0139c:	14e6fffb 	bne	a3,a2,bfc0138c <memcpy+0xc>
bfc013a0:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:311
bfc013a4:	03e00008 	jr	ra
bfc013a8:	01001021 	move	v0,t0

bfc013ac <memmove>:
memmove():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:329
bfc013ac:	00a4102b 	sltu	v0,a1,a0
bfc013b0:	10400005 	beqz	v0,bfc013c8 <memmove+0x1c>
bfc013b4:	00804021 	move	t0,a0
bfc013b8:	00a62021 	addu	a0,a1,a2
bfc013bc:	0104102b 	sltu	v0,t0,a0
bfc013c0:	1440000b 	bnez	v0,bfc013f0 <memmove+0x44>
bfc013c4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc013c8:	10c00007 	beqz	a2,bfc013e8 <memmove+0x3c>
bfc013cc:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:336
bfc013d0:	00a71021 	addu	v0,a1,a3
bfc013d4:	90440000 	lbu	a0,0(v0)
bfc013d8:	01071821 	addu	v1,t0,a3
bfc013dc:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc013e0:	14c7fffb 	bne	a2,a3,bfc013d0 <memmove+0x24>
bfc013e4:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc013e8:	03e00008 	jr	ra
bfc013ec:	01001021 	move	v0,t0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc013f0:	10c0fffd 	beqz	a2,bfc013e8 <memmove+0x3c>
bfc013f4:	01061821 	addu	v1,t0,a2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:332
bfc013f8:	2484ffff 	addiu	a0,a0,-1
bfc013fc:	90820000 	lbu	v0,0(a0)
bfc01400:	2463ffff 	addiu	v1,v1,-1
bfc01404:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc01408:	14c0fffb 	bnez	a2,bfc013f8 <memmove+0x4c>
bfc0140c:	a0620000 	sb	v0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc01410:	03e00008 	jr	ra
bfc01414:	01001021 	move	v0,t0

bfc01418 <memcmp>:
memcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc01418:	10c00011 	beqz	a2,bfc01460 <memcmp+0x48>
bfc0141c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc01420:	80830000 	lb	v1,0(a0)
bfc01424:	80a20000 	lb	v0,0(a1)
bfc01428:	00000000 	nop
bfc0142c:	1462000e 	bne	v1,v0,bfc01468 <memcmp+0x50>
bfc01430:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc01434:	0bf00514 	j	bfc01450 <memcmp+0x38>
bfc01438:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc0143c:	80630001 	lb	v1,1(v1)
bfc01440:	80420001 	lb	v0,1(v0)
bfc01444:	00000000 	nop
bfc01448:	14620007 	bne	v1,v0,bfc01468 <memcmp+0x50>
bfc0144c:	24c6ffff 	addiu	a2,a2,-1
bfc01450:	00871821 	addu	v1,a0,a3
bfc01454:	00a71021 	addu	v0,a1,a3
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc01458:	14c0fff8 	bnez	a2,bfc0143c <memcmp+0x24>
bfc0145c:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:368
bfc01460:	03e00008 	jr	ra
bfc01464:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:363
bfc01468:	306300ff 	andi	v1,v1,0xff
bfc0146c:	304200ff 	andi	v0,v0,0xff
bfc01470:	03e00008 	jr	ra
bfc01474:	00621023 	subu	v0,v1,v0

bfc01478 <bzero>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc01478:	10a00005 	beqz	a1,bfc01490 <bzero+0x18>
bfc0147c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc01480:	24a5ffff 	addiu	a1,a1,-1
bfc01484:	a0800000 	sb	zero,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc01488:	14a0fffd 	bnez	a1,bfc01480 <bzero+0x8>
bfc0148c:	24840001 	addiu	a0,a0,1
bfc01490:	03e00008 	jr	ra
bfc01494:	00000000 	nop
	...

bfc014a0 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc014a0:	3c01bfd0 	lui	at,0xbfd0
bfc014a4:	3421e000 	ori	at,at,0xe000
bfc014a8:	8c220000 	lw	v0,0(at)
bfc014ac:	03e00008 	jr	ra
bfc014b0:	00000000 	nop

bfc014b4 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc014b4:	3c01bfd0 	lui	at,0xbfd0
bfc014b8:	3421e000 	ori	at,at,0xe000
bfc014bc:	8c220000 	lw	v0,0(at)
bfc014c0:	03e00008 	jr	ra
bfc014c4:	00000000 	nop

bfc014c8 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc014c8:	3c01bfd0 	lui	at,0xbfd0
bfc014cc:	3421e000 	ori	at,at,0xe000
bfc014d0:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc014d4:	03e00008 	jr	ra
bfc014d8:	00021040 	sll	v0,v0,0x1

bfc014dc <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc014dc:	3c01bfd0 	lui	at,0xbfd0
bfc014e0:	3421e000 	ori	at,at,0xe000
bfc014e4:	8c220000 	lw	v0,0(at)
bfc014e8:	03e00008 	jr	ra
bfc014ec:	00000000 	nop

bfc014f0 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc014f0:	27bdffe8 	addiu	sp,sp,-24
bfc014f4:	afbf0014 	sw	ra,20(sp)
bfc014f8:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc014fc:	3c01bfd0 	lui	at,0xbfd0
bfc01500:	3421e000 	ori	at,at,0xe000
bfc01504:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01508:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0150c:	14400002 	bnez	v0,bfc01518 <clock_gettime+0x28>
bfc01510:	0062001b 	divu	zero,v1,v0
bfc01514:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01518:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc0151c:	3c073b9a 	lui	a3,0x3b9a
bfc01520:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01524:	3c048000 	lui	a0,0x8000
bfc01528:	24840720 	addiu	a0,a0,1824
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0152c:	00003012 	mflo	a2
bfc01530:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01534:	14400002 	bnez	v0,bfc01540 <clock_gettime+0x50>
bfc01538:	0062001b 	divu	zero,v1,v0
bfc0153c:	0007000d 	break	0x7
bfc01540:	00002810 	mfhi	a1
bfc01544:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc01548:	14400002 	bnez	v0,bfc01554 <clock_gettime+0x64>
bfc0154c:	00c2001b 	divu	zero,a2,v0
bfc01550:	0007000d 	break	0x7
bfc01554:	00005010 	mfhi	t2
bfc01558:	ad2a0008 	sw	t2,8(t1)
bfc0155c:	00004012 	mflo	t0
bfc01560:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc01564:	14e00002 	bnez	a3,bfc01570 <clock_gettime+0x80>
bfc01568:	00c7001b 	divu	zero,a2,a3
bfc0156c:	0007000d 	break	0x7
bfc01570:	00003012 	mflo	a2
bfc01574:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc01578:	14400002 	bnez	v0,bfc01584 <clock_gettime+0x94>
bfc0157c:	0102001b 	divu	zero,t0,v0
bfc01580:	0007000d 	break	0x7
bfc01584:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01588:	0ff00330 	jal	bfc00cc0 <printf>
bfc0158c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc01590:	8fbf0014 	lw	ra,20(sp)
bfc01594:	00001021 	move	v0,zero
bfc01598:	03e00008 	jr	ra
bfc0159c:	27bd0018 	addiu	sp,sp,24

bfc015a0 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc015a0:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc015a4:	03e00008 	jr	ra
bfc015a8:	00000000 	nop

bfc015ac <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc015ac:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc015b0:	03e00008 	jr	ra
bfc015b4:	00000000 	nop

bfc015b8 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc015b8:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc015bc:	27bdffe8 	addiu	sp,sp,-24
bfc015c0:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc015c4:	0ff00330 	jal	bfc00cc0 <printf>
bfc015c8:	24840734 	addiu	a0,a0,1844
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc015cc:	3c048000 	lui	a0,0x8000
bfc015d0:	24840750 	addiu	a0,a0,1872
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc015d4:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc015d8:	0ff00330 	jal	bfc00cc0 <printf>
bfc015dc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc015e0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc015e4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc015e8:	24840760 	addiu	a0,a0,1888
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc015ec:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc015f0:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc015f4:	0bf00330 	j	bfc00cc0 <printf>
bfc015f8:	00000000 	nop
bfc015fc:	00000000 	nop
