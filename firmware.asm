
.pio/build/thunder_pack_f411/firmware.elf:     file format elf32-littlearm


Disassembly of section .init:

080001a0 <_init>:
 80001a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80001a2:	bf00      	nop
 80001a4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80001a6:	bc08      	pop	{r3}
 80001a8:	469e      	mov	lr, r3
 80001aa:	4770      	bx	lr

Disassembly of section .fini:

080001ac <_fini>:
 80001ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80001ae:	bf00      	nop
 80001b0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80001b2:	bc08      	pop	{r3}
 80001b4:	469e      	mov	lr, r3
 80001b6:	4770      	bx	lr

Disassembly of section .text:

080001b8 <__aeabi_ldivmod>:
 80001b8:	b97b      	cbnz	r3, 80001da <__aeabi_ldivmod+0x22>
 80001ba:	b972      	cbnz	r2, 80001da <__aeabi_ldivmod+0x22>
 80001bc:	2900      	cmp	r1, #0
 80001be:	bfbe      	ittt	lt
 80001c0:	2000      	movlt	r0, #0
 80001c2:	f04f 4100 	movlt.w	r1, #2147483648	@ 0x80000000
 80001c6:	e006      	blt.n	80001d6 <__aeabi_ldivmod+0x1e>
 80001c8:	bf08      	it	eq
 80001ca:	2800      	cmpeq	r0, #0
 80001cc:	bf1c      	itt	ne
 80001ce:	f06f 4100 	mvnne.w	r1, #2147483648	@ 0x80000000
 80001d2:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
 80001d6:	f000 b857 	b.w	8000288 <__aeabi_idiv0>
 80001da:	f1ad 0c08 	sub.w	ip, sp, #8
 80001de:	e96d ce04 	strd	ip, lr, [sp, #-16]!
 80001e2:	2900      	cmp	r1, #0
 80001e4:	db09      	blt.n	80001fa <__aeabi_ldivmod+0x42>
 80001e6:	2b00      	cmp	r3, #0
 80001e8:	db1a      	blt.n	8000220 <__aeabi_ldivmod+0x68>
 80001ea:	f000 fb55 	bl	8000898 <__udivmoddi4>
 80001ee:	f8dd e004 	ldr.w	lr, [sp, #4]
 80001f2:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 80001f6:	b004      	add	sp, #16
 80001f8:	4770      	bx	lr
 80001fa:	4240      	negs	r0, r0
 80001fc:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 8000200:	2b00      	cmp	r3, #0
 8000202:	db1b      	blt.n	800023c <__aeabi_ldivmod+0x84>
 8000204:	f000 fb48 	bl	8000898 <__udivmoddi4>
 8000208:	f8dd e004 	ldr.w	lr, [sp, #4]
 800020c:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 8000210:	b004      	add	sp, #16
 8000212:	4240      	negs	r0, r0
 8000214:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 8000218:	4252      	negs	r2, r2
 800021a:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 800021e:	4770      	bx	lr
 8000220:	4252      	negs	r2, r2
 8000222:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 8000226:	f000 fb37 	bl	8000898 <__udivmoddi4>
 800022a:	f8dd e004 	ldr.w	lr, [sp, #4]
 800022e:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 8000232:	b004      	add	sp, #16
 8000234:	4240      	negs	r0, r0
 8000236:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 800023a:	4770      	bx	lr
 800023c:	4252      	negs	r2, r2
 800023e:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 8000242:	f000 fb29 	bl	8000898 <__udivmoddi4>
 8000246:	f8dd e004 	ldr.w	lr, [sp, #4]
 800024a:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 800024e:	b004      	add	sp, #16
 8000250:	4252      	negs	r2, r2
 8000252:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 8000256:	4770      	bx	lr

08000258 <__aeabi_uldivmod>:
 8000258:	b953      	cbnz	r3, 8000270 <__aeabi_uldivmod+0x18>
 800025a:	b94a      	cbnz	r2, 8000270 <__aeabi_uldivmod+0x18>
 800025c:	2900      	cmp	r1, #0
 800025e:	bf08      	it	eq
 8000260:	2800      	cmpeq	r0, #0
 8000262:	bf1c      	itt	ne
 8000264:	f04f 31ff 	movne.w	r1, #4294967295	@ 0xffffffff
 8000268:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
 800026c:	f000 b80c 	b.w	8000288 <__aeabi_idiv0>
 8000270:	f1ad 0c08 	sub.w	ip, sp, #8
 8000274:	e96d ce04 	strd	ip, lr, [sp, #-16]!
 8000278:	f000 fb0e 	bl	8000898 <__udivmoddi4>
 800027c:	f8dd e004 	ldr.w	lr, [sp, #4]
 8000280:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 8000284:	b004      	add	sp, #16
 8000286:	4770      	bx	lr

08000288 <__aeabi_idiv0>:
 8000288:	4770      	bx	lr
 800028a:	bf00      	nop

0800028c <deregister_tm_clones>:
 800028c:	4803      	ldr	r0, [pc, #12]	@ (800029c <deregister_tm_clones+0x10>)
 800028e:	4b04      	ldr	r3, [pc, #16]	@ (80002a0 <deregister_tm_clones+0x14>)
 8000290:	4283      	cmp	r3, r0
 8000292:	d002      	beq.n	800029a <deregister_tm_clones+0xe>
 8000294:	4b03      	ldr	r3, [pc, #12]	@ (80002a4 <deregister_tm_clones+0x18>)
 8000296:	b103      	cbz	r3, 800029a <deregister_tm_clones+0xe>
 8000298:	4718      	bx	r3
 800029a:	4770      	bx	lr
 800029c:	20000000 	.word	0x20000000
 80002a0:	20000000 	.word	0x20000000
 80002a4:	00000000 	.word	0x00000000

080002a8 <register_tm_clones>:
 80002a8:	4805      	ldr	r0, [pc, #20]	@ (80002c0 <register_tm_clones+0x18>)
 80002aa:	4b06      	ldr	r3, [pc, #24]	@ (80002c4 <register_tm_clones+0x1c>)
 80002ac:	1a1b      	subs	r3, r3, r0
 80002ae:	0fd9      	lsrs	r1, r3, #31
 80002b0:	eb01 01a3 	add.w	r1, r1, r3, asr #2
 80002b4:	1049      	asrs	r1, r1, #1
 80002b6:	d002      	beq.n	80002be <register_tm_clones+0x16>
 80002b8:	4b03      	ldr	r3, [pc, #12]	@ (80002c8 <register_tm_clones+0x20>)
 80002ba:	b103      	cbz	r3, 80002be <register_tm_clones+0x16>
 80002bc:	4718      	bx	r3
 80002be:	4770      	bx	lr
 80002c0:	20000000 	.word	0x20000000
 80002c4:	20000000 	.word	0x20000000
 80002c8:	00000000 	.word	0x00000000

080002cc <__do_global_dtors_aux>:
 80002cc:	b510      	push	{r4, lr}
 80002ce:	4c06      	ldr	r4, [pc, #24]	@ (80002e8 <__do_global_dtors_aux+0x1c>)
 80002d0:	7823      	ldrb	r3, [r4, #0]
 80002d2:	b943      	cbnz	r3, 80002e6 <__do_global_dtors_aux+0x1a>
 80002d4:	f7ff ffda 	bl	800028c <deregister_tm_clones>
 80002d8:	4b04      	ldr	r3, [pc, #16]	@ (80002ec <__do_global_dtors_aux+0x20>)
 80002da:	b113      	cbz	r3, 80002e2 <__do_global_dtors_aux+0x16>
 80002dc:	4804      	ldr	r0, [pc, #16]	@ (80002f0 <__do_global_dtors_aux+0x24>)
 80002de:	f3af 8000 	nop.w
 80002e2:	2301      	movs	r3, #1
 80002e4:	7023      	strb	r3, [r4, #0]
 80002e6:	bd10      	pop	{r4, pc}
 80002e8:	20000000 	.word	0x20000000
 80002ec:	00000000 	.word	0x00000000
 80002f0:	08000198 	.word	0x08000198

080002f4 <frame_dummy>:
 80002f4:	b508      	push	{r3, lr}
 80002f6:	4b05      	ldr	r3, [pc, #20]	@ (800030c <frame_dummy+0x18>)
 80002f8:	b11b      	cbz	r3, 8000302 <frame_dummy+0xe>
 80002fa:	4905      	ldr	r1, [pc, #20]	@ (8000310 <frame_dummy+0x1c>)
 80002fc:	4805      	ldr	r0, [pc, #20]	@ (8000314 <frame_dummy+0x20>)
 80002fe:	f3af 8000 	nop.w
 8000302:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000306:	f7ff bfcf 	b.w	80002a8 <register_tm_clones>
 800030a:	bf00      	nop
 800030c:	00000000 	.word	0x00000000
 8000310:	20000004 	.word	0x20000004
 8000314:	08000198 	.word	0x08000198

08000318 <Reset_Handler>:
 8000318:	f8df d034 	ldr.w	sp, [pc, #52]	@ 8000350 <LoopFillZerobss+0xe>
 800031c:	f000 f825 	bl	800036a <SystemInit>
 8000320:	480c      	ldr	r0, [pc, #48]	@ (8000354 <LoopFillZerobss+0x12>)
 8000322:	490d      	ldr	r1, [pc, #52]	@ (8000358 <LoopFillZerobss+0x16>)
 8000324:	4a0d      	ldr	r2, [pc, #52]	@ (800035c <LoopFillZerobss+0x1a>)
 8000326:	2300      	movs	r3, #0
 8000328:	e002      	b.n	8000330 <LoopCopyDataInit>

0800032a <CopyDataInit>:
 800032a:	58d4      	ldr	r4, [r2, r3]
 800032c:	50c4      	str	r4, [r0, r3]
 800032e:	3304      	adds	r3, #4

08000330 <LoopCopyDataInit>:
 8000330:	18c4      	adds	r4, r0, r3
 8000332:	428c      	cmp	r4, r1
 8000334:	d3f9      	bcc.n	800032a <CopyDataInit>
 8000336:	4a0a      	ldr	r2, [pc, #40]	@ (8000360 <LoopFillZerobss+0x1e>)
 8000338:	4c0a      	ldr	r4, [pc, #40]	@ (8000364 <LoopFillZerobss+0x22>)
 800033a:	2300      	movs	r3, #0
 800033c:	e001      	b.n	8000342 <LoopFillZerobss>

0800033e <FillZerobss>:
 800033e:	6013      	str	r3, [r2, #0]
 8000340:	3204      	adds	r2, #4

08000342 <LoopFillZerobss>:
 8000342:	42a2      	cmp	r2, r4
 8000344:	d3fb      	bcc.n	800033e <FillZerobss>
 8000346:	f000 fc23 	bl	8000b90 <__libc_init_array>
 800034a:	f000 fa55 	bl	80007f8 <main>
 800034e:	4770      	bx	lr
 8000350:	20020000 	.word	0x20020000
 8000354:	20000000 	.word	0x20000000
 8000358:	20000000 	.word	0x20000000
 800035c:	08000bf4 	.word	0x08000bf4
 8000360:	20000000 	.word	0x20000000
 8000364:	20000030 	.word	0x20000030

08000368 <ADC_IRQHandler>:
 8000368:	e7fe      	b.n	8000368 <ADC_IRQHandler>

0800036a <SystemInit>:
 800036a:	4770      	bx	lr

0800036c <wallet::driver::buzzer::Passive::Passive(wallet::driver::buzzer::Passive&&)>:
 800036c:	4603      	mov	r3, r0
 800036e:	b510      	push	{r4, lr}
 8000370:	460a      	mov	r2, r1
 8000372:	461c      	mov	r4, r3
 8000374:	f851 0b04 	ldr.w	r0, [r1], #4
 8000378:	f844 0b04 	str.w	r0, [r4], #4
 800037c:	c903      	ldmia	r1, {r0, r1}
 800037e:	e884 0003 	stmia.w	r4, {r0, r1}
 8000382:	7b11      	ldrb	r1, [r2, #12]
 8000384:	7319      	strb	r1, [r3, #12]
 8000386:	4903      	ldr	r1, [pc, #12]	@ (8000394 <wallet::driver::buzzer::Passive::Passive(wallet::driver::buzzer::Passive&&)+0x28>)
 8000388:	6808      	ldr	r0, [r1, #0]
 800038a:	4290      	cmp	r0, r2
 800038c:	bf08      	it	eq
 800038e:	600b      	streq	r3, [r1, #0]
 8000390:	4618      	mov	r0, r3
 8000392:	bd10      	pop	{r4, pc}
 8000394:	2000001c 	.word	0x2000001c

08000398 <wallet::driver::buzzer::Passive::~Passive()>:
 8000398:	4b07      	ldr	r3, [pc, #28]	@ (80003b8 <wallet::driver::buzzer::Passive::~Passive()+0x20>)
 800039a:	b510      	push	{r4, lr}
 800039c:	681a      	ldr	r2, [r3, #0]
 800039e:	4282      	cmp	r2, r0
 80003a0:	4604      	mov	r4, r0
 80003a2:	bf08      	it	eq
 80003a4:	2200      	moveq	r2, #0
 80003a6:	f100 0004 	add.w	r0, r0, #4
 80003aa:	bf08      	it	eq
 80003ac:	601a      	streq	r2, [r3, #0]
 80003ae:	f000 f91d 	bl	80005ec <wallet::driver::gpio::Device::~Device()>
 80003b2:	4620      	mov	r0, r4
 80003b4:	bd10      	pop	{r4, pc}
 80003b6:	bf00      	nop
 80003b8:	2000001c 	.word	0x2000001c

080003bc <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)>:
 80003bc:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80003c0:	b091      	sub	sp, #68	@ 0x44
 80003c2:	2302      	movs	r3, #2
 80003c4:	9300      	str	r3, [sp, #0]
 80003c6:	af09      	add	r7, sp, #36	@ 0x24
 80003c8:	2300      	movs	r3, #0
 80003ca:	f8ad 2004 	strh.w	r2, [sp, #4]
 80003ce:	4604      	mov	r4, r0
 80003d0:	461a      	mov	r2, r3
 80003d2:	4688      	mov	r8, r1
 80003d4:	4638      	mov	r0, r7
 80003d6:	2101      	movs	r1, #1
 80003d8:	f000 f8da 	bl	8000590 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)>
 80003dc:	f89d 302c 	ldrb.w	r3, [sp, #44]	@ 0x2c
 80003e0:	b3bb      	cbz	r3, 8000452 <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0x96>
 80003e2:	4b20      	ldr	r3, [pc, #128]	@ (8000464 <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0xa8>)
 80003e4:	e897 0003 	ldmia.w	r7, {r0, r1}
 80003e8:	681a      	ldr	r2, [r3, #0]
 80003ea:	ad05      	add	r5, sp, #20
 80003ec:	e885 0003 	stmia.w	r5, {r0, r1}
 80003f0:	b16a      	cbz	r2, 800040e <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0x52>
 80003f2:	2305      	movs	r3, #5
 80003f4:	7023      	strb	r3, [r4, #0]
 80003f6:	2300      	movs	r3, #0
 80003f8:	7423      	strb	r3, [r4, #16]
 80003fa:	4628      	mov	r0, r5
 80003fc:	f000 f8f6 	bl	80005ec <wallet::driver::gpio::Device::~Device()>
 8000400:	f89d 302c 	ldrb.w	r3, [sp, #44]	@ 0x2c
 8000404:	bb53      	cbnz	r3, 800045c <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0xa0>
 8000406:	4620      	mov	r0, r4
 8000408:	b011      	add	sp, #68	@ 0x44
 800040a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800040e:	e895 0003 	ldmia.w	r5, {r0, r1}
 8000412:	f10d 0c34 	add.w	ip, sp, #52	@ 0x34
 8000416:	ae07      	add	r6, sp, #28
 8000418:	e88c 0003 	stmia.w	ip, {r0, r1}
 800041c:	e886 0003 	stmia.w	r6, {r0, r1}
 8000420:	f10d 0930 	add.w	r9, sp, #48	@ 0x30
 8000424:	4910      	ldr	r1, [pc, #64]	@ (8000468 <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0xac>)
 8000426:	f88d 203c 	strb.w	r2, [sp, #60]	@ 0x3c
 800042a:	4640      	mov	r0, r8
 800042c:	f8c3 9000 	str.w	r9, [r3]
 8000430:	f8cd 8030 	str.w	r8, [sp, #48]	@ 0x30
 8000434:	f000 f98c 	bl	8000750 <wallet::driver::timer::PhysicalTimer::handle(void (*)()) const>
 8000438:	4649      	mov	r1, r9
 800043a:	4620      	mov	r0, r4
 800043c:	f7ff ff96 	bl	800036c <wallet::driver::buzzer::Passive::Passive(wallet::driver::buzzer::Passive&&)>
 8000440:	2301      	movs	r3, #1
 8000442:	7423      	strb	r3, [r4, #16]
 8000444:	4648      	mov	r0, r9
 8000446:	f7ff ffa7 	bl	8000398 <wallet::driver::buzzer::Passive::~Passive()>
 800044a:	4630      	mov	r0, r6
 800044c:	f000 f8ce 	bl	80005ec <wallet::driver::gpio::Device::~Device()>
 8000450:	e7d3      	b.n	80003fa <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0x3e>
 8000452:	f89d 2024 	ldrb.w	r2, [sp, #36]	@ 0x24
 8000456:	7022      	strb	r2, [r4, #0]
 8000458:	7423      	strb	r3, [r4, #16]
 800045a:	e7d4      	b.n	8000406 <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0x4a>
 800045c:	4638      	mov	r0, r7
 800045e:	f000 f8c5 	bl	80005ec <wallet::driver::gpio::Device::~Device()>
 8000462:	e7d0      	b.n	8000406 <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)+0x4a>
 8000464:	2000001c 	.word	0x2000001c
 8000468:	08000495 	.word	0x08000495

0800046c <wallet::driver::buzzer::Passive::frequency(unsigned long) const>:
 800046c:	6800      	ldr	r0, [r0, #0]
 800046e:	4a04      	ldr	r2, [pc, #16]	@ (8000480 <wallet::driver::buzzer::Passive::frequency(unsigned long) const+0x14>)
 8000470:	fbb2 f2f1 	udiv	r2, r2, r1
 8000474:	b082      	sub	sp, #8
 8000476:	0852      	lsrs	r2, r2, #1
 8000478:	2300      	movs	r3, #0
 800047a:	b002      	add	sp, #8
 800047c:	f000 b977 	b.w	800076e <wallet::driver::timer::PhysicalTimer::interval(std::chrono::duration<long long, std::ratio<1ll, 1000000000ll> >) const>
 8000480:	3b9aca00 	.word	0x3b9aca00

08000484 <wallet::driver::buzzer::Passive::toggle()>:
 8000484:	7b01      	ldrb	r1, [r0, #12]
 8000486:	f081 0101 	eor.w	r1, r1, #1
 800048a:	7301      	strb	r1, [r0, #12]
 800048c:	3004      	adds	r0, #4
 800048e:	f000 b8ae 	b.w	80005ee <wallet::driver::gpio::Device::set(bool) const>
	...

08000494 <wallet::driver::buzzer::Passive::Passive(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Device)::{lambda()#1}::_FUN()>:
 8000494:	4b02      	ldr	r3, [pc, #8]	@ (80004a0 <wallet::driver::buzzer::Passive::Passive(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Device)::{lambda()#1}::_FUN()+0xc>)
 8000496:	6818      	ldr	r0, [r3, #0]
 8000498:	b108      	cbz	r0, 800049e <wallet::driver::buzzer::Passive::Passive(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Device)::{lambda()#1}::_FUN()+0xa>
 800049a:	f7ff bff3 	b.w	8000484 <wallet::driver::buzzer::Passive::toggle()>
 800049e:	4770      	bx	lr
 80004a0:	2000001c 	.word	0x2000001c

080004a4 <wallet::driver::buzzer::Passive::start() const>:
 80004a4:	6800      	ldr	r0, [r0, #0]
 80004a6:	b082      	sub	sp, #8
 80004a8:	b002      	add	sp, #8
 80004aa:	f000 b999 	b.w	80007e0 <wallet::driver::timer::PhysicalTimer::start() const>

080004ae <gpio_typedef(wallet::driver::gpio::Port)>:
 80004ae:	2902      	cmp	r1, #2
 80004b0:	bf97      	itett	ls
 80004b2:	0289      	lslls	r1, r1, #10
 80004b4:	2301      	movhi	r3, #1
 80004b6:	f101 4180 	addls.w	r1, r1, #1073741824	@ 0x40000000
 80004ba:	f501 3100 	addls.w	r1, r1, #131072	@ 0x20000
 80004be:	bf93      	iteet	ls
 80004c0:	2301      	movls	r3, #1
 80004c2:	6003      	strhi	r3, [r0, #0]
 80004c4:	2300      	movhi	r3, #0
 80004c6:	6001      	strls	r1, [r0, #0]
 80004c8:	7103      	strb	r3, [r0, #4]
 80004ca:	4770      	bx	lr

080004cc <wallet::driver::gpio::require(wallet::driver::gpio::Port)>:
 80004cc:	2801      	cmp	r0, #1
 80004ce:	b082      	sub	sp, #8
 80004d0:	d00e      	beq.n	80004f0 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x24>
 80004d2:	2802      	cmp	r0, #2
 80004d4:	d011      	beq.n	80004fa <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x2e>
 80004d6:	b9a8      	cbnz	r0, 8000504 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x38>
 80004d8:	4a0d      	ldr	r2, [pc, #52]	@ (8000510 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x44>)
 80004da:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 80004dc:	f043 0301 	orr.w	r3, r3, #1
 80004e0:	6313      	str	r3, [r2, #48]	@ 0x30
 80004e2:	2301      	movs	r3, #1
 80004e4:	f89d 0004 	ldrb.w	r0, [sp, #4]
 80004e8:	ea40 2003 	orr.w	r0, r0, r3, lsl #8
 80004ec:	b002      	add	sp, #8
 80004ee:	4770      	bx	lr
 80004f0:	4a07      	ldr	r2, [pc, #28]	@ (8000510 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x44>)
 80004f2:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 80004f4:	f043 0302 	orr.w	r3, r3, #2
 80004f8:	e7f2      	b.n	80004e0 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x14>
 80004fa:	4a05      	ldr	r2, [pc, #20]	@ (8000510 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x44>)
 80004fc:	6b13      	ldr	r3, [r2, #48]	@ 0x30
 80004fe:	f043 0304 	orr.w	r3, r3, #4
 8000502:	e7ed      	b.n	80004e0 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x14>
 8000504:	2301      	movs	r3, #1
 8000506:	f88d 3004 	strb.w	r3, [sp, #4]
 800050a:	2300      	movs	r3, #0
 800050c:	e7ea      	b.n	80004e4 <wallet::driver::gpio::require(wallet::driver::gpio::Port)+0x18>
 800050e:	bf00      	nop
 8000510:	40023800 	.word	0x40023800

08000514 <wallet::driver::gpio::Device::Device(unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, GPIO_TypeDef*)>:
 8000514:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000516:	9c07      	ldr	r4, [sp, #28]
 8000518:	f89d 7018 	ldrb.w	r7, [sp, #24]
 800051c:	6004      	str	r4, [r0, #0]
 800051e:	2500      	movs	r5, #0
 8000520:	7107      	strb	r7, [r0, #4]
 8000522:	7145      	strb	r5, [r0, #5]
 8000524:	7185      	strb	r5, [r0, #6]
 8000526:	bb79      	cbnz	r1, 8000588 <wallet::driver::gpio::Device::Device(unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, GPIO_TypeDef*)+0x74>
 8000528:	2501      	movs	r5, #1
 800052a:	7185      	strb	r5, [r0, #6]
 800052c:	f8d4 c000 	ldr.w	ip, [r4]
 8000530:	007e      	lsls	r6, r7, #1
 8000532:	2503      	movs	r5, #3
 8000534:	40b5      	lsls	r5, r6
 8000536:	ea2c 0c05 	bic.w	ip, ip, r5
 800053a:	f8c4 c000 	str.w	ip, [r4]
 800053e:	f8d4 c000 	ldr.w	ip, [r4]
 8000542:	40b1      	lsls	r1, r6
 8000544:	ea41 010c 	orr.w	r1, r1, ip
 8000548:	6021      	str	r1, [r4, #0]
 800054a:	6861      	ldr	r1, [r4, #4]
 800054c:	f04f 0c01 	mov.w	ip, #1
 8000550:	fa0c fc07 	lsl.w	ip, ip, r7
 8000554:	ea21 010c 	bic.w	r1, r1, ip
 8000558:	6061      	str	r1, [r4, #4]
 800055a:	6861      	ldr	r1, [r4, #4]
 800055c:	40ba      	lsls	r2, r7
 800055e:	430a      	orrs	r2, r1
 8000560:	6062      	str	r2, [r4, #4]
 8000562:	68a2      	ldr	r2, [r4, #8]
 8000564:	ea22 0205 	bic.w	r2, r2, r5
 8000568:	60a2      	str	r2, [r4, #8]
 800056a:	68a2      	ldr	r2, [r4, #8]
 800056c:	40b3      	lsls	r3, r6
 800056e:	4313      	orrs	r3, r2
 8000570:	60a3      	str	r3, [r4, #8]
 8000572:	68e3      	ldr	r3, [r4, #12]
 8000574:	ea23 0305 	bic.w	r3, r3, r5
 8000578:	60e3      	str	r3, [r4, #12]
 800057a:	f89d 3014 	ldrb.w	r3, [sp, #20]
 800057e:	68e2      	ldr	r2, [r4, #12]
 8000580:	40b3      	lsls	r3, r6
 8000582:	4313      	orrs	r3, r2
 8000584:	60e3      	str	r3, [r4, #12]
 8000586:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000588:	2901      	cmp	r1, #1
 800058a:	bf08      	it	eq
 800058c:	7141      	strbeq	r1, [r0, #5]
 800058e:	e7cd      	b.n	800052c <wallet::driver::gpio::Device::Device(unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, GPIO_TypeDef*)+0x18>

08000590 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)>:
 8000590:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000592:	b089      	sub	sp, #36	@ 0x24
 8000594:	4604      	mov	r4, r0
 8000596:	460e      	mov	r6, r1
 8000598:	a804      	add	r0, sp, #16
 800059a:	f89d 103c 	ldrb.w	r1, [sp, #60]	@ 0x3c
 800059e:	461f      	mov	r7, r3
 80005a0:	f7ff ff85 	bl	80004ae <gpio_typedef(wallet::driver::gpio::Port)>
 80005a4:	f89d 3014 	ldrb.w	r3, [sp, #20]
 80005a8:	b1e3      	cbz	r3, 80005e4 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)+0x54>
 80005aa:	f89d 303d 	ldrb.w	r3, [sp, #61]	@ 0x3d
 80005ae:	2b0f      	cmp	r3, #15
 80005b0:	d906      	bls.n	80005c0 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)+0x30>
 80005b2:	2301      	movs	r3, #1
 80005b4:	7023      	strb	r3, [r4, #0]
 80005b6:	2300      	movs	r3, #0
 80005b8:	4620      	mov	r0, r4
 80005ba:	7223      	strb	r3, [r4, #8]
 80005bc:	b009      	add	sp, #36	@ 0x24
 80005be:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80005c0:	9904      	ldr	r1, [sp, #16]
 80005c2:	ad06      	add	r5, sp, #24
 80005c4:	e9cd 3101 	strd	r3, r1, [sp, #4]
 80005c8:	f89d 3038 	ldrb.w	r3, [sp, #56]	@ 0x38
 80005cc:	9300      	str	r3, [sp, #0]
 80005ce:	4631      	mov	r1, r6
 80005d0:	463b      	mov	r3, r7
 80005d2:	4628      	mov	r0, r5
 80005d4:	f7ff ff9e 	bl	8000514 <wallet::driver::gpio::Device::Device(unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, GPIO_TypeDef*)>
 80005d8:	e895 0003 	ldmia.w	r5, {r0, r1}
 80005dc:	2301      	movs	r3, #1
 80005de:	e884 0003 	stmia.w	r4, {r0, r1}
 80005e2:	e7e9      	b.n	80005b8 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)+0x28>
 80005e4:	f89d 2010 	ldrb.w	r2, [sp, #16]
 80005e8:	7022      	strb	r2, [r4, #0]
 80005ea:	e7e5      	b.n	80005b8 <wallet::driver::gpio::Device::open(wallet::driver::gpio::Mode, wallet::driver::gpio::Type, wallet::driver::gpio::Speed, wallet::driver::gpio::PullType, wallet::driver::gpio::Pin)+0x28>

080005ec <wallet::driver::gpio::Device::~Device()>:
 80005ec:	4770      	bx	lr

080005ee <wallet::driver::gpio::Device::set(bool) const>:
 80005ee:	6802      	ldr	r2, [r0, #0]
 80005f0:	b082      	sub	sp, #8
 80005f2:	b94a      	cbnz	r2, 8000608 <wallet::driver::gpio::Device::set(bool) const+0x1a>
 80005f4:	2303      	movs	r3, #3
 80005f6:	f88d 3004 	strb.w	r3, [sp, #4]
 80005fa:	4610      	mov	r0, r2
 80005fc:	f89d 3004 	ldrb.w	r3, [sp, #4]
 8000600:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 8000604:	b002      	add	sp, #8
 8000606:	4770      	bx	lr
 8000608:	7903      	ldrb	r3, [r0, #4]
 800060a:	f081 0101 	eor.w	r1, r1, #1
 800060e:	eb03 1301 	add.w	r3, r3, r1, lsl #4
 8000612:	2001      	movs	r0, #1
 8000614:	fa00 f303 	lsl.w	r3, r0, r3
 8000618:	6193      	str	r3, [r2, #24]
 800061a:	e7ef      	b.n	80005fc <wallet::driver::gpio::Device::set(bool) const+0xe>

0800061c <handle_update_interrupt(TIM_TypeDef*, void (*)())>:
 800061c:	6903      	ldr	r3, [r0, #16]
 800061e:	07db      	lsls	r3, r3, #31
 8000620:	d505      	bpl.n	800062e <handle_update_interrupt(TIM_TypeDef*, void (*)())+0x12>
 8000622:	6903      	ldr	r3, [r0, #16]
 8000624:	f023 0301 	bic.w	r3, r3, #1
 8000628:	6103      	str	r3, [r0, #16]
 800062a:	b101      	cbz	r1, 800062e <handle_update_interrupt(TIM_TypeDef*, void (*)())+0x12>
 800062c:	4708      	bx	r1
 800062e:	4770      	bx	lr

08000630 <TIM2_IRQHandler>:
 8000630:	4b02      	ldr	r3, [pc, #8]	@ (800063c <TIM2_IRQHandler+0xc>)
 8000632:	f04f 4080 	mov.w	r0, #1073741824	@ 0x40000000
 8000636:	6819      	ldr	r1, [r3, #0]
 8000638:	f7ff bff0 	b.w	800061c <handle_update_interrupt(TIM_TypeDef*, void (*)())>
 800063c:	2000002c 	.word	0x2000002c

08000640 <TIM3_IRQHandler>:
 8000640:	4b02      	ldr	r3, [pc, #8]	@ (800064c <TIM3_IRQHandler+0xc>)
 8000642:	4803      	ldr	r0, [pc, #12]	@ (8000650 <TIM3_IRQHandler+0x10>)
 8000644:	6819      	ldr	r1, [r3, #0]
 8000646:	f7ff bfe9 	b.w	800061c <handle_update_interrupt(TIM_TypeDef*, void (*)())>
 800064a:	bf00      	nop
 800064c:	20000028 	.word	0x20000028
 8000650:	40000400 	.word	0x40000400

08000654 <TIM4_IRQHandler>:
 8000654:	4b02      	ldr	r3, [pc, #8]	@ (8000660 <TIM4_IRQHandler+0xc>)
 8000656:	4803      	ldr	r0, [pc, #12]	@ (8000664 <TIM4_IRQHandler+0x10>)
 8000658:	6819      	ldr	r1, [r3, #0]
 800065a:	f7ff bfdf 	b.w	800061c <handle_update_interrupt(TIM_TypeDef*, void (*)())>
 800065e:	bf00      	nop
 8000660:	20000024 	.word	0x20000024
 8000664:	40000800 	.word	0x40000800

08000668 <TIM5_IRQHandler>:
 8000668:	4b02      	ldr	r3, [pc, #8]	@ (8000674 <TIM5_IRQHandler+0xc>)
 800066a:	4803      	ldr	r0, [pc, #12]	@ (8000678 <TIM5_IRQHandler+0x10>)
 800066c:	6819      	ldr	r1, [r3, #0]
 800066e:	f7ff bfd5 	b.w	800061c <handle_update_interrupt(TIM_TypeDef*, void (*)())>
 8000672:	bf00      	nop
 8000674:	20000020 	.word	0x20000020
 8000678:	40000c00 	.word	0x40000c00

0800067c <wallet::driver::timer::require(wallet::driver::timer::Hardware)>:
 800067c:	b082      	sub	sp, #8
 800067e:	2803      	cmp	r0, #3
 8000680:	d81e      	bhi.n	80006c0 <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x44>
 8000682:	e8df f000 	tbb	[pc, r0]
 8000686:	0e02      	.short	0x0e02
 8000688:	1813      	.short	0x1813
 800068a:	4a10      	ldr	r2, [pc, #64]	@ (80006cc <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x50>)
 800068c:	6c13      	ldr	r3, [r2, #64]	@ 0x40
 800068e:	f043 0301 	orr.w	r3, r3, #1
 8000692:	6413      	str	r3, [r2, #64]	@ 0x40
 8000694:	2301      	movs	r3, #1
 8000696:	f89d 0004 	ldrb.w	r0, [sp, #4]
 800069a:	ea40 2003 	orr.w	r0, r0, r3, lsl #8
 800069e:	b002      	add	sp, #8
 80006a0:	4770      	bx	lr
 80006a2:	4a0a      	ldr	r2, [pc, #40]	@ (80006cc <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x50>)
 80006a4:	6c13      	ldr	r3, [r2, #64]	@ 0x40
 80006a6:	f043 0302 	orr.w	r3, r3, #2
 80006aa:	e7f2      	b.n	8000692 <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x16>
 80006ac:	4a07      	ldr	r2, [pc, #28]	@ (80006cc <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x50>)
 80006ae:	6c13      	ldr	r3, [r2, #64]	@ 0x40
 80006b0:	f043 0304 	orr.w	r3, r3, #4
 80006b4:	e7ed      	b.n	8000692 <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x16>
 80006b6:	4a05      	ldr	r2, [pc, #20]	@ (80006cc <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x50>)
 80006b8:	6c13      	ldr	r3, [r2, #64]	@ 0x40
 80006ba:	f043 0308 	orr.w	r3, r3, #8
 80006be:	e7e8      	b.n	8000692 <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x16>
 80006c0:	2301      	movs	r3, #1
 80006c2:	f88d 3004 	strb.w	r3, [sp, #4]
 80006c6:	2300      	movs	r3, #0
 80006c8:	e7e5      	b.n	8000696 <wallet::driver::timer::require(wallet::driver::timer::Hardware)+0x1a>
 80006ca:	bf00      	nop
 80006cc:	40023800 	.word	0x40023800

080006d0 <wallet::driver::timer::PhysicalTimer::PhysicalTimer(TIM_TypeDef*, unsigned char, void (* volatile*)())>:
 80006d0:	b510      	push	{r4, lr}
 80006d2:	6083      	str	r3, [r0, #8]
 80006d4:	680b      	ldr	r3, [r1, #0]
 80006d6:	7102      	strb	r2, [r0, #4]
 80006d8:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
 80006dc:	600b      	str	r3, [r1, #0]
 80006de:	680b      	ldr	r3, [r1, #0]
 80006e0:	6001      	str	r1, [r0, #0]
 80006e2:	f023 0310 	bic.w	r3, r3, #16
 80006e6:	600b      	str	r3, [r1, #0]
 80006e8:	68cb      	ldr	r3, [r1, #12]
 80006ea:	f043 0301 	orr.w	r3, r3, #1
 80006ee:	60cb      	str	r3, [r1, #12]
 80006f0:	bd10      	pop	{r4, pc}

080006f2 <wallet::driver::timer::PhysicalTimer::~PhysicalTimer()>:
 80006f2:	6883      	ldr	r3, [r0, #8]
 80006f4:	b10b      	cbz	r3, 80006fa <wallet::driver::timer::PhysicalTimer::~PhysicalTimer()+0x8>
 80006f6:	2200      	movs	r2, #0
 80006f8:	601a      	str	r2, [r3, #0]
 80006fa:	4770      	bx	lr

080006fc <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)>:
 80006fc:	b530      	push	{r4, r5, lr}
 80006fe:	2903      	cmp	r1, #3
 8000700:	b085      	sub	sp, #20
 8000702:	4604      	mov	r4, r0
 8000704:	d817      	bhi.n	8000736 <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x3a>
 8000706:	4b10      	ldr	r3, [pc, #64]	@ (8000748 <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x4c>)
 8000708:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
 800070c:	681a      	ldr	r2, [r3, #0]
 800070e:	b9ca      	cbnz	r2, 8000744 <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x48>
 8000710:	4a0e      	ldr	r2, [pc, #56]	@ (800074c <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x50>)
 8000712:	ad01      	add	r5, sp, #4
 8000714:	0288      	lsls	r0, r1, #10
 8000716:	5c52      	ldrb	r2, [r2, r1]
 8000718:	f100 4180 	add.w	r1, r0, #1073741824	@ 0x40000000
 800071c:	4628      	mov	r0, r5
 800071e:	f7ff ffd7 	bl	80006d0 <wallet::driver::timer::PhysicalTimer::PhysicalTimer(TIM_TypeDef*, unsigned char, void (* volatile*)())>
 8000722:	e895 0007 	ldmia.w	r5, {r0, r1, r2}
 8000726:	2301      	movs	r3, #1
 8000728:	e884 0007 	stmia.w	r4, {r0, r1, r2}
 800072c:	7323      	strb	r3, [r4, #12]
 800072e:	4628      	mov	r0, r5
 8000730:	f7ff ffdf 	bl	80006f2 <wallet::driver::timer::PhysicalTimer::~PhysicalTimer()>
 8000734:	e003      	b.n	800073e <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x42>
 8000736:	2301      	movs	r3, #1
 8000738:	7023      	strb	r3, [r4, #0]
 800073a:	2300      	movs	r3, #0
 800073c:	7323      	strb	r3, [r4, #12]
 800073e:	4620      	mov	r0, r4
 8000740:	b005      	add	sp, #20
 8000742:	bd30      	pop	{r4, r5, pc}
 8000744:	2305      	movs	r3, #5
 8000746:	e7f7      	b.n	8000738 <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)+0x3c>
 8000748:	08000bdc 	.word	0x08000bdc
 800074c:	08000bd8 	.word	0x08000bd8

08000750 <wallet::driver::timer::PhysicalTimer::handle(void (*)()) const>:
 8000750:	6880      	ldr	r0, [r0, #8]
 8000752:	b082      	sub	sp, #8
 8000754:	b940      	cbnz	r0, 8000768 <wallet::driver::timer::PhysicalTimer::handle(void (*)()) const+0x18>
 8000756:	2303      	movs	r3, #3
 8000758:	f88d 3004 	strb.w	r3, [sp, #4]
 800075c:	f89d 3004 	ldrb.w	r3, [sp, #4]
 8000760:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 8000764:	b002      	add	sp, #8
 8000766:	4770      	bx	lr
 8000768:	6001      	str	r1, [r0, #0]
 800076a:	2001      	movs	r0, #1
 800076c:	e7f6      	b.n	800075c <wallet::driver::timer::PhysicalTimer::handle(void (*)()) const+0xc>

0800076e <wallet::driver::timer::PhysicalTimer::interval(std::chrono::duration<long long, std::ratio<1ll, 1000000000ll> >) const>:
 800076e:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 8000772:	4604      	mov	r4, r0
 8000774:	4619      	mov	r1, r3
 8000776:	4610      	mov	r0, r2
 8000778:	2300      	movs	r3, #0
 800077a:	220a      	movs	r2, #10
 800077c:	f7ff fd1c 	bl	80001b8 <__aeabi_ldivmod>
 8000780:	7926      	ldrb	r6, [r4, #4]
 8000782:	f04f 35ff 	mov.w	r5, #4294967295	@ 0xffffffff
 8000786:	2200      	movs	r2, #0
 8000788:	40b5      	lsls	r5, r6
 800078a:	4613      	mov	r3, r2
 800078c:	17ee      	asrs	r6, r5, #31
 800078e:	ea05 0700 	and.w	r7, r5, r0
 8000792:	ea06 0c01 	and.w	ip, r6, r1
 8000796:	ea57 070c 	orrs.w	r7, r7, ip
 800079a:	d115      	bne.n	80007c8 <wallet::driver::timer::PhysicalTimer::interval(std::chrono::duration<long long, std::ratio<1ll, 1000000000ll> >) const+0x5a>
 800079c:	f5b2 3f80 	cmp.w	r2, #65536	@ 0x10000
 80007a0:	f173 0300 	sbcs.w	r3, r3, #0
 80007a4:	bf33      	iteet	cc
 80007a6:	6823      	ldrcc	r3, [r4, #0]
 80007a8:	2304      	movcs	r3, #4
 80007aa:	f88d 3004 	strbcs.w	r3, [sp, #4]
 80007ae:	629a      	strcc	r2, [r3, #40]	@ 0x28
 80007b0:	bf38      	it	cc
 80007b2:	62d8      	strcc	r0, [r3, #44]	@ 0x2c
 80007b4:	f89d 0004 	ldrb.w	r0, [sp, #4]
 80007b8:	bf2c      	ite	cs
 80007ba:	2300      	movcs	r3, #0
 80007bc:	2301      	movcc	r3, #1
 80007be:	ea40 2003 	orr.w	r0, r0, r3, lsl #8
 80007c2:	b002      	add	sp, #8
 80007c4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80007c8:	f112 0801 	adds.w	r8, r2, #1
 80007cc:	f143 0700 	adc.w	r7, r3, #0
 80007d0:	3202      	adds	r2, #2
 80007d2:	f143 0300 	adc.w	r3, r3, #0
 80007d6:	f7ff fd3f 	bl	8000258 <__aeabi_uldivmod>
 80007da:	4642      	mov	r2, r8
 80007dc:	463b      	mov	r3, r7
 80007de:	e7d6      	b.n	800078e <wallet::driver::timer::PhysicalTimer::interval(std::chrono::duration<long long, std::ratio<1ll, 1000000000ll> >) const+0x20>

080007e0 <wallet::driver::timer::PhysicalTimer::start() const>:
 80007e0:	b082      	sub	sp, #8
 80007e2:	6802      	ldr	r2, [r0, #0]
 80007e4:	f89d 0004 	ldrb.w	r0, [sp, #4]
 80007e8:	6813      	ldr	r3, [r2, #0]
 80007ea:	f440 7080 	orr.w	r0, r0, #256	@ 0x100
 80007ee:	f043 0301 	orr.w	r3, r3, #1
 80007f2:	6013      	str	r3, [r2, #0]
 80007f4:	b002      	add	sp, #8
 80007f6:	4770      	bx	lr

080007f8 <main>:
 80007f8:	b500      	push	{lr}
 80007fa:	2003      	movs	r0, #3
 80007fc:	b091      	sub	sp, #68	@ 0x44
 80007fe:	f7ff ff3d 	bl	800067c <wallet::driver::timer::require(wallet::driver::timer::Hardware)>
 8000802:	f410 4f7f 	tst.w	r0, #65280	@ 0xff00
 8000806:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
 800080a:	d041      	beq.n	8000890 <main+0x98>
 800080c:	2000      	movs	r0, #0
 800080e:	f7ff fe5d 	bl	80004cc <wallet::driver::gpio::require(wallet::driver::gpio::Port)>
 8000812:	f410 4f7f 	tst.w	r0, #65280	@ 0xff00
 8000816:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
 800081a:	d039      	beq.n	8000890 <main+0x98>
 800081c:	2103      	movs	r1, #3
 800081e:	a803      	add	r0, sp, #12
 8000820:	f7ff ff6c 	bl	80006fc <wallet::driver::timer::PhysicalTimer::open(wallet::driver::timer::Hardware)>
 8000824:	f89d 3018 	ldrb.w	r3, [sp, #24]
 8000828:	b393      	cbz	r3, 8000890 <main+0x98>
 800082a:	f44f 7340 	mov.w	r3, #768	@ 0x300
 800082e:	f8ad 3008 	strh.w	r3, [sp, #8]
 8000832:	9a02      	ldr	r2, [sp, #8]
 8000834:	a903      	add	r1, sp, #12
 8000836:	a80b      	add	r0, sp, #44	@ 0x2c
 8000838:	f7ff fdc0 	bl	80003bc <wallet::driver::buzzer::Passive::open(wallet::driver::timer::PhysicalTimer const&, wallet::driver::gpio::Pin)>
 800083c:	f89d 303c 	ldrb.w	r3, [sp, #60]	@ 0x3c
 8000840:	b303      	cbz	r3, 8000884 <main+0x8c>
 8000842:	a90b      	add	r1, sp, #44	@ 0x2c
 8000844:	a807      	add	r0, sp, #28
 8000846:	f7ff fd91 	bl	800036c <wallet::driver::buzzer::Passive::Passive(wallet::driver::buzzer::Passive&&)>
 800084a:	f44f 71dc 	mov.w	r1, #440	@ 0x1b8
 800084e:	a807      	add	r0, sp, #28
 8000850:	f7ff fe0c 	bl	800046c <wallet::driver::buzzer::Passive::frequency(unsigned long) const>
 8000854:	f410 4f7f 	tst.w	r0, #65280	@ 0xff00
 8000858:	f8ad 0004 	strh.w	r0, [sp, #4]
 800085c:	d009      	beq.n	8000872 <main+0x7a>
 800085e:	a807      	add	r0, sp, #28
 8000860:	f7ff fe20 	bl	80004a4 <wallet::driver::buzzer::Passive::start() const>
 8000864:	f410 4f7f 	tst.w	r0, #65280	@ 0xff00
 8000868:	f8ad 0004 	strh.w	r0, [sp, #4]
 800086c:	d001      	beq.n	8000872 <main+0x7a>
 800086e:	bf00      	nop
 8000870:	e7fd      	b.n	800086e <main+0x76>
 8000872:	a807      	add	r0, sp, #28
 8000874:	f7ff fd90 	bl	8000398 <wallet::driver::buzzer::Passive::~Passive()>
 8000878:	f89d 303c 	ldrb.w	r3, [sp, #60]	@ 0x3c
 800087c:	b113      	cbz	r3, 8000884 <main+0x8c>
 800087e:	a80b      	add	r0, sp, #44	@ 0x2c
 8000880:	f7ff fd8a 	bl	8000398 <wallet::driver::buzzer::Passive::~Passive()>
 8000884:	f89d 3018 	ldrb.w	r3, [sp, #24]
 8000888:	b113      	cbz	r3, 8000890 <main+0x98>
 800088a:	a803      	add	r0, sp, #12
 800088c:	f7ff ff31 	bl	80006f2 <wallet::driver::timer::PhysicalTimer::~PhysicalTimer()>
 8000890:	2001      	movs	r0, #1
 8000892:	b011      	add	sp, #68	@ 0x44
 8000894:	f85d fb04 	ldr.w	pc, [sp], #4

08000898 <__udivmoddi4>:
 8000898:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800089c:	9d08      	ldr	r5, [sp, #32]
 800089e:	460f      	mov	r7, r1
 80008a0:	4604      	mov	r4, r0
 80008a2:	468c      	mov	ip, r1
 80008a4:	2b00      	cmp	r3, #0
 80008a6:	d148      	bne.n	800093a <__udivmoddi4+0xa2>
 80008a8:	428a      	cmp	r2, r1
 80008aa:	4616      	mov	r6, r2
 80008ac:	d961      	bls.n	8000972 <__udivmoddi4+0xda>
 80008ae:	fab2 f382 	clz	r3, r2
 80008b2:	b14b      	cbz	r3, 80008c8 <__udivmoddi4+0x30>
 80008b4:	f1c3 0220 	rsb	r2, r3, #32
 80008b8:	fa01 fc03 	lsl.w	ip, r1, r3
 80008bc:	fa20 f202 	lsr.w	r2, r0, r2
 80008c0:	409e      	lsls	r6, r3
 80008c2:	ea42 0c0c 	orr.w	ip, r2, ip
 80008c6:	409c      	lsls	r4, r3
 80008c8:	ea4f 4e16 	mov.w	lr, r6, lsr #16
 80008cc:	b2b7      	uxth	r7, r6
 80008ce:	fbbc f1fe 	udiv	r1, ip, lr
 80008d2:	0c22      	lsrs	r2, r4, #16
 80008d4:	fb0e cc11 	mls	ip, lr, r1, ip
 80008d8:	ea42 420c 	orr.w	r2, r2, ip, lsl #16
 80008dc:	fb01 f007 	mul.w	r0, r1, r7
 80008e0:	4290      	cmp	r0, r2
 80008e2:	d909      	bls.n	80008f8 <__udivmoddi4+0x60>
 80008e4:	18b2      	adds	r2, r6, r2
 80008e6:	f101 3cff 	add.w	ip, r1, #4294967295	@ 0xffffffff
 80008ea:	f080 80ee 	bcs.w	8000aca <__udivmoddi4+0x232>
 80008ee:	4290      	cmp	r0, r2
 80008f0:	f240 80eb 	bls.w	8000aca <__udivmoddi4+0x232>
 80008f4:	3902      	subs	r1, #2
 80008f6:	4432      	add	r2, r6
 80008f8:	1a12      	subs	r2, r2, r0
 80008fa:	b2a4      	uxth	r4, r4
 80008fc:	fbb2 f0fe 	udiv	r0, r2, lr
 8000900:	fb0e 2210 	mls	r2, lr, r0, r2
 8000904:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
 8000908:	fb00 f707 	mul.w	r7, r0, r7
 800090c:	42a7      	cmp	r7, r4
 800090e:	d909      	bls.n	8000924 <__udivmoddi4+0x8c>
 8000910:	1934      	adds	r4, r6, r4
 8000912:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
 8000916:	f080 80da 	bcs.w	8000ace <__udivmoddi4+0x236>
 800091a:	42a7      	cmp	r7, r4
 800091c:	f240 80d7 	bls.w	8000ace <__udivmoddi4+0x236>
 8000920:	4434      	add	r4, r6
 8000922:	3802      	subs	r0, #2
 8000924:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
 8000928:	1be4      	subs	r4, r4, r7
 800092a:	2100      	movs	r1, #0
 800092c:	b11d      	cbz	r5, 8000936 <__udivmoddi4+0x9e>
 800092e:	40dc      	lsrs	r4, r3
 8000930:	2300      	movs	r3, #0
 8000932:	e9c5 4300 	strd	r4, r3, [r5]
 8000936:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800093a:	428b      	cmp	r3, r1
 800093c:	d906      	bls.n	800094c <__udivmoddi4+0xb4>
 800093e:	b10d      	cbz	r5, 8000944 <__udivmoddi4+0xac>
 8000940:	e9c5 0100 	strd	r0, r1, [r5]
 8000944:	2100      	movs	r1, #0
 8000946:	4608      	mov	r0, r1
 8000948:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800094c:	fab3 f183 	clz	r1, r3
 8000950:	2900      	cmp	r1, #0
 8000952:	d148      	bne.n	80009e6 <__udivmoddi4+0x14e>
 8000954:	42bb      	cmp	r3, r7
 8000956:	d302      	bcc.n	800095e <__udivmoddi4+0xc6>
 8000958:	4282      	cmp	r2, r0
 800095a:	f200 8107 	bhi.w	8000b6c <__udivmoddi4+0x2d4>
 800095e:	1a84      	subs	r4, r0, r2
 8000960:	eb67 0203 	sbc.w	r2, r7, r3
 8000964:	2001      	movs	r0, #1
 8000966:	4694      	mov	ip, r2
 8000968:	2d00      	cmp	r5, #0
 800096a:	d0e4      	beq.n	8000936 <__udivmoddi4+0x9e>
 800096c:	e9c5 4c00 	strd	r4, ip, [r5]
 8000970:	e7e1      	b.n	8000936 <__udivmoddi4+0x9e>
 8000972:	2a00      	cmp	r2, #0
 8000974:	f000 8092 	beq.w	8000a9c <__udivmoddi4+0x204>
 8000978:	fab2 f382 	clz	r3, r2
 800097c:	2b00      	cmp	r3, #0
 800097e:	f040 80a8 	bne.w	8000ad2 <__udivmoddi4+0x23a>
 8000982:	1a8a      	subs	r2, r1, r2
 8000984:	ea4f 4e16 	mov.w	lr, r6, lsr #16
 8000988:	fa1f fc86 	uxth.w	ip, r6
 800098c:	2101      	movs	r1, #1
 800098e:	0c20      	lsrs	r0, r4, #16
 8000990:	fbb2 f7fe 	udiv	r7, r2, lr
 8000994:	fb0e 2217 	mls	r2, lr, r7, r2
 8000998:	ea40 4202 	orr.w	r2, r0, r2, lsl #16
 800099c:	fb0c f007 	mul.w	r0, ip, r7
 80009a0:	4290      	cmp	r0, r2
 80009a2:	d907      	bls.n	80009b4 <__udivmoddi4+0x11c>
 80009a4:	18b2      	adds	r2, r6, r2
 80009a6:	f107 38ff 	add.w	r8, r7, #4294967295	@ 0xffffffff
 80009aa:	d202      	bcs.n	80009b2 <__udivmoddi4+0x11a>
 80009ac:	4290      	cmp	r0, r2
 80009ae:	f200 80e2 	bhi.w	8000b76 <__udivmoddi4+0x2de>
 80009b2:	4647      	mov	r7, r8
 80009b4:	1a12      	subs	r2, r2, r0
 80009b6:	b2a4      	uxth	r4, r4
 80009b8:	fbb2 f0fe 	udiv	r0, r2, lr
 80009bc:	fb0e 2210 	mls	r2, lr, r0, r2
 80009c0:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
 80009c4:	fb0c fc00 	mul.w	ip, ip, r0
 80009c8:	45a4      	cmp	ip, r4
 80009ca:	d907      	bls.n	80009dc <__udivmoddi4+0x144>
 80009cc:	1934      	adds	r4, r6, r4
 80009ce:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
 80009d2:	d202      	bcs.n	80009da <__udivmoddi4+0x142>
 80009d4:	45a4      	cmp	ip, r4
 80009d6:	f200 80cb 	bhi.w	8000b70 <__udivmoddi4+0x2d8>
 80009da:	4610      	mov	r0, r2
 80009dc:	eba4 040c 	sub.w	r4, r4, ip
 80009e0:	ea40 4007 	orr.w	r0, r0, r7, lsl #16
 80009e4:	e7a2      	b.n	800092c <__udivmoddi4+0x94>
 80009e6:	f1c1 0620 	rsb	r6, r1, #32
 80009ea:	408b      	lsls	r3, r1
 80009ec:	fa22 fc06 	lsr.w	ip, r2, r6
 80009f0:	ea4c 0c03 	orr.w	ip, ip, r3
 80009f4:	fa07 f401 	lsl.w	r4, r7, r1
 80009f8:	fa20 f306 	lsr.w	r3, r0, r6
 80009fc:	40f7      	lsrs	r7, r6
 80009fe:	ea4f 491c 	mov.w	r9, ip, lsr #16
 8000a02:	4323      	orrs	r3, r4
 8000a04:	fa00 f801 	lsl.w	r8, r0, r1
 8000a08:	fa1f fe8c 	uxth.w	lr, ip
 8000a0c:	fbb7 f0f9 	udiv	r0, r7, r9
 8000a10:	0c1c      	lsrs	r4, r3, #16
 8000a12:	fb09 7710 	mls	r7, r9, r0, r7
 8000a16:	ea44 4407 	orr.w	r4, r4, r7, lsl #16
 8000a1a:	fb00 f70e 	mul.w	r7, r0, lr
 8000a1e:	42a7      	cmp	r7, r4
 8000a20:	fa02 f201 	lsl.w	r2, r2, r1
 8000a24:	d90a      	bls.n	8000a3c <__udivmoddi4+0x1a4>
 8000a26:	eb1c 0404 	adds.w	r4, ip, r4
 8000a2a:	f100 3aff 	add.w	sl, r0, #4294967295	@ 0xffffffff
 8000a2e:	f080 809b 	bcs.w	8000b68 <__udivmoddi4+0x2d0>
 8000a32:	42a7      	cmp	r7, r4
 8000a34:	f240 8098 	bls.w	8000b68 <__udivmoddi4+0x2d0>
 8000a38:	3802      	subs	r0, #2
 8000a3a:	4464      	add	r4, ip
 8000a3c:	1be4      	subs	r4, r4, r7
 8000a3e:	b29f      	uxth	r7, r3
 8000a40:	fbb4 f3f9 	udiv	r3, r4, r9
 8000a44:	fb09 4413 	mls	r4, r9, r3, r4
 8000a48:	ea47 4404 	orr.w	r4, r7, r4, lsl #16
 8000a4c:	fb03 fe0e 	mul.w	lr, r3, lr
 8000a50:	45a6      	cmp	lr, r4
 8000a52:	d909      	bls.n	8000a68 <__udivmoddi4+0x1d0>
 8000a54:	eb1c 0404 	adds.w	r4, ip, r4
 8000a58:	f103 37ff 	add.w	r7, r3, #4294967295	@ 0xffffffff
 8000a5c:	f080 8082 	bcs.w	8000b64 <__udivmoddi4+0x2cc>
 8000a60:	45a6      	cmp	lr, r4
 8000a62:	d97f      	bls.n	8000b64 <__udivmoddi4+0x2cc>
 8000a64:	3b02      	subs	r3, #2
 8000a66:	4464      	add	r4, ip
 8000a68:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
 8000a6c:	eba4 040e 	sub.w	r4, r4, lr
 8000a70:	fba0 e702 	umull	lr, r7, r0, r2
 8000a74:	42bc      	cmp	r4, r7
 8000a76:	4673      	mov	r3, lr
 8000a78:	46b9      	mov	r9, r7
 8000a7a:	d363      	bcc.n	8000b44 <__udivmoddi4+0x2ac>
 8000a7c:	d060      	beq.n	8000b40 <__udivmoddi4+0x2a8>
 8000a7e:	b15d      	cbz	r5, 8000a98 <__udivmoddi4+0x200>
 8000a80:	ebb8 0203 	subs.w	r2, r8, r3
 8000a84:	eb64 0409 	sbc.w	r4, r4, r9
 8000a88:	fa04 f606 	lsl.w	r6, r4, r6
 8000a8c:	fa22 f301 	lsr.w	r3, r2, r1
 8000a90:	431e      	orrs	r6, r3
 8000a92:	40cc      	lsrs	r4, r1
 8000a94:	e9c5 6400 	strd	r6, r4, [r5]
 8000a98:	2100      	movs	r1, #0
 8000a9a:	e74c      	b.n	8000936 <__udivmoddi4+0x9e>
 8000a9c:	0862      	lsrs	r2, r4, #1
 8000a9e:	0848      	lsrs	r0, r1, #1
 8000aa0:	ea42 71c1 	orr.w	r1, r2, r1, lsl #31
 8000aa4:	0c0b      	lsrs	r3, r1, #16
 8000aa6:	ea43 4300 	orr.w	r3, r3, r0, lsl #16
 8000aaa:	b28a      	uxth	r2, r1
 8000aac:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
 8000ab0:	fbb3 f1f6 	udiv	r1, r3, r6
 8000ab4:	07e4      	lsls	r4, r4, #31
 8000ab6:	46b4      	mov	ip, r6
 8000ab8:	4637      	mov	r7, r6
 8000aba:	46b6      	mov	lr, r6
 8000abc:	231f      	movs	r3, #31
 8000abe:	fbb0 f0f6 	udiv	r0, r0, r6
 8000ac2:	1bd2      	subs	r2, r2, r7
 8000ac4:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
 8000ac8:	e761      	b.n	800098e <__udivmoddi4+0xf6>
 8000aca:	4661      	mov	r1, ip
 8000acc:	e714      	b.n	80008f8 <__udivmoddi4+0x60>
 8000ace:	4610      	mov	r0, r2
 8000ad0:	e728      	b.n	8000924 <__udivmoddi4+0x8c>
 8000ad2:	f1c3 0120 	rsb	r1, r3, #32
 8000ad6:	fa20 f201 	lsr.w	r2, r0, r1
 8000ada:	409e      	lsls	r6, r3
 8000adc:	fa27 f101 	lsr.w	r1, r7, r1
 8000ae0:	409f      	lsls	r7, r3
 8000ae2:	433a      	orrs	r2, r7
 8000ae4:	ea4f 4e16 	mov.w	lr, r6, lsr #16
 8000ae8:	fa1f fc86 	uxth.w	ip, r6
 8000aec:	fbb1 f7fe 	udiv	r7, r1, lr
 8000af0:	fb0e 1017 	mls	r0, lr, r7, r1
 8000af4:	0c11      	lsrs	r1, r2, #16
 8000af6:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
 8000afa:	fb07 f80c 	mul.w	r8, r7, ip
 8000afe:	4588      	cmp	r8, r1
 8000b00:	fa04 f403 	lsl.w	r4, r4, r3
 8000b04:	d93a      	bls.n	8000b7c <__udivmoddi4+0x2e4>
 8000b06:	1871      	adds	r1, r6, r1
 8000b08:	f107 30ff 	add.w	r0, r7, #4294967295	@ 0xffffffff
 8000b0c:	d201      	bcs.n	8000b12 <__udivmoddi4+0x27a>
 8000b0e:	4588      	cmp	r8, r1
 8000b10:	d81f      	bhi.n	8000b52 <__udivmoddi4+0x2ba>
 8000b12:	eba1 0108 	sub.w	r1, r1, r8
 8000b16:	fbb1 f8fe 	udiv	r8, r1, lr
 8000b1a:	fb08 f70c 	mul.w	r7, r8, ip
 8000b1e:	fb0e 1118 	mls	r1, lr, r8, r1
 8000b22:	b292      	uxth	r2, r2
 8000b24:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
 8000b28:	42ba      	cmp	r2, r7
 8000b2a:	d22f      	bcs.n	8000b8c <__udivmoddi4+0x2f4>
 8000b2c:	18b2      	adds	r2, r6, r2
 8000b2e:	f108 31ff 	add.w	r1, r8, #4294967295	@ 0xffffffff
 8000b32:	d2c6      	bcs.n	8000ac2 <__udivmoddi4+0x22a>
 8000b34:	42ba      	cmp	r2, r7
 8000b36:	d2c4      	bcs.n	8000ac2 <__udivmoddi4+0x22a>
 8000b38:	f1a8 0102 	sub.w	r1, r8, #2
 8000b3c:	4432      	add	r2, r6
 8000b3e:	e7c0      	b.n	8000ac2 <__udivmoddi4+0x22a>
 8000b40:	45f0      	cmp	r8, lr
 8000b42:	d29c      	bcs.n	8000a7e <__udivmoddi4+0x1e6>
 8000b44:	ebbe 0302 	subs.w	r3, lr, r2
 8000b48:	eb67 070c 	sbc.w	r7, r7, ip
 8000b4c:	3801      	subs	r0, #1
 8000b4e:	46b9      	mov	r9, r7
 8000b50:	e795      	b.n	8000a7e <__udivmoddi4+0x1e6>
 8000b52:	eba6 0808 	sub.w	r8, r6, r8
 8000b56:	4441      	add	r1, r8
 8000b58:	1eb8      	subs	r0, r7, #2
 8000b5a:	fbb1 f8fe 	udiv	r8, r1, lr
 8000b5e:	fb08 f70c 	mul.w	r7, r8, ip
 8000b62:	e7dc      	b.n	8000b1e <__udivmoddi4+0x286>
 8000b64:	463b      	mov	r3, r7
 8000b66:	e77f      	b.n	8000a68 <__udivmoddi4+0x1d0>
 8000b68:	4650      	mov	r0, sl
 8000b6a:	e767      	b.n	8000a3c <__udivmoddi4+0x1a4>
 8000b6c:	4608      	mov	r0, r1
 8000b6e:	e6fb      	b.n	8000968 <__udivmoddi4+0xd0>
 8000b70:	4434      	add	r4, r6
 8000b72:	3802      	subs	r0, #2
 8000b74:	e732      	b.n	80009dc <__udivmoddi4+0x144>
 8000b76:	3f02      	subs	r7, #2
 8000b78:	4432      	add	r2, r6
 8000b7a:	e71b      	b.n	80009b4 <__udivmoddi4+0x11c>
 8000b7c:	eba1 0108 	sub.w	r1, r1, r8
 8000b80:	4638      	mov	r0, r7
 8000b82:	fbb1 f8fe 	udiv	r8, r1, lr
 8000b86:	fb08 f70c 	mul.w	r7, r8, ip
 8000b8a:	e7c8      	b.n	8000b1e <__udivmoddi4+0x286>
 8000b8c:	4641      	mov	r1, r8
 8000b8e:	e798      	b.n	8000ac2 <__udivmoddi4+0x22a>

08000b90 <__libc_init_array>:
 8000b90:	b570      	push	{r4, r5, r6, lr}
 8000b92:	4b0d      	ldr	r3, [pc, #52]	@ (8000bc8 <__libc_init_array+0x38>)
 8000b94:	4d0d      	ldr	r5, [pc, #52]	@ (8000bcc <__libc_init_array+0x3c>)
 8000b96:	1b5b      	subs	r3, r3, r5
 8000b98:	109c      	asrs	r4, r3, #2
 8000b9a:	2600      	movs	r6, #0
 8000b9c:	42a6      	cmp	r6, r4
 8000b9e:	d109      	bne.n	8000bb4 <__libc_init_array+0x24>
 8000ba0:	f7ff fafe 	bl	80001a0 <_init>
 8000ba4:	4d0a      	ldr	r5, [pc, #40]	@ (8000bd0 <__libc_init_array+0x40>)
 8000ba6:	4b0b      	ldr	r3, [pc, #44]	@ (8000bd4 <__libc_init_array+0x44>)
 8000ba8:	1b5b      	subs	r3, r3, r5
 8000baa:	109c      	asrs	r4, r3, #2
 8000bac:	2600      	movs	r6, #0
 8000bae:	42a6      	cmp	r6, r4
 8000bb0:	d105      	bne.n	8000bbe <__libc_init_array+0x2e>
 8000bb2:	bd70      	pop	{r4, r5, r6, pc}
 8000bb4:	f855 3b04 	ldr.w	r3, [r5], #4
 8000bb8:	4798      	blx	r3
 8000bba:	3601      	adds	r6, #1
 8000bbc:	e7ee      	b.n	8000b9c <__libc_init_array+0xc>
 8000bbe:	f855 3b04 	ldr.w	r3, [r5], #4
 8000bc2:	4798      	blx	r3
 8000bc4:	3601      	adds	r6, #1
 8000bc6:	e7f2      	b.n	8000bae <__libc_init_array+0x1e>
	...
 8000bd0:	08000bec 	.word	0x08000bec
 8000bd4:	08000bf0 	.word	0x08000bf0

08000bd8 <CSWTCH.47>:
 8000bd8:	20101020                                 .. 

08000bdc <CSWTCH.46>:
 8000bdc:	2000002c 20000028 20000024 20000020     ,.. (.. $..  .. 
