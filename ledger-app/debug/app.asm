
build/nanos/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0d00000 <app_main>:
c0d00000:	4809      	ldr	r0, [pc, #36]	@ (c0d00028 <app_main+0x28>)
c0d00002:	217c      	movs	r1, #124	@ 0x7c
c0d00004:	f002 fbf8 	bl	c0d027f8 <explicit_bzero>
c0d00008:	2021      	movs	r0, #33	@ 0x21
c0d0000a:	00c1      	lsls	r1, r0, #3
c0d0000c:	4807      	ldr	r0, [pc, #28]	@ (c0d0002c <app_main+0x2c>)
c0d0000e:	f002 fbdd 	bl	c0d027cc <__aeabi_memclr>
c0d00012:	f001 fe17 	bl	c0d01c44 <io_seproxyhal_init>
c0d00016:	2000      	movs	r0, #0
c0d00018:	f001 fcc2 	bl	c0d019a0 <USB_power>
c0d0001c:	2001      	movs	r0, #1
c0d0001e:	f001 fcbf 	bl	c0d019a0 <USB_power>
c0d00022:	f000 f813 	bl	c0d0004c <app_main_impl>
c0d00026:	46c0      	nop			@ (mov r8, r8)
c0d00028:	20000200 	.word	0x20000200
c0d0002c:	200002fc 	.word	0x200002fc

c0d00030 <main>:
c0d00030:	b510      	push	{r4, lr}
c0d00032:	4604      	mov	r4, r0
c0d00034:	b662      	cpsie	i
c0d00036:	f001 fd25 	bl	c0d01a84 <os_boot>
c0d0003a:	2c00      	cmp	r4, #0
c0d0003c:	d101      	bne.n	c0d00042 <main+0x12>
c0d0003e:	f000 fdbb 	bl	c0d00bb8 <standalone_app_main>
c0d00042:	2000      	movs	r0, #0
c0d00044:	bd10      	pop	{r4, pc}

c0d00046 <app_exit>:
c0d00046:	20ff      	movs	r0, #255	@ 0xff
c0d00048:	f002 f9fa 	bl	c0d02440 <os_sched_exit>

c0d0004c <app_main_impl>:
c0d0004c:	b0d4      	sub	sp, #336	@ 0x150
c0d0004e:	a818      	add	r0, sp, #96	@ 0x60
c0d00050:	2700      	movs	r7, #0
c0d00052:	8007      	strh	r7, [r0, #0]
c0d00054:	a817      	add	r0, sp, #92	@ 0x5c
c0d00056:	8007      	strh	r7, [r0, #0]
c0d00058:	a816      	add	r0, sp, #88	@ 0x58
c0d0005a:	7007      	strb	r7, [r0, #0]
c0d0005c:	a841      	add	r0, sp, #260	@ 0x104
c0d0005e:	3009      	adds	r0, #9
c0d00060:	9009      	str	r0, [sp, #36]	@ 0x24
c0d00062:	a841      	add	r0, sp, #260	@ 0x104
c0d00064:	3009      	adds	r0, #9
c0d00066:	9008      	str	r0, [sp, #32]
c0d00068:	266f      	movs	r6, #111	@ 0x6f
c0d0006a:	0230      	lsls	r0, r6, #8
c0d0006c:	9006      	str	r0, [sp, #24]
c0d0006e:	9607      	str	r6, [sp, #28]
c0d00070:	9705      	str	r7, [sp, #20]
c0d00072:	ac0a      	add	r4, sp, #40	@ 0x28
c0d00074:	4620      	mov	r0, r4
c0d00076:	f002 fcb7 	bl	c0d029e8 <setjmp>
c0d0007a:	85a0      	strh	r0, [r4, #44]	@ 0x2c
c0d0007c:	b284      	uxth	r4, r0
c0d0007e:	2c00      	cmp	r4, #0
c0d00080:	d020      	beq.n	c0d000c4 <app_main_impl+0x78>
c0d00082:	2c05      	cmp	r4, #5
c0d00084:	d100      	bne.n	c0d00088 <app_main_impl+0x3c>
c0d00086:	e1ac      	b.n	c0d003e2 <app_main_impl+0x396>
c0d00088:	4625      	mov	r5, r4
c0d0008a:	a80a      	add	r0, sp, #40	@ 0x28
c0d0008c:	8587      	strh	r7, [r0, #44]	@ 0x2c
c0d0008e:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0d00090:	f002 fa0c 	bl	c0d024ac <try_context_set>
c0d00094:	a817      	add	r0, sp, #92	@ 0x5c
c0d00096:	8007      	strh	r7, [r0, #0]
c0d00098:	49d9      	ldr	r1, [pc, #868]	@ (c0d00400 <app_main_impl+0x3b4>)
c0d0009a:	1861      	adds	r1, r4, r1
c0d0009c:	0b09      	lsrs	r1, r1, #12
c0d0009e:	2903      	cmp	r1, #3
c0d000a0:	4621      	mov	r1, r4
c0d000a2:	d300      	bcc.n	c0d000a6 <app_main_impl+0x5a>
c0d000a4:	0231      	lsls	r1, r6, #8
c0d000a6:	4ad3      	ldr	r2, [pc, #844]	@ (c0d003f4 <app_main_impl+0x3a8>)
c0d000a8:	4294      	cmp	r4, r2
c0d000aa:	d100      	bne.n	c0d000ae <app_main_impl+0x62>
c0d000ac:	4629      	mov	r1, r5
c0d000ae:	0a0a      	lsrs	r2, r1, #8
c0d000b0:	8803      	ldrh	r3, [r0, #0]
c0d000b2:	4cd1      	ldr	r4, [pc, #836]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d000b4:	54e2      	strb	r2, [r4, r3]
c0d000b6:	1c5a      	adds	r2, r3, #1
c0d000b8:	8002      	strh	r2, [r0, #0]
c0d000ba:	8802      	ldrh	r2, [r0, #0]
c0d000bc:	54a1      	strb	r1, [r4, r2]
c0d000be:	1c51      	adds	r1, r2, #1
c0d000c0:	8001      	strh	r1, [r0, #0]
c0d000c2:	e17f      	b.n	c0d003c4 <app_main_impl+0x378>
c0d000c4:	a80a      	add	r0, sp, #40	@ 0x28
c0d000c6:	f002 f9f1 	bl	c0d024ac <try_context_set>
c0d000ca:	9014      	str	r0, [sp, #80]	@ 0x50
c0d000cc:	ac16      	add	r4, sp, #88	@ 0x58
c0d000ce:	7820      	ldrb	r0, [r4, #0]
c0d000d0:	ad17      	add	r5, sp, #92	@ 0x5c
c0d000d2:	8829      	ldrh	r1, [r5, #0]
c0d000d4:	f001 febc 	bl	c0d01e50 <io_exchange>
c0d000d8:	a918      	add	r1, sp, #96	@ 0x60
c0d000da:	8008      	strh	r0, [r1, #0]
c0d000dc:	7027      	strb	r7, [r4, #0]
c0d000de:	802f      	strh	r7, [r5, #0]
c0d000e0:	8808      	ldrh	r0, [r1, #0]
c0d000e2:	2803      	cmp	r0, #3
c0d000e4:	d804      	bhi.n	c0d000f0 <app_main_impl+0xa4>
c0d000e6:	a817      	add	r0, sp, #92	@ 0x5c
c0d000e8:	8801      	ldrh	r1, [r0, #0]
c0d000ea:	2267      	movs	r2, #103	@ 0x67
c0d000ec:	4dc2      	ldr	r5, [pc, #776]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d000ee:	e021      	b.n	c0d00134 <app_main_impl+0xe8>
c0d000f0:	a818      	add	r0, sp, #96	@ 0x60
c0d000f2:	8801      	ldrh	r1, [r0, #0]
c0d000f4:	4dc0      	ldr	r5, [pc, #768]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d000f6:	7828      	ldrb	r0, [r5, #0]
c0d000f8:	28e0      	cmp	r0, #224	@ 0xe0
c0d000fa:	d118      	bne.n	c0d0012e <app_main_impl+0xe2>
c0d000fc:	7868      	ldrb	r0, [r5, #1]
c0d000fe:	463c      	mov	r4, r7
c0d00100:	2905      	cmp	r1, #5
c0d00102:	d321      	bcc.n	c0d00148 <app_main_impl+0xfc>
c0d00104:	7929      	ldrb	r1, [r5, #4]
c0d00106:	2900      	cmp	r1, #0
c0d00108:	463a      	mov	r2, r7
c0d0010a:	d01e      	beq.n	c0d0014a <app_main_impl+0xfe>
c0d0010c:	aa18      	add	r2, sp, #96	@ 0x60
c0d0010e:	8815      	ldrh	r5, [r2, #0]
c0d00110:	1d4b      	adds	r3, r1, #5
c0d00112:	2400      	movs	r4, #0
c0d00114:	42ab      	cmp	r3, r5
c0d00116:	4625      	mov	r5, r4
c0d00118:	d801      	bhi.n	c0d0011e <app_main_impl+0xd2>
c0d0011a:	4db7      	ldr	r5, [pc, #732]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d0011c:	1d6d      	adds	r5, r5, #5
c0d0011e:	8812      	ldrh	r2, [r2, #0]
c0d00120:	4293      	cmp	r3, r2
c0d00122:	d800      	bhi.n	c0d00126 <app_main_impl+0xda>
c0d00124:	460c      	mov	r4, r1
c0d00126:	4622      	mov	r2, r4
c0d00128:	462c      	mov	r4, r5
c0d0012a:	4db3      	ldr	r5, [pc, #716]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d0012c:	e00d      	b.n	c0d0014a <app_main_impl+0xfe>
c0d0012e:	a817      	add	r0, sp, #92	@ 0x5c
c0d00130:	8801      	ldrh	r1, [r0, #0]
c0d00132:	226e      	movs	r2, #110	@ 0x6e
c0d00134:	546a      	strb	r2, [r5, r1]
c0d00136:	1c49      	adds	r1, r1, #1
c0d00138:	8001      	strh	r1, [r0, #0]
c0d0013a:	8801      	ldrh	r1, [r0, #0]
c0d0013c:	1c4a      	adds	r2, r1, #1
c0d0013e:	8002      	strh	r2, [r0, #0]
c0d00140:	4608      	mov	r0, r1
c0d00142:	2100      	movs	r1, #0
c0d00144:	5429      	strb	r1, [r5, r0]
c0d00146:	e794      	b.n	c0d00072 <app_main_impl+0x26>
c0d00148:	463a      	mov	r2, r7
c0d0014a:	4611      	mov	r1, r2
c0d0014c:	9404      	str	r4, [sp, #16]
c0d0014e:	2804      	cmp	r0, #4
c0d00150:	d02f      	beq.n	c0d001b2 <app_main_impl+0x166>
c0d00152:	2801      	cmp	r0, #1
c0d00154:	d00e      	beq.n	c0d00174 <app_main_impl+0x128>
c0d00156:	2802      	cmp	r0, #2
c0d00158:	d03d      	beq.n	c0d001d6 <app_main_impl+0x18a>
c0d0015a:	2803      	cmp	r0, #3
c0d0015c:	d040      	beq.n	c0d001e0 <app_main_impl+0x194>
c0d0015e:	2800      	cmp	r0, #0
c0d00160:	d151      	bne.n	c0d00206 <app_main_impl+0x1ba>
c0d00162:	2001      	movs	r0, #1
c0d00164:	70e8      	strb	r0, [r5, #3]
c0d00166:	2100      	movs	r1, #0
c0d00168:	70a9      	strb	r1, [r5, #2]
c0d0016a:	7069      	strb	r1, [r5, #1]
c0d0016c:	7028      	strb	r0, [r5, #0]
c0d0016e:	2004      	movs	r0, #4
c0d00170:	4601      	mov	r1, r0
c0d00172:	e11f      	b.n	c0d003b4 <app_main_impl+0x368>
c0d00174:	226a      	movs	r2, #106	@ 0x6a
c0d00176:	2080      	movs	r0, #128	@ 0x80
c0d00178:	2905      	cmp	r1, #5
c0d0017a:	d200      	bcs.n	c0d0017e <app_main_impl+0x132>
c0d0017c:	e110      	b.n	c0d003a0 <app_main_impl+0x354>
c0d0017e:	9b04      	ldr	r3, [sp, #16]
c0d00180:	781c      	ldrb	r4, [r3, #0]
c0d00182:	2c00      	cmp	r4, #0
c0d00184:	d100      	bne.n	c0d00188 <app_main_impl+0x13c>
c0d00186:	e10b      	b.n	c0d003a0 <app_main_impl+0x354>
c0d00188:	2c0a      	cmp	r4, #10
c0d0018a:	d900      	bls.n	c0d0018e <app_main_impl+0x142>
c0d0018c:	e108      	b.n	c0d003a0 <app_main_impl+0x354>
c0d0018e:	00a0      	lsls	r0, r4, #2
c0d00190:	1c40      	adds	r0, r0, #1
c0d00192:	4288      	cmp	r0, r1
c0d00194:	d835      	bhi.n	c0d00202 <app_main_impl+0x1b6>
c0d00196:	2500      	movs	r5, #0
c0d00198:	4e98      	ldr	r6, [pc, #608]	@ (c0d003fc <app_main_impl+0x3b0>)
c0d0019a:	42ac      	cmp	r4, r5
c0d0019c:	d06a      	beq.n	c0d00274 <app_main_impl+0x228>
c0d0019e:	00a8      	lsls	r0, r5, #2
c0d001a0:	1c40      	adds	r0, r0, #1
c0d001a2:	b281      	uxth	r1, r0
c0d001a4:	9804      	ldr	r0, [sp, #16]
c0d001a6:	f000 f931 	bl	c0d0040c <read_u32_be>
c0d001aa:	9f05      	ldr	r7, [sp, #20]
c0d001ac:	c601      	stmia	r6!, {r0}
c0d001ae:	1c6d      	adds	r5, r5, #1
c0d001b0:	e7f3      	b.n	c0d0019a <app_main_impl+0x14e>
c0d001b2:	2900      	cmp	r1, #0
c0d001b4:	d011      	beq.n	c0d001da <app_main_impl+0x18e>
c0d001b6:	aa37      	add	r2, sp, #220	@ 0xdc
c0d001b8:	9804      	ldr	r0, [sp, #16]
c0d001ba:	f000 fa35 	bl	c0d00628 <sha256_hash>
c0d001be:	2800      	cmp	r0, #0
c0d001c0:	9806      	ldr	r0, [sp, #24]
c0d001c2:	d000      	beq.n	c0d001c6 <app_main_impl+0x17a>
c0d001c4:	e0e7      	b.n	c0d00396 <app_main_impl+0x34a>
c0d001c6:	2128      	movs	r1, #40	@ 0x28
c0d001c8:	488c      	ldr	r0, [pc, #560]	@ (c0d003fc <app_main_impl+0x3b0>)
c0d001ca:	5c41      	ldrb	r1, [r0, r1]
c0d001cc:	2900      	cmp	r1, #0
c0d001ce:	d02e      	beq.n	c0d0022e <app_main_impl+0x1e2>
c0d001d0:	aa19      	add	r2, sp, #100	@ 0x64
c0d001d2:	ab41      	add	r3, sp, #260	@ 0x104
c0d001d4:	e036      	b.n	c0d00244 <app_main_impl+0x1f8>
c0d001d6:	294b      	cmp	r1, #75	@ 0x4b
c0d001d8:	d218      	bcs.n	c0d0020c <app_main_impl+0x1c0>
c0d001da:	226a      	movs	r2, #106	@ 0x6a
c0d001dc:	2080      	movs	r0, #128	@ 0x80
c0d001de:	e0df      	b.n	c0d003a0 <app_main_impl+0x354>
c0d001e0:	226a      	movs	r2, #106	@ 0x6a
c0d001e2:	2080      	movs	r0, #128	@ 0x80
c0d001e4:	2905      	cmp	r1, #5
c0d001e6:	d200      	bcs.n	c0d001ea <app_main_impl+0x19e>
c0d001e8:	e0da      	b.n	c0d003a0 <app_main_impl+0x354>
c0d001ea:	9b04      	ldr	r3, [sp, #16]
c0d001ec:	781c      	ldrb	r4, [r3, #0]
c0d001ee:	2c00      	cmp	r4, #0
c0d001f0:	d100      	bne.n	c0d001f4 <app_main_impl+0x1a8>
c0d001f2:	e0d5      	b.n	c0d003a0 <app_main_impl+0x354>
c0d001f4:	2c0a      	cmp	r4, #10
c0d001f6:	d900      	bls.n	c0d001fa <app_main_impl+0x1ae>
c0d001f8:	e0d2      	b.n	c0d003a0 <app_main_impl+0x354>
c0d001fa:	00a0      	lsls	r0, r4, #2
c0d001fc:	1c40      	adds	r0, r0, #1
c0d001fe:	4288      	cmp	r0, r1
c0d00200:	d96f      	bls.n	c0d002e2 <app_main_impl+0x296>
c0d00202:	2267      	movs	r2, #103	@ 0x67
c0d00204:	e000      	b.n	c0d00208 <app_main_impl+0x1bc>
c0d00206:	226d      	movs	r2, #109	@ 0x6d
c0d00208:	4638      	mov	r0, r7
c0d0020a:	e0c9      	b.n	c0d003a0 <app_main_impl+0x354>
c0d0020c:	aa37      	add	r2, sp, #220	@ 0xdc
c0d0020e:	9804      	ldr	r0, [sp, #16]
c0d00210:	f000 fa0a 	bl	c0d00628 <sha256_hash>
c0d00214:	2800      	cmp	r0, #0
c0d00216:	9806      	ldr	r0, [sp, #24]
c0d00218:	d000      	beq.n	c0d0021c <app_main_impl+0x1d0>
c0d0021a:	e0bc      	b.n	c0d00396 <app_main_impl+0x34a>
c0d0021c:	2128      	movs	r1, #40	@ 0x28
c0d0021e:	4877      	ldr	r0, [pc, #476]	@ (c0d003fc <app_main_impl+0x3b0>)
c0d00220:	5c41      	ldrb	r1, [r0, r1]
c0d00222:	2900      	cmp	r1, #0
c0d00224:	d100      	bne.n	c0d00228 <app_main_impl+0x1dc>
c0d00226:	e090      	b.n	c0d0034a <app_main_impl+0x2fe>
c0d00228:	aa19      	add	r2, sp, #100	@ 0x64
c0d0022a:	ab41      	add	r3, sp, #260	@ 0x104
c0d0022c:	e098      	b.n	c0d00360 <app_main_impl+0x314>
c0d0022e:	ac2d      	add	r4, sp, #180	@ 0xb4
c0d00230:	4975      	ldr	r1, [pc, #468]	@ (c0d00408 <app_main_impl+0x3bc>)
c0d00232:	4479      	add	r1, pc
c0d00234:	2214      	movs	r2, #20
c0d00236:	4620      	mov	r0, r4
c0d00238:	f002 face 	bl	c0d027d8 <__aeabi_memcpy>
c0d0023c:	2105      	movs	r1, #5
c0d0023e:	aa19      	add	r2, sp, #100	@ 0x64
c0d00240:	ab41      	add	r3, sp, #260	@ 0x104
c0d00242:	4620      	mov	r0, r4
c0d00244:	f000 f8ee 	bl	c0d00424 <derive_keypair>
c0d00248:	2800      	cmp	r0, #0
c0d0024a:	9806      	ldr	r0, [sp, #24]
c0d0024c:	d000      	beq.n	c0d00250 <app_main_impl+0x204>
c0d0024e:	e0a2      	b.n	c0d00396 <app_main_impl+0x34a>
c0d00250:	4628      	mov	r0, r5
c0d00252:	2540      	movs	r5, #64	@ 0x40
c0d00254:	9000      	str	r0, [sp, #0]
c0d00256:	9501      	str	r5, [sp, #4]
c0d00258:	ac19      	add	r4, sp, #100	@ 0x64
c0d0025a:	2105      	movs	r1, #5
c0d0025c:	aa37      	add	r2, sp, #220	@ 0xdc
c0d0025e:	2320      	movs	r3, #32
c0d00260:	4620      	mov	r0, r4
c0d00262:	f001 fbed 	bl	c0d01a40 <cx_eddsa_sign_no_throw>
c0d00266:	9003      	str	r0, [sp, #12]
c0d00268:	2128      	movs	r1, #40	@ 0x28
c0d0026a:	4620      	mov	r0, r4
c0d0026c:	f002 fac4 	bl	c0d027f8 <explicit_bzero>
c0d00270:	9803      	ldr	r0, [sp, #12]
c0d00272:	e08b      	b.n	c0d0038c <app_main_impl+0x340>
c0d00274:	2028      	movs	r0, #40	@ 0x28
c0d00276:	4d61      	ldr	r5, [pc, #388]	@ (c0d003fc <app_main_impl+0x3b0>)
c0d00278:	542c      	strb	r4, [r5, r0]
c0d0027a:	aa19      	add	r2, sp, #100	@ 0x64
c0d0027c:	ab41      	add	r3, sp, #260	@ 0x104
c0d0027e:	4628      	mov	r0, r5
c0d00280:	4621      	mov	r1, r4
c0d00282:	f000 f8cf 	bl	c0d00424 <derive_keypair>
c0d00286:	2800      	cmp	r0, #0
c0d00288:	9806      	ldr	r0, [sp, #24]
c0d0028a:	d128      	bne.n	c0d002de <app_main_impl+0x292>
c0d0028c:	462c      	mov	r4, r5
c0d0028e:	3429      	adds	r4, #41	@ 0x29
c0d00290:	2620      	movs	r6, #32
c0d00292:	4620      	mov	r0, r4
c0d00294:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0d00296:	4632      	mov	r2, r6
c0d00298:	f002 fa9e 	bl	c0d027d8 <__aeabi_memcpy>
c0d0029c:	a819      	add	r0, sp, #100	@ 0x64
c0d0029e:	2128      	movs	r1, #40	@ 0x28
c0d002a0:	f002 faaa 	bl	c0d027f8 <explicit_bzero>
c0d002a4:	3549      	adds	r5, #73	@ 0x49
c0d002a6:	4620      	mov	r0, r4
c0d002a8:	4629      	mov	r1, r5
c0d002aa:	f000 f8ef 	bl	c0d0048c <get_address>
c0d002ae:	2800      	cmp	r0, #0
c0d002b0:	9806      	ldr	r0, [sp, #24]
c0d002b2:	d114      	bne.n	c0d002de <app_main_impl+0x292>
c0d002b4:	4632      	mov	r2, r6
c0d002b6:	4e50      	ldr	r6, [pc, #320]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d002b8:	7032      	strb	r2, [r6, #0]
c0d002ba:	1c70      	adds	r0, r6, #1
c0d002bc:	4621      	mov	r1, r4
c0d002be:	f002 fa8b 	bl	c0d027d8 <__aeabi_memcpy>
c0d002c2:	4628      	mov	r0, r5
c0d002c4:	f002 fbaa 	bl	c0d02a1c <strlen>
c0d002c8:	4604      	mov	r4, r0
c0d002ca:	2021      	movs	r0, #33	@ 0x21
c0d002cc:	5434      	strb	r4, [r6, r0]
c0d002ce:	4630      	mov	r0, r6
c0d002d0:	3022      	adds	r0, #34	@ 0x22
c0d002d2:	b2a2      	uxth	r2, r4
c0d002d4:	4629      	mov	r1, r5
c0d002d6:	f002 fa7f 	bl	c0d027d8 <__aeabi_memcpy>
c0d002da:	3422      	adds	r4, #34	@ 0x22
c0d002dc:	4620      	mov	r0, r4
c0d002de:	9e07      	ldr	r6, [sp, #28]
c0d002e0:	e058      	b.n	c0d00394 <app_main_impl+0x348>
c0d002e2:	2500      	movs	r5, #0
c0d002e4:	ae37      	add	r6, sp, #220	@ 0xdc
c0d002e6:	42ac      	cmp	r4, r5
c0d002e8:	d008      	beq.n	c0d002fc <app_main_impl+0x2b0>
c0d002ea:	00a8      	lsls	r0, r5, #2
c0d002ec:	1c40      	adds	r0, r0, #1
c0d002ee:	b281      	uxth	r1, r0
c0d002f0:	9804      	ldr	r0, [sp, #16]
c0d002f2:	f000 f88b 	bl	c0d0040c <read_u32_be>
c0d002f6:	c601      	stmia	r6!, {r0}
c0d002f8:	1c6d      	adds	r5, r5, #1
c0d002fa:	e7f4      	b.n	c0d002e6 <app_main_impl+0x29a>
c0d002fc:	a837      	add	r0, sp, #220	@ 0xdc
c0d002fe:	aa2d      	add	r2, sp, #180	@ 0xb4
c0d00300:	ab41      	add	r3, sp, #260	@ 0x104
c0d00302:	4621      	mov	r1, r4
c0d00304:	f000 f88e 	bl	c0d00424 <derive_keypair>
c0d00308:	2800      	cmp	r0, #0
c0d0030a:	9806      	ldr	r0, [sp, #24]
c0d0030c:	9e07      	ldr	r6, [sp, #28]
c0d0030e:	4d3a      	ldr	r5, [pc, #232]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d00310:	d141      	bne.n	c0d00396 <app_main_impl+0x34a>
c0d00312:	ac25      	add	r4, sp, #148	@ 0x94
c0d00314:	2220      	movs	r2, #32
c0d00316:	4620      	mov	r0, r4
c0d00318:	9908      	ldr	r1, [sp, #32]
c0d0031a:	f002 fa5d 	bl	c0d027d8 <__aeabi_memcpy>
c0d0031e:	a82d      	add	r0, sp, #180	@ 0xb4
c0d00320:	2128      	movs	r1, #40	@ 0x28
c0d00322:	f002 fa69 	bl	c0d027f8 <explicit_bzero>
c0d00326:	a919      	add	r1, sp, #100	@ 0x64
c0d00328:	4620      	mov	r0, r4
c0d0032a:	f000 f8af 	bl	c0d0048c <get_address>
c0d0032e:	2800      	cmp	r0, #0
c0d00330:	9806      	ldr	r0, [sp, #24]
c0d00332:	d130      	bne.n	c0d00396 <app_main_impl+0x34a>
c0d00334:	ac19      	add	r4, sp, #100	@ 0x64
c0d00336:	4620      	mov	r0, r4
c0d00338:	f002 fb70 	bl	c0d02a1c <strlen>
c0d0033c:	4605      	mov	r5, r0
c0d0033e:	b282      	uxth	r2, r0
c0d00340:	482d      	ldr	r0, [pc, #180]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d00342:	4621      	mov	r1, r4
c0d00344:	f002 fa48 	bl	c0d027d8 <__aeabi_memcpy>
c0d00348:	e023      	b.n	c0d00392 <app_main_impl+0x346>
c0d0034a:	ac2d      	add	r4, sp, #180	@ 0xb4
c0d0034c:	492d      	ldr	r1, [pc, #180]	@ (c0d00404 <app_main_impl+0x3b8>)
c0d0034e:	4479      	add	r1, pc
c0d00350:	2214      	movs	r2, #20
c0d00352:	4620      	mov	r0, r4
c0d00354:	f002 fa40 	bl	c0d027d8 <__aeabi_memcpy>
c0d00358:	2105      	movs	r1, #5
c0d0035a:	aa19      	add	r2, sp, #100	@ 0x64
c0d0035c:	ab41      	add	r3, sp, #260	@ 0x104
c0d0035e:	4620      	mov	r0, r4
c0d00360:	f000 f860 	bl	c0d00424 <derive_keypair>
c0d00364:	2800      	cmp	r0, #0
c0d00366:	9806      	ldr	r0, [sp, #24]
c0d00368:	d115      	bne.n	c0d00396 <app_main_impl+0x34a>
c0d0036a:	4628      	mov	r0, r5
c0d0036c:	2540      	movs	r5, #64	@ 0x40
c0d0036e:	9000      	str	r0, [sp, #0]
c0d00370:	9501      	str	r5, [sp, #4]
c0d00372:	ac19      	add	r4, sp, #100	@ 0x64
c0d00374:	2105      	movs	r1, #5
c0d00376:	aa37      	add	r2, sp, #220	@ 0xdc
c0d00378:	2320      	movs	r3, #32
c0d0037a:	4620      	mov	r0, r4
c0d0037c:	f001 fb60 	bl	c0d01a40 <cx_eddsa_sign_no_throw>
c0d00380:	9002      	str	r0, [sp, #8]
c0d00382:	2128      	movs	r1, #40	@ 0x28
c0d00384:	4620      	mov	r0, r4
c0d00386:	f002 fa37 	bl	c0d027f8 <explicit_bzero>
c0d0038a:	9802      	ldr	r0, [sp, #8]
c0d0038c:	2800      	cmp	r0, #0
c0d0038e:	d000      	beq.n	c0d00392 <app_main_impl+0x346>
c0d00390:	9d06      	ldr	r5, [sp, #24]
c0d00392:	4628      	mov	r0, r5
c0d00394:	4d18      	ldr	r5, [pc, #96]	@ (c0d003f8 <app_main_impl+0x3ac>)
c0d00396:	b281      	uxth	r1, r0
c0d00398:	0b4a      	lsrs	r2, r1, #13
c0d0039a:	2a03      	cmp	r2, #3
c0d0039c:	d30a      	bcc.n	c0d003b4 <app_main_impl+0x368>
c0d0039e:	0a0a      	lsrs	r2, r1, #8
c0d003a0:	a917      	add	r1, sp, #92	@ 0x5c
c0d003a2:	800f      	strh	r7, [r1, #0]
c0d003a4:	880b      	ldrh	r3, [r1, #0]
c0d003a6:	54ea      	strb	r2, [r5, r3]
c0d003a8:	1c5a      	adds	r2, r3, #1
c0d003aa:	800a      	strh	r2, [r1, #0]
c0d003ac:	880a      	ldrh	r2, [r1, #0]
c0d003ae:	54a8      	strb	r0, [r5, r2]
c0d003b0:	1c50      	adds	r0, r2, #1
c0d003b2:	e006      	b.n	c0d003c2 <app_main_impl+0x376>
c0d003b4:	2290      	movs	r2, #144	@ 0x90
c0d003b6:	546a      	strb	r2, [r5, r1]
c0d003b8:	1869      	adds	r1, r5, r1
c0d003ba:	2200      	movs	r2, #0
c0d003bc:	704a      	strb	r2, [r1, #1]
c0d003be:	1c80      	adds	r0, r0, #2
c0d003c0:	a917      	add	r1, sp, #92	@ 0x5c
c0d003c2:	8008      	strh	r0, [r1, #0]
c0d003c4:	f002 f868 	bl	c0d02498 <try_context_get>
c0d003c8:	a90a      	add	r1, sp, #40	@ 0x28
c0d003ca:	4288      	cmp	r0, r1
c0d003cc:	d102      	bne.n	c0d003d4 <app_main_impl+0x388>
c0d003ce:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0d003d0:	f002 f86c 	bl	c0d024ac <try_context_set>
c0d003d4:	a80a      	add	r0, sp, #40	@ 0x28
c0d003d6:	8d80      	ldrh	r0, [r0, #44]	@ 0x2c
c0d003d8:	2800      	cmp	r0, #0
c0d003da:	d100      	bne.n	c0d003de <app_main_impl+0x392>
c0d003dc:	e649      	b.n	c0d00072 <app_main_impl+0x26>
c0d003de:	f001 fb56 	bl	c0d01a8e <os_longjmp>
c0d003e2:	a80a      	add	r0, sp, #40	@ 0x28
c0d003e4:	8587      	strh	r7, [r0, #44]	@ 0x2c
c0d003e6:	9814      	ldr	r0, [sp, #80]	@ 0x50
c0d003e8:	f002 f860 	bl	c0d024ac <try_context_set>
c0d003ec:	2005      	movs	r0, #5
c0d003ee:	f001 fb4e 	bl	c0d01a8e <os_longjmp>
c0d003f2:	46c0      	nop			@ (mov r8, r8)
c0d003f4:	00006985 	.word	0x00006985
c0d003f8:	200004e8 	.word	0x200004e8
c0d003fc:	20000200 	.word	0x20000200
c0d00400:	ffffa000 	.word	0xffffa000
c0d00404:	0000276e 	.word	0x0000276e
c0d00408:	0000288a 	.word	0x0000288a

c0d0040c <read_u32_be>:
c0d0040c:	5c42      	ldrb	r2, [r0, r1]
c0d0040e:	0612      	lsls	r2, r2, #24
c0d00410:	1840      	adds	r0, r0, r1
c0d00412:	7841      	ldrb	r1, [r0, #1]
c0d00414:	0409      	lsls	r1, r1, #16
c0d00416:	1889      	adds	r1, r1, r2
c0d00418:	7882      	ldrb	r2, [r0, #2]
c0d0041a:	0212      	lsls	r2, r2, #8
c0d0041c:	1889      	adds	r1, r1, r2
c0d0041e:	78c0      	ldrb	r0, [r0, #3]
c0d00420:	1808      	adds	r0, r1, r0
c0d00422:	4770      	bx	lr

c0d00424 <derive_keypair>:
c0d00424:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d00426:	b091      	sub	sp, #68	@ 0x44
c0d00428:	461d      	mov	r5, r3
c0d0042a:	4614      	mov	r4, r2
c0d0042c:	aa01      	add	r2, sp, #4
c0d0042e:	f000 f8c3 	bl	c0d005b8 <os_derive_bip32_with_seed_no_throw>
c0d00432:	2800      	cmp	r0, #0
c0d00434:	d006      	beq.n	c0d00444 <derive_keypair+0x20>
c0d00436:	a801      	add	r0, sp, #4
c0d00438:	2140      	movs	r1, #64	@ 0x40
c0d0043a:	f002 f9dd 	bl	c0d027f8 <explicit_bzero>
c0d0043e:	2000      	movs	r0, #0
c0d00440:	43c6      	mvns	r6, r0
c0d00442:	e01f      	b.n	c0d00484 <derive_keypair+0x60>
c0d00444:	2071      	movs	r0, #113	@ 0x71
c0d00446:	ae01      	add	r6, sp, #4
c0d00448:	2220      	movs	r2, #32
c0d0044a:	4631      	mov	r1, r6
c0d0044c:	4623      	mov	r3, r4
c0d0044e:	f001 faf1 	bl	c0d01a34 <cx_ecfp_init_private_key_no_throw>
c0d00452:	4607      	mov	r7, r0
c0d00454:	2140      	movs	r1, #64	@ 0x40
c0d00456:	4630      	mov	r0, r6
c0d00458:	f002 f9ce 	bl	c0d027f8 <explicit_bzero>
c0d0045c:	2600      	movs	r6, #0
c0d0045e:	43f0      	mvns	r0, r6
c0d00460:	2f00      	cmp	r7, #0
c0d00462:	d001      	beq.n	c0d00468 <derive_keypair+0x44>
c0d00464:	4606      	mov	r6, r0
c0d00466:	e00d      	b.n	c0d00484 <derive_keypair+0x60>
c0d00468:	4607      	mov	r7, r0
c0d0046a:	2071      	movs	r0, #113	@ 0x71
c0d0046c:	2301      	movs	r3, #1
c0d0046e:	4629      	mov	r1, r5
c0d00470:	4622      	mov	r2, r4
c0d00472:	f001 fad9 	bl	c0d01a28 <cx_ecfp_generate_pair_no_throw>
c0d00476:	2800      	cmp	r0, #0
c0d00478:	d004      	beq.n	c0d00484 <derive_keypair+0x60>
c0d0047a:	2128      	movs	r1, #40	@ 0x28
c0d0047c:	4620      	mov	r0, r4
c0d0047e:	f002 f9bb 	bl	c0d027f8 <explicit_bzero>
c0d00482:	463e      	mov	r6, r7
c0d00484:	4630      	mov	r0, r6
c0d00486:	b011      	add	sp, #68	@ 0x44
c0d00488:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0d0048c <get_address>:
c0d0048c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0048e:	b09f      	sub	sp, #124	@ 0x7c
c0d00490:	460c      	mov	r4, r1
c0d00492:	2620      	movs	r6, #32
c0d00494:	aa17      	add	r2, sp, #92	@ 0x5c
c0d00496:	4631      	mov	r1, r6
c0d00498:	f000 f8c6 	bl	c0d00628 <sha256_hash>
c0d0049c:	2700      	movs	r7, #0
c0d0049e:	43f9      	mvns	r1, r7
c0d004a0:	2800      	cmp	r0, #0
c0d004a2:	d005      	beq.n	c0d004b0 <get_address+0x24>
c0d004a4:	e082      	b.n	c0d005ac <get_address+0x120>
c0d004a6:	a817      	add	r0, sp, #92	@ 0x5c
c0d004a8:	5dc0      	ldrb	r0, [r0, r7]
c0d004aa:	2800      	cmp	r0, #0
c0d004ac:	d102      	bne.n	c0d004b4 <get_address+0x28>
c0d004ae:	1c7f      	adds	r7, r7, #1
c0d004b0:	2f20      	cmp	r7, #32
c0d004b2:	d1f8      	bne.n	c0d004a6 <get_address+0x1a>
c0d004b4:	9102      	str	r1, [sp, #8]
c0d004b6:	1bf1      	subs	r1, r6, r7
c0d004b8:	208a      	movs	r0, #138	@ 0x8a
c0d004ba:	4348      	muls	r0, r1
c0d004bc:	2164      	movs	r1, #100	@ 0x64
c0d004be:	f002 f899 	bl	c0d025f4 <__divsi3>
c0d004c2:	1838      	adds	r0, r7, r0
c0d004c4:	1c40      	adds	r0, r0, #1
c0d004c6:	283f      	cmp	r0, #63	@ 0x3f
c0d004c8:	dd01      	ble.n	c0d004ce <get_address+0x42>
c0d004ca:	9902      	ldr	r1, [sp, #8]
c0d004cc:	e06e      	b.n	c0d005ac <get_address+0x120>
c0d004ce:	a807      	add	r0, sp, #28
c0d004d0:	2140      	movs	r1, #64	@ 0x40
c0d004d2:	f002 f97b 	bl	c0d027cc <__aeabi_memclr>
c0d004d6:	2000      	movs	r0, #0
c0d004d8:	4287      	cmp	r7, r0
c0d004da:	d004      	beq.n	c0d004e6 <get_address+0x5a>
c0d004dc:	a907      	add	r1, sp, #28
c0d004de:	2231      	movs	r2, #49	@ 0x31
c0d004e0:	540a      	strb	r2, [r1, r0]
c0d004e2:	1c40      	adds	r0, r0, #1
c0d004e4:	e7f8      	b.n	c0d004d8 <get_address+0x4c>
c0d004e6:	9401      	str	r4, [sp, #4]
c0d004e8:	a807      	add	r0, sp, #28
c0d004ea:	19c0      	adds	r0, r0, r7
c0d004ec:	9005      	str	r0, [sp, #20]
c0d004ee:	2400      	movs	r4, #0
c0d004f0:	4638      	mov	r0, r7
c0d004f2:	9703      	str	r7, [sp, #12]
c0d004f4:	2820      	cmp	r0, #32
c0d004f6:	d020      	beq.n	c0d0053a <get_address+0xae>
c0d004f8:	4601      	mov	r1, r0
c0d004fa:	a817      	add	r0, sp, #92	@ 0x5c
c0d004fc:	9104      	str	r1, [sp, #16]
c0d004fe:	5c40      	ldrb	r0, [r0, r1]
c0d00500:	2700      	movs	r7, #0
c0d00502:	42a7      	cmp	r7, r4
c0d00504:	db01      	blt.n	c0d0050a <get_address+0x7e>
c0d00506:	2800      	cmp	r0, #0
c0d00508:	d013      	beq.n	c0d00532 <get_address+0xa6>
c0d0050a:	9406      	str	r4, [sp, #24]
c0d0050c:	9c05      	ldr	r4, [sp, #20]
c0d0050e:	5de1      	ldrb	r1, [r4, r7]
c0d00510:	0209      	lsls	r1, r1, #8
c0d00512:	180d      	adds	r5, r1, r0
c0d00514:	b2a8      	uxth	r0, r5
c0d00516:	263a      	movs	r6, #58	@ 0x3a
c0d00518:	4631      	mov	r1, r6
c0d0051a:	f001 ffe1 	bl	c0d024e0 <__udivsi3>
c0d0051e:	4346      	muls	r6, r0
c0d00520:	1ba9      	subs	r1, r5, r6
c0d00522:	55e1      	strb	r1, [r4, r7]
c0d00524:	9c06      	ldr	r4, [sp, #24]
c0d00526:	1c79      	adds	r1, r7, #1
c0d00528:	42a7      	cmp	r7, r4
c0d0052a:	db00      	blt.n	c0d0052e <get_address+0xa2>
c0d0052c:	460c      	mov	r4, r1
c0d0052e:	460f      	mov	r7, r1
c0d00530:	e7e7      	b.n	c0d00502 <get_address+0x76>
c0d00532:	9804      	ldr	r0, [sp, #16]
c0d00534:	1c40      	adds	r0, r0, #1
c0d00536:	9f03      	ldr	r7, [sp, #12]
c0d00538:	e7dc      	b.n	c0d004f4 <get_address+0x68>
c0d0053a:	a807      	add	r0, sp, #28
c0d0053c:	19c0      	adds	r0, r0, r7
c0d0053e:	1e61      	subs	r1, r4, #1
c0d00540:	2200      	movs	r2, #0
c0d00542:	4b1c      	ldr	r3, [pc, #112]	@ (c0d005b4 <get_address+0x128>)
c0d00544:	447b      	add	r3, pc
c0d00546:	42a2      	cmp	r2, r4
c0d00548:	da05      	bge.n	c0d00556 <get_address+0xca>
c0d0054a:	5c45      	ldrb	r5, [r0, r1]
c0d0054c:	5d5d      	ldrb	r5, [r3, r5]
c0d0054e:	5485      	strb	r5, [r0, r2]
c0d00550:	1e49      	subs	r1, r1, #1
c0d00552:	1c52      	adds	r2, r2, #1
c0d00554:	e7f7      	b.n	c0d00546 <get_address+0xba>
c0d00556:	19e0      	adds	r0, r4, r7
c0d00558:	a907      	add	r1, sp, #28
c0d0055a:	2400      	movs	r4, #0
c0d0055c:	540c      	strb	r4, [r1, r0]
c0d0055e:	2800      	cmp	r0, #0
c0d00560:	9902      	ldr	r1, [sp, #8]
c0d00562:	d423      	bmi.n	c0d005ac <get_address+0x120>
c0d00564:	a807      	add	r0, sp, #28
c0d00566:	f002 fa59 	bl	c0d02a1c <strlen>
c0d0056a:	4602      	mov	r2, r0
c0d0056c:	2074      	movs	r0, #116	@ 0x74
c0d0056e:	9d01      	ldr	r5, [sp, #4]
c0d00570:	70a8      	strb	r0, [r5, #2]
c0d00572:	2063      	movs	r0, #99	@ 0x63
c0d00574:	7068      	strb	r0, [r5, #1]
c0d00576:	206f      	movs	r0, #111	@ 0x6f
c0d00578:	7028      	strb	r0, [r5, #0]
c0d0057a:	2a2b      	cmp	r2, #43	@ 0x2b
c0d0057c:	dc09      	bgt.n	c0d00592 <get_address+0x106>
c0d0057e:	202c      	movs	r0, #44	@ 0x2c
c0d00580:	1a80      	subs	r0, r0, r2
c0d00582:	1ce9      	adds	r1, r5, #3
c0d00584:	2300      	movs	r3, #0
c0d00586:	4283      	cmp	r3, r0
c0d00588:	da07      	bge.n	c0d0059a <get_address+0x10e>
c0d0058a:	2531      	movs	r5, #49	@ 0x31
c0d0058c:	54cd      	strb	r5, [r1, r3]
c0d0058e:	1c5b      	adds	r3, r3, #1
c0d00590:	e7f9      	b.n	c0d00586 <get_address+0xfa>
c0d00592:	1ce8      	adds	r0, r5, #3
c0d00594:	a907      	add	r1, sp, #28
c0d00596:	222c      	movs	r2, #44	@ 0x2c
c0d00598:	e003      	b.n	c0d005a2 <get_address+0x116>
c0d0059a:	9d01      	ldr	r5, [sp, #4]
c0d0059c:	1828      	adds	r0, r5, r0
c0d0059e:	1cc0      	adds	r0, r0, #3
c0d005a0:	a907      	add	r1, sp, #28
c0d005a2:	f002 f919 	bl	c0d027d8 <__aeabi_memcpy>
c0d005a6:	202f      	movs	r0, #47	@ 0x2f
c0d005a8:	542c      	strb	r4, [r5, r0]
c0d005aa:	4621      	mov	r1, r4
c0d005ac:	4608      	mov	r0, r1
c0d005ae:	b01f      	add	sp, #124	@ 0x7c
c0d005b0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d005b2:	46c0      	nop			@ (mov r8, r8)
c0d005b4:	0000253c 	.word	0x0000253c

c0d005b8 <os_derive_bip32_with_seed_no_throw>:
c0d005b8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d005ba:	b091      	sub	sp, #68	@ 0x44
c0d005bc:	4615      	mov	r5, r2
c0d005be:	460e      	mov	r6, r1
c0d005c0:	4607      	mov	r7, r0
c0d005c2:	ac05      	add	r4, sp, #20
c0d005c4:	4620      	mov	r0, r4
c0d005c6:	f002 fa0f 	bl	c0d029e8 <setjmp>
c0d005ca:	85a0      	strh	r0, [r4, #44]	@ 0x2c
c0d005cc:	b284      	uxth	r4, r0
c0d005ce:	2c00      	cmp	r4, #0
c0d005d0:	d00a      	beq.n	c0d005e8 <os_derive_bip32_with_seed_no_throw+0x30>
c0d005d2:	a805      	add	r0, sp, #20
c0d005d4:	2100      	movs	r1, #0
c0d005d6:	8581      	strh	r1, [r0, #44]	@ 0x2c
c0d005d8:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0d005da:	f001 ff67 	bl	c0d024ac <try_context_set>
c0d005de:	2140      	movs	r1, #64	@ 0x40
c0d005e0:	4628      	mov	r0, r5
c0d005e2:	f002 f909 	bl	c0d027f8 <explicit_bzero>
c0d005e6:	e00e      	b.n	c0d00606 <os_derive_bip32_with_seed_no_throw+0x4e>
c0d005e8:	a805      	add	r0, sp, #20
c0d005ea:	f001 ff5f 	bl	c0d024ac <try_context_set>
c0d005ee:	900f      	str	r0, [sp, #60]	@ 0x3c
c0d005f0:	2000      	movs	r0, #0
c0d005f2:	9500      	str	r5, [sp, #0]
c0d005f4:	9001      	str	r0, [sp, #4]
c0d005f6:	9002      	str	r0, [sp, #8]
c0d005f8:	9003      	str	r0, [sp, #12]
c0d005fa:	2001      	movs	r0, #1
c0d005fc:	2171      	movs	r1, #113	@ 0x71
c0d005fe:	463a      	mov	r2, r7
c0d00600:	4633      	mov	r3, r6
c0d00602:	f001 fed9 	bl	c0d023b8 <os_perso_derive_node_with_seed_key>
c0d00606:	f001 ff47 	bl	c0d02498 <try_context_get>
c0d0060a:	a905      	add	r1, sp, #20
c0d0060c:	4288      	cmp	r0, r1
c0d0060e:	d102      	bne.n	c0d00616 <os_derive_bip32_with_seed_no_throw+0x5e>
c0d00610:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0d00612:	f001 ff4b 	bl	c0d024ac <try_context_set>
c0d00616:	a805      	add	r0, sp, #20
c0d00618:	8d80      	ldrh	r0, [r0, #44]	@ 0x2c
c0d0061a:	2800      	cmp	r0, #0
c0d0061c:	d102      	bne.n	c0d00624 <os_derive_bip32_with_seed_no_throw+0x6c>
c0d0061e:	4620      	mov	r0, r4
c0d00620:	b011      	add	sp, #68	@ 0x44
c0d00622:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d00624:	f001 fa33 	bl	c0d01a8e <os_longjmp>

c0d00628 <sha256_hash>:
c0d00628:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0062a:	b09d      	sub	sp, #116	@ 0x74
c0d0062c:	4616      	mov	r6, r2
c0d0062e:	460c      	mov	r4, r1
c0d00630:	4605      	mov	r5, r0
c0d00632:	a802      	add	r0, sp, #8
c0d00634:	f001 fa16 	bl	c0d01a64 <cx_sha256_init_no_throw>
c0d00638:	2700      	movs	r7, #0
c0d0063a:	2800      	cmp	r0, #0
c0d0063c:	d10a      	bne.n	c0d00654 <sha256_hash+0x2c>
c0d0063e:	2020      	movs	r0, #32
c0d00640:	9600      	str	r6, [sp, #0]
c0d00642:	9001      	str	r0, [sp, #4]
c0d00644:	a802      	add	r0, sp, #8
c0d00646:	2101      	movs	r1, #1
c0d00648:	462a      	mov	r2, r5
c0d0064a:	4623      	mov	r3, r4
c0d0064c:	f001 f9fe 	bl	c0d01a4c <cx_hash_no_throw>
c0d00650:	2800      	cmp	r0, #0
c0d00652:	d000      	beq.n	c0d00656 <sha256_hash+0x2e>
c0d00654:	43f8      	mvns	r0, r7
c0d00656:	b01d      	add	sp, #116	@ 0x74
c0d00658:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0d0065a <io_seproxyhal_display>:
c0d0065a:	b580      	push	{r7, lr}
c0d0065c:	f001 fb5a 	bl	c0d01d14 <io_seproxyhal_display_default>
c0d00660:	bd80      	pop	{r7, pc}

c0d00662 <app_ticker_event_callback>:
c0d00662:	4770      	bx	lr

c0d00664 <io_event>:
c0d00664:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00666:	4def      	ldr	r5, [pc, #956]	@ (c0d00a24 <io_event+0x3c0>)
c0d00668:	7828      	ldrb	r0, [r5, #0]
c0d0066a:	2815      	cmp	r0, #21
c0d0066c:	d100      	bne.n	c0d00670 <io_event+0xc>
c0d0066e:	e0b8      	b.n	c0d007e2 <io_event+0x17e>
c0d00670:	280d      	cmp	r0, #13
c0d00672:	d100      	bne.n	c0d00676 <io_event+0x12>
c0d00674:	e0bd      	b.n	c0d007f2 <io_event+0x18e>
c0d00676:	280e      	cmp	r0, #14
c0d00678:	d05c      	beq.n	c0d00734 <io_event+0xd0>
c0d0067a:	4ceb      	ldr	r4, [pc, #940]	@ (c0d00a28 <io_event+0x3c4>)
c0d0067c:	2700      	movs	r7, #0
c0d0067e:	2805      	cmp	r0, #5
c0d00680:	d000      	beq.n	c0d00684 <io_event+0x20>
c0d00682:	e0fd      	b.n	c0d00880 <io_event+0x21c>
c0d00684:	6067      	str	r7, [r4, #4]
c0d00686:	2001      	movs	r0, #1
c0d00688:	7020      	strb	r0, [r4, #0]
c0d0068a:	4620      	mov	r0, r4
c0d0068c:	f001 feb6 	bl	c0d023fc <os_ux>
c0d00690:	2004      	movs	r0, #4
c0d00692:	f001 ff17 	bl	c0d024c4 <os_sched_last_status>
c0d00696:	6060      	str	r0, [r4, #4]
c0d00698:	2800      	cmp	r0, #0
c0d0069a:	d100      	bne.n	c0d0069e <io_event+0x3a>
c0d0069c:	e246      	b.n	c0d00b2c <io_event+0x4c8>
c0d0069e:	2897      	cmp	r0, #151	@ 0x97
c0d006a0:	d100      	bne.n	c0d006a4 <io_event+0x40>
c0d006a2:	e243      	b.n	c0d00b2c <io_event+0x4c8>
c0d006a4:	2869      	cmp	r0, #105	@ 0x69
c0d006a6:	d000      	beq.n	c0d006aa <io_event+0x46>
c0d006a8:	e202      	b.n	c0d00ab0 <io_event+0x44c>
c0d006aa:	f001 fadb 	bl	c0d01c64 <io_seproxyhal_init_ux>
c0d006ae:	f001 fadb 	bl	c0d01c68 <io_seproxyhal_init_button>
c0d006b2:	25c2      	movs	r5, #194	@ 0xc2
c0d006b4:	4efd      	ldr	r6, [pc, #1012]	@ (c0d00aac <io_event+0x448>)
c0d006b6:	5377      	strh	r7, [r6, r5]
c0d006b8:	2004      	movs	r0, #4
c0d006ba:	f001 ff03 	bl	c0d024c4 <os_sched_last_status>
c0d006be:	6060      	str	r0, [r4, #4]
c0d006c0:	24c4      	movs	r4, #196	@ 0xc4
c0d006c2:	5931      	ldr	r1, [r6, r4]
c0d006c4:	2900      	cmp	r1, #0
c0d006c6:	d100      	bne.n	c0d006ca <io_event+0x66>
c0d006c8:	e230      	b.n	c0d00b2c <io_event+0x4c8>
c0d006ca:	2800      	cmp	r0, #0
c0d006cc:	d100      	bne.n	c0d006d0 <io_event+0x6c>
c0d006ce:	e22d      	b.n	c0d00b2c <io_event+0x4c8>
c0d006d0:	2897      	cmp	r0, #151	@ 0x97
c0d006d2:	d100      	bne.n	c0d006d6 <io_event+0x72>
c0d006d4:	e22a      	b.n	c0d00b2c <io_event+0x4c8>
c0d006d6:	5b70      	ldrh	r0, [r6, r5]
c0d006d8:	21c8      	movs	r1, #200	@ 0xc8
c0d006da:	5c71      	ldrb	r1, [r6, r1]
c0d006dc:	b280      	uxth	r0, r0
c0d006de:	4288      	cmp	r0, r1
c0d006e0:	d300      	bcc.n	c0d006e4 <io_event+0x80>
c0d006e2:	e223      	b.n	c0d00b2c <io_event+0x4c8>
c0d006e4:	f001 fec2 	bl	c0d0246c <io_seph_is_status_sent>
c0d006e8:	2800      	cmp	r0, #0
c0d006ea:	d000      	beq.n	c0d006ee <io_event+0x8a>
c0d006ec:	e21e      	b.n	c0d00b2c <io_event+0x4c8>
c0d006ee:	f001 fe57 	bl	c0d023a0 <os_perso_isonboarded>
c0d006f2:	28aa      	cmp	r0, #170	@ 0xaa
c0d006f4:	d104      	bne.n	c0d00700 <io_event+0x9c>
c0d006f6:	f001 fe75 	bl	c0d023e4 <os_global_pin_is_validated>
c0d006fa:	28aa      	cmp	r0, #170	@ 0xaa
c0d006fc:	d000      	beq.n	c0d00700 <io_event+0x9c>
c0d006fe:	e215      	b.n	c0d00b2c <io_event+0x4c8>
c0d00700:	5931      	ldr	r1, [r6, r4]
c0d00702:	5b72      	ldrh	r2, [r6, r5]
c0d00704:	0150      	lsls	r0, r2, #5
c0d00706:	1808      	adds	r0, r1, r0
c0d00708:	23d0      	movs	r3, #208	@ 0xd0
c0d0070a:	58f3      	ldr	r3, [r6, r3]
c0d0070c:	2b00      	cmp	r3, #0
c0d0070e:	d004      	beq.n	c0d0071a <io_event+0xb6>
c0d00710:	4798      	blx	r3
c0d00712:	2800      	cmp	r0, #0
c0d00714:	d007      	beq.n	c0d00726 <io_event+0xc2>
c0d00716:	5b72      	ldrh	r2, [r6, r5]
c0d00718:	5931      	ldr	r1, [r6, r4]
c0d0071a:	2801      	cmp	r0, #1
c0d0071c:	d101      	bne.n	c0d00722 <io_event+0xbe>
c0d0071e:	0150      	lsls	r0, r2, #5
c0d00720:	1808      	adds	r0, r1, r0
c0d00722:	f7ff ff9a 	bl	c0d0065a <io_seproxyhal_display>
c0d00726:	5b70      	ldrh	r0, [r6, r5]
c0d00728:	1c40      	adds	r0, r0, #1
c0d0072a:	5370      	strh	r0, [r6, r5]
c0d0072c:	5931      	ldr	r1, [r6, r4]
c0d0072e:	2900      	cmp	r1, #0
c0d00730:	d1d2      	bne.n	c0d006d8 <io_event+0x74>
c0d00732:	e1fb      	b.n	c0d00b2c <io_event+0x4c8>
c0d00734:	f7ff ff95 	bl	c0d00662 <app_ticker_event_callback>
c0d00738:	4dbb      	ldr	r5, [pc, #748]	@ (c0d00a28 <io_event+0x3c4>)
c0d0073a:	2600      	movs	r6, #0
c0d0073c:	606e      	str	r6, [r5, #4]
c0d0073e:	2001      	movs	r0, #1
c0d00740:	7028      	strb	r0, [r5, #0]
c0d00742:	4628      	mov	r0, r5
c0d00744:	f001 fe5a 	bl	c0d023fc <os_ux>
c0d00748:	2004      	movs	r0, #4
c0d0074a:	f001 febb 	bl	c0d024c4 <os_sched_last_status>
c0d0074e:	6068      	str	r0, [r5, #4]
c0d00750:	2869      	cmp	r0, #105	@ 0x69
c0d00752:	d000      	beq.n	c0d00756 <io_event+0xf2>
c0d00754:	e0e6      	b.n	c0d00924 <io_event+0x2c0>
c0d00756:	f001 fa85 	bl	c0d01c64 <io_seproxyhal_init_ux>
c0d0075a:	f001 fa85 	bl	c0d01c68 <io_seproxyhal_init_button>
c0d0075e:	24c2      	movs	r4, #194	@ 0xc2
c0d00760:	4ef9      	ldr	r6, [pc, #996]	@ (c0d00b48 <io_event+0x4e4>)
c0d00762:	2000      	movs	r0, #0
c0d00764:	5330      	strh	r0, [r6, r4]
c0d00766:	2004      	movs	r0, #4
c0d00768:	f001 feac 	bl	c0d024c4 <os_sched_last_status>
c0d0076c:	6068      	str	r0, [r5, #4]
c0d0076e:	25c4      	movs	r5, #196	@ 0xc4
c0d00770:	5971      	ldr	r1, [r6, r5]
c0d00772:	2900      	cmp	r1, #0
c0d00774:	d100      	bne.n	c0d00778 <io_event+0x114>
c0d00776:	e1d9      	b.n	c0d00b2c <io_event+0x4c8>
c0d00778:	2800      	cmp	r0, #0
c0d0077a:	d100      	bne.n	c0d0077e <io_event+0x11a>
c0d0077c:	e1d6      	b.n	c0d00b2c <io_event+0x4c8>
c0d0077e:	2897      	cmp	r0, #151	@ 0x97
c0d00780:	d100      	bne.n	c0d00784 <io_event+0x120>
c0d00782:	e1d3      	b.n	c0d00b2c <io_event+0x4c8>
c0d00784:	5b30      	ldrh	r0, [r6, r4]
c0d00786:	21c8      	movs	r1, #200	@ 0xc8
c0d00788:	5c71      	ldrb	r1, [r6, r1]
c0d0078a:	b280      	uxth	r0, r0
c0d0078c:	4288      	cmp	r0, r1
c0d0078e:	d300      	bcc.n	c0d00792 <io_event+0x12e>
c0d00790:	e1cc      	b.n	c0d00b2c <io_event+0x4c8>
c0d00792:	f001 fe6b 	bl	c0d0246c <io_seph_is_status_sent>
c0d00796:	2800      	cmp	r0, #0
c0d00798:	d000      	beq.n	c0d0079c <io_event+0x138>
c0d0079a:	e1c7      	b.n	c0d00b2c <io_event+0x4c8>
c0d0079c:	f001 fe00 	bl	c0d023a0 <os_perso_isonboarded>
c0d007a0:	28aa      	cmp	r0, #170	@ 0xaa
c0d007a2:	d104      	bne.n	c0d007ae <io_event+0x14a>
c0d007a4:	f001 fe1e 	bl	c0d023e4 <os_global_pin_is_validated>
c0d007a8:	28aa      	cmp	r0, #170	@ 0xaa
c0d007aa:	d000      	beq.n	c0d007ae <io_event+0x14a>
c0d007ac:	e1be      	b.n	c0d00b2c <io_event+0x4c8>
c0d007ae:	5971      	ldr	r1, [r6, r5]
c0d007b0:	5b32      	ldrh	r2, [r6, r4]
c0d007b2:	0150      	lsls	r0, r2, #5
c0d007b4:	1808      	adds	r0, r1, r0
c0d007b6:	23d0      	movs	r3, #208	@ 0xd0
c0d007b8:	58f3      	ldr	r3, [r6, r3]
c0d007ba:	2b00      	cmp	r3, #0
c0d007bc:	d004      	beq.n	c0d007c8 <io_event+0x164>
c0d007be:	4798      	blx	r3
c0d007c0:	2800      	cmp	r0, #0
c0d007c2:	d007      	beq.n	c0d007d4 <io_event+0x170>
c0d007c4:	5b32      	ldrh	r2, [r6, r4]
c0d007c6:	5971      	ldr	r1, [r6, r5]
c0d007c8:	2801      	cmp	r0, #1
c0d007ca:	d101      	bne.n	c0d007d0 <io_event+0x16c>
c0d007cc:	0150      	lsls	r0, r2, #5
c0d007ce:	1808      	adds	r0, r1, r0
c0d007d0:	f7ff ff43 	bl	c0d0065a <io_seproxyhal_display>
c0d007d4:	5b30      	ldrh	r0, [r6, r4]
c0d007d6:	1c40      	adds	r0, r0, #1
c0d007d8:	5330      	strh	r0, [r6, r4]
c0d007da:	5971      	ldr	r1, [r6, r5]
c0d007dc:	2900      	cmp	r1, #0
c0d007de:	d1d2      	bne.n	c0d00786 <io_event+0x122>
c0d007e0:	e1a4      	b.n	c0d00b2c <io_event+0x4c8>
c0d007e2:	48da      	ldr	r0, [pc, #872]	@ (c0d00b4c <io_event+0x4e8>)
c0d007e4:	7980      	ldrb	r0, [r0, #6]
c0d007e6:	2801      	cmp	r0, #1
c0d007e8:	d103      	bne.n	c0d007f2 <io_event+0x18e>
c0d007ea:	79a8      	ldrb	r0, [r5, #6]
c0d007ec:	0700      	lsls	r0, r0, #28
c0d007ee:	d400      	bmi.n	c0d007f2 <io_event+0x18e>
c0d007f0:	e1a4      	b.n	c0d00b3c <io_event+0x4d8>
c0d007f2:	4cd4      	ldr	r4, [pc, #848]	@ (c0d00b44 <io_event+0x4e0>)
c0d007f4:	2700      	movs	r7, #0
c0d007f6:	6067      	str	r7, [r4, #4]
c0d007f8:	2001      	movs	r0, #1
c0d007fa:	7020      	strb	r0, [r4, #0]
c0d007fc:	4620      	mov	r0, r4
c0d007fe:	f001 fdfd 	bl	c0d023fc <os_ux>
c0d00802:	2004      	movs	r0, #4
c0d00804:	f001 fe5e 	bl	c0d024c4 <os_sched_last_status>
c0d00808:	6060      	str	r0, [r4, #4]
c0d0080a:	2800      	cmp	r0, #0
c0d0080c:	d100      	bne.n	c0d00810 <io_event+0x1ac>
c0d0080e:	e18d      	b.n	c0d00b2c <io_event+0x4c8>
c0d00810:	2869      	cmp	r0, #105	@ 0x69
c0d00812:	d100      	bne.n	c0d00816 <io_event+0x1b2>
c0d00814:	e10a      	b.n	c0d00a2c <io_event+0x3c8>
c0d00816:	2897      	cmp	r0, #151	@ 0x97
c0d00818:	d100      	bne.n	c0d0081c <io_event+0x1b8>
c0d0081a:	e187      	b.n	c0d00b2c <io_event+0x4c8>
c0d0081c:	4cca      	ldr	r4, [pc, #808]	@ (c0d00b48 <io_event+0x4e4>)
c0d0081e:	26c4      	movs	r6, #196	@ 0xc4
c0d00820:	59a0      	ldr	r0, [r4, r6]
c0d00822:	2800      	cmp	r0, #0
c0d00824:	d100      	bne.n	c0d00828 <io_event+0x1c4>
c0d00826:	e179      	b.n	c0d00b1c <io_event+0x4b8>
c0d00828:	20c8      	movs	r0, #200	@ 0xc8
c0d0082a:	5c20      	ldrb	r0, [r4, r0]
c0d0082c:	25c2      	movs	r5, #194	@ 0xc2
c0d0082e:	5b61      	ldrh	r1, [r4, r5]
c0d00830:	4281      	cmp	r1, r0
c0d00832:	d300      	bcc.n	c0d00836 <io_event+0x1d2>
c0d00834:	e172      	b.n	c0d00b1c <io_event+0x4b8>
c0d00836:	f001 fe19 	bl	c0d0246c <io_seph_is_status_sent>
c0d0083a:	2800      	cmp	r0, #0
c0d0083c:	d000      	beq.n	c0d00840 <io_event+0x1dc>
c0d0083e:	e16d      	b.n	c0d00b1c <io_event+0x4b8>
c0d00840:	f001 fdae 	bl	c0d023a0 <os_perso_isonboarded>
c0d00844:	28aa      	cmp	r0, #170	@ 0xaa
c0d00846:	d104      	bne.n	c0d00852 <io_event+0x1ee>
c0d00848:	f001 fdcc 	bl	c0d023e4 <os_global_pin_is_validated>
c0d0084c:	28aa      	cmp	r0, #170	@ 0xaa
c0d0084e:	d000      	beq.n	c0d00852 <io_event+0x1ee>
c0d00850:	e164      	b.n	c0d00b1c <io_event+0x4b8>
c0d00852:	59a1      	ldr	r1, [r4, r6]
c0d00854:	5b62      	ldrh	r2, [r4, r5]
c0d00856:	0150      	lsls	r0, r2, #5
c0d00858:	1808      	adds	r0, r1, r0
c0d0085a:	23d0      	movs	r3, #208	@ 0xd0
c0d0085c:	58e3      	ldr	r3, [r4, r3]
c0d0085e:	2b00      	cmp	r3, #0
c0d00860:	d004      	beq.n	c0d0086c <io_event+0x208>
c0d00862:	4798      	blx	r3
c0d00864:	2800      	cmp	r0, #0
c0d00866:	d007      	beq.n	c0d00878 <io_event+0x214>
c0d00868:	5b62      	ldrh	r2, [r4, r5]
c0d0086a:	59a1      	ldr	r1, [r4, r6]
c0d0086c:	2801      	cmp	r0, #1
c0d0086e:	d101      	bne.n	c0d00874 <io_event+0x210>
c0d00870:	0150      	lsls	r0, r2, #5
c0d00872:	1808      	adds	r0, r1, r0
c0d00874:	f7ff fef1 	bl	c0d0065a <io_seproxyhal_display>
c0d00878:	5b60      	ldrh	r0, [r4, r5]
c0d0087a:	1c40      	adds	r0, r0, #1
c0d0087c:	5360      	strh	r0, [r4, r5]
c0d0087e:	e7ce      	b.n	c0d0081e <io_event+0x1ba>
c0d00880:	6067      	str	r7, [r4, #4]
c0d00882:	2001      	movs	r0, #1
c0d00884:	7020      	strb	r0, [r4, #0]
c0d00886:	4620      	mov	r0, r4
c0d00888:	f001 fdb8 	bl	c0d023fc <os_ux>
c0d0088c:	2004      	movs	r0, #4
c0d0088e:	f001 fe19 	bl	c0d024c4 <os_sched_last_status>
c0d00892:	6060      	str	r0, [r4, #4]
c0d00894:	2869      	cmp	r0, #105	@ 0x69
c0d00896:	d000      	beq.n	c0d0089a <io_event+0x236>
c0d00898:	e091      	b.n	c0d009be <io_event+0x35a>
c0d0089a:	f001 f9e3 	bl	c0d01c64 <io_seproxyhal_init_ux>
c0d0089e:	f001 f9e3 	bl	c0d01c68 <io_seproxyhal_init_button>
c0d008a2:	25c2      	movs	r5, #194	@ 0xc2
c0d008a4:	4ea8      	ldr	r6, [pc, #672]	@ (c0d00b48 <io_event+0x4e4>)
c0d008a6:	5377      	strh	r7, [r6, r5]
c0d008a8:	2004      	movs	r0, #4
c0d008aa:	f001 fe0b 	bl	c0d024c4 <os_sched_last_status>
c0d008ae:	6060      	str	r0, [r4, #4]
c0d008b0:	24c4      	movs	r4, #196	@ 0xc4
c0d008b2:	5931      	ldr	r1, [r6, r4]
c0d008b4:	2900      	cmp	r1, #0
c0d008b6:	d100      	bne.n	c0d008ba <io_event+0x256>
c0d008b8:	e138      	b.n	c0d00b2c <io_event+0x4c8>
c0d008ba:	2800      	cmp	r0, #0
c0d008bc:	d100      	bne.n	c0d008c0 <io_event+0x25c>
c0d008be:	e135      	b.n	c0d00b2c <io_event+0x4c8>
c0d008c0:	2897      	cmp	r0, #151	@ 0x97
c0d008c2:	d100      	bne.n	c0d008c6 <io_event+0x262>
c0d008c4:	e132      	b.n	c0d00b2c <io_event+0x4c8>
c0d008c6:	5b70      	ldrh	r0, [r6, r5]
c0d008c8:	21c8      	movs	r1, #200	@ 0xc8
c0d008ca:	5c71      	ldrb	r1, [r6, r1]
c0d008cc:	b280      	uxth	r0, r0
c0d008ce:	4288      	cmp	r0, r1
c0d008d0:	d300      	bcc.n	c0d008d4 <io_event+0x270>
c0d008d2:	e12b      	b.n	c0d00b2c <io_event+0x4c8>
c0d008d4:	f001 fdca 	bl	c0d0246c <io_seph_is_status_sent>
c0d008d8:	2800      	cmp	r0, #0
c0d008da:	d000      	beq.n	c0d008de <io_event+0x27a>
c0d008dc:	e126      	b.n	c0d00b2c <io_event+0x4c8>
c0d008de:	f001 fd5f 	bl	c0d023a0 <os_perso_isonboarded>
c0d008e2:	28aa      	cmp	r0, #170	@ 0xaa
c0d008e4:	d104      	bne.n	c0d008f0 <io_event+0x28c>
c0d008e6:	f001 fd7d 	bl	c0d023e4 <os_global_pin_is_validated>
c0d008ea:	28aa      	cmp	r0, #170	@ 0xaa
c0d008ec:	d000      	beq.n	c0d008f0 <io_event+0x28c>
c0d008ee:	e11d      	b.n	c0d00b2c <io_event+0x4c8>
c0d008f0:	5931      	ldr	r1, [r6, r4]
c0d008f2:	5b72      	ldrh	r2, [r6, r5]
c0d008f4:	0150      	lsls	r0, r2, #5
c0d008f6:	1808      	adds	r0, r1, r0
c0d008f8:	23d0      	movs	r3, #208	@ 0xd0
c0d008fa:	58f3      	ldr	r3, [r6, r3]
c0d008fc:	2b00      	cmp	r3, #0
c0d008fe:	d004      	beq.n	c0d0090a <io_event+0x2a6>
c0d00900:	4798      	blx	r3
c0d00902:	2800      	cmp	r0, #0
c0d00904:	d007      	beq.n	c0d00916 <io_event+0x2b2>
c0d00906:	5b72      	ldrh	r2, [r6, r5]
c0d00908:	5931      	ldr	r1, [r6, r4]
c0d0090a:	2801      	cmp	r0, #1
c0d0090c:	d101      	bne.n	c0d00912 <io_event+0x2ae>
c0d0090e:	0150      	lsls	r0, r2, #5
c0d00910:	1808      	adds	r0, r1, r0
c0d00912:	f7ff fea2 	bl	c0d0065a <io_seproxyhal_display>
c0d00916:	5b70      	ldrh	r0, [r6, r5]
c0d00918:	1c40      	adds	r0, r0, #1
c0d0091a:	5370      	strh	r0, [r6, r5]
c0d0091c:	5931      	ldr	r1, [r6, r4]
c0d0091e:	2900      	cmp	r1, #0
c0d00920:	d1d2      	bne.n	c0d008c8 <io_event+0x264>
c0d00922:	e103      	b.n	c0d00b2c <io_event+0x4c8>
c0d00924:	4604      	mov	r4, r0
c0d00926:	20dc      	movs	r0, #220	@ 0xdc
c0d00928:	4d87      	ldr	r5, [pc, #540]	@ (c0d00b48 <io_event+0x4e4>)
c0d0092a:	5829      	ldr	r1, [r5, r0]
c0d0092c:	2900      	cmp	r1, #0
c0d0092e:	d00f      	beq.n	c0d00950 <io_event+0x2ec>
c0d00930:	460a      	mov	r2, r1
c0d00932:	3a64      	subs	r2, #100	@ 0x64
c0d00934:	d200      	bcs.n	c0d00938 <io_event+0x2d4>
c0d00936:	4632      	mov	r2, r6
c0d00938:	502a      	str	r2, [r5, r0]
c0d0093a:	2964      	cmp	r1, #100	@ 0x64
c0d0093c:	d808      	bhi.n	c0d00950 <io_event+0x2ec>
c0d0093e:	21d8      	movs	r1, #216	@ 0xd8
c0d00940:	5869      	ldr	r1, [r5, r1]
c0d00942:	2900      	cmp	r1, #0
c0d00944:	d004      	beq.n	c0d00950 <io_event+0x2ec>
c0d00946:	22e0      	movs	r2, #224	@ 0xe0
c0d00948:	58aa      	ldr	r2, [r5, r2]
c0d0094a:	502a      	str	r2, [r5, r0]
c0d0094c:	2000      	movs	r0, #0
c0d0094e:	4788      	blx	r1
c0d00950:	2c00      	cmp	r4, #0
c0d00952:	d100      	bne.n	c0d00956 <io_event+0x2f2>
c0d00954:	e0ea      	b.n	c0d00b2c <io_event+0x4c8>
c0d00956:	2c97      	cmp	r4, #151	@ 0x97
c0d00958:	d128      	bne.n	c0d009ac <io_event+0x348>
c0d0095a:	e0e7      	b.n	c0d00b2c <io_event+0x4c8>
c0d0095c:	20c8      	movs	r0, #200	@ 0xc8
c0d0095e:	5c28      	ldrb	r0, [r5, r0]
c0d00960:	24c2      	movs	r4, #194	@ 0xc2
c0d00962:	5b29      	ldrh	r1, [r5, r4]
c0d00964:	4281      	cmp	r1, r0
c0d00966:	d225      	bcs.n	c0d009b4 <io_event+0x350>
c0d00968:	f001 fd80 	bl	c0d0246c <io_seph_is_status_sent>
c0d0096c:	2800      	cmp	r0, #0
c0d0096e:	d121      	bne.n	c0d009b4 <io_event+0x350>
c0d00970:	f001 fd16 	bl	c0d023a0 <os_perso_isonboarded>
c0d00974:	28aa      	cmp	r0, #170	@ 0xaa
c0d00976:	d103      	bne.n	c0d00980 <io_event+0x31c>
c0d00978:	f001 fd34 	bl	c0d023e4 <os_global_pin_is_validated>
c0d0097c:	28aa      	cmp	r0, #170	@ 0xaa
c0d0097e:	d119      	bne.n	c0d009b4 <io_event+0x350>
c0d00980:	59a9      	ldr	r1, [r5, r6]
c0d00982:	5b2a      	ldrh	r2, [r5, r4]
c0d00984:	0150      	lsls	r0, r2, #5
c0d00986:	1808      	adds	r0, r1, r0
c0d00988:	23d0      	movs	r3, #208	@ 0xd0
c0d0098a:	58eb      	ldr	r3, [r5, r3]
c0d0098c:	2b00      	cmp	r3, #0
c0d0098e:	d004      	beq.n	c0d0099a <io_event+0x336>
c0d00990:	4798      	blx	r3
c0d00992:	2800      	cmp	r0, #0
c0d00994:	d007      	beq.n	c0d009a6 <io_event+0x342>
c0d00996:	5b2a      	ldrh	r2, [r5, r4]
c0d00998:	59a9      	ldr	r1, [r5, r6]
c0d0099a:	2801      	cmp	r0, #1
c0d0099c:	d101      	bne.n	c0d009a2 <io_event+0x33e>
c0d0099e:	0150      	lsls	r0, r2, #5
c0d009a0:	1808      	adds	r0, r1, r0
c0d009a2:	f7ff fe5a 	bl	c0d0065a <io_seproxyhal_display>
c0d009a6:	5b28      	ldrh	r0, [r5, r4]
c0d009a8:	1c40      	adds	r0, r0, #1
c0d009aa:	5328      	strh	r0, [r5, r4]
c0d009ac:	26c4      	movs	r6, #196	@ 0xc4
c0d009ae:	59a8      	ldr	r0, [r5, r6]
c0d009b0:	2800      	cmp	r0, #0
c0d009b2:	d1d3      	bne.n	c0d0095c <io_event+0x2f8>
c0d009b4:	20c8      	movs	r0, #200	@ 0xc8
c0d009b6:	5c28      	ldrb	r0, [r5, r0]
c0d009b8:	21c2      	movs	r1, #194	@ 0xc2
c0d009ba:	5a69      	ldrh	r1, [r5, r1]
c0d009bc:	e0b2      	b.n	c0d00b24 <io_event+0x4c0>
c0d009be:	4c62      	ldr	r4, [pc, #392]	@ (c0d00b48 <io_event+0x4e4>)
c0d009c0:	26c4      	movs	r6, #196	@ 0xc4
c0d009c2:	59a0      	ldr	r0, [r4, r6]
c0d009c4:	2800      	cmp	r0, #0
c0d009c6:	d100      	bne.n	c0d009ca <io_event+0x366>
c0d009c8:	e0a8      	b.n	c0d00b1c <io_event+0x4b8>
c0d009ca:	20c8      	movs	r0, #200	@ 0xc8
c0d009cc:	5c20      	ldrb	r0, [r4, r0]
c0d009ce:	25c2      	movs	r5, #194	@ 0xc2
c0d009d0:	5b61      	ldrh	r1, [r4, r5]
c0d009d2:	4281      	cmp	r1, r0
c0d009d4:	d300      	bcc.n	c0d009d8 <io_event+0x374>
c0d009d6:	e0a1      	b.n	c0d00b1c <io_event+0x4b8>
c0d009d8:	f001 fd48 	bl	c0d0246c <io_seph_is_status_sent>
c0d009dc:	2800      	cmp	r0, #0
c0d009de:	d000      	beq.n	c0d009e2 <io_event+0x37e>
c0d009e0:	e09c      	b.n	c0d00b1c <io_event+0x4b8>
c0d009e2:	f001 fcdd 	bl	c0d023a0 <os_perso_isonboarded>
c0d009e6:	28aa      	cmp	r0, #170	@ 0xaa
c0d009e8:	d104      	bne.n	c0d009f4 <io_event+0x390>
c0d009ea:	f001 fcfb 	bl	c0d023e4 <os_global_pin_is_validated>
c0d009ee:	28aa      	cmp	r0, #170	@ 0xaa
c0d009f0:	d000      	beq.n	c0d009f4 <io_event+0x390>
c0d009f2:	e093      	b.n	c0d00b1c <io_event+0x4b8>
c0d009f4:	59a1      	ldr	r1, [r4, r6]
c0d009f6:	5b62      	ldrh	r2, [r4, r5]
c0d009f8:	0150      	lsls	r0, r2, #5
c0d009fa:	1808      	adds	r0, r1, r0
c0d009fc:	23d0      	movs	r3, #208	@ 0xd0
c0d009fe:	58e3      	ldr	r3, [r4, r3]
c0d00a00:	2b00      	cmp	r3, #0
c0d00a02:	d004      	beq.n	c0d00a0e <io_event+0x3aa>
c0d00a04:	4798      	blx	r3
c0d00a06:	2800      	cmp	r0, #0
c0d00a08:	d007      	beq.n	c0d00a1a <io_event+0x3b6>
c0d00a0a:	5b62      	ldrh	r2, [r4, r5]
c0d00a0c:	59a1      	ldr	r1, [r4, r6]
c0d00a0e:	2801      	cmp	r0, #1
c0d00a10:	d101      	bne.n	c0d00a16 <io_event+0x3b2>
c0d00a12:	0150      	lsls	r0, r2, #5
c0d00a14:	1808      	adds	r0, r1, r0
c0d00a16:	f7ff fe20 	bl	c0d0065a <io_seproxyhal_display>
c0d00a1a:	5b60      	ldrh	r0, [r4, r5]
c0d00a1c:	1c40      	adds	r0, r0, #1
c0d00a1e:	5360      	strh	r0, [r4, r5]
c0d00a20:	e7ce      	b.n	c0d009c0 <io_event+0x35c>
c0d00a22:	46c0      	nop			@ (mov r8, r8)
c0d00a24:	2000027c 	.word	0x2000027c
c0d00a28:	20000404 	.word	0x20000404
c0d00a2c:	f001 f91a 	bl	c0d01c64 <io_seproxyhal_init_ux>
c0d00a30:	f001 f91a 	bl	c0d01c68 <io_seproxyhal_init_button>
c0d00a34:	25c2      	movs	r5, #194	@ 0xc2
c0d00a36:	4e44      	ldr	r6, [pc, #272]	@ (c0d00b48 <io_event+0x4e4>)
c0d00a38:	5377      	strh	r7, [r6, r5]
c0d00a3a:	2004      	movs	r0, #4
c0d00a3c:	f001 fd42 	bl	c0d024c4 <os_sched_last_status>
c0d00a40:	6060      	str	r0, [r4, #4]
c0d00a42:	24c4      	movs	r4, #196	@ 0xc4
c0d00a44:	5931      	ldr	r1, [r6, r4]
c0d00a46:	2900      	cmp	r1, #0
c0d00a48:	d070      	beq.n	c0d00b2c <io_event+0x4c8>
c0d00a4a:	2800      	cmp	r0, #0
c0d00a4c:	d06e      	beq.n	c0d00b2c <io_event+0x4c8>
c0d00a4e:	2897      	cmp	r0, #151	@ 0x97
c0d00a50:	d06c      	beq.n	c0d00b2c <io_event+0x4c8>
c0d00a52:	5b70      	ldrh	r0, [r6, r5]
c0d00a54:	21c8      	movs	r1, #200	@ 0xc8
c0d00a56:	5c71      	ldrb	r1, [r6, r1]
c0d00a58:	b280      	uxth	r0, r0
c0d00a5a:	4288      	cmp	r0, r1
c0d00a5c:	d266      	bcs.n	c0d00b2c <io_event+0x4c8>
c0d00a5e:	f001 fd05 	bl	c0d0246c <io_seph_is_status_sent>
c0d00a62:	2800      	cmp	r0, #0
c0d00a64:	d162      	bne.n	c0d00b2c <io_event+0x4c8>
c0d00a66:	f001 fc9b 	bl	c0d023a0 <os_perso_isonboarded>
c0d00a6a:	28aa      	cmp	r0, #170	@ 0xaa
c0d00a6c:	d103      	bne.n	c0d00a76 <io_event+0x412>
c0d00a6e:	f001 fcb9 	bl	c0d023e4 <os_global_pin_is_validated>
c0d00a72:	28aa      	cmp	r0, #170	@ 0xaa
c0d00a74:	d15a      	bne.n	c0d00b2c <io_event+0x4c8>
c0d00a76:	5931      	ldr	r1, [r6, r4]
c0d00a78:	5b72      	ldrh	r2, [r6, r5]
c0d00a7a:	0150      	lsls	r0, r2, #5
c0d00a7c:	1808      	adds	r0, r1, r0
c0d00a7e:	23d0      	movs	r3, #208	@ 0xd0
c0d00a80:	58f3      	ldr	r3, [r6, r3]
c0d00a82:	2b00      	cmp	r3, #0
c0d00a84:	d004      	beq.n	c0d00a90 <io_event+0x42c>
c0d00a86:	4798      	blx	r3
c0d00a88:	2800      	cmp	r0, #0
c0d00a8a:	d007      	beq.n	c0d00a9c <io_event+0x438>
c0d00a8c:	5b72      	ldrh	r2, [r6, r5]
c0d00a8e:	5931      	ldr	r1, [r6, r4]
c0d00a90:	2801      	cmp	r0, #1
c0d00a92:	d101      	bne.n	c0d00a98 <io_event+0x434>
c0d00a94:	0150      	lsls	r0, r2, #5
c0d00a96:	1808      	adds	r0, r1, r0
c0d00a98:	f7ff fddf 	bl	c0d0065a <io_seproxyhal_display>
c0d00a9c:	5b70      	ldrh	r0, [r6, r5]
c0d00a9e:	1c40      	adds	r0, r0, #1
c0d00aa0:	5370      	strh	r0, [r6, r5]
c0d00aa2:	5931      	ldr	r1, [r6, r4]
c0d00aa4:	2900      	cmp	r1, #0
c0d00aa6:	d1d5      	bne.n	c0d00a54 <io_event+0x3f0>
c0d00aa8:	e040      	b.n	c0d00b2c <io_event+0x4c8>
c0d00aaa:	46c0      	nop			@ (mov r8, r8)
c0d00aac:	200002fc 	.word	0x200002fc
c0d00ab0:	20d4      	movs	r0, #212	@ 0xd4
c0d00ab2:	4c25      	ldr	r4, [pc, #148]	@ (c0d00b48 <io_event+0x4e4>)
c0d00ab4:	5820      	ldr	r0, [r4, r0]
c0d00ab6:	2800      	cmp	r0, #0
c0d00ab8:	d003      	beq.n	c0d00ac2 <io_event+0x45e>
c0d00aba:	78e9      	ldrb	r1, [r5, #3]
c0d00abc:	0849      	lsrs	r1, r1, #1
c0d00abe:	f001 f975 	bl	c0d01dac <io_seproxyhal_button_push>
c0d00ac2:	26c4      	movs	r6, #196	@ 0xc4
c0d00ac4:	59a0      	ldr	r0, [r4, r6]
c0d00ac6:	2800      	cmp	r0, #0
c0d00ac8:	d028      	beq.n	c0d00b1c <io_event+0x4b8>
c0d00aca:	20c8      	movs	r0, #200	@ 0xc8
c0d00acc:	5c20      	ldrb	r0, [r4, r0]
c0d00ace:	25c2      	movs	r5, #194	@ 0xc2
c0d00ad0:	5b61      	ldrh	r1, [r4, r5]
c0d00ad2:	4281      	cmp	r1, r0
c0d00ad4:	d222      	bcs.n	c0d00b1c <io_event+0x4b8>
c0d00ad6:	f001 fcc9 	bl	c0d0246c <io_seph_is_status_sent>
c0d00ada:	2800      	cmp	r0, #0
c0d00adc:	d11e      	bne.n	c0d00b1c <io_event+0x4b8>
c0d00ade:	f001 fc5f 	bl	c0d023a0 <os_perso_isonboarded>
c0d00ae2:	28aa      	cmp	r0, #170	@ 0xaa
c0d00ae4:	d103      	bne.n	c0d00aee <io_event+0x48a>
c0d00ae6:	f001 fc7d 	bl	c0d023e4 <os_global_pin_is_validated>
c0d00aea:	28aa      	cmp	r0, #170	@ 0xaa
c0d00aec:	d116      	bne.n	c0d00b1c <io_event+0x4b8>
c0d00aee:	59a1      	ldr	r1, [r4, r6]
c0d00af0:	5b62      	ldrh	r2, [r4, r5]
c0d00af2:	0150      	lsls	r0, r2, #5
c0d00af4:	1808      	adds	r0, r1, r0
c0d00af6:	23d0      	movs	r3, #208	@ 0xd0
c0d00af8:	58e3      	ldr	r3, [r4, r3]
c0d00afa:	2b00      	cmp	r3, #0
c0d00afc:	d004      	beq.n	c0d00b08 <io_event+0x4a4>
c0d00afe:	4798      	blx	r3
c0d00b00:	2800      	cmp	r0, #0
c0d00b02:	d007      	beq.n	c0d00b14 <io_event+0x4b0>
c0d00b04:	5b62      	ldrh	r2, [r4, r5]
c0d00b06:	59a1      	ldr	r1, [r4, r6]
c0d00b08:	2801      	cmp	r0, #1
c0d00b0a:	d101      	bne.n	c0d00b10 <io_event+0x4ac>
c0d00b0c:	0150      	lsls	r0, r2, #5
c0d00b0e:	1808      	adds	r0, r1, r0
c0d00b10:	f7ff fda3 	bl	c0d0065a <io_seproxyhal_display>
c0d00b14:	5b60      	ldrh	r0, [r4, r5]
c0d00b16:	1c40      	adds	r0, r0, #1
c0d00b18:	5360      	strh	r0, [r4, r5]
c0d00b1a:	e7d2      	b.n	c0d00ac2 <io_event+0x45e>
c0d00b1c:	20c8      	movs	r0, #200	@ 0xc8
c0d00b1e:	5c20      	ldrb	r0, [r4, r0]
c0d00b20:	21c2      	movs	r1, #194	@ 0xc2
c0d00b22:	5a61      	ldrh	r1, [r4, r1]
c0d00b24:	4281      	cmp	r1, r0
c0d00b26:	d301      	bcc.n	c0d00b2c <io_event+0x4c8>
c0d00b28:	f001 fca0 	bl	c0d0246c <io_seph_is_status_sent>
c0d00b2c:	f001 fc9e 	bl	c0d0246c <io_seph_is_status_sent>
c0d00b30:	2800      	cmp	r0, #0
c0d00b32:	d101      	bne.n	c0d00b38 <io_event+0x4d4>
c0d00b34:	f000 ffb2 	bl	c0d01a9c <io_seproxyhal_general_status>
c0d00b38:	2001      	movs	r0, #1
c0d00b3a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d00b3c:	2005      	movs	r0, #5
c0d00b3e:	f000 ffa6 	bl	c0d01a8e <os_longjmp>
c0d00b42:	46c0      	nop			@ (mov r8, r8)
c0d00b44:	20000404 	.word	0x20000404
c0d00b48:	200002fc 	.word	0x200002fc
c0d00b4c:	200005ec 	.word	0x200005ec

c0d00b50 <io_exchange_al>:
c0d00b50:	b5b0      	push	{r4, r5, r7, lr}
c0d00b52:	4605      	mov	r5, r0
c0d00b54:	2003      	movs	r0, #3
c0d00b56:	4028      	ands	r0, r5
c0d00b58:	2400      	movs	r4, #0
c0d00b5a:	2801      	cmp	r0, #1
c0d00b5c:	d012      	beq.n	c0d00b84 <io_exchange_al+0x34>
c0d00b5e:	2802      	cmp	r0, #2
c0d00b60:	d112      	bne.n	c0d00b88 <io_exchange_al+0x38>
c0d00b62:	2900      	cmp	r1, #0
c0d00b64:	d007      	beq.n	c0d00b76 <io_exchange_al+0x26>
c0d00b66:	480a      	ldr	r0, [pc, #40]	@ (c0d00b90 <io_exchange_al+0x40>)
c0d00b68:	f001 fc76 	bl	c0d02458 <io_seph_send>
c0d00b6c:	0628      	lsls	r0, r5, #24
c0d00b6e:	d509      	bpl.n	c0d00b84 <io_exchange_al+0x34>
c0d00b70:	f001 fc0c 	bl	c0d0238c <halt>
c0d00b74:	e006      	b.n	c0d00b84 <io_exchange_al+0x34>
c0d00b76:	2041      	movs	r0, #65	@ 0x41
c0d00b78:	0081      	lsls	r1, r0, #2
c0d00b7a:	4805      	ldr	r0, [pc, #20]	@ (c0d00b90 <io_exchange_al+0x40>)
c0d00b7c:	2200      	movs	r2, #0
c0d00b7e:	f001 fc7f 	bl	c0d02480 <io_seph_recv>
c0d00b82:	4604      	mov	r4, r0
c0d00b84:	4620      	mov	r0, r4
c0d00b86:	bdb0      	pop	{r4, r5, r7, pc}
c0d00b88:	2002      	movs	r0, #2
c0d00b8a:	f000 ff80 	bl	c0d01a8e <os_longjmp>
c0d00b8e:	46c0      	nop			@ (mov r8, r8)
c0d00b90:	200004e8 	.word	0x200004e8

c0d00b94 <common_app_init>:
c0d00b94:	b580      	push	{r7, lr}
c0d00b96:	2021      	movs	r0, #33	@ 0x21
c0d00b98:	00c1      	lsls	r1, r0, #3
c0d00b9a:	4806      	ldr	r0, [pc, #24]	@ (c0d00bb4 <common_app_init+0x20>)
c0d00b9c:	f001 fe16 	bl	c0d027cc <__aeabi_memclr>
c0d00ba0:	f001 f850 	bl	c0d01c44 <io_seproxyhal_init>
c0d00ba4:	2000      	movs	r0, #0
c0d00ba6:	f000 fefb 	bl	c0d019a0 <USB_power>
c0d00baa:	2001      	movs	r0, #1
c0d00bac:	f000 fef8 	bl	c0d019a0 <USB_power>
c0d00bb0:	bd80      	pop	{r7, pc}
c0d00bb2:	46c0      	nop			@ (mov r8, r8)
c0d00bb4:	200002fc 	.word	0x200002fc

c0d00bb8 <standalone_app_main>:
c0d00bb8:	b510      	push	{r4, lr}
c0d00bba:	b08c      	sub	sp, #48	@ 0x30
c0d00bbc:	466c      	mov	r4, sp
c0d00bbe:	4620      	mov	r0, r4
c0d00bc0:	f001 ff12 	bl	c0d029e8 <setjmp>
c0d00bc4:	85a0      	strh	r0, [r4, #44]	@ 0x2c
c0d00bc6:	0400      	lsls	r0, r0, #16
c0d00bc8:	d108      	bne.n	c0d00bdc <standalone_app_main+0x24>
c0d00bca:	4668      	mov	r0, sp
c0d00bcc:	f001 fc6e 	bl	c0d024ac <try_context_set>
c0d00bd0:	900a      	str	r0, [sp, #40]	@ 0x28
c0d00bd2:	f7ff ffdf 	bl	c0d00b94 <common_app_init>
c0d00bd6:	f7ff fa13 	bl	c0d00000 <app_main>
c0d00bda:	e005      	b.n	c0d00be8 <standalone_app_main+0x30>
c0d00bdc:	4668      	mov	r0, sp
c0d00bde:	2100      	movs	r1, #0
c0d00be0:	8581      	strh	r1, [r0, #44]	@ 0x2c
c0d00be2:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0d00be4:	f001 fc62 	bl	c0d024ac <try_context_set>
c0d00be8:	f001 fc56 	bl	c0d02498 <try_context_get>
c0d00bec:	4669      	mov	r1, sp
c0d00bee:	4288      	cmp	r0, r1
c0d00bf0:	d102      	bne.n	c0d00bf8 <standalone_app_main+0x40>
c0d00bf2:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0d00bf4:	f001 fc5a 	bl	c0d024ac <try_context_set>
c0d00bf8:	4668      	mov	r0, sp
c0d00bfa:	8d80      	ldrh	r0, [r0, #44]	@ 0x2c
c0d00bfc:	2800      	cmp	r0, #0
c0d00bfe:	d101      	bne.n	c0d00c04 <standalone_app_main+0x4c>
c0d00c00:	f7ff fa21 	bl	c0d00046 <app_exit>
c0d00c04:	f000 ff43 	bl	c0d01a8e <os_longjmp>

c0d00c08 <USBD_HID_Setup>:
c0d00c08:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d00c0a:	460e      	mov	r6, r1
c0d00c0c:	4605      	mov	r5, r0
c0d00c0e:	a802      	add	r0, sp, #8
c0d00c10:	2400      	movs	r4, #0
c0d00c12:	8004      	strh	r4, [r0, #0]
c0d00c14:	a801      	add	r0, sp, #4
c0d00c16:	7004      	strb	r4, [r0, #0]
c0d00c18:	7809      	ldrb	r1, [r1, #0]
c0d00c1a:	2060      	movs	r0, #96	@ 0x60
c0d00c1c:	4008      	ands	r0, r1
c0d00c1e:	d010      	beq.n	c0d00c42 <USBD_HID_Setup+0x3a>
c0d00c20:	2820      	cmp	r0, #32
c0d00c22:	d137      	bne.n	c0d00c94 <USBD_HID_Setup+0x8c>
c0d00c24:	7870      	ldrb	r0, [r6, #1]
c0d00c26:	4601      	mov	r1, r0
c0d00c28:	390a      	subs	r1, #10
c0d00c2a:	2902      	cmp	r1, #2
c0d00c2c:	d332      	bcc.n	c0d00c94 <USBD_HID_Setup+0x8c>
c0d00c2e:	2802      	cmp	r0, #2
c0d00c30:	d01b      	beq.n	c0d00c6a <USBD_HID_Setup+0x62>
c0d00c32:	2803      	cmp	r0, #3
c0d00c34:	d019      	beq.n	c0d00c6a <USBD_HID_Setup+0x62>
c0d00c36:	4628      	mov	r0, r5
c0d00c38:	4631      	mov	r1, r6
c0d00c3a:	f000 fe6f 	bl	c0d0191c <USBD_CtlError>
c0d00c3e:	2402      	movs	r4, #2
c0d00c40:	e028      	b.n	c0d00c94 <USBD_HID_Setup+0x8c>
c0d00c42:	7870      	ldrb	r0, [r6, #1]
c0d00c44:	280b      	cmp	r0, #11
c0d00c46:	d013      	beq.n	c0d00c70 <USBD_HID_Setup+0x68>
c0d00c48:	280a      	cmp	r0, #10
c0d00c4a:	d00e      	beq.n	c0d00c6a <USBD_HID_Setup+0x62>
c0d00c4c:	2806      	cmp	r0, #6
c0d00c4e:	d121      	bne.n	c0d00c94 <USBD_HID_Setup+0x8c>
c0d00c50:	78f0      	ldrb	r0, [r6, #3]
c0d00c52:	2400      	movs	r4, #0
c0d00c54:	2821      	cmp	r0, #33	@ 0x21
c0d00c56:	d00f      	beq.n	c0d00c78 <USBD_HID_Setup+0x70>
c0d00c58:	2822      	cmp	r0, #34	@ 0x22
c0d00c5a:	4622      	mov	r2, r4
c0d00c5c:	4621      	mov	r1, r4
c0d00c5e:	d116      	bne.n	c0d00c8e <USBD_HID_Setup+0x86>
c0d00c60:	af02      	add	r7, sp, #8
c0d00c62:	4638      	mov	r0, r7
c0d00c64:	f000 fd84 	bl	c0d01770 <USBD_HID_GetReportDescriptor_impl>
c0d00c68:	e00a      	b.n	c0d00c80 <USBD_HID_Setup+0x78>
c0d00c6a:	a901      	add	r1, sp, #4
c0d00c6c:	2201      	movs	r2, #1
c0d00c6e:	e00e      	b.n	c0d00c8e <USBD_HID_Setup+0x86>
c0d00c70:	4628      	mov	r0, r5
c0d00c72:	f000 fc57 	bl	c0d01524 <USBD_CtlSendStatus>
c0d00c76:	e00d      	b.n	c0d00c94 <USBD_HID_Setup+0x8c>
c0d00c78:	af02      	add	r7, sp, #8
c0d00c7a:	4638      	mov	r0, r7
c0d00c7c:	f000 fd64 	bl	c0d01748 <USBD_HID_GetHidDescriptor_impl>
c0d00c80:	4601      	mov	r1, r0
c0d00c82:	883a      	ldrh	r2, [r7, #0]
c0d00c84:	88f0      	ldrh	r0, [r6, #6]
c0d00c86:	4282      	cmp	r2, r0
c0d00c88:	d300      	bcc.n	c0d00c8c <USBD_HID_Setup+0x84>
c0d00c8a:	4602      	mov	r2, r0
c0d00c8c:	803a      	strh	r2, [r7, #0]
c0d00c8e:	4628      	mov	r0, r5
c0d00c90:	f000 fc1d 	bl	c0d014ce <USBD_CtlSendData>
c0d00c94:	4620      	mov	r0, r4
c0d00c96:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}

c0d00c98 <USBD_HID_Init>:
c0d00c98:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00c9a:	4604      	mov	r4, r0
c0d00c9c:	2182      	movs	r1, #130	@ 0x82
c0d00c9e:	2603      	movs	r6, #3
c0d00ca0:	2540      	movs	r5, #64	@ 0x40
c0d00ca2:	4632      	mov	r2, r6
c0d00ca4:	462b      	mov	r3, r5
c0d00ca6:	f000 fc97 	bl	c0d015d8 <USBD_LL_OpenEP>
c0d00caa:	2702      	movs	r7, #2
c0d00cac:	4620      	mov	r0, r4
c0d00cae:	4639      	mov	r1, r7
c0d00cb0:	4632      	mov	r2, r6
c0d00cb2:	462b      	mov	r3, r5
c0d00cb4:	f000 fc90 	bl	c0d015d8 <USBD_LL_OpenEP>
c0d00cb8:	4620      	mov	r0, r4
c0d00cba:	4639      	mov	r1, r7
c0d00cbc:	462a      	mov	r2, r5
c0d00cbe:	f000 fd32 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d00cc2:	2000      	movs	r0, #0
c0d00cc4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d00cc6 <USBD_HID_DeInit>:
c0d00cc6:	2000      	movs	r0, #0
c0d00cc8:	4770      	bx	lr

c0d00cca <USBD_Init>:
c0d00cca:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00ccc:	2800      	cmp	r0, #0
c0d00cce:	d012      	beq.n	c0d00cf6 <USBD_Init+0x2c>
c0d00cd0:	4615      	mov	r5, r2
c0d00cd2:	460e      	mov	r6, r1
c0d00cd4:	4604      	mov	r4, r0
c0d00cd6:	4607      	mov	r7, r0
c0d00cd8:	379c      	adds	r7, #156	@ 0x9c
c0d00cda:	21d4      	movs	r1, #212	@ 0xd4
c0d00cdc:	f001 fd76 	bl	c0d027cc <__aeabi_memclr>
c0d00ce0:	2e00      	cmp	r6, #0
c0d00ce2:	d000      	beq.n	c0d00ce6 <USBD_Init+0x1c>
c0d00ce4:	617e      	str	r6, [r7, #20]
c0d00ce6:	7025      	strb	r5, [r4, #0]
c0d00ce8:	2001      	movs	r0, #1
c0d00cea:	7038      	strb	r0, [r7, #0]
c0d00cec:	4620      	mov	r0, r4
c0d00cee:	f000 fc31 	bl	c0d01554 <USBD_LL_Init>
c0d00cf2:	2000      	movs	r0, #0
c0d00cf4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d00cf6:	2002      	movs	r0, #2
c0d00cf8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d00cfa <USBD_DeInit>:
c0d00cfa:	b5b0      	push	{r4, r5, r7, lr}
c0d00cfc:	4604      	mov	r4, r0
c0d00cfe:	209c      	movs	r0, #156	@ 0x9c
c0d00d00:	2101      	movs	r1, #1
c0d00d02:	5421      	strb	r1, [r4, r0]
c0d00d04:	25b4      	movs	r5, #180	@ 0xb4
c0d00d06:	2dcc      	cmp	r5, #204	@ 0xcc
c0d00d08:	d00b      	beq.n	c0d00d22 <USBD_DeInit+0x28>
c0d00d0a:	5960      	ldr	r0, [r4, r5]
c0d00d0c:	2800      	cmp	r0, #0
c0d00d0e:	d006      	beq.n	c0d00d1e <USBD_DeInit+0x24>
c0d00d10:	6840      	ldr	r0, [r0, #4]
c0d00d12:	f001 fb25 	bl	c0d02360 <pic>
c0d00d16:	4602      	mov	r2, r0
c0d00d18:	7921      	ldrb	r1, [r4, #4]
c0d00d1a:	4620      	mov	r0, r4
c0d00d1c:	4790      	blx	r2
c0d00d1e:	3508      	adds	r5, #8
c0d00d20:	e7f1      	b.n	c0d00d06 <USBD_DeInit+0xc>
c0d00d22:	4620      	mov	r0, r4
c0d00d24:	f000 fc49 	bl	c0d015ba <USBD_LL_Stop>
c0d00d28:	4620      	mov	r0, r4
c0d00d2a:	f000 fc1d 	bl	c0d01568 <USBD_LL_DeInit>
c0d00d2e:	2000      	movs	r0, #0
c0d00d30:	bdb0      	pop	{r4, r5, r7, pc}

c0d00d32 <USBD_RegisterClassForInterface>:
c0d00d32:	2a00      	cmp	r2, #0
c0d00d34:	d008      	beq.n	c0d00d48 <USBD_RegisterClassForInterface+0x16>
c0d00d36:	4603      	mov	r3, r0
c0d00d38:	2000      	movs	r0, #0
c0d00d3a:	2b02      	cmp	r3, #2
c0d00d3c:	d803      	bhi.n	c0d00d46 <USBD_RegisterClassForInterface+0x14>
c0d00d3e:	00db      	lsls	r3, r3, #3
c0d00d40:	18c9      	adds	r1, r1, r3
c0d00d42:	23b4      	movs	r3, #180	@ 0xb4
c0d00d44:	50ca      	str	r2, [r1, r3]
c0d00d46:	4770      	bx	lr
c0d00d48:	2002      	movs	r0, #2
c0d00d4a:	4770      	bx	lr

c0d00d4c <USBD_Start>:
c0d00d4c:	b580      	push	{r7, lr}
c0d00d4e:	f000 fc1a 	bl	c0d01586 <USBD_LL_Start>
c0d00d52:	2000      	movs	r0, #0
c0d00d54:	bd80      	pop	{r7, pc}

c0d00d56 <USBD_SetClassConfig>:
c0d00d56:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00d58:	460c      	mov	r4, r1
c0d00d5a:	4605      	mov	r5, r0
c0d00d5c:	4607      	mov	r7, r0
c0d00d5e:	37b4      	adds	r7, #180	@ 0xb4
c0d00d60:	2600      	movs	r6, #0
c0d00d62:	2e03      	cmp	r6, #3
c0d00d64:	d010      	beq.n	c0d00d88 <USBD_SetClassConfig+0x32>
c0d00d66:	4628      	mov	r0, r5
c0d00d68:	4631      	mov	r1, r6
c0d00d6a:	f000 f96a 	bl	c0d01042 <usbd_is_valid_intf>
c0d00d6e:	2800      	cmp	r0, #0
c0d00d70:	d007      	beq.n	c0d00d82 <USBD_SetClassConfig+0x2c>
c0d00d72:	6838      	ldr	r0, [r7, #0]
c0d00d74:	6800      	ldr	r0, [r0, #0]
c0d00d76:	f001 faf3 	bl	c0d02360 <pic>
c0d00d7a:	4602      	mov	r2, r0
c0d00d7c:	4628      	mov	r0, r5
c0d00d7e:	4621      	mov	r1, r4
c0d00d80:	4790      	blx	r2
c0d00d82:	3708      	adds	r7, #8
c0d00d84:	1c76      	adds	r6, r6, #1
c0d00d86:	e7ec      	b.n	c0d00d62 <USBD_SetClassConfig+0xc>
c0d00d88:	2000      	movs	r0, #0
c0d00d8a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d00d8c <USBD_ClrClassConfig>:
c0d00d8c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00d8e:	460c      	mov	r4, r1
c0d00d90:	4605      	mov	r5, r0
c0d00d92:	4607      	mov	r7, r0
c0d00d94:	37b4      	adds	r7, #180	@ 0xb4
c0d00d96:	2600      	movs	r6, #0
c0d00d98:	2e03      	cmp	r6, #3
c0d00d9a:	d010      	beq.n	c0d00dbe <USBD_ClrClassConfig+0x32>
c0d00d9c:	4628      	mov	r0, r5
c0d00d9e:	4631      	mov	r1, r6
c0d00da0:	f000 f94f 	bl	c0d01042 <usbd_is_valid_intf>
c0d00da4:	2800      	cmp	r0, #0
c0d00da6:	d007      	beq.n	c0d00db8 <USBD_ClrClassConfig+0x2c>
c0d00da8:	6838      	ldr	r0, [r7, #0]
c0d00daa:	6840      	ldr	r0, [r0, #4]
c0d00dac:	f001 fad8 	bl	c0d02360 <pic>
c0d00db0:	4602      	mov	r2, r0
c0d00db2:	4628      	mov	r0, r5
c0d00db4:	4621      	mov	r1, r4
c0d00db6:	4790      	blx	r2
c0d00db8:	3708      	adds	r7, #8
c0d00dba:	1c76      	adds	r6, r6, #1
c0d00dbc:	e7ec      	b.n	c0d00d98 <USBD_ClrClassConfig+0xc>
c0d00dbe:	2000      	movs	r0, #0
c0d00dc0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d00dc2 <USBD_LL_SetupStage>:
c0d00dc2:	b570      	push	{r4, r5, r6, lr}
c0d00dc4:	4604      	mov	r4, r0
c0d00dc6:	4606      	mov	r6, r0
c0d00dc8:	3694      	adds	r6, #148	@ 0x94
c0d00dca:	4635      	mov	r5, r6
c0d00dcc:	3514      	adds	r5, #20
c0d00dce:	4628      	mov	r0, r5
c0d00dd0:	f000 fb5f 	bl	c0d01492 <USBD_ParseSetupRequest>
c0d00dd4:	2094      	movs	r0, #148	@ 0x94
c0d00dd6:	2101      	movs	r1, #1
c0d00dd8:	5021      	str	r1, [r4, r0]
c0d00dda:	20ae      	movs	r0, #174	@ 0xae
c0d00ddc:	5a20      	ldrh	r0, [r4, r0]
c0d00dde:	6070      	str	r0, [r6, #4]
c0d00de0:	7d31      	ldrb	r1, [r6, #20]
c0d00de2:	201f      	movs	r0, #31
c0d00de4:	4008      	ands	r0, r1
c0d00de6:	2802      	cmp	r0, #2
c0d00de8:	d008      	beq.n	c0d00dfc <USBD_LL_SetupStage+0x3a>
c0d00dea:	2801      	cmp	r0, #1
c0d00dec:	d00b      	beq.n	c0d00e06 <USBD_LL_SetupStage+0x44>
c0d00dee:	2800      	cmp	r0, #0
c0d00df0:	d10e      	bne.n	c0d00e10 <USBD_LL_SetupStage+0x4e>
c0d00df2:	4620      	mov	r0, r4
c0d00df4:	4629      	mov	r1, r5
c0d00df6:	f000 f92f 	bl	c0d01058 <USBD_StdDevReq>
c0d00dfa:	e00e      	b.n	c0d00e1a <USBD_LL_SetupStage+0x58>
c0d00dfc:	4620      	mov	r0, r4
c0d00dfe:	4629      	mov	r1, r5
c0d00e00:	f000 facb 	bl	c0d0139a <USBD_StdEPReq>
c0d00e04:	e009      	b.n	c0d00e1a <USBD_LL_SetupStage+0x58>
c0d00e06:	4620      	mov	r0, r4
c0d00e08:	4629      	mov	r1, r5
c0d00e0a:	f000 faa2 	bl	c0d01352 <USBD_StdItfReq>
c0d00e0e:	e004      	b.n	c0d00e1a <USBD_LL_SetupStage+0x58>
c0d00e10:	2080      	movs	r0, #128	@ 0x80
c0d00e12:	4001      	ands	r1, r0
c0d00e14:	4620      	mov	r0, r4
c0d00e16:	f000 fc0b 	bl	c0d01630 <USBD_LL_StallEP>
c0d00e1a:	2000      	movs	r0, #0
c0d00e1c:	bd70      	pop	{r4, r5, r6, pc}

c0d00e1e <USBD_LL_DataOutStage>:
c0d00e1e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d00e20:	b085      	sub	sp, #20
c0d00e22:	9303      	str	r3, [sp, #12]
c0d00e24:	9204      	str	r2, [sp, #16]
c0d00e26:	4607      	mov	r7, r0
c0d00e28:	4606      	mov	r6, r0
c0d00e2a:	3694      	adds	r6, #148	@ 0x94
c0d00e2c:	9102      	str	r1, [sp, #8]
c0d00e2e:	2900      	cmp	r1, #0
c0d00e30:	d01e      	beq.n	c0d00e70 <USBD_LL_DataOutStage+0x52>
c0d00e32:	463c      	mov	r4, r7
c0d00e34:	34b4      	adds	r4, #180	@ 0xb4
c0d00e36:	2500      	movs	r5, #0
c0d00e38:	9601      	str	r6, [sp, #4]
c0d00e3a:	2d03      	cmp	r5, #3
c0d00e3c:	d047      	beq.n	c0d00ece <USBD_LL_DataOutStage+0xb0>
c0d00e3e:	4638      	mov	r0, r7
c0d00e40:	4629      	mov	r1, r5
c0d00e42:	f000 f8fe 	bl	c0d01042 <usbd_is_valid_intf>
c0d00e46:	2800      	cmp	r0, #0
c0d00e48:	d00f      	beq.n	c0d00e6a <USBD_LL_DataOutStage+0x4c>
c0d00e4a:	6820      	ldr	r0, [r4, #0]
c0d00e4c:	6980      	ldr	r0, [r0, #24]
c0d00e4e:	2800      	cmp	r0, #0
c0d00e50:	d00b      	beq.n	c0d00e6a <USBD_LL_DataOutStage+0x4c>
c0d00e52:	7a31      	ldrb	r1, [r6, #8]
c0d00e54:	2903      	cmp	r1, #3
c0d00e56:	d108      	bne.n	c0d00e6a <USBD_LL_DataOutStage+0x4c>
c0d00e58:	f001 fa82 	bl	c0d02360 <pic>
c0d00e5c:	4606      	mov	r6, r0
c0d00e5e:	4638      	mov	r0, r7
c0d00e60:	9902      	ldr	r1, [sp, #8]
c0d00e62:	9a04      	ldr	r2, [sp, #16]
c0d00e64:	9b03      	ldr	r3, [sp, #12]
c0d00e66:	47b0      	blx	r6
c0d00e68:	9e01      	ldr	r6, [sp, #4]
c0d00e6a:	3408      	adds	r4, #8
c0d00e6c:	1c6d      	adds	r5, r5, #1
c0d00e6e:	e7e4      	b.n	c0d00e3a <USBD_LL_DataOutStage+0x1c>
c0d00e70:	6830      	ldr	r0, [r6, #0]
c0d00e72:	2803      	cmp	r0, #3
c0d00e74:	d12b      	bne.n	c0d00ece <USBD_LL_DataOutStage+0xb0>
c0d00e76:	6df9      	ldr	r1, [r7, #92]	@ 0x5c
c0d00e78:	6e38      	ldr	r0, [r7, #96]	@ 0x60
c0d00e7a:	4281      	cmp	r1, r0
c0d00e7c:	d90a      	bls.n	c0d00e94 <USBD_LL_DataOutStage+0x76>
c0d00e7e:	1a09      	subs	r1, r1, r0
c0d00e80:	65f9      	str	r1, [r7, #92]	@ 0x5c
c0d00e82:	4281      	cmp	r1, r0
c0d00e84:	d300      	bcc.n	c0d00e88 <USBD_LL_DataOutStage+0x6a>
c0d00e86:	4601      	mov	r1, r0
c0d00e88:	b28a      	uxth	r2, r1
c0d00e8a:	4638      	mov	r0, r7
c0d00e8c:	9904      	ldr	r1, [sp, #16]
c0d00e8e:	f000 fb42 	bl	c0d01516 <USBD_CtlContinueRx>
c0d00e92:	e01c      	b.n	c0d00ece <USBD_LL_DataOutStage+0xb0>
c0d00e94:	463c      	mov	r4, r7
c0d00e96:	34b4      	adds	r4, #180	@ 0xb4
c0d00e98:	2500      	movs	r5, #0
c0d00e9a:	2d03      	cmp	r5, #3
c0d00e9c:	d014      	beq.n	c0d00ec8 <USBD_LL_DataOutStage+0xaa>
c0d00e9e:	4638      	mov	r0, r7
c0d00ea0:	4629      	mov	r1, r5
c0d00ea2:	f000 f8ce 	bl	c0d01042 <usbd_is_valid_intf>
c0d00ea6:	2800      	cmp	r0, #0
c0d00ea8:	d00b      	beq.n	c0d00ec2 <USBD_LL_DataOutStage+0xa4>
c0d00eaa:	6820      	ldr	r0, [r4, #0]
c0d00eac:	6900      	ldr	r0, [r0, #16]
c0d00eae:	2800      	cmp	r0, #0
c0d00eb0:	d007      	beq.n	c0d00ec2 <USBD_LL_DataOutStage+0xa4>
c0d00eb2:	7a31      	ldrb	r1, [r6, #8]
c0d00eb4:	2903      	cmp	r1, #3
c0d00eb6:	d104      	bne.n	c0d00ec2 <USBD_LL_DataOutStage+0xa4>
c0d00eb8:	f001 fa52 	bl	c0d02360 <pic>
c0d00ebc:	4601      	mov	r1, r0
c0d00ebe:	4638      	mov	r0, r7
c0d00ec0:	4788      	blx	r1
c0d00ec2:	3408      	adds	r4, #8
c0d00ec4:	1c6d      	adds	r5, r5, #1
c0d00ec6:	e7e8      	b.n	c0d00e9a <USBD_LL_DataOutStage+0x7c>
c0d00ec8:	4638      	mov	r0, r7
c0d00eca:	f000 fb2b 	bl	c0d01524 <USBD_CtlSendStatus>
c0d00ece:	2000      	movs	r0, #0
c0d00ed0:	b005      	add	sp, #20
c0d00ed2:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0d00ed4 <USBD_LL_DataInStage>:
c0d00ed4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00ed6:	4607      	mov	r7, r0
c0d00ed8:	4606      	mov	r6, r0
c0d00eda:	3694      	adds	r6, #148	@ 0x94
c0d00edc:	9100      	str	r1, [sp, #0]
c0d00ede:	2900      	cmp	r1, #0
c0d00ee0:	d01b      	beq.n	c0d00f1a <USBD_LL_DataInStage+0x46>
c0d00ee2:	4635      	mov	r5, r6
c0d00ee4:	463c      	mov	r4, r7
c0d00ee6:	34b4      	adds	r4, #180	@ 0xb4
c0d00ee8:	2600      	movs	r6, #0
c0d00eea:	2e03      	cmp	r6, #3
c0d00eec:	d061      	beq.n	c0d00fb2 <USBD_LL_DataInStage+0xde>
c0d00eee:	4638      	mov	r0, r7
c0d00ef0:	4631      	mov	r1, r6
c0d00ef2:	f000 f8a6 	bl	c0d01042 <usbd_is_valid_intf>
c0d00ef6:	2800      	cmp	r0, #0
c0d00ef8:	d00c      	beq.n	c0d00f14 <USBD_LL_DataInStage+0x40>
c0d00efa:	6820      	ldr	r0, [r4, #0]
c0d00efc:	6940      	ldr	r0, [r0, #20]
c0d00efe:	2800      	cmp	r0, #0
c0d00f00:	d008      	beq.n	c0d00f14 <USBD_LL_DataInStage+0x40>
c0d00f02:	7a29      	ldrb	r1, [r5, #8]
c0d00f04:	2903      	cmp	r1, #3
c0d00f06:	d105      	bne.n	c0d00f14 <USBD_LL_DataInStage+0x40>
c0d00f08:	f001 fa2a 	bl	c0d02360 <pic>
c0d00f0c:	4602      	mov	r2, r0
c0d00f0e:	4638      	mov	r0, r7
c0d00f10:	9900      	ldr	r1, [sp, #0]
c0d00f12:	4790      	blx	r2
c0d00f14:	3408      	adds	r4, #8
c0d00f16:	1c76      	adds	r6, r6, #1
c0d00f18:	e7e7      	b.n	c0d00eea <USBD_LL_DataInStage+0x16>
c0d00f1a:	6830      	ldr	r0, [r6, #0]
c0d00f1c:	2802      	cmp	r0, #2
c0d00f1e:	d142      	bne.n	c0d00fa6 <USBD_LL_DataInStage+0xd2>
c0d00f20:	69f8      	ldr	r0, [r7, #28]
c0d00f22:	6a3d      	ldr	r5, [r7, #32]
c0d00f24:	42a8      	cmp	r0, r5
c0d00f26:	d909      	bls.n	c0d00f3c <USBD_LL_DataInStage+0x68>
c0d00f28:	1b40      	subs	r0, r0, r5
c0d00f2a:	61f8      	str	r0, [r7, #28]
c0d00f2c:	6bf1      	ldr	r1, [r6, #60]	@ 0x3c
c0d00f2e:	1949      	adds	r1, r1, r5
c0d00f30:	63f1      	str	r1, [r6, #60]	@ 0x3c
c0d00f32:	b282      	uxth	r2, r0
c0d00f34:	4638      	mov	r0, r7
c0d00f36:	f000 fae0 	bl	c0d014fa <USBD_CtlContinueSendData>
c0d00f3a:	e034      	b.n	c0d00fa6 <USBD_LL_DataInStage+0xd2>
c0d00f3c:	9600      	str	r6, [sp, #0]
c0d00f3e:	69be      	ldr	r6, [r7, #24]
c0d00f40:	4630      	mov	r0, r6
c0d00f42:	4629      	mov	r1, r5
c0d00f44:	f001 fb52 	bl	c0d025ec <__aeabi_uidivmod>
c0d00f48:	2900      	cmp	r1, #0
c0d00f4a:	d10e      	bne.n	c0d00f6a <USBD_LL_DataInStage+0x96>
c0d00f4c:	42ae      	cmp	r6, r5
c0d00f4e:	d30c      	bcc.n	c0d00f6a <USBD_LL_DataInStage+0x96>
c0d00f50:	9800      	ldr	r0, [sp, #0]
c0d00f52:	6840      	ldr	r0, [r0, #4]
c0d00f54:	4286      	cmp	r6, r0
c0d00f56:	d208      	bcs.n	c0d00f6a <USBD_LL_DataInStage+0x96>
c0d00f58:	2500      	movs	r5, #0
c0d00f5a:	4638      	mov	r0, r7
c0d00f5c:	4629      	mov	r1, r5
c0d00f5e:	462a      	mov	r2, r5
c0d00f60:	f000 facb 	bl	c0d014fa <USBD_CtlContinueSendData>
c0d00f64:	9e00      	ldr	r6, [sp, #0]
c0d00f66:	6075      	str	r5, [r6, #4]
c0d00f68:	e01d      	b.n	c0d00fa6 <USBD_LL_DataInStage+0xd2>
c0d00f6a:	463c      	mov	r4, r7
c0d00f6c:	34b4      	adds	r4, #180	@ 0xb4
c0d00f6e:	2500      	movs	r5, #0
c0d00f70:	9e00      	ldr	r6, [sp, #0]
c0d00f72:	2d03      	cmp	r5, #3
c0d00f74:	d014      	beq.n	c0d00fa0 <USBD_LL_DataInStage+0xcc>
c0d00f76:	4638      	mov	r0, r7
c0d00f78:	4629      	mov	r1, r5
c0d00f7a:	f000 f862 	bl	c0d01042 <usbd_is_valid_intf>
c0d00f7e:	2800      	cmp	r0, #0
c0d00f80:	d00b      	beq.n	c0d00f9a <USBD_LL_DataInStage+0xc6>
c0d00f82:	6820      	ldr	r0, [r4, #0]
c0d00f84:	68c0      	ldr	r0, [r0, #12]
c0d00f86:	2800      	cmp	r0, #0
c0d00f88:	d007      	beq.n	c0d00f9a <USBD_LL_DataInStage+0xc6>
c0d00f8a:	7a31      	ldrb	r1, [r6, #8]
c0d00f8c:	2903      	cmp	r1, #3
c0d00f8e:	d104      	bne.n	c0d00f9a <USBD_LL_DataInStage+0xc6>
c0d00f90:	f001 f9e6 	bl	c0d02360 <pic>
c0d00f94:	4601      	mov	r1, r0
c0d00f96:	4638      	mov	r0, r7
c0d00f98:	4788      	blx	r1
c0d00f9a:	3408      	adds	r4, #8
c0d00f9c:	1c6d      	adds	r5, r5, #1
c0d00f9e:	e7e8      	b.n	c0d00f72 <USBD_LL_DataInStage+0x9e>
c0d00fa0:	4638      	mov	r0, r7
c0d00fa2:	f000 facb 	bl	c0d0153c <USBD_CtlReceiveStatus>
c0d00fa6:	7b30      	ldrb	r0, [r6, #12]
c0d00fa8:	2801      	cmp	r0, #1
c0d00faa:	d102      	bne.n	c0d00fb2 <USBD_LL_DataInStage+0xde>
c0d00fac:	4631      	mov	r1, r6
c0d00fae:	2000      	movs	r0, #0
c0d00fb0:	7330      	strb	r0, [r6, #12]
c0d00fb2:	2000      	movs	r0, #0
c0d00fb4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d00fb6 <USBD_LL_Reset>:
c0d00fb6:	b570      	push	{r4, r5, r6, lr}
c0d00fb8:	4604      	mov	r4, r0
c0d00fba:	209c      	movs	r0, #156	@ 0x9c
c0d00fbc:	2101      	movs	r1, #1
c0d00fbe:	5421      	strb	r1, [r4, r0]
c0d00fc0:	2040      	movs	r0, #64	@ 0x40
c0d00fc2:	6220      	str	r0, [r4, #32]
c0d00fc4:	6620      	str	r0, [r4, #96]	@ 0x60
c0d00fc6:	4626      	mov	r6, r4
c0d00fc8:	36b4      	adds	r6, #180	@ 0xb4
c0d00fca:	2500      	movs	r5, #0
c0d00fcc:	2d03      	cmp	r5, #3
c0d00fce:	d010      	beq.n	c0d00ff2 <USBD_LL_Reset+0x3c>
c0d00fd0:	4620      	mov	r0, r4
c0d00fd2:	4629      	mov	r1, r5
c0d00fd4:	f000 f835 	bl	c0d01042 <usbd_is_valid_intf>
c0d00fd8:	2800      	cmp	r0, #0
c0d00fda:	d007      	beq.n	c0d00fec <USBD_LL_Reset+0x36>
c0d00fdc:	6830      	ldr	r0, [r6, #0]
c0d00fde:	6840      	ldr	r0, [r0, #4]
c0d00fe0:	f001 f9be 	bl	c0d02360 <pic>
c0d00fe4:	4602      	mov	r2, r0
c0d00fe6:	7921      	ldrb	r1, [r4, #4]
c0d00fe8:	4620      	mov	r0, r4
c0d00fea:	4790      	blx	r2
c0d00fec:	3608      	adds	r6, #8
c0d00fee:	1c6d      	adds	r5, r5, #1
c0d00ff0:	e7ec      	b.n	c0d00fcc <USBD_LL_Reset+0x16>
c0d00ff2:	2000      	movs	r0, #0
c0d00ff4:	bd70      	pop	{r4, r5, r6, pc}

c0d00ff6 <USBD_LL_SetSpeed>:
c0d00ff6:	7401      	strb	r1, [r0, #16]
c0d00ff8:	2000      	movs	r0, #0
c0d00ffa:	4770      	bx	lr

c0d00ffc <USBD_LL_Suspend>:
c0d00ffc:	2000      	movs	r0, #0
c0d00ffe:	4770      	bx	lr

c0d01000 <USBD_LL_Resume>:
c0d01000:	2000      	movs	r0, #0
c0d01002:	4770      	bx	lr

c0d01004 <USBD_LL_SOF>:
c0d01004:	b570      	push	{r4, r5, r6, lr}
c0d01006:	4604      	mov	r4, r0
c0d01008:	209c      	movs	r0, #156	@ 0x9c
c0d0100a:	5c20      	ldrb	r0, [r4, r0]
c0d0100c:	2803      	cmp	r0, #3
c0d0100e:	d116      	bne.n	c0d0103e <USBD_LL_SOF+0x3a>
c0d01010:	4626      	mov	r6, r4
c0d01012:	36b4      	adds	r6, #180	@ 0xb4
c0d01014:	2500      	movs	r5, #0
c0d01016:	2d03      	cmp	r5, #3
c0d01018:	d011      	beq.n	c0d0103e <USBD_LL_SOF+0x3a>
c0d0101a:	4620      	mov	r0, r4
c0d0101c:	4629      	mov	r1, r5
c0d0101e:	f000 f810 	bl	c0d01042 <usbd_is_valid_intf>
c0d01022:	2800      	cmp	r0, #0
c0d01024:	d008      	beq.n	c0d01038 <USBD_LL_SOF+0x34>
c0d01026:	6830      	ldr	r0, [r6, #0]
c0d01028:	69c0      	ldr	r0, [r0, #28]
c0d0102a:	2800      	cmp	r0, #0
c0d0102c:	d004      	beq.n	c0d01038 <USBD_LL_SOF+0x34>
c0d0102e:	f001 f997 	bl	c0d02360 <pic>
c0d01032:	4601      	mov	r1, r0
c0d01034:	4620      	mov	r0, r4
c0d01036:	4788      	blx	r1
c0d01038:	3608      	adds	r6, #8
c0d0103a:	1c6d      	adds	r5, r5, #1
c0d0103c:	e7eb      	b.n	c0d01016 <USBD_LL_SOF+0x12>
c0d0103e:	2000      	movs	r0, #0
c0d01040:	bd70      	pop	{r4, r5, r6, pc}

c0d01042 <usbd_is_valid_intf>:
c0d01042:	2902      	cmp	r1, #2
c0d01044:	d806      	bhi.n	c0d01054 <usbd_is_valid_intf+0x12>
c0d01046:	00c9      	lsls	r1, r1, #3
c0d01048:	1840      	adds	r0, r0, r1
c0d0104a:	21b4      	movs	r1, #180	@ 0xb4
c0d0104c:	5840      	ldr	r0, [r0, r1]
c0d0104e:	1e41      	subs	r1, r0, #1
c0d01050:	4188      	sbcs	r0, r1
c0d01052:	4770      	bx	lr
c0d01054:	2000      	movs	r0, #0
c0d01056:	4770      	bx	lr

c0d01058 <USBD_StdDevReq>:
c0d01058:	b580      	push	{r7, lr}
c0d0105a:	784a      	ldrb	r2, [r1, #1]
c0d0105c:	2a00      	cmp	r2, #0
c0d0105e:	d00e      	beq.n	c0d0107e <USBD_StdDevReq+0x26>
c0d01060:	2a01      	cmp	r2, #1
c0d01062:	d00f      	beq.n	c0d01084 <USBD_StdDevReq+0x2c>
c0d01064:	2a03      	cmp	r2, #3
c0d01066:	d010      	beq.n	c0d0108a <USBD_StdDevReq+0x32>
c0d01068:	2a05      	cmp	r2, #5
c0d0106a:	d011      	beq.n	c0d01090 <USBD_StdDevReq+0x38>
c0d0106c:	2a09      	cmp	r2, #9
c0d0106e:	d012      	beq.n	c0d01096 <USBD_StdDevReq+0x3e>
c0d01070:	2a08      	cmp	r2, #8
c0d01072:	d013      	beq.n	c0d0109c <USBD_StdDevReq+0x44>
c0d01074:	2a06      	cmp	r2, #6
c0d01076:	d114      	bne.n	c0d010a2 <USBD_StdDevReq+0x4a>
c0d01078:	f000 f817 	bl	c0d010aa <USBD_GetDescriptor>
c0d0107c:	e013      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d0107e:	f000 f8fe 	bl	c0d0127e <USBD_GetStatus>
c0d01082:	e010      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d01084:	f000 f93c 	bl	c0d01300 <USBD_ClrFeature>
c0d01088:	e00d      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d0108a:	f000 f91c 	bl	c0d012c6 <USBD_SetFeature>
c0d0108e:	e00a      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d01090:	f000 f882 	bl	c0d01198 <USBD_SetAddress>
c0d01094:	e007      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d01096:	f000 f8a2 	bl	c0d011de <USBD_SetConfig>
c0d0109a:	e004      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d0109c:	f000 f8d8 	bl	c0d01250 <USBD_GetConfig>
c0d010a0:	e001      	b.n	c0d010a6 <USBD_StdDevReq+0x4e>
c0d010a2:	f000 fc3b 	bl	c0d0191c <USBD_CtlError>
c0d010a6:	2000      	movs	r0, #0
c0d010a8:	bd80      	pop	{r7, pc}

c0d010aa <USBD_GetDescriptor>:
c0d010aa:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d010ac:	460d      	mov	r5, r1
c0d010ae:	4604      	mov	r4, r0
c0d010b0:	a801      	add	r0, sp, #4
c0d010b2:	2100      	movs	r1, #0
c0d010b4:	8001      	strh	r1, [r0, #0]
c0d010b6:	4620      	mov	r0, r4
c0d010b8:	30b0      	adds	r0, #176	@ 0xb0
c0d010ba:	886b      	ldrh	r3, [r5, #2]
c0d010bc:	0a1a      	lsrs	r2, r3, #8
c0d010be:	2a01      	cmp	r2, #1
c0d010c0:	d026      	beq.n	c0d01110 <USBD_GetDescriptor+0x66>
c0d010c2:	2a02      	cmp	r2, #2
c0d010c4:	d02d      	beq.n	c0d01122 <USBD_GetDescriptor+0x78>
c0d010c6:	2a03      	cmp	r2, #3
c0d010c8:	d00a      	beq.n	c0d010e0 <USBD_GetDescriptor+0x36>
c0d010ca:	2a06      	cmp	r2, #6
c0d010cc:	d031      	beq.n	c0d01132 <USBD_GetDescriptor+0x88>
c0d010ce:	2a07      	cmp	r2, #7
c0d010d0:	d016      	beq.n	c0d01100 <USBD_GetDescriptor+0x56>
c0d010d2:	2a0f      	cmp	r2, #15
c0d010d4:	d130      	bne.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d010d6:	6800      	ldr	r0, [r0, #0]
c0d010d8:	69c0      	ldr	r0, [r0, #28]
c0d010da:	2800      	cmp	r0, #0
c0d010dc:	d11a      	bne.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d010de:	e02b      	b.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d010e0:	b2d9      	uxtb	r1, r3
c0d010e2:	2905      	cmp	r1, #5
c0d010e4:	d049      	beq.n	c0d0117a <USBD_GetDescriptor+0xd0>
c0d010e6:	2901      	cmp	r1, #1
c0d010e8:	d04a      	beq.n	c0d01180 <USBD_GetDescriptor+0xd6>
c0d010ea:	2902      	cmp	r1, #2
c0d010ec:	d04b      	beq.n	c0d01186 <USBD_GetDescriptor+0xdc>
c0d010ee:	2903      	cmp	r1, #3
c0d010f0:	d04c      	beq.n	c0d0118c <USBD_GetDescriptor+0xe2>
c0d010f2:	2904      	cmp	r1, #4
c0d010f4:	d04d      	beq.n	c0d01192 <USBD_GetDescriptor+0xe8>
c0d010f6:	2900      	cmp	r1, #0
c0d010f8:	d11e      	bne.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d010fa:	6800      	ldr	r0, [r0, #0]
c0d010fc:	6840      	ldr	r0, [r0, #4]
c0d010fe:	e009      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d01100:	7c21      	ldrb	r1, [r4, #16]
c0d01102:	2900      	cmp	r1, #0
c0d01104:	d118      	bne.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d01106:	6840      	ldr	r0, [r0, #4]
c0d01108:	2800      	cmp	r0, #0
c0d0110a:	d015      	beq.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d0110c:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0d0110e:	e01e      	b.n	c0d0114e <USBD_GetDescriptor+0xa4>
c0d01110:	6800      	ldr	r0, [r0, #0]
c0d01112:	6800      	ldr	r0, [r0, #0]
c0d01114:	f001 f924 	bl	c0d02360 <pic>
c0d01118:	4602      	mov	r2, r0
c0d0111a:	7c20      	ldrb	r0, [r4, #16]
c0d0111c:	a901      	add	r1, sp, #4
c0d0111e:	4790      	blx	r2
c0d01120:	e01a      	b.n	c0d01158 <USBD_GetDescriptor+0xae>
c0d01122:	6840      	ldr	r0, [r0, #4]
c0d01124:	2800      	cmp	r0, #0
c0d01126:	d018      	beq.n	c0d0115a <USBD_GetDescriptor+0xb0>
c0d01128:	7c21      	ldrb	r1, [r4, #16]
c0d0112a:	2900      	cmp	r1, #0
c0d0112c:	d00e      	beq.n	c0d0114c <USBD_GetDescriptor+0xa2>
c0d0112e:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0d01130:	e00d      	b.n	c0d0114e <USBD_GetDescriptor+0xa4>
c0d01132:	7c21      	ldrb	r1, [r4, #16]
c0d01134:	2900      	cmp	r1, #0
c0d01136:	d004      	beq.n	c0d01142 <USBD_GetDescriptor+0x98>
c0d01138:	4620      	mov	r0, r4
c0d0113a:	4629      	mov	r1, r5
c0d0113c:	f000 fbee 	bl	c0d0191c <USBD_CtlError>
c0d01140:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d01142:	6840      	ldr	r0, [r0, #4]
c0d01144:	2800      	cmp	r0, #0
c0d01146:	d0f7      	beq.n	c0d01138 <USBD_GetDescriptor+0x8e>
c0d01148:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0d0114a:	e000      	b.n	c0d0114e <USBD_GetDescriptor+0xa4>
c0d0114c:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0d0114e:	f001 f907 	bl	c0d02360 <pic>
c0d01152:	4601      	mov	r1, r0
c0d01154:	a801      	add	r0, sp, #4
c0d01156:	4788      	blx	r1
c0d01158:	4601      	mov	r1, r0
c0d0115a:	a801      	add	r0, sp, #4
c0d0115c:	8802      	ldrh	r2, [r0, #0]
c0d0115e:	2a00      	cmp	r2, #0
c0d01160:	d0ee      	beq.n	c0d01140 <USBD_GetDescriptor+0x96>
c0d01162:	88e8      	ldrh	r0, [r5, #6]
c0d01164:	2800      	cmp	r0, #0
c0d01166:	d0eb      	beq.n	c0d01140 <USBD_GetDescriptor+0x96>
c0d01168:	4282      	cmp	r2, r0
c0d0116a:	d300      	bcc.n	c0d0116e <USBD_GetDescriptor+0xc4>
c0d0116c:	4602      	mov	r2, r0
c0d0116e:	a801      	add	r0, sp, #4
c0d01170:	8002      	strh	r2, [r0, #0]
c0d01172:	4620      	mov	r0, r4
c0d01174:	f000 f9ab 	bl	c0d014ce <USBD_CtlSendData>
c0d01178:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d0117a:	6800      	ldr	r0, [r0, #0]
c0d0117c:	6980      	ldr	r0, [r0, #24]
c0d0117e:	e7c9      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d01180:	6800      	ldr	r0, [r0, #0]
c0d01182:	6880      	ldr	r0, [r0, #8]
c0d01184:	e7c6      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d01186:	6800      	ldr	r0, [r0, #0]
c0d01188:	68c0      	ldr	r0, [r0, #12]
c0d0118a:	e7c3      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d0118c:	6800      	ldr	r0, [r0, #0]
c0d0118e:	6900      	ldr	r0, [r0, #16]
c0d01190:	e7c0      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>
c0d01192:	6800      	ldr	r0, [r0, #0]
c0d01194:	6940      	ldr	r0, [r0, #20]
c0d01196:	e7bd      	b.n	c0d01114 <USBD_GetDescriptor+0x6a>

c0d01198 <USBD_SetAddress>:
c0d01198:	b570      	push	{r4, r5, r6, lr}
c0d0119a:	4604      	mov	r4, r0
c0d0119c:	8888      	ldrh	r0, [r1, #4]
c0d0119e:	2800      	cmp	r0, #0
c0d011a0:	d107      	bne.n	c0d011b2 <USBD_SetAddress+0x1a>
c0d011a2:	88c8      	ldrh	r0, [r1, #6]
c0d011a4:	2800      	cmp	r0, #0
c0d011a6:	d104      	bne.n	c0d011b2 <USBD_SetAddress+0x1a>
c0d011a8:	4626      	mov	r6, r4
c0d011aa:	369c      	adds	r6, #156	@ 0x9c
c0d011ac:	7830      	ldrb	r0, [r6, #0]
c0d011ae:	2803      	cmp	r0, #3
c0d011b0:	d103      	bne.n	c0d011ba <USBD_SetAddress+0x22>
c0d011b2:	4620      	mov	r0, r4
c0d011b4:	f000 fbb2 	bl	c0d0191c <USBD_CtlError>
c0d011b8:	bd70      	pop	{r4, r5, r6, pc}
c0d011ba:	7888      	ldrb	r0, [r1, #2]
c0d011bc:	257f      	movs	r5, #127	@ 0x7f
c0d011be:	4005      	ands	r5, r0
c0d011c0:	70b5      	strb	r5, [r6, #2]
c0d011c2:	4620      	mov	r0, r4
c0d011c4:	4629      	mov	r1, r5
c0d011c6:	f000 fa87 	bl	c0d016d8 <USBD_LL_SetUSBAddress>
c0d011ca:	4620      	mov	r0, r4
c0d011cc:	f000 f9aa 	bl	c0d01524 <USBD_CtlSendStatus>
c0d011d0:	2d00      	cmp	r5, #0
c0d011d2:	d001      	beq.n	c0d011d8 <USBD_SetAddress+0x40>
c0d011d4:	2002      	movs	r0, #2
c0d011d6:	e000      	b.n	c0d011da <USBD_SetAddress+0x42>
c0d011d8:	2001      	movs	r0, #1
c0d011da:	7030      	strb	r0, [r6, #0]
c0d011dc:	bd70      	pop	{r4, r5, r6, pc}

c0d011de <USBD_SetConfig>:
c0d011de:	b570      	push	{r4, r5, r6, lr}
c0d011e0:	460d      	mov	r5, r1
c0d011e2:	4604      	mov	r4, r0
c0d011e4:	788e      	ldrb	r6, [r1, #2]
c0d011e6:	2e02      	cmp	r6, #2
c0d011e8:	d21e      	bcs.n	c0d01228 <USBD_SetConfig+0x4a>
c0d011ea:	209c      	movs	r0, #156	@ 0x9c
c0d011ec:	5c21      	ldrb	r1, [r4, r0]
c0d011ee:	4620      	mov	r0, r4
c0d011f0:	309c      	adds	r0, #156	@ 0x9c
c0d011f2:	2903      	cmp	r1, #3
c0d011f4:	d007      	beq.n	c0d01206 <USBD_SetConfig+0x28>
c0d011f6:	2902      	cmp	r1, #2
c0d011f8:	d116      	bne.n	c0d01228 <USBD_SetConfig+0x4a>
c0d011fa:	2e00      	cmp	r6, #0
c0d011fc:	d024      	beq.n	c0d01248 <USBD_SetConfig+0x6a>
c0d011fe:	2103      	movs	r1, #3
c0d01200:	7001      	strb	r1, [r0, #0]
c0d01202:	6066      	str	r6, [r4, #4]
c0d01204:	e00a      	b.n	c0d0121c <USBD_SetConfig+0x3e>
c0d01206:	2e00      	cmp	r6, #0
c0d01208:	d013      	beq.n	c0d01232 <USBD_SetConfig+0x54>
c0d0120a:	6860      	ldr	r0, [r4, #4]
c0d0120c:	2801      	cmp	r0, #1
c0d0120e:	d01b      	beq.n	c0d01248 <USBD_SetConfig+0x6a>
c0d01210:	b2c1      	uxtb	r1, r0
c0d01212:	4620      	mov	r0, r4
c0d01214:	f7ff fdba 	bl	c0d00d8c <USBD_ClrClassConfig>
c0d01218:	2001      	movs	r0, #1
c0d0121a:	6060      	str	r0, [r4, #4]
c0d0121c:	4620      	mov	r0, r4
c0d0121e:	4631      	mov	r1, r6
c0d01220:	f7ff fd99 	bl	c0d00d56 <USBD_SetClassConfig>
c0d01224:	2802      	cmp	r0, #2
c0d01226:	d10f      	bne.n	c0d01248 <USBD_SetConfig+0x6a>
c0d01228:	4620      	mov	r0, r4
c0d0122a:	4629      	mov	r1, r5
c0d0122c:	f000 fb76 	bl	c0d0191c <USBD_CtlError>
c0d01230:	bd70      	pop	{r4, r5, r6, pc}
c0d01232:	2100      	movs	r1, #0
c0d01234:	6061      	str	r1, [r4, #4]
c0d01236:	2102      	movs	r1, #2
c0d01238:	7001      	strb	r1, [r0, #0]
c0d0123a:	4620      	mov	r0, r4
c0d0123c:	4631      	mov	r1, r6
c0d0123e:	f7ff fda5 	bl	c0d00d8c <USBD_ClrClassConfig>
c0d01242:	4620      	mov	r0, r4
c0d01244:	f000 f96e 	bl	c0d01524 <USBD_CtlSendStatus>
c0d01248:	4620      	mov	r0, r4
c0d0124a:	f000 f96b 	bl	c0d01524 <USBD_CtlSendStatus>
c0d0124e:	bd70      	pop	{r4, r5, r6, pc}

c0d01250 <USBD_GetConfig>:
c0d01250:	b580      	push	{r7, lr}
c0d01252:	88ca      	ldrh	r2, [r1, #6]
c0d01254:	2a01      	cmp	r2, #1
c0d01256:	d10a      	bne.n	c0d0126e <USBD_GetConfig+0x1e>
c0d01258:	229c      	movs	r2, #156	@ 0x9c
c0d0125a:	5c82      	ldrb	r2, [r0, r2]
c0d0125c:	2a03      	cmp	r2, #3
c0d0125e:	d009      	beq.n	c0d01274 <USBD_GetConfig+0x24>
c0d01260:	2a02      	cmp	r2, #2
c0d01262:	d104      	bne.n	c0d0126e <USBD_GetConfig+0x1e>
c0d01264:	2100      	movs	r1, #0
c0d01266:	6081      	str	r1, [r0, #8]
c0d01268:	4601      	mov	r1, r0
c0d0126a:	3108      	adds	r1, #8
c0d0126c:	e003      	b.n	c0d01276 <USBD_GetConfig+0x26>
c0d0126e:	f000 fb55 	bl	c0d0191c <USBD_CtlError>
c0d01272:	bd80      	pop	{r7, pc}
c0d01274:	1d01      	adds	r1, r0, #4
c0d01276:	2201      	movs	r2, #1
c0d01278:	f000 f929 	bl	c0d014ce <USBD_CtlSendData>
c0d0127c:	bd80      	pop	{r7, pc}

c0d0127e <USBD_GetStatus>:
c0d0127e:	b5b0      	push	{r4, r5, r7, lr}
c0d01280:	4604      	mov	r4, r0
c0d01282:	209c      	movs	r0, #156	@ 0x9c
c0d01284:	5c20      	ldrb	r0, [r4, r0]
c0d01286:	22fe      	movs	r2, #254	@ 0xfe
c0d01288:	4002      	ands	r2, r0
c0d0128a:	2a02      	cmp	r2, #2
c0d0128c:	d10f      	bne.n	c0d012ae <USBD_GetStatus+0x30>
c0d0128e:	4620      	mov	r0, r4
c0d01290:	309c      	adds	r0, #156	@ 0x9c
c0d01292:	2101      	movs	r1, #1
c0d01294:	60e1      	str	r1, [r4, #12]
c0d01296:	4625      	mov	r5, r4
c0d01298:	350c      	adds	r5, #12
c0d0129a:	6880      	ldr	r0, [r0, #8]
c0d0129c:	2800      	cmp	r0, #0
c0d0129e:	d00a      	beq.n	c0d012b6 <USBD_GetStatus+0x38>
c0d012a0:	4620      	mov	r0, r4
c0d012a2:	f000 f94b 	bl	c0d0153c <USBD_CtlReceiveStatus>
c0d012a6:	68e1      	ldr	r1, [r4, #12]
c0d012a8:	2002      	movs	r0, #2
c0d012aa:	4308      	orrs	r0, r1
c0d012ac:	e004      	b.n	c0d012b8 <USBD_GetStatus+0x3a>
c0d012ae:	4620      	mov	r0, r4
c0d012b0:	f000 fb34 	bl	c0d0191c <USBD_CtlError>
c0d012b4:	bdb0      	pop	{r4, r5, r7, pc}
c0d012b6:	2003      	movs	r0, #3
c0d012b8:	60e0      	str	r0, [r4, #12]
c0d012ba:	2202      	movs	r2, #2
c0d012bc:	4620      	mov	r0, r4
c0d012be:	4629      	mov	r1, r5
c0d012c0:	f000 f905 	bl	c0d014ce <USBD_CtlSendData>
c0d012c4:	bdb0      	pop	{r4, r5, r7, pc}

c0d012c6 <USBD_SetFeature>:
c0d012c6:	b5b0      	push	{r4, r5, r7, lr}
c0d012c8:	4604      	mov	r4, r0
c0d012ca:	8848      	ldrh	r0, [r1, #2]
c0d012cc:	2801      	cmp	r0, #1
c0d012ce:	d116      	bne.n	c0d012fe <USBD_SetFeature+0x38>
c0d012d0:	460d      	mov	r5, r1
c0d012d2:	20a4      	movs	r0, #164	@ 0xa4
c0d012d4:	2101      	movs	r1, #1
c0d012d6:	5021      	str	r1, [r4, r0]
c0d012d8:	7928      	ldrb	r0, [r5, #4]
c0d012da:	2802      	cmp	r0, #2
c0d012dc:	d80c      	bhi.n	c0d012f8 <USBD_SetFeature+0x32>
c0d012de:	00c0      	lsls	r0, r0, #3
c0d012e0:	1820      	adds	r0, r4, r0
c0d012e2:	21b4      	movs	r1, #180	@ 0xb4
c0d012e4:	5840      	ldr	r0, [r0, r1]
c0d012e6:	2800      	cmp	r0, #0
c0d012e8:	d006      	beq.n	c0d012f8 <USBD_SetFeature+0x32>
c0d012ea:	6880      	ldr	r0, [r0, #8]
c0d012ec:	f001 f838 	bl	c0d02360 <pic>
c0d012f0:	4602      	mov	r2, r0
c0d012f2:	4620      	mov	r0, r4
c0d012f4:	4629      	mov	r1, r5
c0d012f6:	4790      	blx	r2
c0d012f8:	4620      	mov	r0, r4
c0d012fa:	f000 f913 	bl	c0d01524 <USBD_CtlSendStatus>
c0d012fe:	bdb0      	pop	{r4, r5, r7, pc}

c0d01300 <USBD_ClrFeature>:
c0d01300:	b5b0      	push	{r4, r5, r7, lr}
c0d01302:	460d      	mov	r5, r1
c0d01304:	4604      	mov	r4, r0
c0d01306:	209c      	movs	r0, #156	@ 0x9c
c0d01308:	5c20      	ldrb	r0, [r4, r0]
c0d0130a:	21fe      	movs	r1, #254	@ 0xfe
c0d0130c:	4001      	ands	r1, r0
c0d0130e:	2902      	cmp	r1, #2
c0d01310:	d11a      	bne.n	c0d01348 <USBD_ClrFeature+0x48>
c0d01312:	8868      	ldrh	r0, [r5, #2]
c0d01314:	2801      	cmp	r0, #1
c0d01316:	d11b      	bne.n	c0d01350 <USBD_ClrFeature+0x50>
c0d01318:	4620      	mov	r0, r4
c0d0131a:	309c      	adds	r0, #156	@ 0x9c
c0d0131c:	2100      	movs	r1, #0
c0d0131e:	6081      	str	r1, [r0, #8]
c0d01320:	7928      	ldrb	r0, [r5, #4]
c0d01322:	2802      	cmp	r0, #2
c0d01324:	d80c      	bhi.n	c0d01340 <USBD_ClrFeature+0x40>
c0d01326:	00c0      	lsls	r0, r0, #3
c0d01328:	1820      	adds	r0, r4, r0
c0d0132a:	21b4      	movs	r1, #180	@ 0xb4
c0d0132c:	5840      	ldr	r0, [r0, r1]
c0d0132e:	2800      	cmp	r0, #0
c0d01330:	d006      	beq.n	c0d01340 <USBD_ClrFeature+0x40>
c0d01332:	6880      	ldr	r0, [r0, #8]
c0d01334:	f001 f814 	bl	c0d02360 <pic>
c0d01338:	4602      	mov	r2, r0
c0d0133a:	4620      	mov	r0, r4
c0d0133c:	4629      	mov	r1, r5
c0d0133e:	4790      	blx	r2
c0d01340:	4620      	mov	r0, r4
c0d01342:	f000 f8ef 	bl	c0d01524 <USBD_CtlSendStatus>
c0d01346:	bdb0      	pop	{r4, r5, r7, pc}
c0d01348:	4620      	mov	r0, r4
c0d0134a:	4629      	mov	r1, r5
c0d0134c:	f000 fae6 	bl	c0d0191c <USBD_CtlError>
c0d01350:	bdb0      	pop	{r4, r5, r7, pc}

c0d01352 <USBD_StdItfReq>:
c0d01352:	b5b0      	push	{r4, r5, r7, lr}
c0d01354:	460d      	mov	r5, r1
c0d01356:	4604      	mov	r4, r0
c0d01358:	209c      	movs	r0, #156	@ 0x9c
c0d0135a:	5c20      	ldrb	r0, [r4, r0]
c0d0135c:	2803      	cmp	r0, #3
c0d0135e:	d116      	bne.n	c0d0138e <USBD_StdItfReq+0x3c>
c0d01360:	7928      	ldrb	r0, [r5, #4]
c0d01362:	2802      	cmp	r0, #2
c0d01364:	d813      	bhi.n	c0d0138e <USBD_StdItfReq+0x3c>
c0d01366:	00c0      	lsls	r0, r0, #3
c0d01368:	1820      	adds	r0, r4, r0
c0d0136a:	21b4      	movs	r1, #180	@ 0xb4
c0d0136c:	5840      	ldr	r0, [r0, r1]
c0d0136e:	2800      	cmp	r0, #0
c0d01370:	d00d      	beq.n	c0d0138e <USBD_StdItfReq+0x3c>
c0d01372:	6880      	ldr	r0, [r0, #8]
c0d01374:	f000 fff4 	bl	c0d02360 <pic>
c0d01378:	4602      	mov	r2, r0
c0d0137a:	4620      	mov	r0, r4
c0d0137c:	4629      	mov	r1, r5
c0d0137e:	4790      	blx	r2
c0d01380:	88e8      	ldrh	r0, [r5, #6]
c0d01382:	2800      	cmp	r0, #0
c0d01384:	d107      	bne.n	c0d01396 <USBD_StdItfReq+0x44>
c0d01386:	4620      	mov	r0, r4
c0d01388:	f000 f8cc 	bl	c0d01524 <USBD_CtlSendStatus>
c0d0138c:	e003      	b.n	c0d01396 <USBD_StdItfReq+0x44>
c0d0138e:	4620      	mov	r0, r4
c0d01390:	4629      	mov	r1, r5
c0d01392:	f000 fac3 	bl	c0d0191c <USBD_CtlError>
c0d01396:	2000      	movs	r0, #0
c0d01398:	bdb0      	pop	{r4, r5, r7, pc}

c0d0139a <USBD_StdEPReq>:
c0d0139a:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d0139c:	460d      	mov	r5, r1
c0d0139e:	4604      	mov	r4, r0
c0d013a0:	7909      	ldrb	r1, [r1, #4]
c0d013a2:	207f      	movs	r0, #127	@ 0x7f
c0d013a4:	4008      	ands	r0, r1
c0d013a6:	2805      	cmp	r0, #5
c0d013a8:	d304      	bcc.n	c0d013b4 <USBD_StdEPReq+0x1a>
c0d013aa:	4620      	mov	r0, r4
c0d013ac:	4629      	mov	r1, r5
c0d013ae:	f000 fab5 	bl	c0d0191c <USBD_CtlError>
c0d013b2:	e06c      	b.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d013b4:	782a      	ldrb	r2, [r5, #0]
c0d013b6:	2360      	movs	r3, #96	@ 0x60
c0d013b8:	4013      	ands	r3, r2
c0d013ba:	2b20      	cmp	r3, #32
c0d013bc:	d10f      	bne.n	c0d013de <USBD_StdEPReq+0x44>
c0d013be:	2902      	cmp	r1, #2
c0d013c0:	d80d      	bhi.n	c0d013de <USBD_StdEPReq+0x44>
c0d013c2:	00ca      	lsls	r2, r1, #3
c0d013c4:	18a2      	adds	r2, r4, r2
c0d013c6:	23b4      	movs	r3, #180	@ 0xb4
c0d013c8:	58d2      	ldr	r2, [r2, r3]
c0d013ca:	2a00      	cmp	r2, #0
c0d013cc:	d007      	beq.n	c0d013de <USBD_StdEPReq+0x44>
c0d013ce:	6890      	ldr	r0, [r2, #8]
c0d013d0:	f000 ffc6 	bl	c0d02360 <pic>
c0d013d4:	4602      	mov	r2, r0
c0d013d6:	4620      	mov	r0, r4
c0d013d8:	4629      	mov	r1, r5
c0d013da:	4790      	blx	r2
c0d013dc:	e057      	b.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d013de:	786a      	ldrb	r2, [r5, #1]
c0d013e0:	2a00      	cmp	r2, #0
c0d013e2:	d00a      	beq.n	c0d013fa <USBD_StdEPReq+0x60>
c0d013e4:	2a01      	cmp	r2, #1
c0d013e6:	d011      	beq.n	c0d0140c <USBD_StdEPReq+0x72>
c0d013e8:	2a03      	cmp	r2, #3
c0d013ea:	d150      	bne.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d013ec:	209c      	movs	r0, #156	@ 0x9c
c0d013ee:	5c20      	ldrb	r0, [r4, r0]
c0d013f0:	2803      	cmp	r0, #3
c0d013f2:	d017      	beq.n	c0d01424 <USBD_StdEPReq+0x8a>
c0d013f4:	2802      	cmp	r0, #2
c0d013f6:	d00f      	beq.n	c0d01418 <USBD_StdEPReq+0x7e>
c0d013f8:	e7d7      	b.n	c0d013aa <USBD_StdEPReq+0x10>
c0d013fa:	229c      	movs	r2, #156	@ 0x9c
c0d013fc:	5ca2      	ldrb	r2, [r4, r2]
c0d013fe:	2a03      	cmp	r2, #3
c0d01400:	d029      	beq.n	c0d01456 <USBD_StdEPReq+0xbc>
c0d01402:	2a02      	cmp	r2, #2
c0d01404:	d1d1      	bne.n	c0d013aa <USBD_StdEPReq+0x10>
c0d01406:	2800      	cmp	r0, #0
c0d01408:	d108      	bne.n	c0d0141c <USBD_StdEPReq+0x82>
c0d0140a:	e040      	b.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d0140c:	229c      	movs	r2, #156	@ 0x9c
c0d0140e:	5ca2      	ldrb	r2, [r4, r2]
c0d01410:	2a03      	cmp	r2, #3
c0d01412:	d02c      	beq.n	c0d0146e <USBD_StdEPReq+0xd4>
c0d01414:	2a02      	cmp	r2, #2
c0d01416:	d1c8      	bne.n	c0d013aa <USBD_StdEPReq+0x10>
c0d01418:	0648      	lsls	r0, r1, #25
c0d0141a:	d038      	beq.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d0141c:	4620      	mov	r0, r4
c0d0141e:	f000 f907 	bl	c0d01630 <USBD_LL_StallEP>
c0d01422:	e034      	b.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d01424:	8868      	ldrh	r0, [r5, #2]
c0d01426:	2800      	cmp	r0, #0
c0d01428:	d105      	bne.n	c0d01436 <USBD_StdEPReq+0x9c>
c0d0142a:	0648      	lsls	r0, r1, #25
c0d0142c:	d003      	beq.n	c0d01436 <USBD_StdEPReq+0x9c>
c0d0142e:	4620      	mov	r0, r4
c0d01430:	f000 f8fe 	bl	c0d01630 <USBD_LL_StallEP>
c0d01434:	7929      	ldrb	r1, [r5, #4]
c0d01436:	2902      	cmp	r1, #2
c0d01438:	d826      	bhi.n	c0d01488 <USBD_StdEPReq+0xee>
c0d0143a:	00c8      	lsls	r0, r1, #3
c0d0143c:	1820      	adds	r0, r4, r0
c0d0143e:	21b4      	movs	r1, #180	@ 0xb4
c0d01440:	5840      	ldr	r0, [r0, r1]
c0d01442:	2800      	cmp	r0, #0
c0d01444:	d020      	beq.n	c0d01488 <USBD_StdEPReq+0xee>
c0d01446:	6880      	ldr	r0, [r0, #8]
c0d01448:	f000 ff8a 	bl	c0d02360 <pic>
c0d0144c:	4602      	mov	r2, r0
c0d0144e:	4620      	mov	r0, r4
c0d01450:	4629      	mov	r1, r5
c0d01452:	4790      	blx	r2
c0d01454:	e018      	b.n	c0d01488 <USBD_StdEPReq+0xee>
c0d01456:	4620      	mov	r0, r4
c0d01458:	f000 f92e 	bl	c0d016b8 <USBD_LL_IsStallEP>
c0d0145c:	1e41      	subs	r1, r0, #1
c0d0145e:	4188      	sbcs	r0, r1
c0d01460:	a901      	add	r1, sp, #4
c0d01462:	8008      	strh	r0, [r1, #0]
c0d01464:	2202      	movs	r2, #2
c0d01466:	4620      	mov	r0, r4
c0d01468:	f000 f831 	bl	c0d014ce <USBD_CtlSendData>
c0d0146c:	e00f      	b.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d0146e:	886a      	ldrh	r2, [r5, #2]
c0d01470:	2a00      	cmp	r2, #0
c0d01472:	d10c      	bne.n	c0d0148e <USBD_StdEPReq+0xf4>
c0d01474:	2800      	cmp	r0, #0
c0d01476:	d007      	beq.n	c0d01488 <USBD_StdEPReq+0xee>
c0d01478:	4620      	mov	r0, r4
c0d0147a:	f000 f8fb 	bl	c0d01674 <USBD_LL_ClearStallEP>
c0d0147e:	7928      	ldrb	r0, [r5, #4]
c0d01480:	2802      	cmp	r0, #2
c0d01482:	d801      	bhi.n	c0d01488 <USBD_StdEPReq+0xee>
c0d01484:	00c0      	lsls	r0, r0, #3
c0d01486:	e7d9      	b.n	c0d0143c <USBD_StdEPReq+0xa2>
c0d01488:	4620      	mov	r0, r4
c0d0148a:	f000 f84b 	bl	c0d01524 <USBD_CtlSendStatus>
c0d0148e:	2000      	movs	r0, #0
c0d01490:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0d01492 <USBD_ParseSetupRequest>:
c0d01492:	780a      	ldrb	r2, [r1, #0]
c0d01494:	7002      	strb	r2, [r0, #0]
c0d01496:	784a      	ldrb	r2, [r1, #1]
c0d01498:	7042      	strb	r2, [r0, #1]
c0d0149a:	788a      	ldrb	r2, [r1, #2]
c0d0149c:	78cb      	ldrb	r3, [r1, #3]
c0d0149e:	021b      	lsls	r3, r3, #8
c0d014a0:	189a      	adds	r2, r3, r2
c0d014a2:	8042      	strh	r2, [r0, #2]
c0d014a4:	790a      	ldrb	r2, [r1, #4]
c0d014a6:	794b      	ldrb	r3, [r1, #5]
c0d014a8:	021b      	lsls	r3, r3, #8
c0d014aa:	189a      	adds	r2, r3, r2
c0d014ac:	8082      	strh	r2, [r0, #4]
c0d014ae:	798a      	ldrb	r2, [r1, #6]
c0d014b0:	79c9      	ldrb	r1, [r1, #7]
c0d014b2:	0209      	lsls	r1, r1, #8
c0d014b4:	1889      	adds	r1, r1, r2
c0d014b6:	80c1      	strh	r1, [r0, #6]
c0d014b8:	4770      	bx	lr

c0d014ba <USBD_CtlStall>:
c0d014ba:	b510      	push	{r4, lr}
c0d014bc:	4604      	mov	r4, r0
c0d014be:	2180      	movs	r1, #128	@ 0x80
c0d014c0:	f000 f8b6 	bl	c0d01630 <USBD_LL_StallEP>
c0d014c4:	2100      	movs	r1, #0
c0d014c6:	4620      	mov	r0, r4
c0d014c8:	f000 f8b2 	bl	c0d01630 <USBD_LL_StallEP>
c0d014cc:	bd10      	pop	{r4, pc}

c0d014ce <USBD_CtlSendData>:
c0d014ce:	b5b0      	push	{r4, r5, r7, lr}
c0d014d0:	460c      	mov	r4, r1
c0d014d2:	2194      	movs	r1, #148	@ 0x94
c0d014d4:	2302      	movs	r3, #2
c0d014d6:	5043      	str	r3, [r0, r1]
c0d014d8:	6182      	str	r2, [r0, #24]
c0d014da:	61c2      	str	r2, [r0, #28]
c0d014dc:	4601      	mov	r1, r0
c0d014de:	3194      	adds	r1, #148	@ 0x94
c0d014e0:	63cc      	str	r4, [r1, #60]	@ 0x3c
c0d014e2:	6a01      	ldr	r1, [r0, #32]
c0d014e4:	4291      	cmp	r1, r2
c0d014e6:	d800      	bhi.n	c0d014ea <USBD_CtlSendData+0x1c>
c0d014e8:	460a      	mov	r2, r1
c0d014ea:	b293      	uxth	r3, r2
c0d014ec:	2500      	movs	r5, #0
c0d014ee:	4629      	mov	r1, r5
c0d014f0:	4622      	mov	r2, r4
c0d014f2:	f000 f901 	bl	c0d016f8 <USBD_LL_Transmit>
c0d014f6:	4628      	mov	r0, r5
c0d014f8:	bdb0      	pop	{r4, r5, r7, pc}

c0d014fa <USBD_CtlContinueSendData>:
c0d014fa:	b5b0      	push	{r4, r5, r7, lr}
c0d014fc:	460c      	mov	r4, r1
c0d014fe:	6a01      	ldr	r1, [r0, #32]
c0d01500:	4291      	cmp	r1, r2
c0d01502:	d800      	bhi.n	c0d01506 <USBD_CtlContinueSendData+0xc>
c0d01504:	460a      	mov	r2, r1
c0d01506:	b293      	uxth	r3, r2
c0d01508:	2500      	movs	r5, #0
c0d0150a:	4629      	mov	r1, r5
c0d0150c:	4622      	mov	r2, r4
c0d0150e:	f000 f8f3 	bl	c0d016f8 <USBD_LL_Transmit>
c0d01512:	4628      	mov	r0, r5
c0d01514:	bdb0      	pop	{r4, r5, r7, pc}

c0d01516 <USBD_CtlContinueRx>:
c0d01516:	b510      	push	{r4, lr}
c0d01518:	2400      	movs	r4, #0
c0d0151a:	4621      	mov	r1, r4
c0d0151c:	f000 f903 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d01520:	4620      	mov	r0, r4
c0d01522:	bd10      	pop	{r4, pc}

c0d01524 <USBD_CtlSendStatus>:
c0d01524:	b510      	push	{r4, lr}
c0d01526:	2194      	movs	r1, #148	@ 0x94
c0d01528:	2204      	movs	r2, #4
c0d0152a:	5042      	str	r2, [r0, r1]
c0d0152c:	2400      	movs	r4, #0
c0d0152e:	4621      	mov	r1, r4
c0d01530:	4622      	mov	r2, r4
c0d01532:	4623      	mov	r3, r4
c0d01534:	f000 f8e0 	bl	c0d016f8 <USBD_LL_Transmit>
c0d01538:	4620      	mov	r0, r4
c0d0153a:	bd10      	pop	{r4, pc}

c0d0153c <USBD_CtlReceiveStatus>:
c0d0153c:	b510      	push	{r4, lr}
c0d0153e:	2194      	movs	r1, #148	@ 0x94
c0d01540:	2205      	movs	r2, #5
c0d01542:	5042      	str	r2, [r0, r1]
c0d01544:	2400      	movs	r4, #0
c0d01546:	4621      	mov	r1, r4
c0d01548:	4622      	mov	r2, r4
c0d0154a:	f000 f8ec 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d0154e:	4620      	mov	r0, r4
c0d01550:	bd10      	pop	{r4, pc}
	...

c0d01554 <USBD_LL_Init>:
c0d01554:	4902      	ldr	r1, [pc, #8]	@ (c0d01560 <USBD_LL_Init+0xc>)
c0d01556:	2000      	movs	r0, #0
c0d01558:	6008      	str	r0, [r1, #0]
c0d0155a:	4902      	ldr	r1, [pc, #8]	@ (c0d01564 <USBD_LL_Init+0x10>)
c0d0155c:	6008      	str	r0, [r1, #0]
c0d0155e:	4770      	bx	lr
c0d01560:	200004e4 	.word	0x200004e4
c0d01564:	200004e0 	.word	0x200004e0

c0d01568 <USBD_LL_DeInit>:
c0d01568:	b51c      	push	{r2, r3, r4, lr}
c0d0156a:	a801      	add	r0, sp, #4
c0d0156c:	2102      	movs	r1, #2
c0d0156e:	70c1      	strb	r1, [r0, #3]
c0d01570:	2101      	movs	r1, #1
c0d01572:	7081      	strb	r1, [r0, #2]
c0d01574:	2400      	movs	r4, #0
c0d01576:	7044      	strb	r4, [r0, #1]
c0d01578:	214f      	movs	r1, #79	@ 0x4f
c0d0157a:	7001      	strb	r1, [r0, #0]
c0d0157c:	2104      	movs	r1, #4
c0d0157e:	f000 ff6b 	bl	c0d02458 <io_seph_send>
c0d01582:	4620      	mov	r0, r4
c0d01584:	bd1c      	pop	{r2, r3, r4, pc}

c0d01586 <USBD_LL_Start>:
c0d01586:	b57c      	push	{r2, r3, r4, r5, r6, lr}
c0d01588:	466d      	mov	r5, sp
c0d0158a:	2400      	movs	r4, #0
c0d0158c:	712c      	strb	r4, [r5, #4]
c0d0158e:	2003      	movs	r0, #3
c0d01590:	70e8      	strb	r0, [r5, #3]
c0d01592:	2002      	movs	r0, #2
c0d01594:	70a8      	strb	r0, [r5, #2]
c0d01596:	706c      	strb	r4, [r5, #1]
c0d01598:	264f      	movs	r6, #79	@ 0x4f
c0d0159a:	702e      	strb	r6, [r5, #0]
c0d0159c:	2105      	movs	r1, #5
c0d0159e:	4628      	mov	r0, r5
c0d015a0:	f000 ff5a 	bl	c0d02458 <io_seph_send>
c0d015a4:	2001      	movs	r0, #1
c0d015a6:	70e8      	strb	r0, [r5, #3]
c0d015a8:	70a8      	strb	r0, [r5, #2]
c0d015aa:	706c      	strb	r4, [r5, #1]
c0d015ac:	702e      	strb	r6, [r5, #0]
c0d015ae:	2104      	movs	r1, #4
c0d015b0:	4628      	mov	r0, r5
c0d015b2:	f000 ff51 	bl	c0d02458 <io_seph_send>
c0d015b6:	4620      	mov	r0, r4
c0d015b8:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}

c0d015ba <USBD_LL_Stop>:
c0d015ba:	b51c      	push	{r2, r3, r4, lr}
c0d015bc:	a801      	add	r0, sp, #4
c0d015be:	2102      	movs	r1, #2
c0d015c0:	70c1      	strb	r1, [r0, #3]
c0d015c2:	2101      	movs	r1, #1
c0d015c4:	7081      	strb	r1, [r0, #2]
c0d015c6:	2400      	movs	r4, #0
c0d015c8:	7044      	strb	r4, [r0, #1]
c0d015ca:	214f      	movs	r1, #79	@ 0x4f
c0d015cc:	7001      	strb	r1, [r0, #0]
c0d015ce:	2104      	movs	r1, #4
c0d015d0:	f000 ff42 	bl	c0d02458 <io_seph_send>
c0d015d4:	4620      	mov	r0, r4
c0d015d6:	bd1c      	pop	{r2, r3, r4, pc}

c0d015d8 <USBD_LL_OpenEP>:
c0d015d8:	b57c      	push	{r2, r3, r4, r5, r6, lr}
c0d015da:	4813      	ldr	r0, [pc, #76]	@ (c0d01628 <USBD_LL_OpenEP+0x50>)
c0d015dc:	2400      	movs	r4, #0
c0d015de:	6004      	str	r4, [r0, #0]
c0d015e0:	4812      	ldr	r0, [pc, #72]	@ (c0d0162c <USBD_LL_OpenEP+0x54>)
c0d015e2:	6004      	str	r4, [r0, #0]
c0d015e4:	466d      	mov	r5, sp
c0d015e6:	71ac      	strb	r4, [r5, #6]
c0d015e8:	7169      	strb	r1, [r5, #5]
c0d015ea:	2101      	movs	r1, #1
c0d015ec:	7129      	strb	r1, [r5, #4]
c0d015ee:	2004      	movs	r0, #4
c0d015f0:	70e8      	strb	r0, [r5, #3]
c0d015f2:	2605      	movs	r6, #5
c0d015f4:	70ae      	strb	r6, [r5, #2]
c0d015f6:	706c      	strb	r4, [r5, #1]
c0d015f8:	244f      	movs	r4, #79	@ 0x4f
c0d015fa:	702c      	strb	r4, [r5, #0]
c0d015fc:	2a00      	cmp	r2, #0
c0d015fe:	d00a      	beq.n	c0d01616 <USBD_LL_OpenEP+0x3e>
c0d01600:	2a03      	cmp	r2, #3
c0d01602:	d005      	beq.n	c0d01610 <USBD_LL_OpenEP+0x38>
c0d01604:	2a02      	cmp	r2, #2
c0d01606:	d005      	beq.n	c0d01614 <USBD_LL_OpenEP+0x3c>
c0d01608:	2a01      	cmp	r2, #1
c0d0160a:	d106      	bne.n	c0d0161a <USBD_LL_OpenEP+0x42>
c0d0160c:	4601      	mov	r1, r0
c0d0160e:	e002      	b.n	c0d01616 <USBD_LL_OpenEP+0x3e>
c0d01610:	2102      	movs	r1, #2
c0d01612:	e000      	b.n	c0d01616 <USBD_LL_OpenEP+0x3e>
c0d01614:	2103      	movs	r1, #3
c0d01616:	4668      	mov	r0, sp
c0d01618:	7181      	strb	r1, [r0, #6]
c0d0161a:	4668      	mov	r0, sp
c0d0161c:	71c3      	strb	r3, [r0, #7]
c0d0161e:	2108      	movs	r1, #8
c0d01620:	f000 ff1a 	bl	c0d02458 <io_seph_send>
c0d01624:	2000      	movs	r0, #0
c0d01626:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}
c0d01628:	200004e0 	.word	0x200004e0
c0d0162c:	200004e4 	.word	0x200004e4

c0d01630 <USBD_LL_StallEP>:
c0d01630:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d01632:	460d      	mov	r5, r1
c0d01634:	4668      	mov	r0, sp
c0d01636:	2400      	movs	r4, #0
c0d01638:	7144      	strb	r4, [r0, #5]
c0d0163a:	2140      	movs	r1, #64	@ 0x40
c0d0163c:	7101      	strb	r1, [r0, #4]
c0d0163e:	70c5      	strb	r5, [r0, #3]
c0d01640:	2103      	movs	r1, #3
c0d01642:	7081      	strb	r1, [r0, #2]
c0d01644:	7044      	strb	r4, [r0, #1]
c0d01646:	2150      	movs	r1, #80	@ 0x50
c0d01648:	7001      	strb	r1, [r0, #0]
c0d0164a:	2106      	movs	r1, #6
c0d0164c:	f000 ff04 	bl	c0d02458 <io_seph_send>
c0d01650:	0628      	lsls	r0, r5, #24
c0d01652:	d501      	bpl.n	c0d01658 <USBD_LL_StallEP+0x28>
c0d01654:	4806      	ldr	r0, [pc, #24]	@ (c0d01670 <USBD_LL_StallEP+0x40>)
c0d01656:	e000      	b.n	c0d0165a <USBD_LL_StallEP+0x2a>
c0d01658:	4804      	ldr	r0, [pc, #16]	@ (c0d0166c <USBD_LL_StallEP+0x3c>)
c0d0165a:	6801      	ldr	r1, [r0, #0]
c0d0165c:	227f      	movs	r2, #127	@ 0x7f
c0d0165e:	4015      	ands	r5, r2
c0d01660:	2201      	movs	r2, #1
c0d01662:	40aa      	lsls	r2, r5
c0d01664:	430a      	orrs	r2, r1
c0d01666:	6002      	str	r2, [r0, #0]
c0d01668:	4620      	mov	r0, r4
c0d0166a:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d0166c:	200004e4 	.word	0x200004e4
c0d01670:	200004e0 	.word	0x200004e0

c0d01674 <USBD_LL_ClearStallEP>:
c0d01674:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d01676:	460d      	mov	r5, r1
c0d01678:	4668      	mov	r0, sp
c0d0167a:	2400      	movs	r4, #0
c0d0167c:	7144      	strb	r4, [r0, #5]
c0d0167e:	2180      	movs	r1, #128	@ 0x80
c0d01680:	7101      	strb	r1, [r0, #4]
c0d01682:	70c5      	strb	r5, [r0, #3]
c0d01684:	2103      	movs	r1, #3
c0d01686:	7081      	strb	r1, [r0, #2]
c0d01688:	7044      	strb	r4, [r0, #1]
c0d0168a:	2150      	movs	r1, #80	@ 0x50
c0d0168c:	7001      	strb	r1, [r0, #0]
c0d0168e:	2106      	movs	r1, #6
c0d01690:	f000 fee2 	bl	c0d02458 <io_seph_send>
c0d01694:	0628      	lsls	r0, r5, #24
c0d01696:	d501      	bpl.n	c0d0169c <USBD_LL_ClearStallEP+0x28>
c0d01698:	4806      	ldr	r0, [pc, #24]	@ (c0d016b4 <USBD_LL_ClearStallEP+0x40>)
c0d0169a:	e000      	b.n	c0d0169e <USBD_LL_ClearStallEP+0x2a>
c0d0169c:	4804      	ldr	r0, [pc, #16]	@ (c0d016b0 <USBD_LL_ClearStallEP+0x3c>)
c0d0169e:	6801      	ldr	r1, [r0, #0]
c0d016a0:	227f      	movs	r2, #127	@ 0x7f
c0d016a2:	4015      	ands	r5, r2
c0d016a4:	2201      	movs	r2, #1
c0d016a6:	40aa      	lsls	r2, r5
c0d016a8:	4391      	bics	r1, r2
c0d016aa:	6001      	str	r1, [r0, #0]
c0d016ac:	4620      	mov	r0, r4
c0d016ae:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d016b0:	200004e4 	.word	0x200004e4
c0d016b4:	200004e0 	.word	0x200004e0

c0d016b8 <USBD_LL_IsStallEP>:
c0d016b8:	0608      	lsls	r0, r1, #24
c0d016ba:	d501      	bpl.n	c0d016c0 <USBD_LL_IsStallEP+0x8>
c0d016bc:	4805      	ldr	r0, [pc, #20]	@ (c0d016d4 <USBD_LL_IsStallEP+0x1c>)
c0d016be:	e000      	b.n	c0d016c2 <USBD_LL_IsStallEP+0xa>
c0d016c0:	4803      	ldr	r0, [pc, #12]	@ (c0d016d0 <USBD_LL_IsStallEP+0x18>)
c0d016c2:	7802      	ldrb	r2, [r0, #0]
c0d016c4:	207f      	movs	r0, #127	@ 0x7f
c0d016c6:	4001      	ands	r1, r0
c0d016c8:	2001      	movs	r0, #1
c0d016ca:	4088      	lsls	r0, r1
c0d016cc:	4010      	ands	r0, r2
c0d016ce:	4770      	bx	lr
c0d016d0:	200004e4 	.word	0x200004e4
c0d016d4:	200004e0 	.word	0x200004e0

c0d016d8 <USBD_LL_SetUSBAddress>:
c0d016d8:	b51c      	push	{r2, r3, r4, lr}
c0d016da:	4668      	mov	r0, sp
c0d016dc:	7101      	strb	r1, [r0, #4]
c0d016de:	2103      	movs	r1, #3
c0d016e0:	70c1      	strb	r1, [r0, #3]
c0d016e2:	2102      	movs	r1, #2
c0d016e4:	7081      	strb	r1, [r0, #2]
c0d016e6:	2400      	movs	r4, #0
c0d016e8:	7044      	strb	r4, [r0, #1]
c0d016ea:	214f      	movs	r1, #79	@ 0x4f
c0d016ec:	7001      	strb	r1, [r0, #0]
c0d016ee:	2105      	movs	r1, #5
c0d016f0:	f000 feb2 	bl	c0d02458 <io_seph_send>
c0d016f4:	4620      	mov	r0, r4
c0d016f6:	bd1c      	pop	{r2, r3, r4, pc}

c0d016f8 <USBD_LL_Transmit>:
c0d016f8:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d016fa:	461c      	mov	r4, r3
c0d016fc:	4615      	mov	r5, r2
c0d016fe:	4668      	mov	r0, sp
c0d01700:	7143      	strb	r3, [r0, #5]
c0d01702:	2220      	movs	r2, #32
c0d01704:	7102      	strb	r2, [r0, #4]
c0d01706:	70c1      	strb	r1, [r0, #3]
c0d01708:	2150      	movs	r1, #80	@ 0x50
c0d0170a:	7001      	strb	r1, [r0, #0]
c0d0170c:	1cd9      	adds	r1, r3, #3
c0d0170e:	7081      	strb	r1, [r0, #2]
c0d01710:	0a09      	lsrs	r1, r1, #8
c0d01712:	7041      	strb	r1, [r0, #1]
c0d01714:	2106      	movs	r1, #6
c0d01716:	f000 fe9f 	bl	c0d02458 <io_seph_send>
c0d0171a:	4628      	mov	r0, r5
c0d0171c:	4621      	mov	r1, r4
c0d0171e:	f000 fe9b 	bl	c0d02458 <io_seph_send>
c0d01722:	2000      	movs	r0, #0
c0d01724:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0d01726 <USBD_LL_PrepareReceive>:
c0d01726:	b51c      	push	{r2, r3, r4, lr}
c0d01728:	4668      	mov	r0, sp
c0d0172a:	7142      	strb	r2, [r0, #5]
c0d0172c:	2230      	movs	r2, #48	@ 0x30
c0d0172e:	7102      	strb	r2, [r0, #4]
c0d01730:	70c1      	strb	r1, [r0, #3]
c0d01732:	2103      	movs	r1, #3
c0d01734:	7081      	strb	r1, [r0, #2]
c0d01736:	2400      	movs	r4, #0
c0d01738:	7044      	strb	r4, [r0, #1]
c0d0173a:	2150      	movs	r1, #80	@ 0x50
c0d0173c:	7001      	strb	r1, [r0, #0]
c0d0173e:	2106      	movs	r1, #6
c0d01740:	f000 fe8a 	bl	c0d02458 <io_seph_send>
c0d01744:	4620      	mov	r0, r4
c0d01746:	bd1c      	pop	{r2, r3, r4, pc}

c0d01748 <USBD_HID_GetHidDescriptor_impl>:
c0d01748:	4601      	mov	r1, r0
c0d0174a:	20ac      	movs	r0, #172	@ 0xac
c0d0174c:	4a06      	ldr	r2, [pc, #24]	@ (c0d01768 <USBD_HID_GetHidDescriptor_impl+0x20>)
c0d0174e:	5c12      	ldrb	r2, [r2, r0]
c0d01750:	2000      	movs	r0, #0
c0d01752:	2a00      	cmp	r2, #0
c0d01754:	d001      	beq.n	c0d0175a <USBD_HID_GetHidDescriptor_impl+0x12>
c0d01756:	4603      	mov	r3, r0
c0d01758:	e000      	b.n	c0d0175c <USBD_HID_GetHidDescriptor_impl+0x14>
c0d0175a:	2309      	movs	r3, #9
c0d0175c:	800b      	strh	r3, [r1, #0]
c0d0175e:	2a00      	cmp	r2, #0
c0d01760:	d101      	bne.n	c0d01766 <USBD_HID_GetHidDescriptor_impl+0x1e>
c0d01762:	4802      	ldr	r0, [pc, #8]	@ (c0d0176c <USBD_HID_GetHidDescriptor_impl+0x24>)
c0d01764:	4478      	add	r0, pc
c0d01766:	4770      	bx	lr
c0d01768:	2000040c 	.word	0x2000040c
c0d0176c:	0000136c 	.word	0x0000136c

c0d01770 <USBD_HID_GetReportDescriptor_impl>:
c0d01770:	4601      	mov	r1, r0
c0d01772:	20ac      	movs	r0, #172	@ 0xac
c0d01774:	4a06      	ldr	r2, [pc, #24]	@ (c0d01790 <USBD_HID_GetReportDescriptor_impl+0x20>)
c0d01776:	5c12      	ldrb	r2, [r2, r0]
c0d01778:	2000      	movs	r0, #0
c0d0177a:	2a00      	cmp	r2, #0
c0d0177c:	d001      	beq.n	c0d01782 <USBD_HID_GetReportDescriptor_impl+0x12>
c0d0177e:	4603      	mov	r3, r0
c0d01780:	e000      	b.n	c0d01784 <USBD_HID_GetReportDescriptor_impl+0x14>
c0d01782:	2322      	movs	r3, #34	@ 0x22
c0d01784:	800b      	strh	r3, [r1, #0]
c0d01786:	2a00      	cmp	r2, #0
c0d01788:	d101      	bne.n	c0d0178e <USBD_HID_GetReportDescriptor_impl+0x1e>
c0d0178a:	4802      	ldr	r0, [pc, #8]	@ (c0d01794 <USBD_HID_GetReportDescriptor_impl+0x24>)
c0d0178c:	4478      	add	r0, pc
c0d0178e:	4770      	bx	lr
c0d01790:	2000040c 	.word	0x2000040c
c0d01794:	0000134d 	.word	0x0000134d

c0d01798 <USBD_HID_DataIn_impl>:
c0d01798:	b580      	push	{r7, lr}
c0d0179a:	2902      	cmp	r1, #2
c0d0179c:	d103      	bne.n	c0d017a6 <USBD_HID_DataIn_impl+0xe>
c0d0179e:	4803      	ldr	r0, [pc, #12]	@ (c0d017ac <USBD_HID_DataIn_impl+0x14>)
c0d017a0:	4478      	add	r0, pc
c0d017a2:	f000 fd61 	bl	c0d02268 <io_usb_hid_sent>
c0d017a6:	2000      	movs	r0, #0
c0d017a8:	bd80      	pop	{r7, pc}
c0d017aa:	46c0      	nop			@ (mov r8, r8)
c0d017ac:	00000951 	.word	0x00000951

c0d017b0 <USBD_HID_DataOut_impl>:
c0d017b0:	b570      	push	{r4, r5, r6, lr}
c0d017b2:	2902      	cmp	r1, #2
c0d017b4:	d11c      	bne.n	c0d017f0 <USBD_HID_DataOut_impl+0x40>
c0d017b6:	461c      	mov	r4, r3
c0d017b8:	4615      	mov	r5, r2
c0d017ba:	2102      	movs	r1, #2
c0d017bc:	2240      	movs	r2, #64	@ 0x40
c0d017be:	f7ff ffb2 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d017c2:	4e0c      	ldr	r6, [pc, #48]	@ (c0d017f4 <USBD_HID_DataOut_impl+0x44>)
c0d017c4:	79b0      	ldrb	r0, [r6, #6]
c0d017c6:	2800      	cmp	r0, #0
c0d017c8:	d112      	bne.n	c0d017f0 <USBD_HID_DataOut_impl+0x40>
c0d017ca:	2002      	movs	r0, #2
c0d017cc:	f000 fc62 	bl	c0d02094 <io_seproxyhal_get_ep_rx_size>
c0d017d0:	4602      	mov	r2, r0
c0d017d2:	480a      	ldr	r0, [pc, #40]	@ (c0d017fc <USBD_HID_DataOut_impl+0x4c>)
c0d017d4:	4478      	add	r0, pc
c0d017d6:	4629      	mov	r1, r5
c0d017d8:	4623      	mov	r3, r4
c0d017da:	f000 fc93 	bl	c0d02104 <io_usb_hid_receive>
c0d017de:	2802      	cmp	r0, #2
c0d017e0:	d106      	bne.n	c0d017f0 <USBD_HID_DataOut_impl+0x40>
c0d017e2:	2007      	movs	r0, #7
c0d017e4:	7030      	strb	r0, [r6, #0]
c0d017e6:	2001      	movs	r0, #1
c0d017e8:	71b0      	strb	r0, [r6, #6]
c0d017ea:	4803      	ldr	r0, [pc, #12]	@ (c0d017f8 <USBD_HID_DataOut_impl+0x48>)
c0d017ec:	6800      	ldr	r0, [r0, #0]
c0d017ee:	8070      	strh	r0, [r6, #2]
c0d017f0:	2000      	movs	r0, #0
c0d017f2:	bd70      	pop	{r4, r5, r6, pc}
c0d017f4:	200005ec 	.word	0x200005ec
c0d017f8:	20000650 	.word	0x20000650
c0d017fc:	0000091d 	.word	0x0000091d

c0d01800 <USBD_WEBUSB_Init>:
c0d01800:	b570      	push	{r4, r5, r6, lr}
c0d01802:	4604      	mov	r4, r0
c0d01804:	2183      	movs	r1, #131	@ 0x83
c0d01806:	2503      	movs	r5, #3
c0d01808:	2640      	movs	r6, #64	@ 0x40
c0d0180a:	462a      	mov	r2, r5
c0d0180c:	4633      	mov	r3, r6
c0d0180e:	f7ff fee3 	bl	c0d015d8 <USBD_LL_OpenEP>
c0d01812:	4620      	mov	r0, r4
c0d01814:	4629      	mov	r1, r5
c0d01816:	462a      	mov	r2, r5
c0d01818:	4633      	mov	r3, r6
c0d0181a:	f7ff fedd 	bl	c0d015d8 <USBD_LL_OpenEP>
c0d0181e:	4620      	mov	r0, r4
c0d01820:	4629      	mov	r1, r5
c0d01822:	4632      	mov	r2, r6
c0d01824:	f7ff ff7f 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d01828:	2000      	movs	r0, #0
c0d0182a:	bd70      	pop	{r4, r5, r6, pc}

c0d0182c <USBD_WEBUSB_DeInit>:
c0d0182c:	2000      	movs	r0, #0
c0d0182e:	4770      	bx	lr

c0d01830 <USBD_WEBUSB_Setup>:
c0d01830:	2000      	movs	r0, #0
c0d01832:	4770      	bx	lr

c0d01834 <USBD_WEBUSB_DataIn>:
c0d01834:	b580      	push	{r7, lr}
c0d01836:	2903      	cmp	r1, #3
c0d01838:	d103      	bne.n	c0d01842 <USBD_WEBUSB_DataIn+0xe>
c0d0183a:	4803      	ldr	r0, [pc, #12]	@ (c0d01848 <USBD_WEBUSB_DataIn+0x14>)
c0d0183c:	4478      	add	r0, pc
c0d0183e:	f000 fd13 	bl	c0d02268 <io_usb_hid_sent>
c0d01842:	2000      	movs	r0, #0
c0d01844:	bd80      	pop	{r7, pc}
c0d01846:	46c0      	nop			@ (mov r8, r8)
c0d01848:	00000339 	.word	0x00000339

c0d0184c <USBD_WEBUSB_DataOut>:
c0d0184c:	b570      	push	{r4, r5, r6, lr}
c0d0184e:	2903      	cmp	r1, #3
c0d01850:	d11c      	bne.n	c0d0188c <USBD_WEBUSB_DataOut+0x40>
c0d01852:	461c      	mov	r4, r3
c0d01854:	4615      	mov	r5, r2
c0d01856:	2103      	movs	r1, #3
c0d01858:	2240      	movs	r2, #64	@ 0x40
c0d0185a:	f7ff ff64 	bl	c0d01726 <USBD_LL_PrepareReceive>
c0d0185e:	4e0c      	ldr	r6, [pc, #48]	@ (c0d01890 <USBD_WEBUSB_DataOut+0x44>)
c0d01860:	79b0      	ldrb	r0, [r6, #6]
c0d01862:	2800      	cmp	r0, #0
c0d01864:	d112      	bne.n	c0d0188c <USBD_WEBUSB_DataOut+0x40>
c0d01866:	2003      	movs	r0, #3
c0d01868:	f000 fc14 	bl	c0d02094 <io_seproxyhal_get_ep_rx_size>
c0d0186c:	4602      	mov	r2, r0
c0d0186e:	480a      	ldr	r0, [pc, #40]	@ (c0d01898 <USBD_WEBUSB_DataOut+0x4c>)
c0d01870:	4478      	add	r0, pc
c0d01872:	4629      	mov	r1, r5
c0d01874:	4623      	mov	r3, r4
c0d01876:	f000 fc45 	bl	c0d02104 <io_usb_hid_receive>
c0d0187a:	2802      	cmp	r0, #2
c0d0187c:	d106      	bne.n	c0d0188c <USBD_WEBUSB_DataOut+0x40>
c0d0187e:	200b      	movs	r0, #11
c0d01880:	7030      	strb	r0, [r6, #0]
c0d01882:	2005      	movs	r0, #5
c0d01884:	71b0      	strb	r0, [r6, #6]
c0d01886:	4803      	ldr	r0, [pc, #12]	@ (c0d01894 <USBD_WEBUSB_DataOut+0x48>)
c0d01888:	6800      	ldr	r0, [r0, #0]
c0d0188a:	8070      	strh	r0, [r6, #2]
c0d0188c:	2000      	movs	r0, #0
c0d0188e:	bd70      	pop	{r4, r5, r6, pc}
c0d01890:	200005ec 	.word	0x200005ec
c0d01894:	20000650 	.word	0x20000650
c0d01898:	00000305 	.word	0x00000305

c0d0189c <USBD_DeviceDescriptor>:
c0d0189c:	2012      	movs	r0, #18
c0d0189e:	8008      	strh	r0, [r1, #0]
c0d018a0:	4801      	ldr	r0, [pc, #4]	@ (c0d018a8 <USBD_DeviceDescriptor+0xc>)
c0d018a2:	4478      	add	r0, pc
c0d018a4:	4770      	bx	lr
c0d018a6:	46c0      	nop			@ (mov r8, r8)
c0d018a8:	0000147a 	.word	0x0000147a

c0d018ac <USBD_LangIDStrDescriptor>:
c0d018ac:	2004      	movs	r0, #4
c0d018ae:	8008      	strh	r0, [r1, #0]
c0d018b0:	4801      	ldr	r0, [pc, #4]	@ (c0d018b8 <USBD_LangIDStrDescriptor+0xc>)
c0d018b2:	4478      	add	r0, pc
c0d018b4:	4770      	bx	lr
c0d018b6:	46c0      	nop			@ (mov r8, r8)
c0d018b8:	0000147c 	.word	0x0000147c

c0d018bc <USBD_ManufacturerStrDescriptor>:
c0d018bc:	200e      	movs	r0, #14
c0d018be:	8008      	strh	r0, [r1, #0]
c0d018c0:	4801      	ldr	r0, [pc, #4]	@ (c0d018c8 <USBD_ManufacturerStrDescriptor+0xc>)
c0d018c2:	4478      	add	r0, pc
c0d018c4:	4770      	bx	lr
c0d018c6:	46c0      	nop			@ (mov r8, r8)
c0d018c8:	00001470 	.word	0x00001470

c0d018cc <USBD_ProductStrDescriptor>:
c0d018cc:	200e      	movs	r0, #14
c0d018ce:	8008      	strh	r0, [r1, #0]
c0d018d0:	4801      	ldr	r0, [pc, #4]	@ (c0d018d8 <USBD_ProductStrDescriptor+0xc>)
c0d018d2:	4478      	add	r0, pc
c0d018d4:	4770      	bx	lr
c0d018d6:	46c0      	nop			@ (mov r8, r8)
c0d018d8:	0000146e 	.word	0x0000146e

c0d018dc <USBD_SerialStrDescriptor>:
c0d018dc:	200a      	movs	r0, #10
c0d018de:	8008      	strh	r0, [r1, #0]
c0d018e0:	4801      	ldr	r0, [pc, #4]	@ (c0d018e8 <USBD_SerialStrDescriptor+0xc>)
c0d018e2:	4478      	add	r0, pc
c0d018e4:	4770      	bx	lr
c0d018e6:	46c0      	nop			@ (mov r8, r8)
c0d018e8:	0000146c 	.word	0x0000146c

c0d018ec <USBD_ConfigStrDescriptor>:
c0d018ec:	200e      	movs	r0, #14
c0d018ee:	8008      	strh	r0, [r1, #0]
c0d018f0:	4801      	ldr	r0, [pc, #4]	@ (c0d018f8 <USBD_ConfigStrDescriptor+0xc>)
c0d018f2:	4478      	add	r0, pc
c0d018f4:	4770      	bx	lr
c0d018f6:	46c0      	nop			@ (mov r8, r8)
c0d018f8:	0000144e 	.word	0x0000144e

c0d018fc <USBD_InterfaceStrDescriptor>:
c0d018fc:	200e      	movs	r0, #14
c0d018fe:	8008      	strh	r0, [r1, #0]
c0d01900:	4801      	ldr	r0, [pc, #4]	@ (c0d01908 <USBD_InterfaceStrDescriptor+0xc>)
c0d01902:	4478      	add	r0, pc
c0d01904:	4770      	bx	lr
c0d01906:	46c0      	nop			@ (mov r8, r8)
c0d01908:	0000143e 	.word	0x0000143e

c0d0190c <USBD_BOSDescriptor>:
c0d0190c:	2039      	movs	r0, #57	@ 0x39
c0d0190e:	8008      	strh	r0, [r1, #0]
c0d01910:	4801      	ldr	r0, [pc, #4]	@ (c0d01918 <USBD_BOSDescriptor+0xc>)
c0d01912:	4478      	add	r0, pc
c0d01914:	4770      	bx	lr
c0d01916:	46c0      	nop			@ (mov r8, r8)
c0d01918:	000011e9 	.word	0x000011e9

c0d0191c <USBD_CtlError>:
c0d0191c:	b580      	push	{r7, lr}
c0d0191e:	2200      	movs	r2, #0
c0d01920:	568a      	ldrsb	r2, [r1, r2]
c0d01922:	2a00      	cmp	r2, #0
c0d01924:	d402      	bmi.n	c0d0192c <USBD_CtlError+0x10>
c0d01926:	f7ff fdc8 	bl	c0d014ba <USBD_CtlStall>
c0d0192a:	bd80      	pop	{r7, pc}
c0d0192c:	784a      	ldrb	r2, [r1, #1]
c0d0192e:	2a77      	cmp	r2, #119	@ 0x77
c0d01930:	d00c      	beq.n	c0d0194c <USBD_CtlError+0x30>
c0d01932:	2a06      	cmp	r2, #6
c0d01934:	d1f7      	bne.n	c0d01926 <USBD_CtlError+0xa>
c0d01936:	884a      	ldrh	r2, [r1, #2]
c0d01938:	4b14      	ldr	r3, [pc, #80]	@ (c0d0198c <USBD_CtlError+0x70>)
c0d0193a:	429a      	cmp	r2, r3
c0d0193c:	d1f3      	bne.n	c0d01926 <USBD_CtlError+0xa>
c0d0193e:	88ca      	ldrh	r2, [r1, #6]
c0d01940:	2a12      	cmp	r2, #18
c0d01942:	d300      	bcc.n	c0d01946 <USBD_CtlError+0x2a>
c0d01944:	2212      	movs	r2, #18
c0d01946:	4912      	ldr	r1, [pc, #72]	@ (c0d01990 <USBD_CtlError+0x74>)
c0d01948:	4479      	add	r1, pc
c0d0194a:	e01c      	b.n	c0d01986 <USBD_CtlError+0x6a>
c0d0194c:	888a      	ldrh	r2, [r1, #4]
c0d0194e:	2a04      	cmp	r2, #4
c0d01950:	d106      	bne.n	c0d01960 <USBD_CtlError+0x44>
c0d01952:	88ca      	ldrh	r2, [r1, #6]
c0d01954:	2a28      	cmp	r2, #40	@ 0x28
c0d01956:	d300      	bcc.n	c0d0195a <USBD_CtlError+0x3e>
c0d01958:	2228      	movs	r2, #40	@ 0x28
c0d0195a:	490e      	ldr	r1, [pc, #56]	@ (c0d01994 <USBD_CtlError+0x78>)
c0d0195c:	4479      	add	r1, pc
c0d0195e:	e012      	b.n	c0d01986 <USBD_CtlError+0x6a>
c0d01960:	888a      	ldrh	r2, [r1, #4]
c0d01962:	2a05      	cmp	r2, #5
c0d01964:	d106      	bne.n	c0d01974 <USBD_CtlError+0x58>
c0d01966:	88ca      	ldrh	r2, [r1, #6]
c0d01968:	2a92      	cmp	r2, #146	@ 0x92
c0d0196a:	d300      	bcc.n	c0d0196e <USBD_CtlError+0x52>
c0d0196c:	2292      	movs	r2, #146	@ 0x92
c0d0196e:	490a      	ldr	r1, [pc, #40]	@ (c0d01998 <USBD_CtlError+0x7c>)
c0d01970:	4479      	add	r1, pc
c0d01972:	e008      	b.n	c0d01986 <USBD_CtlError+0x6a>
c0d01974:	888a      	ldrh	r2, [r1, #4]
c0d01976:	2a07      	cmp	r2, #7
c0d01978:	d1d5      	bne.n	c0d01926 <USBD_CtlError+0xa>
c0d0197a:	88ca      	ldrh	r2, [r1, #6]
c0d0197c:	2ab2      	cmp	r2, #178	@ 0xb2
c0d0197e:	d300      	bcc.n	c0d01982 <USBD_CtlError+0x66>
c0d01980:	22b2      	movs	r2, #178	@ 0xb2
c0d01982:	4906      	ldr	r1, [pc, #24]	@ (c0d0199c <USBD_CtlError+0x80>)
c0d01984:	4479      	add	r1, pc
c0d01986:	f7ff fda2 	bl	c0d014ce <USBD_CtlSendData>
c0d0198a:	bd80      	pop	{r7, pc}
c0d0198c:	000003ee 	.word	0x000003ee
c0d01990:	0000120c 	.word	0x0000120c
c0d01994:	000013fc 	.word	0x000013fc
c0d01998:	000011f6 	.word	0x000011f6
c0d0199c:	00001274 	.word	0x00001274

c0d019a0 <USB_power>:
c0d019a0:	b5b0      	push	{r4, r5, r7, lr}
c0d019a2:	4604      	mov	r4, r0
c0d019a4:	4813      	ldr	r0, [pc, #76]	@ (c0d019f4 <USB_power+0x54>)
c0d019a6:	21d4      	movs	r1, #212	@ 0xd4
c0d019a8:	f000 ff10 	bl	c0d027cc <__aeabi_memclr>
c0d019ac:	4812      	ldr	r0, [pc, #72]	@ (c0d019f8 <USB_power+0x58>)
c0d019ae:	2100      	movs	r1, #0
c0d019b0:	60c1      	str	r1, [r0, #12]
c0d019b2:	6101      	str	r1, [r0, #16]
c0d019b4:	6141      	str	r1, [r0, #20]
c0d019b6:	2c00      	cmp	r4, #0
c0d019b8:	d017      	beq.n	c0d019ea <USB_power+0x4a>
c0d019ba:	4c0e      	ldr	r4, [pc, #56]	@ (c0d019f4 <USB_power+0x54>)
c0d019bc:	490f      	ldr	r1, [pc, #60]	@ (c0d019fc <USB_power+0x5c>)
c0d019be:	4479      	add	r1, pc
c0d019c0:	2500      	movs	r5, #0
c0d019c2:	4620      	mov	r0, r4
c0d019c4:	462a      	mov	r2, r5
c0d019c6:	f7ff f980 	bl	c0d00cca <USBD_Init>
c0d019ca:	4a0d      	ldr	r2, [pc, #52]	@ (c0d01a00 <USB_power+0x60>)
c0d019cc:	447a      	add	r2, pc
c0d019ce:	4628      	mov	r0, r5
c0d019d0:	4621      	mov	r1, r4
c0d019d2:	f7ff f9ae 	bl	c0d00d32 <USBD_RegisterClassForInterface>
c0d019d6:	2001      	movs	r0, #1
c0d019d8:	4a0a      	ldr	r2, [pc, #40]	@ (c0d01a04 <USB_power+0x64>)
c0d019da:	447a      	add	r2, pc
c0d019dc:	4621      	mov	r1, r4
c0d019de:	f7ff f9a8 	bl	c0d00d32 <USBD_RegisterClassForInterface>
c0d019e2:	4620      	mov	r0, r4
c0d019e4:	f7ff f9b2 	bl	c0d00d4c <USBD_Start>
c0d019e8:	bdb0      	pop	{r4, r5, r7, pc}
c0d019ea:	4802      	ldr	r0, [pc, #8]	@ (c0d019f4 <USB_power+0x54>)
c0d019ec:	f7ff f985 	bl	c0d00cfa <USBD_DeInit>
c0d019f0:	bdb0      	pop	{r4, r5, r7, pc}
c0d019f2:	46c0      	nop			@ (mov r8, r8)
c0d019f4:	2000040c 	.word	0x2000040c
c0d019f8:	200005ec 	.word	0x200005ec
c0d019fc:	00001176 	.word	0x00001176
c0d01a00:	000012e0 	.word	0x000012e0
c0d01a04:	0000130a 	.word	0x0000130a

c0d01a08 <USBD_GetCfgDesc_impl>:
c0d01a08:	2140      	movs	r1, #64	@ 0x40
c0d01a0a:	8001      	strh	r1, [r0, #0]
c0d01a0c:	4801      	ldr	r0, [pc, #4]	@ (c0d01a14 <USBD_GetCfgDesc_impl+0xc>)
c0d01a0e:	4478      	add	r0, pc
c0d01a10:	4770      	bx	lr
c0d01a12:	46c0      	nop			@ (mov r8, r8)
c0d01a14:	00001372 	.word	0x00001372

c0d01a18 <USBD_GetDeviceQualifierDesc_impl>:
c0d01a18:	210a      	movs	r1, #10
c0d01a1a:	8001      	strh	r1, [r0, #0]
c0d01a1c:	4801      	ldr	r0, [pc, #4]	@ (c0d01a24 <USBD_GetDeviceQualifierDesc_impl+0xc>)
c0d01a1e:	4478      	add	r0, pc
c0d01a20:	4770      	bx	lr
c0d01a22:	46c0      	nop			@ (mov r8, r8)
c0d01a24:	000013a2 	.word	0x000013a2

c0d01a28 <cx_ecfp_generate_pair_no_throw>:
c0d01a28:	b403      	push	{r0, r1}
c0d01a2a:	4801      	ldr	r0, [pc, #4]	@ (c0d01a30 <cx_ecfp_generate_pair_no_throw+0x8>)
c0d01a2c:	e023      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a2e:	0000      	.short	0x0000
c0d01a30:	0000001b 	.word	0x0000001b

c0d01a34 <cx_ecfp_init_private_key_no_throw>:
c0d01a34:	b403      	push	{r0, r1}
c0d01a36:	4801      	ldr	r0, [pc, #4]	@ (c0d01a3c <cx_ecfp_init_private_key_no_throw+0x8>)
c0d01a38:	e01d      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a3a:	0000      	.short	0x0000
c0d01a3c:	0000001c 	.word	0x0000001c

c0d01a40 <cx_eddsa_sign_no_throw>:
c0d01a40:	b403      	push	{r0, r1}
c0d01a42:	4801      	ldr	r0, [pc, #4]	@ (c0d01a48 <cx_eddsa_sign_no_throw+0x8>)
c0d01a44:	e017      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a46:	0000      	.short	0x0000
c0d01a48:	00000023 	.word	0x00000023

c0d01a4c <cx_hash_no_throw>:
c0d01a4c:	b403      	push	{r0, r1}
c0d01a4e:	4801      	ldr	r0, [pc, #4]	@ (c0d01a54 <cx_hash_no_throw+0x8>)
c0d01a50:	e011      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a52:	0000      	.short	0x0000
c0d01a54:	00000032 	.word	0x00000032

c0d01a58 <cx_rng_no_throw>:
c0d01a58:	b403      	push	{r0, r1}
c0d01a5a:	4801      	ldr	r0, [pc, #4]	@ (c0d01a60 <cx_rng_no_throw+0x8>)
c0d01a5c:	e00b      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a5e:	0000      	.short	0x0000
c0d01a60:	00000058 	.word	0x00000058

c0d01a64 <cx_sha256_init_no_throw>:
c0d01a64:	b403      	push	{r0, r1}
c0d01a66:	4801      	ldr	r0, [pc, #4]	@ (c0d01a6c <cx_sha256_init_no_throw+0x8>)
c0d01a68:	e005      	b.n	c0d01a76 <cx_trampoline_helper>
c0d01a6a:	0000      	.short	0x0000
c0d01a6c:	0000005f 	.word	0x0000005f

c0d01a70 <cx_x448>:
c0d01a70:	b403      	push	{r0, r1}
c0d01a72:	4802      	ldr	r0, [pc, #8]	@ (c0d01a7c <cx_trampoline_helper+0x6>)
c0d01a74:	e7ff      	b.n	c0d01a76 <cx_trampoline_helper>

c0d01a76 <cx_trampoline_helper>:
c0d01a76:	4902      	ldr	r1, [pc, #8]	@ (c0d01a80 <cx_trampoline_helper+0xa>)
c0d01a78:	4708      	bx	r1
c0d01a7a:	0000      	.short	0x0000
c0d01a7c:	00000071 	.word	0x00000071
c0d01a80:	00120001 	.word	0x00120001

c0d01a84 <os_boot>:
c0d01a84:	b580      	push	{r7, lr}
c0d01a86:	2000      	movs	r0, #0
c0d01a88:	f000 fd10 	bl	c0d024ac <try_context_set>
c0d01a8c:	bd80      	pop	{r7, pc}

c0d01a8e <os_longjmp>:
c0d01a8e:	4604      	mov	r4, r0
c0d01a90:	f000 fd02 	bl	c0d02498 <try_context_get>
c0d01a94:	4621      	mov	r1, r4
c0d01a96:	f000 ffb3 	bl	c0d02a00 <longjmp>
	...

c0d01a9c <io_seproxyhal_general_status>:
c0d01a9c:	b580      	push	{r7, lr}
c0d01a9e:	4803      	ldr	r0, [pc, #12]	@ (c0d01aac <io_seproxyhal_general_status+0x10>)
c0d01aa0:	4478      	add	r0, pc
c0d01aa2:	2105      	movs	r1, #5
c0d01aa4:	f000 fcd8 	bl	c0d02458 <io_seph_send>
c0d01aa8:	bd80      	pop	{r7, pc}
c0d01aaa:	46c0      	nop			@ (mov r8, r8)
c0d01aac:	0000132a 	.word	0x0000132a

c0d01ab0 <io_seproxyhal_handle_usb_event>:
c0d01ab0:	b510      	push	{r4, lr}
c0d01ab2:	4815      	ldr	r0, [pc, #84]	@ (c0d01b08 <io_seproxyhal_handle_usb_event+0x58>)
c0d01ab4:	78c0      	ldrb	r0, [r0, #3]
c0d01ab6:	2808      	cmp	r0, #8
c0d01ab8:	d01a      	beq.n	c0d01af0 <io_seproxyhal_handle_usb_event+0x40>
c0d01aba:	2802      	cmp	r0, #2
c0d01abc:	d014      	beq.n	c0d01ae8 <io_seproxyhal_handle_usb_event+0x38>
c0d01abe:	2804      	cmp	r0, #4
c0d01ac0:	d01a      	beq.n	c0d01af8 <io_seproxyhal_handle_usb_event+0x48>
c0d01ac2:	2801      	cmp	r0, #1
c0d01ac4:	d117      	bne.n	c0d01af6 <io_seproxyhal_handle_usb_event+0x46>
c0d01ac6:	4c11      	ldr	r4, [pc, #68]	@ (c0d01b0c <io_seproxyhal_handle_usb_event+0x5c>)
c0d01ac8:	2101      	movs	r1, #1
c0d01aca:	4620      	mov	r0, r4
c0d01acc:	f7ff fa93 	bl	c0d00ff6 <USBD_LL_SetSpeed>
c0d01ad0:	4620      	mov	r0, r4
c0d01ad2:	f7ff fa70 	bl	c0d00fb6 <USBD_LL_Reset>
c0d01ad6:	480e      	ldr	r0, [pc, #56]	@ (c0d01b10 <io_seproxyhal_handle_usb_event+0x60>)
c0d01ad8:	7981      	ldrb	r1, [r0, #6]
c0d01ada:	2900      	cmp	r1, #0
c0d01adc:	d110      	bne.n	c0d01b00 <io_seproxyhal_handle_usb_event+0x50>
c0d01ade:	2100      	movs	r1, #0
c0d01ae0:	60c1      	str	r1, [r0, #12]
c0d01ae2:	6101      	str	r1, [r0, #16]
c0d01ae4:	6141      	str	r1, [r0, #20]
c0d01ae6:	bd10      	pop	{r4, pc}
c0d01ae8:	4808      	ldr	r0, [pc, #32]	@ (c0d01b0c <io_seproxyhal_handle_usb_event+0x5c>)
c0d01aea:	f7ff fa8b 	bl	c0d01004 <USBD_LL_SOF>
c0d01aee:	bd10      	pop	{r4, pc}
c0d01af0:	4806      	ldr	r0, [pc, #24]	@ (c0d01b0c <io_seproxyhal_handle_usb_event+0x5c>)
c0d01af2:	f7ff fa85 	bl	c0d01000 <USBD_LL_Resume>
c0d01af6:	bd10      	pop	{r4, pc}
c0d01af8:	4804      	ldr	r0, [pc, #16]	@ (c0d01b0c <io_seproxyhal_handle_usb_event+0x5c>)
c0d01afa:	f7ff fa7f 	bl	c0d00ffc <USBD_LL_Suspend>
c0d01afe:	bd10      	pop	{r4, pc}
c0d01b00:	2005      	movs	r0, #5
c0d01b02:	f7ff ffc4 	bl	c0d01a8e <os_longjmp>
c0d01b06:	46c0      	nop			@ (mov r8, r8)
c0d01b08:	2000027c 	.word	0x2000027c
c0d01b0c:	2000040c 	.word	0x2000040c
c0d01b10:	200005ec 	.word	0x200005ec

c0d01b14 <io_seproxyhal_handle_usb_ep_xfer_event>:
c0d01b14:	b580      	push	{r7, lr}
c0d01b16:	4815      	ldr	r0, [pc, #84]	@ (c0d01b6c <io_seproxyhal_handle_usb_ep_xfer_event+0x58>)
c0d01b18:	78c2      	ldrb	r2, [r0, #3]
c0d01b1a:	217f      	movs	r1, #127	@ 0x7f
c0d01b1c:	4011      	ands	r1, r2
c0d01b1e:	7902      	ldrb	r2, [r0, #4]
c0d01b20:	2a04      	cmp	r2, #4
c0d01b22:	d014      	beq.n	c0d01b4e <io_seproxyhal_handle_usb_ep_xfer_event+0x3a>
c0d01b24:	2a02      	cmp	r2, #2
c0d01b26:	d006      	beq.n	c0d01b36 <io_seproxyhal_handle_usb_ep_xfer_event+0x22>
c0d01b28:	2a01      	cmp	r2, #1
c0d01b2a:	d11e      	bne.n	c0d01b6a <io_seproxyhal_handle_usb_ep_xfer_event+0x56>
c0d01b2c:	1d81      	adds	r1, r0, #6
c0d01b2e:	4811      	ldr	r0, [pc, #68]	@ (c0d01b74 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d01b30:	f7ff f947 	bl	c0d00dc2 <USBD_LL_SetupStage>
c0d01b34:	bd80      	pop	{r7, pc}
c0d01b36:	2903      	cmp	r1, #3
c0d01b38:	d817      	bhi.n	c0d01b6a <io_seproxyhal_handle_usb_ep_xfer_event+0x56>
c0d01b3a:	004a      	lsls	r2, r1, #1
c0d01b3c:	4b0c      	ldr	r3, [pc, #48]	@ (c0d01b70 <io_seproxyhal_handle_usb_ep_xfer_event+0x5c>)
c0d01b3e:	189a      	adds	r2, r3, r2
c0d01b40:	2300      	movs	r3, #0
c0d01b42:	8213      	strh	r3, [r2, #16]
c0d01b44:	1d82      	adds	r2, r0, #6
c0d01b46:	480b      	ldr	r0, [pc, #44]	@ (c0d01b74 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d01b48:	f7ff f9c4 	bl	c0d00ed4 <USBD_LL_DataInStage>
c0d01b4c:	bd80      	pop	{r7, pc}
c0d01b4e:	2903      	cmp	r1, #3
c0d01b50:	d80b      	bhi.n	c0d01b6a <io_seproxyhal_handle_usb_ep_xfer_event+0x56>
c0d01b52:	4a07      	ldr	r2, [pc, #28]	@ (c0d01b70 <io_seproxyhal_handle_usb_ep_xfer_event+0x5c>)
c0d01b54:	1852      	adds	r2, r2, r1
c0d01b56:	7943      	ldrb	r3, [r0, #5]
c0d01b58:	2b7a      	cmp	r3, #122	@ 0x7a
c0d01b5a:	d300      	bcc.n	c0d01b5e <io_seproxyhal_handle_usb_ep_xfer_event+0x4a>
c0d01b5c:	237a      	movs	r3, #122	@ 0x7a
c0d01b5e:	7313      	strb	r3, [r2, #12]
c0d01b60:	1d82      	adds	r2, r0, #6
c0d01b62:	4804      	ldr	r0, [pc, #16]	@ (c0d01b74 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d01b64:	2300      	movs	r3, #0
c0d01b66:	f7ff f95a 	bl	c0d00e1e <USBD_LL_DataOutStage>
c0d01b6a:	bd80      	pop	{r7, pc}
c0d01b6c:	2000027c 	.word	0x2000027c
c0d01b70:	200005ec 	.word	0x200005ec
c0d01b74:	2000040c 	.word	0x2000040c

c0d01b78 <io_usb_send_apdu_data_ep0x83>:
c0d01b78:	b580      	push	{r7, lr}
c0d01b7a:	460a      	mov	r2, r1
c0d01b7c:	4601      	mov	r1, r0
c0d01b7e:	2083      	movs	r0, #131	@ 0x83
c0d01b80:	2314      	movs	r3, #20
c0d01b82:	f000 fa93 	bl	c0d020ac <io_usb_send_ep>
c0d01b86:	bd80      	pop	{r7, pc}

c0d01b88 <io_seproxyhal_handle_capdu_event>:
c0d01b88:	b580      	push	{r7, lr}
c0d01b8a:	480b      	ldr	r0, [pc, #44]	@ (c0d01bb8 <io_seproxyhal_handle_capdu_event+0x30>)
c0d01b8c:	7801      	ldrb	r1, [r0, #0]
c0d01b8e:	2900      	cmp	r1, #0
c0d01b90:	d000      	beq.n	c0d01b94 <io_seproxyhal_handle_capdu_event+0xc>
c0d01b92:	bd80      	pop	{r7, pc}
c0d01b94:	2106      	movs	r1, #6
c0d01b96:	7181      	strb	r1, [r0, #6]
c0d01b98:	210a      	movs	r1, #10
c0d01b9a:	7001      	strb	r1, [r0, #0]
c0d01b9c:	4907      	ldr	r1, [pc, #28]	@ (c0d01bbc <io_seproxyhal_handle_capdu_event+0x34>)
c0d01b9e:	788a      	ldrb	r2, [r1, #2]
c0d01ba0:	784b      	ldrb	r3, [r1, #1]
c0d01ba2:	021b      	lsls	r3, r3, #8
c0d01ba4:	189a      	adds	r2, r3, r2
c0d01ba6:	2a7d      	cmp	r2, #125	@ 0x7d
c0d01ba8:	d300      	bcc.n	c0d01bac <io_seproxyhal_handle_capdu_event+0x24>
c0d01baa:	227d      	movs	r2, #125	@ 0x7d
c0d01bac:	8042      	strh	r2, [r0, #2]
c0d01bae:	1cc9      	adds	r1, r1, #3
c0d01bb0:	4803      	ldr	r0, [pc, #12]	@ (c0d01bc0 <io_seproxyhal_handle_capdu_event+0x38>)
c0d01bb2:	f000 fe11 	bl	c0d027d8 <__aeabi_memcpy>
c0d01bb6:	bd80      	pop	{r7, pc}
c0d01bb8:	200005ec 	.word	0x200005ec
c0d01bbc:	2000027c 	.word	0x2000027c
c0d01bc0:	200004e8 	.word	0x200004e8

c0d01bc4 <io_seproxyhal_handle_event>:
c0d01bc4:	b580      	push	{r7, lr}
c0d01bc6:	491d      	ldr	r1, [pc, #116]	@ (c0d01c3c <io_seproxyhal_handle_event+0x78>)
c0d01bc8:	7808      	ldrb	r0, [r1, #0]
c0d01bca:	280e      	cmp	r0, #14
c0d01bcc:	d00e      	beq.n	c0d01bec <io_seproxyhal_handle_event+0x28>
c0d01bce:	2816      	cmp	r0, #22
c0d01bd0:	d023      	beq.n	c0d01c1a <io_seproxyhal_handle_event+0x56>
c0d01bd2:	788a      	ldrb	r2, [r1, #2]
c0d01bd4:	7849      	ldrb	r1, [r1, #1]
c0d01bd6:	0209      	lsls	r1, r1, #8
c0d01bd8:	1889      	adds	r1, r1, r2
c0d01bda:	2810      	cmp	r0, #16
c0d01bdc:	d020      	beq.n	c0d01c20 <io_seproxyhal_handle_event+0x5c>
c0d01bde:	280f      	cmp	r0, #15
c0d01be0:	d117      	bne.n	c0d01c12 <io_seproxyhal_handle_event+0x4e>
c0d01be2:	2901      	cmp	r1, #1
c0d01be4:	d11e      	bne.n	c0d01c24 <io_seproxyhal_handle_event+0x60>
c0d01be6:	f7ff ff63 	bl	c0d01ab0 <io_seproxyhal_handle_usb_event>
c0d01bea:	e01f      	b.n	c0d01c2c <io_seproxyhal_handle_event+0x68>
c0d01bec:	4814      	ldr	r0, [pc, #80]	@ (c0d01c40 <io_seproxyhal_handle_event+0x7c>)
c0d01bee:	6881      	ldr	r1, [r0, #8]
c0d01bf0:	3164      	adds	r1, #100	@ 0x64
c0d01bf2:	6081      	str	r1, [r0, #8]
c0d01bf4:	2116      	movs	r1, #22
c0d01bf6:	290e      	cmp	r1, #14
c0d01bf8:	d00b      	beq.n	c0d01c12 <io_seproxyhal_handle_event+0x4e>
c0d01bfa:	5a42      	ldrh	r2, [r0, r1]
c0d01bfc:	2a00      	cmp	r2, #0
c0d01bfe:	d006      	beq.n	c0d01c0e <io_seproxyhal_handle_event+0x4a>
c0d01c00:	4613      	mov	r3, r2
c0d01c02:	3b64      	subs	r3, #100	@ 0x64
c0d01c04:	d200      	bcs.n	c0d01c08 <io_seproxyhal_handle_event+0x44>
c0d01c06:	2300      	movs	r3, #0
c0d01c08:	5243      	strh	r3, [r0, r1]
c0d01c0a:	2a65      	cmp	r2, #101	@ 0x65
c0d01c0c:	d310      	bcc.n	c0d01c30 <io_seproxyhal_handle_event+0x6c>
c0d01c0e:	1e89      	subs	r1, r1, #2
c0d01c10:	e7f1      	b.n	c0d01bf6 <io_seproxyhal_handle_event+0x32>
c0d01c12:	2002      	movs	r0, #2
c0d01c14:	f7fe fd26 	bl	c0d00664 <io_event>
c0d01c18:	bd80      	pop	{r7, pc}
c0d01c1a:	f7ff ffb5 	bl	c0d01b88 <io_seproxyhal_handle_capdu_event>
c0d01c1e:	e005      	b.n	c0d01c2c <io_seproxyhal_handle_event+0x68>
c0d01c20:	2903      	cmp	r1, #3
c0d01c22:	d201      	bcs.n	c0d01c28 <io_seproxyhal_handle_event+0x64>
c0d01c24:	2000      	movs	r0, #0
c0d01c26:	bd80      	pop	{r7, pc}
c0d01c28:	f7ff ff74 	bl	c0d01b14 <io_seproxyhal_handle_usb_ep_xfer_event>
c0d01c2c:	2001      	movs	r0, #1
c0d01c2e:	bd80      	pop	{r7, pc}
c0d01c30:	2100      	movs	r1, #0
c0d01c32:	7001      	strb	r1, [r0, #0]
c0d01c34:	2005      	movs	r0, #5
c0d01c36:	f7ff ff2a 	bl	c0d01a8e <os_longjmp>
c0d01c3a:	46c0      	nop			@ (mov r8, r8)
c0d01c3c:	2000027c 	.word	0x2000027c
c0d01c40:	200005ec 	.word	0x200005ec

c0d01c44 <io_seproxyhal_init>:
c0d01c44:	b580      	push	{r7, lr}
c0d01c46:	4805      	ldr	r0, [pc, #20]	@ (c0d01c5c <io_seproxyhal_init+0x18>)
c0d01c48:	2118      	movs	r1, #24
c0d01c4a:	f000 fdbf 	bl	c0d027cc <__aeabi_memclr>
c0d01c4e:	f000 fafd 	bl	c0d0224c <io_usb_hid_init>
c0d01c52:	4803      	ldr	r0, [pc, #12]	@ (c0d01c60 <io_seproxyhal_init+0x1c>)
c0d01c54:	2100      	movs	r1, #0
c0d01c56:	6001      	str	r1, [r0, #0]
c0d01c58:	6041      	str	r1, [r0, #4]
c0d01c5a:	bd80      	pop	{r7, pc}
c0d01c5c:	200005ec 	.word	0x200005ec
c0d01c60:	20000604 	.word	0x20000604

c0d01c64 <io_seproxyhal_init_ux>:
c0d01c64:	4770      	bx	lr
	...

c0d01c68 <io_seproxyhal_init_button>:
c0d01c68:	4802      	ldr	r0, [pc, #8]	@ (c0d01c74 <io_seproxyhal_init_button+0xc>)
c0d01c6a:	2100      	movs	r1, #0
c0d01c6c:	6001      	str	r1, [r0, #0]
c0d01c6e:	6041      	str	r1, [r0, #4]
c0d01c70:	4770      	bx	lr
c0d01c72:	46c0      	nop			@ (mov r8, r8)
c0d01c74:	20000604 	.word	0x20000604

c0d01c78 <io_seproxyhal_display_icon>:
c0d01c78:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01c7a:	b087      	sub	sp, #28
c0d01c7c:	4605      	mov	r5, r0
c0d01c7e:	4608      	mov	r0, r1
c0d01c80:	f000 fb6e 	bl	c0d02360 <pic>
c0d01c84:	2800      	cmp	r0, #0
c0d01c86:	d03f      	beq.n	c0d01d08 <io_seproxyhal_display_icon+0x90>
c0d01c88:	4604      	mov	r4, r0
c0d01c8a:	6900      	ldr	r0, [r0, #16]
c0d01c8c:	2800      	cmp	r0, #0
c0d01c8e:	d03b      	beq.n	c0d01d08 <io_seproxyhal_display_icon+0x90>
c0d01c90:	4628      	mov	r0, r5
c0d01c92:	f000 fb65 	bl	c0d02360 <pic>
c0d01c96:	4601      	mov	r1, r0
c0d01c98:	466d      	mov	r5, sp
c0d01c9a:	221c      	movs	r2, #28
c0d01c9c:	4628      	mov	r0, r5
c0d01c9e:	f000 fd9b 	bl	c0d027d8 <__aeabi_memcpy>
c0d01ca2:	6826      	ldr	r6, [r4, #0]
c0d01ca4:	80ee      	strh	r6, [r5, #6]
c0d01ca6:	6867      	ldr	r7, [r4, #4]
c0d01ca8:	812f      	strh	r7, [r5, #8]
c0d01caa:	f000 fbdf 	bl	c0d0246c <io_seph_is_status_sent>
c0d01cae:	2800      	cmp	r0, #0
c0d01cb0:	d12a      	bne.n	c0d01d08 <io_seproxyhal_display_icon+0x90>
c0d01cb2:	b2b9      	uxth	r1, r7
c0d01cb4:	b2b2      	uxth	r2, r6
c0d01cb6:	4815      	ldr	r0, [pc, #84]	@ (c0d01d0c <io_seproxyhal_display_icon+0x94>)
c0d01cb8:	2365      	movs	r3, #101	@ 0x65
c0d01cba:	7003      	strb	r3, [r0, #0]
c0d01cbc:	68a3      	ldr	r3, [r4, #8]
c0d01cbe:	435a      	muls	r2, r3
c0d01cc0:	434a      	muls	r2, r1
c0d01cc2:	0751      	lsls	r1, r2, #29
c0d01cc4:	08d6      	lsrs	r6, r2, #3
c0d01cc6:	2900      	cmp	r1, #0
c0d01cc8:	d000      	beq.n	c0d01ccc <io_seproxyhal_display_icon+0x54>
c0d01cca:	1c76      	adds	r6, r6, #1
c0d01ccc:	2504      	movs	r5, #4
c0d01cce:	409d      	lsls	r5, r3
c0d01cd0:	19a9      	adds	r1, r5, r6
c0d01cd2:	311d      	adds	r1, #29
c0d01cd4:	7081      	strb	r1, [r0, #2]
c0d01cd6:	0a09      	lsrs	r1, r1, #8
c0d01cd8:	7041      	strb	r1, [r0, #1]
c0d01cda:	2103      	movs	r1, #3
c0d01cdc:	4f0c      	ldr	r7, [pc, #48]	@ (c0d01d10 <io_seproxyhal_display_icon+0x98>)
c0d01cde:	447f      	add	r7, pc
c0d01ce0:	47b8      	blx	r7
c0d01ce2:	4668      	mov	r0, sp
c0d01ce4:	211c      	movs	r1, #28
c0d01ce6:	47b8      	blx	r7
c0d01ce8:	68a1      	ldr	r1, [r4, #8]
c0d01cea:	4808      	ldr	r0, [pc, #32]	@ (c0d01d0c <io_seproxyhal_display_icon+0x94>)
c0d01cec:	7001      	strb	r1, [r0, #0]
c0d01cee:	2101      	movs	r1, #1
c0d01cf0:	47b8      	blx	r7
c0d01cf2:	68e0      	ldr	r0, [r4, #12]
c0d01cf4:	f000 fb34 	bl	c0d02360 <pic>
c0d01cf8:	b2a9      	uxth	r1, r5
c0d01cfa:	47b8      	blx	r7
c0d01cfc:	b2b5      	uxth	r5, r6
c0d01cfe:	6920      	ldr	r0, [r4, #16]
c0d01d00:	f000 fb2e 	bl	c0d02360 <pic>
c0d01d04:	4629      	mov	r1, r5
c0d01d06:	47b8      	blx	r7
c0d01d08:	b007      	add	sp, #28
c0d01d0a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01d0c:	2000027c 	.word	0x2000027c
c0d01d10:	00000777 	.word	0x00000777

c0d01d14 <io_seproxyhal_display_default>:
c0d01d14:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d01d16:	f000 fb23 	bl	c0d02360 <pic>
c0d01d1a:	4604      	mov	r4, r0
c0d01d1c:	69c0      	ldr	r0, [r0, #28]
c0d01d1e:	f000 fb1f 	bl	c0d02360 <pic>
c0d01d22:	4605      	mov	r5, r0
c0d01d24:	7821      	ldrb	r1, [r4, #0]
c0d01d26:	207f      	movs	r0, #127	@ 0x7f
c0d01d28:	4008      	ands	r0, r1
c0d01d2a:	d00a      	beq.n	c0d01d42 <io_seproxyhal_display_default+0x2e>
c0d01d2c:	2d00      	cmp	r5, #0
c0d01d2e:	d009      	beq.n	c0d01d44 <io_seproxyhal_display_default+0x30>
c0d01d30:	2805      	cmp	r0, #5
c0d01d32:	d102      	bne.n	c0d01d3a <io_seproxyhal_display_default+0x26>
c0d01d34:	7ea0      	ldrb	r0, [r4, #26]
c0d01d36:	2800      	cmp	r0, #0
c0d01d38:	d02e      	beq.n	c0d01d98 <io_seproxyhal_display_default+0x84>
c0d01d3a:	f000 fb97 	bl	c0d0246c <io_seph_is_status_sent>
c0d01d3e:	2800      	cmp	r0, #0
c0d01d40:	d013      	beq.n	c0d01d6a <io_seproxyhal_display_default+0x56>
c0d01d42:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01d44:	f000 fb92 	bl	c0d0246c <io_seph_is_status_sent>
c0d01d48:	2800      	cmp	r0, #0
c0d01d4a:	d1fa      	bne.n	c0d01d42 <io_seproxyhal_display_default+0x2e>
c0d01d4c:	4815      	ldr	r0, [pc, #84]	@ (c0d01da4 <io_seproxyhal_display_default+0x90>)
c0d01d4e:	251c      	movs	r5, #28
c0d01d50:	7085      	strb	r5, [r0, #2]
c0d01d52:	2100      	movs	r1, #0
c0d01d54:	7041      	strb	r1, [r0, #1]
c0d01d56:	2165      	movs	r1, #101	@ 0x65
c0d01d58:	7001      	strb	r1, [r0, #0]
c0d01d5a:	2103      	movs	r1, #3
c0d01d5c:	f000 fb7c 	bl	c0d02458 <io_seph_send>
c0d01d60:	4620      	mov	r0, r4
c0d01d62:	4629      	mov	r1, r5
c0d01d64:	f000 fb78 	bl	c0d02458 <io_seph_send>
c0d01d68:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01d6a:	4628      	mov	r0, r5
c0d01d6c:	f000 fe56 	bl	c0d02a1c <strlen>
c0d01d70:	4606      	mov	r6, r0
c0d01d72:	480c      	ldr	r0, [pc, #48]	@ (c0d01da4 <io_seproxyhal_display_default+0x90>)
c0d01d74:	2165      	movs	r1, #101	@ 0x65
c0d01d76:	7001      	strb	r1, [r0, #0]
c0d01d78:	4631      	mov	r1, r6
c0d01d7a:	311c      	adds	r1, #28
c0d01d7c:	7081      	strb	r1, [r0, #2]
c0d01d7e:	0a09      	lsrs	r1, r1, #8
c0d01d80:	7041      	strb	r1, [r0, #1]
c0d01d82:	2103      	movs	r1, #3
c0d01d84:	4f08      	ldr	r7, [pc, #32]	@ (c0d01da8 <io_seproxyhal_display_default+0x94>)
c0d01d86:	447f      	add	r7, pc
c0d01d88:	47b8      	blx	r7
c0d01d8a:	211c      	movs	r1, #28
c0d01d8c:	4620      	mov	r0, r4
c0d01d8e:	47b8      	blx	r7
c0d01d90:	b2b1      	uxth	r1, r6
c0d01d92:	4628      	mov	r0, r5
c0d01d94:	47b8      	blx	r7
c0d01d96:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01d98:	4620      	mov	r0, r4
c0d01d9a:	4629      	mov	r1, r5
c0d01d9c:	f7ff ff6c 	bl	c0d01c78 <io_seproxyhal_display_icon>
c0d01da0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01da2:	46c0      	nop			@ (mov r8, r8)
c0d01da4:	2000027c 	.word	0x2000027c
c0d01da8:	000006cf 	.word	0x000006cf

c0d01dac <io_seproxyhal_button_push>:
c0d01dac:	b570      	push	{r4, r5, r6, lr}
c0d01dae:	2800      	cmp	r0, #0
c0d01db0:	d027      	beq.n	c0d01e02 <io_seproxyhal_button_push+0x56>
c0d01db2:	4604      	mov	r4, r0
c0d01db4:	4813      	ldr	r0, [pc, #76]	@ (c0d01e04 <io_seproxyhal_button_push+0x58>)
c0d01db6:	c860      	ldmia	r0!, {r5, r6}
c0d01db8:	3808      	subs	r0, #8
c0d01dba:	428d      	cmp	r5, r1
c0d01dbc:	d101      	bne.n	c0d01dc2 <io_seproxyhal_button_push+0x16>
c0d01dbe:	1c76      	adds	r6, r6, #1
c0d01dc0:	6046      	str	r6, [r0, #4]
c0d01dc2:	430d      	orrs	r5, r1
c0d01dc4:	2900      	cmp	r1, #0
c0d01dc6:	d002      	beq.n	c0d01dce <io_seproxyhal_button_push+0x22>
c0d01dc8:	6005      	str	r5, [r0, #0]
c0d01dca:	462a      	mov	r2, r5
c0d01dcc:	e005      	b.n	c0d01dda <io_seproxyhal_button_push+0x2e>
c0d01dce:	2200      	movs	r2, #0
c0d01dd0:	6002      	str	r2, [r0, #0]
c0d01dd2:	6042      	str	r2, [r0, #4]
c0d01dd4:	4b0c      	ldr	r3, [pc, #48]	@ (c0d01e08 <io_seproxyhal_button_push+0x5c>)
c0d01dd6:	1c5b      	adds	r3, r3, #1
c0d01dd8:	431d      	orrs	r5, r3
c0d01dda:	428a      	cmp	r2, r1
c0d01ddc:	d001      	beq.n	c0d01de2 <io_seproxyhal_button_push+0x36>
c0d01dde:	2100      	movs	r1, #0
c0d01de0:	6041      	str	r1, [r0, #4]
c0d01de2:	2e08      	cmp	r6, #8
c0d01de4:	d30a      	bcc.n	c0d01dfc <io_seproxyhal_button_push+0x50>
c0d01de6:	2103      	movs	r1, #3
c0d01de8:	4630      	mov	r0, r6
c0d01dea:	f000 fbff 	bl	c0d025ec <__aeabi_uidivmod>
c0d01dee:	2001      	movs	r0, #1
c0d01df0:	2900      	cmp	r1, #0
c0d01df2:	d101      	bne.n	c0d01df8 <io_seproxyhal_button_push+0x4c>
c0d01df4:	0781      	lsls	r1, r0, #30
c0d01df6:	430d      	orrs	r5, r1
c0d01df8:	07c0      	lsls	r0, r0, #31
c0d01dfa:	4385      	bics	r5, r0
c0d01dfc:	4628      	mov	r0, r5
c0d01dfe:	4631      	mov	r1, r6
c0d01e00:	47a0      	blx	r4
c0d01e02:	bd70      	pop	{r4, r5, r6, pc}
c0d01e04:	20000604 	.word	0x20000604
c0d01e08:	7fffffff 	.word	0x7fffffff

c0d01e0c <os_io_seproxyhal_get_app_name_and_version>:
c0d01e0c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d01e0e:	4e0f      	ldr	r6, [pc, #60]	@ (c0d01e4c <os_io_seproxyhal_get_app_name_and_version+0x40>)
c0d01e10:	2401      	movs	r4, #1
c0d01e12:	7034      	strb	r4, [r6, #0]
c0d01e14:	1cb1      	adds	r1, r6, #2
c0d01e16:	27ff      	movs	r7, #255	@ 0xff
c0d01e18:	3702      	adds	r7, #2
c0d01e1a:	1c7a      	adds	r2, r7, #1
c0d01e1c:	4620      	mov	r0, r4
c0d01e1e:	f000 fb03 	bl	c0d02428 <os_registry_get_current_app_tag>
c0d01e22:	4605      	mov	r5, r0
c0d01e24:	7070      	strb	r0, [r6, #1]
c0d01e26:	1a3a      	subs	r2, r7, r0
c0d01e28:	1987      	adds	r7, r0, r6
c0d01e2a:	1cf9      	adds	r1, r7, #3
c0d01e2c:	2002      	movs	r0, #2
c0d01e2e:	f000 fafb 	bl	c0d02428 <os_registry_get_current_app_tag>
c0d01e32:	70b8      	strb	r0, [r7, #2]
c0d01e34:	182d      	adds	r5, r5, r0
c0d01e36:	19ae      	adds	r6, r5, r6
c0d01e38:	70f4      	strb	r4, [r6, #3]
c0d01e3a:	f000 faeb 	bl	c0d02414 <os_flags>
c0d01e3e:	2100      	movs	r1, #0
c0d01e40:	71b1      	strb	r1, [r6, #6]
c0d01e42:	2190      	movs	r1, #144	@ 0x90
c0d01e44:	7171      	strb	r1, [r6, #5]
c0d01e46:	7130      	strb	r0, [r6, #4]
c0d01e48:	1de8      	adds	r0, r5, #7
c0d01e4a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01e4c:	200004e8 	.word	0x200004e8

c0d01e50 <io_exchange>:
c0d01e50:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01e52:	b085      	sub	sp, #20
c0d01e54:	460e      	mov	r6, r1
c0d01e56:	4601      	mov	r1, r0
c0d01e58:	4c7a      	ldr	r4, [pc, #488]	@ (c0d02044 <io_exchange+0x1f4>)
c0d01e5a:	487c      	ldr	r0, [pc, #496]	@ (c0d0204c <io_exchange+0x1fc>)
c0d01e5c:	4478      	add	r0, pc
c0d01e5e:	9000      	str	r0, [sp, #0]
c0d01e60:	4f77      	ldr	r7, [pc, #476]	@ (c0d02040 <io_exchange+0x1f0>)
c0d01e62:	b2cd      	uxtb	r5, r1
c0d01e64:	0788      	lsls	r0, r1, #30
c0d01e66:	d000      	beq.n	c0d01e6a <io_exchange+0x1a>
c0d01e68:	e0d3      	b.n	c0d02012 <io_exchange+0x1c2>
c0d01e6a:	2210      	movs	r2, #16
c0d01e6c:	402a      	ands	r2, r5
c0d01e6e:	0430      	lsls	r0, r6, #16
c0d01e70:	d06a      	beq.n	c0d01f48 <io_exchange+0xf8>
c0d01e72:	2a00      	cmp	r2, #0
c0d01e74:	d168      	bne.n	c0d01f48 <io_exchange+0xf8>
c0d01e76:	9202      	str	r2, [sp, #8]
c0d01e78:	9103      	str	r1, [sp, #12]
c0d01e7a:	f000 faf7 	bl	c0d0246c <io_seph_is_status_sent>
c0d01e7e:	2800      	cmp	r0, #0
c0d01e80:	d008      	beq.n	c0d01e94 <io_exchange+0x44>
c0d01e82:	2180      	movs	r1, #128	@ 0x80
c0d01e84:	2200      	movs	r2, #0
c0d01e86:	4638      	mov	r0, r7
c0d01e88:	f000 fafa 	bl	c0d02480 <io_seph_recv>
c0d01e8c:	2001      	movs	r0, #1
c0d01e8e:	f000 f8e1 	bl	c0d02054 <os_io_seph_recv_and_process>
c0d01e92:	e7f2      	b.n	c0d01e7a <io_exchange+0x2a>
c0d01e94:	68a1      	ldr	r1, [r4, #8]
c0d01e96:	7820      	ldrb	r0, [r4, #0]
c0d01e98:	2807      	cmp	r0, #7
c0d01e9a:	9104      	str	r1, [sp, #16]
c0d01e9c:	d00d      	beq.n	c0d01eba <io_exchange+0x6a>
c0d01e9e:	280a      	cmp	r0, #10
c0d01ea0:	d00e      	beq.n	c0d01ec0 <io_exchange+0x70>
c0d01ea2:	280b      	cmp	r0, #11
c0d01ea4:	d023      	beq.n	c0d01eee <io_exchange+0x9e>
c0d01ea6:	2800      	cmp	r0, #0
c0d01ea8:	d100      	bne.n	c0d01eac <io_exchange+0x5c>
c0d01eaa:	e0c2      	b.n	c0d02032 <io_exchange+0x1e2>
c0d01eac:	b2b1      	uxth	r1, r6
c0d01eae:	4628      	mov	r0, r5
c0d01eb0:	f7fe fe4e 	bl	c0d00b50 <io_exchange_al>
c0d01eb4:	2800      	cmp	r0, #0
c0d01eb6:	d020      	beq.n	c0d01efa <io_exchange+0xaa>
c0d01eb8:	e0bb      	b.n	c0d02032 <io_exchange+0x1e2>
c0d01eba:	b2b1      	uxth	r1, r6
c0d01ebc:	9800      	ldr	r0, [sp, #0]
c0d01ebe:	e019      	b.n	c0d01ef4 <io_exchange+0xa4>
c0d01ec0:	20ff      	movs	r0, #255	@ 0xff
c0d01ec2:	3006      	adds	r0, #6
c0d01ec4:	b2b1      	uxth	r1, r6
c0d01ec6:	9101      	str	r1, [sp, #4]
c0d01ec8:	4281      	cmp	r1, r0
c0d01eca:	d300      	bcc.n	c0d01ece <io_exchange+0x7e>
c0d01ecc:	e0b4      	b.n	c0d02038 <io_exchange+0x1e8>
c0d01ece:	70be      	strb	r6, [r7, #2]
c0d01ed0:	2053      	movs	r0, #83	@ 0x53
c0d01ed2:	7038      	strb	r0, [r7, #0]
c0d01ed4:	0a30      	lsrs	r0, r6, #8
c0d01ed6:	7078      	strb	r0, [r7, #1]
c0d01ed8:	2103      	movs	r1, #3
c0d01eda:	4638      	mov	r0, r7
c0d01edc:	f000 fabc 	bl	c0d02458 <io_seph_send>
c0d01ee0:	4859      	ldr	r0, [pc, #356]	@ (c0d02048 <io_exchange+0x1f8>)
c0d01ee2:	9901      	ldr	r1, [sp, #4]
c0d01ee4:	f000 fab8 	bl	c0d02458 <io_seph_send>
c0d01ee8:	2000      	movs	r0, #0
c0d01eea:	7020      	strb	r0, [r4, #0]
c0d01eec:	e005      	b.n	c0d01efa <io_exchange+0xaa>
c0d01eee:	b2b1      	uxth	r1, r6
c0d01ef0:	4857      	ldr	r0, [pc, #348]	@ (c0d02050 <io_exchange+0x200>)
c0d01ef2:	4478      	add	r0, pc
c0d01ef4:	4a54      	ldr	r2, [pc, #336]	@ (c0d02048 <io_exchange+0x1f8>)
c0d01ef6:	f000 fa13 	bl	c0d02320 <io_usb_hid_send>
c0d01efa:	207d      	movs	r0, #125	@ 0x7d
c0d01efc:	0100      	lsls	r0, r0, #4
c0d01efe:	9904      	ldr	r1, [sp, #16]
c0d01f00:	180e      	adds	r6, r1, r0
c0d01f02:	7820      	ldrb	r0, [r4, #0]
c0d01f04:	2800      	cmp	r0, #0
c0d01f06:	d011      	beq.n	c0d01f2c <io_exchange+0xdc>
c0d01f08:	f7ff fdc8 	bl	c0d01a9c <io_seproxyhal_general_status>
c0d01f0c:	2180      	movs	r1, #128	@ 0x80
c0d01f0e:	2200      	movs	r2, #0
c0d01f10:	4638      	mov	r0, r7
c0d01f12:	f000 fab5 	bl	c0d02480 <io_seph_recv>
c0d01f16:	68a0      	ldr	r0, [r4, #8]
c0d01f18:	42b0      	cmp	r0, r6
c0d01f1a:	d300      	bcc.n	c0d01f1e <io_exchange+0xce>
c0d01f1c:	e083      	b.n	c0d02026 <io_exchange+0x1d6>
c0d01f1e:	f7ff fe51 	bl	c0d01bc4 <io_seproxyhal_handle_event>
c0d01f22:	f000 faa3 	bl	c0d0246c <io_seph_is_status_sent>
c0d01f26:	2800      	cmp	r0, #0
c0d01f28:	d1f0      	bne.n	c0d01f0c <io_exchange+0xbc>
c0d01f2a:	e7ea      	b.n	c0d01f02 <io_exchange+0xb2>
c0d01f2c:	2000      	movs	r0, #0
c0d01f2e:	71a0      	strb	r0, [r4, #6]
c0d01f30:	7020      	strb	r0, [r4, #0]
c0d01f32:	8060      	strh	r0, [r4, #2]
c0d01f34:	9e03      	ldr	r6, [sp, #12]
c0d01f36:	06b1      	lsls	r1, r6, #26
c0d01f38:	d46f      	bmi.n	c0d0201a <io_exchange+0x1ca>
c0d01f3a:	f7ff fdaf 	bl	c0d01a9c <io_seproxyhal_general_status>
c0d01f3e:	b270      	sxtb	r0, r6
c0d01f40:	2800      	cmp	r0, #0
c0d01f42:	4631      	mov	r1, r6
c0d01f44:	9a02      	ldr	r2, [sp, #8]
c0d01f46:	d471      	bmi.n	c0d0202c <io_exchange+0x1dc>
c0d01f48:	0768      	lsls	r0, r5, #29
c0d01f4a:	d40a      	bmi.n	c0d01f62 <io_exchange+0x112>
c0d01f4c:	2a00      	cmp	r2, #0
c0d01f4e:	d104      	bne.n	c0d01f5a <io_exchange+0x10a>
c0d01f50:	0668      	lsls	r0, r5, #25
c0d01f52:	d465      	bmi.n	c0d02020 <io_exchange+0x1d0>
c0d01f54:	2000      	movs	r0, #0
c0d01f56:	71a0      	strb	r0, [r4, #6]
c0d01f58:	7020      	strb	r0, [r4, #0]
c0d01f5a:	460e      	mov	r6, r1
c0d01f5c:	2500      	movs	r5, #0
c0d01f5e:	8065      	strh	r5, [r4, #2]
c0d01f60:	e001      	b.n	c0d01f66 <io_exchange+0x116>
c0d01f62:	460e      	mov	r6, r1
c0d01f64:	8865      	ldrh	r5, [r4, #2]
c0d01f66:	7820      	ldrb	r0, [r4, #0]
c0d01f68:	2800      	cmp	r0, #0
c0d01f6a:	d001      	beq.n	c0d01f70 <io_exchange+0x120>
c0d01f6c:	2d00      	cmp	r5, #0
c0d01f6e:	d118      	bne.n	c0d01fa2 <io_exchange+0x152>
c0d01f70:	f7ff fd94 	bl	c0d01a9c <io_seproxyhal_general_status>
c0d01f74:	2180      	movs	r1, #128	@ 0x80
c0d01f76:	2500      	movs	r5, #0
c0d01f78:	4638      	mov	r0, r7
c0d01f7a:	462a      	mov	r2, r5
c0d01f7c:	f000 fa80 	bl	c0d02480 <io_seph_recv>
c0d01f80:	2803      	cmp	r0, #3
c0d01f82:	d306      	bcc.n	c0d01f92 <io_exchange+0x142>
c0d01f84:	78b9      	ldrb	r1, [r7, #2]
c0d01f86:	787a      	ldrb	r2, [r7, #1]
c0d01f88:	0212      	lsls	r2, r2, #8
c0d01f8a:	1851      	adds	r1, r2, r1
c0d01f8c:	1cc9      	adds	r1, r1, #3
c0d01f8e:	4281      	cmp	r1, r0
c0d01f90:	d003      	beq.n	c0d01f9a <io_exchange+0x14a>
c0d01f92:	8065      	strh	r5, [r4, #2]
c0d01f94:	7025      	strb	r5, [r4, #0]
c0d01f96:	4628      	mov	r0, r5
c0d01f98:	e7e6      	b.n	c0d01f68 <io_exchange+0x118>
c0d01f9a:	f7ff fe13 	bl	c0d01bc4 <io_seproxyhal_handle_event>
c0d01f9e:	8865      	ldrh	r5, [r4, #2]
c0d01fa0:	e7e1      	b.n	c0d01f66 <io_exchange+0x116>
c0d01fa2:	f000 f9fd 	bl	c0d023a0 <os_perso_isonboarded>
c0d01fa6:	28aa      	cmp	r0, #170	@ 0xaa
c0d01fa8:	d103      	bne.n	c0d01fb2 <io_exchange+0x162>
c0d01faa:	f000 fa1b 	bl	c0d023e4 <os_global_pin_is_validated>
c0d01fae:	28aa      	cmp	r0, #170	@ 0xaa
c0d01fb0:	d123      	bne.n	c0d01ffa <io_exchange+0x1aa>
c0d01fb2:	4a25      	ldr	r2, [pc, #148]	@ (c0d02048 <io_exchange+0x1f8>)
c0d01fb4:	7810      	ldrb	r0, [r2, #0]
c0d01fb6:	28b0      	cmp	r0, #176	@ 0xb0
c0d01fb8:	d129      	bne.n	c0d0200e <io_exchange+0x1be>
c0d01fba:	7850      	ldrb	r0, [r2, #1]
c0d01fbc:	28a7      	cmp	r0, #167	@ 0xa7
c0d01fbe:	d00c      	beq.n	c0d01fda <io_exchange+0x18a>
c0d01fc0:	2801      	cmp	r0, #1
c0d01fc2:	d124      	bne.n	c0d0200e <io_exchange+0x1be>
c0d01fc4:	78d0      	ldrb	r0, [r2, #3]
c0d01fc6:	7891      	ldrb	r1, [r2, #2]
c0d01fc8:	4301      	orrs	r1, r0
c0d01fca:	d120      	bne.n	c0d0200e <io_exchange+0x1be>
c0d01fcc:	2003      	movs	r0, #3
c0d01fce:	4006      	ands	r6, r0
c0d01fd0:	f7ff ff1c 	bl	c0d01e0c <os_io_seproxyhal_get_app_name_and_version>
c0d01fd4:	4631      	mov	r1, r6
c0d01fd6:	4606      	mov	r6, r0
c0d01fd8:	e743      	b.n	c0d01e62 <io_exchange+0x12>
c0d01fda:	78d0      	ldrb	r0, [r2, #3]
c0d01fdc:	7891      	ldrb	r1, [r2, #2]
c0d01fde:	4301      	orrs	r1, r0
c0d01fe0:	d115      	bne.n	c0d0200e <io_exchange+0x1be>
c0d01fe2:	2000      	movs	r0, #0
c0d01fe4:	7050      	strb	r0, [r2, #1]
c0d01fe6:	2090      	movs	r0, #144	@ 0x90
c0d01fe8:	7010      	strb	r0, [r2, #0]
c0d01fea:	2003      	movs	r0, #3
c0d01fec:	4631      	mov	r1, r6
c0d01fee:	4001      	ands	r1, r0
c0d01ff0:	207f      	movs	r0, #127	@ 0x7f
c0d01ff2:	43c0      	mvns	r0, r0
c0d01ff4:	1809      	adds	r1, r1, r0
c0d01ff6:	2602      	movs	r6, #2
c0d01ff8:	e733      	b.n	c0d01e62 <io_exchange+0x12>
c0d01ffa:	2015      	movs	r0, #21
c0d01ffc:	4912      	ldr	r1, [pc, #72]	@ (c0d02048 <io_exchange+0x1f8>)
c0d01ffe:	7048      	strb	r0, [r1, #1]
c0d02000:	2055      	movs	r0, #85	@ 0x55
c0d02002:	7008      	strb	r0, [r1, #0]
c0d02004:	2003      	movs	r0, #3
c0d02006:	4631      	mov	r1, r6
c0d02008:	4001      	ands	r1, r0
c0d0200a:	2602      	movs	r6, #2
c0d0200c:	e729      	b.n	c0d01e62 <io_exchange+0x12>
c0d0200e:	8860      	ldrh	r0, [r4, #2]
c0d02010:	e003      	b.n	c0d0201a <io_exchange+0x1ca>
c0d02012:	b2b1      	uxth	r1, r6
c0d02014:	4628      	mov	r0, r5
c0d02016:	f7fe fd9b 	bl	c0d00b50 <io_exchange_al>
c0d0201a:	b280      	uxth	r0, r0
c0d0201c:	b005      	add	sp, #20
c0d0201e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d02020:	8860      	ldrh	r0, [r4, #2]
c0d02022:	1f40      	subs	r0, r0, #5
c0d02024:	e7f9      	b.n	c0d0201a <io_exchange+0x1ca>
c0d02026:	2005      	movs	r0, #5
c0d02028:	f7ff fd31 	bl	c0d01a8e <os_longjmp>
c0d0202c:	2005      	movs	r0, #5
c0d0202e:	f000 fa07 	bl	c0d02440 <os_sched_exit>
c0d02032:	2004      	movs	r0, #4
c0d02034:	f7ff fd2b 	bl	c0d01a8e <os_longjmp>
c0d02038:	2002      	movs	r0, #2
c0d0203a:	f7ff fd28 	bl	c0d01a8e <os_longjmp>
c0d0203e:	46c0      	nop			@ (mov r8, r8)
c0d02040:	2000027c 	.word	0x2000027c
c0d02044:	200005ec 	.word	0x200005ec
c0d02048:	200004e8 	.word	0x200004e8
c0d0204c:	00000295 	.word	0x00000295
c0d02050:	fffffc83 	.word	0xfffffc83

c0d02054 <os_io_seph_recv_and_process>:
c0d02054:	b570      	push	{r4, r5, r6, lr}
c0d02056:	4605      	mov	r5, r0
c0d02058:	f7ff fd20 	bl	c0d01a9c <io_seproxyhal_general_status>
c0d0205c:	4e0b      	ldr	r6, [pc, #44]	@ (c0d0208c <os_io_seph_recv_and_process+0x38>)
c0d0205e:	2180      	movs	r1, #128	@ 0x80
c0d02060:	2400      	movs	r4, #0
c0d02062:	4630      	mov	r0, r6
c0d02064:	4622      	mov	r2, r4
c0d02066:	f000 fa0b 	bl	c0d02480 <io_seph_recv>
c0d0206a:	7830      	ldrb	r0, [r6, #0]
c0d0206c:	2815      	cmp	r0, #21
c0d0206e:	d806      	bhi.n	c0d0207e <os_io_seph_recv_and_process+0x2a>
c0d02070:	2101      	movs	r1, #1
c0d02072:	4081      	lsls	r1, r0
c0d02074:	4806      	ldr	r0, [pc, #24]	@ (c0d02090 <os_io_seph_recv_and_process+0x3c>)
c0d02076:	4201      	tst	r1, r0
c0d02078:	d001      	beq.n	c0d0207e <os_io_seph_recv_and_process+0x2a>
c0d0207a:	2d00      	cmp	r5, #0
c0d0207c:	d104      	bne.n	c0d02088 <os_io_seph_recv_and_process+0x34>
c0d0207e:	f7ff fda1 	bl	c0d01bc4 <io_seproxyhal_handle_event>
c0d02082:	4604      	mov	r4, r0
c0d02084:	1e40      	subs	r0, r0, #1
c0d02086:	4184      	sbcs	r4, r0
c0d02088:	4620      	mov	r0, r4
c0d0208a:	bd70      	pop	{r4, r5, r6, pc}
c0d0208c:	2000027c 	.word	0x2000027c
c0d02090:	00207020 	.word	0x00207020

c0d02094 <io_seproxyhal_get_ep_rx_size>:
c0d02094:	217f      	movs	r1, #127	@ 0x7f
c0d02096:	4001      	ands	r1, r0
c0d02098:	2903      	cmp	r1, #3
c0d0209a:	d803      	bhi.n	c0d020a4 <io_seproxyhal_get_ep_rx_size+0x10>
c0d0209c:	4802      	ldr	r0, [pc, #8]	@ (c0d020a8 <io_seproxyhal_get_ep_rx_size+0x14>)
c0d0209e:	1840      	adds	r0, r0, r1
c0d020a0:	7b00      	ldrb	r0, [r0, #12]
c0d020a2:	4770      	bx	lr
c0d020a4:	2000      	movs	r0, #0
c0d020a6:	4770      	bx	lr
c0d020a8:	200005ec 	.word	0x200005ec

c0d020ac <io_usb_send_ep>:
c0d020ac:	b57c      	push	{r2, r3, r4, r5, r6, lr}
c0d020ae:	2aff      	cmp	r2, #255	@ 0xff
c0d020b0:	d81d      	bhi.n	c0d020ee <io_usb_send_ep+0x42>
c0d020b2:	4615      	mov	r5, r2
c0d020b4:	460e      	mov	r6, r1
c0d020b6:	4604      	mov	r4, r0
c0d020b8:	4668      	mov	r0, sp
c0d020ba:	7142      	strb	r2, [r0, #5]
c0d020bc:	2120      	movs	r1, #32
c0d020be:	7101      	strb	r1, [r0, #4]
c0d020c0:	2150      	movs	r1, #80	@ 0x50
c0d020c2:	7001      	strb	r1, [r0, #0]
c0d020c4:	2180      	movs	r1, #128	@ 0x80
c0d020c6:	4321      	orrs	r1, r4
c0d020c8:	70c1      	strb	r1, [r0, #3]
c0d020ca:	1cd1      	adds	r1, r2, #3
c0d020cc:	7081      	strb	r1, [r0, #2]
c0d020ce:	0a09      	lsrs	r1, r1, #8
c0d020d0:	7041      	strb	r1, [r0, #1]
c0d020d2:	2106      	movs	r1, #6
c0d020d4:	f000 f9c0 	bl	c0d02458 <io_seph_send>
c0d020d8:	4630      	mov	r0, r6
c0d020da:	4629      	mov	r1, r5
c0d020dc:	f000 f9bc 	bl	c0d02458 <io_seph_send>
c0d020e0:	0660      	lsls	r0, r4, #25
c0d020e2:	0e00      	lsrs	r0, r0, #24
c0d020e4:	4902      	ldr	r1, [pc, #8]	@ (c0d020f0 <io_usb_send_ep+0x44>)
c0d020e6:	1808      	adds	r0, r1, r0
c0d020e8:	217d      	movs	r1, #125	@ 0x7d
c0d020ea:	0109      	lsls	r1, r1, #4
c0d020ec:	8201      	strh	r1, [r0, #16]
c0d020ee:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}
c0d020f0:	200005ec 	.word	0x200005ec

c0d020f4 <io_usb_send_apdu_data>:
c0d020f4:	b580      	push	{r7, lr}
c0d020f6:	460a      	mov	r2, r1
c0d020f8:	4601      	mov	r1, r0
c0d020fa:	2082      	movs	r0, #130	@ 0x82
c0d020fc:	f7ff ffd6 	bl	c0d020ac <io_usb_send_ep>
c0d02100:	bd80      	pop	{r7, pc}
	...

c0d02104 <io_usb_hid_receive>:
c0d02104:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d02106:	9202      	str	r2, [sp, #8]
c0d02108:	460f      	mov	r7, r1
c0d0210a:	4604      	mov	r4, r0
c0d0210c:	2b00      	cmp	r3, #0
c0d0210e:	d003      	beq.n	c0d02118 <io_usb_hid_receive+0x14>
c0d02110:	8898      	ldrh	r0, [r3, #4]
c0d02112:	9001      	str	r0, [sp, #4]
c0d02114:	6818      	ldr	r0, [r3, #0]
c0d02116:	e003      	b.n	c0d02120 <io_usb_hid_receive+0x1c>
c0d02118:	2041      	movs	r0, #65	@ 0x41
c0d0211a:	0080      	lsls	r0, r0, #2
c0d0211c:	9001      	str	r0, [sp, #4]
c0d0211e:	4844      	ldr	r0, [pc, #272]	@ (c0d02230 <io_usb_hid_receive+0x12c>)
c0d02120:	9000      	str	r0, [sp, #0]
c0d02122:	4e44      	ldr	r6, [pc, #272]	@ (c0d02234 <io_usb_hid_receive+0x130>)
c0d02124:	42b7      	cmp	r7, r6
c0d02126:	d00e      	beq.n	c0d02146 <io_usb_hid_receive+0x42>
c0d02128:	4d42      	ldr	r5, [pc, #264]	@ (c0d02234 <io_usb_hid_receive+0x130>)
c0d0212a:	2640      	movs	r6, #64	@ 0x40
c0d0212c:	4628      	mov	r0, r5
c0d0212e:	4631      	mov	r1, r6
c0d02130:	f000 fb4c 	bl	c0d027cc <__aeabi_memclr>
c0d02134:	9a02      	ldr	r2, [sp, #8]
c0d02136:	2a40      	cmp	r2, #64	@ 0x40
c0d02138:	d300      	bcc.n	c0d0213c <io_usb_hid_receive+0x38>
c0d0213a:	4632      	mov	r2, r6
c0d0213c:	4628      	mov	r0, r5
c0d0213e:	4639      	mov	r1, r7
c0d02140:	f000 fb4e 	bl	c0d027e0 <__aeabi_memmove>
c0d02144:	4e3b      	ldr	r6, [pc, #236]	@ (c0d02234 <io_usb_hid_receive+0x130>)
c0d02146:	78b0      	ldrb	r0, [r6, #2]
c0d02148:	2800      	cmp	r0, #0
c0d0214a:	d022      	beq.n	c0d02192 <io_usb_hid_receive+0x8e>
c0d0214c:	2801      	cmp	r0, #1
c0d0214e:	d026      	beq.n	c0d0219e <io_usb_hid_receive+0x9a>
c0d02150:	2802      	cmp	r0, #2
c0d02152:	d028      	beq.n	c0d021a6 <io_usb_hid_receive+0xa2>
c0d02154:	2805      	cmp	r0, #5
c0d02156:	d163      	bne.n	c0d02220 <io_usb_hid_receive+0x11c>
c0d02158:	7930      	ldrb	r0, [r6, #4]
c0d0215a:	78f1      	ldrb	r1, [r6, #3]
c0d0215c:	0209      	lsls	r1, r1, #8
c0d0215e:	1809      	adds	r1, r1, r0
c0d02160:	4c35      	ldr	r4, [pc, #212]	@ (c0d02238 <io_usb_hid_receive+0x134>)
c0d02162:	6822      	ldr	r2, [r4, #0]
c0d02164:	2000      	movs	r0, #0
c0d02166:	428a      	cmp	r2, r1
c0d02168:	d121      	bne.n	c0d021ae <io_usb_hid_receive+0xaa>
c0d0216a:	6821      	ldr	r1, [r4, #0]
c0d0216c:	2900      	cmp	r1, #0
c0d0216e:	d026      	beq.n	c0d021be <io_usb_hid_receive+0xba>
c0d02170:	9802      	ldr	r0, [sp, #8]
c0d02172:	1f40      	subs	r0, r0, #5
c0d02174:	b282      	uxth	r2, r0
c0d02176:	4931      	ldr	r1, [pc, #196]	@ (c0d0223c <io_usb_hid_receive+0x138>)
c0d02178:	680b      	ldr	r3, [r1, #0]
c0d0217a:	4293      	cmp	r3, r2
c0d0217c:	d200      	bcs.n	c0d02180 <io_usb_hid_receive+0x7c>
c0d0217e:	6808      	ldr	r0, [r1, #0]
c0d02180:	b281      	uxth	r1, r0
c0d02182:	293b      	cmp	r1, #59	@ 0x3b
c0d02184:	d300      	bcc.n	c0d02188 <io_usb_hid_receive+0x84>
c0d02186:	203b      	movs	r0, #59	@ 0x3b
c0d02188:	b285      	uxth	r5, r0
c0d0218a:	482d      	ldr	r0, [pc, #180]	@ (c0d02240 <io_usb_hid_receive+0x13c>)
c0d0218c:	6800      	ldr	r0, [r0, #0]
c0d0218e:	1d71      	adds	r1, r6, #5
c0d02190:	e038      	b.n	c0d02204 <io_usb_hid_receive+0x100>
c0d02192:	2000      	movs	r0, #0
c0d02194:	71b0      	strb	r0, [r6, #6]
c0d02196:	7170      	strb	r0, [r6, #5]
c0d02198:	7130      	strb	r0, [r6, #4]
c0d0219a:	70f0      	strb	r0, [r6, #3]
c0d0219c:	e003      	b.n	c0d021a6 <io_usb_hid_receive+0xa2>
c0d0219e:	1cf0      	adds	r0, r6, #3
c0d021a0:	2104      	movs	r1, #4
c0d021a2:	f7ff fc59 	bl	c0d01a58 <cx_rng_no_throw>
c0d021a6:	4823      	ldr	r0, [pc, #140]	@ (c0d02234 <io_usb_hid_receive+0x130>)
c0d021a8:	2140      	movs	r1, #64	@ 0x40
c0d021aa:	47a0      	blx	r4
c0d021ac:	2000      	movs	r0, #0
c0d021ae:	4922      	ldr	r1, [pc, #136]	@ (c0d02238 <io_usb_hid_receive+0x134>)
c0d021b0:	2200      	movs	r2, #0
c0d021b2:	600a      	str	r2, [r1, #0]
c0d021b4:	4922      	ldr	r1, [pc, #136]	@ (c0d02240 <io_usb_hid_receive+0x13c>)
c0d021b6:	600a      	str	r2, [r1, #0]
c0d021b8:	4920      	ldr	r1, [pc, #128]	@ (c0d0223c <io_usb_hid_receive+0x138>)
c0d021ba:	600a      	str	r2, [r1, #0]
c0d021bc:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d021be:	79b1      	ldrb	r1, [r6, #6]
c0d021c0:	7972      	ldrb	r2, [r6, #5]
c0d021c2:	0212      	lsls	r2, r2, #8
c0d021c4:	1852      	adds	r2, r2, r1
c0d021c6:	491f      	ldr	r1, [pc, #124]	@ (c0d02244 <io_usb_hid_receive+0x140>)
c0d021c8:	600a      	str	r2, [r1, #0]
c0d021ca:	680a      	ldr	r2, [r1, #0]
c0d021cc:	9b01      	ldr	r3, [sp, #4]
c0d021ce:	429a      	cmp	r2, r3
c0d021d0:	d8ed      	bhi.n	c0d021ae <io_usb_hid_receive+0xaa>
c0d021d2:	6809      	ldr	r1, [r1, #0]
c0d021d4:	4f19      	ldr	r7, [pc, #100]	@ (c0d0223c <io_usb_hid_receive+0x138>)
c0d021d6:	6039      	str	r1, [r7, #0]
c0d021d8:	7871      	ldrb	r1, [r6, #1]
c0d021da:	7832      	ldrb	r2, [r6, #0]
c0d021dc:	0212      	lsls	r2, r2, #8
c0d021de:	1851      	adds	r1, r2, r1
c0d021e0:	4a19      	ldr	r2, [pc, #100]	@ (c0d02248 <io_usb_hid_receive+0x144>)
c0d021e2:	6011      	str	r1, [r2, #0]
c0d021e4:	4916      	ldr	r1, [pc, #88]	@ (c0d02240 <io_usb_hid_receive+0x13c>)
c0d021e6:	9800      	ldr	r0, [sp, #0]
c0d021e8:	6008      	str	r0, [r1, #0]
c0d021ea:	683a      	ldr	r2, [r7, #0]
c0d021ec:	9902      	ldr	r1, [sp, #8]
c0d021ee:	1fc9      	subs	r1, r1, #7
c0d021f0:	b28b      	uxth	r3, r1
c0d021f2:	429a      	cmp	r2, r3
c0d021f4:	d200      	bcs.n	c0d021f8 <io_usb_hid_receive+0xf4>
c0d021f6:	6839      	ldr	r1, [r7, #0]
c0d021f8:	b28a      	uxth	r2, r1
c0d021fa:	2a39      	cmp	r2, #57	@ 0x39
c0d021fc:	d300      	bcc.n	c0d02200 <io_usb_hid_receive+0xfc>
c0d021fe:	2139      	movs	r1, #57	@ 0x39
c0d02200:	b28d      	uxth	r5, r1
c0d02202:	1df1      	adds	r1, r6, #7
c0d02204:	462a      	mov	r2, r5
c0d02206:	f000 faeb 	bl	c0d027e0 <__aeabi_memmove>
c0d0220a:	480c      	ldr	r0, [pc, #48]	@ (c0d0223c <io_usb_hid_receive+0x138>)
c0d0220c:	6801      	ldr	r1, [r0, #0]
c0d0220e:	1b49      	subs	r1, r1, r5
c0d02210:	6001      	str	r1, [r0, #0]
c0d02212:	480b      	ldr	r0, [pc, #44]	@ (c0d02240 <io_usb_hid_receive+0x13c>)
c0d02214:	6801      	ldr	r1, [r0, #0]
c0d02216:	1949      	adds	r1, r1, r5
c0d02218:	6001      	str	r1, [r0, #0]
c0d0221a:	6820      	ldr	r0, [r4, #0]
c0d0221c:	1c40      	adds	r0, r0, #1
c0d0221e:	6020      	str	r0, [r4, #0]
c0d02220:	4806      	ldr	r0, [pc, #24]	@ (c0d0223c <io_usb_hid_receive+0x138>)
c0d02222:	6800      	ldr	r0, [r0, #0]
c0d02224:	2800      	cmp	r0, #0
c0d02226:	d001      	beq.n	c0d0222c <io_usb_hid_receive+0x128>
c0d02228:	2001      	movs	r0, #1
c0d0222a:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d0222c:	2002      	movs	r0, #2
c0d0222e:	e7be      	b.n	c0d021ae <io_usb_hid_receive+0xaa>
c0d02230:	200004e8 	.word	0x200004e8
c0d02234:	2000060c 	.word	0x2000060c
c0d02238:	2000064c 	.word	0x2000064c
c0d0223c:	20000654 	.word	0x20000654
c0d02240:	20000658 	.word	0x20000658
c0d02244:	20000650 	.word	0x20000650
c0d02248:	2000065c 	.word	0x2000065c

c0d0224c <io_usb_hid_init>:
c0d0224c:	4803      	ldr	r0, [pc, #12]	@ (c0d0225c <io_usb_hid_init+0x10>)
c0d0224e:	2100      	movs	r1, #0
c0d02250:	6001      	str	r1, [r0, #0]
c0d02252:	4803      	ldr	r0, [pc, #12]	@ (c0d02260 <io_usb_hid_init+0x14>)
c0d02254:	6001      	str	r1, [r0, #0]
c0d02256:	4803      	ldr	r0, [pc, #12]	@ (c0d02264 <io_usb_hid_init+0x18>)
c0d02258:	6001      	str	r1, [r0, #0]
c0d0225a:	4770      	bx	lr
c0d0225c:	2000064c 	.word	0x2000064c
c0d02260:	20000658 	.word	0x20000658
c0d02264:	20000654 	.word	0x20000654

c0d02268 <io_usb_hid_sent>:
c0d02268:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0226a:	4a27      	ldr	r2, [pc, #156]	@ (c0d02308 <io_usb_hid_sent+0xa0>)
c0d0226c:	6815      	ldr	r5, [r2, #0]
c0d0226e:	4b27      	ldr	r3, [pc, #156]	@ (c0d0230c <io_usb_hid_sent+0xa4>)
c0d02270:	6819      	ldr	r1, [r3, #0]
c0d02272:	2900      	cmp	r1, #0
c0d02274:	d021      	beq.n	c0d022ba <io_usb_hid_sent+0x52>
c0d02276:	2d00      	cmp	r5, #0
c0d02278:	d01f      	beq.n	c0d022ba <io_usb_hid_sent+0x52>
c0d0227a:	9000      	str	r0, [sp, #0]
c0d0227c:	4c26      	ldr	r4, [pc, #152]	@ (c0d02318 <io_usb_hid_sent+0xb0>)
c0d0227e:	1d67      	adds	r7, r4, #5
c0d02280:	263b      	movs	r6, #59	@ 0x3b
c0d02282:	4638      	mov	r0, r7
c0d02284:	4631      	mov	r1, r6
c0d02286:	f000 faa1 	bl	c0d027cc <__aeabi_memclr>
c0d0228a:	4a20      	ldr	r2, [pc, #128]	@ (c0d0230c <io_usb_hid_sent+0xa4>)
c0d0228c:	2005      	movs	r0, #5
c0d0228e:	70a0      	strb	r0, [r4, #2]
c0d02290:	4822      	ldr	r0, [pc, #136]	@ (c0d0231c <io_usb_hid_sent+0xb4>)
c0d02292:	6801      	ldr	r1, [r0, #0]
c0d02294:	0a09      	lsrs	r1, r1, #8
c0d02296:	7021      	strb	r1, [r4, #0]
c0d02298:	6800      	ldr	r0, [r0, #0]
c0d0229a:	7060      	strb	r0, [r4, #1]
c0d0229c:	491c      	ldr	r1, [pc, #112]	@ (c0d02310 <io_usb_hid_sent+0xa8>)
c0d0229e:	6808      	ldr	r0, [r1, #0]
c0d022a0:	0a00      	lsrs	r0, r0, #8
c0d022a2:	70e0      	strb	r0, [r4, #3]
c0d022a4:	6808      	ldr	r0, [r1, #0]
c0d022a6:	7120      	strb	r0, [r4, #4]
c0d022a8:	6809      	ldr	r1, [r1, #0]
c0d022aa:	6810      	ldr	r0, [r2, #0]
c0d022ac:	2900      	cmp	r1, #0
c0d022ae:	d00c      	beq.n	c0d022ca <io_usb_hid_sent+0x62>
c0d022b0:	283b      	cmp	r0, #59	@ 0x3b
c0d022b2:	d800      	bhi.n	c0d022b6 <io_usb_hid_sent+0x4e>
c0d022b4:	6816      	ldr	r6, [r2, #0]
c0d022b6:	4638      	mov	r0, r7
c0d022b8:	e012      	b.n	c0d022e0 <io_usb_hid_sent+0x78>
c0d022ba:	4815      	ldr	r0, [pc, #84]	@ (c0d02310 <io_usb_hid_sent+0xa8>)
c0d022bc:	2100      	movs	r1, #0
c0d022be:	6001      	str	r1, [r0, #0]
c0d022c0:	6011      	str	r1, [r2, #0]
c0d022c2:	4814      	ldr	r0, [pc, #80]	@ (c0d02314 <io_usb_hid_sent+0xac>)
c0d022c4:	7001      	strb	r1, [r0, #0]
c0d022c6:	6019      	str	r1, [r3, #0]
c0d022c8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d022ca:	2839      	cmp	r0, #57	@ 0x39
c0d022cc:	d901      	bls.n	c0d022d2 <io_usb_hid_sent+0x6a>
c0d022ce:	2639      	movs	r6, #57	@ 0x39
c0d022d0:	e000      	b.n	c0d022d4 <io_usb_hid_sent+0x6c>
c0d022d2:	6816      	ldr	r6, [r2, #0]
c0d022d4:	6810      	ldr	r0, [r2, #0]
c0d022d6:	0a00      	lsrs	r0, r0, #8
c0d022d8:	7160      	strb	r0, [r4, #5]
c0d022da:	6810      	ldr	r0, [r2, #0]
c0d022dc:	71a0      	strb	r0, [r4, #6]
c0d022de:	1de0      	adds	r0, r4, #7
c0d022e0:	4629      	mov	r1, r5
c0d022e2:	4632      	mov	r2, r6
c0d022e4:	f000 fa7c 	bl	c0d027e0 <__aeabi_memmove>
c0d022e8:	4b08      	ldr	r3, [pc, #32]	@ (c0d0230c <io_usb_hid_sent+0xa4>)
c0d022ea:	9a00      	ldr	r2, [sp, #0]
c0d022ec:	4906      	ldr	r1, [pc, #24]	@ (c0d02308 <io_usb_hid_sent+0xa0>)
c0d022ee:	6818      	ldr	r0, [r3, #0]
c0d022f0:	1b80      	subs	r0, r0, r6
c0d022f2:	6018      	str	r0, [r3, #0]
c0d022f4:	19a8      	adds	r0, r5, r6
c0d022f6:	6008      	str	r0, [r1, #0]
c0d022f8:	4905      	ldr	r1, [pc, #20]	@ (c0d02310 <io_usb_hid_sent+0xa8>)
c0d022fa:	6808      	ldr	r0, [r1, #0]
c0d022fc:	1c40      	adds	r0, r0, #1
c0d022fe:	6008      	str	r0, [r1, #0]
c0d02300:	4805      	ldr	r0, [pc, #20]	@ (c0d02318 <io_usb_hid_sent+0xb0>)
c0d02302:	2140      	movs	r1, #64	@ 0x40
c0d02304:	4790      	blx	r2
c0d02306:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d02308:	20000658 	.word	0x20000658
c0d0230c:	20000654 	.word	0x20000654
c0d02310:	2000064c 	.word	0x2000064c
c0d02314:	200005ec 	.word	0x200005ec
c0d02318:	2000060c 	.word	0x2000060c
c0d0231c:	2000065c 	.word	0x2000065c

c0d02320 <io_usb_hid_send>:
c0d02320:	b510      	push	{r4, lr}
c0d02322:	2900      	cmp	r1, #0
c0d02324:	d00a      	beq.n	c0d0233c <io_usb_hid_send+0x1c>
c0d02326:	4b06      	ldr	r3, [pc, #24]	@ (c0d02340 <io_usb_hid_send+0x20>)
c0d02328:	2400      	movs	r4, #0
c0d0232a:	601c      	str	r4, [r3, #0]
c0d0232c:	4b05      	ldr	r3, [pc, #20]	@ (c0d02344 <io_usb_hid_send+0x24>)
c0d0232e:	6019      	str	r1, [r3, #0]
c0d02330:	4b05      	ldr	r3, [pc, #20]	@ (c0d02348 <io_usb_hid_send+0x28>)
c0d02332:	601a      	str	r2, [r3, #0]
c0d02334:	4a05      	ldr	r2, [pc, #20]	@ (c0d0234c <io_usb_hid_send+0x2c>)
c0d02336:	6011      	str	r1, [r2, #0]
c0d02338:	f7ff ff96 	bl	c0d02268 <io_usb_hid_sent>
c0d0233c:	bd10      	pop	{r4, pc}
c0d0233e:	46c0      	nop			@ (mov r8, r8)
c0d02340:	2000064c 	.word	0x2000064c
c0d02344:	20000654 	.word	0x20000654
c0d02348:	20000658 	.word	0x20000658
c0d0234c:	20000650 	.word	0x20000650

c0d02350 <pic_internal>:
c0d02350:	467a      	mov	r2, pc
c0d02352:	4902      	ldr	r1, [pc, #8]	@ (c0d0235c <pic_internal+0xc>)
c0d02354:	1cc9      	adds	r1, r1, #3
c0d02356:	1a89      	subs	r1, r1, r2
c0d02358:	1a40      	subs	r0, r0, r1
c0d0235a:	4770      	bx	lr
c0d0235c:	c0d02351 	.word	0xc0d02351

c0d02360 <pic>:
c0d02360:	b580      	push	{r7, lr}
c0d02362:	4904      	ldr	r1, [pc, #16]	@ (c0d02374 <pic+0x14>)
c0d02364:	4288      	cmp	r0, r1
c0d02366:	d304      	bcc.n	c0d02372 <pic+0x12>
c0d02368:	4903      	ldr	r1, [pc, #12]	@ (c0d02378 <pic+0x18>)
c0d0236a:	4288      	cmp	r0, r1
c0d0236c:	d201      	bcs.n	c0d02372 <pic+0x12>
c0d0236e:	f7ff ffef 	bl	c0d02350 <pic_internal>
c0d02372:	bd80      	pop	{r7, pc}
c0d02374:	c0d00000 	.word	0xc0d00000
c0d02378:	c0d02e11 	.word	0xc0d02e11

c0d0237c <SVC_Call>:
c0d0237c:	df01      	svc	1
c0d0237e:	2900      	cmp	r1, #0
c0d02380:	d100      	bne.n	c0d02384 <exception>
c0d02382:	4770      	bx	lr

c0d02384 <exception>:
c0d02384:	4608      	mov	r0, r1
c0d02386:	f7ff fb82 	bl	c0d01a8e <os_longjmp>
	...

c0d0238c <halt>:
c0d0238c:	b5e0      	push	{r5, r6, r7, lr}
c0d0238e:	2000      	movs	r0, #0
c0d02390:	9001      	str	r0, [sp, #4]
c0d02392:	4802      	ldr	r0, [pc, #8]	@ (c0d0239c <halt+0x10>)
c0d02394:	4669      	mov	r1, sp
c0d02396:	f7ff fff1 	bl	c0d0237c <SVC_Call>
c0d0239a:	bd8c      	pop	{r2, r3, r7, pc}
c0d0239c:	6000023c 	.word	0x6000023c

c0d023a0 <os_perso_isonboarded>:
c0d023a0:	b5e0      	push	{r5, r6, r7, lr}
c0d023a2:	2000      	movs	r0, #0
c0d023a4:	9001      	str	r0, [sp, #4]
c0d023a6:	4803      	ldr	r0, [pc, #12]	@ (c0d023b4 <os_perso_isonboarded+0x14>)
c0d023a8:	4669      	mov	r1, sp
c0d023aa:	f7ff ffe7 	bl	c0d0237c <SVC_Call>
c0d023ae:	b2c0      	uxtb	r0, r0
c0d023b0:	bd8c      	pop	{r2, r3, r7, pc}
c0d023b2:	46c0      	nop			@ (mov r8, r8)
c0d023b4:	60009f4f 	.word	0x60009f4f

c0d023b8 <os_perso_derive_node_with_seed_key>:
c0d023b8:	b510      	push	{r4, lr}
c0d023ba:	b08a      	sub	sp, #40	@ 0x28
c0d023bc:	9c0f      	ldr	r4, [sp, #60]	@ 0x3c
c0d023be:	9407      	str	r4, [sp, #28]
c0d023c0:	9c0e      	ldr	r4, [sp, #56]	@ 0x38
c0d023c2:	9406      	str	r4, [sp, #24]
c0d023c4:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0d023c6:	9405      	str	r4, [sp, #20]
c0d023c8:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0d023ca:	9404      	str	r4, [sp, #16]
c0d023cc:	9303      	str	r3, [sp, #12]
c0d023ce:	9202      	str	r2, [sp, #8]
c0d023d0:	9101      	str	r1, [sp, #4]
c0d023d2:	9000      	str	r0, [sp, #0]
c0d023d4:	4802      	ldr	r0, [pc, #8]	@ (c0d023e0 <os_perso_derive_node_with_seed_key+0x28>)
c0d023d6:	4669      	mov	r1, sp
c0d023d8:	f7ff ffd0 	bl	c0d0237c <SVC_Call>
c0d023dc:	b00a      	add	sp, #40	@ 0x28
c0d023de:	bd10      	pop	{r4, pc}
c0d023e0:	6000a6d8 	.word	0x6000a6d8

c0d023e4 <os_global_pin_is_validated>:
c0d023e4:	b5e0      	push	{r5, r6, r7, lr}
c0d023e6:	2000      	movs	r0, #0
c0d023e8:	9001      	str	r0, [sp, #4]
c0d023ea:	4803      	ldr	r0, [pc, #12]	@ (c0d023f8 <os_global_pin_is_validated+0x14>)
c0d023ec:	4669      	mov	r1, sp
c0d023ee:	f7ff ffc5 	bl	c0d0237c <SVC_Call>
c0d023f2:	b2c0      	uxtb	r0, r0
c0d023f4:	bd8c      	pop	{r2, r3, r7, pc}
c0d023f6:	46c0      	nop			@ (mov r8, r8)
c0d023f8:	6000a03c 	.word	0x6000a03c

c0d023fc <os_ux>:
c0d023fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d023fe:	2100      	movs	r1, #0
c0d02400:	9102      	str	r1, [sp, #8]
c0d02402:	9001      	str	r0, [sp, #4]
c0d02404:	4802      	ldr	r0, [pc, #8]	@ (c0d02410 <os_ux+0x14>)
c0d02406:	a901      	add	r1, sp, #4
c0d02408:	f7ff ffb8 	bl	c0d0237c <SVC_Call>
c0d0240c:	b004      	add	sp, #16
c0d0240e:	bd80      	pop	{r7, pc}
c0d02410:	60006458 	.word	0x60006458

c0d02414 <os_flags>:
c0d02414:	b5e0      	push	{r5, r6, r7, lr}
c0d02416:	2000      	movs	r0, #0
c0d02418:	9001      	str	r0, [sp, #4]
c0d0241a:	4802      	ldr	r0, [pc, #8]	@ (c0d02424 <os_flags+0x10>)
c0d0241c:	4669      	mov	r1, sp
c0d0241e:	f7ff ffad 	bl	c0d0237c <SVC_Call>
c0d02422:	bd8c      	pop	{r2, r3, r7, pc}
c0d02424:	60006a6e 	.word	0x60006a6e

c0d02428 <os_registry_get_current_app_tag>:
c0d02428:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d0242a:	ab01      	add	r3, sp, #4
c0d0242c:	c307      	stmia	r3!, {r0, r1, r2}
c0d0242e:	4803      	ldr	r0, [pc, #12]	@ (c0d0243c <os_registry_get_current_app_tag+0x14>)
c0d02430:	a901      	add	r1, sp, #4
c0d02432:	f7ff ffa3 	bl	c0d0237c <SVC_Call>
c0d02436:	b006      	add	sp, #24
c0d02438:	bd80      	pop	{r7, pc}
c0d0243a:	46c0      	nop			@ (mov r8, r8)
c0d0243c:	600074d4 	.word	0x600074d4

c0d02440 <os_sched_exit>:
c0d02440:	b084      	sub	sp, #16
c0d02442:	2100      	movs	r1, #0
c0d02444:	9102      	str	r1, [sp, #8]
c0d02446:	9001      	str	r0, [sp, #4]
c0d02448:	4802      	ldr	r0, [pc, #8]	@ (c0d02454 <os_sched_exit+0x14>)
c0d0244a:	a901      	add	r1, sp, #4
c0d0244c:	f7ff ff96 	bl	c0d0237c <SVC_Call>
c0d02450:	deff      	udf	#255	@ 0xff
c0d02452:	46c0      	nop			@ (mov r8, r8)
c0d02454:	60009abe 	.word	0x60009abe

c0d02458 <io_seph_send>:
c0d02458:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0245a:	9101      	str	r1, [sp, #4]
c0d0245c:	9000      	str	r0, [sp, #0]
c0d0245e:	4802      	ldr	r0, [pc, #8]	@ (c0d02468 <io_seph_send+0x10>)
c0d02460:	4669      	mov	r1, sp
c0d02462:	f7ff ff8b 	bl	c0d0237c <SVC_Call>
c0d02466:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0d02468:	60008381 	.word	0x60008381

c0d0246c <io_seph_is_status_sent>:
c0d0246c:	b5e0      	push	{r5, r6, r7, lr}
c0d0246e:	2000      	movs	r0, #0
c0d02470:	9001      	str	r0, [sp, #4]
c0d02472:	4802      	ldr	r0, [pc, #8]	@ (c0d0247c <io_seph_is_status_sent+0x10>)
c0d02474:	4669      	mov	r1, sp
c0d02476:	f7ff ff81 	bl	c0d0237c <SVC_Call>
c0d0247a:	bd8c      	pop	{r2, r3, r7, pc}
c0d0247c:	600084bb 	.word	0x600084bb

c0d02480 <io_seph_recv>:
c0d02480:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d02482:	ab01      	add	r3, sp, #4
c0d02484:	c307      	stmia	r3!, {r0, r1, r2}
c0d02486:	4803      	ldr	r0, [pc, #12]	@ (c0d02494 <io_seph_recv+0x14>)
c0d02488:	a901      	add	r1, sp, #4
c0d0248a:	f7ff ff77 	bl	c0d0237c <SVC_Call>
c0d0248e:	b280      	uxth	r0, r0
c0d02490:	b006      	add	sp, #24
c0d02492:	bd80      	pop	{r7, pc}
c0d02494:	600085e4 	.word	0x600085e4

c0d02498 <try_context_get>:
c0d02498:	b5e0      	push	{r5, r6, r7, lr}
c0d0249a:	2000      	movs	r0, #0
c0d0249c:	9001      	str	r0, [sp, #4]
c0d0249e:	4802      	ldr	r0, [pc, #8]	@ (c0d024a8 <try_context_get+0x10>)
c0d024a0:	4669      	mov	r1, sp
c0d024a2:	f7ff ff6b 	bl	c0d0237c <SVC_Call>
c0d024a6:	bd8c      	pop	{r2, r3, r7, pc}
c0d024a8:	600087b1 	.word	0x600087b1

c0d024ac <try_context_set>:
c0d024ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d024ae:	2100      	movs	r1, #0
c0d024b0:	9102      	str	r1, [sp, #8]
c0d024b2:	9001      	str	r0, [sp, #4]
c0d024b4:	4802      	ldr	r0, [pc, #8]	@ (c0d024c0 <try_context_set+0x14>)
c0d024b6:	a901      	add	r1, sp, #4
c0d024b8:	f7ff ff60 	bl	c0d0237c <SVC_Call>
c0d024bc:	b004      	add	sp, #16
c0d024be:	bd80      	pop	{r7, pc}
c0d024c0:	60010b06 	.word	0x60010b06

c0d024c4 <os_sched_last_status>:
c0d024c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d024c6:	2100      	movs	r1, #0
c0d024c8:	9102      	str	r1, [sp, #8]
c0d024ca:	9001      	str	r0, [sp, #4]
c0d024cc:	4803      	ldr	r0, [pc, #12]	@ (c0d024dc <os_sched_last_status+0x18>)
c0d024ce:	a901      	add	r1, sp, #4
c0d024d0:	f7ff ff54 	bl	c0d0237c <SVC_Call>
c0d024d4:	b2c0      	uxtb	r0, r0
c0d024d6:	b004      	add	sp, #16
c0d024d8:	bd80      	pop	{r7, pc}
c0d024da:	46c0      	nop			@ (mov r8, r8)
c0d024dc:	60009c8b 	.word	0x60009c8b

c0d024e0 <__udivsi3>:
c0d024e0:	2200      	movs	r2, #0
c0d024e2:	0843      	lsrs	r3, r0, #1
c0d024e4:	428b      	cmp	r3, r1
c0d024e6:	d374      	bcc.n	c0d025d2 <__udivsi3+0xf2>
c0d024e8:	0903      	lsrs	r3, r0, #4
c0d024ea:	428b      	cmp	r3, r1
c0d024ec:	d35f      	bcc.n	c0d025ae <__udivsi3+0xce>
c0d024ee:	0a03      	lsrs	r3, r0, #8
c0d024f0:	428b      	cmp	r3, r1
c0d024f2:	d344      	bcc.n	c0d0257e <__udivsi3+0x9e>
c0d024f4:	0b03      	lsrs	r3, r0, #12
c0d024f6:	428b      	cmp	r3, r1
c0d024f8:	d328      	bcc.n	c0d0254c <__udivsi3+0x6c>
c0d024fa:	0c03      	lsrs	r3, r0, #16
c0d024fc:	428b      	cmp	r3, r1
c0d024fe:	d30d      	bcc.n	c0d0251c <__udivsi3+0x3c>
c0d02500:	22ff      	movs	r2, #255	@ 0xff
c0d02502:	0209      	lsls	r1, r1, #8
c0d02504:	ba12      	rev	r2, r2
c0d02506:	0c03      	lsrs	r3, r0, #16
c0d02508:	428b      	cmp	r3, r1
c0d0250a:	d302      	bcc.n	c0d02512 <__udivsi3+0x32>
c0d0250c:	1212      	asrs	r2, r2, #8
c0d0250e:	0209      	lsls	r1, r1, #8
c0d02510:	d065      	beq.n	c0d025de <__udivsi3+0xfe>
c0d02512:	0b03      	lsrs	r3, r0, #12
c0d02514:	428b      	cmp	r3, r1
c0d02516:	d319      	bcc.n	c0d0254c <__udivsi3+0x6c>
c0d02518:	e000      	b.n	c0d0251c <__udivsi3+0x3c>
c0d0251a:	0a09      	lsrs	r1, r1, #8
c0d0251c:	0bc3      	lsrs	r3, r0, #15
c0d0251e:	428b      	cmp	r3, r1
c0d02520:	d301      	bcc.n	c0d02526 <__udivsi3+0x46>
c0d02522:	03cb      	lsls	r3, r1, #15
c0d02524:	1ac0      	subs	r0, r0, r3
c0d02526:	4152      	adcs	r2, r2
c0d02528:	0b83      	lsrs	r3, r0, #14
c0d0252a:	428b      	cmp	r3, r1
c0d0252c:	d301      	bcc.n	c0d02532 <__udivsi3+0x52>
c0d0252e:	038b      	lsls	r3, r1, #14
c0d02530:	1ac0      	subs	r0, r0, r3
c0d02532:	4152      	adcs	r2, r2
c0d02534:	0b43      	lsrs	r3, r0, #13
c0d02536:	428b      	cmp	r3, r1
c0d02538:	d301      	bcc.n	c0d0253e <__udivsi3+0x5e>
c0d0253a:	034b      	lsls	r3, r1, #13
c0d0253c:	1ac0      	subs	r0, r0, r3
c0d0253e:	4152      	adcs	r2, r2
c0d02540:	0b03      	lsrs	r3, r0, #12
c0d02542:	428b      	cmp	r3, r1
c0d02544:	d301      	bcc.n	c0d0254a <__udivsi3+0x6a>
c0d02546:	030b      	lsls	r3, r1, #12
c0d02548:	1ac0      	subs	r0, r0, r3
c0d0254a:	4152      	adcs	r2, r2
c0d0254c:	0ac3      	lsrs	r3, r0, #11
c0d0254e:	428b      	cmp	r3, r1
c0d02550:	d301      	bcc.n	c0d02556 <__udivsi3+0x76>
c0d02552:	02cb      	lsls	r3, r1, #11
c0d02554:	1ac0      	subs	r0, r0, r3
c0d02556:	4152      	adcs	r2, r2
c0d02558:	0a83      	lsrs	r3, r0, #10
c0d0255a:	428b      	cmp	r3, r1
c0d0255c:	d301      	bcc.n	c0d02562 <__udivsi3+0x82>
c0d0255e:	028b      	lsls	r3, r1, #10
c0d02560:	1ac0      	subs	r0, r0, r3
c0d02562:	4152      	adcs	r2, r2
c0d02564:	0a43      	lsrs	r3, r0, #9
c0d02566:	428b      	cmp	r3, r1
c0d02568:	d301      	bcc.n	c0d0256e <__udivsi3+0x8e>
c0d0256a:	024b      	lsls	r3, r1, #9
c0d0256c:	1ac0      	subs	r0, r0, r3
c0d0256e:	4152      	adcs	r2, r2
c0d02570:	0a03      	lsrs	r3, r0, #8
c0d02572:	428b      	cmp	r3, r1
c0d02574:	d301      	bcc.n	c0d0257a <__udivsi3+0x9a>
c0d02576:	020b      	lsls	r3, r1, #8
c0d02578:	1ac0      	subs	r0, r0, r3
c0d0257a:	4152      	adcs	r2, r2
c0d0257c:	d2cd      	bcs.n	c0d0251a <__udivsi3+0x3a>
c0d0257e:	09c3      	lsrs	r3, r0, #7
c0d02580:	428b      	cmp	r3, r1
c0d02582:	d301      	bcc.n	c0d02588 <__udivsi3+0xa8>
c0d02584:	01cb      	lsls	r3, r1, #7
c0d02586:	1ac0      	subs	r0, r0, r3
c0d02588:	4152      	adcs	r2, r2
c0d0258a:	0983      	lsrs	r3, r0, #6
c0d0258c:	428b      	cmp	r3, r1
c0d0258e:	d301      	bcc.n	c0d02594 <__udivsi3+0xb4>
c0d02590:	018b      	lsls	r3, r1, #6
c0d02592:	1ac0      	subs	r0, r0, r3
c0d02594:	4152      	adcs	r2, r2
c0d02596:	0943      	lsrs	r3, r0, #5
c0d02598:	428b      	cmp	r3, r1
c0d0259a:	d301      	bcc.n	c0d025a0 <__udivsi3+0xc0>
c0d0259c:	014b      	lsls	r3, r1, #5
c0d0259e:	1ac0      	subs	r0, r0, r3
c0d025a0:	4152      	adcs	r2, r2
c0d025a2:	0903      	lsrs	r3, r0, #4
c0d025a4:	428b      	cmp	r3, r1
c0d025a6:	d301      	bcc.n	c0d025ac <__udivsi3+0xcc>
c0d025a8:	010b      	lsls	r3, r1, #4
c0d025aa:	1ac0      	subs	r0, r0, r3
c0d025ac:	4152      	adcs	r2, r2
c0d025ae:	08c3      	lsrs	r3, r0, #3
c0d025b0:	428b      	cmp	r3, r1
c0d025b2:	d301      	bcc.n	c0d025b8 <__udivsi3+0xd8>
c0d025b4:	00cb      	lsls	r3, r1, #3
c0d025b6:	1ac0      	subs	r0, r0, r3
c0d025b8:	4152      	adcs	r2, r2
c0d025ba:	0883      	lsrs	r3, r0, #2
c0d025bc:	428b      	cmp	r3, r1
c0d025be:	d301      	bcc.n	c0d025c4 <__udivsi3+0xe4>
c0d025c0:	008b      	lsls	r3, r1, #2
c0d025c2:	1ac0      	subs	r0, r0, r3
c0d025c4:	4152      	adcs	r2, r2
c0d025c6:	0843      	lsrs	r3, r0, #1
c0d025c8:	428b      	cmp	r3, r1
c0d025ca:	d301      	bcc.n	c0d025d0 <__udivsi3+0xf0>
c0d025cc:	004b      	lsls	r3, r1, #1
c0d025ce:	1ac0      	subs	r0, r0, r3
c0d025d0:	4152      	adcs	r2, r2
c0d025d2:	1a41      	subs	r1, r0, r1
c0d025d4:	d200      	bcs.n	c0d025d8 <__udivsi3+0xf8>
c0d025d6:	4601      	mov	r1, r0
c0d025d8:	4152      	adcs	r2, r2
c0d025da:	4610      	mov	r0, r2
c0d025dc:	4770      	bx	lr
c0d025de:	e7ff      	b.n	c0d025e0 <__udivsi3+0x100>
c0d025e0:	b501      	push	{r0, lr}
c0d025e2:	2000      	movs	r0, #0
c0d025e4:	f000 f8f0 	bl	c0d027c8 <__aeabi_idiv0>
c0d025e8:	bd02      	pop	{r1, pc}
c0d025ea:	46c0      	nop			@ (mov r8, r8)

c0d025ec <__aeabi_uidivmod>:
c0d025ec:	2900      	cmp	r1, #0
c0d025ee:	d0f7      	beq.n	c0d025e0 <__udivsi3+0x100>
c0d025f0:	e776      	b.n	c0d024e0 <__udivsi3>
c0d025f2:	4770      	bx	lr

c0d025f4 <__divsi3>:
c0d025f4:	4603      	mov	r3, r0
c0d025f6:	430b      	orrs	r3, r1
c0d025f8:	d47f      	bmi.n	c0d026fa <__divsi3+0x106>
c0d025fa:	2200      	movs	r2, #0
c0d025fc:	0843      	lsrs	r3, r0, #1
c0d025fe:	428b      	cmp	r3, r1
c0d02600:	d374      	bcc.n	c0d026ec <__divsi3+0xf8>
c0d02602:	0903      	lsrs	r3, r0, #4
c0d02604:	428b      	cmp	r3, r1
c0d02606:	d35f      	bcc.n	c0d026c8 <__divsi3+0xd4>
c0d02608:	0a03      	lsrs	r3, r0, #8
c0d0260a:	428b      	cmp	r3, r1
c0d0260c:	d344      	bcc.n	c0d02698 <__divsi3+0xa4>
c0d0260e:	0b03      	lsrs	r3, r0, #12
c0d02610:	428b      	cmp	r3, r1
c0d02612:	d328      	bcc.n	c0d02666 <__divsi3+0x72>
c0d02614:	0c03      	lsrs	r3, r0, #16
c0d02616:	428b      	cmp	r3, r1
c0d02618:	d30d      	bcc.n	c0d02636 <__divsi3+0x42>
c0d0261a:	22ff      	movs	r2, #255	@ 0xff
c0d0261c:	0209      	lsls	r1, r1, #8
c0d0261e:	ba12      	rev	r2, r2
c0d02620:	0c03      	lsrs	r3, r0, #16
c0d02622:	428b      	cmp	r3, r1
c0d02624:	d302      	bcc.n	c0d0262c <__divsi3+0x38>
c0d02626:	1212      	asrs	r2, r2, #8
c0d02628:	0209      	lsls	r1, r1, #8
c0d0262a:	d065      	beq.n	c0d026f8 <__divsi3+0x104>
c0d0262c:	0b03      	lsrs	r3, r0, #12
c0d0262e:	428b      	cmp	r3, r1
c0d02630:	d319      	bcc.n	c0d02666 <__divsi3+0x72>
c0d02632:	e000      	b.n	c0d02636 <__divsi3+0x42>
c0d02634:	0a09      	lsrs	r1, r1, #8
c0d02636:	0bc3      	lsrs	r3, r0, #15
c0d02638:	428b      	cmp	r3, r1
c0d0263a:	d301      	bcc.n	c0d02640 <__divsi3+0x4c>
c0d0263c:	03cb      	lsls	r3, r1, #15
c0d0263e:	1ac0      	subs	r0, r0, r3
c0d02640:	4152      	adcs	r2, r2
c0d02642:	0b83      	lsrs	r3, r0, #14
c0d02644:	428b      	cmp	r3, r1
c0d02646:	d301      	bcc.n	c0d0264c <__divsi3+0x58>
c0d02648:	038b      	lsls	r3, r1, #14
c0d0264a:	1ac0      	subs	r0, r0, r3
c0d0264c:	4152      	adcs	r2, r2
c0d0264e:	0b43      	lsrs	r3, r0, #13
c0d02650:	428b      	cmp	r3, r1
c0d02652:	d301      	bcc.n	c0d02658 <__divsi3+0x64>
c0d02654:	034b      	lsls	r3, r1, #13
c0d02656:	1ac0      	subs	r0, r0, r3
c0d02658:	4152      	adcs	r2, r2
c0d0265a:	0b03      	lsrs	r3, r0, #12
c0d0265c:	428b      	cmp	r3, r1
c0d0265e:	d301      	bcc.n	c0d02664 <__divsi3+0x70>
c0d02660:	030b      	lsls	r3, r1, #12
c0d02662:	1ac0      	subs	r0, r0, r3
c0d02664:	4152      	adcs	r2, r2
c0d02666:	0ac3      	lsrs	r3, r0, #11
c0d02668:	428b      	cmp	r3, r1
c0d0266a:	d301      	bcc.n	c0d02670 <__divsi3+0x7c>
c0d0266c:	02cb      	lsls	r3, r1, #11
c0d0266e:	1ac0      	subs	r0, r0, r3
c0d02670:	4152      	adcs	r2, r2
c0d02672:	0a83      	lsrs	r3, r0, #10
c0d02674:	428b      	cmp	r3, r1
c0d02676:	d301      	bcc.n	c0d0267c <__divsi3+0x88>
c0d02678:	028b      	lsls	r3, r1, #10
c0d0267a:	1ac0      	subs	r0, r0, r3
c0d0267c:	4152      	adcs	r2, r2
c0d0267e:	0a43      	lsrs	r3, r0, #9
c0d02680:	428b      	cmp	r3, r1
c0d02682:	d301      	bcc.n	c0d02688 <__divsi3+0x94>
c0d02684:	024b      	lsls	r3, r1, #9
c0d02686:	1ac0      	subs	r0, r0, r3
c0d02688:	4152      	adcs	r2, r2
c0d0268a:	0a03      	lsrs	r3, r0, #8
c0d0268c:	428b      	cmp	r3, r1
c0d0268e:	d301      	bcc.n	c0d02694 <__divsi3+0xa0>
c0d02690:	020b      	lsls	r3, r1, #8
c0d02692:	1ac0      	subs	r0, r0, r3
c0d02694:	4152      	adcs	r2, r2
c0d02696:	d2cd      	bcs.n	c0d02634 <__divsi3+0x40>
c0d02698:	09c3      	lsrs	r3, r0, #7
c0d0269a:	428b      	cmp	r3, r1
c0d0269c:	d301      	bcc.n	c0d026a2 <__divsi3+0xae>
c0d0269e:	01cb      	lsls	r3, r1, #7
c0d026a0:	1ac0      	subs	r0, r0, r3
c0d026a2:	4152      	adcs	r2, r2
c0d026a4:	0983      	lsrs	r3, r0, #6
c0d026a6:	428b      	cmp	r3, r1
c0d026a8:	d301      	bcc.n	c0d026ae <__divsi3+0xba>
c0d026aa:	018b      	lsls	r3, r1, #6
c0d026ac:	1ac0      	subs	r0, r0, r3
c0d026ae:	4152      	adcs	r2, r2
c0d026b0:	0943      	lsrs	r3, r0, #5
c0d026b2:	428b      	cmp	r3, r1
c0d026b4:	d301      	bcc.n	c0d026ba <__divsi3+0xc6>
c0d026b6:	014b      	lsls	r3, r1, #5
c0d026b8:	1ac0      	subs	r0, r0, r3
c0d026ba:	4152      	adcs	r2, r2
c0d026bc:	0903      	lsrs	r3, r0, #4
c0d026be:	428b      	cmp	r3, r1
c0d026c0:	d301      	bcc.n	c0d026c6 <__divsi3+0xd2>
c0d026c2:	010b      	lsls	r3, r1, #4
c0d026c4:	1ac0      	subs	r0, r0, r3
c0d026c6:	4152      	adcs	r2, r2
c0d026c8:	08c3      	lsrs	r3, r0, #3
c0d026ca:	428b      	cmp	r3, r1
c0d026cc:	d301      	bcc.n	c0d026d2 <__divsi3+0xde>
c0d026ce:	00cb      	lsls	r3, r1, #3
c0d026d0:	1ac0      	subs	r0, r0, r3
c0d026d2:	4152      	adcs	r2, r2
c0d026d4:	0883      	lsrs	r3, r0, #2
c0d026d6:	428b      	cmp	r3, r1
c0d026d8:	d301      	bcc.n	c0d026de <__divsi3+0xea>
c0d026da:	008b      	lsls	r3, r1, #2
c0d026dc:	1ac0      	subs	r0, r0, r3
c0d026de:	4152      	adcs	r2, r2
c0d026e0:	0843      	lsrs	r3, r0, #1
c0d026e2:	428b      	cmp	r3, r1
c0d026e4:	d301      	bcc.n	c0d026ea <__divsi3+0xf6>
c0d026e6:	004b      	lsls	r3, r1, #1
c0d026e8:	1ac0      	subs	r0, r0, r3
c0d026ea:	4152      	adcs	r2, r2
c0d026ec:	1a41      	subs	r1, r0, r1
c0d026ee:	d200      	bcs.n	c0d026f2 <__divsi3+0xfe>
c0d026f0:	4601      	mov	r1, r0
c0d026f2:	4152      	adcs	r2, r2
c0d026f4:	4610      	mov	r0, r2
c0d026f6:	4770      	bx	lr
c0d026f8:	e05d      	b.n	c0d027b6 <__divsi3+0x1c2>
c0d026fa:	0fca      	lsrs	r2, r1, #31
c0d026fc:	d000      	beq.n	c0d02700 <__divsi3+0x10c>
c0d026fe:	4249      	negs	r1, r1
c0d02700:	1003      	asrs	r3, r0, #32
c0d02702:	d300      	bcc.n	c0d02706 <__divsi3+0x112>
c0d02704:	4240      	negs	r0, r0
c0d02706:	4053      	eors	r3, r2
c0d02708:	2200      	movs	r2, #0
c0d0270a:	469c      	mov	ip, r3
c0d0270c:	0903      	lsrs	r3, r0, #4
c0d0270e:	428b      	cmp	r3, r1
c0d02710:	d32d      	bcc.n	c0d0276e <__divsi3+0x17a>
c0d02712:	0a03      	lsrs	r3, r0, #8
c0d02714:	428b      	cmp	r3, r1
c0d02716:	d312      	bcc.n	c0d0273e <__divsi3+0x14a>
c0d02718:	22fc      	movs	r2, #252	@ 0xfc
c0d0271a:	0189      	lsls	r1, r1, #6
c0d0271c:	ba12      	rev	r2, r2
c0d0271e:	0a03      	lsrs	r3, r0, #8
c0d02720:	428b      	cmp	r3, r1
c0d02722:	d30c      	bcc.n	c0d0273e <__divsi3+0x14a>
c0d02724:	0189      	lsls	r1, r1, #6
c0d02726:	1192      	asrs	r2, r2, #6
c0d02728:	428b      	cmp	r3, r1
c0d0272a:	d308      	bcc.n	c0d0273e <__divsi3+0x14a>
c0d0272c:	0189      	lsls	r1, r1, #6
c0d0272e:	1192      	asrs	r2, r2, #6
c0d02730:	428b      	cmp	r3, r1
c0d02732:	d304      	bcc.n	c0d0273e <__divsi3+0x14a>
c0d02734:	0189      	lsls	r1, r1, #6
c0d02736:	d03a      	beq.n	c0d027ae <__divsi3+0x1ba>
c0d02738:	1192      	asrs	r2, r2, #6
c0d0273a:	e000      	b.n	c0d0273e <__divsi3+0x14a>
c0d0273c:	0989      	lsrs	r1, r1, #6
c0d0273e:	09c3      	lsrs	r3, r0, #7
c0d02740:	428b      	cmp	r3, r1
c0d02742:	d301      	bcc.n	c0d02748 <__divsi3+0x154>
c0d02744:	01cb      	lsls	r3, r1, #7
c0d02746:	1ac0      	subs	r0, r0, r3
c0d02748:	4152      	adcs	r2, r2
c0d0274a:	0983      	lsrs	r3, r0, #6
c0d0274c:	428b      	cmp	r3, r1
c0d0274e:	d301      	bcc.n	c0d02754 <__divsi3+0x160>
c0d02750:	018b      	lsls	r3, r1, #6
c0d02752:	1ac0      	subs	r0, r0, r3
c0d02754:	4152      	adcs	r2, r2
c0d02756:	0943      	lsrs	r3, r0, #5
c0d02758:	428b      	cmp	r3, r1
c0d0275a:	d301      	bcc.n	c0d02760 <__divsi3+0x16c>
c0d0275c:	014b      	lsls	r3, r1, #5
c0d0275e:	1ac0      	subs	r0, r0, r3
c0d02760:	4152      	adcs	r2, r2
c0d02762:	0903      	lsrs	r3, r0, #4
c0d02764:	428b      	cmp	r3, r1
c0d02766:	d301      	bcc.n	c0d0276c <__divsi3+0x178>
c0d02768:	010b      	lsls	r3, r1, #4
c0d0276a:	1ac0      	subs	r0, r0, r3
c0d0276c:	4152      	adcs	r2, r2
c0d0276e:	08c3      	lsrs	r3, r0, #3
c0d02770:	428b      	cmp	r3, r1
c0d02772:	d301      	bcc.n	c0d02778 <__divsi3+0x184>
c0d02774:	00cb      	lsls	r3, r1, #3
c0d02776:	1ac0      	subs	r0, r0, r3
c0d02778:	4152      	adcs	r2, r2
c0d0277a:	0883      	lsrs	r3, r0, #2
c0d0277c:	428b      	cmp	r3, r1
c0d0277e:	d301      	bcc.n	c0d02784 <__divsi3+0x190>
c0d02780:	008b      	lsls	r3, r1, #2
c0d02782:	1ac0      	subs	r0, r0, r3
c0d02784:	4152      	adcs	r2, r2
c0d02786:	d2d9      	bcs.n	c0d0273c <__divsi3+0x148>
c0d02788:	0843      	lsrs	r3, r0, #1
c0d0278a:	428b      	cmp	r3, r1
c0d0278c:	d301      	bcc.n	c0d02792 <__divsi3+0x19e>
c0d0278e:	004b      	lsls	r3, r1, #1
c0d02790:	1ac0      	subs	r0, r0, r3
c0d02792:	4152      	adcs	r2, r2
c0d02794:	1a41      	subs	r1, r0, r1
c0d02796:	d200      	bcs.n	c0d0279a <__divsi3+0x1a6>
c0d02798:	4601      	mov	r1, r0
c0d0279a:	4663      	mov	r3, ip
c0d0279c:	4152      	adcs	r2, r2
c0d0279e:	105b      	asrs	r3, r3, #1
c0d027a0:	4610      	mov	r0, r2
c0d027a2:	d301      	bcc.n	c0d027a8 <__divsi3+0x1b4>
c0d027a4:	4240      	negs	r0, r0
c0d027a6:	2b00      	cmp	r3, #0
c0d027a8:	d500      	bpl.n	c0d027ac <__divsi3+0x1b8>
c0d027aa:	4249      	negs	r1, r1
c0d027ac:	4770      	bx	lr
c0d027ae:	4663      	mov	r3, ip
c0d027b0:	105b      	asrs	r3, r3, #1
c0d027b2:	d300      	bcc.n	c0d027b6 <__divsi3+0x1c2>
c0d027b4:	4240      	negs	r0, r0
c0d027b6:	b501      	push	{r0, lr}
c0d027b8:	2000      	movs	r0, #0
c0d027ba:	f000 f805 	bl	c0d027c8 <__aeabi_idiv0>
c0d027be:	bd02      	pop	{r1, pc}

c0d027c0 <__aeabi_idivmod>:
c0d027c0:	2900      	cmp	r1, #0
c0d027c2:	d0f8      	beq.n	c0d027b6 <__divsi3+0x1c2>
c0d027c4:	e716      	b.n	c0d025f4 <__divsi3>
c0d027c6:	4770      	bx	lr

c0d027c8 <__aeabi_idiv0>:
c0d027c8:	4770      	bx	lr
c0d027ca:	46c0      	nop			@ (mov r8, r8)

c0d027cc <__aeabi_memclr>:
c0d027cc:	b510      	push	{r4, lr}
c0d027ce:	2200      	movs	r2, #0
c0d027d0:	f000 f80a 	bl	c0d027e8 <__aeabi_memset>
c0d027d4:	bd10      	pop	{r4, pc}
c0d027d6:	46c0      	nop			@ (mov r8, r8)

c0d027d8 <__aeabi_memcpy>:
c0d027d8:	b510      	push	{r4, lr}
c0d027da:	f000 f811 	bl	c0d02800 <memcpy>
c0d027de:	bd10      	pop	{r4, pc}

c0d027e0 <__aeabi_memmove>:
c0d027e0:	b510      	push	{r4, lr}
c0d027e2:	f000 f855 	bl	c0d02890 <memmove>
c0d027e6:	bd10      	pop	{r4, pc}

c0d027e8 <__aeabi_memset>:
c0d027e8:	000b      	movs	r3, r1
c0d027ea:	b510      	push	{r4, lr}
c0d027ec:	0011      	movs	r1, r2
c0d027ee:	001a      	movs	r2, r3
c0d027f0:	f000 f8a6 	bl	c0d02940 <memset>
c0d027f4:	bd10      	pop	{r4, pc}
c0d027f6:	46c0      	nop			@ (mov r8, r8)

c0d027f8 <explicit_bzero>:
c0d027f8:	b510      	push	{r4, lr}
c0d027fa:	f000 f93d 	bl	c0d02a78 <bzero>
c0d027fe:	bd10      	pop	{r4, pc}

c0d02800 <memcpy>:
c0d02800:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d02802:	0005      	movs	r5, r0
c0d02804:	2a0f      	cmp	r2, #15
c0d02806:	d933      	bls.n	c0d02870 <memcpy+0x70>
c0d02808:	2403      	movs	r4, #3
c0d0280a:	0003      	movs	r3, r0
c0d0280c:	0026      	movs	r6, r4
c0d0280e:	430b      	orrs	r3, r1
c0d02810:	401e      	ands	r6, r3
c0d02812:	421c      	tst	r4, r3
c0d02814:	d137      	bne.n	c0d02886 <memcpy+0x86>
c0d02816:	0015      	movs	r5, r2
c0d02818:	3d10      	subs	r5, #16
c0d0281a:	092d      	lsrs	r5, r5, #4
c0d0281c:	0003      	movs	r3, r0
c0d0281e:	000c      	movs	r4, r1
c0d02820:	46ac      	mov	ip, r5
c0d02822:	012f      	lsls	r7, r5, #4
c0d02824:	183f      	adds	r7, r7, r0
c0d02826:	6865      	ldr	r5, [r4, #4]
c0d02828:	605d      	str	r5, [r3, #4]
c0d0282a:	68a5      	ldr	r5, [r4, #8]
c0d0282c:	609d      	str	r5, [r3, #8]
c0d0282e:	68e5      	ldr	r5, [r4, #12]
c0d02830:	60dd      	str	r5, [r3, #12]
c0d02832:	6825      	ldr	r5, [r4, #0]
c0d02834:	3410      	adds	r4, #16
c0d02836:	601d      	str	r5, [r3, #0]
c0d02838:	001d      	movs	r5, r3
c0d0283a:	3310      	adds	r3, #16
c0d0283c:	42bd      	cmp	r5, r7
c0d0283e:	d1f2      	bne.n	c0d02826 <memcpy+0x26>
c0d02840:	4665      	mov	r5, ip
c0d02842:	230f      	movs	r3, #15
c0d02844:	240c      	movs	r4, #12
c0d02846:	3501      	adds	r5, #1
c0d02848:	012d      	lsls	r5, r5, #4
c0d0284a:	1949      	adds	r1, r1, r5
c0d0284c:	4013      	ands	r3, r2
c0d0284e:	1945      	adds	r5, r0, r5
c0d02850:	4214      	tst	r4, r2
c0d02852:	d01a      	beq.n	c0d0288a <memcpy+0x8a>
c0d02854:	598c      	ldr	r4, [r1, r6]
c0d02856:	51ac      	str	r4, [r5, r6]
c0d02858:	3604      	adds	r6, #4
c0d0285a:	1b9c      	subs	r4, r3, r6
c0d0285c:	2c03      	cmp	r4, #3
c0d0285e:	d8f9      	bhi.n	c0d02854 <memcpy+0x54>
c0d02860:	3b04      	subs	r3, #4
c0d02862:	089b      	lsrs	r3, r3, #2
c0d02864:	3301      	adds	r3, #1
c0d02866:	009b      	lsls	r3, r3, #2
c0d02868:	18ed      	adds	r5, r5, r3
c0d0286a:	18c9      	adds	r1, r1, r3
c0d0286c:	2303      	movs	r3, #3
c0d0286e:	401a      	ands	r2, r3
c0d02870:	1e56      	subs	r6, r2, #1
c0d02872:	2a00      	cmp	r2, #0
c0d02874:	d006      	beq.n	c0d02884 <memcpy+0x84>
c0d02876:	2300      	movs	r3, #0
c0d02878:	5ccc      	ldrb	r4, [r1, r3]
c0d0287a:	001a      	movs	r2, r3
c0d0287c:	54ec      	strb	r4, [r5, r3]
c0d0287e:	3301      	adds	r3, #1
c0d02880:	4296      	cmp	r6, r2
c0d02882:	d1f9      	bne.n	c0d02878 <memcpy+0x78>
c0d02884:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d02886:	1e56      	subs	r6, r2, #1
c0d02888:	e7f5      	b.n	c0d02876 <memcpy+0x76>
c0d0288a:	001a      	movs	r2, r3
c0d0288c:	e7f0      	b.n	c0d02870 <memcpy+0x70>
c0d0288e:	46c0      	nop			@ (mov r8, r8)

c0d02890 <memmove>:
c0d02890:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d02892:	4288      	cmp	r0, r1
c0d02894:	d90a      	bls.n	c0d028ac <memmove+0x1c>
c0d02896:	188b      	adds	r3, r1, r2
c0d02898:	4298      	cmp	r0, r3
c0d0289a:	d207      	bcs.n	c0d028ac <memmove+0x1c>
c0d0289c:	1e53      	subs	r3, r2, #1
c0d0289e:	2a00      	cmp	r2, #0
c0d028a0:	d003      	beq.n	c0d028aa <memmove+0x1a>
c0d028a2:	5cca      	ldrb	r2, [r1, r3]
c0d028a4:	54c2      	strb	r2, [r0, r3]
c0d028a6:	3b01      	subs	r3, #1
c0d028a8:	d2fb      	bcs.n	c0d028a2 <memmove+0x12>
c0d028aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d028ac:	0005      	movs	r5, r0
c0d028ae:	2a0f      	cmp	r2, #15
c0d028b0:	d80a      	bhi.n	c0d028c8 <memmove+0x38>
c0d028b2:	1e56      	subs	r6, r2, #1
c0d028b4:	2a00      	cmp	r2, #0
c0d028b6:	d0f8      	beq.n	c0d028aa <memmove+0x1a>
c0d028b8:	2300      	movs	r3, #0
c0d028ba:	5ccc      	ldrb	r4, [r1, r3]
c0d028bc:	001a      	movs	r2, r3
c0d028be:	54ec      	strb	r4, [r5, r3]
c0d028c0:	3301      	adds	r3, #1
c0d028c2:	4296      	cmp	r6, r2
c0d028c4:	d1f9      	bne.n	c0d028ba <memmove+0x2a>
c0d028c6:	e7f0      	b.n	c0d028aa <memmove+0x1a>
c0d028c8:	2403      	movs	r4, #3
c0d028ca:	0003      	movs	r3, r0
c0d028cc:	0026      	movs	r6, r4
c0d028ce:	430b      	orrs	r3, r1
c0d028d0:	401e      	ands	r6, r3
c0d028d2:	421c      	tst	r4, r3
c0d028d4:	d130      	bne.n	c0d02938 <memmove+0xa8>
c0d028d6:	0015      	movs	r5, r2
c0d028d8:	3d10      	subs	r5, #16
c0d028da:	092d      	lsrs	r5, r5, #4
c0d028dc:	0003      	movs	r3, r0
c0d028de:	000c      	movs	r4, r1
c0d028e0:	46ac      	mov	ip, r5
c0d028e2:	012f      	lsls	r7, r5, #4
c0d028e4:	183f      	adds	r7, r7, r0
c0d028e6:	6825      	ldr	r5, [r4, #0]
c0d028e8:	601d      	str	r5, [r3, #0]
c0d028ea:	6865      	ldr	r5, [r4, #4]
c0d028ec:	605d      	str	r5, [r3, #4]
c0d028ee:	68a5      	ldr	r5, [r4, #8]
c0d028f0:	609d      	str	r5, [r3, #8]
c0d028f2:	68e5      	ldr	r5, [r4, #12]
c0d028f4:	3410      	adds	r4, #16
c0d028f6:	60dd      	str	r5, [r3, #12]
c0d028f8:	001d      	movs	r5, r3
c0d028fa:	3310      	adds	r3, #16
c0d028fc:	42bd      	cmp	r5, r7
c0d028fe:	d1f2      	bne.n	c0d028e6 <memmove+0x56>
c0d02900:	4665      	mov	r5, ip
c0d02902:	230f      	movs	r3, #15
c0d02904:	240c      	movs	r4, #12
c0d02906:	3501      	adds	r5, #1
c0d02908:	012d      	lsls	r5, r5, #4
c0d0290a:	1949      	adds	r1, r1, r5
c0d0290c:	4013      	ands	r3, r2
c0d0290e:	1945      	adds	r5, r0, r5
c0d02910:	4214      	tst	r4, r2
c0d02912:	d013      	beq.n	c0d0293c <memmove+0xac>
c0d02914:	598c      	ldr	r4, [r1, r6]
c0d02916:	51ac      	str	r4, [r5, r6]
c0d02918:	3604      	adds	r6, #4
c0d0291a:	1b9c      	subs	r4, r3, r6
c0d0291c:	2c03      	cmp	r4, #3
c0d0291e:	d8f9      	bhi.n	c0d02914 <memmove+0x84>
c0d02920:	3b04      	subs	r3, #4
c0d02922:	089b      	lsrs	r3, r3, #2
c0d02924:	3301      	adds	r3, #1
c0d02926:	009b      	lsls	r3, r3, #2
c0d02928:	18ed      	adds	r5, r5, r3
c0d0292a:	18c9      	adds	r1, r1, r3
c0d0292c:	2303      	movs	r3, #3
c0d0292e:	401a      	ands	r2, r3
c0d02930:	1e56      	subs	r6, r2, #1
c0d02932:	2a00      	cmp	r2, #0
c0d02934:	d1c0      	bne.n	c0d028b8 <memmove+0x28>
c0d02936:	e7b8      	b.n	c0d028aa <memmove+0x1a>
c0d02938:	1e56      	subs	r6, r2, #1
c0d0293a:	e7bd      	b.n	c0d028b8 <memmove+0x28>
c0d0293c:	001a      	movs	r2, r3
c0d0293e:	e7b8      	b.n	c0d028b2 <memmove+0x22>

c0d02940 <memset>:
c0d02940:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d02942:	0005      	movs	r5, r0
c0d02944:	0783      	lsls	r3, r0, #30
c0d02946:	d049      	beq.n	c0d029dc <memset+0x9c>
c0d02948:	1e54      	subs	r4, r2, #1
c0d0294a:	2a00      	cmp	r2, #0
c0d0294c:	d045      	beq.n	c0d029da <memset+0x9a>
c0d0294e:	0003      	movs	r3, r0
c0d02950:	2603      	movs	r6, #3
c0d02952:	b2ca      	uxtb	r2, r1
c0d02954:	e002      	b.n	c0d0295c <memset+0x1c>
c0d02956:	3501      	adds	r5, #1
c0d02958:	3c01      	subs	r4, #1
c0d0295a:	d33e      	bcc.n	c0d029da <memset+0x9a>
c0d0295c:	3301      	adds	r3, #1
c0d0295e:	702a      	strb	r2, [r5, #0]
c0d02960:	4233      	tst	r3, r6
c0d02962:	d1f8      	bne.n	c0d02956 <memset+0x16>
c0d02964:	2c03      	cmp	r4, #3
c0d02966:	d930      	bls.n	c0d029ca <memset+0x8a>
c0d02968:	22ff      	movs	r2, #255	@ 0xff
c0d0296a:	400a      	ands	r2, r1
c0d0296c:	0215      	lsls	r5, r2, #8
c0d0296e:	18ad      	adds	r5, r5, r2
c0d02970:	042a      	lsls	r2, r5, #16
c0d02972:	18ad      	adds	r5, r5, r2
c0d02974:	2c0f      	cmp	r4, #15
c0d02976:	d934      	bls.n	c0d029e2 <memset+0xa2>
c0d02978:	0027      	movs	r7, r4
c0d0297a:	3f10      	subs	r7, #16
c0d0297c:	093f      	lsrs	r7, r7, #4
c0d0297e:	013e      	lsls	r6, r7, #4
c0d02980:	46b4      	mov	ip, r6
c0d02982:	001e      	movs	r6, r3
c0d02984:	001a      	movs	r2, r3
c0d02986:	3610      	adds	r6, #16
c0d02988:	4466      	add	r6, ip
c0d0298a:	6015      	str	r5, [r2, #0]
c0d0298c:	6055      	str	r5, [r2, #4]
c0d0298e:	6095      	str	r5, [r2, #8]
c0d02990:	60d5      	str	r5, [r2, #12]
c0d02992:	3210      	adds	r2, #16
c0d02994:	4296      	cmp	r6, r2
c0d02996:	d1f8      	bne.n	c0d0298a <memset+0x4a>
c0d02998:	3701      	adds	r7, #1
c0d0299a:	013f      	lsls	r7, r7, #4
c0d0299c:	19db      	adds	r3, r3, r7
c0d0299e:	270f      	movs	r7, #15
c0d029a0:	220c      	movs	r2, #12
c0d029a2:	4027      	ands	r7, r4
c0d029a4:	4022      	ands	r2, r4
c0d029a6:	003c      	movs	r4, r7
c0d029a8:	2a00      	cmp	r2, #0
c0d029aa:	d00e      	beq.n	c0d029ca <memset+0x8a>
c0d029ac:	1f3e      	subs	r6, r7, #4
c0d029ae:	08b6      	lsrs	r6, r6, #2
c0d029b0:	00b4      	lsls	r4, r6, #2
c0d029b2:	46a4      	mov	ip, r4
c0d029b4:	001a      	movs	r2, r3
c0d029b6:	1d1c      	adds	r4, r3, #4
c0d029b8:	4464      	add	r4, ip
c0d029ba:	c220      	stmia	r2!, {r5}
c0d029bc:	42a2      	cmp	r2, r4
c0d029be:	d1fc      	bne.n	c0d029ba <memset+0x7a>
c0d029c0:	2403      	movs	r4, #3
c0d029c2:	3601      	adds	r6, #1
c0d029c4:	00b6      	lsls	r6, r6, #2
c0d029c6:	199b      	adds	r3, r3, r6
c0d029c8:	403c      	ands	r4, r7
c0d029ca:	2c00      	cmp	r4, #0
c0d029cc:	d005      	beq.n	c0d029da <memset+0x9a>
c0d029ce:	b2c9      	uxtb	r1, r1
c0d029d0:	191c      	adds	r4, r3, r4
c0d029d2:	7019      	strb	r1, [r3, #0]
c0d029d4:	3301      	adds	r3, #1
c0d029d6:	429c      	cmp	r4, r3
c0d029d8:	d1fb      	bne.n	c0d029d2 <memset+0x92>
c0d029da:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d029dc:	0003      	movs	r3, r0
c0d029de:	0014      	movs	r4, r2
c0d029e0:	e7c0      	b.n	c0d02964 <memset+0x24>
c0d029e2:	0027      	movs	r7, r4
c0d029e4:	e7e2      	b.n	c0d029ac <memset+0x6c>
c0d029e6:	46c0      	nop			@ (mov r8, r8)

c0d029e8 <setjmp>:
c0d029e8:	c0f0      	stmia	r0!, {r4, r5, r6, r7}
c0d029ea:	4641      	mov	r1, r8
c0d029ec:	464a      	mov	r2, r9
c0d029ee:	4653      	mov	r3, sl
c0d029f0:	465c      	mov	r4, fp
c0d029f2:	466d      	mov	r5, sp
c0d029f4:	4676      	mov	r6, lr
c0d029f6:	c07e      	stmia	r0!, {r1, r2, r3, r4, r5, r6}
c0d029f8:	3828      	subs	r0, #40	@ 0x28
c0d029fa:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d029fc:	2000      	movs	r0, #0
c0d029fe:	4770      	bx	lr

c0d02a00 <longjmp>:
c0d02a00:	3010      	adds	r0, #16
c0d02a02:	c87c      	ldmia	r0!, {r2, r3, r4, r5, r6}
c0d02a04:	4690      	mov	r8, r2
c0d02a06:	4699      	mov	r9, r3
c0d02a08:	46a2      	mov	sl, r4
c0d02a0a:	46ab      	mov	fp, r5
c0d02a0c:	46b5      	mov	sp, r6
c0d02a0e:	c808      	ldmia	r0!, {r3}
c0d02a10:	3828      	subs	r0, #40	@ 0x28
c0d02a12:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d02a14:	1c08      	adds	r0, r1, #0
c0d02a16:	d100      	bne.n	c0d02a1a <longjmp+0x1a>
c0d02a18:	2001      	movs	r0, #1
c0d02a1a:	4718      	bx	r3

c0d02a1c <strlen>:
c0d02a1c:	b510      	push	{r4, lr}
c0d02a1e:	0783      	lsls	r3, r0, #30
c0d02a20:	d00a      	beq.n	c0d02a38 <strlen+0x1c>
c0d02a22:	0003      	movs	r3, r0
c0d02a24:	2103      	movs	r1, #3
c0d02a26:	e002      	b.n	c0d02a2e <strlen+0x12>
c0d02a28:	3301      	adds	r3, #1
c0d02a2a:	420b      	tst	r3, r1
c0d02a2c:	d005      	beq.n	c0d02a3a <strlen+0x1e>
c0d02a2e:	781a      	ldrb	r2, [r3, #0]
c0d02a30:	2a00      	cmp	r2, #0
c0d02a32:	d1f9      	bne.n	c0d02a28 <strlen+0xc>
c0d02a34:	1a18      	subs	r0, r3, r0
c0d02a36:	bd10      	pop	{r4, pc}
c0d02a38:	0003      	movs	r3, r0
c0d02a3a:	6819      	ldr	r1, [r3, #0]
c0d02a3c:	4a0c      	ldr	r2, [pc, #48]	@ (c0d02a70 <strlen+0x54>)
c0d02a3e:	4c0d      	ldr	r4, [pc, #52]	@ (c0d02a74 <strlen+0x58>)
c0d02a40:	188a      	adds	r2, r1, r2
c0d02a42:	438a      	bics	r2, r1
c0d02a44:	4222      	tst	r2, r4
c0d02a46:	d10f      	bne.n	c0d02a68 <strlen+0x4c>
c0d02a48:	6859      	ldr	r1, [r3, #4]
c0d02a4a:	4a09      	ldr	r2, [pc, #36]	@ (c0d02a70 <strlen+0x54>)
c0d02a4c:	3304      	adds	r3, #4
c0d02a4e:	188a      	adds	r2, r1, r2
c0d02a50:	438a      	bics	r2, r1
c0d02a52:	4222      	tst	r2, r4
c0d02a54:	d108      	bne.n	c0d02a68 <strlen+0x4c>
c0d02a56:	6859      	ldr	r1, [r3, #4]
c0d02a58:	4a05      	ldr	r2, [pc, #20]	@ (c0d02a70 <strlen+0x54>)
c0d02a5a:	3304      	adds	r3, #4
c0d02a5c:	188a      	adds	r2, r1, r2
c0d02a5e:	438a      	bics	r2, r1
c0d02a60:	4222      	tst	r2, r4
c0d02a62:	d0f1      	beq.n	c0d02a48 <strlen+0x2c>
c0d02a64:	e000      	b.n	c0d02a68 <strlen+0x4c>
c0d02a66:	3301      	adds	r3, #1
c0d02a68:	781a      	ldrb	r2, [r3, #0]
c0d02a6a:	2a00      	cmp	r2, #0
c0d02a6c:	d1fb      	bne.n	c0d02a66 <strlen+0x4a>
c0d02a6e:	e7e1      	b.n	c0d02a34 <strlen+0x18>
c0d02a70:	fefefeff 	.word	0xfefefeff
c0d02a74:	80808080 	.word	0x80808080

c0d02a78 <bzero>:
c0d02a78:	b510      	push	{r4, lr}
c0d02a7a:	000a      	movs	r2, r1
c0d02a7c:	2100      	movs	r1, #0
c0d02a7e:	f7ff ff5f 	bl	c0d02940 <memset>
c0d02a82:	bd10      	pop	{r4, pc}

c0d02a84 <B58_ALPHABET>:
c0d02a84:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0d02a94:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0d02aa4:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0d02ab4:	7271 7473 7675 7877 7a79 0000 002c 8000     qrstuvwxyz..,...
c0d02ac4:	0c54 8000 0000 8000 0000 0000 0000 0000     T...............

c0d02ad4 <USBD_HID_Desc>:
c0d02ad4:	2109 0111 0100 2222                          .!...."".

c0d02add <HID_ReportDesc>:
c0d02add:	a006 09ff a101 0901 1503 2600 00ff 0875     ...........&..u.
c0d02aed:	4095 0881 0409 0015 ff26 7500 9508 9140     .@......&..u..@.
c0d02afd:	c008                                        ..

c0d02aff <C_usb_bos>:
c0d02aff:	0f05 0039 1802 0510 3800 08b6 a934 a009     ..9......8..4...
c0d02b0f:	8b47 a0fd 8876 b615 0065 1e01 1c00 0510     G...v...e.......
c0d02b1f:	df00 dd60 89d8 c745 9c4c 65d2 9e9d 8a64     ..`...E.L..e..d.
c0d02b2f:	009f 0300 b206 7700                          .......w.

c0d02b38 <HID_Desc>:
c0d02b38:	189d c0d0 18ad c0d0 18bd c0d0 18cd c0d0     ................
c0d02b48:	18dd c0d0 18ed c0d0 18fd c0d0 190d c0d0     ................

c0d02b58 <C_winusb_string_descriptor>:
c0d02b58:	0312 004d 0053 0046 0054 0031 0030 0030     ..M.S.F.T.1.0.0.
c0d02b68:	0077                                        w.

c0d02b6a <C_winusb_guid>:
c0d02b6a:	0092 0000 0100 0005 0001 0088 0000 0007     ................
c0d02b7a:	0000 002a 0044 0065 0076 0069 0063 0065     ..*.D.e.v.i.c.e.
c0d02b8a:	0049 006e 0074 0065 0072 0066 0061 0063     I.n.t.e.r.f.a.c.
c0d02b9a:	0065 0047 0055 0049 0044 0073 0000 0050     e.G.U.I.D.s...P.
c0d02baa:	0000 007b 0031 0033 0064 0036 0033 0034     ..{.1.3.d.6.3.4.
c0d02bba:	0030 0030 002d 0032 0043 0039 0037 002d     0.0.-.2.C.9.7.-.
c0d02bca:	0030 0030 0030 0034 002d 0030 0030 0030     0.0.0.4.-.0.0.0.
c0d02bda:	0030 002d 0034 0063 0036 0035 0036 0034     0.-.4.c.6.5.6.4.
c0d02bea:	0036 0037 0036 0035 0037 0032 007d 0000     6.7.6.5.7.2.}...
	...

c0d02bfc <C_winusb_request_descriptor>:
c0d02bfc:	000a 0000 0000 0603 00b2 0008 0001 0000     ................
c0d02c0c:	00a8 0008 0002 0001 00a0 0014 0003 4957     ..............WI
c0d02c1c:	554e 4253 0000 0000 0000 0000 0000 0084     NUSB............
c0d02c2c:	0004 0007 002a 0044 0065 0076 0069 0063     ....*.D.e.v.i.c.
c0d02c3c:	0065 0049 006e 0074 0065 0072 0066 0061     e.I.n.t.e.r.f.a.
c0d02c4c:	0063 0065 0047 0055 0049 0044 0073 0000     c.e.G.U.I.D.s...
c0d02c5c:	0050 007b 0043 0045 0038 0030 0039 0032     P.{.C.E.8.0.9.2.
c0d02c6c:	0036 0034 002d 0034 0042 0032 0034 002d     6.4.-.4.B.2.4.-.
c0d02c7c:	0034 0045 0038 0031 002d 0041 0038 0042     4.E.8.1.-.A.8.B.
c0d02c8c:	0032 002d 0035 0037 0045 0044 0030 0031     2.-.5.7.E.D.0.1.
c0d02c9c:	0044 0035 0038 0030 0045 0031 007d 0000     D.5.8.0.E.1.}...
c0d02cac:	0000 0000                                   ....

c0d02cb0 <USBD_HID>:
c0d02cb0:	0c99 c0d0 0cc7 c0d0 0c09 c0d0 0000 0000     ................
c0d02cc0:	0000 0000 1799 c0d0 17b1 c0d0 0000 0000     ................
	...
c0d02cd8:	1a09 c0d0 1a09 c0d0 1a09 c0d0 1a19 c0d0     ................

c0d02ce8 <USBD_WEBUSB>:
c0d02ce8:	1801 c0d0 182d c0d0 1831 c0d0 0000 0000     ....-...1.......
c0d02cf8:	0000 0000 1835 c0d0 184d c0d0 0000 0000     ....5...M.......
	...
c0d02d10:	1a09 c0d0 1a09 c0d0 1a09 c0d0 1a19 c0d0     ................

c0d02d20 <USBD_DeviceDesc>:
c0d02d20:	0112 0210 0000 4000 2c97 1011 0201 0201     .......@.,......
c0d02d30:	0103                                        ..

c0d02d32 <USBD_LangIDDesc>:
c0d02d32:	0304 0409                                   ....

c0d02d36 <USBD_MANUFACTURER_STRING>:
c0d02d36:	030e 004c 0065 0064 0067 0065 0072          ..L.e.d.g.e.r.

c0d02d44 <USBD_PRODUCT_FS_STRING>:
c0d02d44:	030e 004e 0061 006e 006f 0020 0053          ..N.a.n.o. .S.

c0d02d52 <USB_SERIAL_STRING>:
c0d02d52:	030a 0030 0030 0030 0031                    ..0.0.0.1.

c0d02d5c <C_winusb_wcid>:
c0d02d5c:	0028 0000 0100 0004 0001 0000 0000 0000     (...............
c0d02d6c:	0101 4957 554e 4253 0000 0000 0000 0000     ..WINUSB........
	...

c0d02d84 <USBD_CfgDesc>:
c0d02d84:	0209 0040 0102 c002 0932 0004 0200 0003     ..@.....2.......
c0d02d94:	0200 2109 0111 0100 2222 0700 8205 4003     ...!...."".....@
c0d02da4:	0100 0507 0302 0040 0901 0104 0200 ffff     ......@.........
c0d02db4:	02ff 0507 0383 0040 0701 0305 4003 0100     ......@......@..

c0d02dc4 <USBD_DeviceQualifierDesc>:
c0d02dc4:	060a 0200 0000 4000 0001                    .......@..

c0d02dce <seph_io_general_status>:
c0d02dce:	0060 0002 0000                              `.....

c0d02dd4 <_etext>:
	...

c0d02e00 <install_parameters>:
c0d02e00:	0501 634f 7274 0261 3105 302e 302e 0104     ..Octra..1.0.0..
c0d02e10:	                                             .
