
obj/bitcount/main.elf:     file format elf32-tradlittlemips
obj/bitcount/main.elf


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
bfc00010:	27bd444c 	addiu	sp,sp,17484
/home/ucas/cpu_open/perf_test_v1.00/soft/start.S:55
bfc00014:	3c1c8001 	lui	gp,0x8001
bfc00018:	279c8470 	addiu	gp,gp,-31632
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
bfc00380:	0ff0048e 	jal	bfc01238 <exception>
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
bfc003a4:	0ff003fa 	jal	bfc00fe8 <puts>
bfc003a8:	afb00014 	sw	s0,20(sp)
bfc003ac:	0ff0044d 	jal	bfc01134 <get_count>
bfc003b0:	00000000 	nop
bfc003b4:	24040001 	li	a0,1
bfc003b8:	24050064 	li	a1,100
bfc003bc:	0ff00160 	jal	bfc00580 <bitcnts>
bfc003c0:	00408021 	move	s0,v0
bfc003c4:	0ff0044d 	jal	bfc01134 <get_count>
bfc003c8:	00408821 	move	s1,v0
bfc003cc:	00508023 	subu	s0,v0,s0
bfc003d0:	2402032b 	li	v0,811
bfc003d4:	1222001e 	beq	s1,v0,bfc00450 <shell+0xc0>
bfc003d8:	3c198000 	lui	t9,0x8000
bfc003dc:	0ff00334 	jal	bfc00cd0 <printf>
bfc003e0:	27240028 	addiu	a0,t9,40
bfc003e4:	3c18bfd0 	lui	t8,0xbfd0
bfc003e8:	370bf000 	ori	t3,t8,0xf000
bfc003ec:	370ff008 	ori	t7,t8,0xf008
bfc003f0:	370df004 	ori	t5,t8,0xf004
bfc003f4:	240e0001 	li	t6,1
bfc003f8:	240c0002 	li	t4,2
bfc003fc:	adee0000 	sw	t6,0(t7)
bfc00400:	adac0000 	sw	t4,0(t5)
bfc00404:	ad600000 	sw	zero,0(t3)
bfc00408:	3c1f8000 	lui	ra,0x8000
bfc0040c:	27e4003c 	addiu	a0,ra,60
bfc00410:	0ff00334 	jal	bfc00cd0 <printf>
bfc00414:	02202821 	move	a1,s1
bfc00418:	3c02bfd0 	lui	v0,0xbfd0
bfc0041c:	3451f010 	ori	s1,v0,0xf010
bfc00420:	3c048000 	lui	a0,0x8000
bfc00424:	ae300000 	sw	s0,0(s1)
bfc00428:	02002821 	move	a1,s0
bfc0042c:	8fbf001c 	lw	ra,28(sp)
bfc00430:	8fb10018 	lw	s1,24(sp)
bfc00434:	8fb00014 	lw	s0,20(sp)
bfc00438:	24840048 	addiu	a0,a0,72
bfc0043c:	0bf00334 	j	bfc00cd0 <printf>
bfc00440:	27bd0020 	addiu	sp,sp,32
	...
bfc00450:	3c0a8000 	lui	t2,0x8000
bfc00454:	0ff00334 	jal	bfc00cd0 <printf>
bfc00458:	25440018 	addiu	a0,t2,24
bfc0045c:	3c09bfd0 	lui	t1,0xbfd0
bfc00460:	24070001 	li	a3,1
bfc00464:	3526f000 	ori	a2,t1,0xf000
bfc00468:	3525f008 	ori	a1,t1,0xf008
bfc0046c:	3528f004 	ori	t0,t1,0xf004
bfc00470:	3403ffff 	li	v1,0xffff
bfc00474:	ad070000 	sw	a3,0(t0)
bfc00478:	acc30000 	sw	v1,0(a2)
bfc0047c:	0bf00102 	j	bfc00408 <shell+0x78>
bfc00480:	aca70000 	sw	a3,0(a1)
	...

bfc00490 <myrand>:
myrand():
bfc00490:	03e00008 	jr	ra
bfc00494:	24025670 	li	v0,22128
	...

bfc004a0 <bit_shifter>:
bit_shifter():
bfc004a0:	27bdfff0 	addiu	sp,sp,-16
bfc004a4:	afb2000c 	sw	s2,12(sp)
bfc004a8:	afb10008 	sw	s1,8(sp)
bfc004ac:	10800030 	beqz	a0,bfc00570 <bit_shifter+0xd0>
bfc004b0:	afb00004 	sw	s0,4(sp)
bfc004b4:	00002821 	move	a1,zero
bfc004b8:	00003021 	move	a2,zero
bfc004bc:	24120020 	li	s2,32
bfc004c0:	30830001 	andi	v1,a0,0x1
bfc004c4:	00041043 	sra	v0,a0,0x1
bfc004c8:	00043883 	sra	a3,a0,0x2
bfc004cc:	000440c3 	sra	t0,a0,0x3
bfc004d0:	00044903 	sra	t1,a0,0x4
bfc004d4:	00045143 	sra	t2,a0,0x5
bfc004d8:	00045983 	sra	t3,a0,0x6
bfc004dc:	000461c3 	sra	t4,a0,0x7
bfc004e0:	24c60008 	addiu	a2,a2,8
bfc004e4:	304d0001 	andi	t5,v0,0x1
bfc004e8:	30ee0001 	andi	t6,a3,0x1
bfc004ec:	310f0001 	andi	t7,t0,0x1
bfc004f0:	31380001 	andi	t8,t1,0x1
bfc004f4:	31590001 	andi	t9,t2,0x1
bfc004f8:	31700001 	andi	s0,t3,0x1
bfc004fc:	31910001 	andi	s1,t4,0x1
bfc00500:	00042203 	sra	a0,a0,0x8
bfc00504:	10400011 	beqz	v0,bfc0054c <bit_shifter+0xac>
bfc00508:	00a32821 	addu	a1,a1,v1
bfc0050c:	10e0000f 	beqz	a3,bfc0054c <bit_shifter+0xac>
bfc00510:	00ad2821 	addu	a1,a1,t5
bfc00514:	1100000d 	beqz	t0,bfc0054c <bit_shifter+0xac>
bfc00518:	00ae2821 	addu	a1,a1,t6
bfc0051c:	1120000b 	beqz	t1,bfc0054c <bit_shifter+0xac>
bfc00520:	00af2821 	addu	a1,a1,t7
bfc00524:	11400009 	beqz	t2,bfc0054c <bit_shifter+0xac>
bfc00528:	00b82821 	addu	a1,a1,t8
bfc0052c:	11600007 	beqz	t3,bfc0054c <bit_shifter+0xac>
bfc00530:	00b92821 	addu	a1,a1,t9
bfc00534:	11800005 	beqz	t4,bfc0054c <bit_shifter+0xac>
bfc00538:	00b02821 	addu	a1,a1,s0
bfc0053c:	10800003 	beqz	a0,bfc0054c <bit_shifter+0xac>
bfc00540:	00b12821 	addu	a1,a1,s1
bfc00544:	14d2ffde 	bne	a2,s2,bfc004c0 <bit_shifter+0x20>
bfc00548:	00000000 	nop
bfc0054c:	00a01021 	move	v0,a1
bfc00550:	8fb2000c 	lw	s2,12(sp)
bfc00554:	8fb10008 	lw	s1,8(sp)
bfc00558:	8fb00004 	lw	s0,4(sp)
bfc0055c:	03e00008 	jr	ra
bfc00560:	27bd0010 	addiu	sp,sp,16
	...
bfc00570:	0bf00153 	j	bfc0054c <bit_shifter+0xac>
bfc00574:	00002821 	move	a1,zero
	...

bfc00580 <bitcnts>:
bitcnts():
bfc00580:	27bdffc8 	addiu	sp,sp,-56
bfc00584:	3c088000 	lui	t0,0x8000
bfc00588:	25040068 	addiu	a0,t0,104
bfc0058c:	afb6002c 	sw	s6,44(sp)
bfc00590:	00a0b021 	move	s6,a1
bfc00594:	afbf0034 	sw	ra,52(sp)
bfc00598:	afb70030 	sw	s7,48(sp)
bfc0059c:	afb50028 	sw	s5,40(sp)
bfc005a0:	afb40024 	sw	s4,36(sp)
bfc005a4:	afb30020 	sw	s3,32(sp)
bfc005a8:	afb2001c 	sw	s2,28(sp)
bfc005ac:	afb10018 	sw	s1,24(sp)
bfc005b0:	0ff003fa 	jal	bfc00fe8 <puts>
bfc005b4:	afb00014 	sw	s0,20(sp)
bfc005b8:	0ff00457 	jal	bfc0115c <get_ns>
bfc005bc:	00000000 	nop
bfc005c0:	00163880 	sll	a3,s6,0x2
bfc005c4:	00163100 	sll	a2,s6,0x4
bfc005c8:	00c72823 	subu	a1,a2,a3
bfc005cc:	00b62021 	addu	a0,a1,s6
bfc005d0:	3c028000 	lui	v0,0x8000
bfc005d4:	3c038000 	lui	v1,0x8000
bfc005d8:	24540090 	addiu	s4,v0,144
bfc005dc:	247700ac 	addiu	s7,v1,172
bfc005e0:	24955670 	addiu	s5,a0,22128
bfc005e4:	1ac00062 	blez	s6,bfc00770 <bitcnts+0x1f0>
bfc005e8:	3c0cc4ec 	lui	t4,0xc4ec
bfc005ec:	26aba983 	addiu	t3,s5,-22141
bfc005f0:	358a4ec5 	ori	t2,t4,0x4ec5
bfc005f4:	016a0018 	mult	t3,t2
bfc005f8:	8e930000 	lw	s3,0(s4)
bfc005fc:	24045670 	li	a0,22128
bfc00600:	2411567d 	li	s1,22141
bfc00604:	00004812 	mflo	t1
bfc00608:	0260f809 	jalr	s3
bfc0060c:	31300007 	andi	s0,t1,0x7
bfc00610:	12350046 	beq	s1,s5,bfc0072c <bitcnts+0x1ac>
bfc00614:	00409021 	move	s2,v0
bfc00618:	1200002a 	beqz	s0,bfc006c4 <bitcnts+0x144>
bfc0061c:	240d0001 	li	t5,1
bfc00620:	120d0023 	beq	s0,t5,bfc006b0 <bitcnts+0x130>
bfc00624:	240e0002 	li	t6,2
bfc00628:	120e001d 	beq	s0,t6,bfc006a0 <bitcnts+0x120>
bfc0062c:	240f0003 	li	t7,3
bfc00630:	120f0017 	beq	s0,t7,bfc00690 <bitcnts+0x110>
bfc00634:	24180004 	li	t8,4
bfc00638:	12180011 	beq	s0,t8,bfc00680 <bitcnts+0x100>
bfc0063c:	24190005 	li	t9,5
bfc00640:	1219000b 	beq	s0,t9,bfc00670 <bitcnts+0xf0>
bfc00644:	241f0006 	li	ra,6
bfc00648:	121f0005 	beq	s0,ra,bfc00660 <bitcnts+0xe0>
bfc0064c:	00000000 	nop
bfc00650:	0260f809 	jalr	s3
bfc00654:	2404567d 	li	a0,22141
bfc00658:	02429021 	addu	s2,s2,v0
bfc0065c:	2411568a 	li	s1,22154
bfc00660:	0260f809 	jalr	s3
bfc00664:	02202021 	move	a0,s1
bfc00668:	02429021 	addu	s2,s2,v0
bfc0066c:	2631000d 	addiu	s1,s1,13
bfc00670:	0260f809 	jalr	s3
bfc00674:	02202021 	move	a0,s1
bfc00678:	02429021 	addu	s2,s2,v0
bfc0067c:	2631000d 	addiu	s1,s1,13
bfc00680:	0260f809 	jalr	s3
bfc00684:	02202021 	move	a0,s1
bfc00688:	02429021 	addu	s2,s2,v0
bfc0068c:	2631000d 	addiu	s1,s1,13
bfc00690:	0260f809 	jalr	s3
bfc00694:	02202021 	move	a0,s1
bfc00698:	02429021 	addu	s2,s2,v0
bfc0069c:	2631000d 	addiu	s1,s1,13
bfc006a0:	0260f809 	jalr	s3
bfc006a4:	02202021 	move	a0,s1
bfc006a8:	02429021 	addu	s2,s2,v0
bfc006ac:	2631000d 	addiu	s1,s1,13
bfc006b0:	0260f809 	jalr	s3
bfc006b4:	02202021 	move	a0,s1
bfc006b8:	2631000d 	addiu	s1,s1,13
bfc006bc:	1235001b 	beq	s1,s5,bfc0072c <bitcnts+0x1ac>
bfc006c0:	02429021 	addu	s2,s2,v0
bfc006c4:	0260f809 	jalr	s3
bfc006c8:	02202021 	move	a0,s1
bfc006cc:	2624000d 	addiu	a0,s1,13
bfc006d0:	0260f809 	jalr	s3
bfc006d4:	02428021 	addu	s0,s2,v0
bfc006d8:	2624001a 	addiu	a0,s1,26
bfc006dc:	0260f809 	jalr	s3
bfc006e0:	02029021 	addu	s2,s0,v0
bfc006e4:	26240027 	addiu	a0,s1,39
bfc006e8:	0260f809 	jalr	s3
bfc006ec:	02428021 	addu	s0,s2,v0
bfc006f0:	26240034 	addiu	a0,s1,52
bfc006f4:	0260f809 	jalr	s3
bfc006f8:	02029021 	addu	s2,s0,v0
bfc006fc:	26240041 	addiu	a0,s1,65
bfc00700:	0260f809 	jalr	s3
bfc00704:	02428021 	addu	s0,s2,v0
bfc00708:	2624004e 	addiu	a0,s1,78
bfc0070c:	0260f809 	jalr	s3
bfc00710:	02029021 	addu	s2,s0,v0
bfc00714:	2624005b 	addiu	a0,s1,91
bfc00718:	02428021 	addu	s0,s2,v0
bfc0071c:	0260f809 	jalr	s3
bfc00720:	26310068 	addiu	s1,s1,104
bfc00724:	1635ffe7 	bne	s1,s5,bfc006c4 <bitcnts+0x144>
bfc00728:	02029021 	addu	s2,s0,v0
bfc0072c:	26940004 	addiu	s4,s4,4
bfc00730:	1697ffac 	bne	s4,s7,bfc005e4 <bitcnts+0x64>
bfc00734:	00000000 	nop
bfc00738:	0ff00457 	jal	bfc0115c <get_ns>
bfc0073c:	00000000 	nop
bfc00740:	8fbf0034 	lw	ra,52(sp)
bfc00744:	02401021 	move	v0,s2
bfc00748:	8fb70030 	lw	s7,48(sp)
bfc0074c:	8fb6002c 	lw	s6,44(sp)
bfc00750:	8fb50028 	lw	s5,40(sp)
bfc00754:	8fb40024 	lw	s4,36(sp)
bfc00758:	8fb30020 	lw	s3,32(sp)
bfc0075c:	8fb2001c 	lw	s2,28(sp)
bfc00760:	8fb10018 	lw	s1,24(sp)
bfc00764:	8fb00014 	lw	s0,20(sp)
bfc00768:	03e00008 	jr	ra
bfc0076c:	27bd0038 	addiu	sp,sp,56
bfc00770:	26940004 	addiu	s4,s4,4
bfc00774:	1697ff9b 	bne	s4,s7,bfc005e4 <bitcnts+0x64>
bfc00778:	00009021 	move	s2,zero
bfc0077c:	0bf001ce 	j	bfc00738 <bitcnts+0x1b8>
bfc00780:	00000000 	nop
	...

bfc00790 <bitcount>:
bitcount():
bfc00790:	3c03aaaa 	lui	v1,0xaaaa
bfc00794:	3462aaaa 	ori	v0,v1,0xaaaa
bfc00798:	3c195555 	lui	t9,0x5555
bfc0079c:	00827824 	and	t7,a0,v0
bfc007a0:	37385555 	ori	t8,t9,0x5555
bfc007a4:	00987024 	and	t6,a0,t8
bfc007a8:	000f6842 	srl	t5,t7,0x1
bfc007ac:	3c0ccccc 	lui	t4,0xcccc
bfc007b0:	01ae4021 	addu	t0,t5,t6
bfc007b4:	358bcccc 	ori	t3,t4,0xcccc
bfc007b8:	3c0a3333 	lui	t2,0x3333
bfc007bc:	010b3824 	and	a3,t0,t3
bfc007c0:	35493333 	ori	t1,t2,0x3333
bfc007c4:	01092824 	and	a1,t0,t1
bfc007c8:	00072082 	srl	a0,a3,0x2
bfc007cc:	3c06f0f0 	lui	a2,0xf0f0
bfc007d0:	0085c021 	addu	t8,a0,a1
bfc007d4:	34c3f0f0 	ori	v1,a2,0xf0f0
bfc007d8:	3c020f0f 	lui	v0,0xf0f
bfc007dc:	03037824 	and	t7,t8,v1
bfc007e0:	34590f0f 	ori	t9,v0,0xf0f
bfc007e4:	03197024 	and	t6,t8,t9
bfc007e8:	000f6902 	srl	t5,t7,0x4
bfc007ec:	3c0cff00 	lui	t4,0xff00
bfc007f0:	01ae4021 	addu	t0,t5,t6
bfc007f4:	358bff00 	ori	t3,t4,0xff00
bfc007f8:	3c0a00ff 	lui	t2,0xff
bfc007fc:	010b3824 	and	a3,t0,t3
bfc00800:	354900ff 	ori	t1,t2,0xff
bfc00804:	01092824 	and	a1,t0,t1
bfc00808:	00073202 	srl	a2,a3,0x8
bfc0080c:	00c52021 	addu	a0,a2,a1
bfc00810:	00041c02 	srl	v1,a0,0x10
bfc00814:	3082ffff 	andi	v0,a0,0xffff
bfc00818:	03e00008 	jr	ra
bfc0081c:	00431021 	addu	v0,v0,v1

bfc00820 <ntbl_bitcount>:
ntbl_bitcount():
bfc00820:	3c088000 	lui	t0,0x8000
bfc00824:	250800b0 	addiu	t0,t0,176
bfc00828:	00046702 	srl	t4,a0,0x1c
bfc0082c:	308a000f 	andi	t2,a0,0xf
bfc00830:	308200f0 	andi	v0,a0,0xf0
bfc00834:	01882821 	addu	a1,t4,t0
bfc00838:	01483021 	addu	a2,t2,t0
bfc0083c:	00021902 	srl	v1,v0,0x4
bfc00840:	308b0f00 	andi	t3,a0,0xf00
bfc00844:	80ae0000 	lb	t6,0(a1)
bfc00848:	80c90000 	lb	t1,0(a2)
bfc0084c:	0068c821 	addu	t9,v1,t0
bfc00850:	000bc202 	srl	t8,t3,0x8
bfc00854:	308ff000 	andi	t7,a0,0xf000
bfc00858:	03083821 	addu	a3,t8,t0
bfc0085c:	832a0000 	lb	t2,0(t9)
bfc00860:	000f6b02 	srl	t5,t7,0xc
bfc00864:	00046402 	srl	t4,a0,0x10
bfc00868:	01c91021 	addu	v0,t6,t1
bfc0086c:	80eb0000 	lb	t3,0(a3)
bfc00870:	01a82821 	addu	a1,t5,t0
bfc00874:	3183000f 	andi	v1,t4,0xf
bfc00878:	00043502 	srl	a2,a0,0x14
bfc0087c:	004ac821 	addu	t9,v0,t2
bfc00880:	80a90000 	lb	t1,0(a1)
bfc00884:	0068c021 	addu	t8,v1,t0
bfc00888:	30cf000f 	andi	t7,a2,0xf
bfc0088c:	00047602 	srl	t6,a0,0x18
bfc00890:	032b6821 	addu	t5,t9,t3
bfc00894:	83070000 	lb	a3,0(t8)
bfc00898:	01e85821 	addu	t3,t7,t0
bfc0089c:	31cc000f 	andi	t4,t6,0xf
bfc008a0:	01a95021 	addu	t2,t5,t1
bfc008a4:	01882021 	addu	a0,t4,t0
bfc008a8:	81650000 	lb	a1,0(t3)
bfc008ac:	01473021 	addu	a2,t2,a3
bfc008b0:	80830000 	lb	v1,0(a0)
bfc008b4:	00c51021 	addu	v0,a2,a1
bfc008b8:	03e00008 	jr	ra
bfc008bc:	00431021 	addu	v0,v0,v1

bfc008c0 <BW_btbl_bitcount>:
BW_btbl_bitcount():
bfc008c0:	00041202 	srl	v0,a0,0x8
bfc008c4:	3c038000 	lui	v1,0x8000
bfc008c8:	246700b0 	addiu	a3,v1,176
bfc008cc:	305900ff 	andi	t9,v0,0xff
bfc008d0:	309800ff 	andi	t8,a0,0xff
bfc008d4:	00046402 	srl	t4,a0,0x10
bfc008d8:	00046e02 	srl	t5,a0,0x18
bfc008dc:	03277821 	addu	t7,t9,a3
bfc008e0:	03077021 	addu	t6,t8,a3
bfc008e4:	81e90000 	lb	t1,0(t7)
bfc008e8:	81c80000 	lb	t0,0(t6)
bfc008ec:	01a75021 	addu	t2,t5,a3
bfc008f0:	318b00ff 	andi	t3,t4,0xff
bfc008f4:	01673021 	addu	a2,t3,a3
bfc008f8:	81450000 	lb	a1,0(t2)
bfc008fc:	01282021 	addu	a0,t1,t0
bfc00900:	80c30000 	lb	v1,0(a2)
bfc00904:	00851021 	addu	v0,a0,a1
bfc00908:	03e00008 	jr	ra
bfc0090c:	00431021 	addu	v0,v0,v1

bfc00910 <AR_btbl_bitcount>:
AR_btbl_bitcount():
bfc00910:	00042a02 	srl	a1,a0,0x8
bfc00914:	3c068000 	lui	a2,0x8000
bfc00918:	24cc00b0 	addiu	t4,a2,176
bfc0091c:	30b900ff 	andi	t9,a1,0xff
bfc00920:	308200ff 	andi	v0,a0,0xff
bfc00924:	0004c402 	srl	t8,a0,0x10
bfc00928:	004c7821 	addu	t7,v0,t4
bfc0092c:	032c7021 	addu	t6,t9,t4
bfc00930:	330d00ff 	andi	t5,t8,0xff
bfc00934:	81e80000 	lb	t0,0(t7)
bfc00938:	81c90000 	lb	t1,0(t6)
bfc0093c:	01ac5021 	addu	t2,t5,t4
bfc00940:	00045e02 	srl	t3,a0,0x18
bfc00944:	016c1821 	addu	v1,t3,t4
bfc00948:	81470000 	lb	a3,0(t2)
bfc0094c:	01283021 	addu	a2,t1,t0
bfc00950:	80650000 	lb	a1,0(v1)
bfc00954:	00c71021 	addu	v0,a2,a3
bfc00958:	00451021 	addu	v0,v0,a1
bfc0095c:	03e00008 	jr	ra
bfc00960:	afa40000 	sw	a0,0(sp)
	...

bfc00970 <ntbl_bitcnt>:
ntbl_bitcnt():
bfc00970:	3c058000 	lui	a1,0x8000
bfc00974:	24a801b0 	addiu	t0,a1,432
bfc00978:	3083000f 	andi	v1,a0,0xf
bfc0097c:	27bdfff0 	addiu	sp,sp,-16
bfc00980:	00681021 	addu	v0,v1,t0
bfc00984:	00043903 	sra	a3,a0,0x4
bfc00988:	afb2000c 	sw	s2,12(sp)
bfc0098c:	afb10008 	sw	s1,8(sp)
bfc00990:	80450000 	lb	a1,0(v0)
bfc00994:	10e00042 	beqz	a3,bfc00aa0 <ntbl_bitcnt+0x130>
bfc00998:	afb00004 	sw	s0,4(sp)
bfc0099c:	00003021 	move	a2,zero
bfc009a0:	00072103 	sra	a0,a3,0x4
bfc009a4:	30ef000f 	andi	t7,a3,0xf
bfc009a8:	3089000f 	andi	t1,a0,0xf
bfc009ac:	01e81821 	addu	v1,t7,t0
bfc009b0:	01287821 	addu	t7,t1,t0
bfc009b4:	00074a03 	sra	t1,a3,0x8
bfc009b8:	312a000f 	andi	t2,t1,0xf
bfc009bc:	0148c021 	addu	t8,t2,t0
bfc009c0:	00075303 	sra	t2,a3,0xc
bfc009c4:	314b000f 	andi	t3,t2,0xf
bfc009c8:	0168c821 	addu	t9,t3,t0
bfc009cc:	00075c03 	sra	t3,a3,0x10
bfc009d0:	316c000f 	andi	t4,t3,0xf
bfc009d4:	01888021 	addu	s0,t4,t0
bfc009d8:	00076503 	sra	t4,a3,0x14
bfc009dc:	318d000f 	andi	t5,t4,0xf
bfc009e0:	01a88821 	addu	s1,t5,t0
bfc009e4:	00076e03 	sra	t5,a3,0x18
bfc009e8:	31ae000f 	andi	t6,t5,0xf
bfc009ec:	01c89021 	addu	s2,t6,t0
bfc009f0:	00077703 	sra	t6,a3,0x1c
bfc009f4:	31c2000f 	andi	v0,t6,0xf
bfc009f8:	00c53021 	addu	a2,a2,a1
bfc009fc:	00481021 	addu	v0,v0,t0
bfc00a00:	80650000 	lb	a1,0(v1)
bfc00a04:	1080001d 	beqz	a0,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a08:	00073fc3 	sra	a3,a3,0x1f
bfc00a0c:	00c53021 	addu	a2,a2,a1
bfc00a10:	81e50000 	lb	a1,0(t7)
bfc00a14:	11200019 	beqz	t1,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a18:	00000000 	nop
bfc00a1c:	00c53021 	addu	a2,a2,a1
bfc00a20:	83050000 	lb	a1,0(t8)
bfc00a24:	11400015 	beqz	t2,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a28:	00000000 	nop
bfc00a2c:	00c53021 	addu	a2,a2,a1
bfc00a30:	83250000 	lb	a1,0(t9)
bfc00a34:	11600011 	beqz	t3,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a38:	00000000 	nop
bfc00a3c:	00c53021 	addu	a2,a2,a1
bfc00a40:	82050000 	lb	a1,0(s0)
bfc00a44:	1180000d 	beqz	t4,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a48:	00000000 	nop
bfc00a4c:	00c53021 	addu	a2,a2,a1
bfc00a50:	82250000 	lb	a1,0(s1)
bfc00a54:	11a00009 	beqz	t5,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a58:	00000000 	nop
bfc00a5c:	00c53021 	addu	a2,a2,a1
bfc00a60:	82450000 	lb	a1,0(s2)
bfc00a64:	11c00005 	beqz	t6,bfc00a7c <ntbl_bitcnt+0x10c>
bfc00a68:	00000000 	nop
bfc00a6c:	00c53021 	addu	a2,a2,a1
bfc00a70:	80450000 	lb	a1,0(v0)
bfc00a74:	14e0ffcb 	bnez	a3,bfc009a4 <ntbl_bitcnt+0x34>
bfc00a78:	00072103 	sra	a0,a3,0x4
bfc00a7c:	00c51021 	addu	v0,a2,a1
bfc00a80:	8fb2000c 	lw	s2,12(sp)
bfc00a84:	8fb10008 	lw	s1,8(sp)
bfc00a88:	8fb00004 	lw	s0,4(sp)
bfc00a8c:	03e00008 	jr	ra
bfc00a90:	27bd0010 	addiu	sp,sp,16
	...
bfc00aa0:	0bf0029f 	j	bfc00a7c <ntbl_bitcnt+0x10c>
bfc00aa4:	00003021 	move	a2,zero
	...

bfc00ab0 <btbl_bitcnt>:
btbl_bitcnt():
bfc00ab0:	27bdffa8 	addiu	sp,sp,-88
bfc00ab4:	3c038000 	lui	v1,0x8000
bfc00ab8:	afb50044 	sw	s5,68(sp)
bfc00abc:	308500ff 	andi	a1,a0,0xff
bfc00ac0:	247501b0 	addiu	s5,v1,432
bfc00ac4:	00b51021 	addu	v0,a1,s5
bfc00ac8:	00043203 	sra	a2,a0,0x8
bfc00acc:	afb40040 	sw	s4,64(sp)
bfc00ad0:	afbf0054 	sw	ra,84(sp)
bfc00ad4:	afbe0050 	sw	s8,80(sp)
bfc00ad8:	afb7004c 	sw	s7,76(sp)
bfc00adc:	afb60048 	sw	s6,72(sp)
bfc00ae0:	afb3003c 	sw	s3,60(sp)
bfc00ae4:	afb20038 	sw	s2,56(sp)
bfc00ae8:	afb10034 	sw	s1,52(sp)
bfc00aec:	afb00030 	sw	s0,48(sp)
bfc00af0:	00801821 	move	v1,a0
bfc00af4:	80540000 	lb	s4,0(v0)
bfc00af8:	14c00011 	bnez	a2,bfc00b40 <btbl_bitcnt+0x90>
bfc00afc:	afa40058 	sw	a0,88(sp)
bfc00b00:	8fbf0054 	lw	ra,84(sp)
bfc00b04:	02801021 	move	v0,s4
bfc00b08:	8fbe0050 	lw	s8,80(sp)
bfc00b0c:	8fb7004c 	lw	s7,76(sp)
bfc00b10:	8fb60048 	lw	s6,72(sp)
bfc00b14:	8fb50044 	lw	s5,68(sp)
bfc00b18:	8fb40040 	lw	s4,64(sp)
bfc00b1c:	8fb3003c 	lw	s3,60(sp)
bfc00b20:	8fb20038 	lw	s2,56(sp)
bfc00b24:	8fb10034 	lw	s1,52(sp)
bfc00b28:	8fb00030 	lw	s0,48(sp)
bfc00b2c:	03e00008 	jr	ra
bfc00b30:	27bd0058 	addiu	sp,sp,88
	...
bfc00b40:	30c400ff 	andi	a0,a2,0xff
bfc00b44:	00953821 	addu	a3,a0,s5
bfc00b48:	00032403 	sra	a0,v1,0x10
bfc00b4c:	80f60000 	lb	s6,0(a3)
bfc00b50:	14800003 	bnez	a0,bfc00b60 <btbl_bitcnt+0xb0>
bfc00b54:	afa60010 	sw	a2,16(sp)
bfc00b58:	0bf002c0 	j	bfc00b00 <btbl_bitcnt+0x50>
bfc00b5c:	0296a021 	addu	s4,s4,s6
bfc00b60:	308800ff 	andi	t0,a0,0xff
bfc00b64:	01153021 	addu	a2,t0,s5
bfc00b68:	00032e03 	sra	a1,v1,0x18
bfc00b6c:	80d70000 	lb	s7,0(a2)
bfc00b70:	14a00007 	bnez	a1,bfc00b90 <btbl_bitcnt+0xe0>
bfc00b74:	afa40014 	sw	a0,20(sp)
bfc00b78:	02d7b021 	addu	s6,s6,s7
bfc00b7c:	0bf002c0 	j	bfc00b00 <btbl_bitcnt+0x50>
bfc00b80:	0296a021 	addu	s4,s4,s6
	...
bfc00b90:	30aa00ff 	andi	t2,a1,0xff
bfc00b94:	01554821 	addu	t1,t2,s5
bfc00b98:	000337c3 	sra	a2,v1,0x1f
bfc00b9c:	813e0000 	lb	s8,0(t1)
bfc00ba0:	14c00007 	bnez	a2,bfc00bc0 <btbl_bitcnt+0x110>
bfc00ba4:	afa50018 	sw	a1,24(sp)
bfc00ba8:	02feb821 	addu	s7,s7,s8
bfc00bac:	0bf002df 	j	bfc00b7c <btbl_bitcnt+0xcc>
bfc00bb0:	02d7b021 	addu	s6,s6,s7
	...
bfc00bc0:	30c200ff 	andi	v0,a2,0xff
bfc00bc4:	0055f821 	addu	ra,v0,s5
bfc00bc8:	83f00000 	lb	s0,0(ra)
bfc00bcc:	00c02021 	move	a0,a2
bfc00bd0:	afa6001c 	sw	a2,28(sp)
bfc00bd4:	afa60020 	sw	a2,32(sp)
bfc00bd8:	afa60024 	sw	a2,36(sp)
bfc00bdc:	afa60028 	sw	a2,40(sp)
bfc00be0:	0ff002ac 	jal	bfc00ab0 <btbl_bitcnt>
bfc00be4:	afa6002c 	sw	a2,44(sp)
bfc00be8:	03d0c821 	addu	t9,s8,s0
bfc00bec:	93af002c 	lbu	t7,44(sp)
bfc00bf0:	0322c021 	addu	t8,t9,v0
bfc00bf4:	03107021 	addu	t6,t8,s0
bfc00bf8:	01f56821 	addu	t5,t7,s5
bfc00bfc:	01d06021 	addu	t4,t6,s0
bfc00c00:	81ab0000 	lb	t3,0(t5)
bfc00c04:	01908021 	addu	s0,t4,s0
bfc00c08:	020bf021 	addu	s8,s0,t3
bfc00c0c:	0bf002eb 	j	bfc00bac <btbl_bitcnt+0xfc>
bfc00c10:	02feb821 	addu	s7,s7,s8
	...

bfc00c20 <bit_count>:
bit_count():
bfc00c20:	10800027 	beqz	a0,bfc00cc0 <bit_count+0xa0>
bfc00c24:	00801021 	move	v0,a0
bfc00c28:	00002821 	move	a1,zero
bfc00c2c:	2446ffff 	addiu	a2,v0,-1
bfc00c30:	00462024 	and	a0,v0,a2
bfc00c34:	2487ffff 	addiu	a3,a0,-1
bfc00c38:	00873024 	and	a2,a0,a3
bfc00c3c:	24c8ffff 	addiu	t0,a2,-1
bfc00c40:	00c83824 	and	a3,a2,t0
bfc00c44:	24e9ffff 	addiu	t1,a3,-1
bfc00c48:	00e94024 	and	t0,a3,t1
bfc00c4c:	250affff 	addiu	t2,t0,-1
bfc00c50:	010a4824 	and	t1,t0,t2
bfc00c54:	2522ffff 	addiu	v0,t1,-1
bfc00c58:	01225024 	and	t2,t1,v0
bfc00c5c:	2543ffff 	addiu	v1,t2,-1
bfc00c60:	24a50001 	addiu	a1,a1,1
bfc00c64:	01435824 	and	t3,t2,v1
bfc00c68:	10800011 	beqz	a0,bfc00cb0 <bit_count+0x90>
bfc00c6c:	00a01821 	move	v1,a1
bfc00c70:	256cffff 	addiu	t4,t3,-1
bfc00c74:	016c1024 	and	v0,t3,t4
bfc00c78:	10c0000d 	beqz	a2,bfc00cb0 <bit_count+0x90>
bfc00c7c:	24a50001 	addiu	a1,a1,1
bfc00c80:	10e0000b 	beqz	a3,bfc00cb0 <bit_count+0x90>
bfc00c84:	24650002 	addiu	a1,v1,2
bfc00c88:	11000009 	beqz	t0,bfc00cb0 <bit_count+0x90>
bfc00c8c:	24650003 	addiu	a1,v1,3
bfc00c90:	11200007 	beqz	t1,bfc00cb0 <bit_count+0x90>
bfc00c94:	24650004 	addiu	a1,v1,4
bfc00c98:	11400005 	beqz	t2,bfc00cb0 <bit_count+0x90>
bfc00c9c:	24650005 	addiu	a1,v1,5
bfc00ca0:	11600003 	beqz	t3,bfc00cb0 <bit_count+0x90>
bfc00ca4:	24650006 	addiu	a1,v1,6
bfc00ca8:	1440ffe0 	bnez	v0,bfc00c2c <bit_count+0xc>
bfc00cac:	24650007 	addiu	a1,v1,7
bfc00cb0:	03e00008 	jr	ra
bfc00cb4:	00a01021 	move	v0,a1
	...
bfc00cc0:	00002821 	move	a1,zero
bfc00cc4:	03e00008 	jr	ra
bfc00cc8:	00a01021 	move	v0,a1
bfc00ccc:	00000000 	nop

bfc00cd0 <printf>:
printf():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00cd0:	27bdffc8 	addiu	sp,sp,-56
bfc00cd4:	afb30024 	sw	s3,36(sp)
bfc00cd8:	afbf0034 	sw	ra,52(sp)
bfc00cdc:	afb60030 	sw	s6,48(sp)
bfc00ce0:	afb5002c 	sw	s5,44(sp)
bfc00ce4:	afb40028 	sw	s4,40(sp)
bfc00ce8:	afb20020 	sw	s2,32(sp)
bfc00cec:	afb1001c 	sw	s1,28(sp)
bfc00cf0:	afb00018 	sw	s0,24(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00cf4:	80900000 	lb	s0,0(a0)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00cf8:	00809821 	move	s3,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:8
bfc00cfc:	27a4003c 	addiu	a0,sp,60
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:2
bfc00d00:	afa5003c 	sw	a1,60(sp)
bfc00d04:	afa60040 	sw	a2,64(sp)
bfc00d08:	afa70044 	sw	a3,68(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d0c:	12000013 	beqz	s0,bfc00d5c <printf+0x8c>
bfc00d10:	afa40010 	sw	a0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d14:	3c028000 	lui	v0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d18:	00809021 	move	s2,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d1c:	245602b0 	addiu	s6,v0,688
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:9
bfc00d20:	00008821 	move	s1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d24:	24140025 	li	s4,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d28:	2415000a 	li	s5,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d2c:	12140016 	beq	s0,s4,bfc00d88 <printf+0xb8>
bfc00d30:	02711021 	addu	v0,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00d34:	1215002f 	beq	s0,s5,bfc00df4 <printf+0x124>
bfc00d38:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:80
bfc00d3c:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00d40:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00d44:	26310001 	addiu	s1,s1,1
bfc00d48:	02711021 	addu	v0,s3,s1
bfc00d4c:	80500000 	lb	s0,0(v0)
bfc00d50:	00000000 	nop
bfc00d54:	1600fff5 	bnez	s0,bfc00d2c <printf+0x5c>
bfc00d58:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:84
bfc00d5c:	8fbf0034 	lw	ra,52(sp)
bfc00d60:	00001021 	move	v0,zero
bfc00d64:	8fb60030 	lw	s6,48(sp)
bfc00d68:	8fb5002c 	lw	s5,44(sp)
bfc00d6c:	8fb40028 	lw	s4,40(sp)
bfc00d70:	8fb30024 	lw	s3,36(sp)
bfc00d74:	8fb20020 	lw	s2,32(sp)
bfc00d78:	8fb1001c 	lw	s1,28(sp)
bfc00d7c:	8fb00018 	lw	s0,24(sp)
bfc00d80:	03e00008 	jr	ra
bfc00d84:	27bd0038 	addiu	sp,sp,56
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:13
bfc00d88:	80440001 	lb	a0,1(v0)
bfc00d8c:	24050001 	li	a1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00d90:	2482ffdb 	addiu	v0,a0,-37
bfc00d94:	304200ff 	andi	v0,v0,0xff
bfc00d98:	2c430054 	sltiu	v1,v0,84
bfc00d9c:	14600005 	bnez	v1,bfc00db4 <printf+0xe4>
bfc00da0:	00021080 	sll	v0,v0,0x2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:73
bfc00da4:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00da8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:10
bfc00dac:	0bf00352 	j	bfc00d48 <printf+0x78>
bfc00db0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00db4:	02c21021 	addu	v0,s6,v0
bfc00db8:	8c430000 	lw	v1,0(v0)
bfc00dbc:	00000000 	nop
bfc00dc0:	00600008 	jr	v1
bfc00dc4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:65
bfc00dc8:	26310001 	addiu	s1,s1,1
bfc00dcc:	02711021 	addu	v0,s3,s1
bfc00dd0:	80440001 	lb	a0,1(v0)
bfc00dd4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00dd8:	2482ffcf 	addiu	v0,a0,-49
bfc00ddc:	304200ff 	andi	v0,v0,0xff
bfc00de0:	2c420009 	sltiu	v0,v0,9
bfc00de4:	1440003f 	bnez	v0,bfc00ee4 <printf+0x214>
bfc00de8:	00002821 	move	a1,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:17
bfc00dec:	0bf00365 	j	bfc00d94 <printf+0xc4>
bfc00df0:	2482ffdb 	addiu	v0,a0,-37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:79
bfc00df4:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00df8:	2404000d 	li	a0,13
bfc00dfc:	0bf0034f 	j	bfc00d3c <printf+0x6c>
bfc00e00:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:30
bfc00e04:	8e440000 	lw	a0,0(s2)
bfc00e08:	2406000a 	li	a2,10
bfc00e0c:	0ff00408 	jal	bfc01020 <printbase>
bfc00e10:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:31
bfc00e14:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:32
bfc00e18:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00e1c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:20
bfc00e20:	8e440000 	lw	a0,0(s2)
bfc00e24:	0ff003d8 	jal	bfc00f60 <putstring>
bfc00e28:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:21
bfc00e2c:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00e30:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:56
bfc00e34:	8e440000 	lw	a0,0(s2)
bfc00e38:	24060010 	li	a2,16
bfc00e3c:	0ff00408 	jal	bfc01020 <printbase>
bfc00e40:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:57
bfc00e44:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:58
bfc00e48:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00e4c:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:45
bfc00e50:	8e440000 	lw	a0,0(s2)
bfc00e54:	24060008 	li	a2,8
bfc00e58:	0ff00408 	jal	bfc01020 <printbase>
bfc00e5c:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:46
bfc00e60:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:47
bfc00e64:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00e68:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:40
bfc00e6c:	8e440000 	lw	a0,0(s2)
bfc00e70:	2406000a 	li	a2,10
bfc00e74:	0ff00408 	jal	bfc01020 <printbase>
bfc00e78:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:41
bfc00e7c:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:42
bfc00e80:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00e84:	26310002 	addiu	s1,s1,2
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:35
bfc00e88:	8e440000 	lw	a0,0(s2)
bfc00e8c:	2406000a 	li	a2,10
bfc00e90:	0ff00408 	jal	bfc01020 <printbase>
bfc00e94:	24070001 	li	a3,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:36
bfc00e98:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:37
bfc00e9c:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00ea0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:25
bfc00ea4:	8e440000 	lw	a0,0(s2)
bfc00ea8:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00eac:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:26
bfc00eb0:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00eb4:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:50
bfc00eb8:	8e440000 	lw	a0,0(s2)
bfc00ebc:	24060002 	li	a2,2
bfc00ec0:	0ff00408 	jal	bfc01020 <printbase>
bfc00ec4:	00003821 	move	a3,zero
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:51
bfc00ec8:	26520004 	addiu	s2,s2,4
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:52
bfc00ecc:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00ed0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:61
bfc00ed4:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00ed8:	24040025 	li	a0,37
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:62
bfc00edc:	0bf00351 	j	bfc00d44 <printf+0x74>
bfc00ee0:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ee4:	02713021 	addu	a2,s3,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00ee8:	000510c0 	sll	v0,a1,0x3
bfc00eec:	00051840 	sll	v1,a1,0x1
bfc00ef0:	00621821 	addu	v1,v1,v0
bfc00ef4:	00641821 	addu	v1,v1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00ef8:	80c40002 	lb	a0,2(a2)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00efc:	2465ffd0 	addiu	a1,v1,-48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:67
bfc00f00:	2482ffcf 	addiu	v0,a0,-49
bfc00f04:	304200ff 	andi	v0,v0,0xff
bfc00f08:	2c420009 	sltiu	v0,v0,9
bfc00f0c:	26310001 	addiu	s1,s1,1
bfc00f10:	1040ff9f 	beqz	v0,bfc00d90 <printf+0xc0>
bfc00f14:	24c60001 	addiu	a2,a2,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printf.c:68
bfc00f18:	0bf003bb 	j	bfc00eec <printf+0x21c>
bfc00f1c:	000510c0 	sll	v0,a1,0x3

bfc00f20 <tgt_putchar>:
tgt_putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:9
bfc00f20:	3c018000 	lui	at,0x8000
bfc00f24:	03e00008 	jr	ra
bfc00f28:	a0247ffc 	sb	a0,32764(at)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:18
bfc00f2c:	03e00008 	jr	ra
bfc00f30:	00000000 	nop

bfc00f34 <putchar>:
putchar():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:2
bfc00f34:	27bdffe8 	addiu	sp,sp,-24
bfc00f38:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:3
bfc00f3c:	0ff003c8 	jal	bfc00f20 <tgt_putchar>
bfc00f40:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/putchar.c:5
bfc00f44:	8fbf0014 	lw	ra,20(sp)
bfc00f48:	00001021 	move	v0,zero
bfc00f4c:	03e00008 	jr	ra
bfc00f50:	27bd0018 	addiu	sp,sp,24
	...

bfc00f60 <putstring>:
putstring():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:2
bfc00f60:	27bdffe0 	addiu	sp,sp,-32
bfc00f64:	afb10014 	sw	s1,20(sp)
bfc00f68:	afbf001c 	sw	ra,28(sp)
bfc00f6c:	afb20018 	sw	s2,24(sp)
bfc00f70:	afb00010 	sw	s0,16(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00f74:	80900000 	lb	s0,0(a0)
bfc00f78:	00000000 	nop
bfc00f7c:	12000013 	beqz	s0,bfc00fcc <putstring+0x6c>
bfc00f80:	00808821 	move	s1,a0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00f84:	0bf003e9 	j	bfc00fa4 <putstring+0x44>
bfc00f88:	2412000a 	li	s2,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00f8c:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00f90:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00f94:	82300000 	lb	s0,0(s1)
bfc00f98:	00000000 	nop
bfc00f9c:	1200000b 	beqz	s0,bfc00fcc <putstring+0x6c>
bfc00fa0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:6
bfc00fa4:	1612fff9 	bne	s0,s2,bfc00f8c <putstring+0x2c>
bfc00fa8:	26310001 	addiu	s1,s1,1
bfc00fac:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00fb0:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:7
bfc00fb4:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00fb8:	02002021 	move	a0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:4
bfc00fbc:	82300000 	lb	s0,0(s1)
bfc00fc0:	00000000 	nop
bfc00fc4:	1600fff7 	bnez	s0,bfc00fa4 <putstring+0x44>
bfc00fc8:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:11
bfc00fcc:	8fbf001c 	lw	ra,28(sp)
bfc00fd0:	00001021 	move	v0,zero
bfc00fd4:	8fb20018 	lw	s2,24(sp)
bfc00fd8:	8fb10014 	lw	s1,20(sp)
bfc00fdc:	8fb00010 	lw	s0,16(sp)
bfc00fe0:	03e00008 	jr	ra
bfc00fe4:	27bd0020 	addiu	sp,sp,32

bfc00fe8 <puts>:
puts():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:15
bfc00fe8:	27bdffe8 	addiu	sp,sp,-24
bfc00fec:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:16
bfc00ff0:	0ff003d8 	jal	bfc00f60 <putstring>
bfc00ff4:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:17
bfc00ff8:	0ff003cd 	jal	bfc00f34 <putchar>
bfc00ffc:	2404000d 	li	a0,13
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:18
bfc01000:	0ff003cd 	jal	bfc00f34 <putchar>
bfc01004:	2404000a 	li	a0,10
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/puts.c:20
bfc01008:	8fbf0014 	lw	ra,20(sp)
bfc0100c:	00001021 	move	v0,zero
bfc01010:	03e00008 	jr	ra
bfc01014:	27bd0018 	addiu	sp,sp,24
	...

bfc01020 <printbase>:
printbase():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc01020:	27bdff98 	addiu	sp,sp,-104
bfc01024:	afb30060 	sw	s3,96(sp)
bfc01028:	afb2005c 	sw	s2,92(sp)
bfc0102c:	afbf0064 	sw	ra,100(sp)
bfc01030:	afb10058 	sw	s1,88(sp)
bfc01034:	afb00054 	sw	s0,84(sp)
bfc01038:	00801821 	move	v1,a0
bfc0103c:	00a09821 	move	s3,a1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:7
bfc01040:	10e00003 	beqz	a3,bfc01050 <printbase+0x30>
bfc01044:	00c09021 	move	s2,a2
bfc01048:	0480002f 	bltz	a0,bfc01108 <printbase+0xe8>
bfc0104c:	2404002d 	li	a0,45
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:12
bfc01050:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01054:	1200000c 	beqz	s0,bfc01088 <printbase+0x68>
bfc01058:	00008821 	move	s1,zero
bfc0105c:	27a50010 	addiu	a1,sp,16
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01060:	16400002 	bnez	s2,bfc0106c <printbase+0x4c>
bfc01064:	0212001b 	divu	zero,s0,s2
bfc01068:	0007000d 	break	0x7
bfc0106c:	00b12021 	addu	a0,a1,s1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01070:	26310001 	addiu	s1,s1,1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:16
bfc01074:	00001010 	mfhi	v0
bfc01078:	a0820000 	sb	v0,0(a0)
bfc0107c:	00001812 	mflo	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:14
bfc01080:	1460fff7 	bnez	v1,bfc01060 <printbase+0x40>
bfc01084:	00608021 	move	s0,v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc01088:	0233102a 	slt	v0,s1,s3
bfc0108c:	10400002 	beqz	v0,bfc01098 <printbase+0x78>
bfc01090:	02201821 	move	v1,s1
bfc01094:	02601821 	move	v1,s3
bfc01098:	1060000c 	beqz	v1,bfc010cc <printbase+0xac>
bfc0109c:	2470ffff 	addiu	s0,v1,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:2
bfc010a0:	27a20010 	addiu	v0,sp,16
bfc010a4:	00509021 	addu	s2,v0,s0
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc010a8:	26020001 	addiu	v0,s0,1
bfc010ac:	0222102a 	slt	v0,s1,v0
bfc010b0:	1040000e 	beqz	v0,bfc010ec <printbase+0xcc>
bfc010b4:	24040030 	li	a0,48
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc010b8:	02009821 	move	s3,s0
bfc010bc:	0ff003cd 	jal	bfc00f34 <putchar>
bfc010c0:	2610ffff 	addiu	s0,s0,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:22
bfc010c4:	1660fff8 	bnez	s3,bfc010a8 <printbase+0x88>
bfc010c8:	2652ffff 	addiu	s2,s2,-1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:28
bfc010cc:	8fbf0064 	lw	ra,100(sp)
bfc010d0:	00001021 	move	v0,zero
bfc010d4:	8fb30060 	lw	s3,96(sp)
bfc010d8:	8fb2005c 	lw	s2,92(sp)
bfc010dc:	8fb10058 	lw	s1,88(sp)
bfc010e0:	8fb00054 	lw	s0,84(sp)
bfc010e4:	03e00008 	jr	ra
bfc010e8:	27bd0068 	addiu	sp,sp,104
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:24
bfc010ec:	82440000 	lb	a0,0(s2)
bfc010f0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc010f4:	2882000a 	slti	v0,a0,10
bfc010f8:	14400007 	bnez	v0,bfc01118 <printbase+0xf8>
bfc010fc:	02009821 	move	s3,s0
bfc01100:	0bf0042f 	j	bfc010bc <printbase+0x9c>
bfc01104:	24840057 	addiu	a0,a0,87
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:10
bfc01108:	0ff003cd 	jal	bfc00f34 <putchar>
bfc0110c:	00038023 	negu	s0,v1
bfc01110:	0bf00415 	j	bfc01054 <printbase+0x34>
bfc01114:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/printbase.c:25
bfc01118:	0bf0042e 	j	bfc010b8 <printbase+0x98>
bfc0111c:	24840030 	addiu	a0,a0,48

bfc01120 <_get_count>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:15
bfc01120:	3c01bfd0 	lui	at,0xbfd0
bfc01124:	3421e000 	ori	at,at,0xe000
bfc01128:	8c220000 	lw	v0,0(at)
bfc0112c:	03e00008 	jr	ra
bfc01130:	00000000 	nop

bfc01134 <get_count>:
get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:20
bfc01134:	3c01bfd0 	lui	at,0xbfd0
bfc01138:	3421e000 	ori	at,at,0xe000
bfc0113c:	8c220000 	lw	v0,0(at)
bfc01140:	03e00008 	jr	ra
bfc01144:	00000000 	nop

bfc01148 <get_clock>:
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc01148:	3c01bfd0 	lui	at,0xbfd0
bfc0114c:	3421e000 	ori	at,at,0xe000
bfc01150:	8c220000 	lw	v0,0(at)
get_clock():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:39
bfc01154:	03e00008 	jr	ra
bfc01158:	00021040 	sll	v0,v0,0x1

bfc0115c <get_ns>:
get_ns():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:47
bfc0115c:	3c01bfd0 	lui	at,0xbfd0
bfc01160:	3421e000 	ori	at,at,0xe000
bfc01164:	8c220000 	lw	v0,0(at)
bfc01168:	03e00008 	jr	ra
bfc0116c:	00000000 	nop

bfc01170 <clock_gettime>:
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:23
bfc01170:	27bdffe8 	addiu	sp,sp,-24
bfc01174:	afbf0014 	sw	ra,20(sp)
bfc01178:	00a04821 	move	t1,a1
_get_count():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:6
bfc0117c:	3c01bfd0 	lui	at,0xbfd0
bfc01180:	3421e000 	ori	at,at,0xe000
bfc01184:	8c230000 	lw	v1,0(at)
clock_gettime():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01188:	240203e8 	li	v0,1000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc0118c:	14400002 	bnez	v0,bfc01198 <clock_gettime+0x28>
bfc01190:	0062001b 	divu	zero,v1,v0
bfc01194:	0007000d 	break	0x7
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc01198:	00031840 	sll	v1,v1,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc0119c:	3c073b9a 	lui	a3,0x3b9a
bfc011a0:	34e7ca00 	ori	a3,a3,0xca00
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc011a4:	3c048000 	lui	a0,0x8000
bfc011a8:	24840400 	addiu	a0,a0,1024
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc011ac:	00003012 	mflo	a2
bfc011b0:	00063040 	sll	a2,a2,0x1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:26
bfc011b4:	14400002 	bnez	v0,bfc011c0 <clock_gettime+0x50>
bfc011b8:	0062001b 	divu	zero,v1,v0
bfc011bc:	0007000d 	break	0x7
bfc011c0:	00002810 	mfhi	a1
bfc011c4:	ad250004 	sw	a1,4(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:27
bfc011c8:	14400002 	bnez	v0,bfc011d4 <clock_gettime+0x64>
bfc011cc:	00c2001b 	divu	zero,a2,v0
bfc011d0:	0007000d 	break	0x7
bfc011d4:	00005010 	mfhi	t2
bfc011d8:	ad2a0008 	sw	t2,8(t1)
bfc011dc:	00004012 	mflo	t0
bfc011e0:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:29
bfc011e4:	14e00002 	bnez	a3,bfc011f0 <clock_gettime+0x80>
bfc011e8:	00c7001b 	divu	zero,a2,a3
bfc011ec:	0007000d 	break	0x7
bfc011f0:	00003012 	mflo	a2
bfc011f4:	ad260000 	sw	a2,0(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:28
bfc011f8:	14400002 	bnez	v0,bfc01204 <clock_gettime+0x94>
bfc011fc:	0102001b 	divu	zero,t0,v0
bfc01200:	0007000d 	break	0x7
bfc01204:	00001810 	mfhi	v1
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:30
bfc01208:	0ff00334 	jal	bfc00cd0 <printf>
bfc0120c:	ad23000c 	sw	v1,12(t1)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/time.c:32
bfc01210:	8fbf0014 	lw	ra,20(sp)
bfc01214:	00001021 	move	v0,zero
bfc01218:	03e00008 	jr	ra
bfc0121c:	27bd0018 	addiu	sp,sp,24

bfc01220 <get_epc>:
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc01220:	40027000 	mfc0	v0,c0_epc
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:9
bfc01224:	03e00008 	jr	ra
bfc01228:	00000000 	nop

bfc0122c <get_cause>:
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc0122c:	40026800 	mfc0	v0,c0_cause
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:19
bfc01230:	03e00008 	jr	ra
bfc01234:	00000000 	nop

bfc01238 <exception>:
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc01238:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:22
bfc0123c:	27bdffe8 	addiu	sp,sp,-24
bfc01240:	afbf0014 	sw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:24
bfc01244:	0ff00334 	jal	bfc00cd0 <printf>
bfc01248:	24840414 	addiu	a0,a0,1044
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc0124c:	3c048000 	lui	a0,0x8000
bfc01250:	24840430 	addiu	a0,a0,1072
get_epc():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:4
bfc01254:	40057000 	mfc0	a1,c0_epc
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:26
bfc01258:	0ff00334 	jal	bfc00cd0 <printf>
bfc0125c:	00000000 	nop
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01260:	3c048000 	lui	a0,0x8000
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc01264:	8fbf0014 	lw	ra,20(sp)
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01268:	24840440 	addiu	a0,a0,1088
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:30
bfc0126c:	27bd0018 	addiu	sp,sp,24
get_cause():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:14
bfc01270:	40056800 	mfc0	a1,c0_cause
exception():
/home/ucas/cpu_open/perf_test_v1.00/soft/lib/exception.c:28
bfc01274:	0bf00334 	j	bfc00cd0 <printf>
bfc01278:	00000000 	nop
bfc0127c:	00000000 	nop
