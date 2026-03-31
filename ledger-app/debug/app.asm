
build/nanos2/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <app_main>:
c0de0000:	480a      	ldr	r0, [pc, #40]	@ (c0de002c <app_main+0x2c>)
c0de0002:	217c      	movs	r1, #124	@ 0x7c
c0de0004:	4448      	add	r0, r9
c0de0006:	f002 f8cd 	bl	c0de21a4 <explicit_bzero>
c0de000a:	4809      	ldr	r0, [pc, #36]	@ (c0de0030 <app_main+0x30>)
c0de000c:	f44f 7188 	mov.w	r1, #272	@ 0x110
c0de0010:	4448      	add	r0, r9
c0de0012:	f002 f8c3 	bl	c0de219c <__aeabi_memclr>
c0de0016:	f000 fdaf 	bl	c0de0b78 <io_seproxyhal_init>
c0de001a:	2000      	movs	r0, #0
c0de001c:	f000 fdcc 	bl	c0de0bb8 <USB_power>
c0de0020:	2001      	movs	r0, #1
c0de0022:	f000 fdc9 	bl	c0de0bb8 <USB_power>
c0de0026:	f000 f813 	bl	c0de0050 <app_main_impl>
c0de002a:	bf00      	nop
c0de002c:	00000000 	.word	0x00000000
c0de0030:	000003c4 	.word	0x000003c4

c0de0034 <main>:
c0de0034:	b510      	push	{r4, lr}
c0de0036:	4604      	mov	r4, r0
c0de0038:	b662      	cpsie	i
c0de003a:	f001 ff8b 	bl	c0de1f54 <os_boot>
c0de003e:	b90c      	cbnz	r4, c0de0044 <main+0x10>
c0de0040:	f001 fdc6 	bl	c0de1bd0 <standalone_app_main>
c0de0044:	2000      	movs	r0, #0
c0de0046:	bd10      	pop	{r4, pc}

c0de0048 <app_exit>:
c0de0048:	20ff      	movs	r0, #255	@ 0xff
c0de004a:	f002 f817 	bl	c0de207c <os_sched_exit>
	...

c0de0050 <app_main_impl>:
c0de0050:	b0ce      	sub	sp, #312	@ 0x138
c0de0052:	f04f 0b00 	mov.w	fp, #0
c0de0056:	f8df a3a0 	ldr.w	sl, [pc, #928]	@ c0de03f8 <app_main_impl+0x3a8>
c0de005a:	2767      	movs	r7, #103	@ 0x67
c0de005c:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de0060:	f8ad b04a 	strh.w	fp, [sp, #74]	@ 0x4a
c0de0064:	f8ad b048 	strh.w	fp, [sp, #72]	@ 0x48
c0de0068:	f88d b047 	strb.w	fp, [sp, #71]	@ 0x47
c0de006c:	a83b      	add	r0, sp, #236	@ 0xec
c0de006e:	3009      	adds	r0, #9
c0de0070:	9004      	str	r0, [sp, #16]
c0de0072:	ae05      	add	r6, sp, #20
c0de0074:	4630      	mov	r0, r6
c0de0076:	f002 f8b1 	bl	c0de21dc <setjmp>
c0de007a:	b284      	uxth	r4, r0
c0de007c:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de0080:	b35c      	cbz	r4, c0de00da <app_main_impl+0x8a>
c0de0082:	2c05      	cmp	r4, #5
c0de0084:	f000 81ae 	beq.w	c0de03e4 <app_main_impl+0x394>
c0de0088:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de008a:	f8ad b040 	strh.w	fp, [sp, #64]	@ 0x40
c0de008e:	f002 f833 	bl	c0de20f8 <try_context_set>
c0de0092:	f5a4 40c0 	sub.w	r0, r4, #24576	@ 0x6000
c0de0096:	4649      	mov	r1, r9
c0de0098:	f8ad b048 	strh.w	fp, [sp, #72]	@ 0x48
c0de009c:	f5b0 5f40 	cmp.w	r0, #12288	@ 0x3000
c0de00a0:	bf28      	it	cs
c0de00a2:	462c      	movcs	r4, r5
c0de00a4:	f8bd 2048 	ldrh.w	r2, [sp, #72]	@ 0x48
c0de00a8:	eb09 010a 	add.w	r1, r9, sl
c0de00ac:	0a20      	lsrs	r0, r4, #8
c0de00ae:	5488      	strb	r0, [r1, r2]
c0de00b0:	1c50      	adds	r0, r2, #1
c0de00b2:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de00b6:	f8bd 0048 	ldrh.w	r0, [sp, #72]	@ 0x48
c0de00ba:	540c      	strb	r4, [r1, r0]
c0de00bc:	3001      	adds	r0, #1
c0de00be:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de00c2:	f002 f811 	bl	c0de20e8 <try_context_get>
c0de00c6:	42b0      	cmp	r0, r6
c0de00c8:	d102      	bne.n	c0de00d0 <app_main_impl+0x80>
c0de00ca:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de00cc:	f002 f814 	bl	c0de20f8 <try_context_set>
c0de00d0:	f8bd 0040 	ldrh.w	r0, [sp, #64]	@ 0x40
c0de00d4:	2800      	cmp	r0, #0
c0de00d6:	d0cd      	beq.n	c0de0074 <app_main_impl+0x24>
c0de00d8:	e182      	b.n	c0de03e0 <app_main_impl+0x390>
c0de00da:	4630      	mov	r0, r6
c0de00dc:	f002 f80c 	bl	c0de20f8 <try_context_set>
c0de00e0:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de00e2:	f89d 0047 	ldrb.w	r0, [sp, #71]	@ 0x47
c0de00e6:	f8bd 1048 	ldrh.w	r1, [sp, #72]	@ 0x48
c0de00ea:	f000 fba9 	bl	c0de0840 <io_exchange>
c0de00ee:	f8ad 004a 	strh.w	r0, [sp, #74]	@ 0x4a
c0de00f2:	f88d b047 	strb.w	fp, [sp, #71]	@ 0x47
c0de00f6:	f8ad b048 	strh.w	fp, [sp, #72]	@ 0x48
c0de00fa:	f8bd 004a 	ldrh.w	r0, [sp, #74]	@ 0x4a
c0de00fe:	2803      	cmp	r0, #3
c0de0100:	d806      	bhi.n	c0de0110 <app_main_impl+0xc0>
c0de0102:	4648      	mov	r0, r9
c0de0104:	f8bd 1048 	ldrh.w	r1, [sp, #72]	@ 0x48
c0de0108:	eb09 000a 	add.w	r0, r9, sl
c0de010c:	5447      	strb	r7, [r0, r1]
c0de010e:	e02f      	b.n	c0de0170 <app_main_impl+0x120>
c0de0110:	4648      	mov	r0, r9
c0de0112:	f819 100a 	ldrb.w	r1, [r9, sl]
c0de0116:	eb09 000a 	add.w	r0, r9, sl
c0de011a:	7840      	ldrb	r0, [r0, #1]
c0de011c:	f8bd 204a 	ldrh.w	r2, [sp, #74]	@ 0x4a
c0de0120:	29e0      	cmp	r1, #224	@ 0xe0
c0de0122:	d11e      	bne.n	c0de0162 <app_main_impl+0x112>
c0de0124:	2100      	movs	r1, #0
c0de0126:	2a05      	cmp	r2, #5
c0de0128:	d330      	bcc.n	c0de018c <app_main_impl+0x13c>
c0de012a:	464a      	mov	r2, r9
c0de012c:	4688      	mov	r8, r1
c0de012e:	eb09 020a 	add.w	r2, r9, sl
c0de0132:	7912      	ldrb	r2, [r2, #4]
c0de0134:	b35a      	cbz	r2, c0de018e <app_main_impl+0x13e>
c0de0136:	f8bd 304a 	ldrh.w	r3, [sp, #74]	@ 0x4a
c0de013a:	f8bd 404a 	ldrh.w	r4, [sp, #74]	@ 0x4a
c0de013e:	1d51      	adds	r1, r2, #5
c0de0140:	42a1      	cmp	r1, r4
c0de0142:	bf88      	it	hi
c0de0144:	2200      	movhi	r2, #0
c0de0146:	4299      	cmp	r1, r3
c0de0148:	4659      	mov	r1, fp
c0de014a:	464b      	mov	r3, r9
c0de014c:	bf98      	it	ls
c0de014e:	2101      	movls	r1, #1
c0de0150:	f011 0801 	ands.w	r8, r1, #1
c0de0154:	eb09 030a 	add.w	r3, r9, sl
c0de0158:	4611      	mov	r1, r2
c0de015a:	bf18      	it	ne
c0de015c:	f103 0805 	addne.w	r8, r3, #5
c0de0160:	e015      	b.n	c0de018e <app_main_impl+0x13e>
c0de0162:	4648      	mov	r0, r9
c0de0164:	f8bd 1048 	ldrh.w	r1, [sp, #72]	@ 0x48
c0de0168:	226e      	movs	r2, #110	@ 0x6e
c0de016a:	eb09 000a 	add.w	r0, r9, sl
c0de016e:	5442      	strb	r2, [r0, r1]
c0de0170:	1c48      	adds	r0, r1, #1
c0de0172:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de0176:	f8bd 0048 	ldrh.w	r0, [sp, #72]	@ 0x48
c0de017a:	1c41      	adds	r1, r0, #1
c0de017c:	f8ad 1048 	strh.w	r1, [sp, #72]	@ 0x48
c0de0180:	4649      	mov	r1, r9
c0de0182:	eb09 010a 	add.w	r1, r9, sl
c0de0186:	f801 b000 	strb.w	fp, [r1, r0]
c0de018a:	e773      	b.n	c0de0074 <app_main_impl+0x24>
c0de018c:	4688      	mov	r8, r1
c0de018e:	4c9c      	ldr	r4, [pc, #624]	@ (c0de0400 <app_main_impl+0x3b0>)
c0de0190:	2804      	cmp	r0, #4
c0de0192:	447c      	add	r4, pc
c0de0194:	d04c      	beq.n	c0de0230 <app_main_impl+0x1e0>
c0de0196:	2801      	cmp	r0, #1
c0de0198:	d015      	beq.n	c0de01c6 <app_main_impl+0x176>
c0de019a:	2802      	cmp	r0, #2
c0de019c:	d03e      	beq.n	c0de021c <app_main_impl+0x1cc>
c0de019e:	2803      	cmp	r0, #3
c0de01a0:	d02c      	beq.n	c0de01fc <app_main_impl+0x1ac>
c0de01a2:	2800      	cmp	r0, #0
c0de01a4:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de01a8:	d13f      	bne.n	c0de022a <app_main_impl+0x1da>
c0de01aa:	4648      	mov	r0, r9
c0de01ac:	2101      	movs	r1, #1
c0de01ae:	eb09 000a 	add.w	r0, r9, sl
c0de01b2:	f809 100a 	strb.w	r1, [r9, sl]
c0de01b6:	2103      	movs	r1, #3
c0de01b8:	70c1      	strb	r1, [r0, #3]
c0de01ba:	f880 b002 	strb.w	fp, [r0, #2]
c0de01be:	f880 b001 	strb.w	fp, [r0, #1]
c0de01c2:	2004      	movs	r0, #4
c0de01c4:	e06e      	b.n	c0de02a4 <app_main_impl+0x254>
c0de01c6:	2905      	cmp	r1, #5
c0de01c8:	d32a      	bcc.n	c0de0220 <app_main_impl+0x1d0>
c0de01ca:	f898 4000 	ldrb.w	r4, [r8]
c0de01ce:	b33c      	cbz	r4, c0de0220 <app_main_impl+0x1d0>
c0de01d0:	2c0a      	cmp	r4, #10
c0de01d2:	d825      	bhi.n	c0de0220 <app_main_impl+0x1d0>
c0de01d4:	00a0      	lsls	r0, r4, #2
c0de01d6:	3001      	adds	r0, #1
c0de01d8:	b2c0      	uxtb	r0, r0
c0de01da:	4288      	cmp	r0, r1
c0de01dc:	d81b      	bhi.n	c0de0216 <app_main_impl+0x1c6>
c0de01de:	2700      	movs	r7, #0
c0de01e0:	9403      	str	r4, [sp, #12]
c0de01e2:	42bc      	cmp	r4, r7
c0de01e4:	f000 8081 	beq.w	c0de02ea <app_main_impl+0x29a>
c0de01e8:	f000 fa1f 	bl	c0de062a <OUTLINED_FUNCTION_0>
c0de01ec:	4a83      	ldr	r2, [pc, #524]	@ (c0de03fc <app_main_impl+0x3ac>)
c0de01ee:	4649      	mov	r1, r9
c0de01f0:	eb09 0102 	add.w	r1, r9, r2
c0de01f4:	f841 0027 	str.w	r0, [r1, r7, lsl #2]
c0de01f8:	3701      	adds	r7, #1
c0de01fa:	e7f2      	b.n	c0de01e2 <app_main_impl+0x192>
c0de01fc:	2905      	cmp	r1, #5
c0de01fe:	d30f      	bcc.n	c0de0220 <app_main_impl+0x1d0>
c0de0200:	f898 4000 	ldrb.w	r4, [r8]
c0de0204:	b164      	cbz	r4, c0de0220 <app_main_impl+0x1d0>
c0de0206:	2c0a      	cmp	r4, #10
c0de0208:	d80a      	bhi.n	c0de0220 <app_main_impl+0x1d0>
c0de020a:	00a0      	lsls	r0, r4, #2
c0de020c:	3001      	adds	r0, #1
c0de020e:	b2c0      	uxtb	r0, r0
c0de0210:	4288      	cmp	r0, r1
c0de0212:	f240 80a8 	bls.w	c0de0366 <app_main_impl+0x316>
c0de0216:	2167      	movs	r1, #103	@ 0x67
c0de0218:	2000      	movs	r0, #0
c0de021a:	e003      	b.n	c0de0224 <app_main_impl+0x1d4>
c0de021c:	294b      	cmp	r1, #75	@ 0x4b
c0de021e:	d209      	bcs.n	c0de0234 <app_main_impl+0x1e4>
c0de0220:	216a      	movs	r1, #106	@ 0x6a
c0de0222:	2080      	movs	r0, #128	@ 0x80
c0de0224:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de0228:	e02c      	b.n	c0de0284 <app_main_impl+0x234>
c0de022a:	216d      	movs	r1, #109	@ 0x6d
c0de022c:	2000      	movs	r0, #0
c0de022e:	e029      	b.n	c0de0284 <app_main_impl+0x234>
c0de0230:	2900      	cmp	r1, #0
c0de0232:	d0f5      	beq.n	c0de0220 <app_main_impl+0x1d0>
c0de0234:	4640      	mov	r0, r8
c0de0236:	aa31      	add	r2, sp, #196	@ 0xc4
c0de0238:	f000 f9dc 	bl	c0de05f4 <sha256_hash>
c0de023c:	b9c8      	cbnz	r0, c0de0272 <app_main_impl+0x222>
c0de023e:	4a6f      	ldr	r2, [pc, #444]	@ (c0de03fc <app_main_impl+0x3ac>)
c0de0240:	4648      	mov	r0, r9
c0de0242:	f10d 084c 	add.w	r8, sp, #76	@ 0x4c
c0de0246:	eb09 0002 	add.w	r0, r9, r2
c0de024a:	f890 1028 	ldrb.w	r1, [r0, #40]	@ 0x28
c0de024e:	b121      	cbz	r1, c0de025a <app_main_impl+0x20a>
c0de0250:	eb09 0002 	add.w	r0, r9, r2
c0de0254:	4642      	mov	r2, r8
c0de0256:	ab3b      	add	r3, sp, #236	@ 0xec
c0de0258:	e008      	b.n	c0de026c <app_main_impl+0x21c>
c0de025a:	a827      	add	r0, sp, #156	@ 0x9c
c0de025c:	e894 00ae 	ldmia.w	r4, {r1, r2, r3, r5, r7}
c0de0260:	c0ae      	stmia	r0!, {r1, r2, r3, r5, r7}
c0de0262:	ab3b      	add	r3, sp, #236	@ 0xec
c0de0264:	2767      	movs	r7, #103	@ 0x67
c0de0266:	2105      	movs	r1, #5
c0de0268:	4642      	mov	r2, r8
c0de026a:	a827      	add	r0, sp, #156	@ 0x9c
c0de026c:	f000 f8d6 	bl	c0de041c <derive_keypair>
c0de0270:	b318      	cbz	r0, c0de02ba <app_main_impl+0x26a>
c0de0272:	f44f 40de 	mov.w	r0, #28416	@ 0x6f00
c0de0276:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de027a:	b281      	uxth	r1, r0
c0de027c:	f5b1 4fc0 	cmp.w	r1, #24576	@ 0x6000
c0de0280:	d310      	bcc.n	c0de02a4 <app_main_impl+0x254>
c0de0282:	0a09      	lsrs	r1, r1, #8
c0de0284:	f8ad b048 	strh.w	fp, [sp, #72]	@ 0x48
c0de0288:	464a      	mov	r2, r9
c0de028a:	f8bd 3048 	ldrh.w	r3, [sp, #72]	@ 0x48
c0de028e:	eb09 020a 	add.w	r2, r9, sl
c0de0292:	54d1      	strb	r1, [r2, r3]
c0de0294:	1c59      	adds	r1, r3, #1
c0de0296:	f8ad 1048 	strh.w	r1, [sp, #72]	@ 0x48
c0de029a:	f8bd 1048 	ldrh.w	r1, [sp, #72]	@ 0x48
c0de029e:	5450      	strb	r0, [r2, r1]
c0de02a0:	1c48      	adds	r0, r1, #1
c0de02a2:	e70c      	b.n	c0de00be <app_main_impl+0x6e>
c0de02a4:	4649      	mov	r1, r9
c0de02a6:	b282      	uxth	r2, r0
c0de02a8:	2390      	movs	r3, #144	@ 0x90
c0de02aa:	3002      	adds	r0, #2
c0de02ac:	eb09 010a 	add.w	r1, r9, sl
c0de02b0:	548b      	strb	r3, [r1, r2]
c0de02b2:	4411      	add	r1, r2
c0de02b4:	f881 b001 	strb.w	fp, [r1, #1]
c0de02b8:	e701      	b.n	c0de00be <app_main_impl+0x6e>
c0de02ba:	4668      	mov	r0, sp
c0de02bc:	eb09 010a 	add.w	r1, r9, sl
c0de02c0:	2240      	movs	r2, #64	@ 0x40
c0de02c2:	2320      	movs	r3, #32
c0de02c4:	e9c0 1200 	strd	r1, r2, [r0]
c0de02c8:	4640      	mov	r0, r8
c0de02ca:	2105      	movs	r1, #5
c0de02cc:	aa31      	add	r2, sp, #196	@ 0xc4
c0de02ce:	f001 fe29 	bl	c0de1f24 <cx_eddsa_sign_no_throw>
c0de02d2:	4604      	mov	r4, r0
c0de02d4:	4640      	mov	r0, r8
c0de02d6:	2128      	movs	r1, #40	@ 0x28
c0de02d8:	f001 ff64 	bl	c0de21a4 <explicit_bzero>
c0de02dc:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de02e0:	2c00      	cmp	r4, #0
c0de02e2:	4628      	mov	r0, r5
c0de02e4:	bf08      	it	eq
c0de02e6:	2040      	moveq	r0, #64	@ 0x40
c0de02e8:	e7c7      	b.n	c0de027a <app_main_impl+0x22a>
c0de02ea:	f8df 8110 	ldr.w	r8, [pc, #272]	@ c0de03fc <app_main_impl+0x3ac>
c0de02ee:	9903      	ldr	r1, [sp, #12]
c0de02f0:	eb09 0008 	add.w	r0, r9, r8
c0de02f4:	f880 1028 	strb.w	r1, [r0, #40]	@ 0x28
c0de02f8:	ad13      	add	r5, sp, #76	@ 0x4c
c0de02fa:	ab3b      	add	r3, sp, #236	@ 0xec
c0de02fc:	462a      	mov	r2, r5
c0de02fe:	f000 f88d 	bl	c0de041c <derive_keypair>
c0de0302:	2800      	cmp	r0, #0
c0de0304:	d142      	bne.n	c0de038c <app_main_impl+0x33c>
c0de0306:	eb09 0708 	add.w	r7, r9, r8
c0de030a:	9904      	ldr	r1, [sp, #16]
c0de030c:	2220      	movs	r2, #32
c0de030e:	f107 0429 	add.w	r4, r7, #41	@ 0x29
c0de0312:	4620      	mov	r0, r4
c0de0314:	f001 ff3a 	bl	c0de218c <__aeabi_memcpy>
c0de0318:	4628      	mov	r0, r5
c0de031a:	2128      	movs	r1, #40	@ 0x28
c0de031c:	f001 ff42 	bl	c0de21a4 <explicit_bzero>
c0de0320:	f107 0149 	add.w	r1, r7, #73	@ 0x49
c0de0324:	4620      	mov	r0, r4
c0de0326:	f000 f8a3 	bl	c0de0470 <get_address>
c0de032a:	bb78      	cbnz	r0, c0de038c <app_main_impl+0x33c>
c0de032c:	eb09 070a 	add.w	r7, r9, sl
c0de0330:	eb09 0408 	add.w	r4, r9, r8
c0de0334:	2220      	movs	r2, #32
c0de0336:	1c78      	adds	r0, r7, #1
c0de0338:	f104 0129 	add.w	r1, r4, #41	@ 0x29
c0de033c:	f809 200a 	strb.w	r2, [r9, sl]
c0de0340:	f001 ff24 	bl	c0de218c <__aeabi_memcpy>
c0de0344:	f104 0849 	add.w	r8, r4, #73	@ 0x49
c0de0348:	4640      	mov	r0, r8
c0de034a:	f001 ff55 	bl	c0de21f8 <strlen>
c0de034e:	4604      	mov	r4, r0
c0de0350:	f887 0021 	strb.w	r0, [r7, #33]	@ 0x21
c0de0354:	f107 0022 	add.w	r0, r7, #34	@ 0x22
c0de0358:	4641      	mov	r1, r8
c0de035a:	b2a2      	uxth	r2, r4
c0de035c:	f001 ff16 	bl	c0de218c <__aeabi_memcpy>
c0de0360:	f104 0022 	add.w	r0, r4, #34	@ 0x22
c0de0364:	e014      	b.n	c0de0390 <app_main_impl+0x340>
c0de0366:	4625      	mov	r5, r4
c0de0368:	2700      	movs	r7, #0
c0de036a:	42bc      	cmp	r4, r7
c0de036c:	d006      	beq.n	c0de037c <app_main_impl+0x32c>
c0de036e:	f000 f95c 	bl	c0de062a <OUTLINED_FUNCTION_0>
c0de0372:	a931      	add	r1, sp, #196	@ 0xc4
c0de0374:	f841 0027 	str.w	r0, [r1, r7, lsl #2]
c0de0378:	3701      	adds	r7, #1
c0de037a:	e7f6      	b.n	c0de036a <app_main_impl+0x31a>
c0de037c:	a831      	add	r0, sp, #196	@ 0xc4
c0de037e:	4629      	mov	r1, r5
c0de0380:	ad27      	add	r5, sp, #156	@ 0x9c
c0de0382:	ab3b      	add	r3, sp, #236	@ 0xec
c0de0384:	462a      	mov	r2, r5
c0de0386:	f000 f849 	bl	c0de041c <derive_keypair>
c0de038a:	b118      	cbz	r0, c0de0394 <app_main_impl+0x344>
c0de038c:	f44f 40de 	mov.w	r0, #28416	@ 0x6f00
c0de0390:	2767      	movs	r7, #103	@ 0x67
c0de0392:	e770      	b.n	c0de0276 <app_main_impl+0x226>
c0de0394:	ac1f      	add	r4, sp, #124	@ 0x7c
c0de0396:	9904      	ldr	r1, [sp, #16]
c0de0398:	2220      	movs	r2, #32
c0de039a:	4620      	mov	r0, r4
c0de039c:	f001 fef6 	bl	c0de218c <__aeabi_memcpy>
c0de03a0:	4628      	mov	r0, r5
c0de03a2:	2128      	movs	r1, #40	@ 0x28
c0de03a4:	f001 fefe 	bl	c0de21a4 <explicit_bzero>
c0de03a8:	4620      	mov	r0, r4
c0de03aa:	ac13      	add	r4, sp, #76	@ 0x4c
c0de03ac:	4621      	mov	r1, r4
c0de03ae:	f000 f85f 	bl	c0de0470 <get_address>
c0de03b2:	f04f 0767 	mov.w	r7, #103	@ 0x67
c0de03b6:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de03ba:	b110      	cbz	r0, c0de03c2 <app_main_impl+0x372>
c0de03bc:	f44f 40de 	mov.w	r0, #28416	@ 0x6f00
c0de03c0:	e75b      	b.n	c0de027a <app_main_impl+0x22a>
c0de03c2:	4620      	mov	r0, r4
c0de03c4:	f001 ff18 	bl	c0de21f8 <strlen>
c0de03c8:	4680      	mov	r8, r0
c0de03ca:	eb09 000a 	add.w	r0, r9, sl
c0de03ce:	4621      	mov	r1, r4
c0de03d0:	fa1f f288 	uxth.w	r2, r8
c0de03d4:	f001 feda 	bl	c0de218c <__aeabi_memcpy>
c0de03d8:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de03dc:	4640      	mov	r0, r8
c0de03de:	e74c      	b.n	c0de027a <app_main_impl+0x22a>
c0de03e0:	f001 fdbb 	bl	c0de1f5a <os_longjmp>
c0de03e4:	2000      	movs	r0, #0
c0de03e6:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de03ea:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de03ec:	f001 fe84 	bl	c0de20f8 <try_context_set>
c0de03f0:	2005      	movs	r0, #5
c0de03f2:	f001 fdb2 	bl	c0de1f5a <os_longjmp>
c0de03f6:	bf00      	nop
c0de03f8:	0000007c 	.word	0x0000007c
c0de03fc:	00000000 	.word	0x00000000
c0de0400:	000020b2 	.word	0x000020b2

c0de0404 <read_u32_be>:
c0de0404:	5c42      	ldrb	r2, [r0, r1]
c0de0406:	4408      	add	r0, r1
c0de0408:	7841      	ldrb	r1, [r0, #1]
c0de040a:	7883      	ldrb	r3, [r0, #2]
c0de040c:	78c0      	ldrb	r0, [r0, #3]
c0de040e:	0409      	lsls	r1, r1, #16
c0de0410:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0de0414:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de0418:	4408      	add	r0, r1
c0de041a:	4770      	bx	lr

c0de041c <derive_keypair>:
c0de041c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de041e:	b091      	sub	sp, #68	@ 0x44
c0de0420:	4614      	mov	r4, r2
c0de0422:	aa01      	add	r2, sp, #4
c0de0424:	461d      	mov	r5, r3
c0de0426:	f000 f8ab 	bl	c0de0580 <os_derive_bip32_with_seed_no_throw>
c0de042a:	b120      	cbz	r0, c0de0436 <derive_keypair+0x1a>
c0de042c:	a801      	add	r0, sp, #4
c0de042e:	2140      	movs	r1, #64	@ 0x40
c0de0430:	f001 feb8 	bl	c0de21a4 <explicit_bzero>
c0de0434:	e00c      	b.n	c0de0450 <derive_keypair+0x34>
c0de0436:	ae01      	add	r6, sp, #4
c0de0438:	2071      	movs	r0, #113	@ 0x71
c0de043a:	2220      	movs	r2, #32
c0de043c:	4623      	mov	r3, r4
c0de043e:	4631      	mov	r1, r6
c0de0440:	f001 fd6b 	bl	c0de1f1a <cx_ecfp_init_private_key_no_throw>
c0de0444:	4607      	mov	r7, r0
c0de0446:	4630      	mov	r0, r6
c0de0448:	2140      	movs	r1, #64	@ 0x40
c0de044a:	f001 feab 	bl	c0de21a4 <explicit_bzero>
c0de044e:	b11f      	cbz	r7, c0de0458 <derive_keypair+0x3c>
c0de0450:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0454:	b011      	add	sp, #68	@ 0x44
c0de0456:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0458:	2071      	movs	r0, #113	@ 0x71
c0de045a:	4629      	mov	r1, r5
c0de045c:	4622      	mov	r2, r4
c0de045e:	2301      	movs	r3, #1
c0de0460:	f001 fd56 	bl	c0de1f10 <cx_ecfp_generate_pair_no_throw>
c0de0464:	b110      	cbz	r0, c0de046c <derive_keypair+0x50>
c0de0466:	4620      	mov	r0, r4
c0de0468:	2128      	movs	r1, #40	@ 0x28
c0de046a:	e7e1      	b.n	c0de0430 <derive_keypair+0x14>
c0de046c:	2000      	movs	r0, #0
c0de046e:	e7f1      	b.n	c0de0454 <derive_keypair+0x38>

c0de0470 <get_address>:
c0de0470:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0474:	b098      	sub	sp, #96	@ 0x60
c0de0476:	f10d 0b40 	add.w	fp, sp, #64	@ 0x40
c0de047a:	4688      	mov	r8, r1
c0de047c:	2120      	movs	r1, #32
c0de047e:	465a      	mov	r2, fp
c0de0480:	f000 f8b8 	bl	c0de05f4 <sha256_hash>
c0de0484:	2800      	cmp	r0, #0
c0de0486:	d169      	bne.n	c0de055c <get_address+0xec>
c0de0488:	2700      	movs	r7, #0
c0de048a:	2f20      	cmp	r7, #32
c0de048c:	d004      	beq.n	c0de0498 <get_address+0x28>
c0de048e:	f81b 0007 	ldrb.w	r0, [fp, r7]
c0de0492:	b908      	cbnz	r0, c0de0498 <get_address+0x28>
c0de0494:	3701      	adds	r7, #1
c0de0496:	e7f8      	b.n	c0de048a <get_address+0x1a>
c0de0498:	f1c7 0020 	rsb	r0, r7, #32
c0de049c:	218a      	movs	r1, #138	@ 0x8a
c0de049e:	4348      	muls	r0, r1
c0de04a0:	2164      	movs	r1, #100	@ 0x64
c0de04a2:	fb90 f0f1 	sdiv	r0, r0, r1
c0de04a6:	4438      	add	r0, r7
c0de04a8:	3001      	adds	r0, #1
c0de04aa:	283f      	cmp	r0, #63	@ 0x3f
c0de04ac:	dc56      	bgt.n	c0de055c <get_address+0xec>
c0de04ae:	46ea      	mov	sl, sp
c0de04b0:	2140      	movs	r1, #64	@ 0x40
c0de04b2:	4650      	mov	r0, sl
c0de04b4:	f001 fe72 	bl	c0de219c <__aeabi_memclr>
c0de04b8:	2000      	movs	r0, #0
c0de04ba:	2131      	movs	r1, #49	@ 0x31
c0de04bc:	4287      	cmp	r7, r0
c0de04be:	d003      	beq.n	c0de04c8 <get_address+0x58>
c0de04c0:	f80a 1000 	strb.w	r1, [sl, r0]
c0de04c4:	3001      	adds	r0, #1
c0de04c6:	e7f9      	b.n	c0de04bc <get_address+0x4c>
c0de04c8:	eb0a 0107 	add.w	r1, sl, r7
c0de04cc:	2000      	movs	r0, #0
c0de04ce:	223a      	movs	r2, #58	@ 0x3a
c0de04d0:	463b      	mov	r3, r7
c0de04d2:	2b20      	cmp	r3, #32
c0de04d4:	d016      	beq.n	c0de0504 <get_address+0x94>
c0de04d6:	f81b 4003 	ldrb.w	r4, [fp, r3]
c0de04da:	2600      	movs	r6, #0
c0de04dc:	4286      	cmp	r6, r0
c0de04de:	db00      	blt.n	c0de04e2 <get_address+0x72>
c0de04e0:	b174      	cbz	r4, c0de0500 <get_address+0x90>
c0de04e2:	5d8d      	ldrb	r5, [r1, r6]
c0de04e4:	eb04 2505 	add.w	r5, r4, r5, lsl #8
c0de04e8:	b2ac      	uxth	r4, r5
c0de04ea:	fbb4 f4f2 	udiv	r4, r4, r2
c0de04ee:	fb04 5512 	mls	r5, r4, r2, r5
c0de04f2:	558d      	strb	r5, [r1, r6]
c0de04f4:	1c75      	adds	r5, r6, #1
c0de04f6:	4286      	cmp	r6, r0
c0de04f8:	bfa8      	it	ge
c0de04fa:	4628      	movge	r0, r5
c0de04fc:	462e      	mov	r6, r5
c0de04fe:	e7ed      	b.n	c0de04dc <get_address+0x6c>
c0de0500:	3301      	adds	r3, #1
c0de0502:	e7e6      	b.n	c0de04d2 <get_address+0x62>
c0de0504:	4c1d      	ldr	r4, [pc, #116]	@ (c0de057c <get_address+0x10c>)
c0de0506:	1e42      	subs	r2, r0, #1
c0de0508:	2300      	movs	r3, #0
c0de050a:	447c      	add	r4, pc
c0de050c:	4283      	cmp	r3, r0
c0de050e:	da05      	bge.n	c0de051c <get_address+0xac>
c0de0510:	5c8d      	ldrb	r5, [r1, r2]
c0de0512:	3a01      	subs	r2, #1
c0de0514:	5d65      	ldrb	r5, [r4, r5]
c0de0516:	54cd      	strb	r5, [r1, r3]
c0de0518:	3301      	adds	r3, #1
c0de051a:	e7f7      	b.n	c0de050c <get_address+0x9c>
c0de051c:	19c0      	adds	r0, r0, r7
c0de051e:	f04f 0100 	mov.w	r1, #0
c0de0522:	f80a 1000 	strb.w	r1, [sl, r0]
c0de0526:	d419      	bmi.n	c0de055c <get_address+0xec>
c0de0528:	4668      	mov	r0, sp
c0de052a:	f001 fe65 	bl	c0de21f8 <strlen>
c0de052e:	4602      	mov	r2, r0
c0de0530:	2074      	movs	r0, #116	@ 0x74
c0de0532:	f888 0002 	strb.w	r0, [r8, #2]
c0de0536:	2063      	movs	r0, #99	@ 0x63
c0de0538:	f888 0001 	strb.w	r0, [r8, #1]
c0de053c:	206f      	movs	r0, #111	@ 0x6f
c0de053e:	f888 0000 	strb.w	r0, [r8]
c0de0542:	f108 0003 	add.w	r0, r8, #3
c0de0546:	2a2b      	cmp	r2, #43	@ 0x2b
c0de0548:	dc0d      	bgt.n	c0de0566 <get_address+0xf6>
c0de054a:	f1c2 012c 	rsb	r1, r2, #44	@ 0x2c
c0de054e:	2300      	movs	r3, #0
c0de0550:	2431      	movs	r4, #49	@ 0x31
c0de0552:	428b      	cmp	r3, r1
c0de0554:	da0a      	bge.n	c0de056c <get_address+0xfc>
c0de0556:	54c4      	strb	r4, [r0, r3]
c0de0558:	3301      	adds	r3, #1
c0de055a:	e7fa      	b.n	c0de0552 <get_address+0xe2>
c0de055c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0560:	b018      	add	sp, #96	@ 0x60
c0de0562:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0566:	4669      	mov	r1, sp
c0de0568:	222c      	movs	r2, #44	@ 0x2c
c0de056a:	e001      	b.n	c0de0570 <get_address+0x100>
c0de056c:	4408      	add	r0, r1
c0de056e:	4669      	mov	r1, sp
c0de0570:	f001 fe0c 	bl	c0de218c <__aeabi_memcpy>
c0de0574:	2000      	movs	r0, #0
c0de0576:	f888 002f 	strb.w	r0, [r8, #47]	@ 0x2f
c0de057a:	e7f1      	b.n	c0de0560 <get_address+0xf0>
c0de057c:	00001cfe 	.word	0x00001cfe

c0de0580 <os_derive_bip32_with_seed_no_throw>:
c0de0580:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0584:	b090      	sub	sp, #64	@ 0x40
c0de0586:	f10d 0810 	add.w	r8, sp, #16
c0de058a:	4607      	mov	r7, r0
c0de058c:	4615      	mov	r5, r2
c0de058e:	460e      	mov	r6, r1
c0de0590:	4640      	mov	r0, r8
c0de0592:	f001 fe23 	bl	c0de21dc <setjmp>
c0de0596:	b284      	uxth	r4, r0
c0de0598:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0de059c:	b154      	cbz	r4, c0de05b4 <os_derive_bip32_with_seed_no_throw+0x34>
c0de059e:	2000      	movs	r0, #0
c0de05a0:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0de05a4:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de05a6:	f001 fda7 	bl	c0de20f8 <try_context_set>
c0de05aa:	2140      	movs	r1, #64	@ 0x40
c0de05ac:	4628      	mov	r0, r5
c0de05ae:	f001 fdf9 	bl	c0de21a4 <explicit_bzero>
c0de05b2:	e00f      	b.n	c0de05d4 <os_derive_bip32_with_seed_no_throw+0x54>
c0de05b4:	a804      	add	r0, sp, #16
c0de05b6:	f001 fd9f 	bl	c0de20f8 <try_context_set>
c0de05ba:	900e      	str	r0, [sp, #56]	@ 0x38
c0de05bc:	2000      	movs	r0, #0
c0de05be:	4669      	mov	r1, sp
c0de05c0:	463a      	mov	r2, r7
c0de05c2:	4633      	mov	r3, r6
c0de05c4:	e9c1 5000 	strd	r5, r0, [r1]
c0de05c8:	e9c1 0002 	strd	r0, r0, [r1, #8]
c0de05cc:	2001      	movs	r0, #1
c0de05ce:	2171      	movs	r1, #113	@ 0x71
c0de05d0:	f001 fd00 	bl	c0de1fd4 <os_perso_derive_node_with_seed_key>
c0de05d4:	f001 fd88 	bl	c0de20e8 <try_context_get>
c0de05d8:	4540      	cmp	r0, r8
c0de05da:	d102      	bne.n	c0de05e2 <os_derive_bip32_with_seed_no_throw+0x62>
c0de05dc:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de05de:	f001 fd8b 	bl	c0de20f8 <try_context_set>
c0de05e2:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0de05e6:	b918      	cbnz	r0, c0de05f0 <os_derive_bip32_with_seed_no_throw+0x70>
c0de05e8:	4620      	mov	r0, r4
c0de05ea:	b010      	add	sp, #64	@ 0x40
c0de05ec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de05f0:	f001 fcb3 	bl	c0de1f5a <os_longjmp>

c0de05f4 <sha256_hash>:
c0de05f4:	b570      	push	{r4, r5, r6, lr}
c0de05f6:	b09e      	sub	sp, #120	@ 0x78
c0de05f8:	4605      	mov	r5, r0
c0de05fa:	a803      	add	r0, sp, #12
c0de05fc:	4616      	mov	r6, r2
c0de05fe:	460c      	mov	r4, r1
c0de0600:	f001 fc9a 	bl	c0de1f38 <cx_sha256_init_no_throw>
c0de0604:	b110      	cbz	r0, c0de060c <sha256_hash+0x18>
c0de0606:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de060a:	e00c      	b.n	c0de0626 <sha256_hash+0x32>
c0de060c:	2020      	movs	r0, #32
c0de060e:	2101      	movs	r1, #1
c0de0610:	462a      	mov	r2, r5
c0de0612:	4623      	mov	r3, r4
c0de0614:	e9cd 6000 	strd	r6, r0, [sp]
c0de0618:	a803      	add	r0, sp, #12
c0de061a:	f001 fc88 	bl	c0de1f2e <cx_hash_no_throw>
c0de061e:	2800      	cmp	r0, #0
c0de0620:	bf18      	it	ne
c0de0622:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
c0de0626:	b01e      	add	sp, #120	@ 0x78
c0de0628:	bd70      	pop	{r4, r5, r6, pc}

c0de062a <OUTLINED_FUNCTION_0>:
c0de062a:	00b8      	lsls	r0, r7, #2
c0de062c:	3001      	adds	r0, #1
c0de062e:	b281      	uxth	r1, r0
c0de0630:	4640      	mov	r0, r8
c0de0632:	f7ff bee7 	b.w	c0de0404 <read_u32_be>

c0de0636 <os_io_handle_default_apdu>:
c0de0636:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0638:	b09d      	sub	sp, #116	@ 0x74
c0de063a:	4615      	mov	r5, r2
c0de063c:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de063e:	b3d8      	cbz	r0, c0de06b8 <os_io_handle_default_apdu+0x82>
c0de0640:	b3d1      	cbz	r1, c0de06b8 <os_io_handle_default_apdu+0x82>
c0de0642:	b3cd      	cbz	r5, c0de06b8 <os_io_handle_default_apdu+0x82>
c0de0644:	461c      	mov	r4, r3
c0de0646:	b3bb      	cbz	r3, c0de06b8 <os_io_handle_default_apdu+0x82>
c0de0648:	b10a      	cbz	r2, c0de064e <os_io_handle_default_apdu+0x18>
c0de064a:	2100      	movs	r1, #0
c0de064c:	7011      	strb	r1, [r2, #0]
c0de064e:	7801      	ldrb	r1, [r0, #0]
c0de0650:	29b0      	cmp	r1, #176	@ 0xb0
c0de0652:	d133      	bne.n	c0de06bc <os_io_handle_default_apdu+0x86>
c0de0654:	7841      	ldrb	r1, [r0, #1]
c0de0656:	29a7      	cmp	r1, #167	@ 0xa7
c0de0658:	d049      	beq.n	c0de06ee <os_io_handle_default_apdu+0xb8>
c0de065a:	2906      	cmp	r1, #6
c0de065c:	d031      	beq.n	c0de06c2 <os_io_handle_default_apdu+0x8c>
c0de065e:	2901      	cmp	r1, #1
c0de0660:	d149      	bne.n	c0de06f6 <os_io_handle_default_apdu+0xc0>
c0de0662:	7881      	ldrb	r1, [r0, #2]
c0de0664:	2900      	cmp	r1, #0
c0de0666:	d146      	bne.n	c0de06f6 <os_io_handle_default_apdu+0xc0>
c0de0668:	78c0      	ldrb	r0, [r0, #3]
c0de066a:	2800      	cmp	r0, #0
c0de066c:	d143      	bne.n	c0de06f6 <os_io_handle_default_apdu+0xc0>
c0de066e:	6820      	ldr	r0, [r4, #0]
c0de0670:	2100      	movs	r1, #0
c0de0672:	6021      	str	r1, [r4, #0]
c0de0674:	2803      	cmp	r0, #3
c0de0676:	d321      	bcc.n	c0de06bc <os_io_handle_default_apdu+0x86>
c0de0678:	2601      	movs	r6, #1
c0de067a:	1ec7      	subs	r7, r0, #3
c0de067c:	6026      	str	r6, [r4, #0]
c0de067e:	702e      	strb	r6, [r5, #0]
c0de0680:	6820      	ldr	r0, [r4, #0]
c0de0682:	1a3a      	subs	r2, r7, r0
c0de0684:	4428      	add	r0, r5
c0de0686:	1c41      	adds	r1, r0, #1
c0de0688:	2001      	movs	r0, #1
c0de068a:	f001 fceb 	bl	c0de2064 <os_registry_get_current_app_tag>
c0de068e:	f000 f83f 	bl	c0de0710 <OUTLINED_FUNCTION_0>
c0de0692:	6020      	str	r0, [r4, #0]
c0de0694:	1a3a      	subs	r2, r7, r0
c0de0696:	4428      	add	r0, r5
c0de0698:	1c41      	adds	r1, r0, #1
c0de069a:	2002      	movs	r0, #2
c0de069c:	f001 fce2 	bl	c0de2064 <os_registry_get_current_app_tag>
c0de06a0:	f000 f836 	bl	c0de0710 <OUTLINED_FUNCTION_0>
c0de06a4:	1c41      	adds	r1, r0, #1
c0de06a6:	6021      	str	r1, [r4, #0]
c0de06a8:	542e      	strb	r6, [r5, r0]
c0de06aa:	f001 fcd3 	bl	c0de2054 <os_flags>
c0de06ae:	6821      	ldr	r1, [r4, #0]
c0de06b0:	1c4a      	adds	r2, r1, #1
c0de06b2:	6022      	str	r2, [r4, #0]
c0de06b4:	5468      	strb	r0, [r5, r1]
c0de06b6:	e028      	b.n	c0de070a <os_io_handle_default_apdu+0xd4>
c0de06b8:	7814      	ldrb	r4, [r2, #0]
c0de06ba:	e01e      	b.n	c0de06fa <os_io_handle_default_apdu+0xc4>
c0de06bc:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de06c0:	e01b      	b.n	c0de06fa <os_io_handle_default_apdu+0xc4>
c0de06c2:	2100      	movs	r1, #0
c0de06c4:	6021      	str	r1, [r4, #0]
c0de06c6:	7883      	ldrb	r3, [r0, #2]
c0de06c8:	7902      	ldrb	r2, [r0, #4]
c0de06ca:	ad02      	add	r5, sp, #8
c0de06cc:	e9cd 1500 	strd	r1, r5, [sp]
c0de06d0:	1d41      	adds	r1, r0, #5
c0de06d2:	4618      	mov	r0, r3
c0de06d4:	2300      	movs	r3, #0
c0de06d6:	f001 fc91 	bl	c0de1ffc <os_pki_load_certificate>
c0de06da:	4604      	mov	r4, r0
c0de06dc:	4628      	mov	r0, r5
c0de06de:	216c      	movs	r1, #108	@ 0x6c
c0de06e0:	f001 fd60 	bl	c0de21a4 <explicit_bzero>
c0de06e4:	2c00      	cmp	r4, #0
c0de06e6:	bf08      	it	eq
c0de06e8:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de06ec:	e005      	b.n	c0de06fa <os_io_handle_default_apdu+0xc4>
c0de06ee:	7881      	ldrb	r1, [r0, #2]
c0de06f0:	b909      	cbnz	r1, c0de06f6 <os_io_handle_default_apdu+0xc0>
c0de06f2:	78c0      	ldrb	r0, [r0, #3]
c0de06f4:	b120      	cbz	r0, c0de0700 <os_io_handle_default_apdu+0xca>
c0de06f6:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de06fa:	4620      	mov	r0, r4
c0de06fc:	b01d      	add	sp, #116	@ 0x74
c0de06fe:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0700:	2000      	movs	r0, #0
c0de0702:	6020      	str	r0, [r4, #0]
c0de0704:	b10a      	cbz	r2, c0de070a <os_io_handle_default_apdu+0xd4>
c0de0706:	2001      	movs	r0, #1
c0de0708:	7010      	strb	r0, [r2, #0]
c0de070a:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de070e:	e7f4      	b.n	c0de06fa <os_io_handle_default_apdu+0xc4>

c0de0710 <OUTLINED_FUNCTION_0>:
c0de0710:	6821      	ldr	r1, [r4, #0]
c0de0712:	1c4a      	adds	r2, r1, #1
c0de0714:	6022      	str	r2, [r4, #0]
c0de0716:	5468      	strb	r0, [r5, r1]
c0de0718:	6821      	ldr	r1, [r4, #0]
c0de071a:	4408      	add	r0, r1
c0de071c:	4770      	bx	lr
	...

c0de0720 <io_seph_ux_init_button>:
c0de0720:	4803      	ldr	r0, [pc, #12]	@ (c0de0730 <io_seph_ux_init_button+0x10>)
c0de0722:	2100      	movs	r1, #0
c0de0724:	f849 1000 	str.w	r1, [r9, r0]
c0de0728:	4448      	add	r0, r9
c0de072a:	6041      	str	r1, [r0, #4]
c0de072c:	4770      	bx	lr
c0de072e:	bf00      	nop
c0de0730:	000002a0 	.word	0x000002a0

c0de0734 <io_process_itc_ux_event>:
c0de0734:	78c0      	ldrb	r0, [r0, #3]
c0de0736:	2820      	cmp	r0, #32
c0de0738:	d105      	bne.n	c0de0746 <io_process_itc_ux_event+0x12>
c0de073a:	b580      	push	{r7, lr}
c0de073c:	f001 fb3e 	bl	c0de1dbc <ux_stack_redisplay>
c0de0740:	2100      	movs	r1, #0
c0de0742:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de0746:	4608      	mov	r0, r1
c0de0748:	4770      	bx	lr

c0de074a <io_seph_ux_display_bagl_element>:
c0de074a:	b570      	push	{r4, r5, r6, lr}
c0de074c:	b088      	sub	sp, #32
c0de074e:	f001 fc0b 	bl	c0de1f68 <pic>
c0de0752:	4604      	mov	r4, r0
c0de0754:	69c0      	ldr	r0, [r0, #28]
c0de0756:	7821      	ldrb	r1, [r4, #0]
c0de0758:	f001 067f 	and.w	r6, r1, #127	@ 0x7f
c0de075c:	f001 fc04 	bl	c0de1f68 <pic>
c0de0760:	b37e      	cbz	r6, c0de07c2 <io_seph_ux_display_bagl_element+0x78>
c0de0762:	4605      	mov	r5, r0
c0de0764:	b150      	cbz	r0, c0de077c <io_seph_ux_display_bagl_element+0x32>
c0de0766:	2e05      	cmp	r6, #5
c0de0768:	d101      	bne.n	c0de076e <io_seph_ux_display_bagl_element+0x24>
c0de076a:	7ea0      	ldrb	r0, [r4, #26]
c0de076c:	b178      	cbz	r0, c0de078e <io_seph_ux_display_bagl_element+0x44>
c0de076e:	4628      	mov	r0, r5
c0de0770:	f001 fd42 	bl	c0de21f8 <strlen>
c0de0774:	b282      	uxth	r2, r0
c0de0776:	4620      	mov	r0, r4
c0de0778:	4629      	mov	r1, r5
c0de077a:	e002      	b.n	c0de0782 <io_seph_ux_display_bagl_element+0x38>
c0de077c:	4620      	mov	r0, r4
c0de077e:	2100      	movs	r1, #0
c0de0780:	2200      	movs	r2, #0
c0de0782:	2300      	movs	r3, #0
c0de0784:	b008      	add	sp, #32
c0de0786:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de078a:	f000 ba1b 	b.w	c0de0bc4 <bagl_draw_with_context>
c0de078e:	4628      	mov	r0, r5
c0de0790:	f001 fbea 	bl	c0de1f68 <pic>
c0de0794:	b1a8      	cbz	r0, c0de07c2 <io_seph_ux_display_bagl_element+0x78>
c0de0796:	4605      	mov	r5, r0
c0de0798:	6900      	ldr	r0, [r0, #16]
c0de079a:	b190      	cbz	r0, c0de07c2 <io_seph_ux_display_bagl_element+0x78>
c0de079c:	4620      	mov	r0, r4
c0de079e:	f001 fbe3 	bl	c0de1f68 <pic>
c0de07a2:	ac01      	add	r4, sp, #4
c0de07a4:	4601      	mov	r1, r0
c0de07a6:	221c      	movs	r2, #28
c0de07a8:	4620      	mov	r0, r4
c0de07aa:	f001 fcef 	bl	c0de218c <__aeabi_memcpy>
c0de07ae:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de07b2:	f8ad 000a 	strh.w	r0, [sp, #10]
c0de07b6:	f8ad 100c 	strh.w	r1, [sp, #12]
c0de07ba:	4620      	mov	r0, r4
c0de07bc:	4629      	mov	r1, r5
c0de07be:	f000 ffb8 	bl	c0de1732 <bagl_draw_glyph>
c0de07c2:	b008      	add	sp, #32
c0de07c4:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de07c8 <io_seproxyhal_button_push>:
c0de07c8:	b3b0      	cbz	r0, c0de0838 <io_seproxyhal_button_push+0x70>
c0de07ca:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de07cc:	4c1b      	ldr	r4, [pc, #108]	@ (c0de083c <io_seproxyhal_button_push+0x74>)
c0de07ce:	4602      	mov	r2, r0
c0de07d0:	460b      	mov	r3, r1
c0de07d2:	f859 6004 	ldr.w	r6, [r9, r4]
c0de07d6:	eb09 0004 	add.w	r0, r9, r4
c0de07da:	6841      	ldr	r1, [r0, #4]
c0de07dc:	429e      	cmp	r6, r3
c0de07de:	ea46 0503 	orr.w	r5, r6, r3
c0de07e2:	bf08      	it	eq
c0de07e4:	3101      	addeq	r1, #1
c0de07e6:	2b00      	cmp	r3, #0
c0de07e8:	4628      	mov	r0, r5
c0de07ea:	bf04      	itt	eq
c0de07ec:	f046 4000 	orreq.w	r0, r6, #2147483648	@ 0x80000000
c0de07f0:	461d      	moveq	r5, r3
c0de07f2:	429e      	cmp	r6, r3
c0de07f4:	bf18      	it	ne
c0de07f6:	2b00      	cmpne	r3, #0
c0de07f8:	d106      	bne.n	c0de0808 <io_seproxyhal_button_push+0x40>
c0de07fa:	eb09 0604 	add.w	r6, r9, r4
c0de07fe:	461f      	mov	r7, r3
c0de0800:	2b00      	cmp	r3, #0
c0de0802:	bf18      	it	ne
c0de0804:	460f      	movne	r7, r1
c0de0806:	6077      	str	r7, [r6, #4]
c0de0808:	429d      	cmp	r5, r3
c0de080a:	f849 5004 	str.w	r5, [r9, r4]
c0de080e:	bf1e      	ittt	ne
c0de0810:	eb09 0304 	addne.w	r3, r9, r4
c0de0814:	2400      	movne	r4, #0
c0de0816:	605c      	strne	r4, [r3, #4]
c0de0818:	2908      	cmp	r1, #8
c0de081a:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de081e:	d30a      	bcc.n	c0de0836 <io_seproxyhal_button_push+0x6e>
c0de0820:	2303      	movs	r3, #3
c0de0822:	fbb1 f3f3 	udiv	r3, r1, r3
c0de0826:	eb03 0343 	add.w	r3, r3, r3, lsl #1
c0de082a:	1acb      	subs	r3, r1, r3
c0de082c:	bf08      	it	eq
c0de082e:	f040 4080 	orreq.w	r0, r0, #1073741824	@ 0x40000000
c0de0832:	f020 4000 	bic.w	r0, r0, #2147483648	@ 0x80000000
c0de0836:	4710      	bx	r2
c0de0838:	4770      	bx	lr
c0de083a:	bf00      	nop
c0de083c:	000002a0 	.word	0x000002a0

c0de0840 <io_exchange>:
c0de0840:	b570      	push	{r4, r5, r6, lr}
c0de0842:	4e1e      	ldr	r6, [pc, #120]	@ (c0de08bc <io_exchange+0x7c>)
c0de0844:	4604      	mov	r4, r0
c0de0846:	460d      	mov	r5, r1
c0de0848:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de084c:	2801      	cmp	r0, #1
c0de084e:	d104      	bne.n	c0de085a <io_exchange+0x1a>
c0de0850:	f001 fc28 	bl	c0de20a4 <os_io_start>
c0de0854:	2000      	movs	r0, #0
c0de0856:	f809 0006 	strb.w	r0, [r9, r6]
c0de085a:	0760      	lsls	r0, r4, #29
c0de085c:	d001      	beq.n	c0de0862 <io_exchange+0x22>
c0de085e:	2000      	movs	r0, #0
c0de0860:	e02a      	b.n	c0de08b8 <io_exchange+0x78>
c0de0862:	b195      	cbz	r5, c0de088a <io_exchange+0x4a>
c0de0864:	f014 0010 	ands.w	r0, r4, #16
c0de0868:	d10f      	bne.n	c0de088a <io_exchange+0x4a>
c0de086a:	4815      	ldr	r0, [pc, #84]	@ (c0de08c0 <io_exchange+0x80>)
c0de086c:	4629      	mov	r1, r5
c0de086e:	4448      	add	r0, r9
c0de0870:	f000 f82a 	bl	c0de08c8 <io_legacy_apdu_tx>
c0de0874:	4813      	ldr	r0, [pc, #76]	@ (c0de08c4 <io_exchange+0x84>)
c0de0876:	eb09 0100 	add.w	r1, r9, r0
c0de087a:	2000      	movs	r0, #0
c0de087c:	7188      	strb	r0, [r1, #6]
c0de087e:	eb09 0106 	add.w	r1, r9, r6
c0de0882:	7048      	strb	r0, [r1, #1]
c0de0884:	06a1      	lsls	r1, r4, #26
c0de0886:	d502      	bpl.n	c0de088e <io_exchange+0x4e>
c0de0888:	e016      	b.n	c0de08b8 <io_exchange+0x78>
c0de088a:	06e0      	lsls	r0, r4, #27
c0de088c:	d406      	bmi.n	c0de089c <io_exchange+0x5c>
c0de088e:	eb09 0006 	add.w	r0, r9, r6
c0de0892:	2100      	movs	r1, #0
c0de0894:	7041      	strb	r1, [r0, #1]
c0de0896:	480b      	ldr	r0, [pc, #44]	@ (c0de08c4 <io_exchange+0x84>)
c0de0898:	4448      	add	r0, r9
c0de089a:	7181      	strb	r1, [r0, #6]
c0de089c:	4c09      	ldr	r4, [pc, #36]	@ (c0de08c4 <io_exchange+0x84>)
c0de089e:	2000      	movs	r0, #0
c0de08a0:	eb09 0104 	add.w	r1, r9, r4
c0de08a4:	8048      	strh	r0, [r1, #2]
c0de08a6:	2800      	cmp	r0, #0
c0de08a8:	dc03      	bgt.n	c0de08b2 <io_exchange+0x72>
c0de08aa:	2001      	movs	r0, #1
c0de08ac:	f000 f826 	bl	c0de08fc <io_legacy_apdu_rx>
c0de08b0:	e7f9      	b.n	c0de08a6 <io_exchange+0x66>
c0de08b2:	eb09 0104 	add.w	r1, r9, r4
c0de08b6:	8048      	strh	r0, [r1, #2]
c0de08b8:	b280      	uxth	r0, r0
c0de08ba:	bd70      	pop	{r4, r5, r6, pc}
c0de08bc:	000002b0 	.word	0x000002b0
c0de08c0:	0000007c 	.word	0x0000007c
c0de08c4:	000002a8 	.word	0x000002a8

c0de08c8 <io_legacy_apdu_tx>:
c0de08c8:	b5b0      	push	{r4, r5, r7, lr}
c0de08ca:	460a      	mov	r2, r1
c0de08cc:	4601      	mov	r1, r0
c0de08ce:	4808      	ldr	r0, [pc, #32]	@ (c0de08f0 <io_legacy_apdu_tx+0x28>)
c0de08d0:	2300      	movs	r3, #0
c0de08d2:	2500      	movs	r5, #0
c0de08d4:	eb09 0400 	add.w	r4, r9, r0
c0de08d8:	7860      	ldrb	r0, [r4, #1]
c0de08da:	f001 fbed 	bl	c0de20b8 <os_io_tx_cmd>
c0de08de:	4905      	ldr	r1, [pc, #20]	@ (c0de08f4 <io_legacy_apdu_tx+0x2c>)
c0de08e0:	7065      	strb	r5, [r4, #1]
c0de08e2:	f809 5001 	strb.w	r5, [r9, r1]
c0de08e6:	4904      	ldr	r1, [pc, #16]	@ (c0de08f8 <io_legacy_apdu_tx+0x30>)
c0de08e8:	4449      	add	r1, r9
c0de08ea:	718d      	strb	r5, [r1, #6]
c0de08ec:	bdb0      	pop	{r4, r5, r7, pc}
c0de08ee:	bf00      	nop
c0de08f0:	000002b0 	.word	0x000002b0
c0de08f4:	000004e0 	.word	0x000004e0
c0de08f8:	000002a8 	.word	0x000002a8

c0de08fc <io_legacy_apdu_rx>:
c0de08fc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de0900:	4f95      	ldr	r7, [pc, #596]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0902:	2100      	movs	r1, #0
c0de0904:	4605      	mov	r5, r0
c0de0906:	2200      	movs	r2, #0
c0de0908:	2301      	movs	r3, #1
c0de090a:	f88d 100f 	strb.w	r1, [sp, #15]
c0de090e:	f240 1111 	movw	r1, #273	@ 0x111
c0de0912:	eb09 0007 	add.w	r0, r9, r7
c0de0916:	f001 fbdb 	bl	c0de20d0 <os_io_rx_evt>
c0de091a:	4604      	mov	r4, r0
c0de091c:	2801      	cmp	r0, #1
c0de091e:	f2c0 80ad 	blt.w	c0de0a7c <io_legacy_apdu_rx+0x180>
c0de0922:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0926:	f1a0 0110 	sub.w	r1, r0, #16
c0de092a:	2916      	cmp	r1, #22
c0de092c:	d805      	bhi.n	c0de093a <io_legacy_apdu_rx+0x3e>
c0de092e:	2201      	movs	r2, #1
c0de0930:	fa02 f101 	lsl.w	r1, r2, r1
c0de0934:	4a89      	ldr	r2, [pc, #548]	@ (c0de0b5c <io_legacy_apdu_rx+0x260>)
c0de0936:	4211      	tst	r1, r2
c0de0938:	d108      	bne.n	c0de094c <io_legacy_apdu_rx+0x50>
c0de093a:	1e41      	subs	r1, r0, #1
c0de093c:	2902      	cmp	r1, #2
c0de093e:	f0c0 8081 	bcc.w	c0de0a44 <io_legacy_apdu_rx+0x148>
c0de0942:	2830      	cmp	r0, #48	@ 0x30
c0de0944:	bf18      	it	ne
c0de0946:	2840      	cmpne	r0, #64	@ 0x40
c0de0948:	f040 8090 	bne.w	c0de0a6c <io_legacy_apdu_rx+0x170>
c0de094c:	f8df 8214 	ldr.w	r8, [pc, #532]	@ c0de0b64 <io_legacy_apdu_rx+0x268>
c0de0950:	eb09 0108 	add.w	r1, r9, r8
c0de0954:	7048      	strb	r0, [r1, #1]
c0de0956:	f001 fb61 	bl	c0de201c <os_perso_is_pin_set>
c0de095a:	28aa      	cmp	r0, #170	@ 0xaa
c0de095c:	d103      	bne.n	c0de0966 <io_legacy_apdu_rx+0x6a>
c0de095e:	f001 fb66 	bl	c0de202e <os_global_pin_is_validated>
c0de0962:	28aa      	cmp	r0, #170	@ 0xaa
c0de0964:	d15c      	bne.n	c0de0a20 <io_legacy_apdu_rx+0x124>
c0de0966:	eb09 0007 	add.w	r0, r9, r7
c0de096a:	7840      	ldrb	r0, [r0, #1]
c0de096c:	28b0      	cmp	r0, #176	@ 0xb0
c0de096e:	d12e      	bne.n	c0de09ce <io_legacy_apdu_rx+0xd2>
c0de0970:	f240 1011 	movw	r0, #273	@ 0x111
c0de0974:	1e61      	subs	r1, r4, #1
c0de0976:	9002      	str	r0, [sp, #8]
c0de0978:	f10d 000f 	add.w	r0, sp, #15
c0de097c:	9000      	str	r0, [sp, #0]
c0de097e:	4878      	ldr	r0, [pc, #480]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0980:	ab02      	add	r3, sp, #8
c0de0982:	eb09 0600 	add.w	r6, r9, r0
c0de0986:	eb09 0007 	add.w	r0, r9, r7
c0de098a:	3001      	adds	r0, #1
c0de098c:	4632      	mov	r2, r6
c0de098e:	f7ff fe52 	bl	c0de0636 <os_io_handle_default_apdu>
c0de0992:	2500      	movs	r5, #0
c0de0994:	9902      	ldr	r1, [sp, #8]
c0de0996:	eb09 0408 	add.w	r4, r9, r8
c0de099a:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de099e:	bf18      	it	ne
c0de09a0:	4629      	movne	r1, r5
c0de09a2:	0a02      	lsrs	r2, r0, #8
c0de09a4:	2300      	movs	r3, #0
c0de09a6:	5472      	strb	r2, [r6, r1]
c0de09a8:	1872      	adds	r2, r6, r1
c0de09aa:	7050      	strb	r0, [r2, #1]
c0de09ac:	1c88      	adds	r0, r1, #2
c0de09ae:	4631      	mov	r1, r6
c0de09b0:	9002      	str	r0, [sp, #8]
c0de09b2:	b282      	uxth	r2, r0
c0de09b4:	7860      	ldrb	r0, [r4, #1]
c0de09b6:	f001 fb7f 	bl	c0de20b8 <os_io_tx_cmd>
c0de09ba:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de09be:	7065      	strb	r5, [r4, #1]
c0de09c0:	2901      	cmp	r1, #1
c0de09c2:	f000 80c5 	beq.w	c0de0b50 <io_legacy_apdu_rx+0x254>
c0de09c6:	2800      	cmp	r0, #0
c0de09c8:	bf48      	it	mi
c0de09ca:	4605      	movmi	r5, r0
c0de09cc:	e057      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de09ce:	eb09 0008 	add.w	r0, r9, r8
c0de09d2:	7846      	ldrb	r6, [r0, #1]
c0de09d4:	2e10      	cmp	r6, #16
c0de09d6:	d070      	beq.n	c0de0aba <io_legacy_apdu_rx+0x1be>
c0de09d8:	2e40      	cmp	r6, #64	@ 0x40
c0de09da:	f000 8091 	beq.w	c0de0b00 <io_legacy_apdu_rx+0x204>
c0de09de:	2e21      	cmp	r6, #33	@ 0x21
c0de09e0:	f000 8082 	beq.w	c0de0ae8 <io_legacy_apdu_rx+0x1ec>
c0de09e4:	2e22      	cmp	r6, #34	@ 0x22
c0de09e6:	d055      	beq.n	c0de0a94 <io_legacy_apdu_rx+0x198>
c0de09e8:	2e23      	cmp	r6, #35	@ 0x23
c0de09ea:	d057      	beq.n	c0de0a9c <io_legacy_apdu_rx+0x1a0>
c0de09ec:	2e30      	cmp	r6, #48	@ 0x30
c0de09ee:	d053      	beq.n	c0de0a98 <io_legacy_apdu_rx+0x19c>
c0de09f0:	f8df 8174 	ldr.w	r8, [pc, #372]	@ c0de0b68 <io_legacy_apdu_rx+0x26c>
c0de09f4:	2e20      	cmp	r6, #32
c0de09f6:	eb09 0008 	add.w	r0, r9, r8
c0de09fa:	d160      	bne.n	c0de0abe <io_legacy_apdu_rx+0x1c2>
c0de09fc:	2601      	movs	r6, #1
c0de09fe:	eb09 0107 	add.w	r1, r9, r7
c0de0a02:	1e65      	subs	r5, r4, #1
c0de0a04:	7186      	strb	r6, [r0, #6]
c0de0a06:	4856      	ldr	r0, [pc, #344]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0a08:	3101      	adds	r1, #1
c0de0a0a:	462a      	mov	r2, r5
c0de0a0c:	4448      	add	r0, r9
c0de0a0e:	f001 fbbd 	bl	c0de218c <__aeabi_memcpy>
c0de0a12:	4856      	ldr	r0, [pc, #344]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0a14:	f809 6000 	strb.w	r6, [r9, r0]
c0de0a18:	2008      	movs	r0, #8
c0de0a1a:	f809 0008 	strb.w	r0, [r9, r8]
c0de0a1e:	e02e      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0a20:	484f      	ldr	r0, [pc, #316]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0a22:	2155      	movs	r1, #85	@ 0x55
c0de0a24:	2202      	movs	r2, #2
c0de0a26:	2300      	movs	r3, #0
c0de0a28:	f809 1000 	strb.w	r1, [r9, r0]
c0de0a2c:	eb09 0100 	add.w	r1, r9, r0
c0de0a30:	2015      	movs	r0, #21
c0de0a32:	7048      	strb	r0, [r1, #1]
c0de0a34:	eb09 0008 	add.w	r0, r9, r8
c0de0a38:	7840      	ldrb	r0, [r0, #1]
c0de0a3a:	b004      	add	sp, #16
c0de0a3c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a40:	f001 bb3a 	b.w	c0de20b8 <os_io_tx_cmd>
c0de0a44:	4e4a      	ldr	r6, [pc, #296]	@ (c0de0b70 <io_legacy_apdu_rx+0x274>)
c0de0a46:	444f      	add	r7, r9
c0de0a48:	3c01      	subs	r4, #1
c0de0a4a:	1c79      	adds	r1, r7, #1
c0de0a4c:	4622      	mov	r2, r4
c0de0a4e:	eb09 0006 	add.w	r0, r9, r6
c0de0a52:	f001 fb9b 	bl	c0de218c <__aeabi_memcpy>
c0de0a56:	7878      	ldrb	r0, [r7, #1]
c0de0a58:	281a      	cmp	r0, #26
c0de0a5a:	d114      	bne.n	c0de0a86 <io_legacy_apdu_rx+0x18a>
c0de0a5c:	eb09 0006 	add.w	r0, r9, r6
c0de0a60:	4621      	mov	r1, r4
c0de0a62:	b004      	add	sp, #16
c0de0a64:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a68:	f7ff be64 	b.w	c0de0734 <io_process_itc_ux_event>
c0de0a6c:	2842      	cmp	r0, #66	@ 0x42
c0de0a6e:	d165      	bne.n	c0de0b3c <io_legacy_apdu_rx+0x240>
c0de0a70:	483b      	ldr	r0, [pc, #236]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0a72:	eb09 0107 	add.w	r1, r9, r7
c0de0a76:	4622      	mov	r2, r4
c0de0a78:	f000 f89f 	bl	c0de0bba <OUTLINED_FUNCTION_0>
c0de0a7c:	4625      	mov	r5, r4
c0de0a7e:	4628      	mov	r0, r5
c0de0a80:	b004      	add	sp, #16
c0de0a82:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0a86:	2d00      	cmp	r5, #0
c0de0a88:	d04e      	beq.n	c0de0b28 <io_legacy_apdu_rx+0x22c>
c0de0a8a:	2000      	movs	r0, #0
c0de0a8c:	2500      	movs	r5, #0
c0de0a8e:	f000 fea9 	bl	c0de17e4 <io_event>
c0de0a92:	e7f4      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0a94:	2004      	movs	r0, #4
c0de0a96:	e028      	b.n	c0de0aea <io_legacy_apdu_rx+0x1ee>
c0de0a98:	2002      	movs	r0, #2
c0de0a9a:	e026      	b.n	c0de0aea <io_legacy_apdu_rx+0x1ee>
c0de0a9c:	4e32      	ldr	r6, [pc, #200]	@ (c0de0b68 <io_legacy_apdu_rx+0x26c>)
c0de0a9e:	2107      	movs	r1, #7
c0de0aa0:	1e65      	subs	r5, r4, #1
c0de0aa2:	462a      	mov	r2, r5
c0de0aa4:	eb09 0006 	add.w	r0, r9, r6
c0de0aa8:	7181      	strb	r1, [r0, #6]
c0de0aaa:	482d      	ldr	r0, [pc, #180]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0aac:	eb09 0107 	add.w	r1, r9, r7
c0de0ab0:	f000 f883 	bl	c0de0bba <OUTLINED_FUNCTION_0>
c0de0ab4:	482d      	ldr	r0, [pc, #180]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0ab6:	2101      	movs	r1, #1
c0de0ab8:	e030      	b.n	c0de0b1c <io_legacy_apdu_rx+0x220>
c0de0aba:	2006      	movs	r0, #6
c0de0abc:	e015      	b.n	c0de0aea <io_legacy_apdu_rx+0x1ee>
c0de0abe:	2100      	movs	r1, #0
c0de0ac0:	1e65      	subs	r5, r4, #1
c0de0ac2:	7181      	strb	r1, [r0, #6]
c0de0ac4:	4826      	ldr	r0, [pc, #152]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0ac6:	eb09 0107 	add.w	r1, r9, r7
c0de0aca:	462a      	mov	r2, r5
c0de0acc:	f000 f875 	bl	c0de0bba <OUTLINED_FUNCTION_0>
c0de0ad0:	2e25      	cmp	r6, #37	@ 0x25
c0de0ad2:	d035      	beq.n	c0de0b40 <io_legacy_apdu_rx+0x244>
c0de0ad4:	2e24      	cmp	r6, #36	@ 0x24
c0de0ad6:	d1d2      	bne.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0ad8:	200b      	movs	r0, #11
c0de0ada:	2101      	movs	r1, #1
c0de0adc:	f809 0008 	strb.w	r0, [r9, r8]
c0de0ae0:	4822      	ldr	r0, [pc, #136]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0ae2:	f809 1000 	strb.w	r1, [r9, r0]
c0de0ae6:	e7ca      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0ae8:	2005      	movs	r0, #5
c0de0aea:	491f      	ldr	r1, [pc, #124]	@ (c0de0b68 <io_legacy_apdu_rx+0x26c>)
c0de0aec:	1e65      	subs	r5, r4, #1
c0de0aee:	462a      	mov	r2, r5
c0de0af0:	4449      	add	r1, r9
c0de0af2:	7188      	strb	r0, [r1, #6]
c0de0af4:	481a      	ldr	r0, [pc, #104]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0af6:	eb09 0107 	add.w	r1, r9, r7
c0de0afa:	f000 f85e 	bl	c0de0bba <OUTLINED_FUNCTION_0>
c0de0afe:	e7be      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0b00:	4e19      	ldr	r6, [pc, #100]	@ (c0de0b68 <io_legacy_apdu_rx+0x26c>)
c0de0b02:	2103      	movs	r1, #3
c0de0b04:	1e65      	subs	r5, r4, #1
c0de0b06:	462a      	mov	r2, r5
c0de0b08:	eb09 0006 	add.w	r0, r9, r6
c0de0b0c:	7181      	strb	r1, [r0, #6]
c0de0b0e:	4814      	ldr	r0, [pc, #80]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0b10:	eb09 0107 	add.w	r1, r9, r7
c0de0b14:	f000 f851 	bl	c0de0bba <OUTLINED_FUNCTION_0>
c0de0b18:	4814      	ldr	r0, [pc, #80]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0b1a:	2102      	movs	r1, #2
c0de0b1c:	f809 1000 	strb.w	r1, [r9, r0]
c0de0b20:	200a      	movs	r0, #10
c0de0b22:	f809 0006 	strb.w	r0, [r9, r6]
c0de0b26:	e7aa      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0b28:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0b2c:	2815      	cmp	r0, #21
c0de0b2e:	d8ac      	bhi.n	c0de0a8a <io_legacy_apdu_rx+0x18e>
c0de0b30:	2101      	movs	r1, #1
c0de0b32:	fa01 f000 	lsl.w	r0, r1, r0
c0de0b36:	490f      	ldr	r1, [pc, #60]	@ (c0de0b74 <io_legacy_apdu_rx+0x278>)
c0de0b38:	4208      	tst	r0, r1
c0de0b3a:	d0a6      	beq.n	c0de0a8a <io_legacy_apdu_rx+0x18e>
c0de0b3c:	2500      	movs	r5, #0
c0de0b3e:	e79e      	b.n	c0de0a7e <io_legacy_apdu_rx+0x182>
c0de0b40:	200c      	movs	r0, #12
c0de0b42:	2101      	movs	r1, #1
c0de0b44:	f809 0008 	strb.w	r0, [r9, r8]
c0de0b48:	4808      	ldr	r0, [pc, #32]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0b4a:	f809 1000 	strb.w	r1, [r9, r0]
c0de0b4e:	e795      	b.n	c0de0a7c <io_legacy_apdu_rx+0x180>
c0de0b50:	20ff      	movs	r0, #255	@ 0xff
c0de0b52:	f001 fa93 	bl	c0de207c <os_sched_exit>
c0de0b56:	bf00      	nop
c0de0b58:	0000018d 	.word	0x0000018d
c0de0b5c:	007f0001 	.word	0x007f0001
c0de0b60:	0000007c 	.word	0x0000007c
c0de0b64:	000002b0 	.word	0x000002b0
c0de0b68:	000002a8 	.word	0x000002a8
c0de0b6c:	000004e0 	.word	0x000004e0
c0de0b70:	000002b2 	.word	0x000002b2
c0de0b74:	00205020 	.word	0x00205020

c0de0b78 <io_seproxyhal_init>:
c0de0b78:	b570      	push	{r4, r5, r6, lr}
c0de0b7a:	b08a      	sub	sp, #40	@ 0x28
c0de0b7c:	4d0c      	ldr	r5, [pc, #48]	@ (c0de0bb0 <io_seproxyhal_init+0x38>)
c0de0b7e:	2600      	movs	r6, #0
c0de0b80:	2118      	movs	r1, #24
c0de0b82:	eb09 0005 	add.w	r0, r9, r5
c0de0b86:	7046      	strb	r6, [r0, #1]
c0de0b88:	ac01      	add	r4, sp, #4
c0de0b8a:	4620      	mov	r0, r4
c0de0b8c:	f001 fb06 	bl	c0de219c <__aeabi_memclr>
c0de0b90:	4808      	ldr	r0, [pc, #32]	@ (c0de0bb4 <io_seproxyhal_init+0x3c>)
c0de0b92:	f8ad 6024 	strh.w	r6, [sp, #36]	@ 0x24
c0de0b96:	f88d 6022 	strb.w	r6, [sp, #34]	@ 0x22
c0de0b9a:	2601      	movs	r6, #1
c0de0b9c:	f8ad 6020 	strh.w	r6, [sp, #32]
c0de0ba0:	9007      	str	r0, [sp, #28]
c0de0ba2:	4620      	mov	r0, r4
c0de0ba4:	f001 fa74 	bl	c0de2090 <os_io_init>
c0de0ba8:	f809 6005 	strb.w	r6, [r9, r5]
c0de0bac:	b00a      	add	sp, #40	@ 0x28
c0de0bae:	bd70      	pop	{r4, r5, r6, pc}
c0de0bb0:	000002b0 	.word	0x000002b0
c0de0bb4:	00020015 	.word	0x00020015

c0de0bb8 <USB_power>:
c0de0bb8:	4770      	bx	lr

c0de0bba <OUTLINED_FUNCTION_0>:
c0de0bba:	3101      	adds	r1, #1
c0de0bbc:	4448      	add	r0, r9
c0de0bbe:	f001 bae5 	b.w	c0de218c <__aeabi_memcpy>
	...

c0de0bc4 <bagl_draw_with_context>:
c0de0bc4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0bc8:	b08e      	sub	sp, #56	@ 0x38
c0de0bca:	4604      	mov	r4, r0
c0de0bcc:	7800      	ldrb	r0, [r0, #0]
c0de0bce:	910c      	str	r1, [sp, #48]	@ 0x30
c0de0bd0:	920b      	str	r2, [sp, #44]	@ 0x2c
c0de0bd2:	f000 0c7f 	and.w	ip, r0, #127	@ 0x7f
c0de0bd6:	f1bc 0f05 	cmp.w	ip, #5
c0de0bda:	d108      	bne.n	c0de0bee <bagl_draw_with_context+0x2a>
c0de0bdc:	2000      	movs	r0, #0
c0de0bde:	2500      	movs	r5, #0
c0de0be0:	f04f 0a00 	mov.w	sl, #0
c0de0be4:	f04f 0800 	mov.w	r8, #0
c0de0be8:	f04f 0e00 	mov.w	lr, #0
c0de0bec:	e083      	b.n	c0de0cf6 <bagl_draw_with_context+0x132>
c0de0bee:	8b20      	ldrh	r0, [r4, #24]
c0de0bf0:	4698      	mov	r8, r3
c0de0bf2:	4616      	mov	r6, r2
c0de0bf4:	46e3      	mov	fp, ip
c0de0bf6:	f000 fa85 	bl	c0de1104 <bagl_get_font>
c0de0bfa:	2800      	cmp	r0, #0
c0de0bfc:	d06c      	beq.n	c0de0cd8 <bagl_draw_with_context+0x114>
c0de0bfe:	f890 e005 	ldrb.w	lr, [r0, #5]
c0de0c02:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de0c04:	8921      	ldrh	r1, [r4, #8]
c0de0c06:	2500      	movs	r5, #0
c0de0c08:	2800      	cmp	r0, #0
c0de0c0a:	910a      	str	r1, [sp, #40]	@ 0x28
c0de0c0c:	d06d      	beq.n	c0de0cea <bagl_draw_with_context+0x126>
c0de0c0e:	2e00      	cmp	r6, #0
c0de0c10:	d06b      	beq.n	c0de0cea <bagl_draw_with_context+0x126>
c0de0c12:	88e1      	ldrh	r1, [r4, #6]
c0de0c14:	8b20      	ldrh	r0, [r4, #24]
c0de0c16:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de0c18:	b2f3      	uxtb	r3, r6
c0de0c1a:	f8cd e01c 	str.w	lr, [sp, #28]
c0de0c1e:	f8cd 8000 	str.w	r8, [sp]
c0de0c22:	3164      	adds	r1, #100	@ 0x64
c0de0c24:	b289      	uxth	r1, r1
c0de0c26:	f000 fa8d 	bl	c0de1144 <bagl_compute_line_width>
c0de0c2a:	88e1      	ldrh	r1, [r4, #6]
c0de0c2c:	4607      	mov	r7, r0
c0de0c2e:	f04f 0a00 	mov.w	sl, #0
c0de0c32:	2e05      	cmp	r6, #5
c0de0c34:	f0c0 8230 	bcc.w	c0de1098 <bagl_draw_with_context+0x4d4>
c0de0c38:	f8dd e01c 	ldr.w	lr, [sp, #28]
c0de0c3c:	428f      	cmp	r7, r1
c0de0c3e:	46dc      	mov	ip, fp
c0de0c40:	f240 8228 	bls.w	c0de1094 <bagl_draw_with_context+0x4d0>
c0de0c44:	8b20      	ldrh	r0, [r4, #24]
c0de0c46:	f8cd c020 	str.w	ip, [sp, #32]
c0de0c4a:	f8cd 8000 	str.w	r8, [sp]
c0de0c4e:	2164      	movs	r1, #100	@ 0x64
c0de0c50:	2303      	movs	r3, #3
c0de0c52:	4ad3      	ldr	r2, [pc, #844]	@ (c0de0fa0 <bagl_draw_with_context+0x3dc>)
c0de0c54:	447a      	add	r2, pc
c0de0c56:	f000 fa75 	bl	c0de1144 <bagl_compute_line_width>
c0de0c5a:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de0c5c:	88e1      	ldrh	r1, [r4, #6]
c0de0c5e:	900d      	str	r0, [sp, #52]	@ 0x34
c0de0c60:	2000      	movs	r0, #0
c0de0c62:	0875      	lsrs	r5, r6, #1
c0de0c64:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0c66:	eb02 0356 	add.w	r3, r2, r6, lsr #1
c0de0c6a:	1ad0      	subs	r0, r2, r3
c0de0c6c:	469a      	mov	sl, r3
c0de0c6e:	eb00 0b06 	add.w	fp, r0, r6
c0de0c72:	4616      	mov	r6, r2
c0de0c74:	428f      	cmp	r7, r1
c0de0c76:	f240 820a 	bls.w	c0de108e <bagl_draw_with_context+0x4ca>
c0de0c7a:	2d00      	cmp	r5, #0
c0de0c7c:	f000 8207 	beq.w	c0de108e <bagl_draw_with_context+0x4ca>
c0de0c80:	f1bb 0f00 	cmp.w	fp, #0
c0de0c84:	f000 8203 	beq.w	c0de108e <bagl_draw_with_context+0x4ca>
c0de0c88:	8b20      	ldrh	r0, [r4, #24]
c0de0c8a:	b289      	uxth	r1, r1
c0de0c8c:	b2eb      	uxtb	r3, r5
c0de0c8e:	4632      	mov	r2, r6
c0de0c90:	f8cd 8000 	str.w	r8, [sp]
c0de0c94:	f000 fa56 	bl	c0de1144 <bagl_compute_line_width>
c0de0c98:	4607      	mov	r7, r0
c0de0c9a:	88e1      	ldrh	r1, [r4, #6]
c0de0c9c:	8b20      	ldrh	r0, [r4, #24]
c0de0c9e:	fa5f f38b 	uxtb.w	r3, fp
c0de0ca2:	4652      	mov	r2, sl
c0de0ca4:	f8cd 8000 	str.w	r8, [sp]
c0de0ca8:	f000 fa4c 	bl	c0de1144 <bagl_compute_line_width>
c0de0cac:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de0cae:	4439      	add	r1, r7
c0de0cb0:	180f      	adds	r7, r1, r0
c0de0cb2:	88e1      	ldrh	r1, [r4, #6]
c0de0cb4:	428f      	cmp	r7, r1
c0de0cb6:	d9dd      	bls.n	c0de0c74 <bagl_draw_with_context+0xb0>
c0de0cb8:	9a09      	ldr	r2, [sp, #36]	@ 0x24
c0de0cba:	2001      	movs	r0, #1
c0de0cbc:	4653      	mov	r3, sl
c0de0cbe:	2a00      	cmp	r2, #0
c0de0cc0:	bf08      	it	eq
c0de0cc2:	3d01      	subeq	r5, #1
c0de0cc4:	ea20 0002 	bic.w	r0, r0, r2
c0de0cc8:	bf18      	it	ne
c0de0cca:	2201      	movne	r2, #1
c0de0ccc:	eb0a 0302 	add.w	r3, sl, r2
c0de0cd0:	4632      	mov	r2, r6
c0de0cd2:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
c0de0cd4:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0cd6:	e7c8      	b.n	c0de0c6a <bagl_draw_with_context+0xa6>
c0de0cd8:	2000      	movs	r0, #0
c0de0cda:	2500      	movs	r5, #0
c0de0cdc:	f04f 0a00 	mov.w	sl, #0
c0de0ce0:	f04f 0800 	mov.w	r8, #0
c0de0ce4:	f04f 0e00 	mov.w	lr, #0
c0de0ce8:	e004      	b.n	c0de0cf4 <bagl_draw_with_context+0x130>
c0de0cea:	2000      	movs	r0, #0
c0de0cec:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de0cf0:	f04f 0a00 	mov.w	sl, #0
c0de0cf4:	46dc      	mov	ip, fp
c0de0cf6:	900d      	str	r0, [sp, #52]	@ 0x34
c0de0cf8:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0cfa:	8927      	ldrh	r7, [r4, #8]
c0de0cfc:	88e3      	ldrh	r3, [r4, #6]
c0de0cfe:	0879      	lsrs	r1, r7, #1
c0de0d00:	0858      	lsrs	r0, r3, #1
c0de0d02:	460a      	mov	r2, r1
c0de0d04:	ebb0 0f57 	cmp.w	r0, r7, lsr #1
c0de0d08:	bf38      	it	cc
c0de0d0a:	085a      	lsrcc	r2, r3, #1
c0de0d0c:	7ae6      	ldrb	r6, [r4, #11]
c0de0d0e:	42b2      	cmp	r2, r6
c0de0d10:	46b3      	mov	fp, r6
c0de0d12:	d803      	bhi.n	c0de0d1c <bagl_draw_with_context+0x158>
c0de0d14:	4288      	cmp	r0, r1
c0de0d16:	bf2c      	ite	cs
c0de0d18:	468b      	movcs	fp, r1
c0de0d1a:	4683      	movcc	fp, r0
c0de0d1c:	f1ac 0001 	sub.w	r0, ip, #1
c0de0d20:	f8cd a028 	str.w	sl, [sp, #40]	@ 0x28
c0de0d24:	2804      	cmp	r0, #4
c0de0d26:	d20c      	bcs.n	c0de0d42 <bagl_draw_with_context+0x17e>
c0de0d28:	f1bc 0f04 	cmp.w	ip, #4
c0de0d2c:	d111      	bne.n	c0de0d52 <bagl_draw_with_context+0x18e>
c0de0d2e:	bb5e      	cbnz	r6, c0de0d88 <bagl_draw_with_context+0x1c4>
c0de0d30:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0d34:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d38:	6920      	ldr	r0, [r4, #16]
c0de0d3a:	9700      	str	r7, [sp, #0]
c0de0d3c:	f001 fa12 	bl	c0de2164 <bagl_hal_draw_rect>
c0de0d40:	e1a2      	b.n	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0d42:	f1bc 0f06 	cmp.w	ip, #6
c0de0d46:	f000 811b 	beq.w	c0de0f80 <bagl_draw_with_context+0x3bc>
c0de0d4a:	f1bc 0f07 	cmp.w	ip, #7
c0de0d4e:	d0eb      	beq.n	c0de0d28 <bagl_draw_with_context+0x164>
c0de0d50:	e19a      	b.n	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0d52:	f1bc 0f07 	cmp.w	ip, #7
c0de0d56:	d002      	beq.n	c0de0d5e <bagl_draw_with_context+0x19a>
c0de0d58:	f1bc 0f02 	cmp.w	ip, #2
c0de0d5c:	d114      	bne.n	c0de0d88 <bagl_draw_with_context+0x1c4>
c0de0d5e:	f1bc 0f07 	cmp.w	ip, #7
c0de0d62:	bf08      	it	eq
c0de0d64:	4647      	moveq	r7, r8
c0de0d66:	6960      	ldr	r0, [r4, #20]
c0de0d68:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0d6c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d70:	9700      	str	r7, [sp, #0]
c0de0d72:	4666      	mov	r6, ip
c0de0d74:	46f2      	mov	sl, lr
c0de0d76:	f1bc 0f07 	cmp.w	ip, #7
c0de0d7a:	bf08      	it	eq
c0de0d7c:	eba2 020e 	subeq.w	r2, r2, lr
c0de0d80:	f001 f9f0 	bl	c0de2164 <bagl_hal_draw_rect>
c0de0d84:	4632      	mov	r2, r6
c0de0d86:	e0e7      	b.n	c0de0f58 <bagl_draw_with_context+0x394>
c0de0d88:	f9b4 0002 	ldrsh.w	r0, [r4, #2]
c0de0d8c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d90:	46f2      	mov	sl, lr
c0de0d92:	46a8      	mov	r8, r5
c0de0d94:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de0d98:	ea4f 064b 	mov.w	r6, fp, lsl #1
c0de0d9c:	f8cd c020 	str.w	ip, [sp, #32]
c0de0da0:	eb0b 0100 	add.w	r1, fp, r0
c0de0da4:	7b20      	ldrb	r0, [r4, #12]
c0de0da6:	2801      	cmp	r0, #1
c0de0da8:	d118      	bne.n	c0de0ddc <bagl_draw_with_context+0x218>
c0de0daa:	6920      	ldr	r0, [r4, #16]
c0de0dac:	9700      	str	r7, [sp, #0]
c0de0dae:	4fd2      	ldr	r7, [pc, #840]	@ (c0de10f8 <bagl_draw_with_context+0x534>)
c0de0db0:	447f      	add	r7, pc
c0de0db2:	47b8      	blx	r7
c0de0db4:	f000 fd02 	bl	c0de17bc <OUTLINED_FUNCTION_6>
c0de0db8:	6920      	ldr	r0, [r4, #16]
c0de0dba:	f000 fcfa 	bl	c0de17b2 <OUTLINED_FUNCTION_5>
c0de0dbe:	8920      	ldrh	r0, [r4, #8]
c0de0dc0:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0dc4:	88e3      	ldrh	r3, [r4, #6]
c0de0dc6:	1b81      	subs	r1, r0, r6
c0de0dc8:	f9b4 6002 	ldrsh.w	r6, [r4, #2]
c0de0dcc:	6920      	ldr	r0, [r4, #16]
c0de0dce:	445a      	add	r2, fp
c0de0dd0:	9100      	str	r1, [sp, #0]
c0de0dd2:	eba6 010b 	sub.w	r1, r6, fp
c0de0dd6:	4419      	add	r1, r3
c0de0dd8:	465b      	mov	r3, fp
c0de0dda:	e054      	b.n	c0de0e86 <bagl_draw_with_context+0x2c2>
c0de0ddc:	6960      	ldr	r0, [r4, #20]
c0de0dde:	9700      	str	r7, [sp, #0]
c0de0de0:	4fc4      	ldr	r7, [pc, #784]	@ (c0de10f4 <bagl_draw_with_context+0x530>)
c0de0de2:	447f      	add	r7, pc
c0de0de4:	47b8      	blx	r7
c0de0de6:	f000 fce9 	bl	c0de17bc <OUTLINED_FUNCTION_6>
c0de0dea:	6960      	ldr	r0, [r4, #20]
c0de0dec:	f000 fce1 	bl	c0de17b2 <OUTLINED_FUNCTION_5>
c0de0df0:	8920      	ldrh	r0, [r4, #8]
c0de0df2:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de0df6:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0dfa:	f8b4 c006 	ldrh.w	ip, [r4, #6]
c0de0dfe:	1b81      	subs	r1, r0, r6
c0de0e00:	6960      	ldr	r0, [r4, #20]
c0de0e02:	445a      	add	r2, fp
c0de0e04:	9100      	str	r1, [sp, #0]
c0de0e06:	ea6f 010b 	mvn.w	r1, fp
c0de0e0a:	4419      	add	r1, r3
c0de0e0c:	465b      	mov	r3, fp
c0de0e0e:	4461      	add	r1, ip
c0de0e10:	47b8      	blx	r7
c0de0e12:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e16:	f8b4 c006 	ldrh.w	ip, [r4, #6]
c0de0e1a:	7aa3      	ldrb	r3, [r4, #10]
c0de0e1c:	6920      	ldr	r0, [r4, #16]
c0de0e1e:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0e22:	9300      	str	r3, [sp, #0]
c0de0e24:	4459      	add	r1, fp
c0de0e26:	ebac 0306 	sub.w	r3, ip, r6
c0de0e2a:	47b8      	blx	r7
c0de0e2c:	f8b4 c008 	ldrh.w	ip, [r4, #8]
c0de0e30:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0e34:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e38:	f8b4 e006 	ldrh.w	lr, [r4, #6]
c0de0e3c:	7aa3      	ldrb	r3, [r4, #10]
c0de0e3e:	6920      	ldr	r0, [r4, #16]
c0de0e40:	4462      	add	r2, ip
c0de0e42:	9300      	str	r3, [sp, #0]
c0de0e44:	4459      	add	r1, fp
c0de0e46:	ebae 0306 	sub.w	r3, lr, r6
c0de0e4a:	3a01      	subs	r2, #1
c0de0e4c:	47b8      	blx	r7
c0de0e4e:	8920      	ldrh	r0, [r4, #8]
c0de0e50:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0e54:	7aa3      	ldrb	r3, [r4, #10]
c0de0e56:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e5a:	eba0 0c06 	sub.w	ip, r0, r6
c0de0e5e:	6920      	ldr	r0, [r4, #16]
c0de0e60:	445a      	add	r2, fp
c0de0e62:	f8cd c000 	str.w	ip, [sp]
c0de0e66:	47b8      	blx	r7
c0de0e68:	8920      	ldrh	r0, [r4, #8]
c0de0e6a:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e6e:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0e72:	7aa3      	ldrb	r3, [r4, #10]
c0de0e74:	eba0 0c06 	sub.w	ip, r0, r6
c0de0e78:	88e6      	ldrh	r6, [r4, #6]
c0de0e7a:	6920      	ldr	r0, [r4, #16]
c0de0e7c:	445a      	add	r2, fp
c0de0e7e:	f8cd c000 	str.w	ip, [sp]
c0de0e82:	4431      	add	r1, r6
c0de0e84:	3901      	subs	r1, #1
c0de0e86:	47b8      	blx	r7
c0de0e88:	9a08      	ldr	r2, [sp, #32]
c0de0e8a:	f1bb 0f02 	cmp.w	fp, #2
c0de0e8e:	4645      	mov	r5, r8
c0de0e90:	d35f      	bcc.n	c0de0f52 <bagl_draw_with_context+0x38e>
c0de0e92:	7b20      	ldrb	r0, [r4, #12]
c0de0e94:	2500      	movs	r5, #0
c0de0e96:	f8cd a01c 	str.w	sl, [sp, #28]
c0de0e9a:	2801      	cmp	r0, #1
c0de0e9c:	d004      	beq.n	c0de0ea8 <bagl_draw_with_context+0x2e4>
c0de0e9e:	7aa0      	ldrb	r0, [r4, #10]
c0de0ea0:	ebbb 0000 	subs.w	r0, fp, r0
c0de0ea4:	bf28      	it	cs
c0de0ea6:	4605      	movcs	r5, r0
c0de0ea8:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0eac:	27c0      	movs	r7, #192	@ 0xc0
c0de0eae:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de0eb2:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de0eb6:	e9cd 7500 	strd	r7, r5, [sp]
c0de0eba:	9102      	str	r1, [sp, #8]
c0de0ebc:	eb0b 0102 	add.w	r1, fp, r2
c0de0ec0:	eb0b 0203 	add.w	r2, fp, r3
c0de0ec4:	465b      	mov	r3, fp
c0de0ec6:	4e8d      	ldr	r6, [pc, #564]	@ (c0de10fc <bagl_draw_with_context+0x538>)
c0de0ec8:	447e      	add	r6, pc
c0de0eca:	47b0      	blx	r6
c0de0ecc:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0ed0:	f8b4 c006 	ldrh.w	ip, [r4, #6]
c0de0ed4:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de0ed8:	7aa2      	ldrb	r2, [r4, #10]
c0de0eda:	46b2      	mov	sl, r6
c0de0edc:	f9b4 6004 	ldrsh.w	r6, [r4, #4]
c0de0ee0:	2730      	movs	r7, #48	@ 0x30
c0de0ee2:	e9cd 7500 	strd	r7, r5, [sp]
c0de0ee6:	9102      	str	r1, [sp, #8]
c0de0ee8:	eb0b 0102 	add.w	r1, fp, r2
c0de0eec:	eb03 020c 	add.w	r2, r3, ip
c0de0ef0:	465b      	mov	r3, fp
c0de0ef2:	1a51      	subs	r1, r2, r1
c0de0ef4:	eb0b 0206 	add.w	r2, fp, r6
c0de0ef8:	47d0      	blx	sl
c0de0efa:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0efe:	8922      	ldrh	r2, [r4, #8]
c0de0f00:	f9b4 6004 	ldrsh.w	r6, [r4, #4]
c0de0f04:	7aa7      	ldrb	r7, [r4, #10]
c0de0f06:	f9b4 c002 	ldrsh.w	ip, [r4, #2]
c0de0f0a:	230c      	movs	r3, #12
c0de0f0c:	e9cd 3500 	strd	r3, r5, [sp]
c0de0f10:	465b      	mov	r3, fp
c0de0f12:	9102      	str	r1, [sp, #8]
c0de0f14:	eb0b 0107 	add.w	r1, fp, r7
c0de0f18:	4432      	add	r2, r6
c0de0f1a:	1a52      	subs	r2, r2, r1
c0de0f1c:	eb0b 010c 	add.w	r1, fp, ip
c0de0f20:	47d0      	blx	sl
c0de0f22:	7aa2      	ldrb	r2, [r4, #10]
c0de0f24:	88e3      	ldrh	r3, [r4, #6]
c0de0f26:	f9b4 6002 	ldrsh.w	r6, [r4, #2]
c0de0f2a:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de0f2e:	2103      	movs	r1, #3
c0de0f30:	e9d4 0e04 	ldrd	r0, lr, [r4, #16]
c0de0f34:	f8b4 c008 	ldrh.w	ip, [r4, #8]
c0de0f38:	e88d 4022 	stmia.w	sp, {r1, r5, lr}
c0de0f3c:	1999      	adds	r1, r3, r6
c0de0f3e:	445a      	add	r2, fp
c0de0f40:	465b      	mov	r3, fp
c0de0f42:	1a89      	subs	r1, r1, r2
c0de0f44:	1aba      	subs	r2, r7, r2
c0de0f46:	4462      	add	r2, ip
c0de0f48:	47d0      	blx	sl
c0de0f4a:	f8dd a01c 	ldr.w	sl, [sp, #28]
c0de0f4e:	9a08      	ldr	r2, [sp, #32]
c0de0f50:	4645      	mov	r5, r8
c0de0f52:	2a04      	cmp	r2, #4
c0de0f54:	f000 8098 	beq.w	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0f58:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de0f5a:	2800      	cmp	r0, #0
c0de0f5c:	f000 8094 	beq.w	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0f60:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0f62:	2800      	cmp	r0, #0
c0de0f64:	f000 8090 	beq.w	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0f68:	f042 0102 	orr.w	r1, r2, #2
c0de0f6c:	e9d4 8004 	ldrd	r8, r0, [r4, #16]
c0de0f70:	46d4      	mov	ip, sl
c0de0f72:	2903      	cmp	r1, #3
c0de0f74:	d116      	bne.n	c0de0fa4 <bagl_draw_with_context+0x3e0>
c0de0f76:	7b21      	ldrb	r1, [r4, #12]
c0de0f78:	2901      	cmp	r1, #1
c0de0f7a:	d113      	bne.n	c0de0fa4 <bagl_draw_with_context+0x3e0>
c0de0f7c:	9008      	str	r0, [sp, #32]
c0de0f7e:	e014      	b.n	c0de0faa <bagl_draw_with_context+0x3e6>
c0de0f80:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
c0de0f84:	f9b4 0002 	ldrsh.w	r0, [r4, #2]
c0de0f88:	7b23      	ldrb	r3, [r4, #12]
c0de0f8a:	198a      	adds	r2, r1, r6
c0de0f8c:	1981      	adds	r1, r0, r6
c0de0f8e:	6920      	ldr	r0, [r4, #16]
c0de0f90:	2b01      	cmp	r3, #1
c0de0f92:	d070      	beq.n	c0de1076 <bagl_draw_with_context+0x4b2>
c0de0f94:	7aa3      	ldrb	r3, [r4, #10]
c0de0f96:	42b3      	cmp	r3, r6
c0de0f98:	d26d      	bcs.n	c0de1076 <bagl_draw_with_context+0x4b2>
c0de0f9a:	1af3      	subs	r3, r6, r3
c0de0f9c:	e06c      	b.n	c0de1078 <bagl_draw_with_context+0x4b4>
c0de0f9e:	bf00      	nop
c0de0fa0:	000015b0 	.word	0x000015b0
c0de0fa4:	f8cd 8020 	str.w	r8, [sp, #32]
c0de0fa8:	4680      	mov	r8, r0
c0de0faa:	8926      	ldrh	r6, [r4, #8]
c0de0fac:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
c0de0fb0:	1fd7      	subs	r7, r2, #7
c0de0fb2:	8b20      	ldrh	r0, [r4, #24]
c0de0fb4:	f9b4 e002 	ldrsh.w	lr, [r4, #2]
c0de0fb8:	88e3      	ldrh	r3, [r4, #6]
c0de0fba:	f8dd a034 	ldr.w	sl, [sp, #52]	@ 0x34
c0de0fbe:	bf18      	it	ne
c0de0fc0:	4657      	movne	r7, sl
c0de0fc2:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de0fc6:	1bf6      	subs	r6, r6, r7
c0de0fc8:	2a07      	cmp	r2, #7
c0de0fca:	bf08      	it	eq
c0de0fcc:	f1cc 0a00 	rsbeq	sl, ip, #0
c0de0fd0:	eb0a 0201 	add.w	r2, sl, r1
c0de0fd4:	eba3 030b 	sub.w	r3, r3, fp
c0de0fd8:	f8cd a034 	str.w	sl, [sp, #52]	@ 0x34
c0de0fdc:	e88d 004c 	stmia.w	sp, {r2, r3, r6}
c0de0fe0:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de0fe2:	2100      	movs	r1, #0
c0de0fe4:	eb0b 030e 	add.w	r3, fp, lr
c0de0fe8:	9105      	str	r1, [sp, #20]
c0de0fea:	9908      	ldr	r1, [sp, #32]
c0de0fec:	e9cd 2503 	strd	r2, r5, [sp, #12]
c0de0ff0:	4642      	mov	r2, r8
c0de0ff2:	f000 f8bb 	bl	c0de116c <bagl_draw_string>
c0de0ff6:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0ff8:	2900      	cmp	r1, #0
c0de0ffa:	d045      	beq.n	c0de1088 <bagl_draw_with_context+0x4c4>
c0de0ffc:	4a40      	ldr	r2, [pc, #256]	@ (c0de1100 <bagl_draw_with_context+0x53c>)
c0de0ffe:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de1002:	f8dd b034 	ldr.w	fp, [sp, #52]	@ 0x34
c0de1006:	88e6      	ldrh	r6, [r4, #6]
c0de1008:	9d09      	ldr	r5, [sp, #36]	@ 0x24
c0de100a:	8921      	ldrh	r1, [r4, #8]
c0de100c:	f8b4 c018 	ldrh.w	ip, [r4, #24]
c0de1010:	f04f 0e03 	mov.w	lr, #3
c0de1014:	1b76      	subs	r6, r6, r5
c0de1016:	445b      	add	r3, fp
c0de1018:	447a      	add	r2, pc
c0de101a:	1bc9      	subs	r1, r1, r7
c0de101c:	e9cd 3600 	strd	r3, r6, [sp]
c0de1020:	ab02      	add	r3, sp, #8
c0de1022:	f8cd 801c 	str.w	r8, [sp, #28]
c0de1026:	e8a3 4006 	stmia.w	r3!, {r1, r2, lr}
c0de102a:	4642      	mov	r2, r8
c0de102c:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de1030:	2100      	movs	r1, #0
c0de1032:	9105      	str	r1, [sp, #20]
c0de1034:	b283      	uxth	r3, r0
c0de1036:	4660      	mov	r0, ip
c0de1038:	4641      	mov	r1, r8
c0de103a:	f000 f897 	bl	c0de116c <bagl_draw_string>
c0de103e:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de1042:	e9dd 610b 	ldrd	r6, r1, [sp, #44]	@ 0x2c
c0de1046:	88e3      	ldrh	r3, [r4, #6]
c0de1048:	f8b4 c018 	ldrh.w	ip, [r4, #24]
c0de104c:	8924      	ldrh	r4, [r4, #8]
c0de104e:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de1052:	445a      	add	r2, fp
c0de1054:	440e      	add	r6, r1
c0de1056:	2100      	movs	r1, #0
c0de1058:	1be4      	subs	r4, r4, r7
c0de105a:	1b5b      	subs	r3, r3, r5
c0de105c:	e88d 041c 	stmia.w	sp, {r2, r3, r4, sl}
c0de1060:	9a07      	ldr	r2, [sp, #28]
c0de1062:	eba6 060a 	sub.w	r6, r6, sl
c0de1066:	9105      	str	r1, [sp, #20]
c0de1068:	b283      	uxth	r3, r0
c0de106a:	4660      	mov	r0, ip
c0de106c:	4641      	mov	r1, r8
c0de106e:	9604      	str	r6, [sp, #16]
c0de1070:	f000 f87c 	bl	c0de116c <bagl_draw_string>
c0de1074:	e008      	b.n	c0de1088 <bagl_draw_with_context+0x4c4>
c0de1076:	2300      	movs	r3, #0
c0de1078:	6964      	ldr	r4, [r4, #20]
c0de107a:	25ff      	movs	r5, #255	@ 0xff
c0de107c:	e9cd 5300 	strd	r5, r3, [sp]
c0de1080:	4633      	mov	r3, r6
c0de1082:	9402      	str	r4, [sp, #8]
c0de1084:	f000 f9cc 	bl	c0de1420 <bagl_draw_circle_helper>
c0de1088:	b00e      	add	sp, #56	@ 0x38
c0de108a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de108e:	f8dd c020 	ldr.w	ip, [sp, #32]
c0de1092:	e003      	b.n	c0de109c <bagl_draw_with_context+0x4d8>
c0de1094:	4635      	mov	r5, r6
c0de1096:	e003      	b.n	c0de10a0 <bagl_draw_with_context+0x4dc>
c0de1098:	4635      	mov	r5, r6
c0de109a:	46dc      	mov	ip, fp
c0de109c:	f8dd e01c 	ldr.w	lr, [sp, #28]
c0de10a0:	8b20      	ldrh	r0, [r4, #24]
c0de10a2:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de10a6:	f400 4240 	and.w	r2, r0, #49152	@ 0xc000
c0de10aa:	f5b2 4f00 	cmp.w	r2, #32768	@ 0x8000
c0de10ae:	d004      	beq.n	c0de10ba <bagl_draw_with_context+0x4f6>
c0de10b0:	f5b2 4f80 	cmp.w	r2, #16384	@ 0x4000
c0de10b4:	d107      	bne.n	c0de10c6 <bagl_draw_with_context+0x502>
c0de10b6:	1bc9      	subs	r1, r1, r7
c0de10b8:	e002      	b.n	c0de10c0 <bagl_draw_with_context+0x4fc>
c0de10ba:	0849      	lsrs	r1, r1, #1
c0de10bc:	eba1 0157 	sub.w	r1, r1, r7, lsr #1
c0de10c0:	ea21 71e1 	bic.w	r1, r1, r1, asr #31
c0de10c4:	e000      	b.n	c0de10c8 <bagl_draw_with_context+0x504>
c0de10c6:	2100      	movs	r1, #0
c0de10c8:	f400 5040 	and.w	r0, r0, #12288	@ 0x3000
c0de10cc:	9109      	str	r1, [sp, #36]	@ 0x24
c0de10ce:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
c0de10d2:	d007      	beq.n	c0de10e4 <bagl_draw_with_context+0x520>
c0de10d4:	f5b0 5f80 	cmp.w	r0, #4096	@ 0x1000
c0de10d8:	bf12      	itee	ne
c0de10da:	2000      	movne	r0, #0
c0de10dc:	8920      	ldrheq	r0, [r4, #8]
c0de10de:	eba0 000e 	subeq.w	r0, r0, lr
c0de10e2:	e004      	b.n	c0de10ee <bagl_draw_with_context+0x52a>
c0de10e4:	8920      	ldrh	r0, [r4, #8]
c0de10e6:	ea6f 015e 	mvn.w	r1, lr, lsr #1
c0de10ea:	eb01 0050 	add.w	r0, r1, r0, lsr #1
c0de10ee:	900d      	str	r0, [sp, #52]	@ 0x34
c0de10f0:	e603      	b.n	c0de0cfa <bagl_draw_with_context+0x136>
c0de10f2:	bf00      	nop
c0de10f4:	0000137f 	.word	0x0000137f
c0de10f8:	000013b1 	.word	0x000013b1
c0de10fc:	00000555 	.word	0x00000555
c0de1100:	000011ec 	.word	0x000011ec

c0de1104 <bagl_get_font>:
c0de1104:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1106:	4604      	mov	r4, r0
c0de1108:	480c      	ldr	r0, [pc, #48]	@ (c0de113c <bagl_get_font+0x38>)
c0de110a:	4f0d      	ldr	r7, [pc, #52]	@ (c0de1140 <bagl_get_font+0x3c>)
c0de110c:	f36f 341f 	bfc	r4, #12, #20
c0de1110:	4478      	add	r0, pc
c0de1112:	447f      	add	r7, pc
c0de1114:	6806      	ldr	r6, [r0, #0]
c0de1116:	b17e      	cbz	r6, c0de1138 <bagl_get_font+0x34>
c0de1118:	eb07 0086 	add.w	r0, r7, r6, lsl #2
c0de111c:	f850 5c04 	ldr.w	r5, [r0, #-4]
c0de1120:	4628      	mov	r0, r5
c0de1122:	f000 ff21 	bl	c0de1f68 <pic>
c0de1126:	7880      	ldrb	r0, [r0, #2]
c0de1128:	3e01      	subs	r6, #1
c0de112a:	4284      	cmp	r4, r0
c0de112c:	d1f3      	bne.n	c0de1116 <bagl_get_font+0x12>
c0de112e:	4628      	mov	r0, r5
c0de1130:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de1134:	f000 bf18 	b.w	c0de1f68 <pic>
c0de1138:	2000      	movs	r0, #0
c0de113a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de113c:	00001cc8 	.word	0x00001cc8
c0de1140:	00001cba 	.word	0x00001cba

c0de1144 <bagl_compute_line_width>:
c0de1144:	b5b0      	push	{r4, r5, r7, lr}
c0de1146:	b086      	sub	sp, #24
c0de1148:	2400      	movs	r4, #0
c0de114a:	f243 0539 	movw	r5, #12345	@ 0x3039
c0de114e:	e9cd 5100 	strd	r5, r1, [sp]
c0de1152:	e9cd 4202 	strd	r4, r2, [sp, #8]
c0de1156:	e9cd 3404 	strd	r3, r4, [sp, #16]
c0de115a:	2100      	movs	r1, #0
c0de115c:	2200      	movs	r2, #0
c0de115e:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de1162:	f000 f803 	bl	c0de116c <bagl_draw_string>
c0de1166:	b280      	uxth	r0, r0
c0de1168:	b006      	add	sp, #24
c0de116a:	bdb0      	pop	{r4, r5, r7, pc}

c0de116c <bagl_draw_string>:
c0de116c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1170:	b0a4      	sub	sp, #144	@ 0x90
c0de1172:	f8dd b0b0 	ldr.w	fp, [sp, #176]	@ 0xb0
c0de1176:	e9cd 2114 	strd	r2, r1, [sp, #80]	@ 0x50
c0de117a:	f243 0139 	movw	r1, #12345	@ 0x3039
c0de117e:	9208      	str	r2, [sp, #32]
c0de1180:	461d      	mov	r5, r3
c0de1182:	ea8b 0201 	eor.w	r2, fp, r1
c0de1186:	4059      	eors	r1, r3
c0de1188:	ea51 0402 	orrs.w	r4, r1, r2
c0de118c:	bf18      	it	ne
c0de118e:	2401      	movne	r4, #1
c0de1190:	f7ff ffb8 	bl	c0de1104 <bagl_get_font>
c0de1194:	2800      	cmp	r0, #0
c0de1196:	f000 8136 	beq.w	c0de1406 <bagl_draw_string+0x29a>
c0de119a:	4682      	mov	sl, r0
c0de119c:	462f      	mov	r7, r5
c0de119e:	e9dd 212d 	ldrd	r2, r1, [sp, #180]	@ 0xb4
c0de11a2:	2301      	movs	r3, #1
c0de11a4:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de11a6:	9e2f      	ldr	r6, [sp, #188]	@ 0xbc
c0de11a8:	46a4      	mov	ip, r4
c0de11aa:	f89a 5003 	ldrb.w	r5, [sl, #3]
c0de11ae:	40ab      	lsls	r3, r5
c0de11b0:	9510      	str	r5, [sp, #64]	@ 0x40
c0de11b2:	9307      	str	r3, [sp, #28]
c0de11b4:	2c00      	cmp	r4, #0
c0de11b6:	bf08      	it	eq
c0de11b8:	46a3      	moveq	fp, r4
c0de11ba:	4459      	add	r1, fp
c0de11bc:	4623      	mov	r3, r4
c0de11be:	9105      	str	r1, [sp, #20]
c0de11c0:	bf18      	it	ne
c0de11c2:	463b      	movne	r3, r7
c0de11c4:	eb03 0e02 	add.w	lr, r3, r2
c0de11c8:	9706      	str	r7, [sp, #24]
c0de11ca:	e9cd e40a 	strd	lr, r4, [sp, #40]	@ 0x28
c0de11ce:	3601      	adds	r6, #1
c0de11d0:	f1c0 0001 	rsb	r0, r0, #1
c0de11d4:	f8cd b024 	str.w	fp, [sp, #36]	@ 0x24
c0de11d8:	2801      	cmp	r0, #1
c0de11da:	f000 810d 	beq.w	c0de13f8 <bagl_draw_string+0x28c>
c0de11de:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de11e0:	f89a 7004 	ldrb.w	r7, [sl, #4]
c0de11e4:	f89a 0006 	ldrb.w	r0, [sl, #6]
c0de11e8:	f816 5c01 	ldrb.w	r5, [r6, #-1]
c0de11ec:	4c8b      	ldr	r4, [pc, #556]	@ (c0de141c <bagl_draw_string+0x2b0>)
c0de11ee:	4285      	cmp	r5, r0
c0de11f0:	447c      	add	r4, pc
c0de11f2:	d303      	bcc.n	c0de11fc <bagl_draw_string+0x90>
c0de11f4:	f89a 1007 	ldrb.w	r1, [sl, #7]
c0de11f8:	428d      	cmp	r5, r1
c0de11fa:	d916      	bls.n	c0de122a <bagl_draw_string+0xbe>
c0de11fc:	2dc0      	cmp	r5, #192	@ 0xc0
c0de11fe:	d302      	bcc.n	c0de1206 <bagl_draw_string+0x9a>
c0de1200:	f005 043f 	and.w	r4, r5, #63	@ 0x3f
c0de1204:	e004      	b.n	c0de1210 <bagl_draw_string+0xa4>
c0de1206:	b268      	sxtb	r0, r5
c0de1208:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de120c:	dd2e      	ble.n	c0de126c <bagl_draw_string+0x100>
c0de120e:	2400      	movs	r4, #0
c0de1210:	2000      	movs	r0, #0
c0de1212:	465a      	mov	r2, fp
c0de1214:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1216:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de1218:	9712      	str	r7, [sp, #72]	@ 0x48
c0de121a:	f04f 0800 	mov.w	r8, #0
c0de121e:	2100      	movs	r1, #0
c0de1220:	4378      	muls	r0, r7
c0de1222:	2700      	movs	r7, #0
c0de1224:	fb00 f504 	mul.w	r5, r0, r4
c0de1228:	e090      	b.n	c0de134c <bagl_draw_string+0x1e0>
c0de122a:	1a2d      	subs	r5, r5, r0
c0de122c:	f8da 000c 	ldr.w	r0, [sl, #12]
c0de1230:	e9cd 630e 	strd	r6, r3, [sp, #56]	@ 0x38
c0de1234:	f000 fe98 	bl	c0de1f68 <pic>
c0de1238:	4683      	mov	fp, r0
c0de123a:	f000 fab3 	bl	c0de17a4 <OUTLINED_FUNCTION_3>
c0de123e:	f850 6025 	ldr.w	r6, [r0, r5, lsl #2]
c0de1242:	f89a 0006 	ldrb.w	r0, [sl, #6]
c0de1246:	f89a 1007 	ldrb.w	r1, [sl, #7]
c0de124a:	9712      	str	r7, [sp, #72]	@ 0x48
c0de124c:	1a08      	subs	r0, r1, r0
c0de124e:	4285      	cmp	r5, r0
c0de1250:	d135      	bne.n	c0de12be <bagl_draw_string+0x152>
c0de1252:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de1256:	f8ba 8000 	ldrh.w	r8, [sl]
c0de125a:	f000 fe85 	bl	c0de1f68 <pic>
c0de125e:	f830 0025 	ldrh.w	r0, [r0, r5, lsl #2]
c0de1262:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de1266:	eba8 0000 	sub.w	r0, r8, r0
c0de126a:	e038      	b.n	c0de12de <bagl_draw_string+0x172>
c0de126c:	06a8      	lsls	r0, r5, #26
c0de126e:	930f      	str	r3, [sp, #60]	@ 0x3c
c0de1270:	f04f 000f 	mov.w	r0, #15
c0de1274:	bf58      	it	pl
c0de1276:	200e      	movpl	r0, #14
c0de1278:	f7ff ff44 	bl	c0de1104 <bagl_get_font>
c0de127c:	2800      	cmp	r0, #0
c0de127e:	d076      	beq.n	c0de136e <bagl_draw_string+0x202>
c0de1280:	4680      	mov	r8, r0
c0de1282:	68c0      	ldr	r0, [r0, #12]
c0de1284:	47a0      	blx	r4
c0de1286:	4607      	mov	r7, r0
c0de1288:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de128c:	47a0      	blx	r4
c0de128e:	f005 051f 	and.w	r5, r5, #31
c0de1292:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de1296:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de129a:	4438      	add	r0, r7
c0de129c:	9011      	str	r0, [sp, #68]	@ 0x44
c0de129e:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de12a2:	47a0      	blx	r4
c0de12a4:	f89a 1005 	ldrb.w	r1, [sl, #5]
c0de12a8:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de12ac:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de12b0:	f898 7004 	ldrb.w	r7, [r8, #4]
c0de12b4:	4459      	add	r1, fp
c0de12b6:	f3c0 3484 	ubfx	r4, r0, #14, #5
c0de12ba:	1a8a      	subs	r2, r1, r2
c0de12bc:	e05b      	b.n	c0de1376 <bagl_draw_string+0x20a>
c0de12be:	f000 fa71 	bl	c0de17a4 <OUTLINED_FUNCTION_3>
c0de12c2:	eb00 0085 	add.w	r0, r0, r5, lsl #2
c0de12c6:	4637      	mov	r7, r6
c0de12c8:	6840      	ldr	r0, [r0, #4]
c0de12ca:	f3c0 068b 	ubfx	r6, r0, #2, #12
c0de12ce:	f000 fa69 	bl	c0de17a4 <OUTLINED_FUNCTION_3>
c0de12d2:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de12d6:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de12da:	1a30      	subs	r0, r6, r0
c0de12dc:	463e      	mov	r6, r7
c0de12de:	900d      	str	r0, [sp, #52]	@ 0x34
c0de12e0:	f3c6 008b 	ubfx	r0, r6, #2, #12
c0de12e4:	4458      	add	r0, fp
c0de12e6:	9011      	str	r0, [sp, #68]	@ 0x44
c0de12e8:	f000 fa60 	bl	c0de17ac <OUTLINED_FUNCTION_4>
c0de12ec:	f850 7025 	ldr.w	r7, [r0, r5, lsl #2]
c0de12f0:	f000 fa5c 	bl	c0de17ac <OUTLINED_FUNCTION_4>
c0de12f4:	f850 8025 	ldr.w	r8, [r0, r5, lsl #2]
c0de12f8:	f000 fa58 	bl	c0de17ac <OUTLINED_FUNCTION_4>
c0de12fc:	f850 b025 	ldr.w	fp, [r0, r5, lsl #2]
c0de1300:	f000 fa54 	bl	c0de17ac <OUTLINED_FUNCTION_4>
c0de1304:	f850 6025 	ldr.w	r6, [r0, r5, lsl #2]
c0de1308:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de130c:	900c      	str	r0, [sp, #48]	@ 0x30
c0de130e:	f000 fa4d 	bl	c0de17ac <OUTLINED_FUNCTION_4>
c0de1312:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de1316:	f3c7 3184 	ubfx	r1, r7, #14, #5
c0de131a:	ea4f 771b 	mov.w	r7, fp, lsr #28
c0de131e:	e9dd ec0a 	ldrd	lr, ip, [sp, #40]	@ 0x28
c0de1322:	f3c8 48c3 	ubfx	r8, r8, #19, #4
c0de1326:	f3c0 40c3 	ubfx	r0, r0, #19, #4
c0de132a:	eb00 701b 	add.w	r0, r0, fp, lsr #28
c0de132e:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de1332:	1a08      	subs	r0, r1, r0
c0de1334:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de1336:	b2c4      	uxtb	r4, r0
c0de1338:	f3c6 50c4 	ubfx	r0, r6, #23, #5
c0de133c:	e9dd 630e 	ldrd	r6, r3, [sp, #56]	@ 0x38
c0de1340:	465a      	mov	r2, fp
c0de1342:	1a40      	subs	r0, r0, r1
c0de1344:	f100 0109 	add.w	r1, r0, #9
c0de1348:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de134a:	00c5      	lsls	r5, r0, #3
c0de134c:	4618      	mov	r0, r3
c0de134e:	f1bc 0f00 	cmp.w	ip, #0
c0de1352:	4443      	add	r3, r8
c0de1354:	d113      	bne.n	c0de137e <bagl_draw_string+0x212>
c0de1356:	f1be 0f00 	cmp.w	lr, #0
c0de135a:	dd02      	ble.n	c0de1362 <bagl_draw_string+0x1f6>
c0de135c:	1919      	adds	r1, r3, r4
c0de135e:	4571      	cmp	r1, lr
c0de1360:	dc54      	bgt.n	c0de140c <bagl_draw_string+0x2a0>
c0de1362:	19d8      	adds	r0, r3, r7
c0de1364:	3601      	adds	r6, #1
c0de1366:	1903      	adds	r3, r0, r4
c0de1368:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de136a:	3001      	adds	r0, #1
c0de136c:	e734      	b.n	c0de11d8 <bagl_draw_string+0x6c>
c0de136e:	2000      	movs	r0, #0
c0de1370:	2400      	movs	r4, #0
c0de1372:	465a      	mov	r2, fp
c0de1374:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1376:	e9dd ec0a 	ldrd	lr, ip, [sp, #40]	@ 0x28
c0de137a:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
c0de137c:	e74b      	b.n	c0de1216 <bagl_draw_string+0xaa>
c0de137e:	4423      	add	r3, r4
c0de1380:	4573      	cmp	r3, lr
c0de1382:	dd0d      	ble.n	c0de13a0 <bagl_draw_string+0x234>
c0de1384:	9a12      	ldr	r2, [sp, #72]	@ 0x48
c0de1386:	f10b 0b0c 	add.w	fp, fp, #12
c0de138a:	9b05      	ldr	r3, [sp, #20]
c0de138c:	f8dd e018 	ldr.w	lr, [sp, #24]
c0de1390:	f8dd c044 	ldr.w	ip, [sp, #68]	@ 0x44
c0de1394:	445a      	add	r2, fp
c0de1396:	440a      	add	r2, r1
c0de1398:	429a      	cmp	r2, r3
c0de139a:	465a      	mov	r2, fp
c0de139c:	dd03      	ble.n	c0de13a6 <bagl_draw_string+0x23a>
c0de139e:	e03a      	b.n	c0de1416 <bagl_draw_string+0x2aa>
c0de13a0:	f8dd c044 	ldr.w	ip, [sp, #68]	@ 0x44
c0de13a4:	4686      	mov	lr, r0
c0de13a6:	f1bc 0f00 	cmp.w	ip, #0
c0de13aa:	d014      	beq.n	c0de13d6 <bagl_draw_string+0x26a>
c0de13ac:	9b07      	ldr	r3, [sp, #28]
c0de13ae:	b2a8      	uxth	r0, r5
c0de13b0:	4411      	add	r1, r2
c0de13b2:	4622      	mov	r2, r4
c0de13b4:	4675      	mov	r5, lr
c0de13b6:	9300      	str	r3, [sp, #0]
c0de13b8:	ab14      	add	r3, sp, #80	@ 0x50
c0de13ba:	9004      	str	r0, [sp, #16]
c0de13bc:	eb0e 0008 	add.w	r0, lr, r8
c0de13c0:	9301      	str	r3, [sp, #4]
c0de13c2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
c0de13c4:	e9cd 3c02 	strd	r3, ip, [sp, #8]
c0de13c8:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de13ca:	f000 feb3 	bl	c0de2134 <bagl_hal_draw_bitmap_within_rect>
c0de13ce:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de13d2:	d008      	beq.n	c0de13e6 <bagl_draw_string+0x27a>
c0de13d4:	e01d      	b.n	c0de1412 <bagl_draw_string+0x2a6>
c0de13d6:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de13d8:	4671      	mov	r1, lr
c0de13da:	4623      	mov	r3, r4
c0de13dc:	4675      	mov	r5, lr
c0de13de:	9000      	str	r0, [sp, #0]
c0de13e0:	9808      	ldr	r0, [sp, #32]
c0de13e2:	f000 febf 	bl	c0de2164 <bagl_hal_draw_rect>
c0de13e6:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de13e8:	eb07 0108 	add.w	r1, r7, r8
c0de13ec:	e9dd ec0a 	ldrd	lr, ip, [sp, #40]	@ 0x28
c0de13f0:	4421      	add	r1, r4
c0de13f2:	4240      	negs	r0, r0
c0de13f4:	194b      	adds	r3, r1, r5
c0de13f6:	e6ea      	b.n	c0de11ce <bagl_draw_string+0x62>
c0de13f8:	f1bc 0f00 	cmp.w	ip, #0
c0de13fc:	d005      	beq.n	c0de140a <bagl_draw_string+0x29e>
c0de13fe:	b298      	uxth	r0, r3
c0de1400:	ea40 400b 	orr.w	r0, r0, fp, lsl #16
c0de1404:	e002      	b.n	c0de140c <bagl_draw_string+0x2a0>
c0de1406:	2000      	movs	r0, #0
c0de1408:	e000      	b.n	c0de140c <bagl_draw_string+0x2a0>
c0de140a:	4618      	mov	r0, r3
c0de140c:	b024      	add	sp, #144	@ 0x90
c0de140e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1412:	4628      	mov	r0, r5
c0de1414:	e7fa      	b.n	c0de140c <bagl_draw_string+0x2a0>
c0de1416:	b280      	uxth	r0, r0
c0de1418:	e7f2      	b.n	c0de1400 <bagl_draw_string+0x294>
c0de141a:	bf00      	nop
c0de141c:	00000d75 	.word	0x00000d75

c0de1420 <bagl_draw_circle_helper>:
c0de1420:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1424:	b090      	sub	sp, #64	@ 0x40
c0de1426:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1428:	9819      	ldr	r0, [sp, #100]	@ 0x64
c0de142a:	4616      	mov	r6, r2
c0de142c:	2400      	movs	r4, #0
c0de142e:	f8dd b060 	ldr.w	fp, [sp, #96]	@ 0x60
c0de1432:	f04f 0a00 	mov.w	sl, #0
c0de1436:	1a1d      	subs	r5, r3, r0
c0de1438:	4602      	mov	r2, r0
c0de143a:	2d00      	cmp	r5, #0
c0de143c:	bfc8      	it	gt
c0de143e:	2401      	movgt	r4, #1
c0de1440:	2800      	cmp	r0, #0
c0de1442:	bf18      	it	ne
c0de1444:	2201      	movne	r2, #1
c0de1446:	9507      	str	r5, [sp, #28]
c0de1448:	910e      	str	r1, [sp, #56]	@ 0x38
c0de144a:	960d      	str	r6, [sp, #52]	@ 0x34
c0de144c:	4022      	ands	r2, r4
c0de144e:	461c      	mov	r4, r3
c0de1450:	920b      	str	r2, [sp, #44]	@ 0x2c
c0de1452:	1ac2      	subs	r2, r0, r3
c0de1454:	4408      	add	r0, r1
c0de1456:	1ac0      	subs	r0, r0, r3
c0de1458:	3201      	adds	r2, #1
c0de145a:	3001      	adds	r0, #1
c0de145c:	9201      	str	r2, [sp, #4]
c0de145e:	1e6a      	subs	r2, r5, #1
c0de1460:	9004      	str	r0, [sp, #16]
c0de1462:	1b48      	subs	r0, r1, r5
c0de1464:	2500      	movs	r5, #0
c0de1466:	9205      	str	r2, [sp, #20]
c0de1468:	3001      	adds	r0, #1
c0de146a:	9003      	str	r0, [sp, #12]
c0de146c:	4630      	mov	r0, r6
c0de146e:	1e70      	subs	r0, r6, #1
c0de1470:	9002      	str	r0, [sp, #8]
c0de1472:	f1c3 0001 	rsb	r0, r3, #1
c0de1476:	9009      	str	r0, [sp, #36]	@ 0x24
c0de1478:	2003      	movs	r0, #3
c0de147a:	9008      	str	r0, [sp, #32]
c0de147c:	429d      	cmp	r5, r3
c0de147e:	9406      	str	r4, [sp, #24]
c0de1480:	f300 8154 	bgt.w	c0de172c <bagl_draw_circle_helper+0x30c>
c0de1484:	461c      	mov	r4, r3
c0de1486:	ea5f 70cb 	movs.w	r0, fp, lsl #31
c0de148a:	ea4f 768b 	mov.w	r6, fp, lsl #30
c0de148e:	950c      	str	r5, [sp, #48]	@ 0x30
c0de1490:	d106      	bne.n	c0de14a0 <bagl_draw_circle_helper+0x80>
c0de1492:	2e00      	cmp	r6, #0
c0de1494:	f04f 0601 	mov.w	r6, #1
c0de1498:	d546      	bpl.n	c0de1528 <bagl_draw_circle_helper+0x108>
c0de149a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de149c:	b9e8      	cbnz	r0, c0de14da <bagl_draw_circle_helper+0xba>
c0de149e:	e03b      	b.n	c0de1518 <bagl_draw_circle_helper+0xf8>
c0de14a0:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de14a2:	2800      	cmp	r0, #0
c0de14a4:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de14a6:	eb00 0705 	add.w	r7, r0, r5
c0de14aa:	d029      	beq.n	c0de1500 <bagl_draw_circle_helper+0xe0>
c0de14ac:	9805      	ldr	r0, [sp, #20]
c0de14ae:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de14b0:	f04f 0801 	mov.w	r8, #1
c0de14b4:	463a      	mov	r2, r7
c0de14b6:	f8cd 8000 	str.w	r8, [sp]
c0de14ba:	1a23      	subs	r3, r4, r0
c0de14bc:	f000 f96f 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de14c0:	9803      	ldr	r0, [sp, #12]
c0de14c2:	9b07      	ldr	r3, [sp, #28]
c0de14c4:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de14c6:	463a      	mov	r2, r7
c0de14c8:	f8cd 8000 	str.w	r8, [sp]
c0de14cc:	1901      	adds	r1, r0, r4
c0de14ce:	f000 f963 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de14d2:	2e00      	cmp	r6, #0
c0de14d4:	f04f 0601 	mov.w	r6, #1
c0de14d8:	d526      	bpl.n	c0de1528 <bagl_draw_circle_helper+0x108>
c0de14da:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de14dc:	1827      	adds	r7, r4, r0
c0de14de:	9806      	ldr	r0, [sp, #24]
c0de14e0:	42a0      	cmp	r0, r4
c0de14e2:	d006      	beq.n	c0de14f2 <bagl_draw_circle_helper+0xd2>
c0de14e4:	9801      	ldr	r0, [sp, #4]
c0de14e6:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de14e8:	463a      	mov	r2, r7
c0de14ea:	9600      	str	r6, [sp, #0]
c0de14ec:	1943      	adds	r3, r0, r5
c0de14ee:	f000 f956 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de14f2:	9804      	ldr	r0, [sp, #16]
c0de14f4:	9b07      	ldr	r3, [sp, #28]
c0de14f6:	9600      	str	r6, [sp, #0]
c0de14f8:	463a      	mov	r2, r7
c0de14fa:	1941      	adds	r1, r0, r5
c0de14fc:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de14fe:	e011      	b.n	c0de1524 <bagl_draw_circle_helper+0x104>
c0de1500:	2001      	movs	r0, #1
c0de1502:	1e7a      	subs	r2, r7, #1
c0de1504:	4623      	mov	r3, r4
c0de1506:	9000      	str	r0, [sp, #0]
c0de1508:	e9dd 100e 	ldrd	r1, r0, [sp, #56]	@ 0x38
c0de150c:	f000 fe2a 	bl	c0de2164 <bagl_hal_draw_rect>
c0de1510:	2e00      	cmp	r6, #0
c0de1512:	f04f 0601 	mov.w	r6, #1
c0de1516:	d507      	bpl.n	c0de1528 <bagl_draw_circle_helper+0x108>
c0de1518:	9802      	ldr	r0, [sp, #8]
c0de151a:	462b      	mov	r3, r5
c0de151c:	9600      	str	r6, [sp, #0]
c0de151e:	1902      	adds	r2, r0, r4
c0de1520:	e9dd 100e 	ldrd	r1, r0, [sp, #56]	@ 0x38
c0de1524:	f000 fe1e 	bl	c0de2164 <bagl_hal_draw_rect>
c0de1528:	ea5f 704b 	movs.w	r0, fp, lsl #29
c0de152c:	ea4f 770b 	mov.w	r7, fp, lsl #28
c0de1530:	f8cd a028 	str.w	sl, [sp, #40]	@ 0x28
c0de1534:	d406      	bmi.n	c0de1544 <bagl_draw_circle_helper+0x124>
c0de1536:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de153a:	2f00      	cmp	r7, #0
c0de153c:	d54a      	bpl.n	c0de15d4 <bagl_draw_circle_helper+0x1b4>
c0de153e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1540:	bb08      	cbnz	r0, c0de1586 <bagl_draw_circle_helper+0x166>
c0de1542:	e032      	b.n	c0de15aa <bagl_draw_circle_helper+0x18a>
c0de1544:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de1546:	eba0 0a04 	sub.w	sl, r0, r4
c0de154a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de154c:	b308      	cbz	r0, c0de1592 <bagl_draw_circle_helper+0x172>
c0de154e:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de1550:	f8dd 8014 	ldr.w	r8, [sp, #20]
c0de1554:	9600      	str	r6, [sp, #0]
c0de1556:	4651      	mov	r1, sl
c0de1558:	1946      	adds	r6, r0, r5
c0de155a:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de155c:	eba4 0308 	sub.w	r3, r4, r8
c0de1560:	4632      	mov	r2, r6
c0de1562:	f000 fdff 	bl	c0de2164 <bagl_hal_draw_rect>
c0de1566:	2001      	movs	r0, #1
c0de1568:	9b07      	ldr	r3, [sp, #28]
c0de156a:	4632      	mov	r2, r6
c0de156c:	ebaa 0108 	sub.w	r1, sl, r8
c0de1570:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de1572:	f8dd b060 	ldr.w	fp, [sp, #96]	@ 0x60
c0de1576:	2601      	movs	r6, #1
c0de1578:	9000      	str	r0, [sp, #0]
c0de157a:	f000 f90d 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de157e:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de1582:	2f00      	cmp	r7, #0
c0de1584:	d526      	bpl.n	c0de15d4 <bagl_draw_circle_helper+0x1b4>
c0de1586:	9806      	ldr	r0, [sp, #24]
c0de1588:	42a0      	cmp	r0, r4
c0de158a:	d116      	bne.n	c0de15ba <bagl_draw_circle_helper+0x19a>
c0de158c:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de158e:	1827      	adds	r7, r4, r0
c0de1590:	e01c      	b.n	c0de15cc <bagl_draw_circle_helper+0x1ac>
c0de1592:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de1594:	4651      	mov	r1, sl
c0de1596:	4623      	mov	r3, r4
c0de1598:	9600      	str	r6, [sp, #0]
c0de159a:	4428      	add	r0, r5
c0de159c:	1e42      	subs	r2, r0, #1
c0de159e:	f000 f8fb 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de15a2:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de15a6:	2f00      	cmp	r7, #0
c0de15a8:	d514      	bpl.n	c0de15d4 <bagl_draw_circle_helper+0x1b4>
c0de15aa:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de15ac:	462b      	mov	r3, r5
c0de15ae:	9600      	str	r6, [sp, #0]
c0de15b0:	eb00 010a 	add.w	r1, r0, sl
c0de15b4:	9802      	ldr	r0, [sp, #8]
c0de15b6:	1902      	adds	r2, r0, r4
c0de15b8:	e00a      	b.n	c0de15d0 <bagl_draw_circle_helper+0x1b0>
c0de15ba:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de15bc:	f000 f90c 	bl	c0de17d8 <OUTLINED_FUNCTION_8>
c0de15c0:	1827      	adds	r7, r4, r0
c0de15c2:	9801      	ldr	r0, [sp, #4]
c0de15c4:	463a      	mov	r2, r7
c0de15c6:	1943      	adds	r3, r0, r5
c0de15c8:	f000 f8e9 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de15cc:	f000 f8fd 	bl	c0de17ca <OUTLINED_FUNCTION_7>
c0de15d0:	f000 f8e2 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de15d4:	f04f 0801 	mov.w	r8, #1
c0de15d8:	ea5f 60cb 	movs.w	r0, fp, lsl #27
c0de15dc:	ea4f 668b 	mov.w	r6, fp, lsl #26
c0de15e0:	d404      	bmi.n	c0de15ec <bagl_draw_circle_helper+0x1cc>
c0de15e2:	2e00      	cmp	r6, #0
c0de15e4:	d541      	bpl.n	c0de166a <bagl_draw_circle_helper+0x24a>
c0de15e6:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de15e8:	b9b8      	cbnz	r0, c0de161a <bagl_draw_circle_helper+0x1fa>
c0de15ea:	e035      	b.n	c0de1658 <bagl_draw_circle_helper+0x238>
c0de15ec:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de15ee:	eb00 050a 	add.w	r5, r0, sl
c0de15f2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de15f4:	b330      	cbz	r0, c0de1644 <bagl_draw_circle_helper+0x224>
c0de15f6:	9805      	ldr	r0, [sp, #20]
c0de15f8:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de15fa:	462a      	mov	r2, r5
c0de15fc:	f8cd 8000 	str.w	r8, [sp]
c0de1600:	1a23      	subs	r3, r4, r0
c0de1602:	f000 f8cc 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de1606:	9803      	ldr	r0, [sp, #12]
c0de1608:	9b07      	ldr	r3, [sp, #28]
c0de160a:	462a      	mov	r2, r5
c0de160c:	f8cd 8000 	str.w	r8, [sp]
c0de1610:	1901      	adds	r1, r0, r4
c0de1612:	f000 f8c1 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de1616:	2e00      	cmp	r6, #0
c0de1618:	d527      	bpl.n	c0de166a <bagl_draw_circle_helper+0x24a>
c0de161a:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de161c:	9f0c      	ldr	r7, [sp, #48]	@ 0x30
c0de161e:	2601      	movs	r6, #1
c0de1620:	1b05      	subs	r5, r0, r4
c0de1622:	9806      	ldr	r0, [sp, #24]
c0de1624:	42a0      	cmp	r0, r4
c0de1626:	d006      	beq.n	c0de1636 <bagl_draw_circle_helper+0x216>
c0de1628:	9801      	ldr	r0, [sp, #4]
c0de162a:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de162c:	462a      	mov	r2, r5
c0de162e:	9600      	str	r6, [sp, #0]
c0de1630:	19c3      	adds	r3, r0, r7
c0de1632:	f000 f8b4 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de1636:	9804      	ldr	r0, [sp, #16]
c0de1638:	9b07      	ldr	r3, [sp, #28]
c0de163a:	9600      	str	r6, [sp, #0]
c0de163c:	462a      	mov	r2, r5
c0de163e:	19c1      	adds	r1, r0, r7
c0de1640:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de1642:	e010      	b.n	c0de1666 <bagl_draw_circle_helper+0x246>
c0de1644:	e9dd 100e 	ldrd	r1, r0, [sp, #56]	@ 0x38
c0de1648:	462a      	mov	r2, r5
c0de164a:	4623      	mov	r3, r4
c0de164c:	f8cd 8000 	str.w	r8, [sp]
c0de1650:	f000 fd88 	bl	c0de2164 <bagl_hal_draw_rect>
c0de1654:	2e00      	cmp	r6, #0
c0de1656:	d508      	bpl.n	c0de166a <bagl_draw_circle_helper+0x24a>
c0de1658:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de165a:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
c0de165c:	f8cd 8000 	str.w	r8, [sp]
c0de1660:	1b02      	subs	r2, r0, r4
c0de1662:	e9dd 100e 	ldrd	r1, r0, [sp, #56]	@ 0x38
c0de1666:	f000 fd7d 	bl	c0de2164 <bagl_hal_draw_rect>
c0de166a:	ea5f 604b 	movs.w	r0, fp, lsl #25
c0de166e:	fa4f f68b 	sxtb.w	r6, fp
c0de1672:	d408      	bmi.n	c0de1686 <bagl_draw_circle_helper+0x266>
c0de1674:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de1676:	f1b6 3fff 	cmp.w	r6, #4294967295	@ 0xffffffff
c0de167a:	f04f 0601 	mov.w	r6, #1
c0de167e:	dc43      	bgt.n	c0de1708 <bagl_draw_circle_helper+0x2e8>
c0de1680:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1682:	b9f0      	cbnz	r0, c0de16c2 <bagl_draw_circle_helper+0x2a2>
c0de1684:	e02d      	b.n	c0de16e2 <bagl_draw_circle_helper+0x2c2>
c0de1686:	4650      	mov	r0, sl
c0de1688:	f8dd 8034 	ldr.w	r8, [sp, #52]	@ 0x34
c0de168c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de168e:	44d0      	add	r8, sl
c0de1690:	1b05      	subs	r5, r0, r4
c0de1692:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1694:	b1d8      	cbz	r0, c0de16ce <bagl_draw_circle_helper+0x2ae>
c0de1696:	9f05      	ldr	r7, [sp, #20]
c0de1698:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de169a:	f04f 0a01 	mov.w	sl, #1
c0de169e:	4629      	mov	r1, r5
c0de16a0:	4642      	mov	r2, r8
c0de16a2:	f8cd a000 	str.w	sl, [sp]
c0de16a6:	1be3      	subs	r3, r4, r7
c0de16a8:	f000 fd5c 	bl	c0de2164 <bagl_hal_draw_rect>
c0de16ac:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de16ae:	9b07      	ldr	r3, [sp, #28]
c0de16b0:	1be9      	subs	r1, r5, r7
c0de16b2:	4642      	mov	r2, r8
c0de16b4:	f8cd a000 	str.w	sl, [sp]
c0de16b8:	f000 fd54 	bl	c0de2164 <bagl_hal_draw_rect>
c0de16bc:	f000 f862 	bl	c0de1784 <OUTLINED_FUNCTION_0>
c0de16c0:	dc22      	bgt.n	c0de1708 <bagl_draw_circle_helper+0x2e8>
c0de16c2:	9806      	ldr	r0, [sp, #24]
c0de16c4:	42a0      	cmp	r0, r4
c0de16c6:	d112      	bne.n	c0de16ee <bagl_draw_circle_helper+0x2ce>
c0de16c8:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de16ca:	1b07      	subs	r7, r0, r4
c0de16cc:	e018      	b.n	c0de1700 <bagl_draw_circle_helper+0x2e0>
c0de16ce:	2001      	movs	r0, #1
c0de16d0:	4629      	mov	r1, r5
c0de16d2:	4642      	mov	r2, r8
c0de16d4:	4623      	mov	r3, r4
c0de16d6:	9000      	str	r0, [sp, #0]
c0de16d8:	f000 f85e 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de16dc:	f000 f852 	bl	c0de1784 <OUTLINED_FUNCTION_0>
c0de16e0:	dc12      	bgt.n	c0de1708 <bagl_draw_circle_helper+0x2e8>
c0de16e2:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de16e4:	462b      	mov	r3, r5
c0de16e6:	f000 f877 	bl	c0de17d8 <OUTLINED_FUNCTION_8>
c0de16ea:	1b02      	subs	r2, r0, r4
c0de16ec:	e00a      	b.n	c0de1704 <bagl_draw_circle_helper+0x2e4>
c0de16ee:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de16f0:	f000 f872 	bl	c0de17d8 <OUTLINED_FUNCTION_8>
c0de16f4:	1b07      	subs	r7, r0, r4
c0de16f6:	9801      	ldr	r0, [sp, #4]
c0de16f8:	463a      	mov	r2, r7
c0de16fa:	1943      	adds	r3, r0, r5
c0de16fc:	f000 f84f 	bl	c0de179e <OUTLINED_FUNCTION_2>
c0de1700:	f000 f863 	bl	c0de17ca <OUTLINED_FUNCTION_7>
c0de1704:	f000 f848 	bl	c0de1798 <OUTLINED_FUNCTION_1>
c0de1708:	1e60      	subs	r0, r4, #1
c0de170a:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de170c:	f1aa 0a01 	sub.w	sl, sl, #1
c0de1710:	4603      	mov	r3, r0
c0de1712:	2901      	cmp	r1, #1
c0de1714:	bfbc      	itt	lt
c0de1716:	4623      	movlt	r3, r4
c0de1718:	2000      	movlt	r0, #0
c0de171a:	eba1 0040 	sub.w	r0, r1, r0, lsl #1
c0de171e:	9908      	ldr	r1, [sp, #32]
c0de1720:	3501      	adds	r5, #1
c0de1722:	4408      	add	r0, r1
c0de1724:	3102      	adds	r1, #2
c0de1726:	9009      	str	r0, [sp, #36]	@ 0x24
c0de1728:	9108      	str	r1, [sp, #32]
c0de172a:	e6a7      	b.n	c0de147c <bagl_draw_circle_helper+0x5c>
c0de172c:	b010      	add	sp, #64	@ 0x40
c0de172e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1732 <bagl_draw_glyph>:
c0de1732:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1736:	b086      	sub	sp, #24
c0de1738:	688e      	ldr	r6, [r1, #8]
c0de173a:	2e02      	cmp	r6, #2
c0de173c:	d81f      	bhi.n	c0de177e <bagl_draw_glyph+0x4c>
c0de173e:	f9b0 a002 	ldrsh.w	sl, [r0, #2]
c0de1742:	f9b0 b004 	ldrsh.w	fp, [r0, #4]
c0de1746:	e9d1 7000 	ldrd	r7, r0, [r1]
c0de174a:	460c      	mov	r4, r1
c0de174c:	9005      	str	r0, [sp, #20]
c0de174e:	68c8      	ldr	r0, [r1, #12]
c0de1750:	f000 fc0a 	bl	c0de1f68 <pic>
c0de1754:	4605      	mov	r5, r0
c0de1756:	6920      	ldr	r0, [r4, #16]
c0de1758:	f8d4 8008 	ldr.w	r8, [r4, #8]
c0de175c:	f000 fc04 	bl	c0de1f68 <pic>
c0de1760:	cc0e      	ldmia	r4!, {r1, r2, r3}
c0de1762:	4359      	muls	r1, r3
c0de1764:	9b05      	ldr	r3, [sp, #20]
c0de1766:	4351      	muls	r1, r2
c0de1768:	2201      	movs	r2, #1
c0de176a:	40b2      	lsls	r2, r6
c0de176c:	e9cd 0103 	strd	r0, r1, [sp, #12]
c0de1770:	4650      	mov	r0, sl
c0de1772:	4659      	mov	r1, fp
c0de1774:	e88d 0124 	stmia.w	sp, {r2, r5, r8}
c0de1778:	463a      	mov	r2, r7
c0de177a:	f000 fcdb 	bl	c0de2134 <bagl_hal_draw_bitmap_within_rect>
c0de177e:	b006      	add	sp, #24
c0de1780:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1784 <OUTLINED_FUNCTION_0>:
c0de1784:	f8dd a028 	ldr.w	sl, [sp, #40]	@ 0x28
c0de1788:	f8dd b060 	ldr.w	fp, [sp, #96]	@ 0x60
c0de178c:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de178e:	f1b6 3fff 	cmp.w	r6, #4294967295	@ 0xffffffff
c0de1792:	f04f 0601 	mov.w	r6, #1
c0de1796:	4770      	bx	lr

c0de1798 <OUTLINED_FUNCTION_1>:
c0de1798:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de179a:	f000 bce3 	b.w	c0de2164 <bagl_hal_draw_rect>

c0de179e <OUTLINED_FUNCTION_2>:
c0de179e:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de17a0:	f000 bce0 	b.w	c0de2164 <bagl_hal_draw_rect>

c0de17a4 <OUTLINED_FUNCTION_3>:
c0de17a4:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de17a8:	f000 bbde 	b.w	c0de1f68 <pic>

c0de17ac <OUTLINED_FUNCTION_4>:
c0de17ac:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de17b0:	4720      	bx	r4

c0de17b2 <OUTLINED_FUNCTION_5>:
c0de17b2:	9200      	str	r2, [sp, #0]
c0de17b4:	eb0b 0203 	add.w	r2, fp, r3
c0de17b8:	465b      	mov	r3, fp
c0de17ba:	4738      	bx	r7

c0de17bc <OUTLINED_FUNCTION_6>:
c0de17bc:	8920      	ldrh	r0, [r4, #8]
c0de17be:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de17c2:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de17c6:	1b82      	subs	r2, r0, r6
c0de17c8:	4770      	bx	lr

c0de17ca <OUTLINED_FUNCTION_7>:
c0de17ca:	9804      	ldr	r0, [sp, #16]
c0de17cc:	9b07      	ldr	r3, [sp, #28]
c0de17ce:	9600      	str	r6, [sp, #0]
c0de17d0:	463a      	mov	r2, r7
c0de17d2:	eb00 010a 	add.w	r1, r0, sl
c0de17d6:	4770      	bx	lr

c0de17d8 <OUTLINED_FUNCTION_8>:
c0de17d8:	9600      	str	r6, [sp, #0]
c0de17da:	eb00 010a 	add.w	r1, r0, sl
c0de17de:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de17e0:	4770      	bx	lr

c0de17e2 <app_ticker_event_callback>:
c0de17e2:	4770      	bx	lr

c0de17e4 <io_event>:
c0de17e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de17e6:	4dd8      	ldr	r5, [pc, #864]	@ (c0de1b48 <io_event+0x364>)
c0de17e8:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de17ec:	280e      	cmp	r0, #14
c0de17ee:	d053      	beq.n	c0de1898 <io_event+0xb4>
c0de17f0:	2805      	cmp	r0, #5
c0de17f2:	f040 809e 	bne.w	c0de1932 <io_event+0x14e>
c0de17f6:	4ed5      	ldr	r6, [pc, #852]	@ (c0de1b4c <io_event+0x368>)
c0de17f8:	2001      	movs	r0, #1
c0de17fa:	f809 0006 	strb.w	r0, [r9, r6]
c0de17fe:	eb09 0406 	add.w	r4, r9, r6
c0de1802:	2000      	movs	r0, #0
c0de1804:	6060      	str	r0, [r4, #4]
c0de1806:	4620      	mov	r0, r4
c0de1808:	f000 fc1a 	bl	c0de2040 <os_ux>
c0de180c:	f000 f9cf 	bl	c0de1bae <OUTLINED_FUNCTION_6>
c0de1810:	2800      	cmp	r0, #0
c0de1812:	6060      	str	r0, [r4, #4]
c0de1814:	f000 8196 	beq.w	c0de1b44 <io_event+0x360>
c0de1818:	2897      	cmp	r0, #151	@ 0x97
c0de181a:	f000 8193 	beq.w	c0de1b44 <io_event+0x360>
c0de181e:	4ccc      	ldr	r4, [pc, #816]	@ (c0de1b50 <io_event+0x36c>)
c0de1820:	2869      	cmp	r0, #105	@ 0x69
c0de1822:	f040 815c 	bne.w	c0de1ade <io_event+0x2fa>
c0de1826:	eb09 0504 	add.w	r5, r9, r4
c0de182a:	f7fe ff79 	bl	c0de0720 <io_seph_ux_init_button>
c0de182e:	2000      	movs	r0, #0
c0de1830:	444e      	add	r6, r9
c0de1832:	f8a5 00ca 	strh.w	r0, [r5, #202]	@ 0xca
c0de1836:	f000 f9ba 	bl	c0de1bae <OUTLINED_FUNCTION_6>
c0de183a:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de183e:	6070      	str	r0, [r6, #4]
c0de1840:	2900      	cmp	r1, #0
c0de1842:	f000 817f 	beq.w	c0de1b44 <io_event+0x360>
c0de1846:	2800      	cmp	r0, #0
c0de1848:	f000 817c 	beq.w	c0de1b44 <io_event+0x360>
c0de184c:	2897      	cmp	r0, #151	@ 0x97
c0de184e:	f000 8179 	beq.w	c0de1b44 <io_event+0x360>
c0de1852:	f000 f989 	bl	c0de1b68 <OUTLINED_FUNCTION_1>
c0de1856:	f080 8175 	bcs.w	c0de1b44 <io_event+0x360>
c0de185a:	f000 fbb2 	bl	c0de1fc2 <os_perso_isonboarded>
c0de185e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1860:	d104      	bne.n	c0de186c <io_event+0x88>
c0de1862:	f000 fbe4 	bl	c0de202e <os_global_pin_is_validated>
c0de1866:	28aa      	cmp	r0, #170	@ 0xaa
c0de1868:	f040 816c 	bne.w	c0de1b44 <io_event+0x360>
c0de186c:	f000 f99a 	bl	c0de1ba4 <OUTLINED_FUNCTION_5>
c0de1870:	f000 f991 	bl	c0de1b96 <OUTLINED_FUNCTION_4>
c0de1874:	f080 8163 	bcs.w	c0de1b3e <io_event+0x35a>
c0de1878:	f000 f96c 	bl	c0de1b54 <OUTLINED_FUNCTION_0>
c0de187c:	d003      	beq.n	c0de1886 <io_event+0xa2>
c0de187e:	4798      	blx	r3
c0de1880:	b138      	cbz	r0, c0de1892 <io_event+0xae>
c0de1882:	f000 f981 	bl	c0de1b88 <OUTLINED_FUNCTION_3>
c0de1886:	2801      	cmp	r0, #1
c0de1888:	bf08      	it	eq
c0de188a:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de188e:	f7fe ff5c 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de1892:	f000 f971 	bl	c0de1b78 <OUTLINED_FUNCTION_2>
c0de1896:	e7eb      	b.n	c0de1870 <io_event+0x8c>
c0de1898:	f7ff ffa3 	bl	c0de17e2 <app_ticker_event_callback>
c0de189c:	4eab      	ldr	r6, [pc, #684]	@ (c0de1b4c <io_event+0x368>)
c0de189e:	2001      	movs	r0, #1
c0de18a0:	2700      	movs	r7, #0
c0de18a2:	eb09 0506 	add.w	r5, r9, r6
c0de18a6:	f809 0006 	strb.w	r0, [r9, r6]
c0de18aa:	4628      	mov	r0, r5
c0de18ac:	606f      	str	r7, [r5, #4]
c0de18ae:	f000 fbc7 	bl	c0de2040 <os_ux>
c0de18b2:	f000 f97c 	bl	c0de1bae <OUTLINED_FUNCTION_6>
c0de18b6:	2869      	cmp	r0, #105	@ 0x69
c0de18b8:	6068      	str	r0, [r5, #4]
c0de18ba:	f040 8085 	bne.w	c0de19c8 <io_event+0x1e4>
c0de18be:	4ca4      	ldr	r4, [pc, #656]	@ (c0de1b50 <io_event+0x36c>)
c0de18c0:	eb09 0504 	add.w	r5, r9, r4
c0de18c4:	f7fe ff2c 	bl	c0de0720 <io_seph_ux_init_button>
c0de18c8:	2004      	movs	r0, #4
c0de18ca:	f8a5 70ca 	strh.w	r7, [r5, #202]	@ 0xca
c0de18ce:	444e      	add	r6, r9
c0de18d0:	f000 fc1c 	bl	c0de210c <os_sched_last_status>
c0de18d4:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de18d8:	6070      	str	r0, [r6, #4]
c0de18da:	2900      	cmp	r1, #0
c0de18dc:	f000 8132 	beq.w	c0de1b44 <io_event+0x360>
c0de18e0:	2800      	cmp	r0, #0
c0de18e2:	f000 812f 	beq.w	c0de1b44 <io_event+0x360>
c0de18e6:	2897      	cmp	r0, #151	@ 0x97
c0de18e8:	f000 812c 	beq.w	c0de1b44 <io_event+0x360>
c0de18ec:	f000 f93c 	bl	c0de1b68 <OUTLINED_FUNCTION_1>
c0de18f0:	f080 8128 	bcs.w	c0de1b44 <io_event+0x360>
c0de18f4:	f000 fb65 	bl	c0de1fc2 <os_perso_isonboarded>
c0de18f8:	28aa      	cmp	r0, #170	@ 0xaa
c0de18fa:	d104      	bne.n	c0de1906 <io_event+0x122>
c0de18fc:	f000 fb97 	bl	c0de202e <os_global_pin_is_validated>
c0de1900:	28aa      	cmp	r0, #170	@ 0xaa
c0de1902:	f040 811f 	bne.w	c0de1b44 <io_event+0x360>
c0de1906:	f000 f94d 	bl	c0de1ba4 <OUTLINED_FUNCTION_5>
c0de190a:	f000 f944 	bl	c0de1b96 <OUTLINED_FUNCTION_4>
c0de190e:	f080 8116 	bcs.w	c0de1b3e <io_event+0x35a>
c0de1912:	f000 f91f 	bl	c0de1b54 <OUTLINED_FUNCTION_0>
c0de1916:	d003      	beq.n	c0de1920 <io_event+0x13c>
c0de1918:	4798      	blx	r3
c0de191a:	b138      	cbz	r0, c0de192c <io_event+0x148>
c0de191c:	f000 f934 	bl	c0de1b88 <OUTLINED_FUNCTION_3>
c0de1920:	2801      	cmp	r0, #1
c0de1922:	bf08      	it	eq
c0de1924:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1928:	f7fe ff0f 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de192c:	f000 f924 	bl	c0de1b78 <OUTLINED_FUNCTION_2>
c0de1930:	e7eb      	b.n	c0de190a <io_event+0x126>
c0de1932:	4d86      	ldr	r5, [pc, #536]	@ (c0de1b4c <io_event+0x368>)
c0de1934:	2001      	movs	r0, #1
c0de1936:	2600      	movs	r6, #0
c0de1938:	eb09 0405 	add.w	r4, r9, r5
c0de193c:	f809 0005 	strb.w	r0, [r9, r5]
c0de1940:	4620      	mov	r0, r4
c0de1942:	6066      	str	r6, [r4, #4]
c0de1944:	f000 fb7c 	bl	c0de2040 <os_ux>
c0de1948:	f000 f931 	bl	c0de1bae <OUTLINED_FUNCTION_6>
c0de194c:	6060      	str	r0, [r4, #4]
c0de194e:	4c80      	ldr	r4, [pc, #512]	@ (c0de1b50 <io_event+0x36c>)
c0de1950:	2869      	cmp	r0, #105	@ 0x69
c0de1952:	f040 809e 	bne.w	c0de1a92 <io_event+0x2ae>
c0de1956:	eb09 0704 	add.w	r7, r9, r4
c0de195a:	f7fe fee1 	bl	c0de0720 <io_seph_ux_init_button>
c0de195e:	2004      	movs	r0, #4
c0de1960:	f8a7 60ca 	strh.w	r6, [r7, #202]	@ 0xca
c0de1964:	444d      	add	r5, r9
c0de1966:	f000 fbd1 	bl	c0de210c <os_sched_last_status>
c0de196a:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de196e:	6068      	str	r0, [r5, #4]
c0de1970:	2900      	cmp	r1, #0
c0de1972:	f000 80e7 	beq.w	c0de1b44 <io_event+0x360>
c0de1976:	2800      	cmp	r0, #0
c0de1978:	f000 80e4 	beq.w	c0de1b44 <io_event+0x360>
c0de197c:	2897      	cmp	r0, #151	@ 0x97
c0de197e:	f000 80e1 	beq.w	c0de1b44 <io_event+0x360>
c0de1982:	f000 f8f1 	bl	c0de1b68 <OUTLINED_FUNCTION_1>
c0de1986:	f080 80dd 	bcs.w	c0de1b44 <io_event+0x360>
c0de198a:	f000 fb1a 	bl	c0de1fc2 <os_perso_isonboarded>
c0de198e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1990:	d104      	bne.n	c0de199c <io_event+0x1b8>
c0de1992:	f000 fb4c 	bl	c0de202e <os_global_pin_is_validated>
c0de1996:	28aa      	cmp	r0, #170	@ 0xaa
c0de1998:	f040 80d4 	bne.w	c0de1b44 <io_event+0x360>
c0de199c:	f000 f902 	bl	c0de1ba4 <OUTLINED_FUNCTION_5>
c0de19a0:	f000 f8f9 	bl	c0de1b96 <OUTLINED_FUNCTION_4>
c0de19a4:	f080 80cb 	bcs.w	c0de1b3e <io_event+0x35a>
c0de19a8:	f000 f8d4 	bl	c0de1b54 <OUTLINED_FUNCTION_0>
c0de19ac:	d003      	beq.n	c0de19b6 <io_event+0x1d2>
c0de19ae:	4798      	blx	r3
c0de19b0:	b138      	cbz	r0, c0de19c2 <io_event+0x1de>
c0de19b2:	f000 f8e9 	bl	c0de1b88 <OUTLINED_FUNCTION_3>
c0de19b6:	2801      	cmp	r0, #1
c0de19b8:	bf08      	it	eq
c0de19ba:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de19be:	f7fe fec4 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de19c2:	f000 f8d9 	bl	c0de1b78 <OUTLINED_FUNCTION_2>
c0de19c6:	e7eb      	b.n	c0de19a0 <io_event+0x1bc>
c0de19c8:	4d61      	ldr	r5, [pc, #388]	@ (c0de1b50 <io_event+0x36c>)
c0de19ca:	4604      	mov	r4, r0
c0de19cc:	eb09 0005 	add.w	r0, r9, r5
c0de19d0:	f8d0 00e4 	ldr.w	r0, [r0, #228]	@ 0xe4
c0de19d4:	b1a0      	cbz	r0, c0de1a00 <io_event+0x21c>
c0de19d6:	f1b0 0264 	subs.w	r2, r0, #100	@ 0x64
c0de19da:	eb09 0105 	add.w	r1, r9, r5
c0de19de:	bf38      	it	cc
c0de19e0:	2200      	movcc	r2, #0
c0de19e2:	2864      	cmp	r0, #100	@ 0x64
c0de19e4:	f8c1 20e4 	str.w	r2, [r1, #228]	@ 0xe4
c0de19e8:	d80a      	bhi.n	c0de1a00 <io_event+0x21c>
c0de19ea:	f8d1 10e0 	ldr.w	r1, [r1, #224]	@ 0xe0
c0de19ee:	b139      	cbz	r1, c0de1a00 <io_event+0x21c>
c0de19f0:	eb09 0005 	add.w	r0, r9, r5
c0de19f4:	f8d0 20e8 	ldr.w	r2, [r0, #232]	@ 0xe8
c0de19f8:	f8c0 20e4 	str.w	r2, [r0, #228]	@ 0xe4
c0de19fc:	2000      	movs	r0, #0
c0de19fe:	4788      	blx	r1
c0de1a00:	2c00      	cmp	r4, #0
c0de1a02:	f000 809f 	beq.w	c0de1b44 <io_event+0x360>
c0de1a06:	2c97      	cmp	r4, #151	@ 0x97
c0de1a08:	f000 809c 	beq.w	c0de1b44 <io_event+0x360>
c0de1a0c:	eb09 0005 	add.w	r0, r9, r5
c0de1a10:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1a14:	2800      	cmp	r0, #0
c0de1a16:	f000 8095 	beq.w	c0de1b44 <io_event+0x360>
c0de1a1a:	eb09 0005 	add.w	r0, r9, r5
c0de1a1e:	f890 10d0 	ldrb.w	r1, [r0, #208]	@ 0xd0
c0de1a22:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1a26:	4288      	cmp	r0, r1
c0de1a28:	f080 808c 	bcs.w	c0de1b44 <io_event+0x360>
c0de1a2c:	f000 fac9 	bl	c0de1fc2 <os_perso_isonboarded>
c0de1a30:	28aa      	cmp	r0, #170	@ 0xaa
c0de1a32:	d104      	bne.n	c0de1a3e <io_event+0x25a>
c0de1a34:	f000 fafb 	bl	c0de202e <os_global_pin_is_validated>
c0de1a38:	28aa      	cmp	r0, #170	@ 0xaa
c0de1a3a:	f040 8083 	bne.w	c0de1b44 <io_event+0x360>
c0de1a3e:	eb09 0005 	add.w	r0, r9, r5
c0de1a42:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1a46:	eb09 0105 	add.w	r1, r9, r5
c0de1a4a:	f891 20d0 	ldrb.w	r2, [r1, #208]	@ 0xd0
c0de1a4e:	b281      	uxth	r1, r0
c0de1a50:	4291      	cmp	r1, r2
c0de1a52:	d274      	bcs.n	c0de1b3e <io_event+0x35a>
c0de1a54:	eb09 0005 	add.w	r0, r9, r5
c0de1a58:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1a5c:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1a60:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1a64:	b13b      	cbz	r3, c0de1a76 <io_event+0x292>
c0de1a66:	4798      	blx	r3
c0de1a68:	b158      	cbz	r0, c0de1a82 <io_event+0x29e>
c0de1a6a:	eb09 0205 	add.w	r2, r9, r5
c0de1a6e:	f8b2 10ca 	ldrh.w	r1, [r2, #202]	@ 0xca
c0de1a72:	f8d2 20cc 	ldr.w	r2, [r2, #204]	@ 0xcc
c0de1a76:	2801      	cmp	r0, #1
c0de1a78:	bf08      	it	eq
c0de1a7a:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1a7e:	f7fe fe64 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de1a82:	eb09 0105 	add.w	r1, r9, r5
c0de1a86:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1a8a:	3001      	adds	r0, #1
c0de1a8c:	f8a1 00ca 	strh.w	r0, [r1, #202]	@ 0xca
c0de1a90:	e7d9      	b.n	c0de1a46 <io_event+0x262>
c0de1a92:	eb09 0004 	add.w	r0, r9, r4
c0de1a96:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1a9a:	2800      	cmp	r0, #0
c0de1a9c:	d052      	beq.n	c0de1b44 <io_event+0x360>
c0de1a9e:	f000 f863 	bl	c0de1b68 <OUTLINED_FUNCTION_1>
c0de1aa2:	d24f      	bcs.n	c0de1b44 <io_event+0x360>
c0de1aa4:	f000 fa8d 	bl	c0de1fc2 <os_perso_isonboarded>
c0de1aa8:	28aa      	cmp	r0, #170	@ 0xaa
c0de1aaa:	d103      	bne.n	c0de1ab4 <io_event+0x2d0>
c0de1aac:	f000 fabf 	bl	c0de202e <os_global_pin_is_validated>
c0de1ab0:	28aa      	cmp	r0, #170	@ 0xaa
c0de1ab2:	d147      	bne.n	c0de1b44 <io_event+0x360>
c0de1ab4:	f000 f876 	bl	c0de1ba4 <OUTLINED_FUNCTION_5>
c0de1ab8:	f000 f86d 	bl	c0de1b96 <OUTLINED_FUNCTION_4>
c0de1abc:	d23f      	bcs.n	c0de1b3e <io_event+0x35a>
c0de1abe:	f000 f849 	bl	c0de1b54 <OUTLINED_FUNCTION_0>
c0de1ac2:	d003      	beq.n	c0de1acc <io_event+0x2e8>
c0de1ac4:	4798      	blx	r3
c0de1ac6:	b138      	cbz	r0, c0de1ad8 <io_event+0x2f4>
c0de1ac8:	f000 f85e 	bl	c0de1b88 <OUTLINED_FUNCTION_3>
c0de1acc:	2801      	cmp	r0, #1
c0de1ace:	bf08      	it	eq
c0de1ad0:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1ad4:	f7fe fe39 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de1ad8:	f000 f84e 	bl	c0de1b78 <OUTLINED_FUNCTION_2>
c0de1adc:	e7ec      	b.n	c0de1ab8 <io_event+0x2d4>
c0de1ade:	eb09 0004 	add.w	r0, r9, r4
c0de1ae2:	f8d0 00dc 	ldr.w	r0, [r0, #220]	@ 0xdc
c0de1ae6:	b128      	cbz	r0, c0de1af4 <io_event+0x310>
c0de1ae8:	eb09 0105 	add.w	r1, r9, r5
c0de1aec:	78c9      	ldrb	r1, [r1, #3]
c0de1aee:	0849      	lsrs	r1, r1, #1
c0de1af0:	f7fe fe6a 	bl	c0de07c8 <io_seproxyhal_button_push>
c0de1af4:	eb09 0004 	add.w	r0, r9, r4
c0de1af8:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1afc:	b310      	cbz	r0, c0de1b44 <io_event+0x360>
c0de1afe:	f000 f833 	bl	c0de1b68 <OUTLINED_FUNCTION_1>
c0de1b02:	d21f      	bcs.n	c0de1b44 <io_event+0x360>
c0de1b04:	f000 fa5d 	bl	c0de1fc2 <os_perso_isonboarded>
c0de1b08:	28aa      	cmp	r0, #170	@ 0xaa
c0de1b0a:	d103      	bne.n	c0de1b14 <io_event+0x330>
c0de1b0c:	f000 fa8f 	bl	c0de202e <os_global_pin_is_validated>
c0de1b10:	28aa      	cmp	r0, #170	@ 0xaa
c0de1b12:	d117      	bne.n	c0de1b44 <io_event+0x360>
c0de1b14:	f000 f846 	bl	c0de1ba4 <OUTLINED_FUNCTION_5>
c0de1b18:	f000 f83d 	bl	c0de1b96 <OUTLINED_FUNCTION_4>
c0de1b1c:	d20f      	bcs.n	c0de1b3e <io_event+0x35a>
c0de1b1e:	f000 f819 	bl	c0de1b54 <OUTLINED_FUNCTION_0>
c0de1b22:	d003      	beq.n	c0de1b2c <io_event+0x348>
c0de1b24:	4798      	blx	r3
c0de1b26:	b138      	cbz	r0, c0de1b38 <io_event+0x354>
c0de1b28:	f000 f82e 	bl	c0de1b88 <OUTLINED_FUNCTION_3>
c0de1b2c:	2801      	cmp	r0, #1
c0de1b2e:	bf08      	it	eq
c0de1b30:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1b34:	f7fe fe09 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de1b38:	f000 f81e 	bl	c0de1b78 <OUTLINED_FUNCTION_2>
c0de1b3c:	e7ec      	b.n	c0de1b18 <io_event+0x334>
c0de1b3e:	bf08      	it	eq
c0de1b40:	f000 faf0 	bleq	c0de2124 <screen_update>
c0de1b44:	2001      	movs	r0, #1
c0de1b46:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de1b48:	000002b2 	.word	0x000002b2
c0de1b4c:	000004d4 	.word	0x000004d4
c0de1b50:	000003c4 	.word	0x000003c4

c0de1b54 <OUTLINED_FUNCTION_0>:
c0de1b54:	eb09 0004 	add.w	r0, r9, r4
c0de1b58:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1b5c:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1b60:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1b64:	2b00      	cmp	r3, #0
c0de1b66:	4770      	bx	lr

c0de1b68 <OUTLINED_FUNCTION_1>:
c0de1b68:	eb09 0004 	add.w	r0, r9, r4
c0de1b6c:	f890 10d0 	ldrb.w	r1, [r0, #208]	@ 0xd0
c0de1b70:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1b74:	4288      	cmp	r0, r1
c0de1b76:	4770      	bx	lr

c0de1b78 <OUTLINED_FUNCTION_2>:
c0de1b78:	eb09 0104 	add.w	r1, r9, r4
c0de1b7c:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1b80:	3001      	adds	r0, #1
c0de1b82:	f8a1 00ca 	strh.w	r0, [r1, #202]	@ 0xca
c0de1b86:	4770      	bx	lr

c0de1b88 <OUTLINED_FUNCTION_3>:
c0de1b88:	eb09 0204 	add.w	r2, r9, r4
c0de1b8c:	f8b2 10ca 	ldrh.w	r1, [r2, #202]	@ 0xca
c0de1b90:	f8d2 20cc 	ldr.w	r2, [r2, #204]	@ 0xcc
c0de1b94:	4770      	bx	lr

c0de1b96 <OUTLINED_FUNCTION_4>:
c0de1b96:	eb09 0104 	add.w	r1, r9, r4
c0de1b9a:	f891 20d0 	ldrb.w	r2, [r1, #208]	@ 0xd0
c0de1b9e:	b281      	uxth	r1, r0
c0de1ba0:	4291      	cmp	r1, r2
c0de1ba2:	4770      	bx	lr

c0de1ba4 <OUTLINED_FUNCTION_5>:
c0de1ba4:	eb09 0004 	add.w	r0, r9, r4
c0de1ba8:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1bac:	4770      	bx	lr

c0de1bae <OUTLINED_FUNCTION_6>:
c0de1bae:	2004      	movs	r0, #4
c0de1bb0:	f000 baac 	b.w	c0de210c <os_sched_last_status>

c0de1bb4 <common_app_init>:
c0de1bb4:	b580      	push	{r7, lr}
c0de1bb6:	4805      	ldr	r0, [pc, #20]	@ (c0de1bcc <common_app_init+0x18>)
c0de1bb8:	f44f 7188 	mov.w	r1, #272	@ 0x110
c0de1bbc:	4448      	add	r0, r9
c0de1bbe:	f000 faed 	bl	c0de219c <__aeabi_memclr>
c0de1bc2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1bc6:	f7fe bfd7 	b.w	c0de0b78 <io_seproxyhal_init>
c0de1bca:	bf00      	nop
c0de1bcc:	000003c4 	.word	0x000003c4

c0de1bd0 <standalone_app_main>:
c0de1bd0:	b510      	push	{r4, lr}
c0de1bd2:	b08c      	sub	sp, #48	@ 0x30
c0de1bd4:	466c      	mov	r4, sp
c0de1bd6:	4620      	mov	r0, r4
c0de1bd8:	f000 fb00 	bl	c0de21dc <setjmp>
c0de1bdc:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de1be0:	0400      	lsls	r0, r0, #16
c0de1be2:	d108      	bne.n	c0de1bf6 <standalone_app_main+0x26>
c0de1be4:	4668      	mov	r0, sp
c0de1be6:	f000 fa87 	bl	c0de20f8 <try_context_set>
c0de1bea:	900a      	str	r0, [sp, #40]	@ 0x28
c0de1bec:	f7ff ffe2 	bl	c0de1bb4 <common_app_init>
c0de1bf0:	f7fe fa06 	bl	c0de0000 <app_main>
c0de1bf4:	e005      	b.n	c0de1c02 <standalone_app_main+0x32>
c0de1bf6:	2000      	movs	r0, #0
c0de1bf8:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de1bfc:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1bfe:	f000 fa7b 	bl	c0de20f8 <try_context_set>
c0de1c02:	f000 fa71 	bl	c0de20e8 <try_context_get>
c0de1c06:	42a0      	cmp	r0, r4
c0de1c08:	d102      	bne.n	c0de1c10 <standalone_app_main+0x40>
c0de1c0a:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1c0c:	f000 fa74 	bl	c0de20f8 <try_context_set>
c0de1c10:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de1c14:	b908      	cbnz	r0, c0de1c1a <standalone_app_main+0x4a>
c0de1c16:	f7fe fa17 	bl	c0de0048 <app_exit>
c0de1c1a:	f000 f99e 	bl	c0de1f5a <os_longjmp>
	...

c0de1c20 <ux_flow_check_valid>:
c0de1c20:	4808      	ldr	r0, [pc, #32]	@ (c0de1c44 <ux_flow_check_valid+0x24>)
c0de1c22:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1c26:	2901      	cmp	r1, #1
c0de1c28:	bf84      	itt	hi
c0de1c2a:	2000      	movhi	r0, #0
c0de1c2c:	4770      	bxhi	lr
c0de1c2e:	4448      	add	r0, r9
c0de1c30:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de1c34:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de1c38:	8b00      	ldrh	r0, [r0, #24]
c0de1c3a:	2800      	cmp	r0, #0
c0de1c3c:	bf18      	it	ne
c0de1c3e:	2001      	movne	r0, #1
c0de1c40:	4770      	bx	lr
c0de1c42:	bf00      	nop
c0de1c44:	000003c4 	.word	0x000003c4

c0de1c48 <ux_flow_get_current>:
c0de1c48:	b580      	push	{r7, lr}
c0de1c4a:	f7ff ffe9 	bl	c0de1c20 <ux_flow_check_valid>
c0de1c4e:	b178      	cbz	r0, c0de1c70 <ux_flow_get_current+0x28>
c0de1c50:	490a      	ldr	r1, [pc, #40]	@ (c0de1c7c <ux_flow_get_current+0x34>)
c0de1c52:	f000 f8a7 	bl	c0de1da4 <OUTLINED_FUNCTION_0>
c0de1c56:	d00b      	beq.n	c0de1c70 <ux_flow_get_current+0x28>
c0de1c58:	4449      	add	r1, r9
c0de1c5a:	eb01 0282 	add.w	r2, r1, r2, lsl #2
c0de1c5e:	8c11      	ldrh	r1, [r2, #32]
c0de1c60:	8c92      	ldrh	r2, [r2, #36]	@ 0x24
c0de1c62:	4291      	cmp	r1, r2
c0de1c64:	d204      	bcs.n	c0de1c70 <ux_flow_get_current+0x28>
c0de1c66:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1c6a:	f110 0f04 	cmn.w	r0, #4
c0de1c6e:	d901      	bls.n	c0de1c74 <ux_flow_get_current+0x2c>
c0de1c70:	2000      	movs	r0, #0
c0de1c72:	bd80      	pop	{r7, pc}
c0de1c74:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1c78:	f000 b976 	b.w	c0de1f68 <pic>
c0de1c7c:	000003c4 	.word	0x000003c4

c0de1c80 <ux_flow_engine_init_step>:
c0de1c80:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1c84:	4604      	mov	r4, r0
c0de1c86:	481c      	ldr	r0, [pc, #112]	@ (c0de1cf8 <ux_flow_engine_init_step+0x78>)
c0de1c88:	eb04 0144 	add.w	r1, r4, r4, lsl #1
c0de1c8c:	4448      	add	r0, r9
c0de1c8e:	eb00 0681 	add.w	r6, r0, r1, lsl #2
c0de1c92:	f856 0f1c 	ldr.w	r0, [r6, #28]!
c0de1c96:	4637      	mov	r7, r6
c0de1c98:	f837 1f04 	ldrh.w	r1, [r7, #4]!
c0de1c9c:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1ca0:	f110 0f04 	cmn.w	r0, #4
c0de1ca4:	bf88      	it	hi
c0de1ca6:	e8bd 81f0 	ldmiahi.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1caa:	f000 f95d 	bl	c0de1f68 <pic>
c0de1cae:	8839      	ldrh	r1, [r7, #0]
c0de1cb0:	6832      	ldr	r2, [r6, #0]
c0de1cb2:	6805      	ldr	r5, [r0, #0]
c0de1cb4:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de1cb8:	4608      	mov	r0, r1
c0de1cba:	f000 f955 	bl	c0de1f68 <pic>
c0de1cbe:	b13d      	cbz	r5, c0de1cd0 <ux_flow_engine_init_step+0x50>
c0de1cc0:	6800      	ldr	r0, [r0, #0]
c0de1cc2:	f000 f951 	bl	c0de1f68 <pic>
c0de1cc6:	4601      	mov	r1, r0
c0de1cc8:	4620      	mov	r0, r4
c0de1cca:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de1cce:	4708      	bx	r1
c0de1cd0:	6880      	ldr	r0, [r0, #8]
c0de1cd2:	4d0a      	ldr	r5, [pc, #40]	@ (c0de1cfc <ux_flow_engine_init_step+0x7c>)
c0de1cd4:	447d      	add	r5, pc
c0de1cd6:	47a8      	blx	r5
c0de1cd8:	4680      	mov	r8, r0
c0de1cda:	8838      	ldrh	r0, [r7, #0]
c0de1cdc:	6831      	ldr	r1, [r6, #0]
c0de1cde:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
c0de1ce2:	47a8      	blx	r5
c0de1ce4:	6840      	ldr	r0, [r0, #4]
c0de1ce6:	47a8      	blx	r5
c0de1ce8:	4602      	mov	r2, r0
c0de1cea:	4620      	mov	r0, r4
c0de1cec:	4641      	mov	r1, r8
c0de1cee:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de1cf2:	f000 b805 	b.w	c0de1d00 <ux_flow_init>
c0de1cf6:	bf00      	nop
c0de1cf8:	000003c4 	.word	0x000003c4
c0de1cfc:	00000291 	.word	0x00000291

c0de1d00 <ux_flow_init>:
c0de1d00:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1d02:	b100      	cbz	r0, c0de1d06 <ux_flow_init+0x6>
c0de1d04:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de1d06:	4e1e      	ldr	r6, [pc, #120]	@ (c0de1d80 <ux_flow_init+0x80>)
c0de1d08:	460d      	mov	r5, r1
c0de1d0a:	2122      	movs	r1, #34	@ 0x22
c0de1d0c:	4614      	mov	r4, r2
c0de1d0e:	eb09 0006 	add.w	r0, r9, r6
c0de1d12:	3004      	adds	r0, #4
c0de1d14:	f000 fa42 	bl	c0de219c <__aeabi_memclr>
c0de1d18:	2d00      	cmp	r5, #0
c0de1d1a:	d0f3      	beq.n	c0de1d04 <ux_flow_init+0x4>
c0de1d1c:	4628      	mov	r0, r5
c0de1d1e:	eb09 0706 	add.w	r7, r9, r6
c0de1d22:	f000 f921 	bl	c0de1f68 <pic>
c0de1d26:	8cb9      	ldrh	r1, [r7, #36]	@ 0x24
c0de1d28:	61f8      	str	r0, [r7, #28]
c0de1d2a:	b28a      	uxth	r2, r1
c0de1d2c:	f850 2022 	ldr.w	r2, [r0, r2, lsl #2]
c0de1d30:	3201      	adds	r2, #1
c0de1d32:	d004      	beq.n	c0de1d3e <ux_flow_init+0x3e>
c0de1d34:	eb09 0206 	add.w	r2, r9, r6
c0de1d38:	3101      	adds	r1, #1
c0de1d3a:	8491      	strh	r1, [r2, #36]	@ 0x24
c0de1d3c:	e7f5      	b.n	c0de1d2a <ux_flow_init+0x2a>
c0de1d3e:	b1cc      	cbz	r4, c0de1d74 <ux_flow_init+0x74>
c0de1d40:	4620      	mov	r0, r4
c0de1d42:	eb09 0506 	add.w	r5, r9, r6
c0de1d46:	f000 f90f 	bl	c0de1f68 <pic>
c0de1d4a:	4604      	mov	r4, r0
c0de1d4c:	8c28      	ldrh	r0, [r5, #32]
c0de1d4e:	eb09 0106 	add.w	r1, r9, r6
c0de1d52:	b280      	uxth	r0, r0
c0de1d54:	69c9      	ldr	r1, [r1, #28]
c0de1d56:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
c0de1d5a:	1c41      	adds	r1, r0, #1
c0de1d5c:	d00a      	beq.n	c0de1d74 <ux_flow_init+0x74>
c0de1d5e:	f000 f903 	bl	c0de1f68 <pic>
c0de1d62:	42a0      	cmp	r0, r4
c0de1d64:	d006      	beq.n	c0de1d74 <ux_flow_init+0x74>
c0de1d66:	eb09 0106 	add.w	r1, r9, r6
c0de1d6a:	8c08      	ldrh	r0, [r1, #32]
c0de1d6c:	8448      	strh	r0, [r1, #34]	@ 0x22
c0de1d6e:	3001      	adds	r0, #1
c0de1d70:	8408      	strh	r0, [r1, #32]
c0de1d72:	e7ec      	b.n	c0de1d4e <ux_flow_init+0x4e>
c0de1d74:	2000      	movs	r0, #0
c0de1d76:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de1d7a:	f7ff bf81 	b.w	c0de1c80 <ux_flow_engine_init_step>
c0de1d7e:	bf00      	nop
c0de1d80:	000003c4 	.word	0x000003c4

c0de1d84 <ux_flow_relayout>:
c0de1d84:	b580      	push	{r7, lr}
c0de1d86:	f7ff ff5f 	bl	c0de1c48 <ux_flow_get_current>
c0de1d8a:	b138      	cbz	r0, c0de1d9c <ux_flow_relayout+0x18>
c0de1d8c:	4804      	ldr	r0, [pc, #16]	@ (c0de1da0 <ux_flow_relayout+0x1c>)
c0de1d8e:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de1d92:	3801      	subs	r0, #1
c0de1d94:	f7ff ff74 	bl	c0de1c80 <ux_flow_engine_init_step>
c0de1d98:	2001      	movs	r0, #1
c0de1d9a:	bd80      	pop	{r7, pc}
c0de1d9c:	2000      	movs	r0, #0
c0de1d9e:	bd80      	pop	{r7, pc}
c0de1da0:	000003c4 	.word	0x000003c4

c0de1da4 <OUTLINED_FUNCTION_0>:
c0de1da4:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de1da8:	eb09 0001 	add.w	r0, r9, r1
c0de1dac:	3a01      	subs	r2, #1
c0de1dae:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1db2:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de1db6:	69c0      	ldr	r0, [r0, #28]
c0de1db8:	2800      	cmp	r0, #0
c0de1dba:	4770      	bx	lr

c0de1dbc <ux_stack_redisplay>:
c0de1dbc:	b580      	push	{r7, lr}
c0de1dbe:	f7ff ffe1 	bl	c0de1d84 <ux_flow_relayout>
c0de1dc2:	b100      	cbz	r0, c0de1dc6 <ux_stack_redisplay+0xa>
c0de1dc4:	bd80      	pop	{r7, pc}
c0de1dc6:	480c      	ldr	r0, [pc, #48]	@ (c0de1df8 <ux_stack_redisplay+0x3c>)
c0de1dc8:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1dcc:	2901      	cmp	r1, #1
c0de1dce:	d108      	bne.n	c0de1de2 <ux_stack_redisplay+0x26>
c0de1dd0:	4448      	add	r0, r9
c0de1dd2:	2100      	movs	r1, #0
c0de1dd4:	f8a0 10ca 	strh.w	r1, [r0, #202]	@ 0xca
c0de1dd8:	2000      	movs	r0, #0
c0de1dda:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1dde:	f000 b80d 	b.w	c0de1dfc <ux_stack_display>
c0de1de2:	2900      	cmp	r1, #0
c0de1de4:	d1ee      	bne.n	c0de1dc4 <ux_stack_redisplay+0x8>
c0de1de6:	eb09 0100 	add.w	r1, r9, r0
c0de1dea:	7849      	ldrb	r1, [r1, #1]
c0de1dec:	29aa      	cmp	r1, #170	@ 0xaa
c0de1dee:	bf02      	ittt	eq
c0de1df0:	4448      	addeq	r0, r9
c0de1df2:	2169      	moveq	r1, #105	@ 0x69
c0de1df4:	7041      	strbeq	r1, [r0, #1]
c0de1df6:	bd80      	pop	{r7, pc}
c0de1df8:	000003c4 	.word	0x000003c4

c0de1dfc <ux_stack_display>:
c0de1dfc:	490e      	ldr	r1, [pc, #56]	@ (c0de1e38 <ux_stack_display+0x3c>)
c0de1dfe:	1c43      	adds	r3, r0, #1
c0de1e00:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de1e04:	b162      	cbz	r2, c0de1e20 <ux_stack_display+0x24>
c0de1e06:	4293      	cmp	r3, r2
c0de1e08:	d10a      	bne.n	c0de1e20 <ux_stack_display+0x24>
c0de1e0a:	4449      	add	r1, r9
c0de1e0c:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de1e10:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de1e14:	2100      	movs	r1, #0
c0de1e16:	f8a0 10ca 	strh.w	r1, [r0, #202]	@ 0xca
c0de1e1a:	30c8      	adds	r0, #200	@ 0xc8
c0de1e1c:	f000 b828 	b.w	c0de1e70 <ux_stack_display_elements>
c0de1e20:	b103      	cbz	r3, c0de1e24 <ux_stack_display+0x28>
c0de1e22:	b942      	cbnz	r2, c0de1e36 <ux_stack_display+0x3a>
c0de1e24:	eb09 0001 	add.w	r0, r9, r1
c0de1e28:	7840      	ldrb	r0, [r0, #1]
c0de1e2a:	28aa      	cmp	r0, #170	@ 0xaa
c0de1e2c:	bf02      	ittt	eq
c0de1e2e:	eb09 0001 	addeq.w	r0, r9, r1
c0de1e32:	2169      	moveq	r1, #105	@ 0x69
c0de1e34:	7041      	strbeq	r1, [r0, #1]
c0de1e36:	4770      	bx	lr
c0de1e38:	000003c4 	.word	0x000003c4

c0de1e3c <ux_stack_display_element_callback>:
c0de1e3c:	b510      	push	{r4, lr}
c0de1e3e:	4604      	mov	r4, r0
c0de1e40:	480a      	ldr	r0, [pc, #40]	@ (c0de1e6c <ux_stack_display_element_callback+0x30>)
c0de1e42:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1e46:	b161      	cbz	r1, c0de1e62 <ux_stack_display_element_callback+0x26>
c0de1e48:	4448      	add	r0, r9
c0de1e4a:	eb01 01c1 	add.w	r1, r1, r1, lsl #3
c0de1e4e:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de1e52:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de1e56:	b121      	cbz	r1, c0de1e62 <ux_stack_display_element_callback+0x26>
c0de1e58:	4620      	mov	r0, r4
c0de1e5a:	4788      	blx	r1
c0de1e5c:	b118      	cbz	r0, c0de1e66 <ux_stack_display_element_callback+0x2a>
c0de1e5e:	2801      	cmp	r0, #1
c0de1e60:	d100      	bne.n	c0de1e64 <ux_stack_display_element_callback+0x28>
c0de1e62:	4620      	mov	r0, r4
c0de1e64:	bd10      	pop	{r4, pc}
c0de1e66:	2000      	movs	r0, #0
c0de1e68:	bd10      	pop	{r4, pc}
c0de1e6a:	bf00      	nop
c0de1e6c:	000003c4 	.word	0x000003c4

c0de1e70 <ux_stack_display_elements>:
c0de1e70:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de1e74:	4604      	mov	r4, r0
c0de1e76:	f000 f8a4 	bl	c0de1fc2 <os_perso_isonboarded>
c0de1e7a:	28aa      	cmp	r0, #170	@ 0xaa
c0de1e7c:	d103      	bne.n	c0de1e86 <ux_stack_display_elements+0x16>
c0de1e7e:	f000 f8d6 	bl	c0de202e <os_global_pin_is_validated>
c0de1e82:	28aa      	cmp	r0, #170	@ 0xaa
c0de1e84:	d140      	bne.n	c0de1f08 <ux_stack_display_elements+0x98>
c0de1e86:	f8df 8084 	ldr.w	r8, [pc, #132]	@ c0de1f0c <ux_stack_display_elements+0x9c>
c0de1e8a:	2001      	movs	r0, #1
c0de1e8c:	f04f 0a00 	mov.w	sl, #0
c0de1e90:	07c0      	lsls	r0, r0, #31
c0de1e92:	d025      	beq.n	c0de1ee0 <ux_stack_display_elements+0x70>
c0de1e94:	7861      	ldrb	r1, [r4, #1]
c0de1e96:	8860      	ldrh	r0, [r4, #2]
c0de1e98:	b319      	cbz	r1, c0de1ee2 <ux_stack_display_elements+0x72>
c0de1e9a:	eba0 060a 	sub.w	r6, r0, sl
c0de1e9e:	0140      	lsls	r0, r0, #5
c0de1ea0:	eba0 174a 	sub.w	r7, r0, sl, lsl #5
c0de1ea4:	7a20      	ldrb	r0, [r4, #8]
c0de1ea6:	4482      	add	sl, r0
c0de1ea8:	4286      	cmp	r6, r0
c0de1eaa:	d217      	bcs.n	c0de1edc <ux_stack_display_elements+0x6c>
c0de1eac:	8860      	ldrh	r0, [r4, #2]
c0de1eae:	3001      	adds	r0, #1
c0de1eb0:	8060      	strh	r0, [r4, #2]
c0de1eb2:	6860      	ldr	r0, [r4, #4]
c0de1eb4:	19c5      	adds	r5, r0, r7
c0de1eb6:	4628      	mov	r0, r5
c0de1eb8:	f7ff ffc0 	bl	c0de1e3c <ux_stack_display_element_callback>
c0de1ebc:	b130      	cbz	r0, c0de1ecc <ux_stack_display_elements+0x5c>
c0de1ebe:	2801      	cmp	r0, #1
c0de1ec0:	bf18      	it	ne
c0de1ec2:	4605      	movne	r5, r0
c0de1ec4:	4628      	mov	r0, r5
c0de1ec6:	f7fe fc40 	bl	c0de074a <io_seph_ux_display_bagl_element>
c0de1eca:	e003      	b.n	c0de1ed4 <ux_stack_display_elements+0x64>
c0de1ecc:	eb09 0008 	add.w	r0, r9, r8
c0de1ed0:	7840      	ldrb	r0, [r0, #1]
c0de1ed2:	b9c8      	cbnz	r0, c0de1f08 <ux_stack_display_elements+0x98>
c0de1ed4:	7a20      	ldrb	r0, [r4, #8]
c0de1ed6:	3720      	adds	r7, #32
c0de1ed8:	3601      	adds	r6, #1
c0de1eda:	e7e5      	b.n	c0de1ea8 <ux_stack_display_elements+0x38>
c0de1edc:	2000      	movs	r0, #0
c0de1ede:	e7d7      	b.n	c0de1e90 <ux_stack_display_elements+0x20>
c0de1ee0:	8860      	ldrh	r0, [r4, #2]
c0de1ee2:	4582      	cmp	sl, r0
c0de1ee4:	d110      	bne.n	c0de1f08 <ux_stack_display_elements+0x98>
c0de1ee6:	f000 f91d 	bl	c0de2124 <screen_update>
c0de1eea:	8860      	ldrh	r0, [r4, #2]
c0de1eec:	68e1      	ldr	r1, [r4, #12]
c0de1eee:	3001      	adds	r0, #1
c0de1ef0:	8060      	strh	r0, [r4, #2]
c0de1ef2:	b119      	cbz	r1, c0de1efc <ux_stack_display_elements+0x8c>
c0de1ef4:	2000      	movs	r0, #0
c0de1ef6:	2500      	movs	r5, #0
c0de1ef8:	4788      	blx	r1
c0de1efa:	b108      	cbz	r0, c0de1f00 <ux_stack_display_elements+0x90>
c0de1efc:	7825      	ldrb	r5, [r4, #0]
c0de1efe:	e000      	b.n	c0de1f02 <ux_stack_display_elements+0x92>
c0de1f00:	8065      	strh	r5, [r4, #2]
c0de1f02:	eb09 0008 	add.w	r0, r9, r8
c0de1f06:	7045      	strb	r5, [r0, #1]
c0de1f08:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de1f0c:	000003c4 	.word	0x000003c4

c0de1f10 <cx_ecfp_generate_pair_no_throw>:
c0de1f10:	b403      	push	{r0, r1}
c0de1f12:	f04f 0032 	mov.w	r0, #50	@ 0x32
c0de1f16:	f000 b819 	b.w	c0de1f4c <cx_trampoline_helper>

c0de1f1a <cx_ecfp_init_private_key_no_throw>:
c0de1f1a:	b403      	push	{r0, r1}
c0de1f1c:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0de1f20:	f000 b814 	b.w	c0de1f4c <cx_trampoline_helper>

c0de1f24 <cx_eddsa_sign_no_throw>:
c0de1f24:	b403      	push	{r0, r1}
c0de1f26:	f04f 003a 	mov.w	r0, #58	@ 0x3a
c0de1f2a:	f000 b80f 	b.w	c0de1f4c <cx_trampoline_helper>

c0de1f2e <cx_hash_no_throw>:
c0de1f2e:	b403      	push	{r0, r1}
c0de1f30:	f04f 0044 	mov.w	r0, #68	@ 0x44
c0de1f34:	f000 b80a 	b.w	c0de1f4c <cx_trampoline_helper>

c0de1f38 <cx_sha256_init_no_throw>:
c0de1f38:	b403      	push	{r0, r1}
c0de1f3a:	f04f 0071 	mov.w	r0, #113	@ 0x71
c0de1f3e:	f000 b805 	b.w	c0de1f4c <cx_trampoline_helper>
	...

c0de1f44 <cx_aes_siv_reset>:
c0de1f44:	b403      	push	{r0, r1}
c0de1f46:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0de1f4a:	e7ff      	b.n	c0de1f4c <cx_trampoline_helper>

c0de1f4c <cx_trampoline_helper>:
c0de1f4c:	4900      	ldr	r1, [pc, #0]	@ (c0de1f50 <cx_trampoline_helper+0x4>)
c0de1f4e:	4708      	bx	r1
c0de1f50:	00808001 	.word	0x00808001

c0de1f54 <os_boot>:
c0de1f54:	2000      	movs	r0, #0
c0de1f56:	f000 b8cf 	b.w	c0de20f8 <try_context_set>

c0de1f5a <os_longjmp>:
c0de1f5a:	4604      	mov	r4, r0
c0de1f5c:	f000 f8c4 	bl	c0de20e8 <try_context_get>
c0de1f60:	4621      	mov	r1, r4
c0de1f62:	f000 f941 	bl	c0de21e8 <longjmp>
	...

c0de1f68 <pic>:
c0de1f68:	4a0a      	ldr	r2, [pc, #40]	@ (c0de1f94 <pic+0x2c>)
c0de1f6a:	4282      	cmp	r2, r0
c0de1f6c:	490a      	ldr	r1, [pc, #40]	@ (c0de1f98 <pic+0x30>)
c0de1f6e:	d806      	bhi.n	c0de1f7e <pic+0x16>
c0de1f70:	4281      	cmp	r1, r0
c0de1f72:	d304      	bcc.n	c0de1f7e <pic+0x16>
c0de1f74:	b580      	push	{r7, lr}
c0de1f76:	f000 f815 	bl	c0de1fa4 <pic_internal>
c0de1f7a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1f7e:	4907      	ldr	r1, [pc, #28]	@ (c0de1f9c <pic+0x34>)
c0de1f80:	4288      	cmp	r0, r1
c0de1f82:	4a07      	ldr	r2, [pc, #28]	@ (c0de1fa0 <pic+0x38>)
c0de1f84:	d304      	bcc.n	c0de1f90 <pic+0x28>
c0de1f86:	4290      	cmp	r0, r2
c0de1f88:	d802      	bhi.n	c0de1f90 <pic+0x28>
c0de1f8a:	1a40      	subs	r0, r0, r1
c0de1f8c:	4649      	mov	r1, r9
c0de1f8e:	4408      	add	r0, r1
c0de1f90:	4770      	bx	lr
c0de1f92:	0000      	movs	r0, r0
c0de1f94:	c0de0000 	.word	0xc0de0000
c0de1f98:	c0de2e11 	.word	0xc0de2e11
c0de1f9c:	da7a0000 	.word	0xda7a0000
c0de1fa0:	da7aa000 	.word	0xda7aa000

c0de1fa4 <pic_internal>:
c0de1fa4:	467a      	mov	r2, pc
c0de1fa6:	4902      	ldr	r1, [pc, #8]	@ (c0de1fb0 <pic_internal+0xc>)
c0de1fa8:	1cc9      	adds	r1, r1, #3
c0de1faa:	1a89      	subs	r1, r1, r2
c0de1fac:	1a40      	subs	r0, r0, r1
c0de1fae:	4770      	bx	lr
c0de1fb0:	c0de1fa5 	.word	0xc0de1fa5

c0de1fb4 <SVC_Call>:
c0de1fb4:	df01      	svc	1
c0de1fb6:	2900      	cmp	r1, #0
c0de1fb8:	d100      	bne.n	c0de1fbc <exception>
c0de1fba:	4770      	bx	lr

c0de1fbc <exception>:
c0de1fbc:	4608      	mov	r0, r1
c0de1fbe:	f7ff ffcc 	bl	c0de1f5a <os_longjmp>

c0de1fc2 <os_perso_isonboarded>:
c0de1fc2:	b5e0      	push	{r5, r6, r7, lr}
c0de1fc4:	2000      	movs	r0, #0
c0de1fc6:	4669      	mov	r1, sp
c0de1fc8:	9001      	str	r0, [sp, #4]
c0de1fca:	209f      	movs	r0, #159	@ 0x9f
c0de1fcc:	f7ff fff2 	bl	c0de1fb4 <SVC_Call>
c0de1fd0:	b2c0      	uxtb	r0, r0
c0de1fd2:	bd8c      	pop	{r2, r3, r7, pc}

c0de1fd4 <os_perso_derive_node_with_seed_key>:
c0de1fd4:	b510      	push	{r4, lr}
c0de1fd6:	b088      	sub	sp, #32
c0de1fd8:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0de1fda:	9407      	str	r4, [sp, #28]
c0de1fdc:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de1fde:	9406      	str	r4, [sp, #24]
c0de1fe0:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de1fe2:	9405      	str	r4, [sp, #20]
c0de1fe4:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de1fe6:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0de1fea:	4803      	ldr	r0, [pc, #12]	@ (c0de1ff8 <os_perso_derive_node_with_seed_key+0x24>)
c0de1fec:	4669      	mov	r1, sp
c0de1fee:	f7ff ffe1 	bl	c0de1fb4 <SVC_Call>
c0de1ff2:	b008      	add	sp, #32
c0de1ff4:	bd10      	pop	{r4, pc}
c0de1ff6:	bf00      	nop
c0de1ff8:	080000a6 	.word	0x080000a6

c0de1ffc <os_pki_load_certificate>:
c0de1ffc:	b510      	push	{r4, lr}
c0de1ffe:	b086      	sub	sp, #24
c0de2000:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de2002:	9405      	str	r4, [sp, #20]
c0de2004:	9c08      	ldr	r4, [sp, #32]
c0de2006:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0de200a:	4803      	ldr	r0, [pc, #12]	@ (c0de2018 <os_pki_load_certificate+0x1c>)
c0de200c:	4669      	mov	r1, sp
c0de200e:	f7ff ffd1 	bl	c0de1fb4 <SVC_Call>
c0de2012:	b006      	add	sp, #24
c0de2014:	bd10      	pop	{r4, pc}
c0de2016:	bf00      	nop
c0de2018:	060000aa 	.word	0x060000aa

c0de201c <os_perso_is_pin_set>:
c0de201c:	b5e0      	push	{r5, r6, r7, lr}
c0de201e:	2000      	movs	r0, #0
c0de2020:	4669      	mov	r1, sp
c0de2022:	9001      	str	r0, [sp, #4]
c0de2024:	209e      	movs	r0, #158	@ 0x9e
c0de2026:	f7ff ffc5 	bl	c0de1fb4 <SVC_Call>
c0de202a:	b2c0      	uxtb	r0, r0
c0de202c:	bd8c      	pop	{r2, r3, r7, pc}

c0de202e <os_global_pin_is_validated>:
c0de202e:	b5e0      	push	{r5, r6, r7, lr}
c0de2030:	2000      	movs	r0, #0
c0de2032:	4669      	mov	r1, sp
c0de2034:	9001      	str	r0, [sp, #4]
c0de2036:	20a0      	movs	r0, #160	@ 0xa0
c0de2038:	f7ff ffbc 	bl	c0de1fb4 <SVC_Call>
c0de203c:	b2c0      	uxtb	r0, r0
c0de203e:	bd8c      	pop	{r2, r3, r7, pc}

c0de2040 <os_ux>:
c0de2040:	b5e0      	push	{r5, r6, r7, lr}
c0de2042:	f000 f89f 	bl	c0de2184 <OUTLINED_FUNCTION_0>
c0de2046:	4802      	ldr	r0, [pc, #8]	@ (c0de2050 <os_ux+0x10>)
c0de2048:	4669      	mov	r1, sp
c0de204a:	f7ff ffb3 	bl	c0de1fb4 <SVC_Call>
c0de204e:	bd8c      	pop	{r2, r3, r7, pc}
c0de2050:	01000064 	.word	0x01000064

c0de2054 <os_flags>:
c0de2054:	b5e0      	push	{r5, r6, r7, lr}
c0de2056:	2000      	movs	r0, #0
c0de2058:	4669      	mov	r1, sp
c0de205a:	9001      	str	r0, [sp, #4]
c0de205c:	206a      	movs	r0, #106	@ 0x6a
c0de205e:	f7ff ffa9 	bl	c0de1fb4 <SVC_Call>
c0de2062:	bd8c      	pop	{r2, r3, r7, pc}

c0de2064 <os_registry_get_current_app_tag>:
c0de2064:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2066:	ab01      	add	r3, sp, #4
c0de2068:	c307      	stmia	r3!, {r0, r1, r2}
c0de206a:	4803      	ldr	r0, [pc, #12]	@ (c0de2078 <os_registry_get_current_app_tag+0x14>)
c0de206c:	a901      	add	r1, sp, #4
c0de206e:	f7ff ffa1 	bl	c0de1fb4 <SVC_Call>
c0de2072:	b004      	add	sp, #16
c0de2074:	bd80      	pop	{r7, pc}
c0de2076:	bf00      	nop
c0de2078:	03000074 	.word	0x03000074

c0de207c <os_sched_exit>:
c0de207c:	b082      	sub	sp, #8
c0de207e:	f000 f881 	bl	c0de2184 <OUTLINED_FUNCTION_0>
c0de2082:	4802      	ldr	r0, [pc, #8]	@ (c0de208c <os_sched_exit+0x10>)
c0de2084:	4669      	mov	r1, sp
c0de2086:	f7ff ff95 	bl	c0de1fb4 <SVC_Call>
c0de208a:	deff      	udf	#255	@ 0xff
c0de208c:	0100009a 	.word	0x0100009a

c0de2090 <os_io_init>:
c0de2090:	b5e0      	push	{r5, r6, r7, lr}
c0de2092:	9001      	str	r0, [sp, #4]
c0de2094:	4802      	ldr	r0, [pc, #8]	@ (c0de20a0 <os_io_init+0x10>)
c0de2096:	a901      	add	r1, sp, #4
c0de2098:	f7ff ff8c 	bl	c0de1fb4 <SVC_Call>
c0de209c:	bd8c      	pop	{r2, r3, r7, pc}
c0de209e:	bf00      	nop
c0de20a0:	01000084 	.word	0x01000084

c0de20a4 <os_io_start>:
c0de20a4:	b5e0      	push	{r5, r6, r7, lr}
c0de20a6:	2000      	movs	r0, #0
c0de20a8:	4669      	mov	r1, sp
c0de20aa:	9001      	str	r0, [sp, #4]
c0de20ac:	4801      	ldr	r0, [pc, #4]	@ (c0de20b4 <os_io_start+0x10>)
c0de20ae:	f7ff ff81 	bl	c0de1fb4 <SVC_Call>
c0de20b2:	bd8c      	pop	{r2, r3, r7, pc}
c0de20b4:	01000085 	.word	0x01000085

c0de20b8 <os_io_tx_cmd>:
c0de20b8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de20ba:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de20be:	4803      	ldr	r0, [pc, #12]	@ (c0de20cc <os_io_tx_cmd+0x14>)
c0de20c0:	4669      	mov	r1, sp
c0de20c2:	f7ff ff77 	bl	c0de1fb4 <SVC_Call>
c0de20c6:	b004      	add	sp, #16
c0de20c8:	bd80      	pop	{r7, pc}
c0de20ca:	bf00      	nop
c0de20cc:	04000088 	.word	0x04000088

c0de20d0 <os_io_rx_evt>:
c0de20d0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de20d2:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de20d6:	4803      	ldr	r0, [pc, #12]	@ (c0de20e4 <os_io_rx_evt+0x14>)
c0de20d8:	4669      	mov	r1, sp
c0de20da:	f7ff ff6b 	bl	c0de1fb4 <SVC_Call>
c0de20de:	b004      	add	sp, #16
c0de20e0:	bd80      	pop	{r7, pc}
c0de20e2:	bf00      	nop
c0de20e4:	03000089 	.word	0x03000089

c0de20e8 <try_context_get>:
c0de20e8:	b5e0      	push	{r5, r6, r7, lr}
c0de20ea:	2000      	movs	r0, #0
c0de20ec:	4669      	mov	r1, sp
c0de20ee:	9001      	str	r0, [sp, #4]
c0de20f0:	2087      	movs	r0, #135	@ 0x87
c0de20f2:	f7ff ff5f 	bl	c0de1fb4 <SVC_Call>
c0de20f6:	bd8c      	pop	{r2, r3, r7, pc}

c0de20f8 <try_context_set>:
c0de20f8:	b5e0      	push	{r5, r6, r7, lr}
c0de20fa:	f000 f843 	bl	c0de2184 <OUTLINED_FUNCTION_0>
c0de20fe:	4802      	ldr	r0, [pc, #8]	@ (c0de2108 <try_context_set+0x10>)
c0de2100:	4669      	mov	r1, sp
c0de2102:	f7ff ff57 	bl	c0de1fb4 <SVC_Call>
c0de2106:	bd8c      	pop	{r2, r3, r7, pc}
c0de2108:	0100010b 	.word	0x0100010b

c0de210c <os_sched_last_status>:
c0de210c:	b5e0      	push	{r5, r6, r7, lr}
c0de210e:	f000 f839 	bl	c0de2184 <OUTLINED_FUNCTION_0>
c0de2112:	4803      	ldr	r0, [pc, #12]	@ (c0de2120 <os_sched_last_status+0x14>)
c0de2114:	4669      	mov	r1, sp
c0de2116:	f7ff ff4d 	bl	c0de1fb4 <SVC_Call>
c0de211a:	b2c0      	uxtb	r0, r0
c0de211c:	bd8c      	pop	{r2, r3, r7, pc}
c0de211e:	bf00      	nop
c0de2120:	0100009c 	.word	0x0100009c

c0de2124 <screen_update>:
c0de2124:	b5e0      	push	{r5, r6, r7, lr}
c0de2126:	2000      	movs	r0, #0
c0de2128:	4669      	mov	r1, sp
c0de212a:	9001      	str	r0, [sp, #4]
c0de212c:	207a      	movs	r0, #122	@ 0x7a
c0de212e:	f7ff ff41 	bl	c0de1fb4 <SVC_Call>
c0de2132:	bd8c      	pop	{r2, r3, r7, pc}

c0de2134 <bagl_hal_draw_bitmap_within_rect>:
c0de2134:	b510      	push	{r4, lr}
c0de2136:	b08a      	sub	sp, #40	@ 0x28
c0de2138:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de213a:	f10d 0c04 	add.w	ip, sp, #4
c0de213e:	9409      	str	r4, [sp, #36]	@ 0x24
c0de2140:	9c0f      	ldr	r4, [sp, #60]	@ 0x3c
c0de2142:	9408      	str	r4, [sp, #32]
c0de2144:	9c0e      	ldr	r4, [sp, #56]	@ 0x38
c0de2146:	9407      	str	r4, [sp, #28]
c0de2148:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0de214a:	9406      	str	r4, [sp, #24]
c0de214c:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de214e:	e8ac 001f 	stmia.w	ip!, {r0, r1, r2, r3, r4}
c0de2152:	4803      	ldr	r0, [pc, #12]	@ (c0de2160 <bagl_hal_draw_bitmap_within_rect+0x2c>)
c0de2154:	a901      	add	r1, sp, #4
c0de2156:	f7ff ff2d 	bl	c0de1fb4 <SVC_Call>
c0de215a:	b00a      	add	sp, #40	@ 0x28
c0de215c:	bd10      	pop	{r4, pc}
c0de215e:	bf00      	nop
c0de2160:	0900007c 	.word	0x0900007c

c0de2164 <bagl_hal_draw_rect>:
c0de2164:	b510      	push	{r4, lr}
c0de2166:	b086      	sub	sp, #24
c0de2168:	f10d 0c04 	add.w	ip, sp, #4
c0de216c:	9c08      	ldr	r4, [sp, #32]
c0de216e:	e8ac 001f 	stmia.w	ip!, {r0, r1, r2, r3, r4}
c0de2172:	4803      	ldr	r0, [pc, #12]	@ (c0de2180 <bagl_hal_draw_rect+0x1c>)
c0de2174:	a901      	add	r1, sp, #4
c0de2176:	f7ff ff1d 	bl	c0de1fb4 <SVC_Call>
c0de217a:	b006      	add	sp, #24
c0de217c:	bd10      	pop	{r4, pc}
c0de217e:	bf00      	nop
c0de2180:	0500007d 	.word	0x0500007d

c0de2184 <OUTLINED_FUNCTION_0>:
c0de2184:	2100      	movs	r1, #0
c0de2186:	e9cd 0100 	strd	r0, r1, [sp]
c0de218a:	4770      	bx	lr

c0de218c <__aeabi_memcpy>:
c0de218c:	f000 b810 	b.w	c0de21b0 <memcpy>

c0de2190 <__aeabi_memset>:
c0de2190:	460b      	mov	r3, r1
c0de2192:	4611      	mov	r1, r2
c0de2194:	461a      	mov	r2, r3
c0de2196:	f000 b819 	b.w	c0de21cc <memset>
c0de219a:	bf00      	nop

c0de219c <__aeabi_memclr>:
c0de219c:	460a      	mov	r2, r1
c0de219e:	2100      	movs	r1, #0
c0de21a0:	f000 b814 	b.w	c0de21cc <memset>

c0de21a4 <explicit_bzero>:
c0de21a4:	f000 b800 	b.w	c0de21a8 <bzero>

c0de21a8 <bzero>:
c0de21a8:	460a      	mov	r2, r1
c0de21aa:	2100      	movs	r1, #0
c0de21ac:	f000 b80e 	b.w	c0de21cc <memset>

c0de21b0 <memcpy>:
c0de21b0:	440a      	add	r2, r1
c0de21b2:	4291      	cmp	r1, r2
c0de21b4:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0de21b8:	d100      	bne.n	c0de21bc <memcpy+0xc>
c0de21ba:	4770      	bx	lr
c0de21bc:	b510      	push	{r4, lr}
c0de21be:	f811 4b01 	ldrb.w	r4, [r1], #1
c0de21c2:	4291      	cmp	r1, r2
c0de21c4:	f803 4f01 	strb.w	r4, [r3, #1]!
c0de21c8:	d1f9      	bne.n	c0de21be <memcpy+0xe>
c0de21ca:	bd10      	pop	{r4, pc}

c0de21cc <memset>:
c0de21cc:	4603      	mov	r3, r0
c0de21ce:	4402      	add	r2, r0
c0de21d0:	4293      	cmp	r3, r2
c0de21d2:	d100      	bne.n	c0de21d6 <memset+0xa>
c0de21d4:	4770      	bx	lr
c0de21d6:	f803 1b01 	strb.w	r1, [r3], #1
c0de21da:	e7f9      	b.n	c0de21d0 <memset+0x4>

c0de21dc <setjmp>:
c0de21dc:	46ec      	mov	ip, sp
c0de21de:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de21e2:	f04f 0000 	mov.w	r0, #0
c0de21e6:	4770      	bx	lr

c0de21e8 <longjmp>:
c0de21e8:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de21ec:	46e5      	mov	sp, ip
c0de21ee:	0008      	movs	r0, r1
c0de21f0:	bf08      	it	eq
c0de21f2:	2001      	moveq	r0, #1
c0de21f4:	4770      	bx	lr
c0de21f6:	bf00      	nop

c0de21f8 <strlen>:
c0de21f8:	4603      	mov	r3, r0
c0de21fa:	f813 2b01 	ldrb.w	r2, [r3], #1
c0de21fe:	2a00      	cmp	r2, #0
c0de2200:	d1fb      	bne.n	c0de21fa <strlen+0x2>
c0de2202:	1a18      	subs	r0, r3, r0
c0de2204:	3801      	subs	r0, #1
c0de2206:	4770      	bx	lr

c0de2208 <_ecode>:
c0de2208:	2e2e      	cmp	r6, #46	@ 0x2e
c0de220a:	002e      	movs	r6, r5

c0de220c <B58_ALPHABET>:
c0de220c:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0de221c:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0de222c:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0de223c:	7271 7473 7675 7877 7a79 0000               qrstuvwxyz..

c0de2248 <.L__const.handle_sign_msg.defpath>:
c0de2248:	002c 8000 0c54 8000 0000 8000 0000 0000     ,...T...........
c0de2258:	0000 0000                                   ....

c0de225c <bitmapOPEN_SANS_EXTRABOLD_11PX>:
c0de225c:	f3ff 253b 9224 f29f 4897 8824 2cb7 870e     ..;%$....H$..,..
c0de226c:	1fa6 4e02 b1ac 7ec2 637e 358d 3c72 d86c     ...N...~~c.5r<l.
c0de227c:	e0e0 9eed df3d b417 cdb7 d926 7b6c 4c0b     ....=.....&.l{.L
c0de228c:	7bfb 0c1e 33f3 d60c 0fff 3118 8c66 de18     .{...3.....1f...
c0de229c:	cf3c 3cf3 ec7b cccf 6ecc cc63 f99c 630f     <..<{....nc....c
c0de22ac:	3187 187e 69c7 8fda 3f61 ccf3 9cfc 7c21     .1~..i..a?....!|
c0de22bc:	3cf3 1f7b cc63 3318 3cde f37b 7b3c 3cde     .<{.c..3.<{.<{.<
c0de22cc:	3ecf 398c 0f0f 6036 980d 6199 0618 f03f     .>.9..6`...a..?.
c0de22dc:	c303 cc30 0fcc 6763 3180 30f8 f766 4bd6     ..0...cg.1.0f..K
c0de22ec:	bdaf 019f 01f8 3c18 7e3c 7e66 c3e7 ef7f     .......<<~f~....
c0de22fc:	f7b7 7efe 318c f0c6 3cdf f3cf 7f3c f33f     ...~.1...<..<.?.
c0de230c:	f333 8c7f c637 fe18 ec30 3cf3 f3fb ff3c     3...7...0..<..<.
c0de231c:	3cf3 ffcf ccff cccc cccc f307 e6d9 d9f1     .<..............
c0de232c:	e6cc 8c63 c631 c7f8 bf8f ff7f f57e ddee     ..c.1.......~...
c0de233c:	f3e7 bdfb cfdf bee7 78f1 1e3c 7d8f ef7f     .........x<..}..
c0de234c:	c7fd be18 78f1 1e3c 7d8f 3030 b6cf cf6d     .....x<..}00..m.
c0de235c:	cdb6 8c7e 38e3 3f7f 30c3 c30c f330 cf3c     ..~..8.?.0..0.<.
c0de236c:	3cf3 f37b cf3c e79e 7331 9bb6 acdd 3566     .<{.<...1s....f5
c0de237c:	70ee 1b07 66c3 3c3c 3c3c c366 9b63 838d     .p...f<<<<f.c...
c0de238c:	60c1 7f30 0e18 70c3 fe18 333f 3333 43f3     .`0....p..?333.C
c0de239c:	c318 c218 cccf cccc 0cfc 49e3 3f33 1e33     ...........I3?3.
c0de23ac:	cfec 0fb3 f0c3 fb6d 7dbe 71bc 061c 300f     ......m..}.q...0
c0de23bc:	dbcc 6df7 3cf3 fff3 e060 dc01 637c 318c     ...m.<..`...|c.1
c0de23cc:	9b7e 63cd 8df0 3ec7 fc63 f7bd f3de 0cff     ~..c...>c.......
c0de23dc:	cccc cccc c307 7db0 b3cf ffed edff dbdb     .......}........
c0de23ec:	dbdb 7ddb bdef 1c37 fddb e36e b6df dbef     ...}..7...n.....
c0de23fc:	0c37 be03 df7d 0fb6 30c3 33fd 6f33 8f3c     7...}....0.33o<.
c0de240c:	e61f 631b 070c ef7b 2fbd 9b63 c6cd 33e1     ...c..{../c....3
c0de241c:	e6db 7f9f 30cc 7703 871b bb63 6303 8d9b     .....0.w..c..c..
c0de242c:	e1c6 1870 3f0e 30c6 0fc6 319c 0e76 8c63     ..p..?.0...1v.c.
c0de243c:	ff03 3fff 18c7 b9c3 e631 0f6f               ...?....1.o.

c0de2448 <charactersOPEN_SANS_EXTRABOLD_11PX>:
c0de2448:	c000 0000 c000 0088 8008 0089 c010 0081     ................
c0de2458:	802c 0001 c04c 1082 4074 0082 c098 0088     ,...L...t@......
c0de2468:	009c 1081 00ac 0089 80bc 0081 80cc 0101     ................
c0de2478:	c0dc 0380 00e0 0281 c0e4 0388 40e8 0081     .............@..
c0de2488:	00fc 108a 8114 1089 c124 1089 c138 1089     ........$...8...
c0de2498:	014c 108a 8164 1089 0174 108a c18c 1089     L...d...t.......
c0de24a8:	01a0 108a 01b8 108a c1d0 0188 c1d8 0180     ................
c0de24b8:	41e4 0101 81f8 0201 4204 0101 8214 1081     .A.......B......
c0de24c8:	8228 0082 0258 0082 c278 1089 c28c 1089     (...X...x.......
c0de24d8:	02a0 108a 82b8 1089 82c8 0089 02dc 108a     ................
c0de24e8:	02f4 108a 030c 1089 4314 1081 032c 008a     .........C..,...
c0de24f8:	8348 0089 c35c 108a 4380 108a 439c 108a     H...\....C...C..
c0de2508:	c3b8 1089 43cc 108a 03f0 108a 8408 0089     .....C..........
c0de2518:	841c 0081 0434 108a 844c 0081 c464 0082     ....4...L...d...
c0de2528:	0490 0082 c4b0 0081 c4cc 0081 44e8 0089     .............D..
c0de2538:	44fc 0081 4510 1081 c524 1081 c534 1501     .D...E..$...4...
c0de2548:	c538 2011 c53c 1181 c550 0089 8568 0181     8.. <...P...h...
c0de2558:	c57c 1081 c594 0181 85ac 1081 c5c0 0181     |...............
c0de2568:	c5e0 1089 05f4 1089 45fc 1081 c614 0089     .........E......
c0de2578:	062c 1089 8634 118a c64c 1189 c65c 0181     ,...4...L...\...
c0de2588:	c670 0189 c68c 1181 46a8 0189 86b4 0189     p........F......
c0de2598:	46c4 0101 c6d8 1189 c6e8 0181 86fc 0182     .F..............
c0de25a8:	c71c 0181 0734 1182 8754 0181 4768 0081     ....4...T...hG..
c0de25b8:	8784 2091 4790 0081 87a8 0201               ... .G......

c0de25c4 <fontOPEN_SANS_EXTRABOLD_11PX>:
c0de25c4:	01ec 0108 090c 7e20 2448 c0de 225c c0de     ...... ~H$..\"..

c0de25d4 <bitmapOPEN_SANS_LIGHT_16PX>:
c0de25d4:	0cff 9999 4090 0882 fe22 8123 7fc4 1044     .....@..".#...D.
c0de25e4:	0241 0809 229e 5091 7070 6448 83ca 4906     A....".PppHd...I
c0de25f4:	2244 9092 9484 1299 9092 2444 0922 1c06     D"........D$"...
c0de2604:	8844 4110 8181 90c4 0341 f30d 0f09 555a     D..A....A.....ZU
c0de2614:	2955 aaa5 16aa 0408 4fe2 88a1 0408 8fe2     U).......O......
c0de2624:	2040 076a 100f 4421 2108 8842 511c 1830     @ j...!D.!B..Q0.
c0de2634:	060c c183 88a0 7403 9249 0924 109e 0408     .......tI.$.....
c0de2644:	4102 0410 e041 9e0f 1010 f304 8080 2040     .A..A.........@ 
c0de2654:	03e8 c040 4140 8482 1088 ff21 0081 0201     ..@.@A....!.....
c0de2664:	813e 1040 80f8 4081 c860 3803 2083 e810     >.@....@`..8. ..
c0de2674:	830d a0c1 0790 207f 0408 4082 0810 8104     ....... ...@....
c0de2684:	511c 2830 88e2 c182 d060 9e07 3050 0c18     .Q0(....`...P0..
c0de2694:	817b 1040 01cc c00f 0f03 0540 1840 c063     {.@.......@.@.c.
c0de26a4:	0180 7f01 e000 010f 0603 318c 0f04 0842     ...........1..B.
c0de26b4:	1111 0802 f001 20c1 2402 119e 9099 9909     ....... .$......
c0de26c4:	8990 7719 2001 0400 0f80 c030 0300 4812     ...w. ....0....H
c0de26d4:	4120 3f08 0902 5024 9f80 3050 fa18 8284      A.?..$P..P0....
c0de26e4:	60c1 03e8 04f8 0102 0101 0101 0201 f804     .`..............
c0de26f4:	211f 8141 8181 8181 4181 1f21 107f c104     .!A......A!.....
c0de2704:	041f 1041 7ffc 0410 f041 4107 0410 11f8     ..A.....A..A....
c0de2714:	4020 0100 1004 807e 0a01 2048 817e 8181      @....~...H ~...
c0de2724:	8181 81ff 8181 8181 ff81 240f 9249 4924     ...........$I.$I
c0de2734:	c10e 2450 1851 1214 4891 0828 1041 4104     ..P$Q....H(.A..A
c0de2744:	0410 1041 01fc 3c06 c0f0 1685 685a 4992     ..A....<....Zh.I
c0de2754:	18c6 8063 8381 8583 8985 9191 c1a1 81c1     ..c.............
c0de2764:	1078 5022 0180 1806 8060 0a01 0844 5f1e     x."P....`...D.._
c0de2774:	8618 f861 4105 0410 1078 5022 0180 1806     ..a..A..x."P....
c0de2784:	8060 0a01 0844 401e 0200 9f18 3050 0c18     `...D..@....P0..
c0de2794:	227d 5091 0830 60be 1020 c070 4080 f020     }".P0..` .p..@ .
c0de27a4:	7f07 0204 4081 1020 0408 0102 8181 8181     .....@ .........
c0de27b4:	8181 8181 8181 3c42 0301 120a 8824 1108     ......B<....$...
c0de27c4:	2822 4050 c180 30a0 0c24 4489 1122 4249     "(P@...0$..D".IB
c0de27d4:	5092 1428 860a 6181 1020 0482 4111 0282     .P(....a ....A..
c0de27e4:	0a02 4414 0888 080a 4281 2442 1824 1018     ...D.....BB$$...
c0de27f4:	1010 1010 207f 0408 2041 0208 e041 1f0f     ..... ..A ..A...
c0de2804:	1111 1111 1111 410f 4108 2108 2108 8f08     .......A.A.!.!..
c0de2814:	8888 8888 8888 080f 450a 0a24 0106 117f     .........E$.....
c0de2824:	1e01 8208 187e 2ec6 0101 0101 433d 8181     ....~.......=C..
c0de2834:	8181 4381 bc3d 0410 1041 3c08 8080 8080     ...C=...A..<....
c0de2844:	c2bc 8181 8181 c281 1cbc 3051 0ff8 8404     ..........Q0....
c0de2854:	383c 1041 411f 0410 1041 fc04 4222 2242     <8A..A..A..."BB"
c0de2864:	043c 7c02 8142 3e43 4081 d020 0519 c183     <..|B.C>.@ .....
c0de2874:	3060 0418 07f9 4804 2492 1e49 4081 1020     `0.....H.$I..@ .
c0de2884:	248a 850a 2445 0414 1fff 339d 4146 8418     .$..E$.....3FA..
c0de2894:	1841 4184 8418 0841 519d 1830 060c 4183     A..A..A..Q0....A
c0de28a4:	511c 1830 060c 1c45 433d 8181 8181 4381     .Q0...E.=C.....C
c0de28b4:	013d 0101 bc01 81c2 8181 8181 bcc2 8080     =...............
c0de28c4:	8080 847d 4210 0108 843e 20c1 0f84 09e2     ..}..B..>.. ....
c0de28d4:	8421 8210 c103 3060 0c18 c506 c15e 48a0     !.....`0....^..H
c0de28e4:	a224 2850 6108 4628 2462 9249 2944 830c     $.P(.a(Fb$I.D)..
c0de28f4:	0810 6101 3128 230c 2185 a0c1 2448 50a2     ...a(1.#.!..H$.P
c0de2904:	0828 8104 1f30 4422 0884 981f 4210 1908     (...0."D.....B..
c0de2914:	1084 0842 ff06 01ff 1043 0842 84c1 4210     ..B.....C.B....B
c0de2924:	07c4 003c                                   ..<.

c0de2928 <charactersOPEN_SANS_LIGHT_16PX>:
c0de2928:	0000 0001 c000 1088 8008 1089 8010 0082     ................
c0de2938:	404c 108a 4078 108b c0bc 108a c0f4 1088     L@..x@..........
c0de2948:	00f8 1089 0108 1089 4118 100a 4130 110a     .........A..0A..
c0de2958:	c148 1580 414c 1409 0150 1589 8154 1081     H...LA..P...T...
c0de2968:	4170 108a 419c 4092 41b0 108a 41dc 108a     pA...A.@.A...A..
c0de2978:	4208 0082 4240 108a 426c 108a 4298 108a     .B..@B..lB...B..
c0de2988:	42c0 108a 42ec 108a 0318 1209 0324 1209     .B...B......$...
c0de2998:	4330 118a 434c 128a 435c 118a c374 1089     0C..LC..\C..t...
c0de29a8:	8394 108b 83e8 0082 8424 1092 8450 108a     ........$...P...
c0de29b8:	c480 1092 44b0 1092 04d4 0092 04f8 108b     .....D..........
c0de29c8:	0534 2093 0564 1091 856c 3081 4584 0092     4.. d...l..0.E..
c0de29d8:	05b0 0092 85d4 2093 0610 2093 0640 108b     ....... ... @...
c0de29e8:	467c 1092 06a0 108b 86ec 1092 4718 108a     |F...........G..
c0de29f8:	c744 0081 0770 2093 87a0 1082 87d4 0083     D...p.. ........
c0de2a08:	4828 0082 4860 1082 4890 108a 48bc 0089     (H..`H...H...H..
c0de2a18:	88dc 1081 48fc 1081 491c 108a 0938 1702     .....H...I..8...
c0de2a28:	493c 301a 0944 120a 8960 100a 0994 120a     <I.0D...`.......
c0de2a38:	89b0 100a 49e4 120a 8a04 0001 0a2c 0202     .....I......,...
c0de2a48:	4a60 100a 0a90 2109 4a98 2101 0ab0 000a     `J.....!.J.!....
c0de2a58:	0ae0 2009 8ae8 120b 4b20 120a 4b40 120a     ... .... K..@K..
c0de2a68:	8b60 120a 8b94 120a 8bc8 0209 cbe0 1209     `...............
c0de2a78:	4bf8 0181 4c14 120a 0c34 1202 0c54 0203     .K...L..4...T...
c0de2a88:	0c8c 120a 0ca8 1202 ccd4 1209 8cec 1081     ................
c0de2a98:	8d14 4009 8d20 0089 4d44 130a               ...@ ...DM..

c0de2aa4 <fontOPEN_SANS_LIGHT_16PX>:
c0de2aa4:	0353 0109 0d11 7e20 2928 c0de 25d4 c0de     S..... ~()...%..

c0de2ab4 <bitmapOPEN_SANS_REGULAR_11PX>:
c0de2ab4:	0fbf 9220 429f 49f9 5f04 cc65 a30f a54a     .. ..B.I._e...J.
c0de2ac4:	a5bd c552 924e 6518 bd1a 6a03 0a95 6a95     ..R.N..e...j...j
c0de2ad4:	0405 33f1 c812 1a8f 0103 4448 1222 9996     ...3......HD"...
c0de2ae4:	6999 492e 8792 2488 87f1 8868 1078 4946     .i.I...$..h.x.FI
c0de2af4:	0fd2 1f41 88f1 1e78 99f1 8f69 2448 9622     ..A...x...i.H$".
c0de2b04:	9969 9669 8f99 2178 6802 3348 0f84 210f     i.i...x!.hH3...!
c0de2b14:	12cc 4887 2022 827c a5b9 a5a5 01fd 083e     ...H" |.......>.
c0de2b24:	850a f222 8289 c63f 6317 7efc 1084 f0c2     .."...?..c.~....
c0de2b34:	185f 6186 7e18 f11f f111 843f 43f0 7e08     _..a.~....?..C.~
c0de2b44:	0410 1871 61fa fe18 1861 ff86 4924 1c92     ..q..a..a...$I..
c0de2b54:	5251 450c 8512 8421 4210 c3f8 c3c3 a5a5     QR.E..!..B......
c0de2b64:	9999 e199 9658 1a69 be87 3060 0c18 7d06     ....X.i...`0...}
c0de2b74:	c62f 42f8 be08 3060 0c18 7d06 1010 c62f     /..B..`0...}../.
c0de2b84:	52f8 1e8c 8c31 9f78 4210 2108 1861 6186     .R..1.x..B.!a..a
c0de2b94:	7a18 9141 4448 50a1 3110 24ca 5293 294a     .zA.HD.P.1.$.RJ)
c0de2ba4:	0845 a121 30c4 248c a185 3124 8208 8f20     E.!..0.$..$1.. .
c0de2bb4:	1244 4ff1 2492 2139 4422 2784 9249 0c3c     D..O.$9!"D.'I.<.
c0de2bc4:	4923 1f21 8f09 f99f bc21 6318 1e7c e111     #I!.....!..c|...
c0de2bd4:	fa10 6318 9ef4 e11f 2f2c 2222 24be 8239     ...c....,/"".$9.
c0de2be4:	8617 211e 18bc 8c63 04fd 9249 01e4 5911     ...!..c...I....Y
c0de2bf4:	9953 efff 9191 9191 2f91 18c6 2e23 18c6     S......../..#...
c0de2c04:	2f1d 18c6 085f 3e01 18c6 843d 4f10 1792     ./.._..>..=..O..
c0de2c14:	7843 22f2 0e22 c631 3f18 24a1 0c49 1103     Cx."".1..?.$I...
c0de2c24:	a955 4552 0884 6699 a199 4924 430c 0310     U.RE...f..$I.C..
c0de2c34:	111f 3e22 9496 3248 07ff 4493 1a4a 00c3     ..">..H2...DJ...

c0de2c44 <charactersOPEN_SANS_REGULAR_11PX>:
c0de2c44:	c000 0000 c000 1088 0004 1089 c008 0081     ................
c0de2c54:	8024 1109 4034 108a 4050 208a 8068 0088     $...4@..P@. h...
c0de2c64:	c06c 1080 c078 0088 8084 0081 8094 0201     l...x...........
c0de2c74:	c09c 1400 00a0 1309 c0a4 1408 00a8 0081     ................
c0de2c84:	80b8 1089 80c8 2089 80d4 1089 80e4 1089     ....... ........
c0de2c94:	00f4 108a 810c 1089 811c 1089 812c 1089     ............,...
c0de2ca4:	813c 1089 814c 1089 c15c 1188 c160 1180     <...L...\...`...
c0de2cb4:	8168 1109 8174 1209 817c 1109 4188 0089     h...t...|....A..
c0de2cc4:	8198 108a c1bc 0081 c1d8 1089 c1ec 1089     ................
c0de2cd4:	0200 108a 8218 1089 8228 0089 023c 108a     ........(...<...
c0de2ce4:	0254 108a c26c 1088 0270 1081 c280 0089     T...l...p.......
c0de2cf4:	8298 0089 82ac 108a 02cc 108a 42e4 108a     .............B..
c0de2d04:	c300 1089 4314 108a c338 1089 834c 1089     .....C..8...L...
c0de2d14:	c35c 1089 0370 108a c388 0081 83a4 0082     \...p...........
c0de2d24:	c3cc 1081 83e4 0081 83fc 1089 040c 0089     ................
c0de2d34:	041c 0081 042c 1081 843c 0081 844c 1501     ....,...<...L...
c0de2d44:	8450 2011 8454 1189 c460 1089 4474 0189     P.. T...`...tD..
c0de2d54:	c480 1089 8494 1189 44a0 1081 84b0 0181     .........D......
c0de2d64:	c4cc 1089 c4e0 1088 04e4 1081 84f8 1089     ................
c0de2d74:	c508 1088 850c 118a c524 1189 c534 1189     ........$...4...
c0de2d84:	c544 1189 c55c 1189 0574 0189 457c 0189     D...\...t...|E..
c0de2d94:	0588 0101 c598 1189 85a8 0181 45bc 0182     .............E..
c0de2da4:	85d8 1189 85e4 0181 4600 0181 0610 0089     .........F......
c0de2db4:	8620 2099 0628 1081 8638 1209                .. (...8...

c0de2dc0 <fontOPEN_SANS_REGULAR_11PX>:
c0de2dc0:	018f 010a 090c 7e20 2c44 c0de 2ab4 c0de     ...... ~D,...*..

c0de2dd0 <C_bagl_fonts>:
c0de2dd0:	25c4 c0de 2aa4 c0de 2dc0 c0de               .%...*...-..

c0de2ddc <C_bagl_fonts_count>:
c0de2ddc:	0003 0000                                   ....

c0de2de0 <_etext>:
	...

c0de2e00 <install_parameters>:
c0de2e00:	0501 634f 7274 0261 3105 302e 302e 0104     ..Octra..1.0.0..
c0de2e10:	                                             .
