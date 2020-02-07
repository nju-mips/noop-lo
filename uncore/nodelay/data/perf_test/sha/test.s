
obj/sha/main.elf:     file format elf32-tradlittlemips
obj/sha/main.elf


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
bfc00010:	27bd4a4c 	addiu	sp,sp,19020
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c8a70 	addiu	gp,gp,-30096
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
bfc00380:	0ff00bde 	jal	bfc02f78 <exception>
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
bfc003a4:	0ff00a66 	jal	bfc02998 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff00b9d 	jal	bfc02e74 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	0ff00124 	jal	bfc00490 <sha_driver>
bfc003b8:	00408821 	move	s1,v0
bfc003bc:	0ff00b9d 	jal	bfc02e74 <get_count>
bfc003c0:	00408021 	move	s0,v0
bfc003c4:	1200001a 	beqz	s0,bfc00430 <shell+0xa0>
bfc003c8:	00518823 	subu	s1,v0,s1
bfc003cc:	3c188000 	lui	t8,0x8000
bfc003d0:	0ff00a66 	jal	bfc02998 <puts>
bfc003d4:	2704001c 	addiu	a0,t8,28
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
bfc00400:	2604002c 	addiu	a0,s0,44
bfc00404:	ad8b0000 	sw	t3,0(t4)
bfc00408:	02202821 	move	a1,s1
bfc0040c:	ad400000 	sw	zero,0(t2)
bfc00410:	8fbf001c 	lw	ra,28(sp)
bfc00414:	af310000 	sw	s1,0(t9)
bfc00418:	8fb00014 	lw	s0,20(sp)
bfc0041c:	8fb10018 	lw	s1,24(sp)
bfc00420:	0bf009a0 	j	bfc02680 <printf>
bfc00424:	27bd0020 	addiu	sp,sp,32
	...
bfc00430:	3c098000 	lui	t1,0x8000
bfc00434:	0ff00a66 	jal	bfc02998 <puts>
bfc00438:	25240010 	addiu	a0,t1,16
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
bfc00464:	2604002c 	addiu	a0,s0,44
bfc00468:	acc20000 	sw	v0,0(a2)
bfc0046c:	8fbf001c 	lw	ra,28(sp)
bfc00470:	aca70000 	sw	a3,0(a1)
bfc00474:	8fb00014 	lw	s0,20(sp)
bfc00478:	02202821 	move	a1,s1
bfc0047c:	af310000 	sw	s1,0(t9)
bfc00480:	8fb10018 	lw	s1,24(sp)
bfc00484:	0bf009a0 	j	bfc02680 <printf>
bfc00488:	27bd0020 	addiu	sp,sp,32
bfc0048c:	00000000 	nop

bfc00490 <sha_driver>:
sha_driver():
bfc00490:	8f848010 	lw	a0,-32752(gp)
bfc00494:	27bdff70 	addiu	sp,sp,-144
bfc00498:	afbf008c 	sw	ra,140(sp)
bfc0049c:	afb10088 	sw	s1,136(sp)
bfc004a0:	0ff00904 	jal	bfc02410 <fopen>
bfc004a4:	afb00084 	sw	s0,132(sp)
bfc004a8:	27b00024 	addiu	s0,sp,36
bfc004ac:	00402821 	move	a1,v0
bfc004b0:	02002021 	move	a0,s0
bfc004b4:	0ff003ec 	jal	bfc00fb0 <sha_stream>
bfc004b8:	00408821 	move	s1,v0
bfc004bc:	0ff00324 	jal	bfc00c90 <sha_print>
bfc004c0:	02002021 	move	a0,s0
bfc004c4:	3c058000 	lui	a1,0x8000
bfc004c8:	24a50060 	addiu	a1,a1,96
bfc004cc:	24060014 	li	a2,20
bfc004d0:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc004d4:	27a40010 	addiu	a0,sp,16
bfc004d8:	0ff00915 	jal	bfc02454 <fclose>
bfc004dc:	02202021 	move	a0,s1
bfc004e0:	8fb00010 	lw	s0,16(sp)
bfc004e4:	3c118000 	lui	s1,0x8000
bfc004e8:	8fa50024 	lw	a1,36(sp)
bfc004ec:	26240048 	addiu	a0,s1,72
bfc004f0:	0ff009a0 	jal	bfc02680 <printf>
bfc004f4:	02003021 	move	a2,s0
bfc004f8:	8fa30024 	lw	v1,36(sp)
bfc004fc:	00000000 	nop
bfc00500:	16030027 	bne	s0,v1,bfc005a0 <sha_driver+0x110>
bfc00504:	26240048 	addiu	a0,s1,72
bfc00508:	8fb00014 	lw	s0,20(sp)
bfc0050c:	8fa50028 	lw	a1,40(sp)
bfc00510:	0ff009a0 	jal	bfc02680 <printf>
bfc00514:	02003021 	move	a2,s0
bfc00518:	8fa20028 	lw	v0,40(sp)
bfc0051c:	00000000 	nop
bfc00520:	1602001f 	bne	s0,v0,bfc005a0 <sha_driver+0x110>
bfc00524:	26240048 	addiu	a0,s1,72
bfc00528:	8fb00018 	lw	s0,24(sp)
bfc0052c:	8fa5002c 	lw	a1,44(sp)
bfc00530:	0ff009a0 	jal	bfc02680 <printf>
bfc00534:	02003021 	move	a2,s0
bfc00538:	8fa4002c 	lw	a0,44(sp)
bfc0053c:	00000000 	nop
bfc00540:	16040017 	bne	s0,a0,bfc005a0 <sha_driver+0x110>
bfc00544:	00000000 	nop
bfc00548:	8fb0001c 	lw	s0,28(sp)
bfc0054c:	8fa50030 	lw	a1,48(sp)
bfc00550:	02003021 	move	a2,s0
bfc00554:	0ff009a0 	jal	bfc02680 <printf>
bfc00558:	26240048 	addiu	a0,s1,72
bfc0055c:	8fa60030 	lw	a2,48(sp)
bfc00560:	00000000 	nop
bfc00564:	1606000e 	bne	s0,a2,bfc005a0 <sha_driver+0x110>
bfc00568:	26240048 	addiu	a0,s1,72
bfc0056c:	8fb00020 	lw	s0,32(sp)
bfc00570:	8fa50034 	lw	a1,52(sp)
bfc00574:	0ff009a0 	jal	bfc02680 <printf>
bfc00578:	02003021 	move	a2,s0
bfc0057c:	8fa80034 	lw	t0,52(sp)
bfc00580:	8fbf008c 	lw	ra,140(sp)
bfc00584:	02083826 	xor	a3,s0,t0
bfc00588:	0007102b 	sltu	v0,zero,a3
bfc0058c:	8fb10088 	lw	s1,136(sp)
bfc00590:	8fb00084 	lw	s0,132(sp)
bfc00594:	03e00008 	jr	ra
bfc00598:	27bd0090 	addiu	sp,sp,144
bfc0059c:	00000000 	nop
bfc005a0:	8fbf008c 	lw	ra,140(sp)
bfc005a4:	24020001 	li	v0,1
bfc005a8:	8fb10088 	lw	s1,136(sp)
bfc005ac:	8fb00084 	lw	s0,132(sp)
bfc005b0:	03e00008 	jr	ra
bfc005b4:	27bd0090 	addiu	sp,sp,144
	...

bfc005c0 <sha_transform>:
sha_transform():
bfc005c0:	27bdfe90 	addiu	sp,sp,-368
bfc005c4:	8c8e0044 	lw	t6,68(a0)
bfc005c8:	afb4015c 	sw	s4,348(sp)
bfc005cc:	8c94002c 	lw	s4,44(a0)
bfc005d0:	8c8f003c 	lw	t7,60(a0)
bfc005d4:	afb20154 	sw	s2,340(sp)
bfc005d8:	8c920024 	lw	s2,36(a0)
bfc005dc:	01d45826 	xor	t3,t6,s4
bfc005e0:	afb60164 	sw	s6,356(sp)
bfc005e4:	afb30158 	sw	s3,344(sp)
bfc005e8:	0080b021 	move	s6,a0
bfc005ec:	8c930028 	lw	s3,40(a0)
bfc005f0:	afb0014c 	sw	s0,332(sp)
bfc005f4:	8c900020 	lw	s0,32(a0)
bfc005f8:	8c8d0050 	lw	t5,80(a0)
bfc005fc:	8c8c001c 	lw	t4,28(a0)
bfc00600:	8ec70030 	lw	a3,48(s6)
bfc00604:	8ec80034 	lw	t0,52(s6)
bfc00608:	8ec90038 	lw	t1,56(s6)
bfc0060c:	8eca0048 	lw	t2,72(s6)
bfc00610:	27a60008 	addiu	a2,sp,8
bfc00614:	024f2826 	xor	a1,s2,t7
bfc00618:	afb50160 	sw	s5,352(sp)
bfc0061c:	afb10150 	sw	s1,336(sp)
bfc00620:	afaf0140 	sw	t7,320(sp)
bfc00624:	8c910040 	lw	s1,64(a0)
bfc00628:	8c8f0058 	lw	t7,88(a0)
bfc0062c:	afae0144 	sw	t6,324(sp)
bfc00630:	27b50104 	addiu	s5,sp,260
bfc00634:	8c8e0054 	lw	t6,84(a0)
bfc00638:	01722026 	xor	a0,t3,s2
bfc0063c:	8ecb004c 	lw	t3,76(s6)
bfc00640:	afbe016c 	sw	s8,364(sp)
bfc00644:	02701826 	xor	v1,s3,s0
bfc00648:	02a6f023 	subu	s8,s5,a2
bfc0064c:	0071c826 	xor	t9,v1,s1
bfc00650:	27d8fff4 	addiu	t8,s8,-12
bfc00654:	afb70168 	sw	s7,360(sp)
bfc00658:	afa70014 	sw	a3,20(sp)
bfc0065c:	00acb826 	xor	s7,a1,t4
bfc00660:	afa80018 	sw	t0,24(sp)
bfc00664:	afa9001c 	sw	t1,28(sp)
bfc00668:	afaa002c 	sw	t2,44(sp)
bfc0066c:	afab0030 	sw	t3,48(sp)
bfc00670:	afac0000 	sw	t4,0(sp)
bfc00674:	afb00004 	sw	s0,4(sp)
bfc00678:	8fa30140 	lw	v1,320(sp)
bfc0067c:	8fa20144 	lw	v0,324(sp)
bfc00680:	01b7f026 	xor	s8,t5,s7
bfc00684:	00182882 	srl	a1,t8,0x2
bfc00688:	01d9b826 	xor	s7,t6,t9
bfc0068c:	27b80014 	addiu	t8,sp,20
bfc00690:	01e4c826 	xor	t9,t7,a0
bfc00694:	afb20008 	sw	s2,8(sp)
bfc00698:	afb3000c 	sw	s3,12(sp)
bfc0069c:	afb40010 	sw	s4,16(sp)
bfc006a0:	afa30020 	sw	v1,32(sp)
bfc006a4:	afb10024 	sw	s1,36(sp)
bfc006a8:	afa20028 	sw	v0,40(sp)
bfc006ac:	afad0034 	sw	t5,52(sp)
bfc006b0:	afae0038 	sw	t6,56(sp)
bfc006b4:	afaf003c 	sw	t7,60(sp)
bfc006b8:	30a50001 	andi	a1,a1,0x1
bfc006bc:	acde0038 	sw	s8,56(a2)
bfc006c0:	acd7003c 	sw	s7,60(a2)
bfc006c4:	13150045 	beq	t8,s5,bfc007dc <sha_transform+0x21c>
bfc006c8:	acd90040 	sw	t9,64(a2)
bfc006cc:	10a00018 	beqz	a1,bfc00730 <sha_transform+0x170>
bfc006d0:	00000000 	nop
bfc006d4:	8fae0014 	lw	t6,20(sp)
bfc006d8:	8f030018 	lw	v1,24(t8)
bfc006dc:	8f0f0004 	lw	t7,4(t8)
bfc006e0:	8f06fffc 	lw	a2,-4(t8)
bfc006e4:	8f070020 	lw	a3,32(t8)
bfc006e8:	8f050008 	lw	a1,8(t8)
bfc006ec:	8f0bfff8 	lw	t3,-8(t8)
bfc006f0:	8f14001c 	lw	s4,28(t8)
bfc006f4:	01e64826 	xor	t1,t7,a2
bfc006f8:	00e59026 	xor	s2,a3,a1
bfc006fc:	01c34026 	xor	t0,t6,v1
bfc00700:	010b6026 	xor	t4,t0,t3
bfc00704:	01348826 	xor	s1,t1,s4
bfc00708:	024e5026 	xor	t2,s2,t6
bfc0070c:	03ccf026 	xor	s8,s8,t4
bfc00710:	02f1b826 	xor	s7,s7,s1
bfc00714:	032ac826 	xor	t9,t9,t2
bfc00718:	af190040 	sw	t9,64(t8)
bfc0071c:	af1e0038 	sw	s8,56(t8)
bfc00720:	af17003c 	sw	s7,60(t8)
bfc00724:	27b80020 	addiu	t8,sp,32
bfc00728:	1315002c 	beq	t8,s5,bfc007dc <sha_transform+0x21c>
bfc0072c:	00000000 	nop
bfc00730:	8f110000 	lw	s1,0(t8)
bfc00734:	8f100018 	lw	s0,24(t8)
bfc00738:	8f0c0004 	lw	t4,4(t8)
bfc0073c:	8f09fffc 	lw	t1,-4(t8)
bfc00740:	8f060020 	lw	a2,32(t8)
bfc00744:	8f0d0008 	lw	t5,8(t8)
bfc00748:	8f12fff8 	lw	s2,-8(t8)
bfc0074c:	8f13001c 	lw	s3,28(t8)
bfc00750:	0189a026 	xor	s4,t4,t1
bfc00754:	02301026 	xor	v0,s1,s0
bfc00758:	00cd7026 	xor	t6,a2,t5
bfc0075c:	00523826 	xor	a3,v0,s2
bfc00760:	02934026 	xor	t0,s4,s3
bfc00764:	01d17826 	xor	t7,t6,s1
bfc00768:	03c78026 	xor	s0,s8,a3
bfc0076c:	02e89826 	xor	s3,s7,t0
bfc00770:	032f3026 	xor	a2,t9,t7
bfc00774:	af100038 	sw	s0,56(t8)
bfc00778:	af13003c 	sw	s3,60(t8)
bfc0077c:	af060040 	sw	a2,64(t8)
bfc00780:	2702000c 	addiu	v0,t8,12
bfc00784:	8f0d000c 	lw	t5,12(t8)
bfc00788:	8c440018 	lw	a0,24(v0)
bfc0078c:	8c450004 	lw	a1,4(v0)
bfc00790:	8c4afffc 	lw	t2,-4(v0)
bfc00794:	8c4b0020 	lw	t3,32(v0)
bfc00798:	8c430008 	lw	v1,8(v0)
bfc0079c:	8c5efff8 	lw	s8,-8(v0)
bfc007a0:	8c4c001c 	lw	t4,28(v0)
bfc007a4:	00aab826 	xor	s7,a1,t2
bfc007a8:	0163c826 	xor	t9,t3,v1
bfc007ac:	01a44826 	xor	t1,t5,a0
bfc007b0:	013e9026 	xor	s2,t1,s8
bfc007b4:	02eca026 	xor	s4,s7,t4
bfc007b8:	032d8826 	xor	s1,t9,t5
bfc007bc:	0212f026 	xor	s8,s0,s2
bfc007c0:	0274b826 	xor	s7,s3,s4
bfc007c4:	00d1c826 	xor	t9,a2,s1
bfc007c8:	27180018 	addiu	t8,t8,24
bfc007cc:	ac590040 	sw	t9,64(v0)
bfc007d0:	ac5e0038 	sw	s8,56(v0)
bfc007d4:	1715ffd6 	bne	t8,s5,bfc00730 <sha_transform+0x170>
bfc007d8:	ac57003c 	sw	s7,60(v0)
bfc007dc:	8fb2011c 	lw	s2,284(sp)
bfc007e0:	8fa60130 	lw	a2,304(sp)
bfc007e4:	8fb30104 	lw	s3,260(sp)
bfc007e8:	0246a026 	xor	s4,s2,a2
bfc007ec:	8fb700fc 	lw	s7,252(sp)
bfc007f0:	0293c826 	xor	t9,s4,s3
bfc007f4:	0337c026 	xor	t8,t9,s7
bfc007f8:	afb8013c 	sw	t8,316(sp)
bfc007fc:	3c155a82 	lui	s5,0x5a82
bfc00800:	8ed40004 	lw	s4,4(s6)
bfc00804:	36b27999 	ori	s2,s5,0x7999
bfc00808:	8fa20000 	lw	v0,0(sp)
bfc0080c:	8ed50000 	lw	s5,0(s6)
bfc00810:	8ed70008 	lw	s7,8(s6)
bfc00814:	8ed8000c 	lw	t8,12(s6)
bfc00818:	8ed90010 	lw	t9,16(s6)
bfc0081c:	00158ec2 	srl	s1,s5,0x1b
bfc00820:	00527021 	addu	t6,v0,s2
bfc00824:	00158140 	sll	s0,s5,0x5
bfc00828:	00143827 	nor	a3,zero,s4
bfc0082c:	02302825 	or	a1,s1,s0
bfc00830:	00f85024 	and	t2,a3,t8
bfc00834:	02f47824 	and	t7,s7,s4
bfc00838:	01d94021 	addu	t0,t6,t9
bfc0083c:	014f1825 	or	v1,t2,t7
bfc00840:	01055821 	addu	t3,t0,a1
bfc00844:	00142082 	srl	a0,s4,0x2
bfc00848:	0014f780 	sll	s8,s4,0x1e
bfc0084c:	01634821 	addu	t1,t3,v1
bfc00850:	27b30050 	addiu	s3,sp,80
bfc00854:	03c46825 	or	t5,s8,a0
bfc00858:	27ab0004 	addiu	t3,sp,4
bfc0085c:	03008821 	move	s1,t8
bfc00860:	02a05021 	move	t2,s5
bfc00864:	0bf00224 	j	bfc00890 <sha_transform+0x2d0>
bfc00868:	02e07821 	move	t7,s7
bfc0086c:	00000000 	nop
bfc00870:	8d620004 	lw	v0,4(t3)
bfc00874:	020e6825 	or	t5,s0,t6
bfc00878:	00522021 	addu	a0,v0,s2
bfc0087c:	008f4821 	addu	t1,a0,t7
bfc00880:	01237821 	addu	t7,t1,v1
bfc00884:	01e64821 	addu	t1,t7,a2
bfc00888:	256b0008 	addiu	t3,t3,8
bfc0088c:	01807821 	move	t7,t4
bfc00890:	8d680000 	lw	t0,0(t3)
bfc00894:	000a7027 	nor	t6,zero,t2
bfc00898:	01126021 	addu	t4,t0,s2
bfc0089c:	000986c2 	srl	s0,t1,0x1b
bfc008a0:	00092940 	sll	a1,t1,0x5
bfc008a4:	01913821 	addu	a3,t4,s1
bfc008a8:	02051825 	or	v1,s0,a1
bfc008ac:	01cf8824 	and	s1,t6,t7
bfc008b0:	01aaf024 	and	s8,t5,t2
bfc008b4:	00e31021 	addu	v0,a3,v1
bfc008b8:	023e2025 	or	a0,s1,s8
bfc008bc:	00442021 	addu	a0,v0,a0
bfc008c0:	000a2882 	srl	a1,t2,0x2
bfc008c4:	000a3f80 	sll	a3,t2,0x1e
bfc008c8:	000466c2 	srl	t4,a0,0x1b
bfc008cc:	00045140 	sll	t2,a0,0x5
bfc008d0:	00093027 	nor	a2,zero,t1
bfc008d4:	018a1825 	or	v1,t4,t2
bfc008d8:	00e56025 	or	t4,a3,a1
bfc008dc:	00cd4024 	and	t0,a2,t5
bfc008e0:	01892824 	and	a1,t4,t1
bfc008e4:	257e0004 	addiu	s8,t3,4
bfc008e8:	00098780 	sll	s0,t1,0x1e
bfc008ec:	00097082 	srl	t6,t1,0x2
bfc008f0:	01a08821 	move	s1,t5
bfc008f4:	00805021 	move	t2,a0
bfc008f8:	17d3ffdd 	bne	s8,s3,bfc00870 <sha_transform+0x2b0>
bfc008fc:	01053025 	or	a2,t0,a1
bfc00900:	27b200a0 	addiu	s2,sp,160
bfc00904:	02533823 	subu	a3,s2,s3
bfc00908:	24f1fffc 	addiu	s1,a3,-4
bfc0090c:	00115082 	srl	t2,s1,0x2
bfc00910:	02605821 	move	t3,s3
bfc00914:	3c1e6ed9 	lui	s8,0x6ed9
bfc00918:	31530001 	andi	s3,t2,0x1
bfc0091c:	01a07021 	move	t6,t5
bfc00920:	00805021 	move	t2,a0
bfc00924:	01e06821 	move	t5,t7
bfc00928:	1260001d 	beqz	s3,bfc009a0 <sha_transform+0x3e0>
bfc0092c:	37d1eba1 	ori	s1,s8,0xeba1
bfc00930:	8fb00050 	lw	s0,80(sp)
bfc00934:	0004f6c2 	srl	s8,a0,0x1b
bfc00938:	02111021 	addu	v0,s0,s1
bfc0093c:	00042140 	sll	a0,a0,0x5
bfc00940:	004f9821 	addu	s3,v0,t7
bfc00944:	03c46825 	or	t5,s8,a0
bfc00948:	01897826 	xor	t7,t4,t1
bfc0094c:	01805821 	move	t3,t4
bfc00950:	026d1821 	addu	v1,s3,t5
bfc00954:	01ee2826 	xor	a1,t7,t6
bfc00958:	00093f80 	sll	a3,t1,0x1e
bfc0095c:	00093082 	srl	a2,t1,0x2
bfc00960:	01c06821 	move	t5,t6
bfc00964:	01404821 	move	t1,t2
bfc00968:	01607021 	move	t6,t3
bfc0096c:	00e66025 	or	t4,a3,a2
bfc00970:	00655021 	addu	t2,v1,a1
bfc00974:	0bf00268 	j	bfc009a0 <sha_transform+0x3e0>
bfc00978:	27ab0054 	addiu	t3,sp,84
bfc0097c:	00000000 	nop
bfc00980:	8d640004 	lw	a0,4(t3)
bfc00984:	020f6025 	or	t4,s0,t7
bfc00988:	0091f021 	addu	s8,a0,s1
bfc0098c:	03ce5021 	addu	t2,s8,t6
bfc00990:	01437021 	addu	t6,t2,v1
bfc00994:	01c55021 	addu	t2,t6,a1
bfc00998:	256b0008 	addiu	t3,t3,8
bfc0099c:	01007021 	move	t6,t0
bfc009a0:	8d650000 	lw	a1,0(t3)
bfc009a4:	000a86c2 	srl	s0,t2,0x1b
bfc009a8:	00b13021 	addu	a2,a1,s1
bfc009ac:	000a7940 	sll	t7,t2,0x5
bfc009b0:	020f9825 	or	s3,s0,t7
bfc009b4:	00cd3821 	addu	a3,a2,t5
bfc009b8:	01896826 	xor	t5,t4,t1
bfc009bc:	00f31021 	addu	v0,a3,s3
bfc009c0:	01ae2026 	xor	a0,t5,t6
bfc009c4:	00442021 	addu	a0,v0,a0
bfc009c8:	00092882 	srl	a1,t1,0x2
bfc009cc:	0009f780 	sll	s8,t1,0x1e
bfc009d0:	00044140 	sll	t0,a0,0x5
bfc009d4:	00041ec2 	srl	v1,a0,0x1b
bfc009d8:	00681825 	or	v1,v1,t0
bfc009dc:	03c54025 	or	t0,s8,a1
bfc009e0:	010a3026 	xor	a2,t0,t2
bfc009e4:	25730004 	addiu	s3,t3,4
bfc009e8:	000a8780 	sll	s0,t2,0x1e
bfc009ec:	000a7882 	srl	t7,t2,0x2
bfc009f0:	01806821 	move	t5,t4
bfc009f4:	00804821 	move	t1,a0
bfc009f8:	1653ffe1 	bne	s2,s3,bfc00980 <sha_transform+0x3c0>
bfc009fc:	00cc2826 	xor	a1,a2,t4
bfc00a00:	3c138f1b 	lui	s3,0x8f1b
bfc00a04:	8fb100a0 	lw	s1,160(sp)
bfc00a08:	00805821 	move	t3,a0
bfc00a0c:	3672bcdc 	ori	s2,s3,0xbcdc
bfc00a10:	01406821 	move	t5,t2
bfc00a14:	01882825 	or	a1,t4,t0
bfc00a18:	02322021 	addu	a0,s1,s2
bfc00a1c:	000b56c2 	srl	t2,t3,0x1b
bfc00a20:	000bf140 	sll	s8,t3,0x5
bfc00a24:	00ad7824 	and	t7,a1,t5
bfc00a28:	01883024 	and	a2,t4,t0
bfc00a2c:	008e1821 	addu	v1,a0,t6
bfc00a30:	015e7025 	or	t6,t2,s8
bfc00a34:	01004821 	move	t1,t0
bfc00a38:	01e63825 	or	a3,t7,a2
bfc00a3c:	000d8780 	sll	s0,t5,0x1e
bfc00a40:	000d1082 	srl	v0,t5,0x2
bfc00a44:	006e8821 	addu	s1,v1,t6
bfc00a48:	01807821 	move	t7,t4
bfc00a4c:	01606821 	move	t5,t3
bfc00a50:	01206021 	move	t4,t1
bfc00a54:	27b300f0 	addiu	s3,sp,240
bfc00a58:	02024025 	or	t0,s0,v0
bfc00a5c:	02275821 	addu	t3,s1,a3
bfc00a60:	0bf002a4 	j	bfc00a90 <sha_transform+0x4d0>
bfc00a64:	27a900a4 	addiu	t1,sp,164
	...
bfc00a70:	8d270004 	lw	a3,4(t1)
bfc00a74:	02304025 	or	t0,s1,s0
bfc00a78:	00f23021 	addu	a2,a3,s2
bfc00a7c:	00cc5821 	addu	t3,a2,t4
bfc00a80:	016e6021 	addu	t4,t3,t6
bfc00a84:	01835821 	addu	t3,t4,v1
bfc00a88:	25290008 	addiu	t1,t1,8
bfc00a8c:	01406021 	move	t4,t2
bfc00a90:	8d240000 	lw	a0,0(t1)
bfc00a94:	01888025 	or	s0,t4,t0
bfc00a98:	0092f021 	addu	s8,a0,s2
bfc00a9c:	000b2ec2 	srl	a1,t3,0x1b
bfc00aa0:	000b8940 	sll	s1,t3,0x5
bfc00aa4:	03cf1021 	addu	v0,s8,t7
bfc00aa8:	00b11825 	or	v1,a1,s1
bfc00aac:	020d7824 	and	t7,s0,t5
bfc00ab0:	01883824 	and	a3,t4,t0
bfc00ab4:	00433021 	addu	a2,v0,v1
bfc00ab8:	01e77025 	or	t6,t7,a3
bfc00abc:	00ce2821 	addu	a1,a2,t6
bfc00ac0:	000d2780 	sll	a0,t5,0x1e
bfc00ac4:	000df082 	srl	s8,t5,0x2
bfc00ac8:	000556c2 	srl	t2,a1,0x1b
bfc00acc:	00056940 	sll	t5,a1,0x5
bfc00ad0:	014d7025 	or	t6,t2,t5
bfc00ad4:	009e5025 	or	t2,a0,s8
bfc00ad8:	010a1825 	or	v1,t0,t2
bfc00adc:	006b1024 	and	v0,v1,t3
bfc00ae0:	010a3024 	and	a2,t0,t2
bfc00ae4:	25270004 	addiu	a3,t1,4
bfc00ae8:	000b8f80 	sll	s1,t3,0x1e
bfc00aec:	000b8082 	srl	s0,t3,0x2
bfc00af0:	01007821 	move	t7,t0
bfc00af4:	00a06821 	move	t5,a1
bfc00af8:	1667ffdd 	bne	s3,a3,bfc00a70 <sha_transform+0x4b0>
bfc00afc:	00461825 	or	v1,v0,a2
bfc00b00:	3c11ca62 	lui	s1,0xca62
bfc00b04:	8fa700f0 	lw	a3,240(sp)
bfc00b08:	3630c1d6 	ori	s0,s1,0xc1d6
bfc00b0c:	0005f6c2 	srl	s8,a1,0x1b
bfc00b10:	00052140 	sll	a0,a1,0x5
bfc00b14:	00f03021 	addu	a2,a3,s0
bfc00b18:	00a04821 	move	t1,a1
bfc00b1c:	00cc1821 	addu	v1,a2,t4
bfc00b20:	014b2826 	xor	a1,t2,t3
bfc00b24:	03c41025 	or	v0,s8,a0
bfc00b28:	01006821 	move	t5,t0
bfc00b2c:	00af9826 	xor	s3,a1,t7
bfc00b30:	00624021 	addu	t0,v1,v0
bfc00b34:	000b7f80 	sll	t7,t3,0x1e
bfc00b38:	01409021 	move	s2,t2
bfc00b3c:	000b7082 	srl	t6,t3,0x2
bfc00b40:	01a06021 	move	t4,t5
bfc00b44:	01205821 	move	t3,t1
bfc00b48:	27b10140 	addiu	s1,sp,320
bfc00b4c:	01134821 	addu	t1,t0,s3
bfc00b50:	01ee5025 	or	t2,t7,t6
bfc00b54:	02406821 	move	t5,s2
bfc00b58:	0bf002e0 	j	bfc00b80 <sha_transform+0x5c0>
bfc00b5c:	27a800f4 	addiu	t0,sp,244
bfc00b60:	8d020004 	lw	v0,4(t0)
bfc00b64:	01ee5025 	or	t2,t7,t6
bfc00b68:	0050f021 	addu	s8,v0,s0
bfc00b6c:	03cd4821 	addu	t1,s8,t5
bfc00b70:	01236821 	addu	t5,t1,v1
bfc00b74:	01a54821 	addu	t1,t5,a1
bfc00b78:	25080008 	addiu	t0,t0,8
bfc00b7c:	00c06821 	move	t5,a2
bfc00b80:	8d130000 	lw	s3,0(t0)
bfc00b84:	000976c2 	srl	t6,t1,0x1b
bfc00b88:	02702021 	addu	a0,s3,s0
bfc00b8c:	00097940 	sll	t7,t1,0x5
bfc00b90:	01cf9025 	or	s2,t6,t7
bfc00b94:	008c3821 	addu	a3,a0,t4
bfc00b98:	014b6026 	xor	t4,t2,t3
bfc00b9c:	00f23021 	addu	a2,a3,s2
bfc00ba0:	018d1826 	xor	v1,t4,t5
bfc00ba4:	000b2882 	srl	a1,t3,0x2
bfc00ba8:	000bf780 	sll	s8,t3,0x1e
bfc00bac:	00c32021 	addu	a0,a2,v1
bfc00bb0:	03c53025 	or	a2,s8,a1
bfc00bb4:	00045ec2 	srl	t3,a0,0x1b
bfc00bb8:	00041140 	sll	v0,a0,0x5
bfc00bbc:	00c99826 	xor	s3,a2,t1
bfc00bc0:	25120004 	addiu	s2,t0,4
bfc00bc4:	01621825 	or	v1,t3,v0
bfc00bc8:	00097f80 	sll	t7,t1,0x1e
bfc00bcc:	00097082 	srl	t6,t1,0x2
bfc00bd0:	01406021 	move	t4,t2
bfc00bd4:	00805821 	move	t3,a0
bfc00bd8:	1632ffe1 	bne	s1,s2,bfc00b60 <sha_transform+0x5a0>
bfc00bdc:	026a2826 	xor	a1,s3,t2
bfc00be0:	02898021 	addu	s0,s4,t1
bfc00be4:	00954021 	addu	t0,a0,s5
bfc00be8:	02e6a021 	addu	s4,s7,a2
bfc00bec:	030aa821 	addu	s5,t8,t2
bfc00bf0:	032dc021 	addu	t8,t9,t5
bfc00bf4:	aed00004 	sw	s0,4(s6)
bfc00bf8:	aed40008 	sw	s4,8(s6)
bfc00bfc:	aed5000c 	sw	s5,12(s6)
bfc00c00:	aed80010 	sw	t8,16(s6)
bfc00c04:	aec80000 	sw	t0,0(s6)
bfc00c08:	8fbe016c 	lw	s8,364(sp)
bfc00c0c:	8fb70168 	lw	s7,360(sp)
bfc00c10:	8fb60164 	lw	s6,356(sp)
bfc00c14:	8fb50160 	lw	s5,352(sp)
bfc00c18:	8fb4015c 	lw	s4,348(sp)
bfc00c1c:	8fb30158 	lw	s3,344(sp)
bfc00c20:	8fb20154 	lw	s2,340(sp)
bfc00c24:	8fb10150 	lw	s1,336(sp)
bfc00c28:	8fb0014c 	lw	s0,332(sp)
bfc00c2c:	03e00008 	jr	ra
bfc00c30:	27bd0170 	addiu	sp,sp,368
	...

bfc00c40 <sha_init>:
sha_init():
bfc00c40:	3c0c6745 	lui	t4,0x6745
bfc00c44:	3c0aefcd 	lui	t2,0xefcd
bfc00c48:	3c0898ba 	lui	t0,0x98ba
bfc00c4c:	3c061032 	lui	a2,0x1032
bfc00c50:	3c03c3d2 	lui	v1,0xc3d2
bfc00c54:	358b2301 	ori	t3,t4,0x2301
bfc00c58:	3549ab89 	ori	t1,t2,0xab89
bfc00c5c:	3507dcfe 	ori	a3,t0,0xdcfe
bfc00c60:	34c55476 	ori	a1,a2,0x5476
bfc00c64:	3462e1f0 	ori	v0,v1,0xe1f0
bfc00c68:	ac8b0000 	sw	t3,0(a0)
bfc00c6c:	ac890004 	sw	t1,4(a0)
bfc00c70:	ac870008 	sw	a3,8(a0)
bfc00c74:	ac85000c 	sw	a1,12(a0)
bfc00c78:	ac820010 	sw	v0,16(a0)
bfc00c7c:	ac800018 	sw	zero,24(a0)
bfc00c80:	03e00008 	jr	ra
bfc00c84:	ac800014 	sw	zero,20(a0)
	...

bfc00c90 <sha_print>:
sha_print():
bfc00c90:	8c850000 	lw	a1,0(a0)
bfc00c94:	8c860004 	lw	a2,4(a0)
bfc00c98:	8c870008 	lw	a3,8(a0)
bfc00c9c:	8c830010 	lw	v1,16(a0)
bfc00ca0:	8c82000c 	lw	v0,12(a0)
bfc00ca4:	3c048000 	lui	a0,0x8000
bfc00ca8:	27bdffe0 	addiu	sp,sp,-32
bfc00cac:	24840080 	addiu	a0,a0,128
bfc00cb0:	afbf001c 	sw	ra,28(sp)
bfc00cb4:	afa20010 	sw	v0,16(sp)
bfc00cb8:	0ff009a0 	jal	bfc02680 <printf>
bfc00cbc:	afa30014 	sw	v1,20(sp)
bfc00cc0:	8fbf001c 	lw	ra,28(sp)
bfc00cc4:	00000000 	nop
bfc00cc8:	03e00008 	jr	ra
bfc00ccc:	27bd0020 	addiu	sp,sp,32

bfc00cd0 <sha_final>:
sha_final():
bfc00cd0:	27bdffd8 	addiu	sp,sp,-40
bfc00cd4:	afb2001c 	sw	s2,28(sp)
bfc00cd8:	8c920014 	lw	s2,20(a0)
bfc00cdc:	afb10018 	sw	s1,24(sp)
bfc00ce0:	001230c2 	srl	a2,s2,0x3
bfc00ce4:	30c5003f 	andi	a1,a2,0x3f
bfc00ce8:	2491001c 	addiu	s1,a0,28
bfc00cec:	24a70001 	addiu	a3,a1,1
bfc00cf0:	afb00014 	sw	s0,20(sp)
bfc00cf4:	02251021 	addu	v0,s1,a1
bfc00cf8:	00808021 	move	s0,a0
bfc00cfc:	2403ff80 	li	v1,-128
bfc00d00:	28e40039 	slti	a0,a3,57
bfc00d04:	afb30020 	sw	s3,32(sp)
bfc00d08:	afbf0024 	sw	ra,36(sp)
bfc00d0c:	8e130018 	lw	s3,24(s0)
bfc00d10:	10800013 	beqz	a0,bfc00d60 <sha_final+0x90>
bfc00d14:	a0430000 	sb	v1,0(v0)
bfc00d18:	24090038 	li	t1,56
bfc00d1c:	02272021 	addu	a0,s1,a3
bfc00d20:	01273023 	subu	a2,t1,a3
bfc00d24:	0ff00b45 	jal	bfc02d14 <memset>
bfc00d28:	00002821 	move	a1,zero
bfc00d2c:	ae130054 	sw	s3,84(s0)
bfc00d30:	ae120058 	sw	s2,88(s0)
bfc00d34:	02002021 	move	a0,s0
bfc00d38:	8fbf0024 	lw	ra,36(sp)
bfc00d3c:	8fb30020 	lw	s3,32(sp)
bfc00d40:	8fb2001c 	lw	s2,28(sp)
bfc00d44:	8fb10018 	lw	s1,24(sp)
bfc00d48:	8fb00014 	lw	s0,20(sp)
bfc00d4c:	0bf00170 	j	bfc005c0 <sha_transform>
bfc00d50:	27bd0028 	addiu	sp,sp,40
	...
bfc00d60:	24080040 	li	t0,64
bfc00d64:	02272021 	addu	a0,s1,a3
bfc00d68:	01073023 	subu	a2,t0,a3
bfc00d6c:	0ff00b45 	jal	bfc02d14 <memset>
bfc00d70:	00002821 	move	a1,zero
bfc00d74:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00d78:	02002021 	move	a0,s0
bfc00d7c:	02202021 	move	a0,s1
bfc00d80:	00002821 	move	a1,zero
bfc00d84:	0ff00b45 	jal	bfc02d14 <memset>
bfc00d88:	24060038 	li	a2,56
bfc00d8c:	ae130054 	sw	s3,84(s0)
bfc00d90:	ae120058 	sw	s2,88(s0)
bfc00d94:	02002021 	move	a0,s0
bfc00d98:	8fbf0024 	lw	ra,36(sp)
bfc00d9c:	8fb30020 	lw	s3,32(sp)
bfc00da0:	8fb2001c 	lw	s2,28(sp)
bfc00da4:	8fb10018 	lw	s1,24(sp)
bfc00da8:	8fb00014 	lw	s0,20(sp)
bfc00dac:	0bf00170 	j	bfc005c0 <sha_transform>
bfc00db0:	27bd0028 	addiu	sp,sp,40
	...

bfc00dc0 <sha_update>:
sha_update():
bfc00dc0:	8c870014 	lw	a3,20(a0)
bfc00dc4:	27bdffc8 	addiu	sp,sp,-56
bfc00dc8:	000618c0 	sll	v1,a2,0x3
bfc00dcc:	afb10018 	sw	s1,24(sp)
bfc00dd0:	00808821 	move	s1,a0
bfc00dd4:	00672021 	addu	a0,v1,a3
bfc00dd8:	0087102b 	sltu	v0,a0,a3
bfc00ddc:	afb40024 	sw	s4,36(sp)
bfc00de0:	afbf0034 	sw	ra,52(sp)
bfc00de4:	afb70030 	sw	s7,48(sp)
bfc00de8:	afb6002c 	sw	s6,44(sp)
bfc00dec:	afb50028 	sw	s5,40(sp)
bfc00df0:	afb30020 	sw	s3,32(sp)
bfc00df4:	afb2001c 	sw	s2,28(sp)
bfc00df8:	afb00014 	sw	s0,20(sp)
bfc00dfc:	14400064 	bnez	v0,bfc00f90 <sha_update+0x1d0>
bfc00e00:	00a0a021 	move	s4,a1
bfc00e04:	8e230018 	lw	v1,24(s1)
bfc00e08:	00065742 	srl	t2,a2,0x1d
bfc00e0c:	006a4821 	addu	t1,v1,t2
bfc00e10:	28c80040 	slti	t0,a2,64
bfc00e14:	ae240014 	sw	a0,20(s1)
bfc00e18:	15000061 	bnez	t0,bfc00fa0 <sha_update+0x1e0>
bfc00e1c:	ae290018 	sw	t1,24(s1)
bfc00e20:	24d7ffc0 	addiu	s7,a2,-64
bfc00e24:	0017b182 	srl	s6,s7,0x6
bfc00e28:	26c60001 	addiu	a2,s6,1
bfc00e2c:	00065980 	sll	t3,a2,0x6
bfc00e30:	2564ffc0 	addiu	a0,t3,-64
bfc00e34:	2632001c 	addiu	s2,s1,28
bfc00e38:	00046182 	srl	t4,a0,0x6
bfc00e3c:	02802821 	move	a1,s4
bfc00e40:	02402021 	move	a0,s2
bfc00e44:	24060040 	li	a2,64
bfc00e48:	028ba821 	addu	s5,s4,t3
bfc00e4c:	31930003 	andi	s3,t4,0x3
bfc00e50:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00e54:	26900040 	addiu	s0,s4,64
bfc00e58:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00e5c:	02202021 	move	a0,s1
bfc00e60:	12150039 	beq	s0,s5,bfc00f48 <sha_update+0x188>
bfc00e64:	00166980 	sll	t5,s6,0x6
bfc00e68:	1260001b 	beqz	s3,bfc00ed8 <sha_update+0x118>
bfc00e6c:	240e0001 	li	t6,1
bfc00e70:	126e0010 	beq	s3,t6,bfc00eb4 <sha_update+0xf4>
bfc00e74:	240f0002 	li	t7,2
bfc00e78:	126f0008 	beq	s3,t7,bfc00e9c <sha_update+0xdc>
bfc00e7c:	02002821 	move	a1,s0
bfc00e80:	24060040 	li	a2,64
bfc00e84:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00e88:	02402021 	move	a0,s2
bfc00e8c:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00e90:	02202021 	move	a0,s1
bfc00e94:	26900080 	addiu	s0,s4,128
bfc00e98:	02002821 	move	a1,s0
bfc00e9c:	24060040 	li	a2,64
bfc00ea0:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00ea4:	02402021 	move	a0,s2
bfc00ea8:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00eac:	02202021 	move	a0,s1
bfc00eb0:	26100040 	addiu	s0,s0,64
bfc00eb4:	02002821 	move	a1,s0
bfc00eb8:	02402021 	move	a0,s2
bfc00ebc:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00ec0:	24060040 	li	a2,64
bfc00ec4:	26100040 	addiu	s0,s0,64
bfc00ec8:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00ecc:	02202021 	move	a0,s1
bfc00ed0:	1215001d 	beq	s0,s5,bfc00f48 <sha_update+0x188>
bfc00ed4:	00166980 	sll	t5,s6,0x6
bfc00ed8:	02002821 	move	a1,s0
bfc00edc:	24060040 	li	a2,64
bfc00ee0:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00ee4:	02402021 	move	a0,s2
bfc00ee8:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00eec:	02202021 	move	a0,s1
bfc00ef0:	26050040 	addiu	a1,s0,64
bfc00ef4:	24060040 	li	a2,64
bfc00ef8:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00efc:	02402021 	move	a0,s2
bfc00f00:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00f04:	02202021 	move	a0,s1
bfc00f08:	26050080 	addiu	a1,s0,128
bfc00f0c:	24060040 	li	a2,64
bfc00f10:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00f14:	02402021 	move	a0,s2
bfc00f18:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00f1c:	02202021 	move	a0,s1
bfc00f20:	02402021 	move	a0,s2
bfc00f24:	260500c0 	addiu	a1,s0,192
bfc00f28:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc00f2c:	24060040 	li	a2,64
bfc00f30:	26100100 	addiu	s0,s0,256
bfc00f34:	0ff00170 	jal	bfc005c0 <sha_transform>
bfc00f38:	02202021 	move	a0,s1
bfc00f3c:	1615ffe7 	bne	s0,s5,bfc00edc <sha_update+0x11c>
bfc00f40:	02002821 	move	a1,s0
bfc00f44:	00166980 	sll	t5,s6,0x6
bfc00f48:	02ed3023 	subu	a2,s7,t5
bfc00f4c:	0200a021 	move	s4,s0
bfc00f50:	02402021 	move	a0,s2
bfc00f54:	02802821 	move	a1,s4
bfc00f58:	8fbf0034 	lw	ra,52(sp)
bfc00f5c:	8fb70030 	lw	s7,48(sp)
bfc00f60:	8fb6002c 	lw	s6,44(sp)
bfc00f64:	8fb50028 	lw	s5,40(sp)
bfc00f68:	8fb40024 	lw	s4,36(sp)
bfc00f6c:	8fb30020 	lw	s3,32(sp)
bfc00f70:	8fb2001c 	lw	s2,28(sp)
bfc00f74:	8fb10018 	lw	s1,24(sp)
bfc00f78:	8fb00014 	lw	s0,20(sp)
bfc00f7c:	0bf00b50 	j	bfc02d40 <memcpy>
bfc00f80:	27bd0038 	addiu	sp,sp,56
	...
bfc00f90:	8e250018 	lw	a1,24(s1)
bfc00f94:	0bf00382 	j	bfc00e08 <sha_update+0x48>
bfc00f98:	24a30001 	addiu	v1,a1,1
bfc00f9c:	00000000 	nop
bfc00fa0:	0bf003d4 	j	bfc00f50 <sha_update+0x190>
bfc00fa4:	2632001c 	addiu	s2,s1,28
	...

bfc00fb0 <sha_stream>:
sha_stream():
bfc00fb0:	27bdfc50 	addiu	sp,sp,-944
bfc00fb4:	afb703a4 	sw	s7,932(sp)
bfc00fb8:	0080b821 	move	s7,a0
bfc00fbc:	afb40398 	sw	s4,920(sp)
bfc00fc0:	8ca40000 	lw	a0,0(a1)
bfc00fc4:	26f4001c 	addiu	s4,s7,28
bfc00fc8:	afbf03ac 	sw	ra,940(sp)
bfc00fcc:	afbe03a8 	sw	s8,936(sp)
bfc00fd0:	afb30394 	sw	s3,916(sp)
bfc00fd4:	afb20390 	sw	s2,912(sp)
bfc00fd8:	afb1038c 	sw	s1,908(sp)
bfc00fdc:	afb00388 	sw	s0,904(sp)
bfc00fe0:	afa503b4 	sw	a1,948(sp)
bfc00fe4:	afb603a0 	sw	s6,928(sp)
bfc00fe8:	afb5039c 	sw	s5,924(sp)
bfc00fec:	0ff00ab4 	jal	bfc02ad0 <strlen>
bfc00ff0:	afb40360 	sw	s4,864(sp)
bfc00ff4:	3c138000 	lui	s3,0x8000
bfc00ff8:	266400a0 	addiu	a0,s3,160
bfc00ffc:	0ff009a0 	jal	bfc02680 <printf>
bfc01000:	00402821 	move	a1,v0
bfc01004:	3c10efcd 	lui	s0,0xefcd
bfc01008:	3c0e98ba 	lui	t6,0x98ba
bfc0100c:	3c0c1032 	lui	t4,0x1032
bfc01010:	3c0ac3d2 	lui	t2,0xc3d2
bfc01014:	27a700b0 	addiu	a3,sp,176
bfc01018:	3c126745 	lui	s2,0x6745
bfc0101c:	360fab89 	ori	t7,s0,0xab89
bfc01020:	36512301 	ori	s1,s2,0x2301
bfc01024:	35cddcfe 	ori	t5,t6,0xdcfe
bfc01028:	358b5476 	ori	t3,t4,0x5476
bfc0102c:	3549e1f0 	ori	t1,t2,0xe1f0
bfc01030:	27a40018 	addiu	a0,sp,24
bfc01034:	27a50114 	addiu	a1,sp,276
bfc01038:	27a60060 	addiu	a2,sp,96
bfc0103c:	afa7037c 	sw	a3,892(sp)
bfc01040:	8fa703b4 	lw	a3,948(sp)
bfc01044:	aef10000 	sw	s1,0(s7)
bfc01048:	3c025a82 	lui	v0,0x5a82
bfc0104c:	27a30150 	addiu	v1,sp,336
bfc01050:	afa40374 	sw	a0,884(sp)
bfc01054:	afa50370 	sw	a1,880(sp)
bfc01058:	afa60378 	sw	a2,888(sp)
bfc0105c:	27a80100 	addiu	t0,sp,256
bfc01060:	aeef0004 	sw	t7,4(s7)
bfc01064:	aeed0008 	sw	t5,8(s7)
bfc01068:	aeeb000c 	sw	t3,12(s7)
bfc0106c:	aee90010 	sw	t1,16(s7)
bfc01070:	aee00014 	sw	zero,20(s7)
bfc01074:	aee00018 	sw	zero,24(s7)
bfc01078:	27a40150 	addiu	a0,sp,336
bfc0107c:	24050001 	li	a1,1
bfc01080:	24060200 	li	a2,512
bfc01084:	345e7999 	ori	s8,v0,0x7999
bfc01088:	afa30384 	sw	v1,900(sp)
bfc0108c:	0ff0096d 	jal	bfc025b4 <fread>
bfc01090:	afa80380 	sw	t0,896(sp)
bfc01094:	00408021 	move	s0,v0
bfc01098:	184001bc 	blez	v0,bfc0178c <sha_stream+0x7dc>
bfc0109c:	00408821 	move	s1,v0
bfc010a0:	3c198000 	lui	t9,0x8000
bfc010a4:	27240a10 	addiu	a0,t9,2576
bfc010a8:	0ff009a0 	jal	bfc02680 <printf>
bfc010ac:	02002821 	move	a1,s0
bfc010b0:	8ef60014 	lw	s6,20(s7)
bfc010b4:	0010c0c0 	sll	t8,s0,0x3
bfc010b8:	03162021 	addu	a0,t8,s6
bfc010bc:	0096a82b 	sltu	s5,a0,s6
bfc010c0:	16a00346 	bnez	s5,bfc01ddc <sha_stream+0xe2c>
bfc010c4:	00103742 	srl	a2,s0,0x1d
bfc010c8:	8ee30018 	lw	v1,24(s7)
bfc010cc:	00000000 	nop
bfc010d0:	00663821 	addu	a3,v1,a2
bfc010d4:	2a080040 	slti	t0,s0,64
bfc010d8:	aee40014 	sw	a0,20(s7)
bfc010dc:	15000347 	bnez	t0,bfc01dfc <sha_stream+0xe4c>
bfc010e0:	aee70018 	sw	a3,24(s7)
bfc010e4:	260affc0 	addiu	t2,s0,-64
bfc010e8:	000a4982 	srl	t1,t2,0x6
bfc010ec:	25220001 	addiu	v0,t1,1
bfc010f0:	00021980 	sll	v1,v0,0x6
bfc010f4:	27a50150 	addiu	a1,sp,336
bfc010f8:	afaa035c 	sw	t2,860(sp)
bfc010fc:	afa90364 	sw	t1,868(sp)
bfc01100:	afa30368 	sw	v1,872(sp)
bfc01104:	afa50358 	sw	a1,856(sp)
bfc01108:	8fa40360 	lw	a0,864(sp)
bfc0110c:	8fa50358 	lw	a1,856(sp)
bfc01110:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc01114:	24060040 	li	a2,64
bfc01118:	8eef0024 	lw	t7,36(s7)
bfc0111c:	8ef00020 	lw	s0,32(s7)
bfc01120:	8ef10028 	lw	s1,40(s7)
bfc01124:	8ef3003c 	lw	s3,60(s7)
bfc01128:	8eeb001c 	lw	t3,28(s7)
bfc0112c:	8ef50040 	lw	s5,64(s7)
bfc01130:	8fa70370 	lw	a3,880(sp)
bfc01134:	8fa80374 	lw	t0,884(sp)
bfc01138:	8ef2002c 	lw	s2,44(s7)
bfc0113c:	8ef40044 	lw	s4,68(s7)
bfc01140:	02304826 	xor	t1,s1,s0
bfc01144:	01f33026 	xor	a2,t7,s3
bfc01148:	8eec0050 	lw	t4,80(s7)
bfc0114c:	8eed0054 	lw	t5,84(s7)
bfc01150:	8eee0058 	lw	t6,88(s7)
bfc01154:	8eea004c 	lw	t2,76(s7)
bfc01158:	00e8b023 	subu	s6,a3,t0
bfc0115c:	00cb1026 	xor	v0,a2,t3
bfc01160:	8ee70034 	lw	a3,52(s7)
bfc01164:	8ee60030 	lw	a2,48(s7)
bfc01168:	8ee80038 	lw	t0,56(s7)
bfc0116c:	0135c826 	xor	t9,t1,s5
bfc01170:	8ee90048 	lw	t1,72(s7)
bfc01174:	02542826 	xor	a1,s2,s4
bfc01178:	00af2026 	xor	a0,a1,t7
bfc0117c:	26d8fff4 	addiu	t8,s6,-12
bfc01180:	afab0010 	sw	t3,16(sp)
bfc01184:	27a30018 	addiu	v1,sp,24
bfc01188:	afa60024 	sw	a2,36(sp)
bfc0118c:	afa70028 	sw	a3,40(sp)
bfc01190:	afa8002c 	sw	t0,44(sp)
bfc01194:	afa9003c 	sw	t1,60(sp)
bfc01198:	afaa0040 	sw	t2,64(sp)
bfc0119c:	afb00014 	sw	s0,20(sp)
bfc011a0:	afaf0018 	sw	t7,24(sp)
bfc011a4:	afb1001c 	sw	s1,28(sp)
bfc011a8:	afb20020 	sw	s2,32(sp)
bfc011ac:	afb30030 	sw	s3,48(sp)
bfc011b0:	afb50034 	sw	s5,52(sp)
bfc011b4:	afb40038 	sw	s4,56(sp)
bfc011b8:	afac0044 	sw	t4,68(sp)
bfc011bc:	afad0048 	sw	t5,72(sp)
bfc011c0:	afae004c 	sw	t6,76(sp)
bfc011c4:	8fab0370 	lw	t3,880(sp)
bfc011c8:	01b9f826 	xor	ra,t5,t9
bfc011cc:	0182b026 	xor	s6,t4,v0
bfc011d0:	01c4c826 	xor	t9,t6,a0
bfc011d4:	00182082 	srl	a0,t8,0x2
bfc011d8:	2478000c 	addiu	t8,v1,12
bfc011dc:	afb60050 	sw	s6,80(sp)
bfc011e0:	30850001 	andi	a1,a0,0x1
bfc011e4:	afbf0054 	sw	ra,84(sp)
bfc011e8:	130b0047 	beq	t8,t3,bfc01308 <sha_stream+0x358>
bfc011ec:	afb90058 	sw	t9,88(sp)
bfc011f0:	10a00019 	beqz	a1,bfc01258 <sha_stream+0x2a8>
bfc011f4:	27b40018 	addiu	s4,sp,24
bfc011f8:	8fae0024 	lw	t6,36(sp)
bfc011fc:	8f030018 	lw	v1,24(t8)
bfc01200:	8f040004 	lw	a0,4(t8)
bfc01204:	8f06fffc 	lw	a2,-4(t8)
bfc01208:	8f110008 	lw	s1,8(t8)
bfc0120c:	8f100020 	lw	s0,32(t8)
bfc01210:	8f09fff8 	lw	t1,-8(t8)
bfc01214:	8f0f001c 	lw	t7,28(t8)
bfc01218:	00865826 	xor	t3,a0,a2
bfc0121c:	02305026 	xor	t2,s1,s0
bfc01220:	01c34026 	xor	t0,t6,v1
bfc01224:	01096826 	xor	t5,t0,t1
bfc01228:	016f9826 	xor	s3,t3,t7
bfc0122c:	014ea826 	xor	s5,t2,t6
bfc01230:	02cdb026 	xor	s6,s6,t5
bfc01234:	03f3f826 	xor	ra,ra,s3
bfc01238:	0335c826 	xor	t9,t9,s5
bfc0123c:	8fac0370 	lw	t4,880(sp)
bfc01240:	af190040 	sw	t9,64(t8)
bfc01244:	af160038 	sw	s6,56(t8)
bfc01248:	af1f003c 	sw	ra,60(t8)
bfc0124c:	26980018 	addiu	t8,s4,24
bfc01250:	130c002d 	beq	t8,t4,bfc01308 <sha_stream+0x358>
bfc01254:	00000000 	nop
bfc01258:	8f090000 	lw	t1,0(t8)
bfc0125c:	8f120018 	lw	s2,24(t8)
bfc01260:	8f0d0004 	lw	t5,4(t8)
bfc01264:	8f10fffc 	lw	s0,-4(t8)
bfc01268:	8f110008 	lw	s1,8(t8)
bfc0126c:	8f0f0020 	lw	t7,32(t8)
bfc01270:	8f13fff8 	lw	s3,-8(t8)
bfc01274:	8f0c001c 	lw	t4,28(t8)
bfc01278:	01b0a026 	xor	s4,t5,s0
bfc0127c:	022f7026 	xor	t6,s1,t7
bfc01280:	0132a826 	xor	s5,t1,s2
bfc01284:	02b33826 	xor	a3,s5,s3
bfc01288:	028c4026 	xor	t0,s4,t4
bfc0128c:	01c93026 	xor	a2,t6,t1
bfc01290:	02c78826 	xor	s1,s6,a3
bfc01294:	03e89026 	xor	s2,ra,t0
bfc01298:	0326a826 	xor	s5,t9,a2
bfc0129c:	af110038 	sw	s1,56(t8)
bfc012a0:	af12003c 	sw	s2,60(t8)
bfc012a4:	af150040 	sw	s5,64(t8)
bfc012a8:	2714000c 	addiu	s4,t8,12
bfc012ac:	8f0d000c 	lw	t5,12(t8)
bfc012b0:	8e960020 	lw	s6,32(s4)
bfc012b4:	8e820018 	lw	v0,24(s4)
bfc012b8:	8e850004 	lw	a1,4(s4)
bfc012bc:	8e8afffc 	lw	t2,-4(s4)
bfc012c0:	8e830008 	lw	v1,8(s4)
bfc012c4:	8e99001c 	lw	t9,28(s4)
bfc012c8:	8e8bfff8 	lw	t3,-8(s4)
bfc012cc:	00767826 	xor	t7,v1,s6
bfc012d0:	00aa8026 	xor	s0,a1,t2
bfc012d4:	01a22026 	xor	a0,t5,v0
bfc012d8:	008bf826 	xor	ra,a0,t3
bfc012dc:	02199826 	xor	s3,s0,t9
bfc012e0:	01ed6026 	xor	t4,t7,t5
bfc012e4:	8fae0370 	lw	t6,880(sp)
bfc012e8:	023fb026 	xor	s6,s1,ra
bfc012ec:	02acc826 	xor	t9,s5,t4
bfc012f0:	0253f826 	xor	ra,s2,s3
bfc012f4:	27180018 	addiu	t8,t8,24
bfc012f8:	ae990040 	sw	t9,64(s4)
bfc012fc:	ae960038 	sw	s6,56(s4)
bfc01300:	170effd5 	bne	t8,t6,bfc01258 <sha_stream+0x2a8>
bfc01304:	ae9f003c 	sw	ra,60(s4)
bfc01308:	8fb2010c 	lw	s2,268(sp)
bfc0130c:	8fb10140 	lw	s1,320(sp)
bfc01310:	8fb30114 	lw	s3,276(sp)
bfc01314:	0251a826 	xor	s5,s2,s1
bfc01318:	8fb4012c 	lw	s4,300(sp)
bfc0131c:	02b3b026 	xor	s6,s5,s3
bfc01320:	02d4c026 	xor	t8,s6,s4
bfc01324:	afb8014c 	sw	t8,332(sp)
bfc01328:	8ef30004 	lw	s3,4(s7)
bfc0132c:	8ef40000 	lw	s4,0(s7)
bfc01330:	8fac0010 	lw	t4,16(sp)
bfc01334:	8ef50008 	lw	s5,8(s7)
bfc01338:	8ef6000c 	lw	s6,12(s7)
bfc0133c:	8ef80010 	lw	t8,16(s7)
bfc01340:	019e1821 	addu	v1,t4,s8
bfc01344:	001476c2 	srl	t6,s4,0x1b
bfc01348:	00144940 	sll	t1,s4,0x5
bfc0134c:	00133827 	nor	a3,zero,s3
bfc01350:	01c95025 	or	t2,t6,t1
bfc01354:	00785821 	addu	t3,v1,t8
bfc01358:	00f63024 	and	a2,a3,s6
bfc0135c:	02b34024 	and	t0,s5,s3
bfc01360:	00c82825 	or	a1,a2,t0
bfc01364:	016a1021 	addu	v0,t3,t2
bfc01368:	00132082 	srl	a0,s3,0x2
bfc0136c:	0013cf80 	sll	t9,s3,0x1e
bfc01370:	27bf0010 	addiu	ra,sp,16
bfc01374:	00455821 	addu	t3,v0,a1
bfc01378:	03247025 	or	t6,t9,a0
bfc0137c:	27ec0004 	addiu	t4,ra,4
bfc01380:	02804821 	move	t1,s4
bfc01384:	02c09021 	move	s2,s6
bfc01388:	0bf004ec 	j	bfc013b0 <sha_stream+0x400>
bfc0138c:	02a07821 	move	t7,s5
bfc01390:	8d850004 	lw	a1,4(t4)
bfc01394:	02307025 	or	t6,s1,s0
bfc01398:	00be1021 	addu	v0,a1,s8
bfc0139c:	004f5821 	addu	t3,v0,t7
bfc013a0:	01637821 	addu	t7,t3,v1
bfc013a4:	01e65821 	addu	t3,t7,a2
bfc013a8:	258c0008 	addiu	t4,t4,8
bfc013ac:	01a07821 	move	t7,t5
bfc013b0:	8d870000 	lw	a3,0(t4)
bfc013b4:	00098027 	nor	s0,zero,t1
bfc013b8:	00fe4021 	addu	t0,a3,s8
bfc013bc:	000b8ec2 	srl	s1,t3,0x1b
bfc013c0:	000b2140 	sll	a0,t3,0x5
bfc013c4:	01125021 	addu	t2,t0,s2
bfc013c8:	020ff824 	and	ra,s0,t7
bfc013cc:	02249025 	or	s2,s1,a0
bfc013d0:	01c9c824 	and	t9,t6,t1
bfc013d4:	03f92825 	or	a1,ra,t9
bfc013d8:	01521821 	addu	v1,t2,s2
bfc013dc:	00655021 	addu	t2,v1,a1
bfc013e0:	00093f80 	sll	a3,t1,0x1e
bfc013e4:	00094082 	srl	t0,t1,0x2
bfc013e8:	000a6ec2 	srl	t5,t2,0x1b
bfc013ec:	000a1140 	sll	v0,t2,0x5
bfc013f0:	000b3027 	nor	a2,zero,t3
bfc013f4:	01a21825 	or	v1,t5,v0
bfc013f8:	8fbf0378 	lw	ra,888(sp)
bfc013fc:	00e86825 	or	t5,a3,t0
bfc01400:	00ce3024 	and	a2,a2,t6
bfc01404:	01ab2024 	and	a0,t5,t3
bfc01408:	25990004 	addiu	t9,t4,4
bfc0140c:	000b8f80 	sll	s1,t3,0x1e
bfc01410:	000b8082 	srl	s0,t3,0x2
bfc01414:	01c09021 	move	s2,t6
bfc01418:	01404821 	move	t1,t2
bfc0141c:	17f9ffdc 	bne	ra,t9,bfc01390 <sha_stream+0x3e0>
bfc01420:	00c43025 	or	a2,a2,a0
bfc01424:	8fa50060 	lw	a1,96(sp)
bfc01428:	3c076ed9 	lui	a3,0x6ed9
bfc0142c:	34f2eba1 	ori	s2,a3,0xeba1
bfc01430:	000a8ec2 	srl	s1,t2,0x1b
bfc01434:	000a8140 	sll	s0,t2,0x5
bfc01438:	00b21021 	addu	v0,a1,s2
bfc0143c:	01ab2026 	xor	a0,t5,t3
bfc01440:	004ff821 	addu	ra,v0,t7
bfc01444:	02301825 	or	v1,s1,s0
bfc01448:	000b4082 	srl	t0,t3,0x2
bfc0144c:	008e3026 	xor	a2,a0,t6
bfc01450:	000b4f80 	sll	t1,t3,0x1e
bfc01454:	03e3c821 	addu	t9,ra,v1
bfc01458:	01c07821 	move	t7,t6
bfc0145c:	01405821 	move	t3,t2
bfc01460:	01a07021 	move	t6,t5
bfc01464:	03265021 	addu	t2,t9,a2
bfc01468:	01286825 	or	t5,t1,t0
bfc0146c:	0bf0052a 	j	bfc014a8 <sha_stream+0x4f8>
bfc01470:	25880008 	addiu	t0,t4,8
	...
bfc01480:	8d020004 	lw	v0,4(t0)
bfc01484:	3c056ed9 	lui	a1,0x6ed9
bfc01488:	34a9eba1 	ori	t1,a1,0xeba1
bfc0148c:	00493021 	addu	a2,v0,t1
bfc01490:	00ce5021 	addu	t2,a2,t6
bfc01494:	01437021 	addu	t6,t2,v1
bfc01498:	01c45021 	addu	t2,t6,a0
bfc0149c:	02306825 	or	t5,s1,s0
bfc014a0:	25080008 	addiu	t0,t0,8
bfc014a4:	01807021 	move	t6,t4
bfc014a8:	8d1f0000 	lw	ra,0(t0)
bfc014ac:	3c076ed9 	lui	a3,0x6ed9
bfc014b0:	34f9eba1 	ori	t9,a3,0xeba1
bfc014b4:	03f99021 	addu	s2,ra,t9
bfc014b8:	000a86c2 	srl	s0,t2,0x1b
bfc014bc:	000a8940 	sll	s1,t2,0x5
bfc014c0:	024f2821 	addu	a1,s2,t7
bfc014c4:	01ab4826 	xor	t1,t5,t3
bfc014c8:	02117825 	or	t7,s0,s1
bfc014cc:	00af1021 	addu	v0,a1,t7
bfc014d0:	012e1826 	xor	v1,t1,t6
bfc014d4:	00434821 	addu	t1,v0,v1
bfc014d8:	000b3780 	sll	a2,t3,0x1e
bfc014dc:	000b3882 	srl	a3,t3,0x2
bfc014e0:	000966c2 	srl	t4,t1,0x1b
bfc014e4:	00092140 	sll	a0,t1,0x5
bfc014e8:	01841825 	or	v1,t4,a0
bfc014ec:	8fb2037c 	lw	s2,892(sp)
bfc014f0:	00c76025 	or	t4,a2,a3
bfc014f4:	018ac826 	xor	t9,t4,t2
bfc014f8:	251f0004 	addiu	ra,t0,4
bfc014fc:	000a8f80 	sll	s1,t2,0x1e
bfc01500:	000a8082 	srl	s0,t2,0x2
bfc01504:	01a07821 	move	t7,t5
bfc01508:	01205821 	move	t3,t1
bfc0150c:	165fffdc 	bne	s2,ra,bfc01480 <sha_stream+0x4d0>
bfc01510:	032d2026 	xor	a0,t9,t5
bfc01514:	3c0f8f1b 	lui	t7,0x8f1b
bfc01518:	8fa700b0 	lw	a3,176(sp)
bfc0151c:	35ebbcdc 	ori	t3,t7,0xbcdc
bfc01520:	01ac8825 	or	s1,t5,t4
bfc01524:	00eb9021 	addu	s2,a3,t3
bfc01528:	000986c2 	srl	s0,t1,0x1b
bfc0152c:	00092940 	sll	a1,t1,0x5
bfc01530:	01ac1024 	and	v0,t5,t4
bfc01534:	024e1821 	addu	v1,s2,t6
bfc01538:	022af824 	and	ra,s1,t2
bfc0153c:	02052025 	or	a0,s0,a1
bfc01540:	000a7f80 	sll	t7,t2,0x1e
bfc01544:	000a5882 	srl	t3,t2,0x2
bfc01548:	03e23025 	or	a2,ra,v0
bfc0154c:	0064c821 	addu	t9,v1,a0
bfc01550:	01a07021 	move	t6,t5
bfc01554:	01205021 	move	t2,t1
bfc01558:	01806821 	move	t5,t4
bfc0155c:	03264821 	addu	t1,t9,a2
bfc01560:	01eb6025 	or	t4,t7,t3
bfc01564:	0bf00566 	j	bfc01598 <sha_stream+0x5e8>
bfc01568:	250f0008 	addiu	t7,t0,8
bfc0156c:	00000000 	nop
bfc01570:	8de80004 	lw	t0,4(t7)
bfc01574:	02306025 	or	t4,s1,s0
bfc01578:	3c108f1b 	lui	s0,0x8f1b
bfc0157c:	3612bcdc 	ori	s2,s0,0xbcdc
bfc01580:	01121021 	addu	v0,t0,s2
bfc01584:	004d4821 	addu	t1,v0,t5
bfc01588:	01256821 	addu	t5,t1,a1
bfc0158c:	01a34821 	addu	t1,t5,v1
bfc01590:	25ef0008 	addiu	t7,t7,8
bfc01594:	01606821 	move	t5,t3
bfc01598:	8df90000 	lw	t9,0(t7)
bfc0159c:	3c068f1b 	lui	a2,0x8f1b
bfc015a0:	34c7bcdc 	ori	a3,a2,0xbcdc
bfc015a4:	0327f821 	addu	ra,t9,a3
bfc015a8:	01ac8025 	or	s0,t5,t4
bfc015ac:	00098ec2 	srl	s1,t1,0x1b
bfc015b0:	00092140 	sll	a0,t1,0x5
bfc015b4:	03ee4021 	addu	t0,ra,t6
bfc015b8:	020a9024 	and	s2,s0,t2
bfc015bc:	02247025 	or	t6,s1,a0
bfc015c0:	01ac1824 	and	v1,t5,t4
bfc015c4:	02432825 	or	a1,s2,v1
bfc015c8:	010e1021 	addu	v0,t0,t6
bfc015cc:	00454021 	addu	t0,v0,a1
bfc015d0:	000a3780 	sll	a2,t2,0x1e
bfc015d4:	000a3882 	srl	a3,t2,0x2
bfc015d8:	00085940 	sll	t3,t0,0x5
bfc015dc:	000856c2 	srl	t2,t0,0x1b
bfc015e0:	014b2825 	or	a1,t2,t3
bfc015e4:	00c75825 	or	t3,a2,a3
bfc015e8:	018bc825 	or	t9,t4,t3
bfc015ec:	8fa40380 	lw	a0,896(sp)
bfc015f0:	0329f824 	and	ra,t9,t1
bfc015f4:	018b1824 	and	v1,t4,t3
bfc015f8:	25f20004 	addiu	s2,t7,4
bfc015fc:	00098f80 	sll	s1,t1,0x1e
bfc01600:	00098082 	srl	s0,t1,0x2
bfc01604:	01807021 	move	t6,t4
bfc01608:	01005021 	move	t2,t0
bfc0160c:	1492ffd8 	bne	a0,s2,bfc01570 <sha_stream+0x5c0>
bfc01610:	03e31825 	or	v1,ra,v1
bfc01614:	8fb20100 	lw	s2,256(sp)
bfc01618:	3c07ca62 	lui	a3,0xca62
bfc0161c:	34eec1d6 	ori	t6,a3,0xc1d6
bfc01620:	000886c2 	srl	s0,t0,0x1b
bfc01624:	024e5021 	addu	t2,s2,t6
bfc01628:	00082940 	sll	a1,t0,0x5
bfc0162c:	014df821 	addu	ra,t2,t5
bfc01630:	01692026 	xor	a0,t3,t1
bfc01634:	02058825 	or	s1,s0,a1
bfc01638:	008c1826 	xor	v1,a0,t4
bfc0163c:	00093780 	sll	a2,t1,0x1e
bfc01640:	0009c882 	srl	t9,t1,0x2
bfc01644:	03f11021 	addu	v0,ra,s1
bfc01648:	01806821 	move	t5,t4
bfc0164c:	01004821 	move	t1,t0
bfc01650:	01606021 	move	t4,t3
bfc01654:	00434021 	addu	t0,v0,v1
bfc01658:	00d95825 	or	t3,a2,t9
bfc0165c:	0bf005a6 	j	bfc01698 <sha_stream+0x6e8>
bfc01660:	25ea0008 	addiu	t2,t7,8
	...
bfc01670:	8d520004 	lw	s2,4(t2)
bfc01674:	3c10ca62 	lui	s0,0xca62
bfc01678:	3604c1d6 	ori	a0,s0,0xc1d6
bfc0167c:	02441021 	addu	v0,s2,a0
bfc01680:	004c4021 	addu	t0,v0,t4
bfc01684:	01036021 	addu	t4,t0,v1
bfc01688:	01854021 	addu	t0,t4,a1
bfc0168c:	01ee5825 	or	t3,t7,t6
bfc01690:	254a0008 	addiu	t2,t2,8
bfc01694:	00c06021 	move	t4,a2
bfc01698:	8d5f0000 	lw	ra,0(t2)
bfc0169c:	3c07ca62 	lui	a3,0xca62
bfc016a0:	34f9c1d6 	ori	t9,a3,0xc1d6
bfc016a4:	03f98821 	addu	s1,ra,t9
bfc016a8:	00087ec2 	srl	t7,t0,0x1b
bfc016ac:	00087140 	sll	t6,t0,0x5
bfc016b0:	022d9021 	addu	s2,s1,t5
bfc016b4:	01ee8025 	or	s0,t7,t6
bfc016b8:	01696826 	xor	t5,t3,t1
bfc016bc:	01ac2026 	xor	a0,t5,t4
bfc016c0:	02501021 	addu	v0,s2,s0
bfc016c4:	00442021 	addu	a0,v0,a0
bfc016c8:	00092882 	srl	a1,t1,0x2
bfc016cc:	00093f80 	sll	a3,t1,0x1e
bfc016d0:	00043140 	sll	a2,a0,0x5
bfc016d4:	00041ec2 	srl	v1,a0,0x1b
bfc016d8:	00661825 	or	v1,v1,a2
bfc016dc:	8fb10384 	lw	s1,900(sp)
bfc016e0:	00e53025 	or	a2,a3,a1
bfc016e4:	00c8c826 	xor	t9,a2,t0
bfc016e8:	255f0004 	addiu	ra,t2,4
bfc016ec:	00087f80 	sll	t7,t0,0x1e
bfc016f0:	00087082 	srl	t6,t0,0x2
bfc016f4:	01606821 	move	t5,t3
bfc016f8:	00804821 	move	t1,a0
bfc016fc:	163fffdc 	bne	s1,ra,bfc01670 <sha_stream+0x6c0>
bfc01700:	032b2826 	xor	a1,t9,t3
bfc01704:	02685021 	addu	t2,s3,t0
bfc01708:	02a69821 	addu	s3,s5,a2
bfc0170c:	8fa60358 	lw	a2,856(sp)
bfc01710:	02cba821 	addu	s5,s6,t3
bfc01714:	24c30040 	addiu	v1,a2,64
bfc01718:	afa30358 	sw	v1,856(sp)
bfc0171c:	8fab0368 	lw	t3,872(sp)
bfc01720:	27a90150 	addiu	t1,sp,336
bfc01724:	8fb60358 	lw	s6,856(sp)
bfc01728:	00942821 	addu	a1,a0,s4
bfc0172c:	030ca021 	addu	s4,t8,t4
bfc01730:	012bc021 	addu	t8,t1,t3
bfc01734:	aee50000 	sw	a1,0(s7)
bfc01738:	aeea0004 	sw	t2,4(s7)
bfc0173c:	aef30008 	sw	s3,8(s7)
bfc01740:	aef5000c 	sw	s5,12(s7)
bfc01744:	16d8fe70 	bne	s6,t8,bfc01108 <sha_stream+0x158>
bfc01748:	aef40010 	sw	s4,16(s7)
bfc0174c:	8fae0364 	lw	t6,868(sp)
bfc01750:	8faf035c 	lw	t7,860(sp)
bfc01754:	000e6980 	sll	t5,t6,0x6
bfc01758:	8fa50358 	lw	a1,856(sp)
bfc0175c:	01ed8823 	subu	s1,t7,t5
bfc01760:	8fa40360 	lw	a0,864(sp)
bfc01764:	0ff00b50 	jal	bfc02d40 <memcpy>
bfc01768:	02203021 	move	a2,s1
bfc0176c:	8fa703b4 	lw	a3,948(sp)
bfc01770:	27a40150 	addiu	a0,sp,336
bfc01774:	24050001 	li	a1,1
bfc01778:	0ff0096d 	jal	bfc025b4 <fread>
bfc0177c:	24060200 	li	a2,512
bfc01780:	00408021 	move	s0,v0
bfc01784:	1c40fe46 	bgtz	v0,bfc010a0 <sha_stream+0xf0>
bfc01788:	00408821 	move	s1,v0
bfc0178c:	8ee20014 	lw	v0,20(s7)
bfc01790:	8fac0360 	lw	t4,864(sp)
bfc01794:	000240c2 	srl	t0,v0,0x3
bfc01798:	3107003f 	andi	a3,t0,0x3f
bfc0179c:	8ef90018 	lw	t9,24(s7)
bfc017a0:	24e50001 	addiu	a1,a3,1
bfc017a4:	01878821 	addu	s1,t4,a3
bfc017a8:	241fff80 	li	ra,-128
bfc017ac:	28be0039 	slti	s8,a1,57
bfc017b0:	afa20354 	sw	v0,852(sp)
bfc017b4:	afb90350 	sw	t9,848(sp)
bfc017b8:	13c00194 	beqz	s8,bfc01e0c <sha_stream+0xe5c>
bfc017bc:	a23f0000 	sb	ra,0(s1)
bfc017c0:	8fb90360 	lw	t9,864(sp)
bfc017c4:	24180038 	li	t8,56
bfc017c8:	03053023 	subu	a2,t8,a1
bfc017cc:	03252021 	addu	a0,t9,a1
bfc017d0:	0ff00b45 	jal	bfc02d14 <memset>
bfc017d4:	00002821 	move	a1,zero
bfc017d8:	8fbe0370 	lw	s8,880(sp)
bfc017dc:	8fbf0374 	lw	ra,884(sp)
bfc017e0:	8eeb0024 	lw	t3,36(s7)
bfc017e4:	8eec0020 	lw	t4,32(s7)
bfc017e8:	8eed002c 	lw	t5,44(s7)
bfc017ec:	8eee003c 	lw	t6,60(s7)
bfc017f0:	8eef0040 	lw	t7,64(s7)
bfc017f4:	8ef0001c 	lw	s0,28(s7)
bfc017f8:	8ef10028 	lw	s1,40(s7)
bfc017fc:	8ef20044 	lw	s2,68(s7)
bfc01800:	8ef30050 	lw	s3,80(s7)
bfc01804:	8ee60030 	lw	a2,48(s7)
bfc01808:	8ee70034 	lw	a3,52(s7)
bfc0180c:	8ee80038 	lw	t0,56(s7)
bfc01810:	8ef90048 	lw	t9,72(s7)
bfc01814:	8eea004c 	lw	t2,76(s7)
bfc01818:	03dfb023 	subu	s6,s8,ra
bfc0181c:	8fbf0350 	lw	ra,848(sp)
bfc01820:	8fbe0354 	lw	s8,852(sp)
bfc01824:	01ec4826 	xor	t1,t7,t4
bfc01828:	01aba826 	xor	s5,t5,t3
bfc0182c:	016e2826 	xor	a1,t3,t6
bfc01830:	0131c026 	xor	t8,t1,s1
bfc01834:	26d4fff4 	addiu	s4,s6,-12
bfc01838:	afa60024 	sw	a2,36(sp)
bfc0183c:	afa70028 	sw	a3,40(sp)
bfc01840:	afa8002c 	sw	t0,44(sp)
bfc01844:	afb9003c 	sw	t9,60(sp)
bfc01848:	afaa0040 	sw	t2,64(sp)
bfc0184c:	00b01026 	xor	v0,a1,s0
bfc01850:	aeff0054 	sw	ra,84(s7)
bfc01854:	aefe0058 	sw	s8,88(s7)
bfc01858:	02b22026 	xor	a0,s5,s2
bfc0185c:	27a30018 	addiu	v1,sp,24
bfc01860:	afb00010 	sw	s0,16(sp)
bfc01864:	afac0014 	sw	t4,20(sp)
bfc01868:	afab0018 	sw	t3,24(sp)
bfc0186c:	afb1001c 	sw	s1,28(sp)
bfc01870:	afad0020 	sw	t5,32(sp)
bfc01874:	afae0030 	sw	t6,48(sp)
bfc01878:	afaf0034 	sw	t7,52(sp)
bfc0187c:	afb20038 	sw	s2,56(sp)
bfc01880:	afb30044 	sw	s3,68(sp)
bfc01884:	8fa90370 	lw	t1,880(sp)
bfc01888:	03f8b026 	xor	s6,ra,t8
bfc0188c:	00142882 	srl	a1,s4,0x2
bfc01890:	0262a826 	xor	s5,s3,v0
bfc01894:	03c4c026 	xor	t8,s8,a0
bfc01898:	2474000c 	addiu	s4,v1,12
bfc0189c:	afbf0048 	sw	ra,72(sp)
bfc018a0:	afbe004c 	sw	s8,76(sp)
bfc018a4:	afb50050 	sw	s5,80(sp)
bfc018a8:	30a50001 	andi	a1,a1,0x1
bfc018ac:	afb60054 	sw	s6,84(sp)
bfc018b0:	12890047 	beq	s4,t1,bfc019d0 <sha_stream+0xa20>
bfc018b4:	afb80058 	sw	t8,88(sp)
bfc018b8:	10a00019 	beqz	a1,bfc01920 <sha_stream+0x970>
bfc018bc:	27a90018 	addiu	t1,sp,24
bfc018c0:	8fa20024 	lw	v0,36(sp)
bfc018c4:	8e860018 	lw	a2,24(s4)
bfc018c8:	8e84001c 	lw	a0,28(s4)
bfc018cc:	8e8cfffc 	lw	t4,-4(s4)
bfc018d0:	8e830008 	lw	v1,8(s4)
bfc018d4:	8e87fff8 	lw	a3,-8(s4)
bfc018d8:	8e8e0004 	lw	t6,4(s4)
bfc018dc:	8e920020 	lw	s2,32(s4)
bfc018e0:	008c6826 	xor	t5,a0,t4
bfc018e4:	00625026 	xor	t2,v1,v0
bfc018e8:	00467826 	xor	t7,v0,a2
bfc018ec:	01e7f026 	xor	s8,t7,a3
bfc018f0:	01ae2826 	xor	a1,t5,t6
bfc018f4:	01525826 	xor	t3,t2,s2
bfc018f8:	02bea826 	xor	s5,s5,s8
bfc018fc:	02c5b026 	xor	s6,s6,a1
bfc01900:	030bc026 	xor	t8,t8,t3
bfc01904:	8fb90370 	lw	t9,880(sp)
bfc01908:	ae980040 	sw	t8,64(s4)
bfc0190c:	ae950038 	sw	s5,56(s4)
bfc01910:	ae96003c 	sw	s6,60(s4)
bfc01914:	25340018 	addiu	s4,t1,24
bfc01918:	1299002d 	beq	s4,t9,bfc019d0 <sha_stream+0xa20>
bfc0191c:	00000000 	nop
bfc01920:	8e8b0000 	lw	t3,0(s4)
bfc01924:	8e900018 	lw	s0,24(s4)
bfc01928:	8e99001c 	lw	t9,28(s4)
bfc0192c:	8e84fffc 	lw	a0,-4(s4)
bfc01930:	8e8a0008 	lw	t2,8(s4)
bfc01934:	8e91fff8 	lw	s1,-8(s4)
bfc01938:	8e8f0004 	lw	t7,4(s4)
bfc0193c:	8e930020 	lw	s3,32(s4)
bfc01940:	03249026 	xor	s2,t9,a0
bfc01944:	01707026 	xor	t6,t3,s0
bfc01948:	014bf826 	xor	ra,t2,t3
bfc0194c:	01d12826 	xor	a1,t6,s1
bfc01950:	024f4026 	xor	t0,s2,t7
bfc01954:	03f33026 	xor	a2,ra,s3
bfc01958:	02a5c826 	xor	t9,s5,a1
bfc0195c:	02c88026 	xor	s0,s6,t0
bfc01960:	03068826 	xor	s1,t8,a2
bfc01964:	ae990038 	sw	t9,56(s4)
bfc01968:	ae90003c 	sw	s0,60(s4)
bfc0196c:	ae910040 	sw	s1,64(s4)
bfc01970:	268f000c 	addiu	t7,s4,12
bfc01974:	8e82000c 	lw	v0,12(s4)
bfc01978:	8df60018 	lw	s6,24(t7)
bfc0197c:	8df50008 	lw	s5,8(t7)
bfc01980:	8dfe001c 	lw	s8,28(t7)
bfc01984:	8de9fffc 	lw	t1,-4(t7)
bfc01988:	8df8fff8 	lw	t8,-8(t7)
bfc0198c:	8dec0004 	lw	t4,4(t7)
bfc01990:	8ded0020 	lw	t5,32(t7)
bfc01994:	02a22026 	xor	a0,s5,v0
bfc01998:	00561826 	xor	v1,v0,s6
bfc0199c:	03c93826 	xor	a3,s8,t1
bfc019a0:	00785026 	xor	t2,v1,t8
bfc019a4:	00ec5826 	xor	t3,a3,t4
bfc019a8:	008d7026 	xor	t6,a0,t5
bfc019ac:	8fb20370 	lw	s2,880(sp)
bfc019b0:	032aa826 	xor	s5,t9,t2
bfc019b4:	020bb026 	xor	s6,s0,t3
bfc019b8:	022ec026 	xor	t8,s1,t6
bfc019bc:	26940018 	addiu	s4,s4,24
bfc019c0:	adf80040 	sw	t8,64(t7)
bfc019c4:	adf50038 	sw	s5,56(t7)
bfc019c8:	1692ffd5 	bne	s4,s2,bfc01920 <sha_stream+0x970>
bfc019cc:	adf6003c 	sw	s6,60(t7)
bfc019d0:	8fab010c 	lw	t3,268(sp)
bfc019d4:	8fb10114 	lw	s1,276(sp)
bfc019d8:	8fae012c 	lw	t6,300(sp)
bfc019dc:	022b9826 	xor	s3,s1,t3
bfc019e0:	8fb50140 	lw	s5,320(sp)
bfc019e4:	026eb026 	xor	s6,s3,t6
bfc019e8:	02d5a026 	xor	s4,s6,s5
bfc019ec:	afb4014c 	sw	s4,332(sp)
bfc019f0:	8ef50004 	lw	s5,4(s7)
bfc019f4:	8ef30000 	lw	s3,0(s7)
bfc019f8:	3c185a82 	lui	t8,0x5a82
bfc019fc:	8faf0010 	lw	t7,16(sp)
bfc01a00:	37147999 	ori	s4,t8,0x7999
bfc01a04:	8ef60008 	lw	s6,8(s7)
bfc01a08:	8ef8000c 	lw	t8,12(s7)
bfc01a0c:	8ef90010 	lw	t9,16(s7)
bfc01a10:	01f44021 	addu	t0,t7,s4
bfc01a14:	00139140 	sll	s2,s3,0x5
bfc01a18:	00152827 	nor	a1,zero,s5
bfc01a1c:	0013fec2 	srl	ra,s3,0x1b
bfc01a20:	03f24825 	or	t1,ra,s2
bfc01a24:	00b83024 	and	a2,a1,t8
bfc01a28:	01191021 	addu	v0,t0,t9
bfc01a2c:	02d51824 	and	v1,s6,s5
bfc01a30:	00496021 	addu	t4,v0,t1
bfc01a34:	00c3f025 	or	s8,a2,v1
bfc01a38:	00153882 	srl	a3,s5,0x2
bfc01a3c:	00156f80 	sll	t5,s5,0x1e
bfc01a40:	019e4821 	addu	t1,t4,s8
bfc01a44:	01a77825 	or	t7,t5,a3
bfc01a48:	27ac0014 	addiu	t4,sp,20
bfc01a4c:	02605021 	move	t2,s3
bfc01a50:	03009021 	move	s2,t8
bfc01a54:	0bf0069f 	j	bfc01a7c <sha_stream+0xacc>
bfc01a58:	02c07021 	move	t6,s6
bfc01a5c:	8d820004 	lw	v0,4(t4)
bfc01a60:	02307825 	or	t7,s1,s0
bfc01a64:	00542821 	addu	a1,v0,s4
bfc01a68:	00ae4821 	addu	t1,a1,t6
bfc01a6c:	01237021 	addu	t6,t1,v1
bfc01a70:	01c64821 	addu	t1,t6,a2
bfc01a74:	258c0008 	addiu	t4,t4,8
bfc01a78:	01a07021 	move	t6,t5
bfc01a7c:	8d880000 	lw	t0,0(t4)
bfc01a80:	000a8027 	nor	s0,zero,t2
bfc01a84:	01143821 	addu	a3,t0,s4
bfc01a88:	00098ec2 	srl	s1,t1,0x1b
bfc01a8c:	0009f140 	sll	s8,t1,0x5
bfc01a90:	00f25821 	addu	t3,a3,s2
bfc01a94:	020e2024 	and	a0,s0,t6
bfc01a98:	023e9025 	or	s2,s1,s8
bfc01a9c:	01ea1824 	and	v1,t7,t2
bfc01aa0:	0083f825 	or	ra,a0,v1
bfc01aa4:	01721021 	addu	v0,t3,s2
bfc01aa8:	005f5821 	addu	t3,v0,ra
bfc01aac:	000a2f80 	sll	a1,t2,0x1e
bfc01ab0:	000a4082 	srl	t0,t2,0x2
bfc01ab4:	000b6940 	sll	t5,t3,0x5
bfc01ab8:	000b56c2 	srl	t2,t3,0x1b
bfc01abc:	014d1825 	or	v1,t2,t5
bfc01ac0:	00093027 	nor	a2,zero,t1
bfc01ac4:	00a86825 	or	t5,a1,t0
bfc01ac8:	8fa40378 	lw	a0,888(sp)
bfc01acc:	00cf3024 	and	a2,a2,t7
bfc01ad0:	01a93824 	and	a3,t5,t1
bfc01ad4:	259e0004 	addiu	s8,t4,4
bfc01ad8:	00098f80 	sll	s1,t1,0x1e
bfc01adc:	00098082 	srl	s0,t1,0x2
bfc01ae0:	01e09021 	move	s2,t7
bfc01ae4:	01605021 	move	t2,t3
bfc01ae8:	149effdc 	bne	a0,s8,bfc01a5c <sha_stream+0xaac>
bfc01aec:	00c73025 	or	a2,a2,a3
bfc01af0:	3c086ed9 	lui	t0,0x6ed9
bfc01af4:	8fa60060 	lw	a2,96(sp)
bfc01af8:	3512eba1 	ori	s2,t0,0xeba1
bfc01afc:	000b8ec2 	srl	s1,t3,0x1b
bfc01b00:	000bf140 	sll	s8,t3,0x5
bfc01b04:	00d23821 	addu	a3,a2,s2
bfc01b08:	01a92026 	xor	a0,t5,t1
bfc01b0c:	00ee8021 	addu	s0,a3,t6
bfc01b10:	023e1825 	or	v1,s1,s8
bfc01b14:	008ff826 	xor	ra,a0,t7
bfc01b18:	0009a780 	sll	s4,t1,0x1e
bfc01b1c:	00096082 	srl	t4,t1,0x2
bfc01b20:	02035021 	addu	t2,s0,v1
bfc01b24:	01e07021 	move	t6,t7
bfc01b28:	01604821 	move	t1,t3
bfc01b2c:	01a07821 	move	t7,t5
bfc01b30:	015f5821 	addu	t3,t2,ra
bfc01b34:	028c6825 	or	t5,s4,t4
bfc01b38:	0bf006d8 	j	bfc01b60 <sha_stream+0xbb0>
bfc01b3c:	27a80064 	addiu	t0,sp,100
bfc01b40:	8d020004 	lw	v0,4(t0)
bfc01b44:	02306825 	or	t5,s1,s0
bfc01b48:	0052a021 	addu	s4,v0,s2
bfc01b4c:	028f5821 	addu	t3,s4,t7
bfc01b50:	01637821 	addu	t7,t3,v1
bfc01b54:	01e45821 	addu	t3,t7,a0
bfc01b58:	25080008 	addiu	t0,t0,8
bfc01b5c:	01807821 	move	t7,t4
bfc01b60:	8d050000 	lw	a1,0(t0)
bfc01b64:	000b86c2 	srl	s0,t3,0x1b
bfc01b68:	00b23021 	addu	a2,a1,s2
bfc01b6c:	000b8940 	sll	s1,t3,0x5
bfc01b70:	02111825 	or	v1,s0,s1
bfc01b74:	00ce5021 	addu	t2,a2,t6
bfc01b78:	01a97026 	xor	t6,t5,t1
bfc01b7c:	01cf2026 	xor	a0,t6,t7
bfc01b80:	01433821 	addu	a3,t2,v1
bfc01b84:	00e45021 	addu	t2,a3,a0
bfc01b88:	0009ff80 	sll	ra,t1,0x1e
bfc01b8c:	0009f082 	srl	s8,t1,0x2
bfc01b90:	000a6140 	sll	t4,t2,0x5
bfc01b94:	000a4ec2 	srl	t1,t2,0x1b
bfc01b98:	012c1825 	or	v1,t1,t4
bfc01b9c:	8fa5037c 	lw	a1,892(sp)
bfc01ba0:	03fe6025 	or	t4,ra,s8
bfc01ba4:	018b1026 	xor	v0,t4,t3
bfc01ba8:	25140004 	addiu	s4,t0,4
bfc01bac:	000b8f80 	sll	s1,t3,0x1e
bfc01bb0:	000b8082 	srl	s0,t3,0x2
bfc01bb4:	01a07021 	move	t6,t5
bfc01bb8:	01404821 	move	t1,t2
bfc01bbc:	14b4ffe0 	bne	a1,s4,bfc01b40 <sha_stream+0xb90>
bfc01bc0:	004d2026 	xor	a0,v0,t5
bfc01bc4:	3c028f1b 	lui	v0,0x8f1b
bfc01bc8:	8fb400b0 	lw	s4,176(sp)
bfc01bcc:	3451bcdc 	ori	s1,v0,0xbcdc
bfc01bd0:	01ac3025 	or	a2,t5,t4
bfc01bd4:	000a26c2 	srl	a0,t2,0x1b
bfc01bd8:	000a2940 	sll	a1,t2,0x5
bfc01bdc:	02911821 	addu	v1,s4,s1
bfc01be0:	00cb7024 	and	t6,a2,t3
bfc01be4:	01ac8024 	and	s0,t5,t4
bfc01be8:	006f4821 	addu	t1,v1,t7
bfc01bec:	00853825 	or	a3,a0,a1
bfc01bf0:	01d0f025 	or	s8,t6,s0
bfc01bf4:	000b4780 	sll	t0,t3,0x1e
bfc01bf8:	000b9082 	srl	s2,t3,0x2
bfc01bfc:	0127f821 	addu	ra,t1,a3
bfc01c00:	01a07821 	move	t7,t5
bfc01c04:	01405821 	move	t3,t2
bfc01c08:	01806821 	move	t5,t4
bfc01c0c:	03fe5021 	addu	t2,ra,s8
bfc01c10:	01126025 	or	t4,t0,s2
bfc01c14:	0bf0070f 	j	bfc01c3c <sha_stream+0xc8c>
bfc01c18:	27ae00b4 	addiu	t6,sp,180
bfc01c1c:	8ddf0004 	lw	ra,4(t6)
bfc01c20:	02506025 	or	t4,s2,s0
bfc01c24:	03f1a021 	addu	s4,ra,s1
bfc01c28:	028d5021 	addu	t2,s4,t5
bfc01c2c:	01456821 	addu	t5,t2,a1
bfc01c30:	01a35021 	addu	t2,t5,v1
bfc01c34:	25ce0008 	addiu	t6,t6,8
bfc01c38:	01206821 	move	t5,t1
bfc01c3c:	8dc40000 	lw	a0,0(t6)
bfc01c40:	01ac9025 	or	s2,t5,t4
bfc01c44:	00911021 	addu	v0,a0,s1
bfc01c48:	000a86c2 	srl	s0,t2,0x1b
bfc01c4c:	000a3140 	sll	a2,t2,0x5
bfc01c50:	024bf024 	and	s8,s2,t3
bfc01c54:	004f4021 	addu	t0,v0,t7
bfc01c58:	01ac3824 	and	a3,t5,t4
bfc01c5c:	02067825 	or	t7,s0,a2
bfc01c60:	03c72825 	or	a1,s8,a3
bfc01c64:	010f1821 	addu	v1,t0,t7
bfc01c68:	00654021 	addu	t0,v1,a1
bfc01c6c:	000bff80 	sll	ra,t3,0x1e
bfc01c70:	000ba082 	srl	s4,t3,0x2
bfc01c74:	00084ec2 	srl	t1,t0,0x1b
bfc01c78:	00085940 	sll	t3,t0,0x5
bfc01c7c:	012b2825 	or	a1,t1,t3
bfc01c80:	03f44825 	or	t1,ra,s4
bfc01c84:	01892025 	or	a0,t4,t1
bfc01c88:	8fbf0380 	lw	ra,896(sp)
bfc01c8c:	008a3024 	and	a2,a0,t2
bfc01c90:	01893824 	and	a3,t4,t1
bfc01c94:	25de0004 	addiu	s8,t6,4
bfc01c98:	000a9780 	sll	s2,t2,0x1e
bfc01c9c:	000a8082 	srl	s0,t2,0x2
bfc01ca0:	01807821 	move	t7,t4
bfc01ca4:	01005821 	move	t3,t0
bfc01ca8:	17feffdc 	bne	ra,s8,bfc01c1c <sha_stream+0xc6c>
bfc01cac:	00c71825 	or	v1,a2,a3
bfc01cb0:	3c04ca62 	lui	a0,0xca62
bfc01cb4:	8fa20100 	lw	v0,256(sp)
bfc01cb8:	3490c1d6 	ori	s0,a0,0xc1d6
bfc01cbc:	00083ec2 	srl	a3,t0,0x1b
bfc01cc0:	00089140 	sll	s2,t0,0x5
bfc01cc4:	00503021 	addu	a2,v0,s0
bfc01cc8:	012a2826 	xor	a1,t1,t2
bfc01ccc:	00cd7821 	addu	t7,a2,t5
bfc01cd0:	00f2f025 	or	s8,a3,s2
bfc01cd4:	01fe5821 	addu	t3,t7,s8
bfc01cd8:	00ac1826 	xor	v1,a1,t4
bfc01cdc:	000a7780 	sll	t6,t2,0x1e
bfc01ce0:	000a8882 	srl	s1,t2,0x2
bfc01ce4:	01806821 	move	t5,t4
bfc01ce8:	01005021 	move	t2,t0
bfc01cec:	01206021 	move	t4,t1
bfc01cf0:	01634021 	addu	t0,t3,v1
bfc01cf4:	01d14825 	or	t1,t6,s1
bfc01cf8:	0bf00748 	j	bfc01d20 <sha_stream+0xd70>
bfc01cfc:	27ab0104 	addiu	t3,sp,260
bfc01d00:	8d710004 	lw	s1,4(t3)
bfc01d04:	01ee4825 	or	t1,t7,t6
bfc01d08:	0230f821 	addu	ra,s1,s0
bfc01d0c:	03ec4021 	addu	t0,ra,t4
bfc01d10:	01036021 	addu	t4,t0,v1
bfc01d14:	01864021 	addu	t0,t4,a2
bfc01d18:	256b0008 	addiu	t3,t3,8
bfc01d1c:	00a06021 	move	t4,a1
bfc01d20:	8d640000 	lw	a0,0(t3)
bfc01d24:	000876c2 	srl	t6,t0,0x1b
bfc01d28:	00901021 	addu	v0,a0,s0
bfc01d2c:	00087940 	sll	t7,t0,0x5
bfc01d30:	01cfa025 	or	s4,t6,t7
bfc01d34:	004d3021 	addu	a2,v0,t5
bfc01d38:	012a6826 	xor	t5,t1,t2
bfc01d3c:	00d49021 	addu	s2,a2,s4
bfc01d40:	01ac1826 	xor	v1,t5,t4
bfc01d44:	000a2f80 	sll	a1,t2,0x1e
bfc01d48:	000af082 	srl	s8,t2,0x2
bfc01d4c:	02432021 	addu	a0,s2,v1
bfc01d50:	00be2825 	or	a1,a1,s8
bfc01d54:	8fb40384 	lw	s4,900(sp)
bfc01d58:	000456c2 	srl	t2,a0,0x1b
bfc01d5c:	00043940 	sll	a3,a0,0x5
bfc01d60:	00a88826 	xor	s1,a1,t0
bfc01d64:	257f0004 	addiu	ra,t3,4
bfc01d68:	01471825 	or	v1,t2,a3
bfc01d6c:	00087f80 	sll	t7,t0,0x1e
bfc01d70:	00087082 	srl	t6,t0,0x2
bfc01d74:	01206821 	move	t5,t1
bfc01d78:	00805021 	move	t2,a0
bfc01d7c:	169fffe0 	bne	s4,ra,bfc01d00 <sha_stream+0xd50>
bfc01d80:	02293026 	xor	a2,s1,t1
bfc01d84:	8fbf03ac 	lw	ra,940(sp)
bfc01d88:	00938021 	addu	s0,a0,s3
bfc01d8c:	02a89821 	addu	s3,s5,t0
bfc01d90:	02c5a821 	addu	s5,s6,a1
bfc01d94:	0309b021 	addu	s6,t8,t1
bfc01d98:	032cc021 	addu	t8,t9,t4
bfc01d9c:	aef00000 	sw	s0,0(s7)
bfc01da0:	aef30004 	sw	s3,4(s7)
bfc01da4:	aef50008 	sw	s5,8(s7)
bfc01da8:	aef6000c 	sw	s6,12(s7)
bfc01dac:	aef80010 	sw	t8,16(s7)
bfc01db0:	8fbe03a8 	lw	s8,936(sp)
bfc01db4:	8fb703a4 	lw	s7,932(sp)
bfc01db8:	8fb603a0 	lw	s6,928(sp)
bfc01dbc:	8fb5039c 	lw	s5,924(sp)
bfc01dc0:	8fb40398 	lw	s4,920(sp)
bfc01dc4:	8fb30394 	lw	s3,916(sp)
bfc01dc8:	8fb20390 	lw	s2,912(sp)
bfc01dcc:	8fb1038c 	lw	s1,908(sp)
bfc01dd0:	8fb00388 	lw	s0,904(sp)
bfc01dd4:	03e00008 	jr	ra
bfc01dd8:	27bd03b0 	addiu	sp,sp,944
bfc01ddc:	8eff0018 	lw	ra,24(s7)
bfc01de0:	00000000 	nop
bfc01de4:	27e30001 	addiu	v1,ra,1
bfc01de8:	00663821 	addu	a3,v1,a2
bfc01dec:	2a080040 	slti	t0,s0,64
bfc01df0:	aee40014 	sw	a0,20(s7)
bfc01df4:	1100fcbb 	beqz	t0,bfc010e4 <sha_stream+0x134>
bfc01df8:	aee70018 	sw	a3,24(s7)
bfc01dfc:	27a40150 	addiu	a0,sp,336
bfc01e00:	afa40358 	sw	a0,856(sp)
bfc01e04:	0bf005d8 	j	bfc01760 <sha_stream+0x7b0>
bfc01e08:	00802821 	move	a1,a0
bfc01e0c:	8fbf0360 	lw	ra,864(sp)
bfc01e10:	24150040 	li	s5,64
bfc01e14:	02a53023 	subu	a2,s5,a1
bfc01e18:	03e52021 	addu	a0,ra,a1
bfc01e1c:	0ff00b45 	jal	bfc02d14 <memset>
bfc01e20:	00002821 	move	a1,zero
bfc01e24:	8eeb0024 	lw	t3,36(s7)
bfc01e28:	8eec0028 	lw	t4,40(s7)
bfc01e2c:	8eed002c 	lw	t5,44(s7)
bfc01e30:	8eee003c 	lw	t6,60(s7)
bfc01e34:	8eef0040 	lw	t7,64(s7)
bfc01e38:	8ef00044 	lw	s0,68(s7)
bfc01e3c:	8fa90370 	lw	t1,880(sp)
bfc01e40:	8fa80374 	lw	t0,884(sp)
bfc01e44:	8ef20020 	lw	s2,32(s7)
bfc01e48:	8ef1001c 	lw	s1,28(s7)
bfc01e4c:	8ef30050 	lw	s3,80(s7)
bfc01e50:	8ef40054 	lw	s4,84(s7)
bfc01e54:	8ef50058 	lw	s5,88(s7)
bfc01e58:	8ee50030 	lw	a1,48(s7)
bfc01e5c:	8ee70034 	lw	a3,52(s7)
bfc01e60:	8eea004c 	lw	t2,76(s7)
bfc01e64:	0128c023 	subu	t8,t1,t0
bfc01e68:	01b03026 	xor	a2,t5,s0
bfc01e6c:	8ee80038 	lw	t0,56(s7)
bfc01e70:	8ee90048 	lw	t1,72(s7)
bfc01e74:	016e2026 	xor	a0,t3,t6
bfc01e78:	018f1026 	xor	v0,t4,t7
bfc01e7c:	0091c826 	xor	t9,a0,s1
bfc01e80:	0052f026 	xor	s8,v0,s2
bfc01e84:	00cb1826 	xor	v1,a2,t3
bfc01e88:	2716fff4 	addiu	s6,t8,-12
bfc01e8c:	afb20014 	sw	s2,20(sp)
bfc01e90:	0279c026 	xor	t8,s3,t9
bfc01e94:	afa50024 	sw	a1,36(sp)
bfc01e98:	029ec826 	xor	t9,s4,s8
bfc01e9c:	afa70028 	sw	a3,40(sp)
bfc01ea0:	02a3f026 	xor	s8,s5,v1
bfc01ea4:	afa8002c 	sw	t0,44(sp)
bfc01ea8:	27a30018 	addiu	v1,sp,24
bfc01eac:	afa9003c 	sw	t1,60(sp)
bfc01eb0:	afaa0040 	sw	t2,64(sp)
bfc01eb4:	afb10010 	sw	s1,16(sp)
bfc01eb8:	afab0018 	sw	t3,24(sp)
bfc01ebc:	afac001c 	sw	t4,28(sp)
bfc01ec0:	afad0020 	sw	t5,32(sp)
bfc01ec4:	afae0030 	sw	t6,48(sp)
bfc01ec8:	afaf0034 	sw	t7,52(sp)
bfc01ecc:	afb00038 	sw	s0,56(sp)
bfc01ed0:	afb30044 	sw	s3,68(sp)
bfc01ed4:	afb40048 	sw	s4,72(sp)
bfc01ed8:	afb5004c 	sw	s5,76(sp)
bfc01edc:	8fb20370 	lw	s2,880(sp)
bfc01ee0:	00162082 	srl	a0,s6,0x2
bfc01ee4:	2476000c 	addiu	s6,v1,12
bfc01ee8:	afb80050 	sw	t8,80(sp)
bfc01eec:	30860001 	andi	a2,a0,0x1
bfc01ef0:	afb90054 	sw	t9,84(sp)
bfc01ef4:	12d20047 	beq	s6,s2,bfc02014 <sha_stream+0x1064>
bfc01ef8:	afbe0058 	sw	s8,88(sp)
bfc01efc:	10c00019 	beqz	a2,bfc01f64 <sha_stream+0xfb4>
bfc01f00:	27a80018 	addiu	t0,sp,24
bfc01f04:	8fb00024 	lw	s0,36(sp)
bfc01f08:	8ed20018 	lw	s2,24(s6)
bfc01f0c:	8ecf0004 	lw	t7,4(s6)
bfc01f10:	8ec7001c 	lw	a3,28(s6)
bfc01f14:	8ecd0008 	lw	t5,8(s6)
bfc01f18:	8ece0020 	lw	t6,32(s6)
bfc01f1c:	8ecafff8 	lw	t2,-8(s6)
bfc01f20:	8ecbfffc 	lw	t3,-4(s6)
bfc01f24:	01e74826 	xor	t1,t7,a3
bfc01f28:	01ae9826 	xor	s3,t5,t6
bfc01f2c:	02122826 	xor	a1,s0,s2
bfc01f30:	00aaa826 	xor	s5,a1,t2
bfc01f34:	012b8826 	xor	s1,t1,t3
bfc01f38:	0270f826 	xor	ra,s3,s0
bfc01f3c:	0315c026 	xor	t8,t8,s5
bfc01f40:	0331c826 	xor	t9,t9,s1
bfc01f44:	03dff026 	xor	s8,s8,ra
bfc01f48:	8fb40370 	lw	s4,880(sp)
bfc01f4c:	aede0040 	sw	s8,64(s6)
bfc01f50:	aed80038 	sw	t8,56(s6)
bfc01f54:	aed9003c 	sw	t9,60(s6)
bfc01f58:	25160018 	addiu	s6,t0,24
bfc01f5c:	12d4002d 	beq	s6,s4,bfc02014 <sha_stream+0x1064>
bfc01f60:	00000000 	nop
bfc01f64:	8ec90000 	lw	t1,0(s6)
bfc01f68:	8ece0018 	lw	t6,24(s6)
bfc01f6c:	8ec70004 	lw	a3,4(s6)
bfc01f70:	8ec3001c 	lw	v1,28(s6)
bfc01f74:	8ed20008 	lw	s2,8(s6)
bfc01f78:	8ed10020 	lw	s1,32(s6)
bfc01f7c:	8ecffff8 	lw	t7,-8(s6)
bfc01f80:	8ed3fffc 	lw	s3,-4(s6)
bfc01f84:	00e3a026 	xor	s4,a3,v1
bfc01f88:	0251a826 	xor	s5,s2,s1
bfc01f8c:	012e8026 	xor	s0,t1,t6
bfc01f90:	020ff826 	xor	ra,s0,t7
bfc01f94:	02934026 	xor	t0,s4,s3
bfc01f98:	02a92026 	xor	a0,s5,t1
bfc01f9c:	031f3826 	xor	a3,t8,ra
bfc01fa0:	03289026 	xor	s2,t9,t0
bfc01fa4:	03c47826 	xor	t7,s8,a0
bfc01fa8:	aec70038 	sw	a3,56(s6)
bfc01fac:	aed2003c 	sw	s2,60(s6)
bfc01fb0:	aecf0040 	sw	t7,64(s6)
bfc01fb4:	26d3000c 	addiu	s3,s6,12
bfc01fb8:	8ecd000c 	lw	t5,12(s6)
bfc01fbc:	8e790018 	lw	t9,24(s3)
bfc01fc0:	8e780008 	lw	t8,8(s3)
bfc01fc4:	8e660004 	lw	a2,4(s3)
bfc01fc8:	8e62001c 	lw	v0,28(s3)
bfc01fcc:	8e6a0020 	lw	t2,32(s3)
bfc01fd0:	8e6bfff8 	lw	t3,-8(s3)
bfc01fd4:	8e6cfffc 	lw	t4,-4(s3)
bfc01fd8:	00c2f026 	xor	s8,a2,v0
bfc01fdc:	030a1826 	xor	v1,t8,t2
bfc01fe0:	01b92826 	xor	a1,t5,t9
bfc01fe4:	03cc7026 	xor	t6,s8,t4
bfc01fe8:	00ab8826 	xor	s1,a1,t3
bfc01fec:	006d8026 	xor	s0,v1,t5
bfc01ff0:	8fb40370 	lw	s4,880(sp)
bfc01ff4:	00f1c026 	xor	t8,a3,s1
bfc01ff8:	024ec826 	xor	t9,s2,t6
bfc01ffc:	01f0f026 	xor	s8,t7,s0
bfc02000:	26d60018 	addiu	s6,s6,24
bfc02004:	ae7e0040 	sw	s8,64(s3)
bfc02008:	ae780038 	sw	t8,56(s3)
bfc0200c:	16d4ffd5 	bne	s6,s4,bfc01f64 <sha_stream+0xfb4>
bfc02010:	ae79003c 	sw	t9,60(s3)
bfc02014:	8fae010c 	lw	t6,268(sp)
bfc02018:	8faf012c 	lw	t7,300(sp)
bfc0201c:	8fb30114 	lw	s3,276(sp)
bfc02020:	01eea026 	xor	s4,t7,t6
bfc02024:	8fb50140 	lw	s5,320(sp)
bfc02028:	0293c026 	xor	t8,s4,s3
bfc0202c:	0315c826 	xor	t9,t8,s5
bfc02030:	afb9014c 	sw	t9,332(sp)
bfc02034:	8ef50004 	lw	s5,4(s7)
bfc02038:	8ef30000 	lw	s3,0(s7)
bfc0203c:	3c165a82 	lui	s6,0x5a82
bfc02040:	8fb00010 	lw	s0,16(sp)
bfc02044:	36d47999 	ori	s4,s6,0x7999
bfc02048:	8ef8000c 	lw	t8,12(s7)
bfc0204c:	8ef60008 	lw	s6,8(s7)
bfc02050:	8ef90010 	lw	t9,16(s7)
bfc02054:	00134940 	sll	t1,s3,0x5
bfc02058:	0015f827 	nor	ra,zero,s5
bfc0205c:	02141021 	addu	v0,s0,s4
bfc02060:	001326c2 	srl	a0,s3,0x1b
bfc02064:	00895025 	or	t2,a0,t1
bfc02068:	03f83024 	and	a2,ra,t8
bfc0206c:	00595821 	addu	t3,v0,t9
bfc02070:	02d54024 	and	t0,s6,s5
bfc02074:	016a6021 	addu	t4,t3,t2
bfc02078:	00c82825 	or	a1,a2,t0
bfc0207c:	0015f082 	srl	s8,s5,0x2
bfc02080:	00156f80 	sll	t5,s5,0x1e
bfc02084:	01854821 	addu	t1,t4,a1
bfc02088:	01be7825 	or	t7,t5,s8
bfc0208c:	27ac0014 	addiu	t4,sp,20
bfc02090:	02605021 	move	t2,s3
bfc02094:	03009021 	move	s2,t8
bfc02098:	0bf00830 	j	bfc020c0 <sha_stream+0x1110>
bfc0209c:	02c07021 	move	t6,s6
bfc020a0:	8d840004 	lw	a0,4(t4)
bfc020a4:	02307825 	or	t7,s1,s0
bfc020a8:	00941021 	addu	v0,a0,s4
bfc020ac:	004e4821 	addu	t1,v0,t6
bfc020b0:	01237021 	addu	t6,t1,v1
bfc020b4:	01c64821 	addu	t1,t6,a2
bfc020b8:	258c0008 	addiu	t4,t4,8
bfc020bc:	01a07021 	move	t6,t5
bfc020c0:	8d9f0000 	lw	ra,0(t4)
bfc020c4:	000a8827 	nor	s1,zero,t2
bfc020c8:	03f44021 	addu	t0,ra,s4
bfc020cc:	000986c2 	srl	s0,t1,0x1b
bfc020d0:	00092940 	sll	a1,t1,0x5
bfc020d4:	01125821 	addu	t3,t0,s2
bfc020d8:	022e3824 	and	a3,s1,t6
bfc020dc:	02059025 	or	s2,s0,a1
bfc020e0:	01eaf024 	and	s8,t7,t2
bfc020e4:	00fe2025 	or	a0,a3,s8
bfc020e8:	01721021 	addu	v0,t3,s2
bfc020ec:	00445821 	addu	t3,v0,a0
bfc020f0:	000aff80 	sll	ra,t2,0x1e
bfc020f4:	000a4082 	srl	t0,t2,0x2
bfc020f8:	000b6940 	sll	t5,t3,0x5
bfc020fc:	000b1ec2 	srl	v1,t3,0x1b
bfc02100:	00093027 	nor	a2,zero,t1
bfc02104:	006d1825 	or	v1,v1,t5
bfc02108:	8fa70378 	lw	a3,888(sp)
bfc0210c:	03e86825 	or	t5,ra,t0
bfc02110:	00cf3024 	and	a2,a2,t7
bfc02114:	01a92824 	and	a1,t5,t1
bfc02118:	259e0004 	addiu	s8,t4,4
bfc0211c:	00098f80 	sll	s1,t1,0x1e
bfc02120:	00098082 	srl	s0,t1,0x2
bfc02124:	01e09021 	move	s2,t7
bfc02128:	01605021 	move	t2,t3
bfc0212c:	14feffdc 	bne	a3,s8,bfc020a0 <sha_stream+0x10f0>
bfc02130:	00c53025 	or	a2,a2,a1
bfc02134:	3c1f6ed9 	lui	ra,0x6ed9
bfc02138:	8fa60060 	lw	a2,96(sp)
bfc0213c:	37f2eba1 	ori	s2,ra,0xeba1
bfc02140:	000b86c2 	srl	s0,t3,0x1b
bfc02144:	00d24021 	addu	t0,a2,s2
bfc02148:	000b2940 	sll	a1,t3,0x5
bfc0214c:	010ef021 	addu	s8,t0,t6
bfc02150:	01a93826 	xor	a3,t5,t1
bfc02154:	02058825 	or	s1,s0,a1
bfc02158:	00ef1826 	xor	v1,a3,t7
bfc0215c:	00095780 	sll	t2,t1,0x1e
bfc02160:	00096082 	srl	t4,t1,0x2
bfc02164:	03d1a021 	addu	s4,s8,s1
bfc02168:	01e07021 	move	t6,t7
bfc0216c:	01604821 	move	t1,t3
bfc02170:	01a07821 	move	t7,t5
bfc02174:	02835821 	addu	t3,s4,v1
bfc02178:	014c6825 	or	t5,t2,t4
bfc0217c:	0bf00869 	j	bfc021a4 <sha_stream+0x11f4>
bfc02180:	27a80064 	addiu	t0,sp,100
bfc02184:	8d070004 	lw	a3,4(t0)
bfc02188:	02306825 	or	t5,s1,s0
bfc0218c:	00f2a021 	addu	s4,a3,s2
bfc02190:	028f5821 	addu	t3,s4,t7
bfc02194:	01637821 	addu	t7,t3,v1
bfc02198:	01e45821 	addu	t3,t7,a0
bfc0219c:	25080008 	addiu	t0,t0,8
bfc021a0:	01807821 	move	t7,t4
bfc021a4:	8d020000 	lw	v0,0(t0)
bfc021a8:	000b8ec2 	srl	s1,t3,0x1b
bfc021ac:	0052f821 	addu	ra,v0,s2
bfc021b0:	000b8140 	sll	s0,t3,0x5
bfc021b4:	03ee5021 	addu	t2,ra,t6
bfc021b8:	02303025 	or	a2,s1,s0
bfc021bc:	01a97026 	xor	t6,t5,t1
bfc021c0:	01cf1826 	xor	v1,t6,t7
bfc021c4:	01466021 	addu	t4,t2,a2
bfc021c8:	0009f780 	sll	s8,t1,0x1e
bfc021cc:	00092882 	srl	a1,t1,0x2
bfc021d0:	01835021 	addu	t2,t4,v1
bfc021d4:	8fa2037c 	lw	v0,892(sp)
bfc021d8:	03c56025 	or	t4,s8,a1
bfc021dc:	000a4ec2 	srl	t1,t2,0x1b
bfc021e0:	000a2140 	sll	a0,t2,0x5
bfc021e4:	018b3826 	xor	a3,t4,t3
bfc021e8:	25140004 	addiu	s4,t0,4
bfc021ec:	01241825 	or	v1,t1,a0
bfc021f0:	000b8f80 	sll	s1,t3,0x1e
bfc021f4:	000b8082 	srl	s0,t3,0x2
bfc021f8:	01a07021 	move	t6,t5
bfc021fc:	01404821 	move	t1,t2
bfc02200:	1454ffe0 	bne	v0,s4,bfc02184 <sha_stream+0x11d4>
bfc02204:	00ed2026 	xor	a0,a3,t5
bfc02208:	3c078f1b 	lui	a3,0x8f1b
bfc0220c:	8fb400b0 	lw	s4,176(sp)
bfc02210:	34f1bcdc 	ori	s1,a3,0xbcdc
bfc02214:	01ac8025 	or	s0,t5,t4
bfc02218:	000afec2 	srl	ra,t2,0x1b
bfc0221c:	000a1140 	sll	v0,t2,0x5
bfc02220:	02911821 	addu	v1,s4,s1
bfc02224:	020b7024 	and	t6,s0,t3
bfc02228:	01ac3024 	and	a2,t5,t4
bfc0222c:	006f4821 	addu	t1,v1,t7
bfc02230:	03e22025 	or	a0,ra,v0
bfc02234:	01c62825 	or	a1,t6,a2
bfc02238:	000b4780 	sll	t0,t3,0x1e
bfc0223c:	000b9082 	srl	s2,t3,0x2
bfc02240:	0124f021 	addu	s8,t1,a0
bfc02244:	01a07821 	move	t7,t5
bfc02248:	01405821 	move	t3,t2
bfc0224c:	01806821 	move	t5,t4
bfc02250:	03c55021 	addu	t2,s8,a1
bfc02254:	01126025 	or	t4,t0,s2
bfc02258:	0bf008a0 	j	bfc02280 <sha_stream+0x12d0>
bfc0225c:	27ae00b4 	addiu	t6,sp,180
bfc02260:	8dc70004 	lw	a3,4(t6)
bfc02264:	02506025 	or	t4,s2,s0
bfc02268:	00f1a021 	addu	s4,a3,s1
bfc0226c:	028d5021 	addu	t2,s4,t5
bfc02270:	01456821 	addu	t5,t2,a1
bfc02274:	01a35021 	addu	t2,t5,v1
bfc02278:	25ce0008 	addiu	t6,t6,8
bfc0227c:	01206821 	move	t5,t1
bfc02280:	8dc20000 	lw	v0,0(t6)
bfc02284:	01ac9025 	or	s2,t5,t4
bfc02288:	00513021 	addu	a2,v0,s1
bfc0228c:	000a86c2 	srl	s0,t2,0x1b
bfc02290:	000a2140 	sll	a0,t2,0x5
bfc02294:	00cf4021 	addu	t0,a2,t7
bfc02298:	024bf024 	and	s8,s2,t3
bfc0229c:	02047825 	or	t7,s0,a0
bfc022a0:	01acf824 	and	ra,t5,t4
bfc022a4:	03df2825 	or	a1,s8,ra
bfc022a8:	010f1821 	addu	v1,t0,t7
bfc022ac:	00654021 	addu	t0,v1,a1
bfc022b0:	000b3f80 	sll	a3,t3,0x1e
bfc022b4:	000ba082 	srl	s4,t3,0x2
bfc022b8:	00084ec2 	srl	t1,t0,0x1b
bfc022bc:	00085940 	sll	t3,t0,0x5
bfc022c0:	012b2825 	or	a1,t1,t3
bfc022c4:	00f44825 	or	t1,a3,s4
bfc022c8:	01891025 	or	v0,t4,t1
bfc022cc:	8fbe0380 	lw	s8,896(sp)
bfc022d0:	004a3024 	and	a2,v0,t2
bfc022d4:	01892024 	and	a0,t4,t1
bfc022d8:	25df0004 	addiu	ra,t6,4
bfc022dc:	000a9780 	sll	s2,t2,0x1e
bfc022e0:	000a8082 	srl	s0,t2,0x2
bfc022e4:	01807821 	move	t7,t4
bfc022e8:	01005821 	move	t3,t0
bfc022ec:	17dfffdc 	bne	s8,ra,bfc02260 <sha_stream+0x12b0>
bfc022f0:	00c41825 	or	v1,a2,a0
bfc022f4:	3c02ca62 	lui	v0,0xca62
bfc022f8:	8fa60100 	lw	a2,256(sp)
bfc022fc:	3450c1d6 	ori	s0,v0,0xc1d6
bfc02300:	0008fec2 	srl	ra,t0,0x1b
bfc02304:	00089140 	sll	s2,t0,0x5
bfc02308:	00d02021 	addu	a0,a2,s0
bfc0230c:	012a2826 	xor	a1,t1,t2
bfc02310:	008d7821 	addu	t7,a0,t5
bfc02314:	03f2f025 	or	s8,ra,s2
bfc02318:	01fe5821 	addu	t3,t7,s8
bfc0231c:	00ac1826 	xor	v1,a1,t4
bfc02320:	000a7780 	sll	t6,t2,0x1e
bfc02324:	000a8882 	srl	s1,t2,0x2
bfc02328:	01806821 	move	t5,t4
bfc0232c:	01005021 	move	t2,t0
bfc02330:	01206021 	move	t4,t1
bfc02334:	01634021 	addu	t0,t3,v1
bfc02338:	01d14825 	or	t1,t6,s1
bfc0233c:	0bf008d9 	j	bfc02364 <sha_stream+0x13b4>
bfc02340:	27ab0104 	addiu	t3,sp,260
bfc02344:	8d710004 	lw	s1,4(t3)
bfc02348:	01ee4825 	or	t1,t7,t6
bfc0234c:	02303821 	addu	a3,s1,s0
bfc02350:	00ec4021 	addu	t0,a3,t4
bfc02354:	01036021 	addu	t4,t0,v1
bfc02358:	01864021 	addu	t0,t4,a2
bfc0235c:	256b0008 	addiu	t3,t3,8
bfc02360:	00a06021 	move	t4,a1
bfc02364:	8d620000 	lw	v0,0(t3)
bfc02368:	000876c2 	srl	t6,t0,0x1b
bfc0236c:	00502021 	addu	a0,v0,s0
bfc02370:	00087940 	sll	t7,t0,0x5
bfc02374:	008d3021 	addu	a2,a0,t5
bfc02378:	01cfa025 	or	s4,t6,t7
bfc0237c:	012a6826 	xor	t5,t1,t2
bfc02380:	00d49021 	addu	s2,a2,s4
bfc02384:	01ac1826 	xor	v1,t5,t4
bfc02388:	000a2f80 	sll	a1,t2,0x1e
bfc0238c:	000af082 	srl	s8,t2,0x2
bfc02390:	02432021 	addu	a0,s2,v1
bfc02394:	00be2825 	or	a1,a1,s8
bfc02398:	8fb40384 	lw	s4,900(sp)
bfc0239c:	000456c2 	srl	t2,a0,0x1b
bfc023a0:	0004f940 	sll	ra,a0,0x5
bfc023a4:	00a88826 	xor	s1,a1,t0
bfc023a8:	25670004 	addiu	a3,t3,4
bfc023ac:	015f1825 	or	v1,t2,ra
bfc023b0:	00087f80 	sll	t7,t0,0x1e
bfc023b4:	00087082 	srl	t6,t0,0x2
bfc023b8:	01206821 	move	t5,t1
bfc023bc:	00805021 	move	t2,a0
bfc023c0:	1687ffe0 	bne	s4,a3,bfc02344 <sha_stream+0x1394>
bfc023c4:	02293026 	xor	a2,s1,t1
bfc023c8:	00935821 	addu	t3,a0,s3
bfc023cc:	02a88021 	addu	s0,s5,t0
bfc023d0:	02c59821 	addu	s3,s6,a1
bfc023d4:	0309a821 	addu	s5,t8,t1
bfc023d8:	032cb021 	addu	s6,t9,t4
bfc023dc:	8fa40360 	lw	a0,864(sp)
bfc023e0:	aeeb0000 	sw	t3,0(s7)
bfc023e4:	aef00004 	sw	s0,4(s7)
bfc023e8:	aef30008 	sw	s3,8(s7)
bfc023ec:	aef5000c 	sw	s5,12(s7)
bfc023f0:	aef60010 	sw	s6,16(s7)
bfc023f4:	00002821 	move	a1,zero
bfc023f8:	0ff00b45 	jal	bfc02d14 <memset>
bfc023fc:	24060038 	li	a2,56
bfc02400:	0bf005f6 	j	bfc017d8 <sha_stream+0x828>
bfc02404:	00000000 	nop
	...

bfc02410 <fopen>:
fopen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:20
bfc02410:	3c028000 	lui	v0,0x8000
bfc02414:	24470a90 	addiu	a3,v0,2704
bfc02418:	00e02821 	move	a1,a3
bfc0241c:	00001821 	move	v1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:22
bfc02420:	2406000a 	li	a2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:23
bfc02424:	8ca20000 	lw	v0,0(a1)
bfc02428:	00000000 	nop
bfc0242c:	10400004 	beqz	v0,bfc02440 <fopen+0x30>
bfc02430:	24a50008 	addiu	a1,a1,8
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:22
bfc02434:	24630001 	addiu	v1,v1,1
bfc02438:	1466fffa 	bne	v1,a2,bfc02424 <fopen+0x14>
bfc0243c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:27
bfc02440:	000310c0 	sll	v0,v1,0x3
bfc02444:	00471021 	addu	v0,v0,a3
bfc02448:	ac440000 	sw	a0,0(v0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:30
bfc0244c:	03e00008 	jr	ra
bfc02450:	ac400004 	sw	zero,4(v0)

bfc02454 <fclose>:
fclose():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:61
bfc02454:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc02458:	3c038000 	lui	v1,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:61
bfc0245c:	24420a90 	addiu	v0,v0,2704
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc02460:	24630ae0 	addiu	v1,v1,2784
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:64
bfc02464:	10820004 	beq	a0,v0,bfc02478 <fclose+0x24>
bfc02468:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:65
bfc0246c:	24420008 	addiu	v0,v0,8
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:63
bfc02470:	1443fffc 	bne	v0,v1,bfc02464 <fclose+0x10>
bfc02474:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:69
bfc02478:	ac800004 	sw	zero,4(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:70
bfc0247c:	03e00008 	jr	ra
bfc02480:	ac800000 	sw	zero,0(a0)

bfc02484 <getc>:
getc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:88
bfc02484:	27bdffe0 	addiu	sp,sp,-32
bfc02488:	afb00014 	sw	s0,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:89
bfc0248c:	8c900000 	lw	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:88
bfc02490:	afb10018 	sw	s1,24(sp)
bfc02494:	00808821 	move	s1,a0
bfc02498:	afbf001c 	sw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:90
bfc0249c:	0ff00ab4 	jal	bfc02ad0 <strlen>
bfc024a0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:91
bfc024a4:	8e230004 	lw	v1,4(s1)
bfc024a8:	00000000 	nop
bfc024ac:	10620009 	beq	v1,v0,bfc024d4 <getc+0x50>
bfc024b0:	02031021 	addu	v0,s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc024b4:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:94
bfc024b8:	24630001 	addiu	v1,v1,1
bfc024bc:	90420000 	lbu	v0,0(v0)
bfc024c0:	ae230004 	sw	v1,4(s1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc024c4:	8fb00014 	lw	s0,20(sp)
bfc024c8:	8fb10018 	lw	s1,24(sp)
bfc024cc:	03e00008 	jr	ra
bfc024d0:	27bd0020 	addiu	sp,sp,32
bfc024d4:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:91
bfc024d8:	2402ffff 	li	v0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:97
bfc024dc:	8fb10018 	lw	s1,24(sp)
bfc024e0:	8fb00014 	lw	s0,20(sp)
bfc024e4:	03e00008 	jr	ra
bfc024e8:	27bd0020 	addiu	sp,sp,32

bfc024ec <fgets>:
fgets():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:72
bfc024ec:	27bdffe0 	addiu	sp,sp,-32
bfc024f0:	afb10014 	sw	s1,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:73
bfc024f4:	8cd10000 	lw	s1,0(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:72
bfc024f8:	afb20018 	sw	s2,24(sp)
bfc024fc:	afb00010 	sw	s0,16(sp)
bfc02500:	00809021 	move	s2,a0
bfc02504:	00c08021 	move	s0,a2
bfc02508:	afbf001c 	sw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:74
bfc0250c:	0ff00ab4 	jal	bfc02ad0 <strlen>
bfc02510:	02202021 	move	a0,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:77
bfc02514:	8e040004 	lw	a0,4(s0)
bfc02518:	00000000 	nop
bfc0251c:	10820012 	beq	a0,v0,bfc02568 <fgets+0x7c>
bfc02520:	00403821 	move	a3,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:78
bfc02524:	02242821 	addu	a1,s1,a0
bfc02528:	80a30000 	lb	v1,0(a1)
bfc0252c:	2402000a 	li	v0,10
bfc02530:	10620014 	beq	v1,v0,bfc02584 <fgets+0x98>
bfc02534:	00003021 	move	a2,zero
bfc02538:	0bf00954 	j	bfc02550 <fgets+0x64>
bfc0253c:	2408000a 	li	t0,10
bfc02540:	80a30001 	lb	v1,1(a1)
bfc02544:	00000000 	nop
bfc02548:	1068000e 	beq	v1,t0,bfc02584 <fgets+0x98>
bfc0254c:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:82
bfc02550:	02461021 	addu	v0,s2,a2
bfc02554:	24840001 	addiu	a0,a0,1
bfc02558:	a0430000 	sb	v1,0(v0)
bfc0255c:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:77
bfc02560:	14e4fff7 	bne	a3,a0,bfc02540 <fgets+0x54>
bfc02564:	ae040004 	sw	a0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc02568:	8fbf001c 	lw	ra,28(sp)
bfc0256c:	00001021 	move	v0,zero
bfc02570:	8fb20018 	lw	s2,24(sp)
bfc02574:	8fb10014 	lw	s1,20(sp)
bfc02578:	8fb00010 	lw	s0,16(sp)
bfc0257c:	03e00008 	jr	ra
bfc02580:	27bd0020 	addiu	sp,sp,32
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:79
bfc02584:	02461021 	addu	v0,s2,a2
bfc02588:	2403000a 	li	v1,10
bfc0258c:	a0430000 	sb	v1,0(v0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc02590:	8fbf001c 	lw	ra,28(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:79
bfc02594:	24840001 	addiu	a0,a0,1
bfc02598:	ae040004 	sw	a0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:86
bfc0259c:	00001021 	move	v0,zero
bfc025a0:	8fb20018 	lw	s2,24(sp)
bfc025a4:	8fb10014 	lw	s1,20(sp)
bfc025a8:	8fb00010 	lw	s0,16(sp)
bfc025ac:	03e00008 	jr	ra
bfc025b0:	27bd0020 	addiu	sp,sp,32

bfc025b4 <fread>:
fread():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc025b4:	27bdffd8 	addiu	sp,sp,-40
bfc025b8:	afb10014 	sw	s1,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:34
bfc025bc:	8cf10000 	lw	s1,0(a3)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc025c0:	afb40020 	sw	s4,32(sp)
bfc025c4:	0080a021 	move	s4,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:35
bfc025c8:	02202021 	move	a0,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:32
bfc025cc:	afb3001c 	sw	s3,28(sp)
bfc025d0:	afb20018 	sw	s2,24(sp)
bfc025d4:	afb00010 	sw	s0,16(sp)
bfc025d8:	afbf0024 	sw	ra,36(sp)
bfc025dc:	00e08021 	move	s0,a3
bfc025e0:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:35
bfc025e4:	0ff00ab4 	jal	bfc02ad0 <strlen>
bfc025e8:	00c09021 	move	s2,a2
bfc025ec:	00404821 	move	t1,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:36
bfc025f0:	8e020004 	lw	v0,4(s0)
bfc025f4:	00000000 	nop
bfc025f8:	10490017 	beq	v0,t1,bfc02658 <fread+0xa4>
bfc025fc:	02530018 	mult	s2,s3
bfc02600:	00003821 	move	a3,zero
bfc02604:	00002812 	mflo	a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:40
bfc02608:	00e5102b 	sltu	v0,a3,a1
bfc0260c:	10400009 	beqz	v0,bfc02634 <fread+0x80>
bfc02610:	02874021 	addu	t0,s4,a3
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:41
bfc02614:	8e020004 	lw	v0,4(s0)
bfc02618:	24e70001 	addiu	a3,a3,1
bfc0261c:	02221821 	addu	v1,s1,v0
bfc02620:	90640000 	lbu	a0,0(v1)
bfc02624:	24420001 	addiu	v0,v0,1
bfc02628:	a1040000 	sb	a0,0(t0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:42
bfc0262c:	1522fff6 	bne	t1,v0,bfc02608 <fread+0x54>
bfc02630:	ae020004 	sw	v0,4(s0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:47
bfc02634:	8fbf0024 	lw	ra,36(sp)
bfc02638:	00e01021 	move	v0,a3
bfc0263c:	8fb40020 	lw	s4,32(sp)
bfc02640:	8fb3001c 	lw	s3,28(sp)
bfc02644:	8fb20018 	lw	s2,24(sp)
bfc02648:	8fb10014 	lw	s1,20(sp)
bfc0264c:	8fb00010 	lw	s0,16(sp)
bfc02650:	03e00008 	jr	ra
bfc02654:	27bd0028 	addiu	sp,sp,40
bfc02658:	8fbf0024 	lw	ra,36(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:36
bfc0265c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/stdio.c:47
bfc02660:	00e01021 	move	v0,a3
bfc02664:	8fb40020 	lw	s4,32(sp)
bfc02668:	8fb3001c 	lw	s3,28(sp)
bfc0266c:	8fb20018 	lw	s2,24(sp)
bfc02670:	8fb10014 	lw	s1,20(sp)
bfc02674:	8fb00010 	lw	s0,16(sp)
bfc02678:	03e00008 	jr	ra
bfc0267c:	27bd0028 	addiu	sp,sp,40

bfc02680 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc02680:	27bdffc8 	addiu	sp,sp,-56
bfc02684:	afb30024 	sw	s3,36(sp)
bfc02688:	afbf0034 	sw	ra,52(sp)
bfc0268c:	afb60030 	sw	s6,48(sp)
bfc02690:	afb5002c 	sw	s5,44(sp)
bfc02694:	afb40028 	sw	s4,40(sp)
bfc02698:	afb20020 	sw	s2,32(sp)
bfc0269c:	afb1001c 	sw	s1,28(sp)
bfc026a0:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc026a4:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc026a8:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc026ac:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc026b0:	afa5003c 	sw	a1,60(sp)
bfc026b4:	afa60040 	sw	a2,64(sp)
bfc026b8:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc026bc:	12000013 	beqz	s0,bfc0270c <printf+0x8c>
bfc026c0:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc026c4:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc026c8:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc026cc:	245608b0 	addiu	s6,v0,2224
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc026d0:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc026d4:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc026d8:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc026dc:	12140016 	beq	s0,s4,bfc02738 <printf+0xb8>
bfc026e0:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc026e4:	1215002f 	beq	s0,s5,bfc027a4 <printf+0x124>
bfc026e8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc026ec:	0ff00a39 	jal	bfc028e4 <putchar>
bfc026f0:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc026f4:	26310001 	addiu	s1,s1,1
bfc026f8:	02711021 	addu	v0,s3,s1
bfc026fc:	80500000 	lb	s0,0(v0)
bfc02700:	00000000 	nop
bfc02704:	1600fff5 	bnez	s0,bfc026dc <printf+0x5c>
bfc02708:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc0270c:	8fbf0034 	lw	ra,52(sp)
bfc02710:	00001021 	move	v0,zero
bfc02714:	8fb60030 	lw	s6,48(sp)
bfc02718:	8fb5002c 	lw	s5,44(sp)
bfc0271c:	8fb40028 	lw	s4,40(sp)
bfc02720:	8fb30024 	lw	s3,36(sp)
bfc02724:	8fb20020 	lw	s2,32(sp)
bfc02728:	8fb1001c 	lw	s1,28(sp)
bfc0272c:	8fb00018 	lw	s0,24(sp)
bfc02730:	03e00008 	jr	ra
bfc02734:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc02738:	80440001 	lb	a0,1(v0)
bfc0273c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc02740:	2482ffdb 	addiu	v0,a0,-37
bfc02744:	304200ff 	andi	v0,v0,0xff
bfc02748:	2c430054 	sltiu	v1,v0,84
bfc0274c:	14600005 	bnez	v1,bfc02764 <printf+0xe4>
bfc02750:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc02754:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02758:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc0275c:	0bf009be 	j	bfc026f8 <printf+0x78>
bfc02760:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc02764:	02c21021 	addu	v0,s6,v0
bfc02768:	8c430000 	lw	v1,0(v0)
bfc0276c:	00000000 	nop
bfc02770:	00600008 	jr	v1
bfc02774:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc02778:	26310001 	addiu	s1,s1,1
bfc0277c:	02711021 	addu	v0,s3,s1
bfc02780:	80440001 	lb	a0,1(v0)
bfc02784:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02788:	2482ffcf 	addiu	v0,a0,-49
bfc0278c:	304200ff 	andi	v0,v0,0xff
bfc02790:	2c420009 	sltiu	v0,v0,9
bfc02794:	1440003f 	bnez	v0,bfc02894 <printf+0x214>
bfc02798:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc0279c:	0bf009d1 	j	bfc02744 <printf+0xc4>
bfc027a0:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc027a4:	0ff00a39 	jal	bfc028e4 <putchar>
bfc027a8:	2404000d 	li	a0,13
bfc027ac:	0bf009bb 	j	bfc026ec <printf+0x6c>
bfc027b0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc027b4:	8e440000 	lw	a0,0(s2)
bfc027b8:	2406000a 	li	a2,10
bfc027bc:	0ff00a74 	jal	bfc029d0 <printbase>
bfc027c0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc027c4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc027c8:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc027cc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc027d0:	8e440000 	lw	a0,0(s2)
bfc027d4:	0ff00a44 	jal	bfc02910 <putstring>
bfc027d8:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc027dc:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc027e0:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc027e4:	8e440000 	lw	a0,0(s2)
bfc027e8:	24060010 	li	a2,16
bfc027ec:	0ff00a74 	jal	bfc029d0 <printbase>
bfc027f0:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc027f4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc027f8:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc027fc:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc02800:	8e440000 	lw	a0,0(s2)
bfc02804:	24060008 	li	a2,8
bfc02808:	0ff00a74 	jal	bfc029d0 <printbase>
bfc0280c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc02810:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc02814:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02818:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc0281c:	8e440000 	lw	a0,0(s2)
bfc02820:	2406000a 	li	a2,10
bfc02824:	0ff00a74 	jal	bfc029d0 <printbase>
bfc02828:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc0282c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc02830:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02834:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc02838:	8e440000 	lw	a0,0(s2)
bfc0283c:	2406000a 	li	a2,10
bfc02840:	0ff00a74 	jal	bfc029d0 <printbase>
bfc02844:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc02848:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc0284c:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02850:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc02854:	8e440000 	lw	a0,0(s2)
bfc02858:	0ff00a39 	jal	bfc028e4 <putchar>
bfc0285c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc02860:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02864:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc02868:	8e440000 	lw	a0,0(s2)
bfc0286c:	24060002 	li	a2,2
bfc02870:	0ff00a74 	jal	bfc029d0 <printbase>
bfc02874:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc02878:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc0287c:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02880:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc02884:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02888:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc0288c:	0bf009bd 	j	bfc026f4 <printf+0x74>
bfc02890:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc02894:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc02898:	000510c0 	sll	v0,a1,0x3
bfc0289c:	00051840 	sll	v1,a1,0x1
bfc028a0:	00621821 	addu	v1,v1,v0
bfc028a4:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc028a8:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc028ac:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc028b0:	2482ffcf 	addiu	v0,a0,-49
bfc028b4:	304200ff 	andi	v0,v0,0xff
bfc028b8:	2c420009 	sltiu	v0,v0,9
bfc028bc:	26310001 	addiu	s1,s1,1
bfc028c0:	1040ff9f 	beqz	v0,bfc02740 <printf+0xc0>
bfc028c4:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc028c8:	0bf00a27 	j	bfc0289c <printf+0x21c>
bfc028cc:	000510c0 	sll	v0,a1,0x3

bfc028d0 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc028d0:	3c018000 	lui	at,0x8000
bfc028d4:	03e00008 	jr	ra
bfc028d8:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc028dc:	03e00008 	jr	ra
bfc028e0:	00000000 	nop

bfc028e4 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc028e4:	27bdffe8 	addiu	sp,sp,-24
bfc028e8:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc028ec:	0ff00a34 	jal	bfc028d0 <tgt_putchar>
bfc028f0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc028f4:	8fbf0014 	lw	ra,20(sp)
bfc028f8:	00001021 	move	v0,zero
bfc028fc:	03e00008 	jr	ra
bfc02900:	27bd0018 	addiu	sp,sp,24
	...

bfc02910 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc02910:	27bdffe0 	addiu	sp,sp,-32
bfc02914:	afb10014 	sw	s1,20(sp)
bfc02918:	afbf001c 	sw	ra,28(sp)
bfc0291c:	afb20018 	sw	s2,24(sp)
bfc02920:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc02924:	80900000 	lb	s0,0(a0)
bfc02928:	00000000 	nop
bfc0292c:	12000013 	beqz	s0,bfc0297c <putstring+0x6c>
bfc02930:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc02934:	0bf00a55 	j	bfc02954 <putstring+0x44>
bfc02938:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc0293c:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02940:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc02944:	82300000 	lb	s0,0(s1)
bfc02948:	00000000 	nop
bfc0294c:	1200000b 	beqz	s0,bfc0297c <putstring+0x6c>
bfc02950:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc02954:	1612fff9 	bne	s0,s2,bfc0293c <putstring+0x2c>
bfc02958:	26310001 	addiu	s1,s1,1
bfc0295c:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02960:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc02964:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02968:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc0296c:	82300000 	lb	s0,0(s1)
bfc02970:	00000000 	nop
bfc02974:	1600fff7 	bnez	s0,bfc02954 <putstring+0x44>
bfc02978:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc0297c:	8fbf001c 	lw	ra,28(sp)
bfc02980:	00001021 	move	v0,zero
bfc02984:	8fb20018 	lw	s2,24(sp)
bfc02988:	8fb10014 	lw	s1,20(sp)
bfc0298c:	8fb00010 	lw	s0,16(sp)
bfc02990:	03e00008 	jr	ra
bfc02994:	27bd0020 	addiu	sp,sp,32

bfc02998 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc02998:	27bdffe8 	addiu	sp,sp,-24
bfc0299c:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc029a0:	0ff00a44 	jal	bfc02910 <putstring>
bfc029a4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc029a8:	0ff00a39 	jal	bfc028e4 <putchar>
bfc029ac:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc029b0:	0ff00a39 	jal	bfc028e4 <putchar>
bfc029b4:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc029b8:	8fbf0014 	lw	ra,20(sp)
bfc029bc:	00001021 	move	v0,zero
bfc029c0:	03e00008 	jr	ra
bfc029c4:	27bd0018 	addiu	sp,sp,24
	...

bfc029d0 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc029d0:	27bdff98 	addiu	sp,sp,-104
bfc029d4:	afb30060 	sw	s3,96(sp)
bfc029d8:	afb2005c 	sw	s2,92(sp)
bfc029dc:	afbf0064 	sw	ra,100(sp)
bfc029e0:	afb10058 	sw	s1,88(sp)
bfc029e4:	afb00054 	sw	s0,84(sp)
bfc029e8:	00801821 	move	v1,a0
bfc029ec:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc029f0:	10e00003 	beqz	a3,bfc02a00 <printbase+0x30>
bfc029f4:	00c09021 	move	s2,a2
bfc029f8:	0480002f 	bltz	a0,bfc02ab8 <printbase+0xe8>
bfc029fc:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc02a00:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc02a04:	1200000c 	beqz	s0,bfc02a38 <printbase+0x68>
bfc02a08:	00008821 	move	s1,zero
bfc02a0c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc02a10:	16400002 	bnez	s2,bfc02a1c <printbase+0x4c>
bfc02a14:	0212001b 	divu	zero,s0,s2
bfc02a18:	0007000d 	break	0x7
bfc02a1c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc02a20:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc02a24:	00001010 	mfhi	v0
bfc02a28:	a0820000 	sb	v0,0(a0)
bfc02a2c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc02a30:	1460fff7 	bnez	v1,bfc02a10 <printbase+0x40>
bfc02a34:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc02a38:	0233102a 	slt	v0,s1,s3
bfc02a3c:	10400002 	beqz	v0,bfc02a48 <printbase+0x78>
bfc02a40:	02201821 	move	v1,s1
bfc02a44:	02601821 	move	v1,s3
bfc02a48:	1060000c 	beqz	v1,bfc02a7c <printbase+0xac>
bfc02a4c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc02a50:	27a20010 	addiu	v0,sp,16
bfc02a54:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc02a58:	26020001 	addiu	v0,s0,1
bfc02a5c:	0222102a 	slt	v0,s1,v0
bfc02a60:	1040000e 	beqz	v0,bfc02a9c <printbase+0xcc>
bfc02a64:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02a68:	02009821 	move	s3,s0
bfc02a6c:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02a70:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc02a74:	1660fff8 	bnez	s3,bfc02a58 <printbase+0x88>
bfc02a78:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc02a7c:	8fbf0064 	lw	ra,100(sp)
bfc02a80:	00001021 	move	v0,zero
bfc02a84:	8fb30060 	lw	s3,96(sp)
bfc02a88:	8fb2005c 	lw	s2,92(sp)
bfc02a8c:	8fb10058 	lw	s1,88(sp)
bfc02a90:	8fb00054 	lw	s0,84(sp)
bfc02a94:	03e00008 	jr	ra
bfc02a98:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc02a9c:	82440000 	lb	a0,0(s2)
bfc02aa0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02aa4:	2882000a 	slti	v0,a0,10
bfc02aa8:	14400007 	bnez	v0,bfc02ac8 <printbase+0xf8>
bfc02aac:	02009821 	move	s3,s0
bfc02ab0:	0bf00a9b 	j	bfc02a6c <printbase+0x9c>
bfc02ab4:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc02ab8:	0ff00a39 	jal	bfc028e4 <putchar>
bfc02abc:	00038023 	negu	s0,v1
bfc02ac0:	0bf00a81 	j	bfc02a04 <printbase+0x34>
bfc02ac4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc02ac8:	0bf00a9a 	j	bfc02a68 <printbase+0x98>
bfc02acc:	24840030 	addiu	a0,a0,48

bfc02ad0 <strlen>:
strlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc02ad0:	80820000 	lb	v0,0(a0)
bfc02ad4:	00000000 	nop
bfc02ad8:	10400008 	beqz	v0,bfc02afc <strlen+0x2c>
bfc02adc:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:15
bfc02ae0:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:14
bfc02ae4:	00851021 	addu	v0,a0,a1
bfc02ae8:	80430000 	lb	v1,0(v0)
bfc02aec:	00000000 	nop
bfc02af0:	1460fffc 	bnez	v1,bfc02ae4 <strlen+0x14>
bfc02af4:	24a50001 	addiu	a1,a1,1
bfc02af8:	24a5ffff 	addiu	a1,a1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:18
bfc02afc:	03e00008 	jr	ra
bfc02b00:	00a01021 	move	v0,a1

bfc02b04 <strnlen>:
strnlen():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc02b04:	10a00010 	beqz	a1,bfc02b48 <strnlen+0x44>
bfc02b08:	00001821 	move	v1,zero
bfc02b0c:	80820000 	lb	v0,0(a0)
bfc02b10:	00000000 	nop
bfc02b14:	14400009 	bnez	v0,bfc02b3c <strnlen+0x38>
bfc02b18:	24630001 	addiu	v1,v1,1
bfc02b1c:	2463ffff 	addiu	v1,v1,-1
bfc02b20:	0bf00ad2 	j	bfc02b48 <strnlen+0x44>
bfc02b24:	00000000 	nop
bfc02b28:	80c20000 	lb	v0,0(a2)
bfc02b2c:	00000000 	nop
bfc02b30:	10400005 	beqz	v0,bfc02b48 <strnlen+0x44>
bfc02b34:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:37
bfc02b38:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:36
bfc02b3c:	0065102b 	sltu	v0,v1,a1
bfc02b40:	1440fff9 	bnez	v0,bfc02b28 <strnlen+0x24>
bfc02b44:	00833021 	addu	a2,a0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:40
bfc02b48:	03e00008 	jr	ra
bfc02b4c:	00601021 	move	v0,v1

bfc02b50 <strcpy>:
strcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:55
bfc02b50:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:60
bfc02b54:	80a20000 	lb	v0,0(a1)
bfc02b58:	24a50001 	addiu	a1,a1,1
bfc02b5c:	a0620000 	sb	v0,0(v1)
bfc02b60:	1440fffc 	bnez	v0,bfc02b54 <strcpy+0x4>
bfc02b64:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:64
bfc02b68:	03e00008 	jr	ra
bfc02b6c:	00801021 	move	v0,a0

bfc02b70 <strncpy>:
strncpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc02b70:	10c00009 	beqz	a2,bfc02b98 <strncpy+0x28>
bfc02b74:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc02b78:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:83
bfc02b7c:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:80
bfc02b80:	a0620000 	sb	v0,0(v1)
bfc02b84:	10400002 	beqz	v0,bfc02b90 <strncpy+0x20>
bfc02b88:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:81
bfc02b8c:	24a50001 	addiu	a1,a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:79
bfc02b90:	14c0fff9 	bnez	a2,bfc02b78 <strncpy+0x8>
bfc02b94:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:86
bfc02b98:	03e00008 	jr	ra
bfc02b9c:	00801021 	move	v0,a0

bfc02ba0 <strcmp>:
strcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc02ba0:	80820000 	lb	v0,0(a0)
bfc02ba4:	00000000 	nop
bfc02ba8:	14400007 	bnez	v0,bfc02bc8 <strcmp+0x28>
bfc02bac:	00000000 	nop
bfc02bb0:	0bf00afa 	j	bfc02be8 <strcmp+0x48>
bfc02bb4:	00000000 	nop
bfc02bb8:	80820000 	lb	v0,0(a0)
bfc02bbc:	00000000 	nop
bfc02bc0:	10400009 	beqz	v0,bfc02be8 <strcmp+0x48>
bfc02bc4:	24a50001 	addiu	a1,a1,1
bfc02bc8:	80a30000 	lb	v1,0(a1)
bfc02bcc:	00000000 	nop
bfc02bd0:	1043fff9 	beq	v0,v1,bfc02bb8 <strcmp+0x18>
bfc02bd4:	24840001 	addiu	a0,a0,1
bfc02bd8:	304400ff 	andi	a0,v0,0xff
bfc02bdc:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc02be0:	03e00008 	jr	ra
bfc02be4:	00821023 	subu	v0,a0,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:108
bfc02be8:	80a30000 	lb	v1,0(a1)
bfc02bec:	00002021 	move	a0,zero
bfc02bf0:	306200ff 	andi	v0,v1,0xff
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:113
bfc02bf4:	03e00008 	jr	ra
bfc02bf8:	00821023 	subu	v0,a0,v0

bfc02bfc <strncmp>:
strncmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc02bfc:	10c00016 	beqz	a2,bfc02c58 <strncmp+0x5c>
bfc02c00:	00000000 	nop
bfc02c04:	80830000 	lb	v1,0(a0)
bfc02c08:	00000000 	nop
bfc02c0c:	14600009 	bnez	v1,bfc02c34 <strncmp+0x38>
bfc02c10:	00000000 	nop
bfc02c14:	0bf00b18 	j	bfc02c60 <strncmp+0x64>
bfc02c18:	00000000 	nop
bfc02c1c:	10c0000e 	beqz	a2,bfc02c58 <strncmp+0x5c>
bfc02c20:	24840001 	addiu	a0,a0,1
bfc02c24:	80830000 	lb	v1,0(a0)
bfc02c28:	00000000 	nop
bfc02c2c:	1060000c 	beqz	v1,bfc02c60 <strncmp+0x64>
bfc02c30:	24a50001 	addiu	a1,a1,1
bfc02c34:	80a20000 	lb	v0,0(a1)
bfc02c38:	00000000 	nop
bfc02c3c:	1062fff7 	beq	v1,v0,bfc02c1c <strncmp+0x20>
bfc02c40:	24c6ffff 	addiu	a2,a2,-1
bfc02c44:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc02c48:	306300ff 	andi	v1,v1,0xff
bfc02c4c:	304200ff 	andi	v0,v0,0xff
bfc02c50:	03e00008 	jr	ra
bfc02c54:	00621023 	subu	v0,v1,v0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:132
bfc02c58:	03e00008 	jr	ra
bfc02c5c:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:128
bfc02c60:	80a20000 	lb	v0,0(a1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:131
bfc02c64:	306300ff 	andi	v1,v1,0xff
bfc02c68:	304200ff 	andi	v0,v0,0xff
bfc02c6c:	03e00008 	jr	ra
bfc02c70:	00621023 	subu	v0,v1,v0

bfc02c74 <strchr>:
strchr():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc02c74:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:143
bfc02c78:	00052e00 	sll	a1,a1,0x18
bfc02c7c:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc02c80:	1060000c 	beqz	v1,bfc02cb4 <strchr+0x40>
bfc02c84:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:145
bfc02c88:	14650006 	bne	v1,a1,bfc02ca4 <strchr+0x30>
bfc02c8c:	24420001 	addiu	v0,v0,1
bfc02c90:	03e00008 	jr	ra
bfc02c94:	2442ffff 	addiu	v0,v0,-1
bfc02c98:	10650008 	beq	v1,a1,bfc02cbc <strchr+0x48>
bfc02c9c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:148
bfc02ca0:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:144
bfc02ca4:	80430000 	lb	v1,0(v0)
bfc02ca8:	00000000 	nop
bfc02cac:	1460fffa 	bnez	v1,bfc02c98 <strchr+0x24>
bfc02cb0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:151
bfc02cb4:	03e00008 	jr	ra
bfc02cb8:	00001021 	move	v0,zero
bfc02cbc:	03e00008 	jr	ra
bfc02cc0:	00000000 	nop

bfc02cc4 <strfind>:
strfind():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc02cc4:	80830000 	lb	v1,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:163
bfc02cc8:	00052e00 	sll	a1,a1,0x18
bfc02ccc:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc02cd0:	1060000c 	beqz	v1,bfc02d04 <strfind+0x40>
bfc02cd4:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:165
bfc02cd8:	14650006 	bne	v1,a1,bfc02cf4 <strfind+0x30>
bfc02cdc:	24420001 	addiu	v0,v0,1
bfc02ce0:	03e00008 	jr	ra
bfc02ce4:	2442ffff 	addiu	v0,v0,-1
bfc02ce8:	10650008 	beq	v1,a1,bfc02d0c <strfind+0x48>
bfc02cec:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:168
bfc02cf0:	24420001 	addiu	v0,v0,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:164
bfc02cf4:	80430000 	lb	v1,0(v0)
bfc02cf8:	00000000 	nop
bfc02cfc:	1460fffa 	bnez	v1,bfc02ce8 <strfind+0x24>
bfc02d00:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:171
bfc02d04:	03e00008 	jr	ra
bfc02d08:	00000000 	nop
bfc02d0c:	03e00008 	jr	ra
bfc02d10:	00000000 	nop

bfc02d14 <memset>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:273
bfc02d14:	00052e00 	sll	a1,a1,0x18
bfc02d18:	00801021 	move	v0,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc02d1c:	10c00006 	beqz	a2,bfc02d38 <memset+0x24>
bfc02d20:	00052e03 	sra	a1,a1,0x18
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:277
bfc02d24:	00801821 	move	v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc02d28:	24c6ffff 	addiu	a2,a2,-1
bfc02d2c:	a0650000 	sb	a1,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc02d30:	14c0fffd 	bnez	a2,bfc02d28 <memset+0x14>
bfc02d34:	24630001 	addiu	v1,v1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:283
bfc02d38:	03e00008 	jr	ra
bfc02d3c:	00000000 	nop

bfc02d40 <memcpy>:
memcpy():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc02d40:	10c00008 	beqz	a2,bfc02d64 <memcpy+0x24>
bfc02d44:	00804021 	move	t0,a0
bfc02d48:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:307
bfc02d4c:	00a71021 	addu	v0,a1,a3
bfc02d50:	90440000 	lbu	a0,0(v0)
bfc02d54:	01071821 	addu	v1,t0,a3
bfc02d58:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:306
bfc02d5c:	14e6fffb 	bne	a3,a2,bfc02d4c <memcpy+0xc>
bfc02d60:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:311
bfc02d64:	03e00008 	jr	ra
bfc02d68:	01001021 	move	v0,t0

bfc02d6c <memmove>:
memmove():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:329
bfc02d6c:	00a4102b 	sltu	v0,a1,a0
bfc02d70:	10400005 	beqz	v0,bfc02d88 <memmove+0x1c>
bfc02d74:	00804021 	move	t0,a0
bfc02d78:	00a62021 	addu	a0,a1,a2
bfc02d7c:	0104102b 	sltu	v0,t0,a0
bfc02d80:	1440000b 	bnez	v0,bfc02db0 <memmove+0x44>
bfc02d84:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc02d88:	10c00007 	beqz	a2,bfc02da8 <memmove+0x3c>
bfc02d8c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:336
bfc02d90:	00a71021 	addu	v0,a1,a3
bfc02d94:	90440000 	lbu	a0,0(v0)
bfc02d98:	01071821 	addu	v1,t0,a3
bfc02d9c:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:335
bfc02da0:	14c7fffb 	bne	a2,a3,bfc02d90 <memmove+0x24>
bfc02da4:	a0640000 	sb	a0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc02da8:	03e00008 	jr	ra
bfc02dac:	01001021 	move	v0,t0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc02db0:	10c0fffd 	beqz	a2,bfc02da8 <memmove+0x3c>
bfc02db4:	01061821 	addu	v1,t0,a2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:332
bfc02db8:	2484ffff 	addiu	a0,a0,-1
bfc02dbc:	90820000 	lbu	v0,0(a0)
bfc02dc0:	2463ffff 	addiu	v1,v1,-1
bfc02dc4:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:331
bfc02dc8:	14c0fffb 	bnez	a2,bfc02db8 <memmove+0x4c>
bfc02dcc:	a0620000 	sb	v0,0(v1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:341
bfc02dd0:	03e00008 	jr	ra
bfc02dd4:	01001021 	move	v0,t0

bfc02dd8 <memcmp>:
memcmp():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc02dd8:	10c00011 	beqz	a2,bfc02e20 <memcmp+0x48>
bfc02ddc:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc02de0:	80830000 	lb	v1,0(a0)
bfc02de4:	80a20000 	lb	v0,0(a1)
bfc02de8:	00000000 	nop
bfc02dec:	1462000e 	bne	v1,v0,bfc02e28 <memcmp+0x50>
bfc02df0:	24c6ffff 	addiu	a2,a2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc02df4:	0bf00b84 	j	bfc02e10 <memcmp+0x38>
bfc02df8:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:362
bfc02dfc:	80630001 	lb	v1,1(v1)
bfc02e00:	80420001 	lb	v0,1(v0)
bfc02e04:	00000000 	nop
bfc02e08:	14620007 	bne	v1,v0,bfc02e28 <memcmp+0x50>
bfc02e0c:	24c6ffff 	addiu	a2,a2,-1
bfc02e10:	00871821 	addu	v1,a0,a3
bfc02e14:	00a71021 	addu	v0,a1,a3
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:361
bfc02e18:	14c0fff8 	bnez	a2,bfc02dfc <memcmp+0x24>
bfc02e1c:	24e70001 	addiu	a3,a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:368
bfc02e20:	03e00008 	jr	ra
bfc02e24:	00001021 	move	v0,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:363
bfc02e28:	306300ff 	andi	v1,v1,0xff
bfc02e2c:	304200ff 	andi	v0,v0,0xff
bfc02e30:	03e00008 	jr	ra
bfc02e34:	00621023 	subu	v0,v1,v0

bfc02e38 <bzero>:
memset():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc02e38:	10a00005 	beqz	a1,bfc02e50 <bzero+0x18>
bfc02e3c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:279
bfc02e40:	24a5ffff 	addiu	a1,a1,-1
bfc02e44:	a0800000 	sb	zero,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/string.c:278
bfc02e48:	14a0fffd 	bnez	a1,bfc02e40 <bzero+0x8>
bfc02e4c:	24840001 	addiu	a0,a0,1
bfc02e50:	03e00008 	jr	ra
bfc02e54:	00000000 	nop
	...

bfc02e60 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc02e60:	3c01bfd0 	lui	at,0xbfd0
bfc02e64:	3421e000 	ori	at,at,0xe000
bfc02e68:	8c220000 	lw	v0,0(at)
bfc02e6c:	03e00008 	jr	ra
bfc02e70:	00000000 	nop

bfc02e74 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc02e74:	3c01bfd0 	lui	at,0xbfd0
bfc02e78:	3421e000 	ori	at,at,0xe000
bfc02e7c:	8c220000 	lw	v0,0(at)
bfc02e80:	03e00008 	jr	ra
bfc02e84:	00000000 	nop

bfc02e88 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc02e88:	3c01bfd0 	lui	at,0xbfd0
bfc02e8c:	3421e000 	ori	at,at,0xe000
bfc02e90:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc02e94:	03e00008 	jr	ra
bfc02e98:	00021040 	sll	v0,v0,0x1

bfc02e9c <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc02e9c:	3c01bfd0 	lui	at,0xbfd0
bfc02ea0:	3421e000 	ori	at,at,0xe000
bfc02ea4:	8c220000 	lw	v0,0(at)
bfc02ea8:	03e00008 	jr	ra
bfc02eac:	00000000 	nop

bfc02eb0 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc02eb0:	27bdffe8 	addiu	sp,sp,-24
bfc02eb4:	afbf0014 	sw	ra,20(sp)
bfc02eb8:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc02ebc:	3c01bfd0 	lui	at,0xbfd0
bfc02ec0:	3421e000 	ori	at,at,0xe000
bfc02ec4:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc02ec8:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc02ecc:	14400002 	bnez	v0,bfc02ed8 <clock_gettime+0x28>
bfc02ed0:	0062001b 	divu	zero,v1,v0
bfc02ed4:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc02ed8:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc02edc:	3c073b9a 	lui	a3,0x3b9a
bfc02ee0:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc02ee4:	3c048000 	lui	a0,0x8000
bfc02ee8:	24840a00 	addiu	a0,a0,2560
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc02eec:	00003012 	mflo	a2
bfc02ef0:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc02ef4:	14400002 	bnez	v0,bfc02f00 <clock_gettime+0x50>
bfc02ef8:	0062001b 	divu	zero,v1,v0
bfc02efc:	0007000d 	break	0x7
bfc02f00:	00002810 	mfhi	a1
bfc02f04:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc02f08:	14400002 	bnez	v0,bfc02f14 <clock_gettime+0x64>
bfc02f0c:	00c2001b 	divu	zero,a2,v0
bfc02f10:	0007000d 	break	0x7
bfc02f14:	00005010 	mfhi	t2
bfc02f18:	ad2a0008 	sw	t2,8(t1)
bfc02f1c:	00004012 	mflo	t0
bfc02f20:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc02f24:	14e00002 	bnez	a3,bfc02f30 <clock_gettime+0x80>
bfc02f28:	00c7001b 	divu	zero,a2,a3
bfc02f2c:	0007000d 	break	0x7
bfc02f30:	00003012 	mflo	a2
bfc02f34:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc02f38:	14400002 	bnez	v0,bfc02f44 <clock_gettime+0x94>
bfc02f3c:	0102001b 	divu	zero,t0,v0
bfc02f40:	0007000d 	break	0x7
bfc02f44:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc02f48:	0ff009a0 	jal	bfc02680 <printf>
bfc02f4c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc02f50:	8fbf0014 	lw	ra,20(sp)
bfc02f54:	00001021 	move	v0,zero
bfc02f58:	03e00008 	jr	ra
bfc02f5c:	27bd0018 	addiu	sp,sp,24

bfc02f60 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc02f60:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc02f64:	03e00008 	jr	ra
bfc02f68:	00000000 	nop

bfc02f6c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc02f6c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc02f70:	03e00008 	jr	ra
bfc02f74:	00000000 	nop

bfc02f78 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc02f78:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc02f7c:	27bdffe8 	addiu	sp,sp,-24
bfc02f80:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc02f84:	0ff009a0 	jal	bfc02680 <printf>
bfc02f88:	24840a14 	addiu	a0,a0,2580
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc02f8c:	3c048000 	lui	a0,0x8000
bfc02f90:	24840a30 	addiu	a0,a0,2608
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc02f94:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc02f98:	0ff009a0 	jal	bfc02680 <printf>
bfc02f9c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc02fa0:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc02fa4:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc02fa8:	24840a40 	addiu	a0,a0,2624
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc02fac:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc02fb0:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc02fb4:	0bf009a0 	j	bfc02680 <printf>
bfc02fb8:	00000000 	nop
bfc02fbc:	00000000 	nop
