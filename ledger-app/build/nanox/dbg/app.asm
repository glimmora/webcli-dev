
build/nanox/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <app_main>:
c0de0000:	480a      	ldr	r0, [pc, #40]	@ (c0de002c <app_main+0x2c>)
c0de0002:	217c      	movs	r1, #124	@ 0x7c
c0de0004:	4448      	add	r0, r9
c0de0006:	f002 f8a9 	bl	c0de215c <explicit_bzero>
c0de000a:	4809      	ldr	r0, [pc, #36]	@ (c0de0030 <app_main+0x30>)
c0de000c:	f44f 7188 	mov.w	r1, #272	@ 0x110
c0de0010:	4448      	add	r0, r9
c0de0012:	f002 f89f 	bl	c0de2154 <__aeabi_memclr>
c0de0016:	f000 fdab 	bl	c0de0b70 <io_seproxyhal_init>
c0de001a:	2000      	movs	r0, #0
c0de001c:	f000 fdc8 	bl	c0de0bb0 <USB_power>
c0de0020:	2001      	movs	r0, #1
c0de0022:	f000 fdc5 	bl	c0de0bb0 <USB_power>
c0de0026:	f000 f813 	bl	c0de0050 <app_main_impl>
c0de002a:	bf00      	nop
c0de002c:	00000004 	.word	0x00000004
c0de0030:	000003c8 	.word	0x000003c8

c0de0034 <main>:
c0de0034:	b510      	push	{r4, lr}
c0de0036:	4604      	mov	r4, r0
c0de0038:	b662      	cpsie	i
c0de003a:	f001 ff67 	bl	c0de1f0c <os_boot>
c0de003e:	b90c      	cbnz	r4, c0de0044 <main+0x10>
c0de0040:	f001 fda0 	bl	c0de1b84 <standalone_app_main>
c0de0044:	2000      	movs	r0, #0
c0de0046:	bd10      	pop	{r4, pc}

c0de0048 <app_exit>:
c0de0048:	20ff      	movs	r0, #255	@ 0xff
c0de004a:	f001 fff3 	bl	c0de2034 <os_sched_exit>
c0de004e:	d4d4      	bmi.n	c0ddfffa <STACK_MIN_SIZE+0xc0ddfa1e>

c0de0050 <app_main_impl>:
c0de0050:	b0cc      	sub	sp, #304	@ 0x130
c0de0052:	f04f 0b00 	mov.w	fp, #0
c0de0056:	f8df 63ac 	ldr.w	r6, [pc, #940]	@ c0de0404 <app_main_impl+0x3b4>
c0de005a:	f10d 0a0c 	add.w	sl, sp, #12
c0de005e:	f04f 0867 	mov.w	r8, #103	@ 0x67
c0de0062:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de0066:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de006a:	f8ad b042 	strh.w	fp, [sp, #66]	@ 0x42
c0de006e:	f8ad b040 	strh.w	fp, [sp, #64]	@ 0x40
c0de0072:	f88d b03f 	strb.w	fp, [sp, #63]	@ 0x3f
c0de0076:	a839      	add	r0, sp, #228	@ 0xe4
c0de0078:	3009      	adds	r0, #9
c0de007a:	9002      	str	r0, [sp, #8]
c0de007c:	4650      	mov	r0, sl
c0de007e:	f002 f889 	bl	c0de2194 <setjmp>
c0de0082:	b287      	uxth	r7, r0
c0de0084:	f8ad 0038 	strh.w	r0, [sp, #56]	@ 0x38
c0de0088:	b37f      	cbz	r7, c0de00ea <app_main_impl+0x9a>
c0de008a:	2f05      	cmp	r7, #5
c0de008c:	f000 81b1 	beq.w	c0de03f2 <app_main_impl+0x3a2>
c0de0090:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de0092:	f8ad b038 	strh.w	fp, [sp, #56]	@ 0x38
c0de0096:	f002 f80b 	bl	c0de20b0 <try_context_set>
c0de009a:	f5a7 40c0 	sub.w	r0, r7, #24576	@ 0x6000
c0de009e:	f8ad b040 	strh.w	fp, [sp, #64]	@ 0x40
c0de00a2:	f5b0 5f40 	cmp.w	r0, #12288	@ 0x3000
c0de00a6:	4628      	mov	r0, r5
c0de00a8:	bf38      	it	cc
c0de00aa:	4638      	movcc	r0, r7
c0de00ac:	42a7      	cmp	r7, r4
c0de00ae:	bf08      	it	eq
c0de00b0:	4638      	moveq	r0, r7
c0de00b2:	0a01      	lsrs	r1, r0, #8
c0de00b4:	464a      	mov	r2, r9
c0de00b6:	f8bd 3040 	ldrh.w	r3, [sp, #64]	@ 0x40
c0de00ba:	eb09 0206 	add.w	r2, r9, r6
c0de00be:	54d1      	strb	r1, [r2, r3]
c0de00c0:	1c59      	adds	r1, r3, #1
c0de00c2:	f8ad 1040 	strh.w	r1, [sp, #64]	@ 0x40
c0de00c6:	f8bd 1040 	ldrh.w	r1, [sp, #64]	@ 0x40
c0de00ca:	5450      	strb	r0, [r2, r1]
c0de00cc:	1c48      	adds	r0, r1, #1
c0de00ce:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de00d2:	f001 ffe5 	bl	c0de20a0 <try_context_get>
c0de00d6:	4550      	cmp	r0, sl
c0de00d8:	d102      	bne.n	c0de00e0 <app_main_impl+0x90>
c0de00da:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de00dc:	f001 ffe8 	bl	c0de20b0 <try_context_set>
c0de00e0:	f8bd 0038 	ldrh.w	r0, [sp, #56]	@ 0x38
c0de00e4:	2800      	cmp	r0, #0
c0de00e6:	d0c9      	beq.n	c0de007c <app_main_impl+0x2c>
c0de00e8:	e181      	b.n	c0de03ee <app_main_impl+0x39e>
c0de00ea:	4650      	mov	r0, sl
c0de00ec:	f001 ffe0 	bl	c0de20b0 <try_context_set>
c0de00f0:	900d      	str	r0, [sp, #52]	@ 0x34
c0de00f2:	f89d 003f 	ldrb.w	r0, [sp, #63]	@ 0x3f
c0de00f6:	f8bd 1040 	ldrh.w	r1, [sp, #64]	@ 0x40
c0de00fa:	f000 fba3 	bl	c0de0844 <io_exchange>
c0de00fe:	f8ad 0042 	strh.w	r0, [sp, #66]	@ 0x42
c0de0102:	f88d b03f 	strb.w	fp, [sp, #63]	@ 0x3f
c0de0106:	f8ad b040 	strh.w	fp, [sp, #64]	@ 0x40
c0de010a:	f8bd 0042 	ldrh.w	r0, [sp, #66]	@ 0x42
c0de010e:	2803      	cmp	r0, #3
c0de0110:	d807      	bhi.n	c0de0122 <app_main_impl+0xd2>
c0de0112:	4648      	mov	r0, r9
c0de0114:	f8bd 1040 	ldrh.w	r1, [sp, #64]	@ 0x40
c0de0118:	eb09 0006 	add.w	r0, r9, r6
c0de011c:	f800 8001 	strb.w	r8, [r0, r1]
c0de0120:	e02d      	b.n	c0de017e <app_main_impl+0x12e>
c0de0122:	4648      	mov	r0, r9
c0de0124:	f819 1006 	ldrb.w	r1, [r9, r6]
c0de0128:	eb09 0006 	add.w	r0, r9, r6
c0de012c:	7840      	ldrb	r0, [r0, #1]
c0de012e:	f8bd 2042 	ldrh.w	r2, [sp, #66]	@ 0x42
c0de0132:	29e0      	cmp	r1, #224	@ 0xe0
c0de0134:	d11c      	bne.n	c0de0170 <app_main_impl+0x120>
c0de0136:	2100      	movs	r1, #0
c0de0138:	2a05      	cmp	r2, #5
c0de013a:	d32e      	bcc.n	c0de019a <app_main_impl+0x14a>
c0de013c:	464a      	mov	r2, r9
c0de013e:	4688      	mov	r8, r1
c0de0140:	eb09 0206 	add.w	r2, r9, r6
c0de0144:	7912      	ldrb	r2, [r2, #4]
c0de0146:	b34a      	cbz	r2, c0de019c <app_main_impl+0x14c>
c0de0148:	f8bd 3042 	ldrh.w	r3, [sp, #66]	@ 0x42
c0de014c:	f8bd 4042 	ldrh.w	r4, [sp, #66]	@ 0x42
c0de0150:	1d51      	adds	r1, r2, #5
c0de0152:	4dac      	ldr	r5, [pc, #688]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de0154:	42a1      	cmp	r1, r4
c0de0156:	464c      	mov	r4, r9
c0de0158:	bf88      	it	hi
c0de015a:	2200      	movhi	r2, #0
c0de015c:	eb09 0405 	add.w	r4, r9, r5
c0de0160:	4299      	cmp	r1, r3
c0de0162:	4611      	mov	r1, r2
c0de0164:	f104 0805 	add.w	r8, r4, #5
c0de0168:	bf88      	it	hi
c0de016a:	f04f 0800 	movhi.w	r8, #0
c0de016e:	e015      	b.n	c0de019c <app_main_impl+0x14c>
c0de0170:	4648      	mov	r0, r9
c0de0172:	f8bd 1040 	ldrh.w	r1, [sp, #64]	@ 0x40
c0de0176:	226e      	movs	r2, #110	@ 0x6e
c0de0178:	eb09 0006 	add.w	r0, r9, r6
c0de017c:	5442      	strb	r2, [r0, r1]
c0de017e:	1c48      	adds	r0, r1, #1
c0de0180:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de0184:	f8bd 0040 	ldrh.w	r0, [sp, #64]	@ 0x40
c0de0188:	1c41      	adds	r1, r0, #1
c0de018a:	f8ad 1040 	strh.w	r1, [sp, #64]	@ 0x40
c0de018e:	4649      	mov	r1, r9
c0de0190:	eb09 0106 	add.w	r1, r9, r6
c0de0194:	f801 b000 	strb.w	fp, [r1, r0]
c0de0198:	e770      	b.n	c0de007c <app_main_impl+0x2c>
c0de019a:	4688      	mov	r8, r1
c0de019c:	4f9b      	ldr	r7, [pc, #620]	@ (c0de040c <app_main_impl+0x3bc>)
c0de019e:	2804      	cmp	r0, #4
c0de01a0:	447f      	add	r7, pc
c0de01a2:	d035      	beq.n	c0de0210 <app_main_impl+0x1c0>
c0de01a4:	2801      	cmp	r0, #1
c0de01a6:	d01a      	beq.n	c0de01de <app_main_impl+0x18e>
c0de01a8:	2802      	cmp	r0, #2
c0de01aa:	d033      	beq.n	c0de0214 <app_main_impl+0x1c4>
c0de01ac:	2803      	cmp	r0, #3
c0de01ae:	d03a      	beq.n	c0de0226 <app_main_impl+0x1d6>
c0de01b0:	2800      	cmp	r0, #0
c0de01b2:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de01b6:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de01ba:	f04f 0867 	mov.w	r8, #103	@ 0x67
c0de01be:	d143      	bne.n	c0de0248 <app_main_impl+0x1f8>
c0de01c0:	4e90      	ldr	r6, [pc, #576]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de01c2:	4648      	mov	r0, r9
c0de01c4:	2101      	movs	r1, #1
c0de01c6:	eb09 0006 	add.w	r0, r9, r6
c0de01ca:	f809 1006 	strb.w	r1, [r9, r6]
c0de01ce:	70c1      	strb	r1, [r0, #3]
c0de01d0:	f880 b002 	strb.w	fp, [r0, #2]
c0de01d4:	f880 b001 	strb.w	fp, [r0, #1]
c0de01d8:	2004      	movs	r0, #4
c0de01da:	4601      	mov	r1, r0
c0de01dc:	e061      	b.n	c0de02a2 <app_main_impl+0x252>
c0de01de:	2905      	cmp	r1, #5
c0de01e0:	d328      	bcc.n	c0de0234 <app_main_impl+0x1e4>
c0de01e2:	f898 7000 	ldrb.w	r7, [r8]
c0de01e6:	b32f      	cbz	r7, c0de0234 <app_main_impl+0x1e4>
c0de01e8:	2f0a      	cmp	r7, #10
c0de01ea:	d823      	bhi.n	c0de0234 <app_main_impl+0x1e4>
c0de01ec:	00b8      	lsls	r0, r7, #2
c0de01ee:	3001      	adds	r0, #1
c0de01f0:	4288      	cmp	r0, r1
c0de01f2:	d87e      	bhi.n	c0de02f2 <app_main_impl+0x2a2>
c0de01f4:	463d      	mov	r5, r7
c0de01f6:	2400      	movs	r4, #0
c0de01f8:	42a7      	cmp	r7, r4
c0de01fa:	d07d      	beq.n	c0de02f8 <app_main_impl+0x2a8>
c0de01fc:	f000 fa1f 	bl	c0de063e <OUTLINED_FUNCTION_0>
c0de0200:	4a81      	ldr	r2, [pc, #516]	@ (c0de0408 <app_main_impl+0x3b8>)
c0de0202:	4649      	mov	r1, r9
c0de0204:	eb09 0102 	add.w	r1, r9, r2
c0de0208:	f841 0024 	str.w	r0, [r1, r4, lsl #2]
c0de020c:	3401      	adds	r4, #1
c0de020e:	e7f3      	b.n	c0de01f8 <app_main_impl+0x1a8>
c0de0210:	b911      	cbnz	r1, c0de0218 <app_main_impl+0x1c8>
c0de0212:	e00f      	b.n	c0de0234 <app_main_impl+0x1e4>
c0de0214:	294b      	cmp	r1, #75	@ 0x4b
c0de0216:	d30d      	bcc.n	c0de0234 <app_main_impl+0x1e4>
c0de0218:	4640      	mov	r0, r8
c0de021a:	aa2f      	add	r2, sp, #188	@ 0xbc
c0de021c:	f000 f9f4 	bl	c0de0608 <sha256_hash>
c0de0220:	b1b0      	cbz	r0, c0de0250 <app_main_impl+0x200>
c0de0222:	4e78      	ldr	r6, [pc, #480]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de0224:	e02c      	b.n	c0de0280 <app_main_impl+0x230>
c0de0226:	2905      	cmp	r1, #5
c0de0228:	d304      	bcc.n	c0de0234 <app_main_impl+0x1e4>
c0de022a:	f898 7000 	ldrb.w	r7, [r8]
c0de022e:	b10f      	cbz	r7, c0de0234 <app_main_impl+0x1e4>
c0de0230:	2f0a      	cmp	r7, #10
c0de0232:	d95a      	bls.n	c0de02ea <app_main_impl+0x29a>
c0de0234:	216a      	movs	r1, #106	@ 0x6a
c0de0236:	2080      	movs	r0, #128	@ 0x80
c0de0238:	4e72      	ldr	r6, [pc, #456]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de023a:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de023e:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de0242:	f04f 0867 	mov.w	r8, #103	@ 0x67
c0de0246:	e028      	b.n	c0de029a <app_main_impl+0x24a>
c0de0248:	4e6e      	ldr	r6, [pc, #440]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de024a:	216d      	movs	r1, #109	@ 0x6d
c0de024c:	2000      	movs	r0, #0
c0de024e:	e024      	b.n	c0de029a <app_main_impl+0x24a>
c0de0250:	4a6d      	ldr	r2, [pc, #436]	@ (c0de0408 <app_main_impl+0x3b8>)
c0de0252:	4648      	mov	r0, r9
c0de0254:	4e6b      	ldr	r6, [pc, #428]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de0256:	eb09 0002 	add.w	r0, r9, r2
c0de025a:	f890 1028 	ldrb.w	r1, [r0, #40]	@ 0x28
c0de025e:	b111      	cbz	r1, c0de0266 <app_main_impl+0x216>
c0de0260:	eb09 0002 	add.w	r0, r9, r2
c0de0264:	e006      	b.n	c0de0274 <app_main_impl+0x224>
c0de0266:	a825      	add	r0, sp, #148	@ 0x94
c0de0268:	e897 003e 	ldmia.w	r7, {r1, r2, r3, r4, r5}
c0de026c:	4684      	mov	ip, r0
c0de026e:	e88c 003e 	stmia.w	ip, {r1, r2, r3, r4, r5}
c0de0272:	2105      	movs	r1, #5
c0de0274:	af11      	add	r7, sp, #68	@ 0x44
c0de0276:	ab39      	add	r3, sp, #228	@ 0xe4
c0de0278:	463a      	mov	r2, r7
c0de027a:	f000 f8d5 	bl	c0de0428 <derive_keypair>
c0de027e:	b1d0      	cbz	r0, c0de02b6 <app_main_impl+0x266>
c0de0280:	f44f 40de 	mov.w	r0, #28416	@ 0x6f00
c0de0284:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de0288:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de028c:	f04f 0867 	mov.w	r8, #103	@ 0x67
c0de0290:	b281      	uxth	r1, r0
c0de0292:	f5b1 4fc0 	cmp.w	r1, #24576	@ 0x6000
c0de0296:	d303      	bcc.n	c0de02a0 <app_main_impl+0x250>
c0de0298:	0a09      	lsrs	r1, r1, #8
c0de029a:	f8ad b040 	strh.w	fp, [sp, #64]	@ 0x40
c0de029e:	e709      	b.n	c0de00b4 <app_main_impl+0x64>
c0de02a0:	460a      	mov	r2, r1
c0de02a2:	464a      	mov	r2, r9
c0de02a4:	2390      	movs	r3, #144	@ 0x90
c0de02a6:	3002      	adds	r0, #2
c0de02a8:	eb09 0206 	add.w	r2, r9, r6
c0de02ac:	5453      	strb	r3, [r2, r1]
c0de02ae:	4411      	add	r1, r2
c0de02b0:	f881 b001 	strb.w	fp, [r1, #1]
c0de02b4:	e70b      	b.n	c0de00ce <app_main_impl+0x7e>
c0de02b6:	4668      	mov	r0, sp
c0de02b8:	eb09 0106 	add.w	r1, r9, r6
c0de02bc:	2320      	movs	r3, #32
c0de02be:	6001      	str	r1, [r0, #0]
c0de02c0:	2140      	movs	r1, #64	@ 0x40
c0de02c2:	6041      	str	r1, [r0, #4]
c0de02c4:	4638      	mov	r0, r7
c0de02c6:	2105      	movs	r1, #5
c0de02c8:	aa2f      	add	r2, sp, #188	@ 0xbc
c0de02ca:	f001 fe07 	bl	c0de1edc <cx_eddsa_sign_no_throw>
c0de02ce:	4680      	mov	r8, r0
c0de02d0:	4638      	mov	r0, r7
c0de02d2:	2128      	movs	r1, #40	@ 0x28
c0de02d4:	f001 ff42 	bl	c0de215c <explicit_bzero>
c0de02d8:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de02dc:	4e49      	ldr	r6, [pc, #292]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de02de:	f1b8 0f00 	cmp.w	r8, #0
c0de02e2:	4628      	mov	r0, r5
c0de02e4:	bf08      	it	eq
c0de02e6:	2040      	moveq	r0, #64	@ 0x40
c0de02e8:	e7ce      	b.n	c0de0288 <app_main_impl+0x238>
c0de02ea:	00b8      	lsls	r0, r7, #2
c0de02ec:	3001      	adds	r0, #1
c0de02ee:	4288      	cmp	r0, r1
c0de02f0:	d942      	bls.n	c0de0378 <app_main_impl+0x328>
c0de02f2:	2167      	movs	r1, #103	@ 0x67
c0de02f4:	2000      	movs	r0, #0
c0de02f6:	e79f      	b.n	c0de0238 <app_main_impl+0x1e8>
c0de02f8:	4f43      	ldr	r7, [pc, #268]	@ (c0de0408 <app_main_impl+0x3b8>)
c0de02fa:	4629      	mov	r1, r5
c0de02fc:	eb09 0007 	add.w	r0, r9, r7
c0de0300:	f880 5028 	strb.w	r5, [r0, #40]	@ 0x28
c0de0304:	ac11      	add	r4, sp, #68	@ 0x44
c0de0306:	ab39      	add	r3, sp, #228	@ 0xe4
c0de0308:	4622      	mov	r2, r4
c0de030a:	f000 f88d 	bl	c0de0428 <derive_keypair>
c0de030e:	2800      	cmp	r0, #0
c0de0310:	d155      	bne.n	c0de03be <app_main_impl+0x36e>
c0de0312:	4625      	mov	r5, r4
c0de0314:	eb09 0407 	add.w	r4, r9, r7
c0de0318:	9902      	ldr	r1, [sp, #8]
c0de031a:	2220      	movs	r2, #32
c0de031c:	f104 0829 	add.w	r8, r4, #41	@ 0x29
c0de0320:	4640      	mov	r0, r8
c0de0322:	f001 ff0f 	bl	c0de2144 <__aeabi_memcpy>
c0de0326:	4628      	mov	r0, r5
c0de0328:	2128      	movs	r1, #40	@ 0x28
c0de032a:	f001 ff17 	bl	c0de215c <explicit_bzero>
c0de032e:	f104 0149 	add.w	r1, r4, #73	@ 0x49
c0de0332:	4640      	mov	r0, r8
c0de0334:	f000 f8a2 	bl	c0de047c <get_address>
c0de0338:	2800      	cmp	r0, #0
c0de033a:	d140      	bne.n	c0de03be <app_main_impl+0x36e>
c0de033c:	4e31      	ldr	r6, [pc, #196]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de033e:	444f      	add	r7, r9
c0de0340:	2220      	movs	r2, #32
c0de0342:	f107 0129 	add.w	r1, r7, #41	@ 0x29
c0de0346:	eb09 0406 	add.w	r4, r9, r6
c0de034a:	f809 2006 	strb.w	r2, [r9, r6]
c0de034e:	1c60      	adds	r0, r4, #1
c0de0350:	f001 fef8 	bl	c0de2144 <__aeabi_memcpy>
c0de0354:	f107 0549 	add.w	r5, r7, #73	@ 0x49
c0de0358:	4628      	mov	r0, r5
c0de035a:	f001 ff29 	bl	c0de21b0 <strlen>
c0de035e:	4680      	mov	r8, r0
c0de0360:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de0364:	f104 0022 	add.w	r0, r4, #34	@ 0x22
c0de0368:	4629      	mov	r1, r5
c0de036a:	fa1f f288 	uxth.w	r2, r8
c0de036e:	f001 fee9 	bl	c0de2144 <__aeabi_memcpy>
c0de0372:	f108 0022 	add.w	r0, r8, #34	@ 0x22
c0de0376:	e025      	b.n	c0de03c4 <app_main_impl+0x374>
c0de0378:	463d      	mov	r5, r7
c0de037a:	2400      	movs	r4, #0
c0de037c:	42a7      	cmp	r7, r4
c0de037e:	d006      	beq.n	c0de038e <app_main_impl+0x33e>
c0de0380:	f000 f95d 	bl	c0de063e <OUTLINED_FUNCTION_0>
c0de0384:	a92f      	add	r1, sp, #188	@ 0xbc
c0de0386:	f841 0024 	str.w	r0, [r1, r4, lsl #2]
c0de038a:	3401      	adds	r4, #1
c0de038c:	e7f6      	b.n	c0de037c <app_main_impl+0x32c>
c0de038e:	a82f      	add	r0, sp, #188	@ 0xbc
c0de0390:	ac25      	add	r4, sp, #148	@ 0x94
c0de0392:	4629      	mov	r1, r5
c0de0394:	ab39      	add	r3, sp, #228	@ 0xe4
c0de0396:	4622      	mov	r2, r4
c0de0398:	f000 f846 	bl	c0de0428 <derive_keypair>
c0de039c:	b978      	cbnz	r0, c0de03be <app_main_impl+0x36e>
c0de039e:	ad1d      	add	r5, sp, #116	@ 0x74
c0de03a0:	9902      	ldr	r1, [sp, #8]
c0de03a2:	2220      	movs	r2, #32
c0de03a4:	4628      	mov	r0, r5
c0de03a6:	f001 fecd 	bl	c0de2144 <__aeabi_memcpy>
c0de03aa:	4620      	mov	r0, r4
c0de03ac:	2128      	movs	r1, #40	@ 0x28
c0de03ae:	f001 fed5 	bl	c0de215c <explicit_bzero>
c0de03b2:	ac11      	add	r4, sp, #68	@ 0x44
c0de03b4:	4628      	mov	r0, r5
c0de03b6:	4621      	mov	r1, r4
c0de03b8:	f000 f860 	bl	c0de047c <get_address>
c0de03bc:	b148      	cbz	r0, c0de03d2 <app_main_impl+0x382>
c0de03be:	4e11      	ldr	r6, [pc, #68]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de03c0:	f44f 40de 	mov.w	r0, #28416	@ 0x6f00
c0de03c4:	f04f 0867 	mov.w	r8, #103	@ 0x67
c0de03c8:	f44f 45de 	mov.w	r5, #28416	@ 0x6f00
c0de03cc:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de03d0:	e75e      	b.n	c0de0290 <app_main_impl+0x240>
c0de03d2:	4620      	mov	r0, r4
c0de03d4:	f001 feec 	bl	c0de21b0 <strlen>
c0de03d8:	4e0a      	ldr	r6, [pc, #40]	@ (c0de0404 <app_main_impl+0x3b4>)
c0de03da:	4680      	mov	r8, r0
c0de03dc:	4621      	mov	r1, r4
c0de03de:	fa1f f288 	uxth.w	r2, r8
c0de03e2:	eb09 0006 	add.w	r0, r9, r6
c0de03e6:	f001 fead 	bl	c0de2144 <__aeabi_memcpy>
c0de03ea:	4640      	mov	r0, r8
c0de03ec:	e7ea      	b.n	c0de03c4 <app_main_impl+0x374>
c0de03ee:	f001 fd90 	bl	c0de1f12 <os_longjmp>
c0de03f2:	2000      	movs	r0, #0
c0de03f4:	f8ad 0038 	strh.w	r0, [sp, #56]	@ 0x38
c0de03f8:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de03fa:	f001 fe59 	bl	c0de20b0 <try_context_set>
c0de03fe:	2005      	movs	r0, #5
c0de0400:	f001 fd87 	bl	c0de1f12 <os_longjmp>
c0de0404:	00000080 	.word	0x00000080
c0de0408:	00000004 	.word	0x00000004
c0de040c:	0000205c 	.word	0x0000205c

c0de0410 <read_u32_be>:
c0de0410:	5c42      	ldrb	r2, [r0, r1]
c0de0412:	4408      	add	r0, r1
c0de0414:	7841      	ldrb	r1, [r0, #1]
c0de0416:	7883      	ldrb	r3, [r0, #2]
c0de0418:	78c0      	ldrb	r0, [r0, #3]
c0de041a:	0409      	lsls	r1, r1, #16
c0de041c:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0de0420:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de0424:	4408      	add	r0, r1
c0de0426:	4770      	bx	lr

c0de0428 <derive_keypair>:
c0de0428:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de042a:	b091      	sub	sp, #68	@ 0x44
c0de042c:	4614      	mov	r4, r2
c0de042e:	aa01      	add	r2, sp, #4
c0de0430:	461d      	mov	r5, r3
c0de0432:	f000 f8af 	bl	c0de0594 <os_derive_bip32_with_seed_no_throw>
c0de0436:	b120      	cbz	r0, c0de0442 <derive_keypair+0x1a>
c0de0438:	a801      	add	r0, sp, #4
c0de043a:	2140      	movs	r1, #64	@ 0x40
c0de043c:	f001 fe8e 	bl	c0de215c <explicit_bzero>
c0de0440:	e00c      	b.n	c0de045c <derive_keypair+0x34>
c0de0442:	ae01      	add	r6, sp, #4
c0de0444:	2071      	movs	r0, #113	@ 0x71
c0de0446:	2220      	movs	r2, #32
c0de0448:	4623      	mov	r3, r4
c0de044a:	4631      	mov	r1, r6
c0de044c:	f001 fd41 	bl	c0de1ed2 <cx_ecfp_init_private_key_no_throw>
c0de0450:	4607      	mov	r7, r0
c0de0452:	4630      	mov	r0, r6
c0de0454:	2140      	movs	r1, #64	@ 0x40
c0de0456:	f001 fe81 	bl	c0de215c <explicit_bzero>
c0de045a:	b11f      	cbz	r7, c0de0464 <derive_keypair+0x3c>
c0de045c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0460:	b011      	add	sp, #68	@ 0x44
c0de0462:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0464:	2071      	movs	r0, #113	@ 0x71
c0de0466:	4629      	mov	r1, r5
c0de0468:	4622      	mov	r2, r4
c0de046a:	2301      	movs	r3, #1
c0de046c:	f001 fd2c 	bl	c0de1ec8 <cx_ecfp_generate_pair_no_throw>
c0de0470:	b110      	cbz	r0, c0de0478 <derive_keypair+0x50>
c0de0472:	4620      	mov	r0, r4
c0de0474:	2128      	movs	r1, #40	@ 0x28
c0de0476:	e7e1      	b.n	c0de043c <derive_keypair+0x14>
c0de0478:	2000      	movs	r0, #0
c0de047a:	e7f1      	b.n	c0de0460 <derive_keypair+0x38>

c0de047c <get_address>:
c0de047c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0480:	b098      	sub	sp, #96	@ 0x60
c0de0482:	f10d 0b40 	add.w	fp, sp, #64	@ 0x40
c0de0486:	4688      	mov	r8, r1
c0de0488:	2120      	movs	r1, #32
c0de048a:	465a      	mov	r2, fp
c0de048c:	f000 f8bc 	bl	c0de0608 <sha256_hash>
c0de0490:	2800      	cmp	r0, #0
c0de0492:	d169      	bne.n	c0de0568 <get_address+0xec>
c0de0494:	2700      	movs	r7, #0
c0de0496:	2f20      	cmp	r7, #32
c0de0498:	d004      	beq.n	c0de04a4 <get_address+0x28>
c0de049a:	f81b 0007 	ldrb.w	r0, [fp, r7]
c0de049e:	b908      	cbnz	r0, c0de04a4 <get_address+0x28>
c0de04a0:	3701      	adds	r7, #1
c0de04a2:	e7f8      	b.n	c0de0496 <get_address+0x1a>
c0de04a4:	f1c7 0020 	rsb	r0, r7, #32
c0de04a8:	218a      	movs	r1, #138	@ 0x8a
c0de04aa:	4348      	muls	r0, r1
c0de04ac:	2164      	movs	r1, #100	@ 0x64
c0de04ae:	fb90 f0f1 	sdiv	r0, r0, r1
c0de04b2:	4438      	add	r0, r7
c0de04b4:	3001      	adds	r0, #1
c0de04b6:	283f      	cmp	r0, #63	@ 0x3f
c0de04b8:	dc56      	bgt.n	c0de0568 <get_address+0xec>
c0de04ba:	46ea      	mov	sl, sp
c0de04bc:	2140      	movs	r1, #64	@ 0x40
c0de04be:	4650      	mov	r0, sl
c0de04c0:	f001 fe48 	bl	c0de2154 <__aeabi_memclr>
c0de04c4:	2000      	movs	r0, #0
c0de04c6:	2131      	movs	r1, #49	@ 0x31
c0de04c8:	4287      	cmp	r7, r0
c0de04ca:	d003      	beq.n	c0de04d4 <get_address+0x58>
c0de04cc:	f80a 1000 	strb.w	r1, [sl, r0]
c0de04d0:	3001      	adds	r0, #1
c0de04d2:	e7f9      	b.n	c0de04c8 <get_address+0x4c>
c0de04d4:	eb0a 0107 	add.w	r1, sl, r7
c0de04d8:	2000      	movs	r0, #0
c0de04da:	223a      	movs	r2, #58	@ 0x3a
c0de04dc:	463b      	mov	r3, r7
c0de04de:	2b20      	cmp	r3, #32
c0de04e0:	d016      	beq.n	c0de0510 <get_address+0x94>
c0de04e2:	f81b 4003 	ldrb.w	r4, [fp, r3]
c0de04e6:	2600      	movs	r6, #0
c0de04e8:	4286      	cmp	r6, r0
c0de04ea:	db00      	blt.n	c0de04ee <get_address+0x72>
c0de04ec:	b174      	cbz	r4, c0de050c <get_address+0x90>
c0de04ee:	5d8d      	ldrb	r5, [r1, r6]
c0de04f0:	eb04 2505 	add.w	r5, r4, r5, lsl #8
c0de04f4:	b2ac      	uxth	r4, r5
c0de04f6:	fbb4 f4f2 	udiv	r4, r4, r2
c0de04fa:	fb04 5512 	mls	r5, r4, r2, r5
c0de04fe:	558d      	strb	r5, [r1, r6]
c0de0500:	1c75      	adds	r5, r6, #1
c0de0502:	4286      	cmp	r6, r0
c0de0504:	bfa8      	it	ge
c0de0506:	4628      	movge	r0, r5
c0de0508:	462e      	mov	r6, r5
c0de050a:	e7ed      	b.n	c0de04e8 <get_address+0x6c>
c0de050c:	3301      	adds	r3, #1
c0de050e:	e7e6      	b.n	c0de04de <get_address+0x62>
c0de0510:	4c1f      	ldr	r4, [pc, #124]	@ (c0de0590 <get_address+0x114>)
c0de0512:	1e42      	subs	r2, r0, #1
c0de0514:	2300      	movs	r3, #0
c0de0516:	447c      	add	r4, pc
c0de0518:	4283      	cmp	r3, r0
c0de051a:	da05      	bge.n	c0de0528 <get_address+0xac>
c0de051c:	5c8d      	ldrb	r5, [r1, r2]
c0de051e:	3a01      	subs	r2, #1
c0de0520:	5d65      	ldrb	r5, [r4, r5]
c0de0522:	54cd      	strb	r5, [r1, r3]
c0de0524:	3301      	adds	r3, #1
c0de0526:	e7f7      	b.n	c0de0518 <get_address+0x9c>
c0de0528:	19c0      	adds	r0, r0, r7
c0de052a:	f04f 0100 	mov.w	r1, #0
c0de052e:	f80a 1000 	strb.w	r1, [sl, r0]
c0de0532:	d419      	bmi.n	c0de0568 <get_address+0xec>
c0de0534:	4668      	mov	r0, sp
c0de0536:	f001 fe3b 	bl	c0de21b0 <strlen>
c0de053a:	4602      	mov	r2, r0
c0de053c:	2074      	movs	r0, #116	@ 0x74
c0de053e:	f888 0002 	strb.w	r0, [r8, #2]
c0de0542:	2063      	movs	r0, #99	@ 0x63
c0de0544:	f888 0001 	strb.w	r0, [r8, #1]
c0de0548:	206f      	movs	r0, #111	@ 0x6f
c0de054a:	2a2b      	cmp	r2, #43	@ 0x2b
c0de054c:	f888 0000 	strb.w	r0, [r8]
c0de0550:	dc0f      	bgt.n	c0de0572 <get_address+0xf6>
c0de0552:	f108 0103 	add.w	r1, r8, #3
c0de0556:	f1c2 002c 	rsb	r0, r2, #44	@ 0x2c
c0de055a:	2300      	movs	r3, #0
c0de055c:	2431      	movs	r4, #49	@ 0x31
c0de055e:	4283      	cmp	r3, r0
c0de0560:	da0c      	bge.n	c0de057c <get_address+0x100>
c0de0562:	54cc      	strb	r4, [r1, r3]
c0de0564:	3301      	adds	r3, #1
c0de0566:	e7fa      	b.n	c0de055e <get_address+0xe2>
c0de0568:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de056c:	b018      	add	sp, #96	@ 0x60
c0de056e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0572:	f108 0003 	add.w	r0, r8, #3
c0de0576:	4669      	mov	r1, sp
c0de0578:	222c      	movs	r2, #44	@ 0x2c
c0de057a:	e002      	b.n	c0de0582 <get_address+0x106>
c0de057c:	4440      	add	r0, r8
c0de057e:	4669      	mov	r1, sp
c0de0580:	3003      	adds	r0, #3
c0de0582:	f001 fddf 	bl	c0de2144 <__aeabi_memcpy>
c0de0586:	2000      	movs	r0, #0
c0de0588:	f888 002f 	strb.w	r0, [r8, #47]	@ 0x2f
c0de058c:	e7ee      	b.n	c0de056c <get_address+0xf0>
c0de058e:	bf00      	nop
c0de0590:	00001caa 	.word	0x00001caa

c0de0594 <os_derive_bip32_with_seed_no_throw>:
c0de0594:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0598:	b090      	sub	sp, #64	@ 0x40
c0de059a:	f10d 0810 	add.w	r8, sp, #16
c0de059e:	4607      	mov	r7, r0
c0de05a0:	4615      	mov	r5, r2
c0de05a2:	460e      	mov	r6, r1
c0de05a4:	4640      	mov	r0, r8
c0de05a6:	f001 fdf5 	bl	c0de2194 <setjmp>
c0de05aa:	b284      	uxth	r4, r0
c0de05ac:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0de05b0:	b154      	cbz	r4, c0de05c8 <os_derive_bip32_with_seed_no_throw+0x34>
c0de05b2:	2000      	movs	r0, #0
c0de05b4:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0de05b8:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de05ba:	f001 fd79 	bl	c0de20b0 <try_context_set>
c0de05be:	2140      	movs	r1, #64	@ 0x40
c0de05c0:	4628      	mov	r0, r5
c0de05c2:	f001 fdcb 	bl	c0de215c <explicit_bzero>
c0de05c6:	e00f      	b.n	c0de05e8 <os_derive_bip32_with_seed_no_throw+0x54>
c0de05c8:	a804      	add	r0, sp, #16
c0de05ca:	f001 fd71 	bl	c0de20b0 <try_context_set>
c0de05ce:	900e      	str	r0, [sp, #56]	@ 0x38
c0de05d0:	2000      	movs	r0, #0
c0de05d2:	4669      	mov	r1, sp
c0de05d4:	463a      	mov	r2, r7
c0de05d6:	4633      	mov	r3, r6
c0de05d8:	e9c1 5000 	strd	r5, r0, [r1]
c0de05dc:	e9c1 0002 	strd	r0, r0, [r1, #8]
c0de05e0:	2001      	movs	r0, #1
c0de05e2:	2171      	movs	r1, #113	@ 0x71
c0de05e4:	f001 fcd2 	bl	c0de1f8c <os_perso_derive_node_with_seed_key>
c0de05e8:	f001 fd5a 	bl	c0de20a0 <try_context_get>
c0de05ec:	4540      	cmp	r0, r8
c0de05ee:	d102      	bne.n	c0de05f6 <os_derive_bip32_with_seed_no_throw+0x62>
c0de05f0:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de05f2:	f001 fd5d 	bl	c0de20b0 <try_context_set>
c0de05f6:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0de05fa:	b918      	cbnz	r0, c0de0604 <os_derive_bip32_with_seed_no_throw+0x70>
c0de05fc:	4620      	mov	r0, r4
c0de05fe:	b010      	add	sp, #64	@ 0x40
c0de0600:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0604:	f001 fc85 	bl	c0de1f12 <os_longjmp>

c0de0608 <sha256_hash>:
c0de0608:	b570      	push	{r4, r5, r6, lr}
c0de060a:	b09e      	sub	sp, #120	@ 0x78
c0de060c:	4605      	mov	r5, r0
c0de060e:	a803      	add	r0, sp, #12
c0de0610:	4616      	mov	r6, r2
c0de0612:	460c      	mov	r4, r1
c0de0614:	f001 fc6c 	bl	c0de1ef0 <cx_sha256_init_no_throw>
c0de0618:	b110      	cbz	r0, c0de0620 <sha256_hash+0x18>
c0de061a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de061e:	e00c      	b.n	c0de063a <sha256_hash+0x32>
c0de0620:	2020      	movs	r0, #32
c0de0622:	2101      	movs	r1, #1
c0de0624:	462a      	mov	r2, r5
c0de0626:	4623      	mov	r3, r4
c0de0628:	e9cd 6000 	strd	r6, r0, [sp]
c0de062c:	a803      	add	r0, sp, #12
c0de062e:	f001 fc5a 	bl	c0de1ee6 <cx_hash_no_throw>
c0de0632:	2800      	cmp	r0, #0
c0de0634:	bf18      	it	ne
c0de0636:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
c0de063a:	b01e      	add	sp, #120	@ 0x78
c0de063c:	bd70      	pop	{r4, r5, r6, pc}

c0de063e <OUTLINED_FUNCTION_0>:
c0de063e:	00a0      	lsls	r0, r4, #2
c0de0640:	3001      	adds	r0, #1
c0de0642:	b281      	uxth	r1, r0
c0de0644:	4640      	mov	r0, r8
c0de0646:	f7ff bee3 	b.w	c0de0410 <read_u32_be>

c0de064a <os_io_handle_default_apdu>:
c0de064a:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de064c:	b09d      	sub	sp, #116	@ 0x74
c0de064e:	4615      	mov	r5, r2
c0de0650:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de0652:	b3c8      	cbz	r0, c0de06c8 <os_io_handle_default_apdu+0x7e>
c0de0654:	b3c1      	cbz	r1, c0de06c8 <os_io_handle_default_apdu+0x7e>
c0de0656:	b3bd      	cbz	r5, c0de06c8 <os_io_handle_default_apdu+0x7e>
c0de0658:	461c      	mov	r4, r3
c0de065a:	b3ab      	cbz	r3, c0de06c8 <os_io_handle_default_apdu+0x7e>
c0de065c:	b10a      	cbz	r2, c0de0662 <os_io_handle_default_apdu+0x18>
c0de065e:	2100      	movs	r1, #0
c0de0660:	7011      	strb	r1, [r2, #0]
c0de0662:	7801      	ldrb	r1, [r0, #0]
c0de0664:	29b0      	cmp	r1, #176	@ 0xb0
c0de0666:	d131      	bne.n	c0de06cc <os_io_handle_default_apdu+0x82>
c0de0668:	7841      	ldrb	r1, [r0, #1]
c0de066a:	29a7      	cmp	r1, #167	@ 0xa7
c0de066c:	d031      	beq.n	c0de06d2 <os_io_handle_default_apdu+0x88>
c0de066e:	2906      	cmp	r1, #6
c0de0670:	d036      	beq.n	c0de06e0 <os_io_handle_default_apdu+0x96>
c0de0672:	2901      	cmp	r1, #1
c0de0674:	d131      	bne.n	c0de06da <os_io_handle_default_apdu+0x90>
c0de0676:	7881      	ldrb	r1, [r0, #2]
c0de0678:	bb79      	cbnz	r1, c0de06da <os_io_handle_default_apdu+0x90>
c0de067a:	78c0      	ldrb	r0, [r0, #3]
c0de067c:	bb68      	cbnz	r0, c0de06da <os_io_handle_default_apdu+0x90>
c0de067e:	6820      	ldr	r0, [r4, #0]
c0de0680:	2100      	movs	r1, #0
c0de0682:	6021      	str	r1, [r4, #0]
c0de0684:	2803      	cmp	r0, #3
c0de0686:	d321      	bcc.n	c0de06cc <os_io_handle_default_apdu+0x82>
c0de0688:	2601      	movs	r6, #1
c0de068a:	1ec7      	subs	r7, r0, #3
c0de068c:	6026      	str	r6, [r4, #0]
c0de068e:	702e      	strb	r6, [r5, #0]
c0de0690:	6820      	ldr	r0, [r4, #0]
c0de0692:	1a3a      	subs	r2, r7, r0
c0de0694:	4428      	add	r0, r5
c0de0696:	1c41      	adds	r1, r0, #1
c0de0698:	2001      	movs	r0, #1
c0de069a:	f001 fcbf 	bl	c0de201c <os_registry_get_current_app_tag>
c0de069e:	f000 f83f 	bl	c0de0720 <OUTLINED_FUNCTION_0>
c0de06a2:	6020      	str	r0, [r4, #0]
c0de06a4:	1a3a      	subs	r2, r7, r0
c0de06a6:	4428      	add	r0, r5
c0de06a8:	1c41      	adds	r1, r0, #1
c0de06aa:	2002      	movs	r0, #2
c0de06ac:	f001 fcb6 	bl	c0de201c <os_registry_get_current_app_tag>
c0de06b0:	f000 f836 	bl	c0de0720 <OUTLINED_FUNCTION_0>
c0de06b4:	1c41      	adds	r1, r0, #1
c0de06b6:	6021      	str	r1, [r4, #0]
c0de06b8:	542e      	strb	r6, [r5, r0]
c0de06ba:	f001 fca7 	bl	c0de200c <os_flags>
c0de06be:	6821      	ldr	r1, [r4, #0]
c0de06c0:	1c4a      	adds	r2, r1, #1
c0de06c2:	6022      	str	r2, [r4, #0]
c0de06c4:	5468      	strb	r0, [r5, r1]
c0de06c6:	e028      	b.n	c0de071a <os_io_handle_default_apdu+0xd0>
c0de06c8:	7814      	ldrb	r4, [r2, #0]
c0de06ca:	e01e      	b.n	c0de070a <os_io_handle_default_apdu+0xc0>
c0de06cc:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de06d0:	e01b      	b.n	c0de070a <os_io_handle_default_apdu+0xc0>
c0de06d2:	7881      	ldrb	r1, [r0, #2]
c0de06d4:	b909      	cbnz	r1, c0de06da <os_io_handle_default_apdu+0x90>
c0de06d6:	78c0      	ldrb	r0, [r0, #3]
c0de06d8:	b1d0      	cbz	r0, c0de0710 <os_io_handle_default_apdu+0xc6>
c0de06da:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de06de:	e014      	b.n	c0de070a <os_io_handle_default_apdu+0xc0>
c0de06e0:	2100      	movs	r1, #0
c0de06e2:	6021      	str	r1, [r4, #0]
c0de06e4:	7883      	ldrb	r3, [r0, #2]
c0de06e6:	7902      	ldrb	r2, [r0, #4]
c0de06e8:	ad02      	add	r5, sp, #8
c0de06ea:	e9cd 1500 	strd	r1, r5, [sp]
c0de06ee:	1d41      	adds	r1, r0, #5
c0de06f0:	4618      	mov	r0, r3
c0de06f2:	2300      	movs	r3, #0
c0de06f4:	f001 fc5e 	bl	c0de1fb4 <os_pki_load_certificate>
c0de06f8:	4604      	mov	r4, r0
c0de06fa:	4628      	mov	r0, r5
c0de06fc:	216c      	movs	r1, #108	@ 0x6c
c0de06fe:	f001 fd2d 	bl	c0de215c <explicit_bzero>
c0de0702:	2c00      	cmp	r4, #0
c0de0704:	bf08      	it	eq
c0de0706:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de070a:	4620      	mov	r0, r4
c0de070c:	b01d      	add	sp, #116	@ 0x74
c0de070e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0710:	2000      	movs	r0, #0
c0de0712:	6020      	str	r0, [r4, #0]
c0de0714:	b10a      	cbz	r2, c0de071a <os_io_handle_default_apdu+0xd0>
c0de0716:	2001      	movs	r0, #1
c0de0718:	7010      	strb	r0, [r2, #0]
c0de071a:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de071e:	e7f4      	b.n	c0de070a <os_io_handle_default_apdu+0xc0>

c0de0720 <OUTLINED_FUNCTION_0>:
c0de0720:	6821      	ldr	r1, [r4, #0]
c0de0722:	1c4a      	adds	r2, r1, #1
c0de0724:	6022      	str	r2, [r4, #0]
c0de0726:	5468      	strb	r0, [r5, r1]
c0de0728:	6821      	ldr	r1, [r4, #0]
c0de072a:	4408      	add	r0, r1
c0de072c:	4770      	bx	lr
c0de072e:	d4d4      	bmi.n	c0de06da <os_io_handle_default_apdu+0x90>

c0de0730 <io_seph_ux_init_button>:
c0de0730:	4803      	ldr	r0, [pc, #12]	@ (c0de0740 <io_seph_ux_init_button+0x10>)
c0de0732:	2100      	movs	r1, #0
c0de0734:	f849 1000 	str.w	r1, [r9, r0]
c0de0738:	4448      	add	r0, r9
c0de073a:	6041      	str	r1, [r0, #4]
c0de073c:	4770      	bx	lr
c0de073e:	bf00      	nop
c0de0740:	000002a4 	.word	0x000002a4

c0de0744 <io_process_itc_ux_event>:
c0de0744:	b580      	push	{r7, lr}
c0de0746:	78c0      	ldrb	r0, [r0, #3]
c0de0748:	2820      	cmp	r0, #32
c0de074a:	d102      	bne.n	c0de0752 <io_process_itc_ux_event+0xe>
c0de074c:	f001 fb10 	bl	c0de1d70 <ux_stack_redisplay>
c0de0750:	2100      	movs	r1, #0
c0de0752:	4608      	mov	r0, r1
c0de0754:	bd80      	pop	{r7, pc}

c0de0756 <io_seph_ux_display_bagl_element>:
c0de0756:	b570      	push	{r4, r5, r6, lr}
c0de0758:	b088      	sub	sp, #32
c0de075a:	f001 fbe1 	bl	c0de1f20 <pic>
c0de075e:	4604      	mov	r4, r0
c0de0760:	69c0      	ldr	r0, [r0, #28]
c0de0762:	7821      	ldrb	r1, [r4, #0]
c0de0764:	f001 067f 	and.w	r6, r1, #127	@ 0x7f
c0de0768:	f001 fbda 	bl	c0de1f20 <pic>
c0de076c:	b37e      	cbz	r6, c0de07ce <io_seph_ux_display_bagl_element+0x78>
c0de076e:	4605      	mov	r5, r0
c0de0770:	b150      	cbz	r0, c0de0788 <io_seph_ux_display_bagl_element+0x32>
c0de0772:	2e05      	cmp	r6, #5
c0de0774:	d101      	bne.n	c0de077a <io_seph_ux_display_bagl_element+0x24>
c0de0776:	7ea0      	ldrb	r0, [r4, #26]
c0de0778:	b178      	cbz	r0, c0de079a <io_seph_ux_display_bagl_element+0x44>
c0de077a:	4628      	mov	r0, r5
c0de077c:	f001 fd18 	bl	c0de21b0 <strlen>
c0de0780:	b282      	uxth	r2, r0
c0de0782:	4620      	mov	r0, r4
c0de0784:	4629      	mov	r1, r5
c0de0786:	e002      	b.n	c0de078e <io_seph_ux_display_bagl_element+0x38>
c0de0788:	4620      	mov	r0, r4
c0de078a:	2100      	movs	r1, #0
c0de078c:	2200      	movs	r2, #0
c0de078e:	2300      	movs	r3, #0
c0de0790:	b008      	add	sp, #32
c0de0792:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0796:	f000 ba11 	b.w	c0de0bbc <bagl_draw_with_context>
c0de079a:	4628      	mov	r0, r5
c0de079c:	f001 fbc0 	bl	c0de1f20 <pic>
c0de07a0:	b1a8      	cbz	r0, c0de07ce <io_seph_ux_display_bagl_element+0x78>
c0de07a2:	4605      	mov	r5, r0
c0de07a4:	6900      	ldr	r0, [r0, #16]
c0de07a6:	b190      	cbz	r0, c0de07ce <io_seph_ux_display_bagl_element+0x78>
c0de07a8:	4620      	mov	r0, r4
c0de07aa:	f001 fbb9 	bl	c0de1f20 <pic>
c0de07ae:	ac01      	add	r4, sp, #4
c0de07b0:	4601      	mov	r1, r0
c0de07b2:	221c      	movs	r2, #28
c0de07b4:	4620      	mov	r0, r4
c0de07b6:	f001 fcc5 	bl	c0de2144 <__aeabi_memcpy>
c0de07ba:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de07be:	f8ad 000a 	strh.w	r0, [sp, #10]
c0de07c2:	f8ad 100c 	strh.w	r1, [sp, #12]
c0de07c6:	4620      	mov	r0, r4
c0de07c8:	4629      	mov	r1, r5
c0de07ca:	f000 ff83 	bl	c0de16d4 <bagl_draw_glyph>
c0de07ce:	b008      	add	sp, #32
c0de07d0:	bd70      	pop	{r4, r5, r6, pc}
c0de07d2:	d4d4      	bmi.n	c0de077e <io_seph_ux_display_bagl_element+0x28>

c0de07d4 <io_seproxyhal_button_push>:
c0de07d4:	b1a0      	cbz	r0, c0de0800 <io_seproxyhal_button_push+0x2c>
c0de07d6:	b570      	push	{r4, r5, r6, lr}
c0de07d8:	4c19      	ldr	r4, [pc, #100]	@ (c0de0840 <io_seproxyhal_button_push+0x6c>)
c0de07da:	4602      	mov	r2, r0
c0de07dc:	460b      	mov	r3, r1
c0de07de:	f859 0004 	ldr.w	r0, [r9, r4]
c0de07e2:	eb09 0104 	add.w	r1, r9, r4
c0de07e6:	6849      	ldr	r1, [r1, #4]
c0de07e8:	4298      	cmp	r0, r3
c0de07ea:	bf02      	ittt	eq
c0de07ec:	eb09 0504 	addeq.w	r5, r9, r4
c0de07f0:	3101      	addeq	r1, #1
c0de07f2:	6069      	streq	r1, [r5, #4]
c0de07f4:	4318      	orrs	r0, r3
c0de07f6:	b123      	cbz	r3, c0de0802 <io_seproxyhal_button_push+0x2e>
c0de07f8:	4605      	mov	r5, r0
c0de07fa:	f849 0004 	str.w	r0, [r9, r4]
c0de07fe:	e008      	b.n	c0de0812 <io_seproxyhal_button_push+0x3e>
c0de0800:	4770      	bx	lr
c0de0802:	2500      	movs	r5, #0
c0de0804:	eb09 0604 	add.w	r6, r9, r4
c0de0808:	f040 4000 	orr.w	r0, r0, #2147483648	@ 0x80000000
c0de080c:	f849 5004 	str.w	r5, [r9, r4]
c0de0810:	6075      	str	r5, [r6, #4]
c0de0812:	429d      	cmp	r5, r3
c0de0814:	bf1e      	ittt	ne
c0de0816:	eb09 0304 	addne.w	r3, r9, r4
c0de081a:	2400      	movne	r4, #0
c0de081c:	605c      	strne	r4, [r3, #4]
c0de081e:	2908      	cmp	r1, #8
c0de0820:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0824:	d30a      	bcc.n	c0de083c <io_seproxyhal_button_push+0x68>
c0de0826:	2303      	movs	r3, #3
c0de0828:	fbb1 f3f3 	udiv	r3, r1, r3
c0de082c:	eb03 0343 	add.w	r3, r3, r3, lsl #1
c0de0830:	1acb      	subs	r3, r1, r3
c0de0832:	bf08      	it	eq
c0de0834:	f040 4080 	orreq.w	r0, r0, #1073741824	@ 0x40000000
c0de0838:	f020 4000 	bic.w	r0, r0, #2147483648	@ 0x80000000
c0de083c:	4710      	bx	r2
c0de083e:	bf00      	nop
c0de0840:	000002a4 	.word	0x000002a4

c0de0844 <io_exchange>:
c0de0844:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0846:	4e1d      	ldr	r6, [pc, #116]	@ (c0de08bc <io_exchange+0x78>)
c0de0848:	4604      	mov	r4, r0
c0de084a:	460d      	mov	r5, r1
c0de084c:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0850:	2801      	cmp	r0, #1
c0de0852:	d104      	bne.n	c0de085e <io_exchange+0x1a>
c0de0854:	f001 fc02 	bl	c0de205c <os_io_start>
c0de0858:	2000      	movs	r0, #0
c0de085a:	f809 0006 	strb.w	r0, [r9, r6]
c0de085e:	0760      	lsls	r0, r4, #29
c0de0860:	d001      	beq.n	c0de0866 <io_exchange+0x22>
c0de0862:	2000      	movs	r0, #0
c0de0864:	e028      	b.n	c0de08b8 <io_exchange+0x74>
c0de0866:	f004 0710 	and.w	r7, r4, #16
c0de086a:	b17d      	cbz	r5, c0de088c <io_exchange+0x48>
c0de086c:	b977      	cbnz	r7, c0de088c <io_exchange+0x48>
c0de086e:	4814      	ldr	r0, [pc, #80]	@ (c0de08c0 <io_exchange+0x7c>)
c0de0870:	4629      	mov	r1, r5
c0de0872:	4448      	add	r0, r9
c0de0874:	f000 f828 	bl	c0de08c8 <io_legacy_apdu_tx>
c0de0878:	4812      	ldr	r0, [pc, #72]	@ (c0de08c4 <io_exchange+0x80>)
c0de087a:	eb09 0100 	add.w	r1, r9, r0
c0de087e:	2000      	movs	r0, #0
c0de0880:	7188      	strb	r0, [r1, #6]
c0de0882:	eb09 0106 	add.w	r1, r9, r6
c0de0886:	7048      	strb	r0, [r1, #1]
c0de0888:	06a1      	lsls	r1, r4, #26
c0de088a:	d415      	bmi.n	c0de08b8 <io_exchange+0x74>
c0de088c:	b937      	cbnz	r7, c0de089c <io_exchange+0x58>
c0de088e:	eb09 0006 	add.w	r0, r9, r6
c0de0892:	2100      	movs	r1, #0
c0de0894:	7041      	strb	r1, [r0, #1]
c0de0896:	480b      	ldr	r0, [pc, #44]	@ (c0de08c4 <io_exchange+0x80>)
c0de0898:	4448      	add	r0, r9
c0de089a:	7181      	strb	r1, [r0, #6]
c0de089c:	4c09      	ldr	r4, [pc, #36]	@ (c0de08c4 <io_exchange+0x80>)
c0de089e:	2000      	movs	r0, #0
c0de08a0:	eb09 0104 	add.w	r1, r9, r4
c0de08a4:	8048      	strh	r0, [r1, #2]
c0de08a6:	2800      	cmp	r0, #0
c0de08a8:	dc03      	bgt.n	c0de08b2 <io_exchange+0x6e>
c0de08aa:	2001      	movs	r0, #1
c0de08ac:	f000 f826 	bl	c0de08fc <io_legacy_apdu_rx>
c0de08b0:	e7f9      	b.n	c0de08a6 <io_exchange+0x62>
c0de08b2:	eb09 0104 	add.w	r1, r9, r4
c0de08b6:	8048      	strh	r0, [r1, #2]
c0de08b8:	b280      	uxth	r0, r0
c0de08ba:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de08bc:	000002b4 	.word	0x000002b4
c0de08c0:	00000080 	.word	0x00000080
c0de08c4:	000002ac 	.word	0x000002ac

c0de08c8 <io_legacy_apdu_tx>:
c0de08c8:	b5b0      	push	{r4, r5, r7, lr}
c0de08ca:	460a      	mov	r2, r1
c0de08cc:	4601      	mov	r1, r0
c0de08ce:	4808      	ldr	r0, [pc, #32]	@ (c0de08f0 <io_legacy_apdu_tx+0x28>)
c0de08d0:	2300      	movs	r3, #0
c0de08d2:	2500      	movs	r5, #0
c0de08d4:	eb09 0400 	add.w	r4, r9, r0
c0de08d8:	7860      	ldrb	r0, [r4, #1]
c0de08da:	f001 fbc9 	bl	c0de2070 <os_io_tx_cmd>
c0de08de:	4905      	ldr	r1, [pc, #20]	@ (c0de08f4 <io_legacy_apdu_tx+0x2c>)
c0de08e0:	7065      	strb	r5, [r4, #1]
c0de08e2:	f809 5001 	strb.w	r5, [r9, r1]
c0de08e6:	4904      	ldr	r1, [pc, #16]	@ (c0de08f8 <io_legacy_apdu_tx+0x30>)
c0de08e8:	4449      	add	r1, r9
c0de08ea:	718d      	strb	r5, [r1, #6]
c0de08ec:	bdb0      	pop	{r4, r5, r7, pc}
c0de08ee:	bf00      	nop
c0de08f0:	000002b4 	.word	0x000002b4
c0de08f4:	000004e4 	.word	0x000004e4
c0de08f8:	000002ac 	.word	0x000002ac

c0de08fc <io_legacy_apdu_rx>:
c0de08fc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de0900:	4e93      	ldr	r6, [pc, #588]	@ (c0de0b50 <io_legacy_apdu_rx+0x254>)
c0de0902:	2100      	movs	r1, #0
c0de0904:	4605      	mov	r5, r0
c0de0906:	2200      	movs	r2, #0
c0de0908:	2301      	movs	r3, #1
c0de090a:	f88d 100f 	strb.w	r1, [sp, #15]
c0de090e:	f240 1111 	movw	r1, #273	@ 0x111
c0de0912:	eb09 0006 	add.w	r0, r9, r6
c0de0916:	f001 fbb7 	bl	c0de2088 <os_io_rx_evt>
c0de091a:	4604      	mov	r4, r0
c0de091c:	2801      	cmp	r0, #1
c0de091e:	f2c0 80aa 	blt.w	c0de0a76 <io_legacy_apdu_rx+0x17a>
c0de0922:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0926:	f1a0 0110 	sub.w	r1, r0, #16
c0de092a:	2916      	cmp	r1, #22
c0de092c:	d805      	bhi.n	c0de093a <io_legacy_apdu_rx+0x3e>
c0de092e:	2201      	movs	r2, #1
c0de0930:	fa02 f101 	lsl.w	r1, r2, r1
c0de0934:	4a87      	ldr	r2, [pc, #540]	@ (c0de0b54 <io_legacy_apdu_rx+0x258>)
c0de0936:	4211      	tst	r1, r2
c0de0938:	d107      	bne.n	c0de094a <io_legacy_apdu_rx+0x4e>
c0de093a:	1e41      	subs	r1, r0, #1
c0de093c:	2902      	cmp	r1, #2
c0de093e:	d37e      	bcc.n	c0de0a3e <io_legacy_apdu_rx+0x142>
c0de0940:	2830      	cmp	r0, #48	@ 0x30
c0de0942:	bf18      	it	ne
c0de0944:	2840      	cmpne	r0, #64	@ 0x40
c0de0946:	f040 808e 	bne.w	c0de0a66 <io_legacy_apdu_rx+0x16a>
c0de094a:	4f84      	ldr	r7, [pc, #528]	@ (c0de0b5c <io_legacy_apdu_rx+0x260>)
c0de094c:	eb09 0107 	add.w	r1, r9, r7
c0de0950:	7048      	strb	r0, [r1, #1]
c0de0952:	f001 fb3f 	bl	c0de1fd4 <os_perso_is_pin_set>
c0de0956:	28aa      	cmp	r0, #170	@ 0xaa
c0de0958:	d103      	bne.n	c0de0962 <io_legacy_apdu_rx+0x66>
c0de095a:	f001 fb44 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de095e:	28aa      	cmp	r0, #170	@ 0xaa
c0de0960:	d15b      	bne.n	c0de0a1a <io_legacy_apdu_rx+0x11e>
c0de0962:	eb09 0006 	add.w	r0, r9, r6
c0de0966:	7840      	ldrb	r0, [r0, #1]
c0de0968:	28b0      	cmp	r0, #176	@ 0xb0
c0de096a:	d12d      	bne.n	c0de09c8 <io_legacy_apdu_rx+0xcc>
c0de096c:	f240 1011 	movw	r0, #273	@ 0x111
c0de0970:	1e61      	subs	r1, r4, #1
c0de0972:	9002      	str	r0, [sp, #8]
c0de0974:	f10d 000f 	add.w	r0, sp, #15
c0de0978:	9000      	str	r0, [sp, #0]
c0de097a:	4877      	ldr	r0, [pc, #476]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de097c:	ab02      	add	r3, sp, #8
c0de097e:	eb09 0500 	add.w	r5, r9, r0
c0de0982:	eb09 0006 	add.w	r0, r9, r6
c0de0986:	3001      	adds	r0, #1
c0de0988:	462a      	mov	r2, r5
c0de098a:	f7ff fe5e 	bl	c0de064a <os_io_handle_default_apdu>
c0de098e:	2400      	movs	r4, #0
c0de0990:	9902      	ldr	r1, [sp, #8]
c0de0992:	eb09 0607 	add.w	r6, r9, r7
c0de0996:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de099a:	bf18      	it	ne
c0de099c:	4621      	movne	r1, r4
c0de099e:	0a02      	lsrs	r2, r0, #8
c0de09a0:	2300      	movs	r3, #0
c0de09a2:	546a      	strb	r2, [r5, r1]
c0de09a4:	186a      	adds	r2, r5, r1
c0de09a6:	7050      	strb	r0, [r2, #1]
c0de09a8:	1c88      	adds	r0, r1, #2
c0de09aa:	4629      	mov	r1, r5
c0de09ac:	9002      	str	r0, [sp, #8]
c0de09ae:	b282      	uxth	r2, r0
c0de09b0:	7870      	ldrb	r0, [r6, #1]
c0de09b2:	f001 fb5d 	bl	c0de2070 <os_io_tx_cmd>
c0de09b6:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de09ba:	7074      	strb	r4, [r6, #1]
c0de09bc:	2901      	cmp	r1, #1
c0de09be:	f000 80c4 	beq.w	c0de0b4a <io_legacy_apdu_rx+0x24e>
c0de09c2:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de09c6:	e057      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de09c8:	eb09 0007 	add.w	r0, r9, r7
c0de09cc:	7847      	ldrb	r7, [r0, #1]
c0de09ce:	2f10      	cmp	r7, #16
c0de09d0:	d070      	beq.n	c0de0ab4 <io_legacy_apdu_rx+0x1b8>
c0de09d2:	2f40      	cmp	r7, #64	@ 0x40
c0de09d4:	d070      	beq.n	c0de0ab8 <io_legacy_apdu_rx+0x1bc>
c0de09d6:	2f21      	cmp	r7, #33	@ 0x21
c0de09d8:	f000 8082 	beq.w	c0de0ae0 <io_legacy_apdu_rx+0x1e4>
c0de09dc:	2f22      	cmp	r7, #34	@ 0x22
c0de09de:	d056      	beq.n	c0de0a8e <io_legacy_apdu_rx+0x192>
c0de09e0:	2f23      	cmp	r7, #35	@ 0x23
c0de09e2:	d056      	beq.n	c0de0a92 <io_legacy_apdu_rx+0x196>
c0de09e4:	2f30      	cmp	r7, #48	@ 0x30
c0de09e6:	d063      	beq.n	c0de0ab0 <io_legacy_apdu_rx+0x1b4>
c0de09e8:	f8df 8174 	ldr.w	r8, [pc, #372]	@ c0de0b60 <io_legacy_apdu_rx+0x264>
c0de09ec:	2f20      	cmp	r7, #32
c0de09ee:	eb09 0008 	add.w	r0, r9, r8
c0de09f2:	f040 8081 	bne.w	c0de0af8 <io_legacy_apdu_rx+0x1fc>
c0de09f6:	2701      	movs	r7, #1
c0de09f8:	eb09 0106 	add.w	r1, r9, r6
c0de09fc:	1e65      	subs	r5, r4, #1
c0de09fe:	7187      	strb	r7, [r0, #6]
c0de0a00:	4855      	ldr	r0, [pc, #340]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0a02:	3101      	adds	r1, #1
c0de0a04:	462a      	mov	r2, r5
c0de0a06:	4448      	add	r0, r9
c0de0a08:	f001 fb9c 	bl	c0de2144 <__aeabi_memcpy>
c0de0a0c:	4855      	ldr	r0, [pc, #340]	@ (c0de0b64 <io_legacy_apdu_rx+0x268>)
c0de0a0e:	f809 7000 	strb.w	r7, [r9, r0]
c0de0a12:	2008      	movs	r0, #8
c0de0a14:	f809 0008 	strb.w	r0, [r9, r8]
c0de0a18:	e02e      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0a1a:	484f      	ldr	r0, [pc, #316]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0a1c:	2155      	movs	r1, #85	@ 0x55
c0de0a1e:	2202      	movs	r2, #2
c0de0a20:	2300      	movs	r3, #0
c0de0a22:	f809 1000 	strb.w	r1, [r9, r0]
c0de0a26:	eb09 0100 	add.w	r1, r9, r0
c0de0a2a:	2015      	movs	r0, #21
c0de0a2c:	7048      	strb	r0, [r1, #1]
c0de0a2e:	eb09 0007 	add.w	r0, r9, r7
c0de0a32:	7840      	ldrb	r0, [r0, #1]
c0de0a34:	b004      	add	sp, #16
c0de0a36:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a3a:	f001 bb19 	b.w	c0de2070 <os_io_tx_cmd>
c0de0a3e:	4f4a      	ldr	r7, [pc, #296]	@ (c0de0b68 <io_legacy_apdu_rx+0x26c>)
c0de0a40:	444e      	add	r6, r9
c0de0a42:	3c01      	subs	r4, #1
c0de0a44:	1c71      	adds	r1, r6, #1
c0de0a46:	4622      	mov	r2, r4
c0de0a48:	eb09 0007 	add.w	r0, r9, r7
c0de0a4c:	f001 fb7a 	bl	c0de2144 <__aeabi_memcpy>
c0de0a50:	7870      	ldrb	r0, [r6, #1]
c0de0a52:	281a      	cmp	r0, #26
c0de0a54:	d114      	bne.n	c0de0a80 <io_legacy_apdu_rx+0x184>
c0de0a56:	eb09 0007 	add.w	r0, r9, r7
c0de0a5a:	4621      	mov	r1, r4
c0de0a5c:	b004      	add	sp, #16
c0de0a5e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a62:	f7ff be6f 	b.w	c0de0744 <io_process_itc_ux_event>
c0de0a66:	2842      	cmp	r0, #66	@ 0x42
c0de0a68:	d165      	bne.n	c0de0b36 <io_legacy_apdu_rx+0x23a>
c0de0a6a:	483b      	ldr	r0, [pc, #236]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0a6c:	eb09 0106 	add.w	r1, r9, r6
c0de0a70:	4622      	mov	r2, r4
c0de0a72:	f000 f89e 	bl	c0de0bb2 <OUTLINED_FUNCTION_0>
c0de0a76:	4625      	mov	r5, r4
c0de0a78:	4628      	mov	r0, r5
c0de0a7a:	b004      	add	sp, #16
c0de0a7c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0a80:	2d00      	cmp	r5, #0
c0de0a82:	d04e      	beq.n	c0de0b22 <io_legacy_apdu_rx+0x226>
c0de0a84:	2000      	movs	r0, #0
c0de0a86:	2500      	movs	r5, #0
c0de0a88:	f000 fe86 	bl	c0de1798 <io_event>
c0de0a8c:	e7f4      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0a8e:	2004      	movs	r0, #4
c0de0a90:	e027      	b.n	c0de0ae2 <io_legacy_apdu_rx+0x1e6>
c0de0a92:	4f33      	ldr	r7, [pc, #204]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0a94:	2107      	movs	r1, #7
c0de0a96:	1e65      	subs	r5, r4, #1
c0de0a98:	462a      	mov	r2, r5
c0de0a9a:	eb09 0007 	add.w	r0, r9, r7
c0de0a9e:	7181      	strb	r1, [r0, #6]
c0de0aa0:	482d      	ldr	r0, [pc, #180]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0aa2:	eb09 0106 	add.w	r1, r9, r6
c0de0aa6:	f000 f884 	bl	c0de0bb2 <OUTLINED_FUNCTION_0>
c0de0aaa:	482e      	ldr	r0, [pc, #184]	@ (c0de0b64 <io_legacy_apdu_rx+0x268>)
c0de0aac:	2101      	movs	r1, #1
c0de0aae:	e011      	b.n	c0de0ad4 <io_legacy_apdu_rx+0x1d8>
c0de0ab0:	2002      	movs	r0, #2
c0de0ab2:	e016      	b.n	c0de0ae2 <io_legacy_apdu_rx+0x1e6>
c0de0ab4:	2006      	movs	r0, #6
c0de0ab6:	e014      	b.n	c0de0ae2 <io_legacy_apdu_rx+0x1e6>
c0de0ab8:	4f29      	ldr	r7, [pc, #164]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0aba:	2103      	movs	r1, #3
c0de0abc:	1e65      	subs	r5, r4, #1
c0de0abe:	462a      	mov	r2, r5
c0de0ac0:	eb09 0007 	add.w	r0, r9, r7
c0de0ac4:	7181      	strb	r1, [r0, #6]
c0de0ac6:	4824      	ldr	r0, [pc, #144]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0ac8:	eb09 0106 	add.w	r1, r9, r6
c0de0acc:	f000 f871 	bl	c0de0bb2 <OUTLINED_FUNCTION_0>
c0de0ad0:	4824      	ldr	r0, [pc, #144]	@ (c0de0b64 <io_legacy_apdu_rx+0x268>)
c0de0ad2:	2102      	movs	r1, #2
c0de0ad4:	f809 1000 	strb.w	r1, [r9, r0]
c0de0ad8:	200a      	movs	r0, #10
c0de0ada:	f809 0007 	strb.w	r0, [r9, r7]
c0de0ade:	e7cb      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0ae0:	2005      	movs	r0, #5
c0de0ae2:	491f      	ldr	r1, [pc, #124]	@ (c0de0b60 <io_legacy_apdu_rx+0x264>)
c0de0ae4:	1e65      	subs	r5, r4, #1
c0de0ae6:	462a      	mov	r2, r5
c0de0ae8:	4449      	add	r1, r9
c0de0aea:	7188      	strb	r0, [r1, #6]
c0de0aec:	481a      	ldr	r0, [pc, #104]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0aee:	eb09 0106 	add.w	r1, r9, r6
c0de0af2:	f000 f85e 	bl	c0de0bb2 <OUTLINED_FUNCTION_0>
c0de0af6:	e7bf      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0af8:	2100      	movs	r1, #0
c0de0afa:	1e65      	subs	r5, r4, #1
c0de0afc:	7181      	strb	r1, [r0, #6]
c0de0afe:	4816      	ldr	r0, [pc, #88]	@ (c0de0b58 <io_legacy_apdu_rx+0x25c>)
c0de0b00:	eb09 0106 	add.w	r1, r9, r6
c0de0b04:	462a      	mov	r2, r5
c0de0b06:	f000 f854 	bl	c0de0bb2 <OUTLINED_FUNCTION_0>
c0de0b0a:	2f25      	cmp	r7, #37	@ 0x25
c0de0b0c:	d015      	beq.n	c0de0b3a <io_legacy_apdu_rx+0x23e>
c0de0b0e:	2f24      	cmp	r7, #36	@ 0x24
c0de0b10:	d1b2      	bne.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0b12:	200b      	movs	r0, #11
c0de0b14:	2101      	movs	r1, #1
c0de0b16:	f809 0008 	strb.w	r0, [r9, r8]
c0de0b1a:	4812      	ldr	r0, [pc, #72]	@ (c0de0b64 <io_legacy_apdu_rx+0x268>)
c0de0b1c:	f809 1000 	strb.w	r1, [r9, r0]
c0de0b20:	e7aa      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0b22:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0b26:	2815      	cmp	r0, #21
c0de0b28:	d8ac      	bhi.n	c0de0a84 <io_legacy_apdu_rx+0x188>
c0de0b2a:	2101      	movs	r1, #1
c0de0b2c:	fa01 f000 	lsl.w	r0, r1, r0
c0de0b30:	490e      	ldr	r1, [pc, #56]	@ (c0de0b6c <io_legacy_apdu_rx+0x270>)
c0de0b32:	4208      	tst	r0, r1
c0de0b34:	d0a6      	beq.n	c0de0a84 <io_legacy_apdu_rx+0x188>
c0de0b36:	2500      	movs	r5, #0
c0de0b38:	e79e      	b.n	c0de0a78 <io_legacy_apdu_rx+0x17c>
c0de0b3a:	200c      	movs	r0, #12
c0de0b3c:	2101      	movs	r1, #1
c0de0b3e:	f809 0008 	strb.w	r0, [r9, r8]
c0de0b42:	4808      	ldr	r0, [pc, #32]	@ (c0de0b64 <io_legacy_apdu_rx+0x268>)
c0de0b44:	f809 1000 	strb.w	r1, [r9, r0]
c0de0b48:	e795      	b.n	c0de0a76 <io_legacy_apdu_rx+0x17a>
c0de0b4a:	20ff      	movs	r0, #255	@ 0xff
c0de0b4c:	f001 fa72 	bl	c0de2034 <os_sched_exit>
c0de0b50:	00000191 	.word	0x00000191
c0de0b54:	007f0001 	.word	0x007f0001
c0de0b58:	00000080 	.word	0x00000080
c0de0b5c:	000002b4 	.word	0x000002b4
c0de0b60:	000002ac 	.word	0x000002ac
c0de0b64:	000004e4 	.word	0x000004e4
c0de0b68:	000002b6 	.word	0x000002b6
c0de0b6c:	00205020 	.word	0x00205020

c0de0b70 <io_seproxyhal_init>:
c0de0b70:	b570      	push	{r4, r5, r6, lr}
c0de0b72:	b08a      	sub	sp, #40	@ 0x28
c0de0b74:	4d0c      	ldr	r5, [pc, #48]	@ (c0de0ba8 <io_seproxyhal_init+0x38>)
c0de0b76:	2600      	movs	r6, #0
c0de0b78:	2118      	movs	r1, #24
c0de0b7a:	eb09 0005 	add.w	r0, r9, r5
c0de0b7e:	7046      	strb	r6, [r0, #1]
c0de0b80:	ac01      	add	r4, sp, #4
c0de0b82:	4620      	mov	r0, r4
c0de0b84:	f001 fae6 	bl	c0de2154 <__aeabi_memclr>
c0de0b88:	4808      	ldr	r0, [pc, #32]	@ (c0de0bac <io_seproxyhal_init+0x3c>)
c0de0b8a:	f8ad 6024 	strh.w	r6, [sp, #36]	@ 0x24
c0de0b8e:	f88d 6022 	strb.w	r6, [sp, #34]	@ 0x22
c0de0b92:	2601      	movs	r6, #1
c0de0b94:	f8ad 6020 	strh.w	r6, [sp, #32]
c0de0b98:	9007      	str	r0, [sp, #28]
c0de0b9a:	4620      	mov	r0, r4
c0de0b9c:	f001 fa54 	bl	c0de2048 <os_io_init>
c0de0ba0:	f809 6005 	strb.w	r6, [r9, r5]
c0de0ba4:	b00a      	add	sp, #40	@ 0x28
c0de0ba6:	bd70      	pop	{r4, r5, r6, pc}
c0de0ba8:	000002b4 	.word	0x000002b4
c0de0bac:	00020015 	.word	0x00020015

c0de0bb0 <USB_power>:
c0de0bb0:	4770      	bx	lr

c0de0bb2 <OUTLINED_FUNCTION_0>:
c0de0bb2:	3101      	adds	r1, #1
c0de0bb4:	4448      	add	r0, r9
c0de0bb6:	f001 bac5 	b.w	c0de2144 <__aeabi_memcpy>
c0de0bba:	d4d4      	bmi.n	c0de0b66 <io_legacy_apdu_rx+0x26a>

c0de0bbc <bagl_draw_with_context>:
c0de0bbc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0bc0:	b090      	sub	sp, #64	@ 0x40
c0de0bc2:	f890 b000 	ldrb.w	fp, [r0]
c0de0bc6:	4604      	mov	r4, r0
c0de0bc8:	910e      	str	r1, [sp, #56]	@ 0x38
c0de0bca:	920d      	str	r2, [sp, #52]	@ 0x34
c0de0bcc:	f00b 087f 	and.w	r8, fp, #127	@ 0x7f
c0de0bd0:	f1b8 0f05 	cmp.w	r8, #5
c0de0bd4:	d076      	beq.n	c0de0cc4 <bagl_draw_with_context+0x108>
c0de0bd6:	8b20      	ldrh	r0, [r4, #24]
c0de0bd8:	461d      	mov	r5, r3
c0de0bda:	4616      	mov	r6, r2
c0de0bdc:	f000 fa74 	bl	c0de10c8 <bagl_get_font>
c0de0be0:	2800      	cmp	r0, #0
c0de0be2:	d06f      	beq.n	c0de0cc4 <bagl_draw_with_context+0x108>
c0de0be4:	f890 c005 	ldrb.w	ip, [r0, #5]
c0de0be8:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de0bea:	8921      	ldrh	r1, [r4, #8]
c0de0bec:	2800      	cmp	r0, #0
c0de0bee:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de0bf0:	f000 81a6 	beq.w	c0de0f40 <bagl_draw_with_context+0x384>
c0de0bf4:	2e00      	cmp	r6, #0
c0de0bf6:	f000 81a3 	beq.w	c0de0f40 <bagl_draw_with_context+0x384>
c0de0bfa:	88e1      	ldrh	r1, [r4, #6]
c0de0bfc:	8b20      	ldrh	r0, [r4, #24]
c0de0bfe:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de0c00:	b2f3      	uxtb	r3, r6
c0de0c02:	f8cd b020 	str.w	fp, [sp, #32]
c0de0c06:	46e3      	mov	fp, ip
c0de0c08:	9500      	str	r5, [sp, #0]
c0de0c0a:	3164      	adds	r1, #100	@ 0x64
c0de0c0c:	b289      	uxth	r1, r1
c0de0c0e:	f000 fa7b 	bl	c0de1108 <bagl_compute_line_width>
c0de0c12:	4607      	mov	r7, r0
c0de0c14:	88e0      	ldrh	r0, [r4, #6]
c0de0c16:	f04f 0a00 	mov.w	sl, #0
c0de0c1a:	2e05      	cmp	r6, #5
c0de0c1c:	f0c0 8218 	bcc.w	c0de1050 <bagl_draw_with_context+0x494>
c0de0c20:	4287      	cmp	r7, r0
c0de0c22:	46dc      	mov	ip, fp
c0de0c24:	f240 8217 	bls.w	c0de1056 <bagl_draw_with_context+0x49a>
c0de0c28:	8b20      	ldrh	r0, [r4, #24]
c0de0c2a:	f8cd c01c 	str.w	ip, [sp, #28]
c0de0c2e:	f8cd 8028 	str.w	r8, [sp, #40]	@ 0x28
c0de0c32:	9500      	str	r5, [sp, #0]
c0de0c34:	2164      	movs	r1, #100	@ 0x64
c0de0c36:	2303      	movs	r3, #3
c0de0c38:	4acb      	ldr	r2, [pc, #812]	@ (c0de0f68 <bagl_draw_with_context+0x3ac>)
c0de0c3a:	447a      	add	r2, pc
c0de0c3c:	f000 fa64 	bl	c0de1108 <bagl_compute_line_width>
c0de0c40:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de0c42:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de0c44:	88e0      	ldrh	r0, [r4, #6]
c0de0c46:	2100      	movs	r1, #0
c0de0c48:	0873      	lsrs	r3, r6, #1
c0de0c4a:	910c      	str	r1, [sp, #48]	@ 0x30
c0de0c4c:	eb02 0c56 	add.w	ip, r2, r6, lsr #1
c0de0c50:	eba2 010c 	sub.w	r1, r2, ip
c0de0c54:	46e2      	mov	sl, ip
c0de0c56:	eb01 0b06 	add.w	fp, r1, r6
c0de0c5a:	4616      	mov	r6, r2
c0de0c5c:	b281      	uxth	r1, r0
c0de0c5e:	428f      	cmp	r7, r1
c0de0c60:	f240 81f1 	bls.w	c0de1046 <bagl_draw_with_context+0x48a>
c0de0c64:	2b00      	cmp	r3, #0
c0de0c66:	f000 81ee 	beq.w	c0de1046 <bagl_draw_with_context+0x48a>
c0de0c6a:	f1bb 0f00 	cmp.w	fp, #0
c0de0c6e:	f000 81ea 	beq.w	c0de1046 <bagl_draw_with_context+0x48a>
c0de0c72:	8b20      	ldrh	r0, [r4, #24]
c0de0c74:	4698      	mov	r8, r3
c0de0c76:	b2db      	uxtb	r3, r3
c0de0c78:	4632      	mov	r2, r6
c0de0c7a:	9500      	str	r5, [sp, #0]
c0de0c7c:	f000 fa44 	bl	c0de1108 <bagl_compute_line_width>
c0de0c80:	4607      	mov	r7, r0
c0de0c82:	88e1      	ldrh	r1, [r4, #6]
c0de0c84:	8b20      	ldrh	r0, [r4, #24]
c0de0c86:	fa5f f38b 	uxtb.w	r3, fp
c0de0c8a:	4652      	mov	r2, sl
c0de0c8c:	9500      	str	r5, [sp, #0]
c0de0c8e:	f000 fa3b 	bl	c0de1108 <bagl_compute_line_width>
c0de0c92:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de0c94:	4643      	mov	r3, r8
c0de0c96:	4439      	add	r1, r7
c0de0c98:	180f      	adds	r7, r1, r0
c0de0c9a:	88e0      	ldrh	r0, [r4, #6]
c0de0c9c:	4287      	cmp	r7, r0
c0de0c9e:	d9dd      	bls.n	c0de0c5c <bagl_draw_with_context+0xa0>
c0de0ca0:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de0ca2:	2a01      	cmp	r2, #1
c0de0ca4:	d004      	beq.n	c0de0cb0 <bagl_draw_with_context+0xf4>
c0de0ca6:	b902      	cbnz	r2, c0de0caa <bagl_draw_with_context+0xee>
c0de0ca8:	3b01      	subs	r3, #1
c0de0caa:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de0cac:	46d4      	mov	ip, sl
c0de0cae:	e003      	b.n	c0de0cb8 <bagl_draw_with_context+0xfc>
c0de0cb0:	46d4      	mov	ip, sl
c0de0cb2:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de0cb4:	f10a 0c01 	add.w	ip, sl, #1
c0de0cb8:	2101      	movs	r1, #1
c0de0cba:	ea21 0202 	bic.w	r2, r1, r2
c0de0cbe:	920c      	str	r2, [sp, #48]	@ 0x30
c0de0cc0:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de0cc2:	e7c5      	b.n	c0de0c50 <bagl_draw_with_context+0x94>
c0de0cc4:	2000      	movs	r0, #0
c0de0cc6:	f04f 0a00 	mov.w	sl, #0
c0de0cca:	f04f 0c00 	mov.w	ip, #0
c0de0cce:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0cd0:	2000      	movs	r0, #0
c0de0cd2:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de0cd4:	2000      	movs	r0, #0
c0de0cd6:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0cd8:	2000      	movs	r0, #0
c0de0cda:	900c      	str	r0, [sp, #48]	@ 0x30
c0de0cdc:	8927      	ldrh	r7, [r4, #8]
c0de0cde:	88e3      	ldrh	r3, [r4, #6]
c0de0ce0:	0879      	lsrs	r1, r7, #1
c0de0ce2:	0858      	lsrs	r0, r3, #1
c0de0ce4:	460a      	mov	r2, r1
c0de0ce6:	ebb0 0f57 	cmp.w	r0, r7, lsr #1
c0de0cea:	bf38      	it	cc
c0de0cec:	085a      	lsrcc	r2, r3, #1
c0de0cee:	7ae6      	ldrb	r6, [r4, #11]
c0de0cf0:	42b2      	cmp	r2, r6
c0de0cf2:	4635      	mov	r5, r6
c0de0cf4:	d803      	bhi.n	c0de0cfe <bagl_draw_with_context+0x142>
c0de0cf6:	4288      	cmp	r0, r1
c0de0cf8:	bf2c      	ite	cs
c0de0cfa:	460d      	movcs	r5, r1
c0de0cfc:	4605      	movcc	r5, r0
c0de0cfe:	f1a8 0001 	sub.w	r0, r8, #1
c0de0d02:	f8cd a03c 	str.w	sl, [sp, #60]	@ 0x3c
c0de0d06:	2804      	cmp	r0, #4
c0de0d08:	d20c      	bcs.n	c0de0d24 <bagl_draw_with_context+0x168>
c0de0d0a:	f1b8 0f04 	cmp.w	r8, #4
c0de0d0e:	d111      	bne.n	c0de0d34 <bagl_draw_with_context+0x178>
c0de0d10:	bb56      	cbnz	r6, c0de0d68 <bagl_draw_with_context+0x1ac>
c0de0d12:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0d16:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d1a:	6920      	ldr	r0, [r4, #16]
c0de0d1c:	9700      	str	r7, [sp, #0]
c0de0d1e:	f001 f9fd 	bl	c0de211c <bagl_hal_draw_rect>
c0de0d22:	e18d      	b.n	c0de1040 <bagl_draw_with_context+0x484>
c0de0d24:	f1b8 0f06 	cmp.w	r8, #6
c0de0d28:	f000 810f 	beq.w	c0de0f4a <bagl_draw_with_context+0x38e>
c0de0d2c:	f1b8 0f07 	cmp.w	r8, #7
c0de0d30:	d0eb      	beq.n	c0de0d0a <bagl_draw_with_context+0x14e>
c0de0d32:	e185      	b.n	c0de1040 <bagl_draw_with_context+0x484>
c0de0d34:	f1b8 0f07 	cmp.w	r8, #7
c0de0d38:	d002      	beq.n	c0de0d40 <bagl_draw_with_context+0x184>
c0de0d3a:	f1b8 0f02 	cmp.w	r8, #2
c0de0d3e:	d113      	bne.n	c0de0d68 <bagl_draw_with_context+0x1ac>
c0de0d40:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de0d42:	f1b8 0f07 	cmp.w	r8, #7
c0de0d46:	bf08      	it	eq
c0de0d48:	4607      	moveq	r7, r0
c0de0d4a:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0d4e:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d52:	46e2      	mov	sl, ip
c0de0d54:	6960      	ldr	r0, [r4, #20]
c0de0d56:	9700      	str	r7, [sp, #0]
c0de0d58:	f1b8 0f07 	cmp.w	r8, #7
c0de0d5c:	bf08      	it	eq
c0de0d5e:	eba2 020c 	subeq.w	r2, r2, ip
c0de0d62:	f001 f9db 	bl	c0de211c <bagl_hal_draw_rect>
c0de0d66:	e0d4      	b.n	c0de0f12 <bagl_draw_with_context+0x356>
c0de0d68:	7b20      	ldrb	r0, [r4, #12]
c0de0d6a:	46e2      	mov	sl, ip
c0de0d6c:	2801      	cmp	r0, #1
c0de0d6e:	d11b      	bne.n	c0de0da8 <bagl_draw_with_context+0x1ec>
c0de0d70:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0d74:	6920      	ldr	r0, [r4, #16]
c0de0d76:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0d7a:	9700      	str	r7, [sp, #0]
c0de0d7c:	eba3 0345 	sub.w	r3, r3, r5, lsl #1
c0de0d80:	4ece      	ldr	r6, [pc, #824]	@ (c0de10bc <bagl_draw_with_context+0x500>)
c0de0d82:	4429      	add	r1, r5
c0de0d84:	447e      	add	r6, pc
c0de0d86:	47b0      	blx	r6
c0de0d88:	f000 fcec 	bl	c0de1764 <OUTLINED_FUNCTION_5>
c0de0d8c:	6920      	ldr	r0, [r4, #16]
c0de0d8e:	9200      	str	r2, [sp, #0]
c0de0d90:	18ea      	adds	r2, r5, r3
c0de0d92:	462b      	mov	r3, r5
c0de0d94:	47b0      	blx	r6
c0de0d96:	f000 fcdc 	bl	c0de1752 <OUTLINED_FUNCTION_4>
c0de0d9a:	6920      	ldr	r0, [r4, #16]
c0de0d9c:	442a      	add	r2, r5
c0de0d9e:	9100      	str	r1, [sp, #0]
c0de0da0:	1b79      	subs	r1, r7, r5
c0de0da2:	4419      	add	r1, r3
c0de0da4:	462b      	mov	r3, r5
c0de0da6:	e054      	b.n	c0de0e52 <bagl_draw_with_context+0x296>
c0de0da8:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0dac:	6960      	ldr	r0, [r4, #20]
c0de0dae:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0db2:	9700      	str	r7, [sp, #0]
c0de0db4:	eba3 0345 	sub.w	r3, r3, r5, lsl #1
c0de0db8:	4ebf      	ldr	r6, [pc, #764]	@ (c0de10b8 <bagl_draw_with_context+0x4fc>)
c0de0dba:	4429      	add	r1, r5
c0de0dbc:	447e      	add	r6, pc
c0de0dbe:	47b0      	blx	r6
c0de0dc0:	f000 fcd0 	bl	c0de1764 <OUTLINED_FUNCTION_5>
c0de0dc4:	6960      	ldr	r0, [r4, #20]
c0de0dc6:	9200      	str	r2, [sp, #0]
c0de0dc8:	18ea      	adds	r2, r5, r3
c0de0dca:	462b      	mov	r3, r5
c0de0dcc:	47b0      	blx	r6
c0de0dce:	f000 fcc0 	bl	c0de1752 <OUTLINED_FUNCTION_4>
c0de0dd2:	6960      	ldr	r0, [r4, #20]
c0de0dd4:	442a      	add	r2, r5
c0de0dd6:	9100      	str	r1, [sp, #0]
c0de0dd8:	43e9      	mvns	r1, r5
c0de0dda:	4439      	add	r1, r7
c0de0ddc:	4419      	add	r1, r3
c0de0dde:	462b      	mov	r3, r5
c0de0de0:	47b0      	blx	r6
c0de0de2:	88e3      	ldrh	r3, [r4, #6]
c0de0de4:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0de8:	6920      	ldr	r0, [r4, #16]
c0de0dea:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0dee:	7aa7      	ldrb	r7, [r4, #10]
c0de0df0:	4429      	add	r1, r5
c0de0df2:	eba3 0345 	sub.w	r3, r3, r5, lsl #1
c0de0df6:	9700      	str	r7, [sp, #0]
c0de0df8:	47b0      	blx	r6
c0de0dfa:	f8b4 c008 	ldrh.w	ip, [r4, #8]
c0de0dfe:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de0e02:	7aa2      	ldrb	r2, [r4, #10]
c0de0e04:	88e3      	ldrh	r3, [r4, #6]
c0de0e06:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e0a:	6920      	ldr	r0, [r4, #16]
c0de0e0c:	9200      	str	r2, [sp, #0]
c0de0e0e:	eb07 020c 	add.w	r2, r7, ip
c0de0e12:	4429      	add	r1, r5
c0de0e14:	eba3 0345 	sub.w	r3, r3, r5, lsl #1
c0de0e18:	3a01      	subs	r2, #1
c0de0e1a:	47b0      	blx	r6
c0de0e1c:	8920      	ldrh	r0, [r4, #8]
c0de0e1e:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de0e22:	7aa3      	ldrb	r3, [r4, #10]
c0de0e24:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e28:	eba0 0245 	sub.w	r2, r0, r5, lsl #1
c0de0e2c:	6920      	ldr	r0, [r4, #16]
c0de0e2e:	9200      	str	r2, [sp, #0]
c0de0e30:	19ea      	adds	r2, r5, r7
c0de0e32:	47b0      	blx	r6
c0de0e34:	8920      	ldrh	r0, [r4, #8]
c0de0e36:	88e7      	ldrh	r7, [r4, #6]
c0de0e38:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de0e3c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0e40:	7aa3      	ldrb	r3, [r4, #10]
c0de0e42:	4439      	add	r1, r7
c0de0e44:	eba0 0c45 	sub.w	ip, r0, r5, lsl #1
c0de0e48:	6920      	ldr	r0, [r4, #16]
c0de0e4a:	442a      	add	r2, r5
c0de0e4c:	f8cd c000 	str.w	ip, [sp]
c0de0e50:	3901      	subs	r1, #1
c0de0e52:	47b0      	blx	r6
c0de0e54:	2d02      	cmp	r5, #2
c0de0e56:	d358      	bcc.n	c0de0f0a <bagl_draw_with_context+0x34e>
c0de0e58:	7b20      	ldrb	r0, [r4, #12]
c0de0e5a:	e9cd ab07 	strd	sl, fp, [sp, #28]
c0de0e5e:	f04f 0b00 	mov.w	fp, #0
c0de0e62:	2801      	cmp	r0, #1
c0de0e64:	d003      	beq.n	c0de0e6e <bagl_draw_with_context+0x2b2>
c0de0e66:	7aa0      	ldrb	r0, [r4, #10]
c0de0e68:	1a28      	subs	r0, r5, r0
c0de0e6a:	bf28      	it	cs
c0de0e6c:	4683      	movcs	fp, r0
c0de0e6e:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0e72:	27c0      	movs	r7, #192	@ 0xc0
c0de0e74:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
c0de0e78:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de0e7c:	e9cd 7b00 	strd	r7, fp, [sp]
c0de0e80:	9102      	str	r1, [sp, #8]
c0de0e82:	18a9      	adds	r1, r5, r2
c0de0e84:	18ea      	adds	r2, r5, r3
c0de0e86:	462b      	mov	r3, r5
c0de0e88:	4e8d      	ldr	r6, [pc, #564]	@ (c0de10c0 <bagl_draw_with_context+0x504>)
c0de0e8a:	447e      	add	r6, pc
c0de0e8c:	47b0      	blx	r6
c0de0e8e:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0e92:	f8b4 c006 	ldrh.w	ip, [r4, #6]
c0de0e96:	f9b4 3002 	ldrsh.w	r3, [r4, #2]
c0de0e9a:	7aa2      	ldrb	r2, [r4, #10]
c0de0e9c:	46b2      	mov	sl, r6
c0de0e9e:	f9b4 6004 	ldrsh.w	r6, [r4, #4]
c0de0ea2:	2730      	movs	r7, #48	@ 0x30
c0de0ea4:	e9cd 7b00 	strd	r7, fp, [sp]
c0de0ea8:	9102      	str	r1, [sp, #8]
c0de0eaa:	18a9      	adds	r1, r5, r2
c0de0eac:	eb03 020c 	add.w	r2, r3, ip
c0de0eb0:	462b      	mov	r3, r5
c0de0eb2:	1a51      	subs	r1, r2, r1
c0de0eb4:	19aa      	adds	r2, r5, r6
c0de0eb6:	47d0      	blx	sl
c0de0eb8:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de0ebc:	8922      	ldrh	r2, [r4, #8]
c0de0ebe:	f9b4 6004 	ldrsh.w	r6, [r4, #4]
c0de0ec2:	7aa7      	ldrb	r7, [r4, #10]
c0de0ec4:	f9b4 c002 	ldrsh.w	ip, [r4, #2]
c0de0ec8:	230c      	movs	r3, #12
c0de0eca:	e9cd 3b00 	strd	r3, fp, [sp]
c0de0ece:	462b      	mov	r3, r5
c0de0ed0:	9102      	str	r1, [sp, #8]
c0de0ed2:	19e9      	adds	r1, r5, r7
c0de0ed4:	4432      	add	r2, r6
c0de0ed6:	1a52      	subs	r2, r2, r1
c0de0ed8:	eb05 010c 	add.w	r1, r5, ip
c0de0edc:	47d0      	blx	sl
c0de0ede:	7aa2      	ldrb	r2, [r4, #10]
c0de0ee0:	88e3      	ldrh	r3, [r4, #6]
c0de0ee2:	f9b4 6002 	ldrsh.w	r6, [r4, #2]
c0de0ee6:	f9b4 7004 	ldrsh.w	r7, [r4, #4]
c0de0eea:	2103      	movs	r1, #3
c0de0eec:	e9d4 0e04 	ldrd	r0, lr, [r4, #16]
c0de0ef0:	f8b4 c008 	ldrh.w	ip, [r4, #8]
c0de0ef4:	e88d 4802 	stmia.w	sp, {r1, fp, lr}
c0de0ef8:	1999      	adds	r1, r3, r6
c0de0efa:	442a      	add	r2, r5
c0de0efc:	462b      	mov	r3, r5
c0de0efe:	1a89      	subs	r1, r1, r2
c0de0f00:	1aba      	subs	r2, r7, r2
c0de0f02:	4462      	add	r2, ip
c0de0f04:	47d0      	blx	sl
c0de0f06:	e9dd ab07 	ldrd	sl, fp, [sp, #28]
c0de0f0a:	f1b8 0f04 	cmp.w	r8, #4
c0de0f0e:	f000 8097 	beq.w	c0de1040 <bagl_draw_with_context+0x484>
c0de0f12:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de0f14:	2800      	cmp	r0, #0
c0de0f16:	f000 8093 	beq.w	c0de1040 <bagl_draw_with_context+0x484>
c0de0f1a:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de0f1c:	2800      	cmp	r0, #0
c0de0f1e:	f000 808f 	beq.w	c0de1040 <bagl_draw_with_context+0x484>
c0de0f22:	4659      	mov	r1, fp
c0de0f24:	e9d4 b004 	ldrd	fp, r0, [r4, #16]
c0de0f28:	f041 0102 	orr.w	r1, r1, #2
c0de0f2c:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de0f30:	2903      	cmp	r1, #3
c0de0f32:	d11b      	bne.n	c0de0f6c <bagl_draw_with_context+0x3b0>
c0de0f34:	7b21      	ldrb	r1, [r4, #12]
c0de0f36:	2901      	cmp	r1, #1
c0de0f38:	d118      	bne.n	c0de0f6c <bagl_draw_with_context+0x3b0>
c0de0f3a:	46d4      	mov	ip, sl
c0de0f3c:	4682      	mov	sl, r0
c0de0f3e:	e018      	b.n	c0de0f72 <bagl_draw_with_context+0x3b6>
c0de0f40:	2000      	movs	r0, #0
c0de0f42:	f04f 0a00 	mov.w	sl, #0
c0de0f46:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0f48:	e6c4      	b.n	c0de0cd4 <bagl_draw_with_context+0x118>
c0de0f4a:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
c0de0f4e:	f9b4 0002 	ldrsh.w	r0, [r4, #2]
c0de0f52:	7b23      	ldrb	r3, [r4, #12]
c0de0f54:	198a      	adds	r2, r1, r6
c0de0f56:	1981      	adds	r1, r0, r6
c0de0f58:	6920      	ldr	r0, [r4, #16]
c0de0f5a:	2b01      	cmp	r3, #1
c0de0f5c:	d067      	beq.n	c0de102e <bagl_draw_with_context+0x472>
c0de0f5e:	7aa3      	ldrb	r3, [r4, #10]
c0de0f60:	429e      	cmp	r6, r3
c0de0f62:	d964      	bls.n	c0de102e <bagl_draw_with_context+0x472>
c0de0f64:	1af3      	subs	r3, r6, r3
c0de0f66:	e063      	b.n	c0de1030 <bagl_draw_with_context+0x474>
c0de0f68:	00001582 	.word	0x00001582
c0de0f6c:	46d4      	mov	ip, sl
c0de0f6e:	46da      	mov	sl, fp
c0de0f70:	4683      	mov	fp, r0
c0de0f72:	f1b8 0707 	subs.w	r7, r8, #7
c0de0f76:	8b20      	ldrh	r0, [r4, #24]
c0de0f78:	f9b4 e002 	ldrsh.w	lr, [r4, #2]
c0de0f7c:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0f80:	88e3      	ldrh	r3, [r4, #6]
c0de0f82:	8926      	ldrh	r6, [r4, #8]
c0de0f84:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de0f86:	bf18      	it	ne
c0de0f88:	460f      	movne	r7, r1
c0de0f8a:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de0f8c:	1bf6      	subs	r6, r6, r7
c0de0f8e:	1b5b      	subs	r3, r3, r5
c0de0f90:	f1b8 0f07 	cmp.w	r8, #7
c0de0f94:	bf08      	it	eq
c0de0f96:	f1cc 0100 	rsbeq	r1, ip, #0
c0de0f9a:	440a      	add	r2, r1
c0de0f9c:	4688      	mov	r8, r1
c0de0f9e:	e88d 004c 	stmia.w	sp, {r2, r3, r6}
c0de0fa2:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
c0de0fa4:	2100      	movs	r1, #0
c0de0fa6:	eb05 030e 	add.w	r3, r5, lr
c0de0faa:	9105      	str	r1, [sp, #20]
c0de0fac:	4651      	mov	r1, sl
c0de0fae:	9203      	str	r2, [sp, #12]
c0de0fb0:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
c0de0fb2:	9204      	str	r2, [sp, #16]
c0de0fb4:	465a      	mov	r2, fp
c0de0fb6:	f000 f8bb 	bl	c0de1130 <bagl_draw_string>
c0de0fba:	990f      	ldr	r1, [sp, #60]	@ 0x3c
c0de0fbc:	2900      	cmp	r1, #0
c0de0fbe:	d03f      	beq.n	c0de1040 <bagl_draw_with_context+0x484>
c0de0fc0:	4a40      	ldr	r2, [pc, #256]	@ (c0de10c4 <bagl_draw_with_context+0x508>)
c0de0fc2:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de0fc6:	88e6      	ldrh	r6, [r4, #6]
c0de0fc8:	9d0c      	ldr	r5, [sp, #48]	@ 0x30
c0de0fca:	8921      	ldrh	r1, [r4, #8]
c0de0fcc:	f8b4 c018 	ldrh.w	ip, [r4, #24]
c0de0fd0:	f04f 0e03 	mov.w	lr, #3
c0de0fd4:	1b76      	subs	r6, r6, r5
c0de0fd6:	4443      	add	r3, r8
c0de0fd8:	1bc9      	subs	r1, r1, r7
c0de0fda:	447a      	add	r2, pc
c0de0fdc:	e9cd 3600 	strd	r3, r6, [sp]
c0de0fe0:	ab02      	add	r3, sp, #8
c0de0fe2:	e8a3 4006 	stmia.w	r3!, {r1, r2, lr}
c0de0fe6:	2100      	movs	r1, #0
c0de0fe8:	465a      	mov	r2, fp
c0de0fea:	9105      	str	r1, [sp, #20]
c0de0fec:	b283      	uxth	r3, r0
c0de0fee:	4660      	mov	r0, ip
c0de0ff0:	4651      	mov	r1, sl
c0de0ff2:	f000 f89d 	bl	c0de1130 <bagl_draw_string>
c0de0ff6:	e9dd 610d 	ldrd	r6, r1, [sp, #52]	@ 0x34
c0de0ffa:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de0ffe:	88e3      	ldrh	r3, [r4, #6]
c0de1000:	f8b4 c018 	ldrh.w	ip, [r4, #24]
c0de1004:	8924      	ldrh	r4, [r4, #8]
c0de1006:	440e      	add	r6, r1
c0de1008:	4651      	mov	r1, sl
c0de100a:	f8dd a03c 	ldr.w	sl, [sp, #60]	@ 0x3c
c0de100e:	4442      	add	r2, r8
c0de1010:	1be4      	subs	r4, r4, r7
c0de1012:	1b5b      	subs	r3, r3, r5
c0de1014:	e88d 041c 	stmia.w	sp, {r2, r3, r4, sl}
c0de1018:	2200      	movs	r2, #0
c0de101a:	b283      	uxth	r3, r0
c0de101c:	4660      	mov	r0, ip
c0de101e:	eba6 060a 	sub.w	r6, r6, sl
c0de1022:	9205      	str	r2, [sp, #20]
c0de1024:	465a      	mov	r2, fp
c0de1026:	9604      	str	r6, [sp, #16]
c0de1028:	f000 f882 	bl	c0de1130 <bagl_draw_string>
c0de102c:	e008      	b.n	c0de1040 <bagl_draw_with_context+0x484>
c0de102e:	2300      	movs	r3, #0
c0de1030:	6964      	ldr	r4, [r4, #20]
c0de1032:	25ff      	movs	r5, #255	@ 0xff
c0de1034:	e9cd 5300 	strd	r5, r3, [sp]
c0de1038:	4633      	mov	r3, r6
c0de103a:	9402      	str	r4, [sp, #8]
c0de103c:	f000 f9ca 	bl	c0de13d4 <bagl_draw_circle_helper>
c0de1040:	b010      	add	sp, #64	@ 0x40
c0de1042:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1046:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de104a:	f8dd c01c 	ldr.w	ip, [sp, #28]
c0de104e:	e003      	b.n	c0de1058 <bagl_draw_with_context+0x49c>
c0de1050:	4633      	mov	r3, r6
c0de1052:	46dc      	mov	ip, fp
c0de1054:	e000      	b.n	c0de1058 <bagl_draw_with_context+0x49c>
c0de1056:	4633      	mov	r3, r6
c0de1058:	8b21      	ldrh	r1, [r4, #24]
c0de105a:	f8dd b020 	ldr.w	fp, [sp, #32]
c0de105e:	930a      	str	r3, [sp, #40]	@ 0x28
c0de1060:	f401 4240 	and.w	r2, r1, #49152	@ 0xc000
c0de1064:	f5b2 4f00 	cmp.w	r2, #32768	@ 0x8000
c0de1068:	d005      	beq.n	c0de1076 <bagl_draw_with_context+0x4ba>
c0de106a:	f5b2 4f80 	cmp.w	r2, #16384	@ 0x4000
c0de106e:	d10c      	bne.n	c0de108a <bagl_draw_with_context+0x4ce>
c0de1070:	b280      	uxth	r0, r0
c0de1072:	1bc0      	subs	r0, r0, r7
c0de1074:	e006      	b.n	c0de1084 <bagl_draw_with_context+0x4c8>
c0de1076:	f06f 0201 	mvn.w	r2, #1
c0de107a:	b280      	uxth	r0, r0
c0de107c:	fb97 f2f2 	sdiv	r2, r7, r2
c0de1080:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de1084:	ea20 70e0 	bic.w	r0, r0, r0, asr #31
c0de1088:	e000      	b.n	c0de108c <bagl_draw_with_context+0x4d0>
c0de108a:	2000      	movs	r0, #0
c0de108c:	900c      	str	r0, [sp, #48]	@ 0x30
c0de108e:	f401 5040 	and.w	r0, r1, #12288	@ 0x3000
c0de1092:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
c0de1096:	d007      	beq.n	c0de10a8 <bagl_draw_with_context+0x4ec>
c0de1098:	f5b0 5f80 	cmp.w	r0, #4096	@ 0x1000
c0de109c:	bf12      	itee	ne
c0de109e:	2000      	movne	r0, #0
c0de10a0:	8920      	ldrheq	r0, [r4, #8]
c0de10a2:	eba0 000c 	subeq.w	r0, r0, ip
c0de10a6:	e004      	b.n	c0de10b2 <bagl_draw_with_context+0x4f6>
c0de10a8:	8920      	ldrh	r0, [r4, #8]
c0de10aa:	ea6f 015c 	mvn.w	r1, ip, lsr #1
c0de10ae:	eb01 0050 	add.w	r0, r1, r0, lsr #1
c0de10b2:	9009      	str	r0, [sp, #36]	@ 0x24
c0de10b4:	e612      	b.n	c0de0cdc <bagl_draw_with_context+0x120>
c0de10b6:	bf00      	nop
c0de10b8:	0000135d 	.word	0x0000135d
c0de10bc:	00001395 	.word	0x00001395
c0de10c0:	00000547 	.word	0x00000547
c0de10c4:	000011e2 	.word	0x000011e2

c0de10c8 <bagl_get_font>:
c0de10c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de10ca:	4604      	mov	r4, r0
c0de10cc:	480c      	ldr	r0, [pc, #48]	@ (c0de1100 <bagl_get_font+0x38>)
c0de10ce:	4f0d      	ldr	r7, [pc, #52]	@ (c0de1104 <bagl_get_font+0x3c>)
c0de10d0:	f36f 341f 	bfc	r4, #12, #20
c0de10d4:	4478      	add	r0, pc
c0de10d6:	447f      	add	r7, pc
c0de10d8:	6806      	ldr	r6, [r0, #0]
c0de10da:	b17e      	cbz	r6, c0de10fc <bagl_get_font+0x34>
c0de10dc:	eb07 0086 	add.w	r0, r7, r6, lsl #2
c0de10e0:	f850 5c04 	ldr.w	r5, [r0, #-4]
c0de10e4:	4628      	mov	r0, r5
c0de10e6:	f000 ff1b 	bl	c0de1f20 <pic>
c0de10ea:	7880      	ldrb	r0, [r0, #2]
c0de10ec:	3e01      	subs	r6, #1
c0de10ee:	4284      	cmp	r4, r0
c0de10f0:	d1f3      	bne.n	c0de10da <bagl_get_font+0x12>
c0de10f2:	4628      	mov	r0, r5
c0de10f4:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de10f8:	f000 bf12 	b.w	c0de1f20 <pic>
c0de10fc:	2000      	movs	r0, #0
c0de10fe:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de1100:	00001cbc 	.word	0x00001cbc
c0de1104:	00001cae 	.word	0x00001cae

c0de1108 <bagl_compute_line_width>:
c0de1108:	b5b0      	push	{r4, r5, r7, lr}
c0de110a:	b086      	sub	sp, #24
c0de110c:	2400      	movs	r4, #0
c0de110e:	f243 0539 	movw	r5, #12345	@ 0x3039
c0de1112:	e9cd 5100 	strd	r5, r1, [sp]
c0de1116:	e9cd 4202 	strd	r4, r2, [sp, #8]
c0de111a:	e9cd 3404 	strd	r3, r4, [sp, #16]
c0de111e:	2100      	movs	r1, #0
c0de1120:	2200      	movs	r2, #0
c0de1122:	f243 0339 	movw	r3, #12345	@ 0x3039
c0de1126:	f000 f803 	bl	c0de1130 <bagl_draw_string>
c0de112a:	b280      	uxth	r0, r0
c0de112c:	b006      	add	sp, #24
c0de112e:	bdb0      	pop	{r4, r5, r7, pc}

c0de1130 <bagl_draw_string>:
c0de1130:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1134:	b0a6      	sub	sp, #152	@ 0x98
c0de1136:	f8dd b0b8 	ldr.w	fp, [sp, #184]	@ 0xb8
c0de113a:	e9cd 2116 	strd	r2, r1, [sp, #88]	@ 0x58
c0de113e:	f243 0139 	movw	r1, #12345	@ 0x3039
c0de1142:	9208      	str	r2, [sp, #32]
c0de1144:	9309      	str	r3, [sp, #36]	@ 0x24
c0de1146:	ea8b 0201 	eor.w	r2, fp, r1
c0de114a:	4059      	eors	r1, r3
c0de114c:	ea51 0402 	orrs.w	r4, r1, r2
c0de1150:	4625      	mov	r5, r4
c0de1152:	bf14      	ite	ne
c0de1154:	461d      	movne	r5, r3
c0de1156:	46a3      	moveq	fp, r4
c0de1158:	f7ff ffb6 	bl	c0de10c8 <bagl_get_font>
c0de115c:	2800      	cmp	r0, #0
c0de115e:	f000 8131 	beq.w	c0de13c4 <bagl_draw_string+0x294>
c0de1162:	e9dd 212f 	ldrd	r2, r1, [sp, #188]	@ 0xbc
c0de1166:	4680      	mov	r8, r0
c0de1168:	fab4 f084 	clz	r0, r4
c0de116c:	46ae      	mov	lr, r5
c0de116e:	0940      	lsrs	r0, r0, #5
c0de1170:	eb05 0c02 	add.w	ip, r5, r2
c0de1174:	4459      	add	r1, fp
c0de1176:	f898 2003 	ldrb.w	r2, [r8, #3]
c0de117a:	9015      	str	r0, [sp, #84]	@ 0x54
c0de117c:	e9dd 6031 	ldrd	r6, r0, [sp, #196]	@ 0xc4
c0de1180:	9106      	str	r1, [sp, #24]
c0de1182:	2101      	movs	r1, #1
c0de1184:	f8cd c02c 	str.w	ip, [sp, #44]	@ 0x2c
c0de1188:	4091      	lsls	r1, r2
c0de118a:	9211      	str	r2, [sp, #68]	@ 0x44
c0de118c:	9107      	str	r1, [sp, #28]
c0de118e:	3601      	adds	r6, #1
c0de1190:	f1c0 0301 	rsb	r3, r0, #1
c0de1194:	f8cd b028 	str.w	fp, [sp, #40]	@ 0x28
c0de1198:	2b01      	cmp	r3, #1
c0de119a:	f000 810c 	beq.w	c0de13b6 <bagl_draw_string+0x286>
c0de119e:	f898 7004 	ldrb.w	r7, [r8, #4]
c0de11a2:	f898 0006 	ldrb.w	r0, [r8, #6]
c0de11a6:	f816 5c01 	ldrb.w	r5, [r6, #-1]
c0de11aa:	4c89      	ldr	r4, [pc, #548]	@ (c0de13d0 <bagl_draw_string+0x2a0>)
c0de11ac:	4285      	cmp	r5, r0
c0de11ae:	447c      	add	r4, pc
c0de11b0:	d303      	bcc.n	c0de11ba <bagl_draw_string+0x8a>
c0de11b2:	f898 1007 	ldrb.w	r1, [r8, #7]
c0de11b6:	428d      	cmp	r5, r1
c0de11b8:	d915      	bls.n	c0de11e6 <bagl_draw_string+0xb6>
c0de11ba:	2dc0      	cmp	r5, #192	@ 0xc0
c0de11bc:	d302      	bcc.n	c0de11c4 <bagl_draw_string+0x94>
c0de11be:	f005 043f 	and.w	r4, r5, #63	@ 0x3f
c0de11c2:	e004      	b.n	c0de11ce <bagl_draw_string+0x9e>
c0de11c4:	b268      	sxtb	r0, r5
c0de11c6:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de11ca:	dd26      	ble.n	c0de121a <bagl_draw_string+0xea>
c0de11cc:	2400      	movs	r4, #0
c0de11ce:	2000      	movs	r0, #0
c0de11d0:	465a      	mov	r2, fp
c0de11d2:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de11d4:	9811      	ldr	r0, [sp, #68]	@ 0x44
c0de11d6:	9714      	str	r7, [sp, #80]	@ 0x50
c0de11d8:	f04f 0a00 	mov.w	sl, #0
c0de11dc:	2100      	movs	r1, #0
c0de11de:	4378      	muls	r0, r7
c0de11e0:	2700      	movs	r7, #0
c0de11e2:	4360      	muls	r0, r4
c0de11e4:	e08d      	b.n	c0de1302 <bagl_draw_string+0x1d2>
c0de11e6:	1a2d      	subs	r5, r5, r0
c0de11e8:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de11ec:	9714      	str	r7, [sp, #80]	@ 0x50
c0de11ee:	9312      	str	r3, [sp, #72]	@ 0x48
c0de11f0:	e9cd 6e0f 	strd	r6, lr, [sp, #60]	@ 0x3c
c0de11f4:	f000 fe94 	bl	c0de1f20 <pic>
c0de11f8:	4682      	mov	sl, r0
c0de11fa:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de11fe:	f000 fe8f 	bl	c0de1f20 <pic>
c0de1202:	f850 6025 	ldr.w	r6, [r0, r5, lsl #2]
c0de1206:	f898 0006 	ldrb.w	r0, [r8, #6]
c0de120a:	f898 1007 	ldrb.w	r1, [r8, #7]
c0de120e:	1a08      	subs	r0, r1, r0
c0de1210:	4285      	cmp	r5, r0
c0de1212:	d12d      	bne.n	c0de1270 <bagl_draw_string+0x140>
c0de1214:	f8b8 0000 	ldrh.w	r0, [r8]
c0de1218:	e033      	b.n	c0de1282 <bagl_draw_string+0x152>
c0de121a:	06a8      	lsls	r0, r5, #26
c0de121c:	9312      	str	r3, [sp, #72]	@ 0x48
c0de121e:	f8cd e040 	str.w	lr, [sp, #64]	@ 0x40
c0de1222:	f04f 000f 	mov.w	r0, #15
c0de1226:	bf58      	it	pl
c0de1228:	200e      	movpl	r0, #14
c0de122a:	f7ff ff4d 	bl	c0de10c8 <bagl_get_font>
c0de122e:	2800      	cmp	r0, #0
c0de1230:	d07a      	beq.n	c0de1328 <bagl_draw_string+0x1f8>
c0de1232:	4682      	mov	sl, r0
c0de1234:	68c0      	ldr	r0, [r0, #12]
c0de1236:	47a0      	blx	r4
c0de1238:	4607      	mov	r7, r0
c0de123a:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de123e:	47a0      	blx	r4
c0de1240:	f005 051f 	and.w	r5, r5, #31
c0de1244:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de1248:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de124c:	4438      	add	r0, r7
c0de124e:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de1250:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de1254:	47a0      	blx	r4
c0de1256:	f898 1005 	ldrb.w	r1, [r8, #5]
c0de125a:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de125e:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de1262:	f89a 7004 	ldrb.w	r7, [sl, #4]
c0de1266:	4459      	add	r1, fp
c0de1268:	f3c0 3484 	ubfx	r4, r0, #14, #5
c0de126c:	1a8a      	subs	r2, r1, r2
c0de126e:	e05f      	b.n	c0de1330 <bagl_draw_string+0x200>
c0de1270:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de1274:	f000 fe54 	bl	c0de1f20 <pic>
c0de1278:	eb00 0085 	add.w	r0, r0, r5, lsl #2
c0de127c:	6840      	ldr	r0, [r0, #4]
c0de127e:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de1282:	900c      	str	r0, [sp, #48]	@ 0x30
c0de1284:	f3c6 008b 	ubfx	r0, r6, #2, #12
c0de1288:	4450      	add	r0, sl
c0de128a:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de128c:	f000 fa5e 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de1290:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de1294:	900e      	str	r0, [sp, #56]	@ 0x38
c0de1296:	f000 fa59 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de129a:	f850 7025 	ldr.w	r7, [r0, r5, lsl #2]
c0de129e:	f000 fa55 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de12a2:	f850 a025 	ldr.w	sl, [r0, r5, lsl #2]
c0de12a6:	f000 fa51 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de12aa:	f850 b025 	ldr.w	fp, [r0, r5, lsl #2]
c0de12ae:	f000 fa4d 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de12b2:	f850 6025 	ldr.w	r6, [r0, r5, lsl #2]
c0de12b6:	f898 0005 	ldrb.w	r0, [r8, #5]
c0de12ba:	900d      	str	r0, [sp, #52]	@ 0x34
c0de12bc:	f000 fa46 	bl	c0de174c <OUTLINED_FUNCTION_3>
c0de12c0:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de12c4:	f3c7 3184 	ubfx	r1, r7, #14, #5
c0de12c8:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de12ca:	ea4f 771b 	mov.w	r7, fp, lsr #28
c0de12ce:	f8dd c02c 	ldr.w	ip, [sp, #44]	@ 0x2c
c0de12d2:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de12d4:	f3ca 4ac3 	ubfx	sl, sl, #19, #4
c0de12d8:	f3c0 40c3 	ubfx	r0, r0, #19, #4
c0de12dc:	eb00 701b 	add.w	r0, r0, fp, lsr #28
c0de12e0:	f8dd b028 	ldr.w	fp, [sp, #40]	@ 0x28
c0de12e4:	1a08      	subs	r0, r1, r0
c0de12e6:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de12e8:	b2c4      	uxtb	r4, r0
c0de12ea:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de12ec:	f3c0 008b 	ubfx	r0, r0, #2, #12
c0de12f0:	1a08      	subs	r0, r1, r0
c0de12f2:	f3c6 51c4 	ubfx	r1, r6, #23, #5
c0de12f6:	e9dd 6e0f 	ldrd	r6, lr, [sp, #60]	@ 0x3c
c0de12fa:	1a89      	subs	r1, r1, r2
c0de12fc:	00c0      	lsls	r0, r0, #3
c0de12fe:	465a      	mov	r2, fp
c0de1300:	3109      	adds	r1, #9
c0de1302:	9d15      	ldr	r5, [sp, #84]	@ 0x54
c0de1304:	b1d5      	cbz	r5, c0de133c <bagl_draw_string+0x20c>
c0de1306:	f1bc 0f00 	cmp.w	ip, #0
c0de130a:	dd05      	ble.n	c0de1318 <bagl_draw_string+0x1e8>
c0de130c:	eb0a 000e 	add.w	r0, sl, lr
c0de1310:	1901      	adds	r1, r0, r4
c0de1312:	4561      	cmp	r1, ip
c0de1314:	dd02      	ble.n	c0de131c <bagl_draw_string+0x1ec>
c0de1316:	e057      	b.n	c0de13c8 <bagl_draw_string+0x298>
c0de1318:	eb0a 000e 	add.w	r0, sl, lr
c0de131c:	4438      	add	r0, r7
c0de131e:	3601      	adds	r6, #1
c0de1320:	3301      	adds	r3, #1
c0de1322:	eb00 0e04 	add.w	lr, r0, r4
c0de1326:	e737      	b.n	c0de1198 <bagl_draw_string+0x68>
c0de1328:	2000      	movs	r0, #0
c0de132a:	2400      	movs	r4, #0
c0de132c:	465a      	mov	r2, fp
c0de132e:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de1330:	f8dd c02c 	ldr.w	ip, [sp, #44]	@ 0x2c
c0de1334:	f8dd e040 	ldr.w	lr, [sp, #64]	@ 0x40
c0de1338:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de133a:	e74b      	b.n	c0de11d4 <bagl_draw_string+0xa4>
c0de133c:	9312      	str	r3, [sp, #72]	@ 0x48
c0de133e:	eb0a 030e 	add.w	r3, sl, lr
c0de1342:	4423      	add	r3, r4
c0de1344:	4563      	cmp	r3, ip
c0de1346:	dd0b      	ble.n	c0de1360 <bagl_draw_string+0x230>
c0de1348:	9a14      	ldr	r2, [sp, #80]	@ 0x50
c0de134a:	f10b 0b0c 	add.w	fp, fp, #12
c0de134e:	9b06      	ldr	r3, [sp, #24]
c0de1350:	f8dd c024 	ldr.w	ip, [sp, #36]	@ 0x24
c0de1354:	445a      	add	r2, fp
c0de1356:	440a      	add	r2, r1
c0de1358:	429a      	cmp	r2, r3
c0de135a:	465a      	mov	r2, fp
c0de135c:	dd01      	ble.n	c0de1362 <bagl_draw_string+0x232>
c0de135e:	e02c      	b.n	c0de13ba <bagl_draw_string+0x28a>
c0de1360:	46f4      	mov	ip, lr
c0de1362:	9d13      	ldr	r5, [sp, #76]	@ 0x4c
c0de1364:	b1ad      	cbz	r5, c0de1392 <bagl_draw_string+0x262>
c0de1366:	9b07      	ldr	r3, [sp, #28]
c0de1368:	b280      	uxth	r0, r0
c0de136a:	4411      	add	r1, r2
c0de136c:	4622      	mov	r2, r4
c0de136e:	9300      	str	r3, [sp, #0]
c0de1370:	ab16      	add	r3, sp, #88	@ 0x58
c0de1372:	9004      	str	r0, [sp, #16]
c0de1374:	eb0c 000a 	add.w	r0, ip, sl
c0de1378:	9301      	str	r3, [sp, #4]
c0de137a:	9b11      	ldr	r3, [sp, #68]	@ 0x44
c0de137c:	e9cd 3502 	strd	r3, r5, [sp, #8]
c0de1380:	9b14      	ldr	r3, [sp, #80]	@ 0x50
c0de1382:	4665      	mov	r5, ip
c0de1384:	f000 feb2 	bl	c0de20ec <bagl_hal_draw_bitmap_within_rect>
c0de1388:	46ae      	mov	lr, r5
c0de138a:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de138e:	d009      	beq.n	c0de13a4 <bagl_draw_string+0x274>
c0de1390:	e01a      	b.n	c0de13c8 <bagl_draw_string+0x298>
c0de1392:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de1394:	4661      	mov	r1, ip
c0de1396:	4623      	mov	r3, r4
c0de1398:	4665      	mov	r5, ip
c0de139a:	9000      	str	r0, [sp, #0]
c0de139c:	9808      	ldr	r0, [sp, #32]
c0de139e:	f000 febd 	bl	c0de211c <bagl_hal_draw_rect>
c0de13a2:	46ae      	mov	lr, r5
c0de13a4:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de13a6:	eb07 010a 	add.w	r1, r7, sl
c0de13aa:	f8dd c02c 	ldr.w	ip, [sp, #44]	@ 0x2c
c0de13ae:	4421      	add	r1, r4
c0de13b0:	4240      	negs	r0, r0
c0de13b2:	448e      	add	lr, r1
c0de13b4:	e6eb      	b.n	c0de118e <bagl_draw_string+0x5e>
c0de13b6:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de13b8:	b930      	cbnz	r0, c0de13c8 <bagl_draw_string+0x298>
c0de13ba:	fa1f f08e 	uxth.w	r0, lr
c0de13be:	ea40 4e0b 	orr.w	lr, r0, fp, lsl #16
c0de13c2:	e001      	b.n	c0de13c8 <bagl_draw_string+0x298>
c0de13c4:	f04f 0e00 	mov.w	lr, #0
c0de13c8:	4670      	mov	r0, lr
c0de13ca:	b026      	add	sp, #152	@ 0x98
c0de13cc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de13d0:	00000d6f 	.word	0x00000d6f

c0de13d4 <bagl_draw_circle_helper>:
c0de13d4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de13d8:	b096      	sub	sp, #88	@ 0x58
c0de13da:	4607      	mov	r7, r0
c0de13dc:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0de13de:	460c      	mov	r4, r1
c0de13e0:	2100      	movs	r1, #0
c0de13e2:	9214      	str	r2, [sp, #80]	@ 0x50
c0de13e4:	f1c3 0b01 	rsb	fp, r3, #1
c0de13e8:	f04f 0a00 	mov.w	sl, #0
c0de13ec:	9115      	str	r1, [sp, #84]	@ 0x54
c0de13ee:	2100      	movs	r1, #0
c0de13f0:	eba3 0800 	sub.w	r8, r3, r0
c0de13f4:	4602      	mov	r2, r0
c0de13f6:	f1b8 0f00 	cmp.w	r8, #0
c0de13fa:	bfc8      	it	gt
c0de13fc:	2101      	movgt	r1, #1
c0de13fe:	2800      	cmp	r0, #0
c0de1400:	bf18      	it	ne
c0de1402:	2201      	movne	r2, #1
c0de1404:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de1406:	9706      	str	r7, [sp, #24]
c0de1408:	f8cd 803c 	str.w	r8, [sp, #60]	@ 0x3c
c0de140c:	4011      	ands	r1, r2
c0de140e:	2501      	movs	r5, #1
c0de1410:	9112      	str	r1, [sp, #72]	@ 0x48
c0de1412:	1ac1      	subs	r1, r0, r3
c0de1414:	4420      	add	r0, r4
c0de1416:	461c      	mov	r4, r3
c0de1418:	1ac0      	subs	r0, r0, r3
c0de141a:	3101      	adds	r1, #1
c0de141c:	3001      	adds	r0, #1
c0de141e:	9102      	str	r1, [sp, #8]
c0de1420:	f1c8 0101 	rsb	r1, r8, #1
c0de1424:	9004      	str	r0, [sp, #16]
c0de1426:	981e      	ldr	r0, [sp, #120]	@ 0x78
c0de1428:	9103      	str	r1, [sp, #12]
c0de142a:	f1a8 0101 	sub.w	r1, r8, #1
c0de142e:	9105      	str	r1, [sp, #20]
c0de1430:	f000 0180 	and.w	r1, r0, #128	@ 0x80
c0de1434:	910a      	str	r1, [sp, #40]	@ 0x28
c0de1436:	f000 0140 	and.w	r1, r0, #64	@ 0x40
c0de143a:	910e      	str	r1, [sp, #56]	@ 0x38
c0de143c:	f000 0120 	and.w	r1, r0, #32
c0de1440:	9109      	str	r1, [sp, #36]	@ 0x24
c0de1442:	f000 0110 	and.w	r1, r0, #16
c0de1446:	910d      	str	r1, [sp, #52]	@ 0x34
c0de1448:	f000 0108 	and.w	r1, r0, #8
c0de144c:	9108      	str	r1, [sp, #32]
c0de144e:	f000 0104 	and.w	r1, r0, #4
c0de1452:	910c      	str	r1, [sp, #48]	@ 0x30
c0de1454:	f000 0102 	and.w	r1, r0, #2
c0de1458:	f000 0001 	and.w	r0, r0, #1
c0de145c:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de145e:	2003      	movs	r0, #3
c0de1460:	9107      	str	r1, [sp, #28]
c0de1462:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1464:	9410      	str	r4, [sp, #64]	@ 0x40
c0de1466:	459a      	cmp	sl, r3
c0de1468:	f300 8131 	bgt.w	c0de16ce <bagl_draw_circle_helper+0x2fa>
c0de146c:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de146e:	461c      	mov	r4, r3
c0de1470:	b920      	cbnz	r0, c0de147c <bagl_draw_circle_helper+0xa8>
c0de1472:	9807      	ldr	r0, [sp, #28]
c0de1474:	b3a8      	cbz	r0, c0de14e2 <bagl_draw_circle_helper+0x10e>
c0de1476:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de1478:	b998      	cbnz	r0, c0de14a2 <bagl_draw_circle_helper+0xce>
c0de147a:	e02a      	b.n	c0de14d2 <bagl_draw_circle_helper+0xfe>
c0de147c:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de147e:	b1f0      	cbz	r0, c0de14be <bagl_draw_circle_helper+0xea>
c0de1480:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de1482:	9500      	str	r5, [sp, #0]
c0de1484:	463d      	mov	r5, r7
c0de1486:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de1488:	eb00 060a 	add.w	r6, r0, sl
c0de148c:	9805      	ldr	r0, [sp, #20]
c0de148e:	4639      	mov	r1, r7
c0de1490:	4632      	mov	r2, r6
c0de1492:	1a23      	subs	r3, r4, r0
c0de1494:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de1496:	f000 fe41 	bl	c0de211c <bagl_hal_draw_rect>
c0de149a:	f000 f943 	bl	c0de1724 <OUTLINED_FUNCTION_0>
c0de149e:	9807      	ldr	r0, [sp, #28]
c0de14a0:	b1f8      	cbz	r0, c0de14e2 <bagl_draw_circle_helper+0x10e>
c0de14a2:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de14a4:	1826      	adds	r6, r4, r0
c0de14a6:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de14a8:	42a0      	cmp	r0, r4
c0de14aa:	d005      	beq.n	c0de14b8 <bagl_draw_circle_helper+0xe4>
c0de14ac:	9802      	ldr	r0, [sp, #8]
c0de14ae:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de14b0:	4632      	mov	r2, r6
c0de14b2:	9500      	str	r5, [sp, #0]
c0de14b4:	f000 f942 	bl	c0de173c <OUTLINED_FUNCTION_1>
c0de14b8:	f000 f95c 	bl	c0de1774 <OUTLINED_FUNCTION_6>
c0de14bc:	e00f      	b.n	c0de14de <bagl_draw_circle_helper+0x10a>
c0de14be:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de14c0:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de14c2:	4623      	mov	r3, r4
c0de14c4:	9500      	str	r5, [sp, #0]
c0de14c6:	4450      	add	r0, sl
c0de14c8:	1e42      	subs	r2, r0, #1
c0de14ca:	f000 f93c 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de14ce:	9807      	ldr	r0, [sp, #28]
c0de14d0:	b138      	cbz	r0, c0de14e2 <bagl_draw_circle_helper+0x10e>
c0de14d2:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de14d4:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de14d6:	4653      	mov	r3, sl
c0de14d8:	9500      	str	r5, [sp, #0]
c0de14da:	4420      	add	r0, r4
c0de14dc:	1e42      	subs	r2, r0, #1
c0de14de:	f000 f932 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de14e2:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de14e4:	b928      	cbnz	r0, c0de14f2 <bagl_draw_circle_helper+0x11e>
c0de14e6:	9808      	ldr	r0, [sp, #32]
c0de14e8:	2800      	cmp	r0, #0
c0de14ea:	d04f      	beq.n	c0de158c <bagl_draw_circle_helper+0x1b8>
c0de14ec:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de14ee:	b9e0      	cbnz	r0, c0de152a <bagl_draw_circle_helper+0x156>
c0de14f0:	e02e      	b.n	c0de1550 <bagl_draw_circle_helper+0x17c>
c0de14f2:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de14f4:	1b06      	subs	r6, r0, r4
c0de14f6:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de14f8:	b300      	cbz	r0, c0de153c <bagl_draw_circle_helper+0x168>
c0de14fa:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de14fc:	9f05      	ldr	r7, [sp, #20]
c0de14fe:	9500      	str	r5, [sp, #0]
c0de1500:	4631      	mov	r1, r6
c0de1502:	eb00 050a 	add.w	r5, r0, sl
c0de1506:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de1508:	1be3      	subs	r3, r4, r7
c0de150a:	462a      	mov	r2, r5
c0de150c:	f000 fe06 	bl	c0de211c <bagl_hal_draw_rect>
c0de1510:	2001      	movs	r0, #1
c0de1512:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de1516:	1bf1      	subs	r1, r6, r7
c0de1518:	462a      	mov	r2, r5
c0de151a:	9f06      	ldr	r7, [sp, #24]
c0de151c:	2501      	movs	r5, #1
c0de151e:	9000      	str	r0, [sp, #0]
c0de1520:	9806      	ldr	r0, [sp, #24]
c0de1522:	f000 f935 	bl	c0de1790 <OUTLINED_FUNCTION_8>
c0de1526:	9808      	ldr	r0, [sp, #32]
c0de1528:	b380      	cbz	r0, c0de158c <bagl_draw_circle_helper+0x1b8>
c0de152a:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de152c:	42a0      	cmp	r0, r4
c0de152e:	d116      	bne.n	c0de155e <bagl_draw_circle_helper+0x18a>
c0de1530:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de1532:	9d15      	ldr	r5, [sp, #84]	@ 0x54
c0de1534:	f04f 0801 	mov.w	r8, #1
c0de1538:	1826      	adds	r6, r4, r0
c0de153a:	e01c      	b.n	c0de1576 <bagl_draw_circle_helper+0x1a2>
c0de153c:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de153e:	4631      	mov	r1, r6
c0de1540:	4623      	mov	r3, r4
c0de1542:	9500      	str	r5, [sp, #0]
c0de1544:	4450      	add	r0, sl
c0de1546:	1e42      	subs	r2, r0, #1
c0de1548:	f000 f8fd 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de154c:	9808      	ldr	r0, [sp, #32]
c0de154e:	b1e8      	cbz	r0, c0de158c <bagl_draw_circle_helper+0x1b8>
c0de1550:	f000 f917 	bl	c0de1782 <OUTLINED_FUNCTION_7>
c0de1554:	4420      	add	r0, r4
c0de1556:	1e42      	subs	r2, r0, #1
c0de1558:	f000 f8f5 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de155c:	e016      	b.n	c0de158c <bagl_draw_circle_helper+0x1b8>
c0de155e:	9500      	str	r5, [sp, #0]
c0de1560:	9d15      	ldr	r5, [sp, #84]	@ 0x54
c0de1562:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1564:	f04f 0801 	mov.w	r8, #1
c0de1568:	1941      	adds	r1, r0, r5
c0de156a:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de156c:	1826      	adds	r6, r4, r0
c0de156e:	9802      	ldr	r0, [sp, #8]
c0de1570:	4632      	mov	r2, r6
c0de1572:	f000 f8e3 	bl	c0de173c <OUTLINED_FUNCTION_1>
c0de1576:	f8cd 8000 	str.w	r8, [sp]
c0de157a:	9804      	ldr	r0, [sp, #16]
c0de157c:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de1580:	4632      	mov	r2, r6
c0de1582:	1941      	adds	r1, r0, r5
c0de1584:	4638      	mov	r0, r7
c0de1586:	f000 f903 	bl	c0de1790 <OUTLINED_FUNCTION_8>
c0de158a:	2501      	movs	r5, #1
c0de158c:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de158e:	b920      	cbnz	r0, c0de159a <bagl_draw_circle_helper+0x1c6>
c0de1590:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de1592:	b398      	cbz	r0, c0de15fc <bagl_draw_circle_helper+0x228>
c0de1594:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de1596:	b998      	cbnz	r0, c0de15c0 <bagl_draw_circle_helper+0x1ec>
c0de1598:	e029      	b.n	c0de15ee <bagl_draw_circle_helper+0x21a>
c0de159a:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
c0de159e:	1846      	adds	r6, r0, r1
c0de15a0:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de15a2:	b1d8      	cbz	r0, c0de15dc <bagl_draw_circle_helper+0x208>
c0de15a4:	9805      	ldr	r0, [sp, #20]
c0de15a6:	9500      	str	r5, [sp, #0]
c0de15a8:	463d      	mov	r5, r7
c0de15aa:	9f13      	ldr	r7, [sp, #76]	@ 0x4c
c0de15ac:	4632      	mov	r2, r6
c0de15ae:	1a23      	subs	r3, r4, r0
c0de15b0:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de15b2:	4639      	mov	r1, r7
c0de15b4:	f000 fdb2 	bl	c0de211c <bagl_hal_draw_rect>
c0de15b8:	f000 f8b4 	bl	c0de1724 <OUTLINED_FUNCTION_0>
c0de15bc:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de15be:	b1e8      	cbz	r0, c0de15fc <bagl_draw_circle_helper+0x228>
c0de15c0:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de15c2:	1b06      	subs	r6, r0, r4
c0de15c4:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de15c6:	42a0      	cmp	r0, r4
c0de15c8:	d005      	beq.n	c0de15d6 <bagl_draw_circle_helper+0x202>
c0de15ca:	9802      	ldr	r0, [sp, #8]
c0de15cc:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de15ce:	4632      	mov	r2, r6
c0de15d0:	9500      	str	r5, [sp, #0]
c0de15d2:	f000 f8b3 	bl	c0de173c <OUTLINED_FUNCTION_1>
c0de15d6:	f000 f8cd 	bl	c0de1774 <OUTLINED_FUNCTION_6>
c0de15da:	e00d      	b.n	c0de15f8 <bagl_draw_circle_helper+0x224>
c0de15dc:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de15de:	4638      	mov	r0, r7
c0de15e0:	4632      	mov	r2, r6
c0de15e2:	4623      	mov	r3, r4
c0de15e4:	9500      	str	r5, [sp, #0]
c0de15e6:	f000 fd99 	bl	c0de211c <bagl_hal_draw_rect>
c0de15ea:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de15ec:	b130      	cbz	r0, c0de15fc <bagl_draw_circle_helper+0x228>
c0de15ee:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de15f0:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de15f2:	4653      	mov	r3, sl
c0de15f4:	9500      	str	r5, [sp, #0]
c0de15f6:	1b02      	subs	r2, r0, r4
c0de15f8:	f000 f8a5 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de15fc:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de15fe:	b928      	cbnz	r0, c0de160c <bagl_draw_circle_helper+0x238>
c0de1600:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1602:	2800      	cmp	r0, #0
c0de1604:	d04f      	beq.n	c0de16a6 <bagl_draw_circle_helper+0x2d2>
c0de1606:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de1608:	b9e8      	cbnz	r0, c0de1646 <bagl_draw_circle_helper+0x272>
c0de160a:	e030      	b.n	c0de166e <bagl_draw_circle_helper+0x29a>
c0de160c:	e9dd 0114 	ldrd	r0, r1, [sp, #80]	@ 0x50
c0de1610:	eb00 0801 	add.w	r8, r0, r1
c0de1614:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1616:	1b06      	subs	r6, r0, r4
c0de1618:	9812      	ldr	r0, [sp, #72]	@ 0x48
c0de161a:	b1e8      	cbz	r0, c0de1658 <bagl_draw_circle_helper+0x284>
c0de161c:	9f05      	ldr	r7, [sp, #20]
c0de161e:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de1620:	4631      	mov	r1, r6
c0de1622:	4642      	mov	r2, r8
c0de1624:	9500      	str	r5, [sp, #0]
c0de1626:	1be3      	subs	r3, r4, r7
c0de1628:	f000 fd78 	bl	c0de211c <bagl_hal_draw_rect>
c0de162c:	1bf1      	subs	r1, r6, r7
c0de162e:	4642      	mov	r2, r8
c0de1630:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de1634:	9f06      	ldr	r7, [sp, #24]
c0de1636:	2001      	movs	r0, #1
c0de1638:	2501      	movs	r5, #1
c0de163a:	9000      	str	r0, [sp, #0]
c0de163c:	4638      	mov	r0, r7
c0de163e:	f000 f8a7 	bl	c0de1790 <OUTLINED_FUNCTION_8>
c0de1642:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1644:	b378      	cbz	r0, c0de16a6 <bagl_draw_circle_helper+0x2d2>
c0de1646:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de1648:	46b8      	mov	r8, r7
c0de164a:	42a0      	cmp	r0, r4
c0de164c:	d115      	bne.n	c0de167a <bagl_draw_circle_helper+0x2a6>
c0de164e:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de1650:	9d15      	ldr	r5, [sp, #84]	@ 0x54
c0de1652:	2701      	movs	r7, #1
c0de1654:	1b06      	subs	r6, r0, r4
c0de1656:	e01b      	b.n	c0de1690 <bagl_draw_circle_helper+0x2bc>
c0de1658:	9f06      	ldr	r7, [sp, #24]
c0de165a:	4631      	mov	r1, r6
c0de165c:	4642      	mov	r2, r8
c0de165e:	4623      	mov	r3, r4
c0de1660:	9500      	str	r5, [sp, #0]
c0de1662:	f000 f870 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de1666:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1668:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de166c:	b1d8      	cbz	r0, c0de16a6 <bagl_draw_circle_helper+0x2d2>
c0de166e:	f000 f888 	bl	c0de1782 <OUTLINED_FUNCTION_7>
c0de1672:	1b02      	subs	r2, r0, r4
c0de1674:	f000 f867 	bl	c0de1746 <OUTLINED_FUNCTION_2>
c0de1678:	e015      	b.n	c0de16a6 <bagl_draw_circle_helper+0x2d2>
c0de167a:	9500      	str	r5, [sp, #0]
c0de167c:	9d15      	ldr	r5, [sp, #84]	@ 0x54
c0de167e:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1680:	2701      	movs	r7, #1
c0de1682:	1941      	adds	r1, r0, r5
c0de1684:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de1686:	1b06      	subs	r6, r0, r4
c0de1688:	9802      	ldr	r0, [sp, #8]
c0de168a:	4632      	mov	r2, r6
c0de168c:	f000 f856 	bl	c0de173c <OUTLINED_FUNCTION_1>
c0de1690:	9804      	ldr	r0, [sp, #16]
c0de1692:	9700      	str	r7, [sp, #0]
c0de1694:	4647      	mov	r7, r8
c0de1696:	4632      	mov	r2, r6
c0de1698:	1941      	adds	r1, r0, r5
c0de169a:	4640      	mov	r0, r8
c0de169c:	f8dd 803c 	ldr.w	r8, [sp, #60]	@ 0x3c
c0de16a0:	f000 f876 	bl	c0de1790 <OUTLINED_FUNCTION_8>
c0de16a4:	2501      	movs	r5, #1
c0de16a6:	1e60      	subs	r0, r4, #1
c0de16a8:	f10a 0a01 	add.w	sl, sl, #1
c0de16ac:	4603      	mov	r3, r0
c0de16ae:	f1bb 0f01 	cmp.w	fp, #1
c0de16b2:	bfbc      	itt	lt
c0de16b4:	4623      	movlt	r3, r4
c0de16b6:	2000      	movlt	r0, #0
c0de16b8:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de16ba:	ebab 0040 	sub.w	r0, fp, r0, lsl #1
c0de16be:	eb01 0b00 	add.w	fp, r1, r0
c0de16c2:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de16c4:	3102      	adds	r1, #2
c0de16c6:	9111      	str	r1, [sp, #68]	@ 0x44
c0de16c8:	3801      	subs	r0, #1
c0de16ca:	9015      	str	r0, [sp, #84]	@ 0x54
c0de16cc:	e6ca      	b.n	c0de1464 <bagl_draw_circle_helper+0x90>
c0de16ce:	b016      	add	sp, #88	@ 0x58
c0de16d0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de16d4 <bagl_draw_glyph>:
c0de16d4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de16d8:	b086      	sub	sp, #24
c0de16da:	688e      	ldr	r6, [r1, #8]
c0de16dc:	2e02      	cmp	r6, #2
c0de16de:	d81e      	bhi.n	c0de171e <bagl_draw_glyph+0x4a>
c0de16e0:	f9b0 8002 	ldrsh.w	r8, [r0, #2]
c0de16e4:	f9b0 a004 	ldrsh.w	sl, [r0, #4]
c0de16e8:	e9d1 b000 	ldrd	fp, r0, [r1]
c0de16ec:	460c      	mov	r4, r1
c0de16ee:	9005      	str	r0, [sp, #20]
c0de16f0:	68c8      	ldr	r0, [r1, #12]
c0de16f2:	f000 fc15 	bl	c0de1f20 <pic>
c0de16f6:	4605      	mov	r5, r0
c0de16f8:	6920      	ldr	r0, [r4, #16]
c0de16fa:	68a7      	ldr	r7, [r4, #8]
c0de16fc:	f000 fc10 	bl	c0de1f20 <pic>
c0de1700:	cc0e      	ldmia	r4!, {r1, r2, r3}
c0de1702:	4359      	muls	r1, r3
c0de1704:	9b05      	ldr	r3, [sp, #20]
c0de1706:	4351      	muls	r1, r2
c0de1708:	2201      	movs	r2, #1
c0de170a:	40b2      	lsls	r2, r6
c0de170c:	e9cd 0103 	strd	r0, r1, [sp, #12]
c0de1710:	4640      	mov	r0, r8
c0de1712:	4651      	mov	r1, sl
c0de1714:	e88d 00a4 	stmia.w	sp, {r2, r5, r7}
c0de1718:	465a      	mov	r2, fp
c0de171a:	f000 fce7 	bl	c0de20ec <bagl_hal_draw_bitmap_within_rect>
c0de171e:	b006      	add	sp, #24
c0de1720:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1724 <OUTLINED_FUNCTION_0>:
c0de1724:	2001      	movs	r0, #1
c0de1726:	9903      	ldr	r1, [sp, #12]
c0de1728:	4632      	mov	r2, r6
c0de172a:	4643      	mov	r3, r8
c0de172c:	9000      	str	r0, [sp, #0]
c0de172e:	19e0      	adds	r0, r4, r7
c0de1730:	462f      	mov	r7, r5
c0de1732:	2501      	movs	r5, #1
c0de1734:	4401      	add	r1, r0
c0de1736:	4638      	mov	r0, r7
c0de1738:	f000 bcf0 	b.w	c0de211c <bagl_hal_draw_rect>

c0de173c <OUTLINED_FUNCTION_1>:
c0de173c:	eb00 030a 	add.w	r3, r0, sl
c0de1740:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de1742:	f000 bceb 	b.w	c0de211c <bagl_hal_draw_rect>

c0de1746 <OUTLINED_FUNCTION_2>:
c0de1746:	4638      	mov	r0, r7
c0de1748:	f000 bce8 	b.w	c0de211c <bagl_hal_draw_rect>

c0de174c <OUTLINED_FUNCTION_3>:
c0de174c:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de1750:	4720      	bx	r4

c0de1752 <OUTLINED_FUNCTION_4>:
c0de1752:	8920      	ldrh	r0, [r4, #8]
c0de1754:	f9b4 7002 	ldrsh.w	r7, [r4, #2]
c0de1758:	f9b4 2004 	ldrsh.w	r2, [r4, #4]
c0de175c:	88e3      	ldrh	r3, [r4, #6]
c0de175e:	eba0 0145 	sub.w	r1, r0, r5, lsl #1
c0de1762:	4770      	bx	lr

c0de1764 <OUTLINED_FUNCTION_5>:
c0de1764:	8920      	ldrh	r0, [r4, #8]
c0de1766:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
c0de176a:	f9b4 1002 	ldrsh.w	r1, [r4, #2]
c0de176e:	eba0 0245 	sub.w	r2, r0, r5, lsl #1
c0de1772:	4770      	bx	lr

c0de1774 <OUTLINED_FUNCTION_6>:
c0de1774:	9804      	ldr	r0, [sp, #16]
c0de1776:	9500      	str	r5, [sp, #0]
c0de1778:	4632      	mov	r2, r6
c0de177a:	4643      	mov	r3, r8
c0de177c:	eb00 010a 	add.w	r1, r0, sl
c0de1780:	4770      	bx	lr

c0de1782 <OUTLINED_FUNCTION_7>:
c0de1782:	9815      	ldr	r0, [sp, #84]	@ 0x54
c0de1784:	9913      	ldr	r1, [sp, #76]	@ 0x4c
c0de1786:	4653      	mov	r3, sl
c0de1788:	9500      	str	r5, [sp, #0]
c0de178a:	4401      	add	r1, r0
c0de178c:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0de178e:	4770      	bx	lr

c0de1790 <OUTLINED_FUNCTION_8>:
c0de1790:	4643      	mov	r3, r8
c0de1792:	f000 bcc3 	b.w	c0de211c <bagl_hal_draw_rect>

c0de1796 <app_ticker_event_callback>:
c0de1796:	4770      	bx	lr

c0de1798 <io_event>:
c0de1798:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de179a:	4dd8      	ldr	r5, [pc, #864]	@ (c0de1afc <io_event+0x364>)
c0de179c:	f819 0005 	ldrb.w	r0, [r9, r5]
c0de17a0:	280e      	cmp	r0, #14
c0de17a2:	d053      	beq.n	c0de184c <io_event+0xb4>
c0de17a4:	2805      	cmp	r0, #5
c0de17a6:	f040 809e 	bne.w	c0de18e6 <io_event+0x14e>
c0de17aa:	4ed5      	ldr	r6, [pc, #852]	@ (c0de1b00 <io_event+0x368>)
c0de17ac:	2001      	movs	r0, #1
c0de17ae:	f809 0006 	strb.w	r0, [r9, r6]
c0de17b2:	eb09 0406 	add.w	r4, r9, r6
c0de17b6:	2000      	movs	r0, #0
c0de17b8:	6060      	str	r0, [r4, #4]
c0de17ba:	4620      	mov	r0, r4
c0de17bc:	f000 fc1c 	bl	c0de1ff8 <os_ux>
c0de17c0:	f000 f9cf 	bl	c0de1b62 <OUTLINED_FUNCTION_6>
c0de17c4:	2800      	cmp	r0, #0
c0de17c6:	6060      	str	r0, [r4, #4]
c0de17c8:	f000 8196 	beq.w	c0de1af8 <io_event+0x360>
c0de17cc:	2897      	cmp	r0, #151	@ 0x97
c0de17ce:	f000 8193 	beq.w	c0de1af8 <io_event+0x360>
c0de17d2:	4ccc      	ldr	r4, [pc, #816]	@ (c0de1b04 <io_event+0x36c>)
c0de17d4:	2869      	cmp	r0, #105	@ 0x69
c0de17d6:	f040 815c 	bne.w	c0de1a92 <io_event+0x2fa>
c0de17da:	eb09 0504 	add.w	r5, r9, r4
c0de17de:	f7fe ffa7 	bl	c0de0730 <io_seph_ux_init_button>
c0de17e2:	2000      	movs	r0, #0
c0de17e4:	444e      	add	r6, r9
c0de17e6:	f8a5 00ca 	strh.w	r0, [r5, #202]	@ 0xca
c0de17ea:	f000 f9ba 	bl	c0de1b62 <OUTLINED_FUNCTION_6>
c0de17ee:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de17f2:	6070      	str	r0, [r6, #4]
c0de17f4:	2900      	cmp	r1, #0
c0de17f6:	f000 817f 	beq.w	c0de1af8 <io_event+0x360>
c0de17fa:	2800      	cmp	r0, #0
c0de17fc:	f000 817c 	beq.w	c0de1af8 <io_event+0x360>
c0de1800:	2897      	cmp	r0, #151	@ 0x97
c0de1802:	f000 8179 	beq.w	c0de1af8 <io_event+0x360>
c0de1806:	f000 f989 	bl	c0de1b1c <OUTLINED_FUNCTION_1>
c0de180a:	f080 8175 	bcs.w	c0de1af8 <io_event+0x360>
c0de180e:	f000 fbb4 	bl	c0de1f7a <os_perso_isonboarded>
c0de1812:	28aa      	cmp	r0, #170	@ 0xaa
c0de1814:	d104      	bne.n	c0de1820 <io_event+0x88>
c0de1816:	f000 fbe6 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de181a:	28aa      	cmp	r0, #170	@ 0xaa
c0de181c:	f040 816c 	bne.w	c0de1af8 <io_event+0x360>
c0de1820:	f000 f99a 	bl	c0de1b58 <OUTLINED_FUNCTION_5>
c0de1824:	f000 f991 	bl	c0de1b4a <OUTLINED_FUNCTION_4>
c0de1828:	f080 8163 	bcs.w	c0de1af2 <io_event+0x35a>
c0de182c:	f000 f96c 	bl	c0de1b08 <OUTLINED_FUNCTION_0>
c0de1830:	d003      	beq.n	c0de183a <io_event+0xa2>
c0de1832:	4798      	blx	r3
c0de1834:	b138      	cbz	r0, c0de1846 <io_event+0xae>
c0de1836:	f000 f981 	bl	c0de1b3c <OUTLINED_FUNCTION_3>
c0de183a:	2801      	cmp	r0, #1
c0de183c:	bf08      	it	eq
c0de183e:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1842:	f7fe ff88 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1846:	f000 f971 	bl	c0de1b2c <OUTLINED_FUNCTION_2>
c0de184a:	e7eb      	b.n	c0de1824 <io_event+0x8c>
c0de184c:	f7ff ffa3 	bl	c0de1796 <app_ticker_event_callback>
c0de1850:	4eab      	ldr	r6, [pc, #684]	@ (c0de1b00 <io_event+0x368>)
c0de1852:	2001      	movs	r0, #1
c0de1854:	2700      	movs	r7, #0
c0de1856:	eb09 0506 	add.w	r5, r9, r6
c0de185a:	f809 0006 	strb.w	r0, [r9, r6]
c0de185e:	4628      	mov	r0, r5
c0de1860:	606f      	str	r7, [r5, #4]
c0de1862:	f000 fbc9 	bl	c0de1ff8 <os_ux>
c0de1866:	f000 f97c 	bl	c0de1b62 <OUTLINED_FUNCTION_6>
c0de186a:	2869      	cmp	r0, #105	@ 0x69
c0de186c:	6068      	str	r0, [r5, #4]
c0de186e:	f040 8085 	bne.w	c0de197c <io_event+0x1e4>
c0de1872:	4ca4      	ldr	r4, [pc, #656]	@ (c0de1b04 <io_event+0x36c>)
c0de1874:	eb09 0504 	add.w	r5, r9, r4
c0de1878:	f7fe ff5a 	bl	c0de0730 <io_seph_ux_init_button>
c0de187c:	2007      	movs	r0, #7
c0de187e:	f8a5 70ca 	strh.w	r7, [r5, #202]	@ 0xca
c0de1882:	444e      	add	r6, r9
c0de1884:	f000 fc1e 	bl	c0de20c4 <os_sched_last_status>
c0de1888:	f8d5 10cc 	ldr.w	r1, [r5, #204]	@ 0xcc
c0de188c:	6070      	str	r0, [r6, #4]
c0de188e:	2900      	cmp	r1, #0
c0de1890:	f000 8132 	beq.w	c0de1af8 <io_event+0x360>
c0de1894:	2800      	cmp	r0, #0
c0de1896:	f000 812f 	beq.w	c0de1af8 <io_event+0x360>
c0de189a:	2897      	cmp	r0, #151	@ 0x97
c0de189c:	f000 812c 	beq.w	c0de1af8 <io_event+0x360>
c0de18a0:	f000 f93c 	bl	c0de1b1c <OUTLINED_FUNCTION_1>
c0de18a4:	f080 8128 	bcs.w	c0de1af8 <io_event+0x360>
c0de18a8:	f000 fb67 	bl	c0de1f7a <os_perso_isonboarded>
c0de18ac:	28aa      	cmp	r0, #170	@ 0xaa
c0de18ae:	d104      	bne.n	c0de18ba <io_event+0x122>
c0de18b0:	f000 fb99 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de18b4:	28aa      	cmp	r0, #170	@ 0xaa
c0de18b6:	f040 811f 	bne.w	c0de1af8 <io_event+0x360>
c0de18ba:	f000 f94d 	bl	c0de1b58 <OUTLINED_FUNCTION_5>
c0de18be:	f000 f944 	bl	c0de1b4a <OUTLINED_FUNCTION_4>
c0de18c2:	f080 8116 	bcs.w	c0de1af2 <io_event+0x35a>
c0de18c6:	f000 f91f 	bl	c0de1b08 <OUTLINED_FUNCTION_0>
c0de18ca:	d003      	beq.n	c0de18d4 <io_event+0x13c>
c0de18cc:	4798      	blx	r3
c0de18ce:	b138      	cbz	r0, c0de18e0 <io_event+0x148>
c0de18d0:	f000 f934 	bl	c0de1b3c <OUTLINED_FUNCTION_3>
c0de18d4:	2801      	cmp	r0, #1
c0de18d6:	bf08      	it	eq
c0de18d8:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de18dc:	f7fe ff3b 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de18e0:	f000 f924 	bl	c0de1b2c <OUTLINED_FUNCTION_2>
c0de18e4:	e7eb      	b.n	c0de18be <io_event+0x126>
c0de18e6:	4d86      	ldr	r5, [pc, #536]	@ (c0de1b00 <io_event+0x368>)
c0de18e8:	2001      	movs	r0, #1
c0de18ea:	2600      	movs	r6, #0
c0de18ec:	eb09 0405 	add.w	r4, r9, r5
c0de18f0:	f809 0005 	strb.w	r0, [r9, r5]
c0de18f4:	4620      	mov	r0, r4
c0de18f6:	6066      	str	r6, [r4, #4]
c0de18f8:	f000 fb7e 	bl	c0de1ff8 <os_ux>
c0de18fc:	f000 f931 	bl	c0de1b62 <OUTLINED_FUNCTION_6>
c0de1900:	6060      	str	r0, [r4, #4]
c0de1902:	4c80      	ldr	r4, [pc, #512]	@ (c0de1b04 <io_event+0x36c>)
c0de1904:	2869      	cmp	r0, #105	@ 0x69
c0de1906:	f040 809e 	bne.w	c0de1a46 <io_event+0x2ae>
c0de190a:	eb09 0704 	add.w	r7, r9, r4
c0de190e:	f7fe ff0f 	bl	c0de0730 <io_seph_ux_init_button>
c0de1912:	2007      	movs	r0, #7
c0de1914:	f8a7 60ca 	strh.w	r6, [r7, #202]	@ 0xca
c0de1918:	444d      	add	r5, r9
c0de191a:	f000 fbd3 	bl	c0de20c4 <os_sched_last_status>
c0de191e:	f8d7 10cc 	ldr.w	r1, [r7, #204]	@ 0xcc
c0de1922:	6068      	str	r0, [r5, #4]
c0de1924:	2900      	cmp	r1, #0
c0de1926:	f000 80e7 	beq.w	c0de1af8 <io_event+0x360>
c0de192a:	2800      	cmp	r0, #0
c0de192c:	f000 80e4 	beq.w	c0de1af8 <io_event+0x360>
c0de1930:	2897      	cmp	r0, #151	@ 0x97
c0de1932:	f000 80e1 	beq.w	c0de1af8 <io_event+0x360>
c0de1936:	f000 f8f1 	bl	c0de1b1c <OUTLINED_FUNCTION_1>
c0de193a:	f080 80dd 	bcs.w	c0de1af8 <io_event+0x360>
c0de193e:	f000 fb1c 	bl	c0de1f7a <os_perso_isonboarded>
c0de1942:	28aa      	cmp	r0, #170	@ 0xaa
c0de1944:	d104      	bne.n	c0de1950 <io_event+0x1b8>
c0de1946:	f000 fb4e 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de194a:	28aa      	cmp	r0, #170	@ 0xaa
c0de194c:	f040 80d4 	bne.w	c0de1af8 <io_event+0x360>
c0de1950:	f000 f902 	bl	c0de1b58 <OUTLINED_FUNCTION_5>
c0de1954:	f000 f8f9 	bl	c0de1b4a <OUTLINED_FUNCTION_4>
c0de1958:	f080 80cb 	bcs.w	c0de1af2 <io_event+0x35a>
c0de195c:	f000 f8d4 	bl	c0de1b08 <OUTLINED_FUNCTION_0>
c0de1960:	d003      	beq.n	c0de196a <io_event+0x1d2>
c0de1962:	4798      	blx	r3
c0de1964:	b138      	cbz	r0, c0de1976 <io_event+0x1de>
c0de1966:	f000 f8e9 	bl	c0de1b3c <OUTLINED_FUNCTION_3>
c0de196a:	2801      	cmp	r0, #1
c0de196c:	bf08      	it	eq
c0de196e:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1972:	f7fe fef0 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1976:	f000 f8d9 	bl	c0de1b2c <OUTLINED_FUNCTION_2>
c0de197a:	e7eb      	b.n	c0de1954 <io_event+0x1bc>
c0de197c:	4d61      	ldr	r5, [pc, #388]	@ (c0de1b04 <io_event+0x36c>)
c0de197e:	4604      	mov	r4, r0
c0de1980:	eb09 0005 	add.w	r0, r9, r5
c0de1984:	f8d0 00e4 	ldr.w	r0, [r0, #228]	@ 0xe4
c0de1988:	b1a0      	cbz	r0, c0de19b4 <io_event+0x21c>
c0de198a:	f1b0 0264 	subs.w	r2, r0, #100	@ 0x64
c0de198e:	eb09 0105 	add.w	r1, r9, r5
c0de1992:	bf38      	it	cc
c0de1994:	2200      	movcc	r2, #0
c0de1996:	2864      	cmp	r0, #100	@ 0x64
c0de1998:	f8c1 20e4 	str.w	r2, [r1, #228]	@ 0xe4
c0de199c:	d80a      	bhi.n	c0de19b4 <io_event+0x21c>
c0de199e:	f8d1 10e0 	ldr.w	r1, [r1, #224]	@ 0xe0
c0de19a2:	b139      	cbz	r1, c0de19b4 <io_event+0x21c>
c0de19a4:	eb09 0005 	add.w	r0, r9, r5
c0de19a8:	f8d0 20e8 	ldr.w	r2, [r0, #232]	@ 0xe8
c0de19ac:	f8c0 20e4 	str.w	r2, [r0, #228]	@ 0xe4
c0de19b0:	2000      	movs	r0, #0
c0de19b2:	4788      	blx	r1
c0de19b4:	2c00      	cmp	r4, #0
c0de19b6:	f000 809f 	beq.w	c0de1af8 <io_event+0x360>
c0de19ba:	2c97      	cmp	r4, #151	@ 0x97
c0de19bc:	f000 809c 	beq.w	c0de1af8 <io_event+0x360>
c0de19c0:	eb09 0005 	add.w	r0, r9, r5
c0de19c4:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de19c8:	2800      	cmp	r0, #0
c0de19ca:	f000 8095 	beq.w	c0de1af8 <io_event+0x360>
c0de19ce:	eb09 0005 	add.w	r0, r9, r5
c0de19d2:	f890 10d0 	ldrb.w	r1, [r0, #208]	@ 0xd0
c0de19d6:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de19da:	4288      	cmp	r0, r1
c0de19dc:	f080 808c 	bcs.w	c0de1af8 <io_event+0x360>
c0de19e0:	f000 facb 	bl	c0de1f7a <os_perso_isonboarded>
c0de19e4:	28aa      	cmp	r0, #170	@ 0xaa
c0de19e6:	d104      	bne.n	c0de19f2 <io_event+0x25a>
c0de19e8:	f000 fafd 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de19ec:	28aa      	cmp	r0, #170	@ 0xaa
c0de19ee:	f040 8083 	bne.w	c0de1af8 <io_event+0x360>
c0de19f2:	eb09 0005 	add.w	r0, r9, r5
c0de19f6:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de19fa:	eb09 0105 	add.w	r1, r9, r5
c0de19fe:	f891 20d0 	ldrb.w	r2, [r1, #208]	@ 0xd0
c0de1a02:	b281      	uxth	r1, r0
c0de1a04:	4291      	cmp	r1, r2
c0de1a06:	d274      	bcs.n	c0de1af2 <io_event+0x35a>
c0de1a08:	eb09 0005 	add.w	r0, r9, r5
c0de1a0c:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1a10:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1a14:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1a18:	b13b      	cbz	r3, c0de1a2a <io_event+0x292>
c0de1a1a:	4798      	blx	r3
c0de1a1c:	b158      	cbz	r0, c0de1a36 <io_event+0x29e>
c0de1a1e:	eb09 0205 	add.w	r2, r9, r5
c0de1a22:	f8b2 10ca 	ldrh.w	r1, [r2, #202]	@ 0xca
c0de1a26:	f8d2 20cc 	ldr.w	r2, [r2, #204]	@ 0xcc
c0de1a2a:	2801      	cmp	r0, #1
c0de1a2c:	bf08      	it	eq
c0de1a2e:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1a32:	f7fe fe90 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1a36:	eb09 0105 	add.w	r1, r9, r5
c0de1a3a:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1a3e:	3001      	adds	r0, #1
c0de1a40:	f8a1 00ca 	strh.w	r0, [r1, #202]	@ 0xca
c0de1a44:	e7d9      	b.n	c0de19fa <io_event+0x262>
c0de1a46:	eb09 0004 	add.w	r0, r9, r4
c0de1a4a:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1a4e:	2800      	cmp	r0, #0
c0de1a50:	d052      	beq.n	c0de1af8 <io_event+0x360>
c0de1a52:	f000 f863 	bl	c0de1b1c <OUTLINED_FUNCTION_1>
c0de1a56:	d24f      	bcs.n	c0de1af8 <io_event+0x360>
c0de1a58:	f000 fa8f 	bl	c0de1f7a <os_perso_isonboarded>
c0de1a5c:	28aa      	cmp	r0, #170	@ 0xaa
c0de1a5e:	d103      	bne.n	c0de1a68 <io_event+0x2d0>
c0de1a60:	f000 fac1 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de1a64:	28aa      	cmp	r0, #170	@ 0xaa
c0de1a66:	d147      	bne.n	c0de1af8 <io_event+0x360>
c0de1a68:	f000 f876 	bl	c0de1b58 <OUTLINED_FUNCTION_5>
c0de1a6c:	f000 f86d 	bl	c0de1b4a <OUTLINED_FUNCTION_4>
c0de1a70:	d23f      	bcs.n	c0de1af2 <io_event+0x35a>
c0de1a72:	f000 f849 	bl	c0de1b08 <OUTLINED_FUNCTION_0>
c0de1a76:	d003      	beq.n	c0de1a80 <io_event+0x2e8>
c0de1a78:	4798      	blx	r3
c0de1a7a:	b138      	cbz	r0, c0de1a8c <io_event+0x2f4>
c0de1a7c:	f000 f85e 	bl	c0de1b3c <OUTLINED_FUNCTION_3>
c0de1a80:	2801      	cmp	r0, #1
c0de1a82:	bf08      	it	eq
c0de1a84:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1a88:	f7fe fe65 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1a8c:	f000 f84e 	bl	c0de1b2c <OUTLINED_FUNCTION_2>
c0de1a90:	e7ec      	b.n	c0de1a6c <io_event+0x2d4>
c0de1a92:	eb09 0004 	add.w	r0, r9, r4
c0de1a96:	f8d0 00dc 	ldr.w	r0, [r0, #220]	@ 0xdc
c0de1a9a:	b128      	cbz	r0, c0de1aa8 <io_event+0x310>
c0de1a9c:	eb09 0105 	add.w	r1, r9, r5
c0de1aa0:	78c9      	ldrb	r1, [r1, #3]
c0de1aa2:	0849      	lsrs	r1, r1, #1
c0de1aa4:	f7fe fe96 	bl	c0de07d4 <io_seproxyhal_button_push>
c0de1aa8:	eb09 0004 	add.w	r0, r9, r4
c0de1aac:	f8d0 00cc 	ldr.w	r0, [r0, #204]	@ 0xcc
c0de1ab0:	b310      	cbz	r0, c0de1af8 <io_event+0x360>
c0de1ab2:	f000 f833 	bl	c0de1b1c <OUTLINED_FUNCTION_1>
c0de1ab6:	d21f      	bcs.n	c0de1af8 <io_event+0x360>
c0de1ab8:	f000 fa5f 	bl	c0de1f7a <os_perso_isonboarded>
c0de1abc:	28aa      	cmp	r0, #170	@ 0xaa
c0de1abe:	d103      	bne.n	c0de1ac8 <io_event+0x330>
c0de1ac0:	f000 fa91 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de1ac4:	28aa      	cmp	r0, #170	@ 0xaa
c0de1ac6:	d117      	bne.n	c0de1af8 <io_event+0x360>
c0de1ac8:	f000 f846 	bl	c0de1b58 <OUTLINED_FUNCTION_5>
c0de1acc:	f000 f83d 	bl	c0de1b4a <OUTLINED_FUNCTION_4>
c0de1ad0:	d20f      	bcs.n	c0de1af2 <io_event+0x35a>
c0de1ad2:	f000 f819 	bl	c0de1b08 <OUTLINED_FUNCTION_0>
c0de1ad6:	d003      	beq.n	c0de1ae0 <io_event+0x348>
c0de1ad8:	4798      	blx	r3
c0de1ada:	b138      	cbz	r0, c0de1aec <io_event+0x354>
c0de1adc:	f000 f82e 	bl	c0de1b3c <OUTLINED_FUNCTION_3>
c0de1ae0:	2801      	cmp	r0, #1
c0de1ae2:	bf08      	it	eq
c0de1ae4:	eb02 1041 	addeq.w	r0, r2, r1, lsl #5
c0de1ae8:	f7fe fe35 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1aec:	f000 f81e 	bl	c0de1b2c <OUTLINED_FUNCTION_2>
c0de1af0:	e7ec      	b.n	c0de1acc <io_event+0x334>
c0de1af2:	bf08      	it	eq
c0de1af4:	f000 faf2 	bleq	c0de20dc <screen_update>
c0de1af8:	2001      	movs	r0, #1
c0de1afa:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de1afc:	000002b6 	.word	0x000002b6
c0de1b00:	000004d8 	.word	0x000004d8
c0de1b04:	000003c8 	.word	0x000003c8

c0de1b08 <OUTLINED_FUNCTION_0>:
c0de1b08:	eb09 0004 	add.w	r0, r9, r4
c0de1b0c:	f8d0 30d8 	ldr.w	r3, [r0, #216]	@ 0xd8
c0de1b10:	f8d0 20cc 	ldr.w	r2, [r0, #204]	@ 0xcc
c0de1b14:	eb02 1041 	add.w	r0, r2, r1, lsl #5
c0de1b18:	2b00      	cmp	r3, #0
c0de1b1a:	4770      	bx	lr

c0de1b1c <OUTLINED_FUNCTION_1>:
c0de1b1c:	eb09 0004 	add.w	r0, r9, r4
c0de1b20:	f890 10d0 	ldrb.w	r1, [r0, #208]	@ 0xd0
c0de1b24:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1b28:	4288      	cmp	r0, r1
c0de1b2a:	4770      	bx	lr

c0de1b2c <OUTLINED_FUNCTION_2>:
c0de1b2c:	eb09 0104 	add.w	r1, r9, r4
c0de1b30:	f8b1 00ca 	ldrh.w	r0, [r1, #202]	@ 0xca
c0de1b34:	3001      	adds	r0, #1
c0de1b36:	f8a1 00ca 	strh.w	r0, [r1, #202]	@ 0xca
c0de1b3a:	4770      	bx	lr

c0de1b3c <OUTLINED_FUNCTION_3>:
c0de1b3c:	eb09 0204 	add.w	r2, r9, r4
c0de1b40:	f8b2 10ca 	ldrh.w	r1, [r2, #202]	@ 0xca
c0de1b44:	f8d2 20cc 	ldr.w	r2, [r2, #204]	@ 0xcc
c0de1b48:	4770      	bx	lr

c0de1b4a <OUTLINED_FUNCTION_4>:
c0de1b4a:	eb09 0104 	add.w	r1, r9, r4
c0de1b4e:	f891 20d0 	ldrb.w	r2, [r1, #208]	@ 0xd0
c0de1b52:	b281      	uxth	r1, r0
c0de1b54:	4291      	cmp	r1, r2
c0de1b56:	4770      	bx	lr

c0de1b58 <OUTLINED_FUNCTION_5>:
c0de1b58:	eb09 0004 	add.w	r0, r9, r4
c0de1b5c:	f8b0 00ca 	ldrh.w	r0, [r0, #202]	@ 0xca
c0de1b60:	4770      	bx	lr

c0de1b62 <OUTLINED_FUNCTION_6>:
c0de1b62:	2007      	movs	r0, #7
c0de1b64:	f000 baae 	b.w	c0de20c4 <os_sched_last_status>

c0de1b68 <common_app_init>:
c0de1b68:	b580      	push	{r7, lr}
c0de1b6a:	4805      	ldr	r0, [pc, #20]	@ (c0de1b80 <common_app_init+0x18>)
c0de1b6c:	f44f 7188 	mov.w	r1, #272	@ 0x110
c0de1b70:	4448      	add	r0, r9
c0de1b72:	f000 faef 	bl	c0de2154 <__aeabi_memclr>
c0de1b76:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1b7a:	f7fe bff9 	b.w	c0de0b70 <io_seproxyhal_init>
c0de1b7e:	bf00      	nop
c0de1b80:	000003c8 	.word	0x000003c8

c0de1b84 <standalone_app_main>:
c0de1b84:	b510      	push	{r4, lr}
c0de1b86:	b08c      	sub	sp, #48	@ 0x30
c0de1b88:	466c      	mov	r4, sp
c0de1b8a:	4620      	mov	r0, r4
c0de1b8c:	f000 fb02 	bl	c0de2194 <setjmp>
c0de1b90:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de1b94:	0400      	lsls	r0, r0, #16
c0de1b96:	d108      	bne.n	c0de1baa <standalone_app_main+0x26>
c0de1b98:	4668      	mov	r0, sp
c0de1b9a:	f000 fa89 	bl	c0de20b0 <try_context_set>
c0de1b9e:	900a      	str	r0, [sp, #40]	@ 0x28
c0de1ba0:	f7ff ffe2 	bl	c0de1b68 <common_app_init>
c0de1ba4:	f7fe fa2c 	bl	c0de0000 <app_main>
c0de1ba8:	e005      	b.n	c0de1bb6 <standalone_app_main+0x32>
c0de1baa:	2000      	movs	r0, #0
c0de1bac:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de1bb0:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1bb2:	f000 fa7d 	bl	c0de20b0 <try_context_set>
c0de1bb6:	f000 fa73 	bl	c0de20a0 <try_context_get>
c0de1bba:	42a0      	cmp	r0, r4
c0de1bbc:	d102      	bne.n	c0de1bc4 <standalone_app_main+0x40>
c0de1bbe:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de1bc0:	f000 fa76 	bl	c0de20b0 <try_context_set>
c0de1bc4:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0de1bc8:	b908      	cbnz	r0, c0de1bce <standalone_app_main+0x4a>
c0de1bca:	f7fe fa3d 	bl	c0de0048 <app_exit>
c0de1bce:	f000 f9a0 	bl	c0de1f12 <os_longjmp>
c0de1bd2:	d4d4      	bmi.n	c0de1b7e <common_app_init+0x16>

c0de1bd4 <ux_flow_check_valid>:
c0de1bd4:	4808      	ldr	r0, [pc, #32]	@ (c0de1bf8 <ux_flow_check_valid+0x24>)
c0de1bd6:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1bda:	2901      	cmp	r1, #1
c0de1bdc:	bf84      	itt	hi
c0de1bde:	2000      	movhi	r0, #0
c0de1be0:	4770      	bxhi	lr
c0de1be2:	4448      	add	r0, r9
c0de1be4:	eb01 0141 	add.w	r1, r1, r1, lsl #1
c0de1be8:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de1bec:	8b00      	ldrh	r0, [r0, #24]
c0de1bee:	2800      	cmp	r0, #0
c0de1bf0:	bf18      	it	ne
c0de1bf2:	2001      	movne	r0, #1
c0de1bf4:	4770      	bx	lr
c0de1bf6:	bf00      	nop
c0de1bf8:	000003c8 	.word	0x000003c8

c0de1bfc <ux_flow_get_current>:
c0de1bfc:	b580      	push	{r7, lr}
c0de1bfe:	f7ff ffe9 	bl	c0de1bd4 <ux_flow_check_valid>
c0de1c02:	b178      	cbz	r0, c0de1c24 <ux_flow_get_current+0x28>
c0de1c04:	490a      	ldr	r1, [pc, #40]	@ (c0de1c30 <ux_flow_get_current+0x34>)
c0de1c06:	f000 f8a7 	bl	c0de1d58 <OUTLINED_FUNCTION_0>
c0de1c0a:	d00b      	beq.n	c0de1c24 <ux_flow_get_current+0x28>
c0de1c0c:	4449      	add	r1, r9
c0de1c0e:	eb01 0282 	add.w	r2, r1, r2, lsl #2
c0de1c12:	8c11      	ldrh	r1, [r2, #32]
c0de1c14:	8c92      	ldrh	r2, [r2, #36]	@ 0x24
c0de1c16:	4291      	cmp	r1, r2
c0de1c18:	d204      	bcs.n	c0de1c24 <ux_flow_get_current+0x28>
c0de1c1a:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1c1e:	f110 0f04 	cmn.w	r0, #4
c0de1c22:	d901      	bls.n	c0de1c28 <ux_flow_get_current+0x2c>
c0de1c24:	2000      	movs	r0, #0
c0de1c26:	bd80      	pop	{r7, pc}
c0de1c28:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1c2c:	f000 b978 	b.w	c0de1f20 <pic>
c0de1c30:	000003c8 	.word	0x000003c8

c0de1c34 <ux_flow_engine_init_step>:
c0de1c34:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1c38:	4604      	mov	r4, r0
c0de1c3a:	481c      	ldr	r0, [pc, #112]	@ (c0de1cac <ux_flow_engine_init_step+0x78>)
c0de1c3c:	eb04 0144 	add.w	r1, r4, r4, lsl #1
c0de1c40:	4448      	add	r0, r9
c0de1c42:	eb00 0681 	add.w	r6, r0, r1, lsl #2
c0de1c46:	f856 0f1c 	ldr.w	r0, [r6, #28]!
c0de1c4a:	4637      	mov	r7, r6
c0de1c4c:	f837 1f04 	ldrh.w	r1, [r7, #4]!
c0de1c50:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
c0de1c54:	f110 0f04 	cmn.w	r0, #4
c0de1c58:	bf88      	it	hi
c0de1c5a:	e8bd 81f0 	ldmiahi.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1c5e:	f000 f95f 	bl	c0de1f20 <pic>
c0de1c62:	8839      	ldrh	r1, [r7, #0]
c0de1c64:	6832      	ldr	r2, [r6, #0]
c0de1c66:	6805      	ldr	r5, [r0, #0]
c0de1c68:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de1c6c:	4608      	mov	r0, r1
c0de1c6e:	f000 f957 	bl	c0de1f20 <pic>
c0de1c72:	b13d      	cbz	r5, c0de1c84 <ux_flow_engine_init_step+0x50>
c0de1c74:	6800      	ldr	r0, [r0, #0]
c0de1c76:	f000 f953 	bl	c0de1f20 <pic>
c0de1c7a:	4601      	mov	r1, r0
c0de1c7c:	4620      	mov	r0, r4
c0de1c7e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de1c82:	4708      	bx	r1
c0de1c84:	6880      	ldr	r0, [r0, #8]
c0de1c86:	4d0a      	ldr	r5, [pc, #40]	@ (c0de1cb0 <ux_flow_engine_init_step+0x7c>)
c0de1c88:	447d      	add	r5, pc
c0de1c8a:	47a8      	blx	r5
c0de1c8c:	4680      	mov	r8, r0
c0de1c8e:	8838      	ldrh	r0, [r7, #0]
c0de1c90:	6831      	ldr	r1, [r6, #0]
c0de1c92:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
c0de1c96:	47a8      	blx	r5
c0de1c98:	6840      	ldr	r0, [r0, #4]
c0de1c9a:	47a8      	blx	r5
c0de1c9c:	4602      	mov	r2, r0
c0de1c9e:	4620      	mov	r0, r4
c0de1ca0:	4641      	mov	r1, r8
c0de1ca2:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de1ca6:	f000 b805 	b.w	c0de1cb4 <ux_flow_init>
c0de1caa:	bf00      	nop
c0de1cac:	000003c8 	.word	0x000003c8
c0de1cb0:	00000295 	.word	0x00000295

c0de1cb4 <ux_flow_init>:
c0de1cb4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1cb6:	b100      	cbz	r0, c0de1cba <ux_flow_init+0x6>
c0de1cb8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de1cba:	4e1e      	ldr	r6, [pc, #120]	@ (c0de1d34 <ux_flow_init+0x80>)
c0de1cbc:	460d      	mov	r5, r1
c0de1cbe:	2122      	movs	r1, #34	@ 0x22
c0de1cc0:	4614      	mov	r4, r2
c0de1cc2:	eb09 0006 	add.w	r0, r9, r6
c0de1cc6:	3004      	adds	r0, #4
c0de1cc8:	f000 fa44 	bl	c0de2154 <__aeabi_memclr>
c0de1ccc:	2d00      	cmp	r5, #0
c0de1cce:	d0f3      	beq.n	c0de1cb8 <ux_flow_init+0x4>
c0de1cd0:	4628      	mov	r0, r5
c0de1cd2:	eb09 0706 	add.w	r7, r9, r6
c0de1cd6:	f000 f923 	bl	c0de1f20 <pic>
c0de1cda:	8cb9      	ldrh	r1, [r7, #36]	@ 0x24
c0de1cdc:	61f8      	str	r0, [r7, #28]
c0de1cde:	b28a      	uxth	r2, r1
c0de1ce0:	f850 2022 	ldr.w	r2, [r0, r2, lsl #2]
c0de1ce4:	3201      	adds	r2, #1
c0de1ce6:	d004      	beq.n	c0de1cf2 <ux_flow_init+0x3e>
c0de1ce8:	eb09 0206 	add.w	r2, r9, r6
c0de1cec:	3101      	adds	r1, #1
c0de1cee:	8491      	strh	r1, [r2, #36]	@ 0x24
c0de1cf0:	e7f5      	b.n	c0de1cde <ux_flow_init+0x2a>
c0de1cf2:	b1cc      	cbz	r4, c0de1d28 <ux_flow_init+0x74>
c0de1cf4:	4620      	mov	r0, r4
c0de1cf6:	eb09 0506 	add.w	r5, r9, r6
c0de1cfa:	f000 f911 	bl	c0de1f20 <pic>
c0de1cfe:	4604      	mov	r4, r0
c0de1d00:	8c28      	ldrh	r0, [r5, #32]
c0de1d02:	eb09 0106 	add.w	r1, r9, r6
c0de1d06:	b280      	uxth	r0, r0
c0de1d08:	69c9      	ldr	r1, [r1, #28]
c0de1d0a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
c0de1d0e:	1c41      	adds	r1, r0, #1
c0de1d10:	d00a      	beq.n	c0de1d28 <ux_flow_init+0x74>
c0de1d12:	f000 f905 	bl	c0de1f20 <pic>
c0de1d16:	42a0      	cmp	r0, r4
c0de1d18:	d006      	beq.n	c0de1d28 <ux_flow_init+0x74>
c0de1d1a:	eb09 0106 	add.w	r1, r9, r6
c0de1d1e:	8c08      	ldrh	r0, [r1, #32]
c0de1d20:	8448      	strh	r0, [r1, #34]	@ 0x22
c0de1d22:	3001      	adds	r0, #1
c0de1d24:	8408      	strh	r0, [r1, #32]
c0de1d26:	e7ec      	b.n	c0de1d02 <ux_flow_init+0x4e>
c0de1d28:	2000      	movs	r0, #0
c0de1d2a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de1d2e:	f7ff bf81 	b.w	c0de1c34 <ux_flow_engine_init_step>
c0de1d32:	bf00      	nop
c0de1d34:	000003c8 	.word	0x000003c8

c0de1d38 <ux_flow_relayout>:
c0de1d38:	b580      	push	{r7, lr}
c0de1d3a:	f7ff ff5f 	bl	c0de1bfc <ux_flow_get_current>
c0de1d3e:	b138      	cbz	r0, c0de1d50 <ux_flow_relayout+0x18>
c0de1d40:	4804      	ldr	r0, [pc, #16]	@ (c0de1d54 <ux_flow_relayout+0x1c>)
c0de1d42:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de1d46:	3801      	subs	r0, #1
c0de1d48:	f7ff ff74 	bl	c0de1c34 <ux_flow_engine_init_step>
c0de1d4c:	2001      	movs	r0, #1
c0de1d4e:	bd80      	pop	{r7, pc}
c0de1d50:	2000      	movs	r0, #0
c0de1d52:	bd80      	pop	{r7, pc}
c0de1d54:	000003c8 	.word	0x000003c8

c0de1d58 <OUTLINED_FUNCTION_0>:
c0de1d58:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de1d5c:	eb09 0001 	add.w	r0, r9, r1
c0de1d60:	3a01      	subs	r2, #1
c0de1d62:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1d66:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de1d6a:	69c0      	ldr	r0, [r0, #28]
c0de1d6c:	2800      	cmp	r0, #0
c0de1d6e:	4770      	bx	lr

c0de1d70 <ux_stack_redisplay>:
c0de1d70:	b580      	push	{r7, lr}
c0de1d72:	f7ff ffe1 	bl	c0de1d38 <ux_flow_relayout>
c0de1d76:	b100      	cbz	r0, c0de1d7a <ux_stack_redisplay+0xa>
c0de1d78:	bd80      	pop	{r7, pc}
c0de1d7a:	480c      	ldr	r0, [pc, #48]	@ (c0de1dac <ux_stack_redisplay+0x3c>)
c0de1d7c:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1d80:	2901      	cmp	r1, #1
c0de1d82:	d108      	bne.n	c0de1d96 <ux_stack_redisplay+0x26>
c0de1d84:	4448      	add	r0, r9
c0de1d86:	2100      	movs	r1, #0
c0de1d88:	f8a0 10ca 	strh.w	r1, [r0, #202]	@ 0xca
c0de1d8c:	2000      	movs	r0, #0
c0de1d8e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1d92:	f000 b80d 	b.w	c0de1db0 <ux_stack_display>
c0de1d96:	2900      	cmp	r1, #0
c0de1d98:	d1ee      	bne.n	c0de1d78 <ux_stack_redisplay+0x8>
c0de1d9a:	eb09 0100 	add.w	r1, r9, r0
c0de1d9e:	7849      	ldrb	r1, [r1, #1]
c0de1da0:	29aa      	cmp	r1, #170	@ 0xaa
c0de1da2:	bf02      	ittt	eq
c0de1da4:	4448      	addeq	r0, r9
c0de1da6:	2169      	moveq	r1, #105	@ 0x69
c0de1da8:	7041      	strbeq	r1, [r0, #1]
c0de1daa:	bd80      	pop	{r7, pc}
c0de1dac:	000003c8 	.word	0x000003c8

c0de1db0 <ux_stack_display>:
c0de1db0:	490e      	ldr	r1, [pc, #56]	@ (c0de1dec <ux_stack_display+0x3c>)
c0de1db2:	1c43      	adds	r3, r0, #1
c0de1db4:	f819 2001 	ldrb.w	r2, [r9, r1]
c0de1db8:	b162      	cbz	r2, c0de1dd4 <ux_stack_display+0x24>
c0de1dba:	4293      	cmp	r3, r2
c0de1dbc:	d10a      	bne.n	c0de1dd4 <ux_stack_display+0x24>
c0de1dbe:	4449      	add	r1, r9
c0de1dc0:	eb00 00c0 	add.w	r0, r0, r0, lsl #3
c0de1dc4:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de1dc8:	2100      	movs	r1, #0
c0de1dca:	f8a0 10ca 	strh.w	r1, [r0, #202]	@ 0xca
c0de1dce:	30c8      	adds	r0, #200	@ 0xc8
c0de1dd0:	f000 b828 	b.w	c0de1e24 <ux_stack_display_elements>
c0de1dd4:	b103      	cbz	r3, c0de1dd8 <ux_stack_display+0x28>
c0de1dd6:	b942      	cbnz	r2, c0de1dea <ux_stack_display+0x3a>
c0de1dd8:	eb09 0001 	add.w	r0, r9, r1
c0de1ddc:	7840      	ldrb	r0, [r0, #1]
c0de1dde:	28aa      	cmp	r0, #170	@ 0xaa
c0de1de0:	bf02      	ittt	eq
c0de1de2:	eb09 0001 	addeq.w	r0, r9, r1
c0de1de6:	2169      	moveq	r1, #105	@ 0x69
c0de1de8:	7041      	strbeq	r1, [r0, #1]
c0de1dea:	4770      	bx	lr
c0de1dec:	000003c8 	.word	0x000003c8

c0de1df0 <ux_stack_display_element_callback>:
c0de1df0:	b510      	push	{r4, lr}
c0de1df2:	4604      	mov	r4, r0
c0de1df4:	480a      	ldr	r0, [pc, #40]	@ (c0de1e20 <ux_stack_display_element_callback+0x30>)
c0de1df6:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de1dfa:	b179      	cbz	r1, c0de1e1c <ux_stack_display_element_callback+0x2c>
c0de1dfc:	4448      	add	r0, r9
c0de1dfe:	eb01 01c1 	add.w	r1, r1, r1, lsl #3
c0de1e02:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de1e06:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de1e0a:	b139      	cbz	r1, c0de1e1c <ux_stack_display_element_callback+0x2c>
c0de1e0c:	4620      	mov	r0, r4
c0de1e0e:	4788      	blx	r1
c0de1e10:	b118      	cbz	r0, c0de1e1a <ux_stack_display_element_callback+0x2a>
c0de1e12:	2801      	cmp	r0, #1
c0de1e14:	bf18      	it	ne
c0de1e16:	4604      	movne	r4, r0
c0de1e18:	e000      	b.n	c0de1e1c <ux_stack_display_element_callback+0x2c>
c0de1e1a:	2400      	movs	r4, #0
c0de1e1c:	4620      	mov	r0, r4
c0de1e1e:	bd10      	pop	{r4, pc}
c0de1e20:	000003c8 	.word	0x000003c8

c0de1e24 <ux_stack_display_elements>:
c0de1e24:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de1e28:	4604      	mov	r4, r0
c0de1e2a:	f000 f8a6 	bl	c0de1f7a <os_perso_isonboarded>
c0de1e2e:	28aa      	cmp	r0, #170	@ 0xaa
c0de1e30:	d103      	bne.n	c0de1e3a <ux_stack_display_elements+0x16>
c0de1e32:	f000 f8d8 	bl	c0de1fe6 <os_global_pin_is_validated>
c0de1e36:	28aa      	cmp	r0, #170	@ 0xaa
c0de1e38:	d141      	bne.n	c0de1ebe <ux_stack_display_elements+0x9a>
c0de1e3a:	f8df a088 	ldr.w	sl, [pc, #136]	@ c0de1ec4 <ux_stack_display_elements+0xa0>
c0de1e3e:	2101      	movs	r1, #1
c0de1e40:	2000      	movs	r0, #0
c0de1e42:	07c9      	lsls	r1, r1, #31
c0de1e44:	d027      	beq.n	c0de1e96 <ux_stack_display_elements+0x72>
c0de1e46:	7861      	ldrb	r1, [r4, #1]
c0de1e48:	b329      	cbz	r1, c0de1e96 <ux_stack_display_elements+0x72>
c0de1e4a:	8862      	ldrh	r2, [r4, #2]
c0de1e4c:	7a21      	ldrb	r1, [r4, #8]
c0de1e4e:	1a17      	subs	r7, r2, r0
c0de1e50:	0152      	lsls	r2, r2, #5
c0de1e52:	eb00 0801 	add.w	r8, r0, r1
c0de1e56:	eba2 1640 	sub.w	r6, r2, r0, lsl #5
c0de1e5a:	b2c8      	uxtb	r0, r1
c0de1e5c:	4287      	cmp	r7, r0
c0de1e5e:	d217      	bcs.n	c0de1e90 <ux_stack_display_elements+0x6c>
c0de1e60:	8860      	ldrh	r0, [r4, #2]
c0de1e62:	3001      	adds	r0, #1
c0de1e64:	8060      	strh	r0, [r4, #2]
c0de1e66:	6860      	ldr	r0, [r4, #4]
c0de1e68:	1985      	adds	r5, r0, r6
c0de1e6a:	4628      	mov	r0, r5
c0de1e6c:	f7ff ffc0 	bl	c0de1df0 <ux_stack_display_element_callback>
c0de1e70:	b130      	cbz	r0, c0de1e80 <ux_stack_display_elements+0x5c>
c0de1e72:	2801      	cmp	r0, #1
c0de1e74:	bf18      	it	ne
c0de1e76:	4605      	movne	r5, r0
c0de1e78:	4628      	mov	r0, r5
c0de1e7a:	f7fe fc6c 	bl	c0de0756 <io_seph_ux_display_bagl_element>
c0de1e7e:	e003      	b.n	c0de1e88 <ux_stack_display_elements+0x64>
c0de1e80:	eb09 000a 	add.w	r0, r9, sl
c0de1e84:	7840      	ldrb	r0, [r0, #1]
c0de1e86:	b9d0      	cbnz	r0, c0de1ebe <ux_stack_display_elements+0x9a>
c0de1e88:	7a21      	ldrb	r1, [r4, #8]
c0de1e8a:	3620      	adds	r6, #32
c0de1e8c:	3701      	adds	r7, #1
c0de1e8e:	e7e4      	b.n	c0de1e5a <ux_stack_display_elements+0x36>
c0de1e90:	2100      	movs	r1, #0
c0de1e92:	4640      	mov	r0, r8
c0de1e94:	e7d5      	b.n	c0de1e42 <ux_stack_display_elements+0x1e>
c0de1e96:	8861      	ldrh	r1, [r4, #2]
c0de1e98:	4288      	cmp	r0, r1
c0de1e9a:	d110      	bne.n	c0de1ebe <ux_stack_display_elements+0x9a>
c0de1e9c:	f000 f91e 	bl	c0de20dc <screen_update>
c0de1ea0:	8860      	ldrh	r0, [r4, #2]
c0de1ea2:	68e1      	ldr	r1, [r4, #12]
c0de1ea4:	3001      	adds	r0, #1
c0de1ea6:	8060      	strh	r0, [r4, #2]
c0de1ea8:	b119      	cbz	r1, c0de1eb2 <ux_stack_display_elements+0x8e>
c0de1eaa:	2000      	movs	r0, #0
c0de1eac:	2500      	movs	r5, #0
c0de1eae:	4788      	blx	r1
c0de1eb0:	b108      	cbz	r0, c0de1eb6 <ux_stack_display_elements+0x92>
c0de1eb2:	7825      	ldrb	r5, [r4, #0]
c0de1eb4:	e000      	b.n	c0de1eb8 <ux_stack_display_elements+0x94>
c0de1eb6:	8065      	strh	r5, [r4, #2]
c0de1eb8:	eb09 000a 	add.w	r0, r9, sl
c0de1ebc:	7045      	strb	r5, [r0, #1]
c0de1ebe:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de1ec2:	bf00      	nop
c0de1ec4:	000003c8 	.word	0x000003c8

c0de1ec8 <cx_ecfp_generate_pair_no_throw>:
c0de1ec8:	b403      	push	{r0, r1}
c0de1eca:	f04f 0032 	mov.w	r0, #50	@ 0x32
c0de1ece:	f000 b819 	b.w	c0de1f04 <cx_trampoline_helper>

c0de1ed2 <cx_ecfp_init_private_key_no_throw>:
c0de1ed2:	b403      	push	{r0, r1}
c0de1ed4:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0de1ed8:	f000 b814 	b.w	c0de1f04 <cx_trampoline_helper>

c0de1edc <cx_eddsa_sign_no_throw>:
c0de1edc:	b403      	push	{r0, r1}
c0de1ede:	f04f 003a 	mov.w	r0, #58	@ 0x3a
c0de1ee2:	f000 b80f 	b.w	c0de1f04 <cx_trampoline_helper>

c0de1ee6 <cx_hash_no_throw>:
c0de1ee6:	b403      	push	{r0, r1}
c0de1ee8:	f04f 0044 	mov.w	r0, #68	@ 0x44
c0de1eec:	f000 b80a 	b.w	c0de1f04 <cx_trampoline_helper>

c0de1ef0 <cx_sha256_init_no_throw>:
c0de1ef0:	b403      	push	{r0, r1}
c0de1ef2:	f04f 0071 	mov.w	r0, #113	@ 0x71
c0de1ef6:	f000 b805 	b.w	c0de1f04 <cx_trampoline_helper>
c0de1efa:	d4d4      	bmi.n	c0de1ea6 <ux_stack_display_elements+0x82>

c0de1efc <cx_aes_siv_reset>:
c0de1efc:	b403      	push	{r0, r1}
c0de1efe:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0de1f02:	e7ff      	b.n	c0de1f04 <cx_trampoline_helper>

c0de1f04 <cx_trampoline_helper>:
c0de1f04:	4900      	ldr	r1, [pc, #0]	@ (c0de1f08 <cx_trampoline_helper+0x4>)
c0de1f06:	4708      	bx	r1
c0de1f08:	00210001 	.word	0x00210001

c0de1f0c <os_boot>:
c0de1f0c:	2000      	movs	r0, #0
c0de1f0e:	f000 b8cf 	b.w	c0de20b0 <try_context_set>

c0de1f12 <os_longjmp>:
c0de1f12:	4604      	mov	r4, r0
c0de1f14:	f000 f8c4 	bl	c0de20a0 <try_context_get>
c0de1f18:	4621      	mov	r1, r4
c0de1f1a:	f000 f941 	bl	c0de21a0 <longjmp>
c0de1f1e:	d4d4      	bmi.n	c0de1eca <cx_ecfp_generate_pair_no_throw+0x2>

c0de1f20 <pic>:
c0de1f20:	4a0a      	ldr	r2, [pc, #40]	@ (c0de1f4c <pic+0x2c>)
c0de1f22:	4282      	cmp	r2, r0
c0de1f24:	490a      	ldr	r1, [pc, #40]	@ (c0de1f50 <pic+0x30>)
c0de1f26:	d806      	bhi.n	c0de1f36 <pic+0x16>
c0de1f28:	4281      	cmp	r1, r0
c0de1f2a:	d304      	bcc.n	c0de1f36 <pic+0x16>
c0de1f2c:	b580      	push	{r7, lr}
c0de1f2e:	f000 f815 	bl	c0de1f5c <pic_internal>
c0de1f32:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de1f36:	4907      	ldr	r1, [pc, #28]	@ (c0de1f54 <pic+0x34>)
c0de1f38:	4288      	cmp	r0, r1
c0de1f3a:	4a07      	ldr	r2, [pc, #28]	@ (c0de1f58 <pic+0x38>)
c0de1f3c:	d304      	bcc.n	c0de1f48 <pic+0x28>
c0de1f3e:	4290      	cmp	r0, r2
c0de1f40:	d802      	bhi.n	c0de1f48 <pic+0x28>
c0de1f42:	1a40      	subs	r0, r0, r1
c0de1f44:	4649      	mov	r1, r9
c0de1f46:	4408      	add	r0, r1
c0de1f48:	4770      	bx	lr
c0de1f4a:	0000      	movs	r0, r0
c0de1f4c:	c0de0000 	.word	0xc0de0000
c0de1f50:	c0de2e11 	.word	0xc0de2e11
c0de1f54:	da7a0000 	.word	0xda7a0000
c0de1f58:	da7a7000 	.word	0xda7a7000

c0de1f5c <pic_internal>:
c0de1f5c:	467a      	mov	r2, pc
c0de1f5e:	4902      	ldr	r1, [pc, #8]	@ (c0de1f68 <pic_internal+0xc>)
c0de1f60:	1cc9      	adds	r1, r1, #3
c0de1f62:	1a89      	subs	r1, r1, r2
c0de1f64:	1a40      	subs	r0, r0, r1
c0de1f66:	4770      	bx	lr
c0de1f68:	c0de1f5d 	.word	0xc0de1f5d

c0de1f6c <SVC_Call>:
c0de1f6c:	df01      	svc	1
c0de1f6e:	2900      	cmp	r1, #0
c0de1f70:	d100      	bne.n	c0de1f74 <exception>
c0de1f72:	4770      	bx	lr

c0de1f74 <exception>:
c0de1f74:	4608      	mov	r0, r1
c0de1f76:	f7ff ffcc 	bl	c0de1f12 <os_longjmp>

c0de1f7a <os_perso_isonboarded>:
c0de1f7a:	b5e0      	push	{r5, r6, r7, lr}
c0de1f7c:	2000      	movs	r0, #0
c0de1f7e:	4669      	mov	r1, sp
c0de1f80:	9001      	str	r0, [sp, #4]
c0de1f82:	209f      	movs	r0, #159	@ 0x9f
c0de1f84:	f7ff fff2 	bl	c0de1f6c <SVC_Call>
c0de1f88:	b2c0      	uxtb	r0, r0
c0de1f8a:	bd8c      	pop	{r2, r3, r7, pc}

c0de1f8c <os_perso_derive_node_with_seed_key>:
c0de1f8c:	b510      	push	{r4, lr}
c0de1f8e:	b088      	sub	sp, #32
c0de1f90:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0de1f92:	9407      	str	r4, [sp, #28]
c0de1f94:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de1f96:	9406      	str	r4, [sp, #24]
c0de1f98:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de1f9a:	9405      	str	r4, [sp, #20]
c0de1f9c:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de1f9e:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0de1fa2:	4803      	ldr	r0, [pc, #12]	@ (c0de1fb0 <os_perso_derive_node_with_seed_key+0x24>)
c0de1fa4:	4669      	mov	r1, sp
c0de1fa6:	f7ff ffe1 	bl	c0de1f6c <SVC_Call>
c0de1faa:	b008      	add	sp, #32
c0de1fac:	bd10      	pop	{r4, pc}
c0de1fae:	bf00      	nop
c0de1fb0:	080000a6 	.word	0x080000a6

c0de1fb4 <os_pki_load_certificate>:
c0de1fb4:	b510      	push	{r4, lr}
c0de1fb6:	b086      	sub	sp, #24
c0de1fb8:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de1fba:	9405      	str	r4, [sp, #20]
c0de1fbc:	9c08      	ldr	r4, [sp, #32]
c0de1fbe:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0de1fc2:	4803      	ldr	r0, [pc, #12]	@ (c0de1fd0 <os_pki_load_certificate+0x1c>)
c0de1fc4:	4669      	mov	r1, sp
c0de1fc6:	f7ff ffd1 	bl	c0de1f6c <SVC_Call>
c0de1fca:	b006      	add	sp, #24
c0de1fcc:	bd10      	pop	{r4, pc}
c0de1fce:	bf00      	nop
c0de1fd0:	060000aa 	.word	0x060000aa

c0de1fd4 <os_perso_is_pin_set>:
c0de1fd4:	b5e0      	push	{r5, r6, r7, lr}
c0de1fd6:	2000      	movs	r0, #0
c0de1fd8:	4669      	mov	r1, sp
c0de1fda:	9001      	str	r0, [sp, #4]
c0de1fdc:	209e      	movs	r0, #158	@ 0x9e
c0de1fde:	f7ff ffc5 	bl	c0de1f6c <SVC_Call>
c0de1fe2:	b2c0      	uxtb	r0, r0
c0de1fe4:	bd8c      	pop	{r2, r3, r7, pc}

c0de1fe6 <os_global_pin_is_validated>:
c0de1fe6:	b5e0      	push	{r5, r6, r7, lr}
c0de1fe8:	2000      	movs	r0, #0
c0de1fea:	4669      	mov	r1, sp
c0de1fec:	9001      	str	r0, [sp, #4]
c0de1fee:	20a0      	movs	r0, #160	@ 0xa0
c0de1ff0:	f7ff ffbc 	bl	c0de1f6c <SVC_Call>
c0de1ff4:	b2c0      	uxtb	r0, r0
c0de1ff6:	bd8c      	pop	{r2, r3, r7, pc}

c0de1ff8 <os_ux>:
c0de1ff8:	b5e0      	push	{r5, r6, r7, lr}
c0de1ffa:	f000 f89f 	bl	c0de213c <OUTLINED_FUNCTION_0>
c0de1ffe:	4802      	ldr	r0, [pc, #8]	@ (c0de2008 <os_ux+0x10>)
c0de2000:	4669      	mov	r1, sp
c0de2002:	f7ff ffb3 	bl	c0de1f6c <SVC_Call>
c0de2006:	bd8c      	pop	{r2, r3, r7, pc}
c0de2008:	01000064 	.word	0x01000064

c0de200c <os_flags>:
c0de200c:	b5e0      	push	{r5, r6, r7, lr}
c0de200e:	2000      	movs	r0, #0
c0de2010:	4669      	mov	r1, sp
c0de2012:	9001      	str	r0, [sp, #4]
c0de2014:	206a      	movs	r0, #106	@ 0x6a
c0de2016:	f7ff ffa9 	bl	c0de1f6c <SVC_Call>
c0de201a:	bd8c      	pop	{r2, r3, r7, pc}

c0de201c <os_registry_get_current_app_tag>:
c0de201c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de201e:	ab01      	add	r3, sp, #4
c0de2020:	c307      	stmia	r3!, {r0, r1, r2}
c0de2022:	4803      	ldr	r0, [pc, #12]	@ (c0de2030 <os_registry_get_current_app_tag+0x14>)
c0de2024:	a901      	add	r1, sp, #4
c0de2026:	f7ff ffa1 	bl	c0de1f6c <SVC_Call>
c0de202a:	b004      	add	sp, #16
c0de202c:	bd80      	pop	{r7, pc}
c0de202e:	bf00      	nop
c0de2030:	03000074 	.word	0x03000074

c0de2034 <os_sched_exit>:
c0de2034:	b082      	sub	sp, #8
c0de2036:	f000 f881 	bl	c0de213c <OUTLINED_FUNCTION_0>
c0de203a:	4802      	ldr	r0, [pc, #8]	@ (c0de2044 <os_sched_exit+0x10>)
c0de203c:	4669      	mov	r1, sp
c0de203e:	f7ff ff95 	bl	c0de1f6c <SVC_Call>
c0de2042:	deff      	udf	#255	@ 0xff
c0de2044:	0100009a 	.word	0x0100009a

c0de2048 <os_io_init>:
c0de2048:	b5e0      	push	{r5, r6, r7, lr}
c0de204a:	9001      	str	r0, [sp, #4]
c0de204c:	4802      	ldr	r0, [pc, #8]	@ (c0de2058 <os_io_init+0x10>)
c0de204e:	a901      	add	r1, sp, #4
c0de2050:	f7ff ff8c 	bl	c0de1f6c <SVC_Call>
c0de2054:	bd8c      	pop	{r2, r3, r7, pc}
c0de2056:	bf00      	nop
c0de2058:	01000084 	.word	0x01000084

c0de205c <os_io_start>:
c0de205c:	b5e0      	push	{r5, r6, r7, lr}
c0de205e:	2000      	movs	r0, #0
c0de2060:	4669      	mov	r1, sp
c0de2062:	9001      	str	r0, [sp, #4]
c0de2064:	4801      	ldr	r0, [pc, #4]	@ (c0de206c <os_io_start+0x10>)
c0de2066:	f7ff ff81 	bl	c0de1f6c <SVC_Call>
c0de206a:	bd8c      	pop	{r2, r3, r7, pc}
c0de206c:	01000085 	.word	0x01000085

c0de2070 <os_io_tx_cmd>:
c0de2070:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2072:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de2076:	4803      	ldr	r0, [pc, #12]	@ (c0de2084 <os_io_tx_cmd+0x14>)
c0de2078:	4669      	mov	r1, sp
c0de207a:	f7ff ff77 	bl	c0de1f6c <SVC_Call>
c0de207e:	b004      	add	sp, #16
c0de2080:	bd80      	pop	{r7, pc}
c0de2082:	bf00      	nop
c0de2084:	04000088 	.word	0x04000088

c0de2088 <os_io_rx_evt>:
c0de2088:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de208a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de208e:	4803      	ldr	r0, [pc, #12]	@ (c0de209c <os_io_rx_evt+0x14>)
c0de2090:	4669      	mov	r1, sp
c0de2092:	f7ff ff6b 	bl	c0de1f6c <SVC_Call>
c0de2096:	b004      	add	sp, #16
c0de2098:	bd80      	pop	{r7, pc}
c0de209a:	bf00      	nop
c0de209c:	03000089 	.word	0x03000089

c0de20a0 <try_context_get>:
c0de20a0:	b5e0      	push	{r5, r6, r7, lr}
c0de20a2:	2000      	movs	r0, #0
c0de20a4:	4669      	mov	r1, sp
c0de20a6:	9001      	str	r0, [sp, #4]
c0de20a8:	2087      	movs	r0, #135	@ 0x87
c0de20aa:	f7ff ff5f 	bl	c0de1f6c <SVC_Call>
c0de20ae:	bd8c      	pop	{r2, r3, r7, pc}

c0de20b0 <try_context_set>:
c0de20b0:	b5e0      	push	{r5, r6, r7, lr}
c0de20b2:	f000 f843 	bl	c0de213c <OUTLINED_FUNCTION_0>
c0de20b6:	4802      	ldr	r0, [pc, #8]	@ (c0de20c0 <try_context_set+0x10>)
c0de20b8:	4669      	mov	r1, sp
c0de20ba:	f7ff ff57 	bl	c0de1f6c <SVC_Call>
c0de20be:	bd8c      	pop	{r2, r3, r7, pc}
c0de20c0:	0100010b 	.word	0x0100010b

c0de20c4 <os_sched_last_status>:
c0de20c4:	b5e0      	push	{r5, r6, r7, lr}
c0de20c6:	f000 f839 	bl	c0de213c <OUTLINED_FUNCTION_0>
c0de20ca:	4803      	ldr	r0, [pc, #12]	@ (c0de20d8 <os_sched_last_status+0x14>)
c0de20cc:	4669      	mov	r1, sp
c0de20ce:	f7ff ff4d 	bl	c0de1f6c <SVC_Call>
c0de20d2:	b2c0      	uxtb	r0, r0
c0de20d4:	bd8c      	pop	{r2, r3, r7, pc}
c0de20d6:	bf00      	nop
c0de20d8:	0100009c 	.word	0x0100009c

c0de20dc <screen_update>:
c0de20dc:	b5e0      	push	{r5, r6, r7, lr}
c0de20de:	2000      	movs	r0, #0
c0de20e0:	4669      	mov	r1, sp
c0de20e2:	9001      	str	r0, [sp, #4]
c0de20e4:	207a      	movs	r0, #122	@ 0x7a
c0de20e6:	f7ff ff41 	bl	c0de1f6c <SVC_Call>
c0de20ea:	bd8c      	pop	{r2, r3, r7, pc}

c0de20ec <bagl_hal_draw_bitmap_within_rect>:
c0de20ec:	b510      	push	{r4, lr}
c0de20ee:	b08a      	sub	sp, #40	@ 0x28
c0de20f0:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de20f2:	f10d 0c04 	add.w	ip, sp, #4
c0de20f6:	9409      	str	r4, [sp, #36]	@ 0x24
c0de20f8:	9c0f      	ldr	r4, [sp, #60]	@ 0x3c
c0de20fa:	9408      	str	r4, [sp, #32]
c0de20fc:	9c0e      	ldr	r4, [sp, #56]	@ 0x38
c0de20fe:	9407      	str	r4, [sp, #28]
c0de2100:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0de2102:	9406      	str	r4, [sp, #24]
c0de2104:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0de2106:	e8ac 001f 	stmia.w	ip!, {r0, r1, r2, r3, r4}
c0de210a:	4803      	ldr	r0, [pc, #12]	@ (c0de2118 <bagl_hal_draw_bitmap_within_rect+0x2c>)
c0de210c:	a901      	add	r1, sp, #4
c0de210e:	f7ff ff2d 	bl	c0de1f6c <SVC_Call>
c0de2112:	b00a      	add	sp, #40	@ 0x28
c0de2114:	bd10      	pop	{r4, pc}
c0de2116:	bf00      	nop
c0de2118:	0900007c 	.word	0x0900007c

c0de211c <bagl_hal_draw_rect>:
c0de211c:	b510      	push	{r4, lr}
c0de211e:	b086      	sub	sp, #24
c0de2120:	f10d 0c04 	add.w	ip, sp, #4
c0de2124:	9c08      	ldr	r4, [sp, #32]
c0de2126:	e8ac 001f 	stmia.w	ip!, {r0, r1, r2, r3, r4}
c0de212a:	4803      	ldr	r0, [pc, #12]	@ (c0de2138 <bagl_hal_draw_rect+0x1c>)
c0de212c:	a901      	add	r1, sp, #4
c0de212e:	f7ff ff1d 	bl	c0de1f6c <SVC_Call>
c0de2132:	b006      	add	sp, #24
c0de2134:	bd10      	pop	{r4, pc}
c0de2136:	bf00      	nop
c0de2138:	0500007d 	.word	0x0500007d

c0de213c <OUTLINED_FUNCTION_0>:
c0de213c:	2100      	movs	r1, #0
c0de213e:	e9cd 0100 	strd	r0, r1, [sp]
c0de2142:	4770      	bx	lr

c0de2144 <__aeabi_memcpy>:
c0de2144:	f000 b810 	b.w	c0de2168 <memcpy>

c0de2148 <__aeabi_memset>:
c0de2148:	460b      	mov	r3, r1
c0de214a:	4611      	mov	r1, r2
c0de214c:	461a      	mov	r2, r3
c0de214e:	f000 b819 	b.w	c0de2184 <memset>
c0de2152:	bf00      	nop

c0de2154 <__aeabi_memclr>:
c0de2154:	460a      	mov	r2, r1
c0de2156:	2100      	movs	r1, #0
c0de2158:	f000 b814 	b.w	c0de2184 <memset>

c0de215c <explicit_bzero>:
c0de215c:	f000 b800 	b.w	c0de2160 <bzero>

c0de2160 <bzero>:
c0de2160:	460a      	mov	r2, r1
c0de2162:	2100      	movs	r1, #0
c0de2164:	f000 b80e 	b.w	c0de2184 <memset>

c0de2168 <memcpy>:
c0de2168:	440a      	add	r2, r1
c0de216a:	4291      	cmp	r1, r2
c0de216c:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0de2170:	d100      	bne.n	c0de2174 <memcpy+0xc>
c0de2172:	4770      	bx	lr
c0de2174:	b510      	push	{r4, lr}
c0de2176:	f811 4b01 	ldrb.w	r4, [r1], #1
c0de217a:	4291      	cmp	r1, r2
c0de217c:	f803 4f01 	strb.w	r4, [r3, #1]!
c0de2180:	d1f9      	bne.n	c0de2176 <memcpy+0xe>
c0de2182:	bd10      	pop	{r4, pc}

c0de2184 <memset>:
c0de2184:	4603      	mov	r3, r0
c0de2186:	4402      	add	r2, r0
c0de2188:	4293      	cmp	r3, r2
c0de218a:	d100      	bne.n	c0de218e <memset+0xa>
c0de218c:	4770      	bx	lr
c0de218e:	f803 1b01 	strb.w	r1, [r3], #1
c0de2192:	e7f9      	b.n	c0de2188 <memset+0x4>

c0de2194 <setjmp>:
c0de2194:	46ec      	mov	ip, sp
c0de2196:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de219a:	f04f 0000 	mov.w	r0, #0
c0de219e:	4770      	bx	lr

c0de21a0 <longjmp>:
c0de21a0:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0de21a4:	46e5      	mov	sp, ip
c0de21a6:	0008      	movs	r0, r1
c0de21a8:	bf08      	it	eq
c0de21aa:	2001      	moveq	r0, #1
c0de21ac:	4770      	bx	lr
c0de21ae:	bf00      	nop

c0de21b0 <strlen>:
c0de21b0:	4603      	mov	r3, r0
c0de21b2:	f813 2b01 	ldrb.w	r2, [r3], #1
c0de21b6:	2a00      	cmp	r2, #0
c0de21b8:	d1fb      	bne.n	c0de21b2 <strlen+0x2>
c0de21ba:	1a18      	subs	r0, r3, r0
c0de21bc:	3801      	subs	r0, #1
c0de21be:	4770      	bx	lr

c0de21c0 <_ecode>:
c0de21c0:	2e2e      	cmp	r6, #46	@ 0x2e
c0de21c2:	002e      	movs	r6, r5

c0de21c4 <B58_ALPHABET>:
c0de21c4:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0de21d4:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0de21e4:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0de21f4:	7271 7473 7675 7877 7a79 d400               qrstuvwxyz..

c0de2200 <.L__const.handle_sign_msg.defpath>:
c0de2200:	002c 8000 0c54 8000 0000 8000 0000 0000     ,...T...........
c0de2210:	0000 0000                                   ....

c0de2214 <bitmapOPEN_SANS_EXTRABOLD_11PX>:
c0de2214:	f3ff 253b 9224 f29f 4897 8824 2cb7 870e     ..;%$....H$..,..
c0de2224:	1fa6 4e02 b1ac 7ec2 637e 358d 3c72 d86c     ...N...~~c.5r<l.
c0de2234:	e0e0 9eed df3d b417 cdb7 d926 7b6c 4c0b     ....=.....&.l{.L
c0de2244:	7bfb 0c1e 33f3 d60c 0fff 3118 8c66 de18     .{...3.....1f...
c0de2254:	cf3c 3cf3 ec7b cccf 6ecc cc63 f99c 630f     <..<{....nc....c
c0de2264:	3187 187e 69c7 8fda 3f61 ccf3 9cfc 7c21     .1~..i..a?....!|
c0de2274:	3cf3 1f7b cc63 3318 3cde f37b 7b3c 3cde     .<{.c..3.<{.<{.<
c0de2284:	3ecf 398c 0f0f 6036 980d 6199 0618 f03f     .>.9..6`...a..?.
c0de2294:	c303 cc30 0fcc 6763 3180 30f8 f766 4bd6     ..0...cg.1.0f..K
c0de22a4:	bdaf 019f 01f8 3c18 7e3c 7e66 c3e7 ef7f     .......<<~f~....
c0de22b4:	f7b7 7efe 318c f0c6 3cdf f3cf 7f3c f33f     ...~.1...<..<.?.
c0de22c4:	f333 8c7f c637 fe18 ec30 3cf3 f3fb ff3c     3...7...0..<..<.
c0de22d4:	3cf3 ffcf ccff cccc cccc f307 e6d9 d9f1     .<..............
c0de22e4:	e6cc 8c63 c631 c7f8 bf8f ff7f f57e ddee     ..c.1.......~...
c0de22f4:	f3e7 bdfb cfdf bee7 78f1 1e3c 7d8f ef7f     .........x<..}..
c0de2304:	c7fd be18 78f1 1e3c 7d8f 3030 b6cf cf6d     .....x<..}00..m.
c0de2314:	cdb6 8c7e 38e3 3f7f 30c3 c30c f330 cf3c     ..~..8.?.0..0.<.
c0de2324:	3cf3 f37b cf3c e79e 7331 9bb6 acdd 3566     .<{.<...1s....f5
c0de2334:	70ee 1b07 66c3 3c3c 3c3c c366 9b63 838d     .p...f<<<<f.c...
c0de2344:	60c1 7f30 0e18 70c3 fe18 333f 3333 43f3     .`0....p..?333.C
c0de2354:	c318 c218 cccf cccc 0cfc 49e3 3f33 1e33     ...........I3?3.
c0de2364:	cfec 0fb3 f0c3 fb6d 7dbe 71bc 061c 300f     ......m..}.q...0
c0de2374:	dbcc 6df7 3cf3 fff3 e060 dc01 637c 318c     ...m.<..`...|c.1
c0de2384:	9b7e 63cd 8df0 3ec7 fc63 f7bd f3de 0cff     ~..c...>c.......
c0de2394:	cccc cccc c307 7db0 b3cf ffed edff dbdb     .......}........
c0de23a4:	dbdb 7ddb bdef 1c37 fddb e36e b6df dbef     ...}..7...n.....
c0de23b4:	0c37 be03 df7d 0fb6 30c3 33fd 6f33 8f3c     7...}....0.33o<.
c0de23c4:	e61f 631b 070c ef7b 2fbd 9b63 c6cd 33e1     ...c..{../c....3
c0de23d4:	e6db 7f9f 30cc 7703 871b bb63 6303 8d9b     .....0.w..c..c..
c0de23e4:	e1c6 1870 3f0e 30c6 0fc6 319c 0e76 8c63     ..p..?.0...1v.c.
c0de23f4:	ff03 3fff 18c7 b9c3 e631 0f6f               ...?....1.o.

c0de2400 <charactersOPEN_SANS_EXTRABOLD_11PX>:
c0de2400:	c000 0000 c000 0088 8008 0089 c010 0081     ................
c0de2410:	802c 0001 c04c 1082 4074 0082 c098 0088     ,...L...t@......
c0de2420:	009c 1081 00ac 0089 80bc 0081 80cc 0101     ................
c0de2430:	c0dc 0380 00e0 0281 c0e4 0388 40e8 0081     .............@..
c0de2440:	00fc 108a 8114 1089 c124 1089 c138 1089     ........$...8...
c0de2450:	014c 108a 8164 1089 0174 108a c18c 1089     L...d...t.......
c0de2460:	01a0 108a 01b8 108a c1d0 0188 c1d8 0180     ................
c0de2470:	41e4 0101 81f8 0201 4204 0101 8214 1081     .A.......B......
c0de2480:	8228 0082 0258 0082 c278 1089 c28c 1089     (...X...x.......
c0de2490:	02a0 108a 82b8 1089 82c8 0089 02dc 108a     ................
c0de24a0:	02f4 108a 030c 1089 4314 1081 032c 008a     .........C..,...
c0de24b0:	8348 0089 c35c 108a 4380 108a 439c 108a     H...\....C...C..
c0de24c0:	c3b8 1089 43cc 108a 03f0 108a 8408 0089     .....C..........
c0de24d0:	841c 0081 0434 108a 844c 0081 c464 0082     ....4...L...d...
c0de24e0:	0490 0082 c4b0 0081 c4cc 0081 44e8 0089     .............D..
c0de24f0:	44fc 0081 4510 1081 c524 1081 c534 1501     .D...E..$...4...
c0de2500:	c538 2011 c53c 1181 c550 0089 8568 0181     8.. <...P...h...
c0de2510:	c57c 1081 c594 0181 85ac 1081 c5c0 0181     |...............
c0de2520:	c5e0 1089 05f4 1089 45fc 1081 c614 0089     .........E......
c0de2530:	062c 1089 8634 118a c64c 1189 c65c 0181     ,...4...L...\...
c0de2540:	c670 0189 c68c 1181 46a8 0189 86b4 0189     p........F......
c0de2550:	46c4 0101 c6d8 1189 c6e8 0181 86fc 0182     .F..............
c0de2560:	c71c 0181 0734 1182 8754 0181 4768 0081     ....4...T...hG..
c0de2570:	8784 2091 4790 0081 87a8 0201               ... .G......

c0de257c <fontOPEN_SANS_EXTRABOLD_11PX>:
c0de257c:	01ec 0108 090c 7e20 2400 c0de 2214 c0de     ...... ~.$..."..

c0de258c <bitmapOPEN_SANS_LIGHT_16PX>:
c0de258c:	0cff 9999 4090 0882 fe22 8123 7fc4 1044     .....@..".#...D.
c0de259c:	0241 0809 229e 5091 7070 6448 83ca 4906     A....".PppHd...I
c0de25ac:	2244 9092 9484 1299 9092 2444 0922 1c06     D"........D$"...
c0de25bc:	8844 4110 8181 90c4 0341 f30d 0f09 555a     D..A....A.....ZU
c0de25cc:	2955 aaa5 16aa 0408 4fe2 88a1 0408 8fe2     U).......O......
c0de25dc:	2040 076a 100f 4421 2108 8842 511c 1830     @ j...!D.!B..Q0.
c0de25ec:	060c c183 88a0 7403 9249 0924 109e 0408     .......tI.$.....
c0de25fc:	4102 0410 e041 9e0f 1010 f304 8080 2040     .A..A.........@ 
c0de260c:	03e8 c040 4140 8482 1088 ff21 0081 0201     ..@.@A....!.....
c0de261c:	813e 1040 80f8 4081 c860 3803 2083 e810     >.@....@`..8. ..
c0de262c:	830d a0c1 0790 207f 0408 4082 0810 8104     ....... ...@....
c0de263c:	511c 2830 88e2 c182 d060 9e07 3050 0c18     .Q0(....`...P0..
c0de264c:	817b 1040 01cc c00f 0f03 0540 1840 c063     {.@.......@.@.c.
c0de265c:	0180 7f01 e000 010f 0603 318c 0f04 0842     ...........1..B.
c0de266c:	1111 0802 f001 20c1 2402 119e 9099 9909     ....... .$......
c0de267c:	8990 7719 2001 0400 0f80 c030 0300 4812     ...w. ....0....H
c0de268c:	4120 3f08 0902 5024 9f80 3050 fa18 8284      A.?..$P..P0....
c0de269c:	60c1 03e8 04f8 0102 0101 0101 0201 f804     .`..............
c0de26ac:	211f 8141 8181 8181 4181 1f21 107f c104     .!A......A!.....
c0de26bc:	041f 1041 7ffc 0410 f041 4107 0410 11f8     ..A.....A..A....
c0de26cc:	4020 0100 1004 807e 0a01 2048 817e 8181      @....~...H ~...
c0de26dc:	8181 81ff 8181 8181 ff81 240f 9249 4924     ...........$I.$I
c0de26ec:	c10e 2450 1851 1214 4891 0828 1041 4104     ..P$Q....H(.A..A
c0de26fc:	0410 1041 01fc 3c06 c0f0 1685 685a 4992     ..A....<....Zh.I
c0de270c:	18c6 8063 8381 8583 8985 9191 c1a1 81c1     ..c.............
c0de271c:	1078 5022 0180 1806 8060 0a01 0844 5f1e     x."P....`...D.._
c0de272c:	8618 f861 4105 0410 1078 5022 0180 1806     ..a..A..x."P....
c0de273c:	8060 0a01 0844 401e 0200 9f18 3050 0c18     `...D..@....P0..
c0de274c:	227d 5091 0830 60be 1020 c070 4080 f020     }".P0..` .p..@ .
c0de275c:	7f07 0204 4081 1020 0408 0102 8181 8181     .....@ .........
c0de276c:	8181 8181 8181 3c42 0301 120a 8824 1108     ......B<....$...
c0de277c:	2822 4050 c180 30a0 0c24 4489 1122 4249     "(P@...0$..D".IB
c0de278c:	5092 1428 860a 6181 1020 0482 4111 0282     .P(....a ....A..
c0de279c:	0a02 4414 0888 080a 4281 2442 1824 1018     ...D.....BB$$...
c0de27ac:	1010 1010 207f 0408 2041 0208 e041 1f0f     ..... ..A ..A...
c0de27bc:	1111 1111 1111 410f 4108 2108 2108 8f08     .......A.A.!.!..
c0de27cc:	8888 8888 8888 080f 450a 0a24 0106 117f     .........E$.....
c0de27dc:	1e01 8208 187e 2ec6 0101 0101 433d 8181     ....~.......=C..
c0de27ec:	8181 4381 bc3d 0410 1041 3c08 8080 8080     ...C=...A..<....
c0de27fc:	c2bc 8181 8181 c281 1cbc 3051 0ff8 8404     ..........Q0....
c0de280c:	383c 1041 411f 0410 1041 fc04 4222 2242     <8A..A..A..."BB"
c0de281c:	043c 7c02 8142 3e43 4081 d020 0519 c183     <..|B.C>.@ .....
c0de282c:	3060 0418 07f9 4804 2492 1e49 4081 1020     `0.....H.$I..@ .
c0de283c:	248a 850a 2445 0414 1fff 339d 4146 8418     .$..E$.....3FA..
c0de284c:	1841 4184 8418 0841 519d 1830 060c 4183     A..A..A..Q0....A
c0de285c:	511c 1830 060c 1c45 433d 8181 8181 4381     .Q0...E.=C.....C
c0de286c:	013d 0101 bc01 81c2 8181 8181 bcc2 8080     =...............
c0de287c:	8080 847d 4210 0108 843e 20c1 0f84 09e2     ..}..B..>.. ....
c0de288c:	8421 8210 c103 3060 0c18 c506 c15e 48a0     !.....`0....^..H
c0de289c:	a224 2850 6108 4628 2462 9249 2944 830c     $.P(.a(Fb$I.D)..
c0de28ac:	0810 6101 3128 230c 2185 a0c1 2448 50a2     ...a(1.#.!..H$.P
c0de28bc:	0828 8104 1f30 4422 0884 981f 4210 1908     (...0."D.....B..
c0de28cc:	1084 0842 ff06 01ff 1043 0842 84c1 4210     ..B.....C.B....B
c0de28dc:	07c4 d43c                                   ..<.

c0de28e0 <charactersOPEN_SANS_LIGHT_16PX>:
c0de28e0:	0000 0001 c000 1088 8008 1089 8010 0082     ................
c0de28f0:	404c 108a 4078 108b c0bc 108a c0f4 1088     L@..x@..........
c0de2900:	00f8 1089 0108 1089 4118 100a 4130 110a     .........A..0A..
c0de2910:	c148 1580 414c 1409 0150 1589 8154 1081     H...LA..P...T...
c0de2920:	4170 108a 419c 4092 41b0 108a 41dc 108a     pA...A.@.A...A..
c0de2930:	4208 0082 4240 108a 426c 108a 4298 108a     .B..@B..lB...B..
c0de2940:	42c0 108a 42ec 108a 0318 1209 0324 1209     .B...B......$...
c0de2950:	4330 118a 434c 128a 435c 118a c374 1089     0C..LC..\C..t...
c0de2960:	8394 108b 83e8 0082 8424 1092 8450 108a     ........$...P...
c0de2970:	c480 1092 44b0 1092 04d4 0092 04f8 108b     .....D..........
c0de2980:	0534 2093 0564 1091 856c 3081 4584 0092     4.. d...l..0.E..
c0de2990:	05b0 0092 85d4 2093 0610 2093 0640 108b     ....... ... @...
c0de29a0:	467c 1092 06a0 108b 86ec 1092 4718 108a     |F...........G..
c0de29b0:	c744 0081 0770 2093 87a0 1082 87d4 0083     D...p.. ........
c0de29c0:	4828 0082 4860 1082 4890 108a 48bc 0089     (H..`H...H...H..
c0de29d0:	88dc 1081 48fc 1081 491c 108a 0938 1702     .....H...I..8...
c0de29e0:	493c 301a 0944 120a 8960 100a 0994 120a     <I.0D...`.......
c0de29f0:	89b0 100a 49e4 120a 8a04 0001 0a2c 0202     .....I......,...
c0de2a00:	4a60 100a 0a90 2109 4a98 2101 0ab0 000a     `J.....!.J.!....
c0de2a10:	0ae0 2009 8ae8 120b 4b20 120a 4b40 120a     ... .... K..@K..
c0de2a20:	8b60 120a 8b94 120a 8bc8 0209 cbe0 1209     `...............
c0de2a30:	4bf8 0181 4c14 120a 0c34 1202 0c54 0203     .K...L..4...T...
c0de2a40:	0c8c 120a 0ca8 1202 ccd4 1209 8cec 1081     ................
c0de2a50:	8d14 4009 8d20 0089 4d44 130a               ...@ ...DM..

c0de2a5c <fontOPEN_SANS_LIGHT_16PX>:
c0de2a5c:	0353 0109 0d11 7e20 28e0 c0de 258c c0de     S..... ~.(...%..

c0de2a6c <bitmapOPEN_SANS_REGULAR_11PX>:
c0de2a6c:	0fbf 9220 429f 49f9 5f04 cc65 a30f a54a     .. ..B.I._e...J.
c0de2a7c:	a5bd c552 924e 6518 bd1a 6a03 0a95 6a95     ..R.N..e...j...j
c0de2a8c:	0405 33f1 c812 1a8f 0103 4448 1222 9996     ...3......HD"...
c0de2a9c:	6999 492e 8792 2488 87f1 8868 1078 4946     .i.I...$..h.x.FI
c0de2aac:	0fd2 1f41 88f1 1e78 99f1 8f69 2448 9622     ..A...x...i.H$".
c0de2abc:	9969 9669 8f99 2178 6802 3348 0f84 210f     i.i...x!.hH3...!
c0de2acc:	12cc 4887 2022 827c a5b9 a5a5 01fd 083e     ...H" |.......>.
c0de2adc:	850a f222 8289 c63f 6317 7efc 1084 f0c2     .."...?..c.~....
c0de2aec:	185f 6186 7e18 f11f f111 843f 43f0 7e08     _..a.~....?..C.~
c0de2afc:	0410 1871 61fa fe18 1861 ff86 4924 1c92     ..q..a..a...$I..
c0de2b0c:	5251 450c 8512 8421 4210 c3f8 c3c3 a5a5     QR.E..!..B......
c0de2b1c:	9999 e199 9658 1a69 be87 3060 0c18 7d06     ....X.i...`0...}
c0de2b2c:	c62f 42f8 be08 3060 0c18 7d06 1010 c62f     /..B..`0...}../.
c0de2b3c:	52f8 1e8c 8c31 9f78 4210 2108 1861 6186     .R..1.x..B.!a..a
c0de2b4c:	7a18 9141 4448 50a1 3110 24ca 5293 294a     .zA.HD.P.1.$.RJ)
c0de2b5c:	0845 a121 30c4 248c a185 3124 8208 8f20     E.!..0.$..$1.. .
c0de2b6c:	1244 4ff1 2492 2139 4422 2784 9249 0c3c     D..O.$9!"D.'I.<.
c0de2b7c:	4923 1f21 8f09 f99f bc21 6318 1e7c e111     #I!.....!..c|...
c0de2b8c:	fa10 6318 9ef4 e11f 2f2c 2222 24be 8239     ...c....,/"".$9.
c0de2b9c:	8617 211e 18bc 8c63 04fd 9249 01e4 5911     ...!..c...I....Y
c0de2bac:	9953 efff 9191 9191 2f91 18c6 2e23 18c6     S......../..#...
c0de2bbc:	2f1d 18c6 085f 3e01 18c6 843d 4f10 1792     ./.._..>..=..O..
c0de2bcc:	7843 22f2 0e22 c631 3f18 24a1 0c49 1103     Cx."".1..?.$I...
c0de2bdc:	a955 4552 0884 6699 a199 4924 430c 0310     U.RE...f..$I.C..
c0de2bec:	111f 3e22 9496 3248 07ff 4493 1a4a d4c3     ..">..H2...DJ...

c0de2bfc <charactersOPEN_SANS_REGULAR_11PX>:
c0de2bfc:	c000 0000 c000 1088 0004 1089 c008 0081     ................
c0de2c0c:	8024 1109 4034 108a 4050 208a 8068 0088     $...4@..P@. h...
c0de2c1c:	c06c 1080 c078 0088 8084 0081 8094 0201     l...x...........
c0de2c2c:	c09c 1400 00a0 1309 c0a4 1408 00a8 0081     ................
c0de2c3c:	80b8 1089 80c8 2089 80d4 1089 80e4 1089     ....... ........
c0de2c4c:	00f4 108a 810c 1089 811c 1089 812c 1089     ............,...
c0de2c5c:	813c 1089 814c 1089 c15c 1188 c160 1180     <...L...\...`...
c0de2c6c:	8168 1109 8174 1209 817c 1109 4188 0089     h...t...|....A..
c0de2c7c:	8198 108a c1bc 0081 c1d8 1089 c1ec 1089     ................
c0de2c8c:	0200 108a 8218 1089 8228 0089 023c 108a     ........(...<...
c0de2c9c:	0254 108a c26c 1088 0270 1081 c280 0089     T...l...p.......
c0de2cac:	8298 0089 82ac 108a 02cc 108a 42e4 108a     .............B..
c0de2cbc:	c300 1089 4314 108a c338 1089 834c 1089     .....C..8...L...
c0de2ccc:	c35c 1089 0370 108a c388 0081 83a4 0082     \...p...........
c0de2cdc:	c3cc 1081 83e4 0081 83fc 1089 040c 0089     ................
c0de2cec:	041c 0081 042c 1081 843c 0081 844c 1501     ....,...<...L...
c0de2cfc:	8450 2011 8454 1189 c460 1089 4474 0189     P.. T...`...tD..
c0de2d0c:	c480 1089 8494 1189 44a0 1081 84b0 0181     .........D......
c0de2d1c:	c4cc 1089 c4e0 1088 04e4 1081 84f8 1089     ................
c0de2d2c:	c508 1088 850c 118a c524 1189 c534 1189     ........$...4...
c0de2d3c:	c544 1189 c55c 1189 0574 0189 457c 0189     D...\...t...|E..
c0de2d4c:	0588 0101 c598 1189 85a8 0181 45bc 0182     .............E..
c0de2d5c:	85d8 1189 85e4 0181 4600 0181 0610 0089     .........F......
c0de2d6c:	8620 2099 0628 1081 8638 1209                .. (...8...

c0de2d78 <fontOPEN_SANS_REGULAR_11PX>:
c0de2d78:	018f 010a 090c 7e20 2bfc c0de 2a6c c0de     ...... ~.+..l*..

c0de2d88 <C_bagl_fonts>:
c0de2d88:	257c c0de 2a5c c0de 2d78 c0de               |%..\*..x-..

c0de2d94 <C_bagl_fonts_count>:
c0de2d94:	0003 0000                                   ....

c0de2d98 <_etext>:
c0de2d98:	d4d4      	bmi.n	c0de2d44 <charactersOPEN_SANS_REGULAR_11PX+0x148>
c0de2d9a:	d4d4      	bmi.n	c0de2d46 <charactersOPEN_SANS_REGULAR_11PX+0x14a>
c0de2d9c:	d4d4      	bmi.n	c0de2d48 <charactersOPEN_SANS_REGULAR_11PX+0x14c>
c0de2d9e:	d4d4      	bmi.n	c0de2d4a <charactersOPEN_SANS_REGULAR_11PX+0x14e>
c0de2da0:	d4d4      	bmi.n	c0de2d4c <charactersOPEN_SANS_REGULAR_11PX+0x150>
c0de2da2:	d4d4      	bmi.n	c0de2d4e <charactersOPEN_SANS_REGULAR_11PX+0x152>
c0de2da4:	d4d4      	bmi.n	c0de2d50 <charactersOPEN_SANS_REGULAR_11PX+0x154>
c0de2da6:	d4d4      	bmi.n	c0de2d52 <charactersOPEN_SANS_REGULAR_11PX+0x156>
c0de2da8:	d4d4      	bmi.n	c0de2d54 <charactersOPEN_SANS_REGULAR_11PX+0x158>
c0de2daa:	d4d4      	bmi.n	c0de2d56 <charactersOPEN_SANS_REGULAR_11PX+0x15a>
c0de2dac:	d4d4      	bmi.n	c0de2d58 <charactersOPEN_SANS_REGULAR_11PX+0x15c>
c0de2dae:	d4d4      	bmi.n	c0de2d5a <charactersOPEN_SANS_REGULAR_11PX+0x15e>
c0de2db0:	d4d4      	bmi.n	c0de2d5c <charactersOPEN_SANS_REGULAR_11PX+0x160>
c0de2db2:	d4d4      	bmi.n	c0de2d5e <charactersOPEN_SANS_REGULAR_11PX+0x162>
c0de2db4:	d4d4      	bmi.n	c0de2d60 <charactersOPEN_SANS_REGULAR_11PX+0x164>
c0de2db6:	d4d4      	bmi.n	c0de2d62 <charactersOPEN_SANS_REGULAR_11PX+0x166>
c0de2db8:	d4d4      	bmi.n	c0de2d64 <charactersOPEN_SANS_REGULAR_11PX+0x168>
c0de2dba:	d4d4      	bmi.n	c0de2d66 <charactersOPEN_SANS_REGULAR_11PX+0x16a>
c0de2dbc:	d4d4      	bmi.n	c0de2d68 <charactersOPEN_SANS_REGULAR_11PX+0x16c>
c0de2dbe:	d4d4      	bmi.n	c0de2d6a <charactersOPEN_SANS_REGULAR_11PX+0x16e>
c0de2dc0:	d4d4      	bmi.n	c0de2d6c <charactersOPEN_SANS_REGULAR_11PX+0x170>
c0de2dc2:	d4d4      	bmi.n	c0de2d6e <charactersOPEN_SANS_REGULAR_11PX+0x172>
c0de2dc4:	d4d4      	bmi.n	c0de2d70 <charactersOPEN_SANS_REGULAR_11PX+0x174>
c0de2dc6:	d4d4      	bmi.n	c0de2d72 <charactersOPEN_SANS_REGULAR_11PX+0x176>
c0de2dc8:	d4d4      	bmi.n	c0de2d74 <charactersOPEN_SANS_REGULAR_11PX+0x178>
c0de2dca:	d4d4      	bmi.n	c0de2d76 <charactersOPEN_SANS_REGULAR_11PX+0x17a>
c0de2dcc:	d4d4      	bmi.n	c0de2d78 <fontOPEN_SANS_REGULAR_11PX>
c0de2dce:	d4d4      	bmi.n	c0de2d7a <fontOPEN_SANS_REGULAR_11PX+0x2>
c0de2dd0:	d4d4      	bmi.n	c0de2d7c <fontOPEN_SANS_REGULAR_11PX+0x4>
c0de2dd2:	d4d4      	bmi.n	c0de2d7e <fontOPEN_SANS_REGULAR_11PX+0x6>
c0de2dd4:	d4d4      	bmi.n	c0de2d80 <fontOPEN_SANS_REGULAR_11PX+0x8>
c0de2dd6:	d4d4      	bmi.n	c0de2d82 <fontOPEN_SANS_REGULAR_11PX+0xa>
c0de2dd8:	d4d4      	bmi.n	c0de2d84 <fontOPEN_SANS_REGULAR_11PX+0xc>
c0de2dda:	d4d4      	bmi.n	c0de2d86 <fontOPEN_SANS_REGULAR_11PX+0xe>
c0de2ddc:	d4d4      	bmi.n	c0de2d88 <C_bagl_fonts>
c0de2dde:	d4d4      	bmi.n	c0de2d8a <C_bagl_fonts+0x2>
c0de2de0:	d4d4      	bmi.n	c0de2d8c <C_bagl_fonts+0x4>
c0de2de2:	d4d4      	bmi.n	c0de2d8e <C_bagl_fonts+0x6>
c0de2de4:	d4d4      	bmi.n	c0de2d90 <C_bagl_fonts+0x8>
c0de2de6:	d4d4      	bmi.n	c0de2d92 <C_bagl_fonts+0xa>
c0de2de8:	d4d4      	bmi.n	c0de2d94 <C_bagl_fonts_count>
c0de2dea:	d4d4      	bmi.n	c0de2d96 <C_bagl_fonts_count+0x2>
c0de2dec:	d4d4      	bmi.n	c0de2d98 <_etext>
c0de2dee:	d4d4      	bmi.n	c0de2d9a <_etext+0x2>
c0de2df0:	d4d4      	bmi.n	c0de2d9c <_etext+0x4>
c0de2df2:	d4d4      	bmi.n	c0de2d9e <_etext+0x6>
c0de2df4:	d4d4      	bmi.n	c0de2da0 <_etext+0x8>
c0de2df6:	d4d4      	bmi.n	c0de2da2 <_etext+0xa>
c0de2df8:	d4d4      	bmi.n	c0de2da4 <_etext+0xc>
c0de2dfa:	d4d4      	bmi.n	c0de2da6 <_etext+0xe>
c0de2dfc:	d4d4      	bmi.n	c0de2da8 <_etext+0x10>
c0de2dfe:	d4d4      	bmi.n	c0de2daa <_etext+0x12>

c0de2e00 <install_parameters>:
c0de2e00:	0501 634f 7274 0261 3105 302e 302e 0104     ..Octra..1.0.0..
c0de2e10:	                                             .
