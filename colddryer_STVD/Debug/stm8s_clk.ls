   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  18                     .const:	section	.text
  19  0000               _HSIDivFactor:
  20  0000 01            	dc.b	1
  21  0001 02            	dc.b	2
  22  0002 04            	dc.b	4
  23  0003 08            	dc.b	8
  24  0004               _CLKPrescTable:
  25  0004 01            	dc.b	1
  26  0005 02            	dc.b	2
  27  0006 04            	dc.b	4
  28  0007 08            	dc.b	8
  29  0008 0a            	dc.b	10
  30  0009 10            	dc.b	16
  31  000a 14            	dc.b	20
  32  000b 28            	dc.b	40
  61                     ; 72 void CLK_DeInit(void)
  61                     ; 73 {
  63                     .text:	section	.text,new
  64  0000               _CLK_DeInit:
  68                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  70  0000 350150c0      	mov	20672,#1
  71                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  73  0004 725f50c1      	clr	20673
  74                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  76  0008 35e150c4      	mov	20676,#225
  77                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  79  000c 725f50c5      	clr	20677
  80                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  82  0010 351850c6      	mov	20678,#24
  83                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  85  0014 35ff50c7      	mov	20679,#255
  86                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  88  0018 35ff50ca      	mov	20682,#255
  89                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  91  001c 725f50c8      	clr	20680
  92                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  94  0020 725f50c9      	clr	20681
  96  0024               L52:
  97                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  99  0024 720050c9fb    	btjt	20681,#0,L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  0029 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002d 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0031 725f50cd      	clr	20685
 109                     ; 88 }
 112  0035 81            	ret	
 168                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 100 {
 169                     .text:	section	.text,new
 170  0000               _CLK_FastHaltWakeUpCmd:
 174                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 104   if (NewState != DISABLE)
 178  0000 4d            	tnz	a
 179  0001 2705          	jreq	L75
 180                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 182  0003 721450c0      	bset	20672,#2
 185  0007 81            	ret	
 186  0008               L75:
 187                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  0008 721550c0      	bres	20672,#2
 190                     ; 114 }
 193  000c 81            	ret	
 228                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 122 {
 229                     .text:	section	.text,new
 230  0000               _CLK_HSECmd:
 234                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 126   if (NewState != DISABLE)
 238  0000 4d            	tnz	a
 239  0001 2705          	jreq	L101
 240                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0003 721050c1      	bset	20673,#0
 245  0007 81            	ret	
 246  0008               L101:
 247                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  0008 721150c1      	bres	20673,#0
 250                     ; 136 }
 253  000c 81            	ret	
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     .text:	section	.text,new
 290  0000               _CLK_HSICmd:
 294                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 148   if (NewState != DISABLE)
 298  0000 4d            	tnz	a
 299  0001 2705          	jreq	L321
 300                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0003 721050c0      	bset	20672,#0
 305  0007 81            	ret	
 306  0008               L321:
 307                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  0008 721150c0      	bres	20672,#0
 310                     ; 158 }
 313  000c 81            	ret	
 348                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 167 {
 349                     .text:	section	.text,new
 350  0000               _CLK_LSICmd:
 354                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 171   if (NewState != DISABLE)
 358  0000 4d            	tnz	a
 359  0001 2705          	jreq	L541
 360                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0003 721650c0      	bset	20672,#3
 365  0007 81            	ret	
 366  0008               L541:
 367                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  0008 721750c0      	bres	20672,#3
 370                     ; 181 }
 373  000c 81            	ret	
 408                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 190 {
 409                     .text:	section	.text,new
 410  0000               _CLK_CCOCmd:
 414                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 194   if (NewState != DISABLE)
 418  0000 4d            	tnz	a
 419  0001 2705          	jreq	L761
 420                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 422  0003 721050c9      	bset	20681,#0
 425  0007 81            	ret	
 426  0008               L761:
 427                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  0008 721150c9      	bres	20681,#0
 430                     ; 204 }
 433  000c 81            	ret	
 468                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 214 {
 469                     .text:	section	.text,new
 470  0000               _CLK_ClockSwitchCmd:
 474                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 218   if (NewState != DISABLE )
 478  0000 4d            	tnz	a
 479  0001 2705          	jreq	L112
 480                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 482  0003 721250c5      	bset	20677,#1
 485  0007 81            	ret	
 486  0008               L112:
 487                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  0008 721350c5      	bres	20677,#1
 490                     ; 228 }
 493  000c 81            	ret	
 529                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 239 {
 530                     .text:	section	.text,new
 531  0000               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 243   if (NewState != DISABLE)
 539  0000 4d            	tnz	a
 540  0001 2705          	jreq	L332
 541                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 543  0003 721a50c0      	bset	20672,#5
 546  0007 81            	ret	
 547  0008               L332:
 548                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  0008 721b50c0      	bres	20672,#5
 551                     ; 253 }
 554  000c 81            	ret	
 713                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 264 {
 714                     .text:	section	.text,new
 715  0000               _CLK_PeripheralClockConfig:
 717  0000 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  0001 9e            	ld	a,xh
 728  0002 a510          	bcp	a,#16
 729  0004 2630          	jrne	L123
 730                     ; 271     if (NewState != DISABLE)
 732  0006 7b02          	ld	a,(OFST+2,sp)
 733  0008 2714          	jreq	L323
 734                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  000a 7b01          	ld	a,(OFST+1,sp)
 737  000c a40f          	and	a,#15
 738  000e 5f            	clrw	x
 739  000f 97            	ld	xl,a
 740  0010 a601          	ld	a,#1
 741  0012 5d            	tnzw	x
 742  0013 2704          	jreq	L62
 743  0015               L03:
 744  0015 48            	sll	a
 745  0016 5a            	decw	x
 746  0017 26fc          	jrne	L03
 747  0019               L62:
 748  0019 ca50c7        	or	a,20679
 750  001c 2013          	jp	LC002
 751  001e               L323:
 752                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  001e 7b01          	ld	a,(OFST+1,sp)
 755  0020 a40f          	and	a,#15
 756  0022 5f            	clrw	x
 757  0023 97            	ld	xl,a
 758  0024 a601          	ld	a,#1
 759  0026 5d            	tnzw	x
 760  0027 2704          	jreq	L23
 761  0029               L43:
 762  0029 48            	sll	a
 763  002a 5a            	decw	x
 764  002b 26fc          	jrne	L43
 765  002d               L23:
 766  002d 43            	cpl	a
 767  002e c450c7        	and	a,20679
 768  0031               LC002:
 769  0031 c750c7        	ld	20679,a
 770  0034 202e          	jra	L723
 771  0036               L123:
 772                     ; 284     if (NewState != DISABLE)
 774  0036 7b02          	ld	a,(OFST+2,sp)
 775  0038 2714          	jreq	L133
 776                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  003a 7b01          	ld	a,(OFST+1,sp)
 779  003c a40f          	and	a,#15
 780  003e 5f            	clrw	x
 781  003f 97            	ld	xl,a
 782  0040 a601          	ld	a,#1
 783  0042 5d            	tnzw	x
 784  0043 2704          	jreq	L63
 785  0045               L04:
 786  0045 48            	sll	a
 787  0046 5a            	decw	x
 788  0047 26fc          	jrne	L04
 789  0049               L63:
 790  0049 ca50ca        	or	a,20682
 792  004c 2013          	jp	LC001
 793  004e               L133:
 794                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  004e 7b01          	ld	a,(OFST+1,sp)
 797  0050 a40f          	and	a,#15
 798  0052 5f            	clrw	x
 799  0053 97            	ld	xl,a
 800  0054 a601          	ld	a,#1
 801  0056 5d            	tnzw	x
 802  0057 2704          	jreq	L24
 803  0059               L44:
 804  0059 48            	sll	a
 805  005a 5a            	decw	x
 806  005b 26fc          	jrne	L44
 807  005d               L24:
 808  005d 43            	cpl	a
 809  005e c450ca        	and	a,20682
 810  0061               LC001:
 811  0061 c750ca        	ld	20682,a
 812  0064               L723:
 813                     ; 295 }
 816  0064 85            	popw	x
 817  0065 81            	ret	
1005                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 310 {
1006                     .text:	section	.text,new
1007  0000               _CLK_ClockSwitchConfig:
1009  0000 89            	pushw	x
1010  0001 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1016  0003 aeffff        	ldw	x,#65535
1017  0006 1f03          	ldw	(OFST-1,sp),x
1019                     ; 313   ErrorStatus Swif = ERROR;
1021                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  0008 c650c3        	ld	a,20675
1032  000b 6b01          	ld	(OFST-3,sp),a
1034                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1036  000d 7b05          	ld	a,(OFST+1,sp)
1037  000f 4a            	dec	a
1038  0010 263d          	jrne	L544
1039                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1041  0012 721250c5      	bset	20677,#1
1042                     ; 331     if (ITState != DISABLE)
1044  0016 7b09          	ld	a,(OFST+5,sp)
1045  0018 2706          	jreq	L744
1046                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1048  001a 721450c5      	bset	20677,#2
1050  001e 2004          	jra	L154
1051  0020               L744:
1052                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1054  0020 721550c5      	bres	20677,#2
1055  0024               L154:
1056                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1058  0024 7b06          	ld	a,(OFST+2,sp)
1059  0026 c750c4        	ld	20676,a
1061  0029 2003          	jra	L754
1062  002b               L354:
1063                     ; 346       DownCounter--;
1065  002b 5a            	decw	x
1066  002c 1f03          	ldw	(OFST-1,sp),x
1068  002e               L754:
1069                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1071  002e 720150c504    	btjf	20677,#0,L364
1073  0033 1e03          	ldw	x,(OFST-1,sp)
1074  0035 26f4          	jrne	L354
1075  0037               L364:
1076                     ; 349     if(DownCounter != 0)
1078  0037 1e03          	ldw	x,(OFST-1,sp)
1079                     ; 351       Swif = SUCCESS;
1081  0039 263d          	jrne	LC004
1082  003b               L564:
1083                     ; 355       Swif = ERROR;
1086  003b 0f02          	clr	(OFST-2,sp)
1088  003d               L174:
1089                     ; 390   if(Swif != ERROR)
1091  003d 275d          	jreq	L515
1092                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1094  003f 7b0a          	ld	a,(OFST+6,sp)
1095  0041 263b          	jrne	L715
1097  0043 7b01          	ld	a,(OFST-3,sp)
1098  0045 a1e1          	cp	a,#225
1099  0047 2635          	jrne	L715
1100                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1102  0049 721150c0      	bres	20672,#0
1104  004d 204d          	jra	L515
1105  004f               L544:
1106                     ; 361     if (ITState != DISABLE)
1108  004f 7b09          	ld	a,(OFST+5,sp)
1109  0051 2706          	jreq	L374
1110                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1112  0053 721450c5      	bset	20677,#2
1114  0057 2004          	jra	L574
1115  0059               L374:
1116                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1118  0059 721550c5      	bres	20677,#2
1119  005d               L574:
1120                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1122  005d 7b06          	ld	a,(OFST+2,sp)
1123  005f c750c4        	ld	20676,a
1125  0062 2003          	jra	L305
1126  0064               L774:
1127                     ; 376       DownCounter--;
1129  0064 5a            	decw	x
1130  0065 1f03          	ldw	(OFST-1,sp),x
1132  0067               L305:
1133                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1135  0067 720750c504    	btjf	20677,#3,L705
1137  006c 1e03          	ldw	x,(OFST-1,sp)
1138  006e 26f4          	jrne	L774
1139  0070               L705:
1140                     ; 379     if(DownCounter != 0)
1142  0070 1e03          	ldw	x,(OFST-1,sp)
1143  0072 27c7          	jreq	L564
1144                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1146  0074 721250c5      	bset	20677,#1
1147                     ; 383       Swif = SUCCESS;
1149  0078               LC004:
1151  0078 a601          	ld	a,#1
1152  007a 6b02          	ld	(OFST-2,sp),a
1155  007c 20bf          	jra	L174
1156                     ; 387       Swif = ERROR;
1157  007e               L715:
1158                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1160  007e 7b0a          	ld	a,(OFST+6,sp)
1161  0080 260c          	jrne	L325
1163  0082 7b01          	ld	a,(OFST-3,sp)
1164  0084 a1d2          	cp	a,#210
1165  0086 2606          	jrne	L325
1166                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1168  0088 721750c0      	bres	20672,#3
1170  008c 200e          	jra	L515
1171  008e               L325:
1172                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1174  008e 7b0a          	ld	a,(OFST+6,sp)
1175  0090 260a          	jrne	L515
1177  0092 7b01          	ld	a,(OFST-3,sp)
1178  0094 a1b4          	cp	a,#180
1179  0096 2604          	jrne	L515
1180                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1182  0098 721150c1      	bres	20673,#0
1183  009c               L515:
1184                     ; 406   return(Swif);
1186  009c 7b02          	ld	a,(OFST-2,sp)
1189  009e 5b06          	addw	sp,#6
1190  00a0 81            	ret	
1328                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1328                     ; 416 {
1329                     .text:	section	.text,new
1330  0000               _CLK_HSIPrescalerConfig:
1332  0000 88            	push	a
1333       00000000      OFST:	set	0
1336                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1338                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1340  0001 c650c6        	ld	a,20678
1341  0004 a4e7          	and	a,#231
1342  0006 c750c6        	ld	20678,a
1343                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1345  0009 c650c6        	ld	a,20678
1346  000c 1a01          	or	a,(OFST+1,sp)
1347  000e c750c6        	ld	20678,a
1348                     ; 425 }
1351  0011 84            	pop	a
1352  0012 81            	ret	
1487                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1487                     ; 437 {
1488                     .text:	section	.text,new
1489  0000               _CLK_CCOConfig:
1491  0000 88            	push	a
1492       00000000      OFST:	set	0
1495                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1497                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1499  0001 c650c9        	ld	a,20681
1500  0004 a4e1          	and	a,#225
1501  0006 c750c9        	ld	20681,a
1502                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1504  0009 c650c9        	ld	a,20681
1505  000c 1a01          	or	a,(OFST+1,sp)
1506  000e c750c9        	ld	20681,a
1507                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1509  0011 721050c9      	bset	20681,#0
1510                     ; 449 }
1513  0015 84            	pop	a
1514  0016 81            	ret	
1579                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1579                     ; 460 {
1580                     .text:	section	.text,new
1581  0000               _CLK_ITConfig:
1583  0000 89            	pushw	x
1584       00000000      OFST:	set	0
1587                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1589                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1591                     ; 465   if (NewState != DISABLE)
1593  0001 9f            	ld	a,xl
1594  0002 4d            	tnz	a
1595  0003 2715          	jreq	L527
1596                     ; 467     switch (CLK_IT)
1598  0005 9e            	ld	a,xh
1600                     ; 475     default:
1600                     ; 476       break;
1601  0006 a00c          	sub	a,#12
1602  0008 270a          	jreq	L166
1603  000a a010          	sub	a,#16
1604  000c 2620          	jrne	L337
1605                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1605                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1607  000e 721450c5      	bset	20677,#2
1608                     ; 471       break;
1610  0012 201a          	jra	L337
1611  0014               L166:
1612                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1612                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1614  0014 721450c8      	bset	20680,#2
1615                     ; 474       break;
1617  0018 2014          	jra	L337
1618                     ; 475     default:
1618                     ; 476       break;
1621  001a               L527:
1622                     ; 481     switch (CLK_IT)
1624  001a 7b01          	ld	a,(OFST+1,sp)
1626                     ; 489     default:
1626                     ; 490       break;
1627  001c a00c          	sub	a,#12
1628  001e 270a          	jreq	L766
1629  0020 a010          	sub	a,#16
1630  0022 260a          	jrne	L337
1631                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1631                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1633  0024 721550c5      	bres	20677,#2
1634                     ; 485       break;
1636  0028 2004          	jra	L337
1637  002a               L766:
1638                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1638                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1640  002a 721550c8      	bres	20680,#2
1641                     ; 488       break;
1642  002e               L337:
1643                     ; 493 }
1646  002e 85            	popw	x
1647  002f 81            	ret	
1648                     ; 489     default:
1648                     ; 490       break;
1684                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1684                     ; 501 {
1685                     .text:	section	.text,new
1686  0000               _CLK_SYSCLKConfig:
1688  0000 88            	push	a
1689       00000000      OFST:	set	0
1692                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1694                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1696  0001 a580          	bcp	a,#128
1697  0003 260e          	jrne	L757
1698                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1700  0005 c650c6        	ld	a,20678
1701  0008 a4e7          	and	a,#231
1702  000a c750c6        	ld	20678,a
1703                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1705  000d 7b01          	ld	a,(OFST+1,sp)
1706  000f a418          	and	a,#24
1708  0011 200c          	jra	L167
1709  0013               L757:
1710                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1712  0013 c650c6        	ld	a,20678
1713  0016 a4f8          	and	a,#248
1714  0018 c750c6        	ld	20678,a
1715                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1717  001b 7b01          	ld	a,(OFST+1,sp)
1718  001d a407          	and	a,#7
1719  001f               L167:
1720  001f ca50c6        	or	a,20678
1721  0022 c750c6        	ld	20678,a
1722                     ; 515 }
1725  0025 84            	pop	a
1726  0026 81            	ret	
1782                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1782                     ; 524 {
1783                     .text:	section	.text,new
1784  0000               _CLK_SWIMConfig:
1788                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1790                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1792  0000 4d            	tnz	a
1793  0001 2705          	jreq	L1101
1794                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1796  0003 721050cd      	bset	20685,#0
1799  0007 81            	ret	
1800  0008               L1101:
1801                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1803  0008 721150cd      	bres	20685,#0
1804                     ; 538 }
1807  000c 81            	ret	
1831                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1831                     ; 548 {
1832                     .text:	section	.text,new
1833  0000               _CLK_ClockSecuritySystemEnable:
1837                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1839  0000 721050c8      	bset	20680,#0
1840                     ; 551 }
1843  0004 81            	ret	
1868                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1868                     ; 560 {
1869                     .text:	section	.text,new
1870  0000               _CLK_GetSYSCLKSource:
1874                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1876  0000 c650c3        	ld	a,20675
1879  0003 81            	ret	
1942                     ; 569 uint32_t CLK_GetClockFreq(void)
1942                     ; 570 {
1943                     .text:	section	.text,new
1944  0000               _CLK_GetClockFreq:
1946  0000 5209          	subw	sp,#9
1947       00000009      OFST:	set	9
1950                     ; 571   uint32_t clockfrequency = 0;
1952                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1954                     ; 573   uint8_t tmp = 0, presc = 0;
1958                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1960  0002 c650c3        	ld	a,20675
1961  0005 6b09          	ld	(OFST+0,sp),a
1963                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1965  0007 a1e1          	cp	a,#225
1966  0009 2634          	jrne	L7601
1967                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1969  000b c650c6        	ld	a,20678
1970  000e a418          	and	a,#24
1971  0010 44            	srl	a
1972  0011 44            	srl	a
1973  0012 44            	srl	a
1975                     ; 581     tmp = (uint8_t)(tmp >> 3);
1978                     ; 582     presc = HSIDivFactor[tmp];
1980  0013 5f            	clrw	x
1981  0014 97            	ld	xl,a
1982  0015 d60000        	ld	a,(_HSIDivFactor,x)
1983  0018 6b09          	ld	(OFST+0,sp),a
1985                     ; 583     clockfrequency = HSI_VALUE / presc;
1987  001a b703          	ld	c_lreg+3,a
1988  001c 3f02          	clr	c_lreg+2
1989  001e 3f01          	clr	c_lreg+1
1990  0020 3f00          	clr	c_lreg
1991  0022 96            	ldw	x,sp
1992  0023 5c            	incw	x
1993  0024 cd0000        	call	c_rtol
1996  0027 ae2400        	ldw	x,#9216
1997  002a bf02          	ldw	c_lreg+2,x
1998  002c ae00f4        	ldw	x,#244
1999  002f bf00          	ldw	c_lreg,x
2000  0031 96            	ldw	x,sp
2001  0032 5c            	incw	x
2002  0033 cd0000        	call	c_ludv
2004  0036 96            	ldw	x,sp
2005  0037 1c0005        	addw	x,#OFST-4
2006  003a cd0000        	call	c_rtol
2010  003d 2018          	jra	L1701
2011  003f               L7601:
2012                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2014  003f a1d2          	cp	a,#210
2015  0041 260a          	jrne	L3701
2016                     ; 587     clockfrequency = LSI_VALUE;
2018  0043 aef400        	ldw	x,#62464
2019  0046 1f07          	ldw	(OFST-2,sp),x
2020  0048 ae0001        	ldw	x,#1
2022  004b 2008          	jp	LC005
2023  004d               L3701:
2024                     ; 591     clockfrequency = HSE_VALUE;
2026  004d ae2400        	ldw	x,#9216
2027  0050 1f07          	ldw	(OFST-2,sp),x
2028  0052 ae00f4        	ldw	x,#244
2029  0055               LC005:
2030  0055 1f05          	ldw	(OFST-4,sp),x
2032  0057               L1701:
2033                     ; 594   return((uint32_t)clockfrequency);
2035  0057 96            	ldw	x,sp
2036  0058 1c0005        	addw	x,#OFST-4
2037  005b cd0000        	call	c_ltor
2041  005e 5b09          	addw	sp,#9
2042  0060 81            	ret	
2141                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2141                     ; 605 {
2142                     .text:	section	.text,new
2143  0000               _CLK_AdjustHSICalibrationValue:
2145  0000 88            	push	a
2146       00000000      OFST:	set	0
2149                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2151                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2153  0001 c650cc        	ld	a,20684
2154  0004 a4f8          	and	a,#248
2155  0006 1a01          	or	a,(OFST+1,sp)
2156  0008 c750cc        	ld	20684,a
2157                     ; 611 }
2160  000b 84            	pop	a
2161  000c 81            	ret	
2185                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2185                     ; 623 {
2186                     .text:	section	.text,new
2187  0000               _CLK_SYSCLKEmergencyClear:
2191                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2193  0000 721150c5      	bres	20677,#0
2194                     ; 625 }
2197  0004 81            	ret	
2350                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2350                     ; 635 {
2351                     .text:	section	.text,new
2352  0000               _CLK_GetFlagStatus:
2354  0000 89            	pushw	x
2355  0001 5203          	subw	sp,#3
2356       00000003      OFST:	set	3
2359                     ; 636   uint16_t statusreg = 0;
2361                     ; 637   uint8_t tmpreg = 0;
2363                     ; 638   FlagStatus bitstatus = RESET;
2365                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2367                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2369  0003 01            	rrwa	x,a
2370  0004 4f            	clr	a
2371  0005 02            	rlwa	x,a
2372  0006 1f01          	ldw	(OFST-2,sp),x
2374                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2376  0008 a30100        	cpw	x,#256
2377  000b 2605          	jrne	L1421
2378                     ; 649     tmpreg = CLK->ICKR;
2380  000d c650c0        	ld	a,20672
2382  0010 2021          	jra	L3421
2383  0012               L1421:
2384                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2386  0012 a30200        	cpw	x,#512
2387  0015 2605          	jrne	L5421
2388                     ; 653     tmpreg = CLK->ECKR;
2390  0017 c650c1        	ld	a,20673
2392  001a 2017          	jra	L3421
2393  001c               L5421:
2394                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2396  001c a30300        	cpw	x,#768
2397  001f 2605          	jrne	L1521
2398                     ; 657     tmpreg = CLK->SWCR;
2400  0021 c650c5        	ld	a,20677
2402  0024 200d          	jra	L3421
2403  0026               L1521:
2404                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2406  0026 a30400        	cpw	x,#1024
2407  0029 2605          	jrne	L5521
2408                     ; 661     tmpreg = CLK->CSSR;
2410  002b c650c8        	ld	a,20680
2412  002e 2003          	jra	L3421
2413  0030               L5521:
2414                     ; 665     tmpreg = CLK->CCOR;
2416  0030 c650c9        	ld	a,20681
2417  0033               L3421:
2418  0033 6b03          	ld	(OFST+0,sp),a
2420                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2422  0035 7b05          	ld	a,(OFST+2,sp)
2423  0037 1503          	bcp	a,(OFST+0,sp)
2424  0039 2704          	jreq	L1621
2425                     ; 670     bitstatus = SET;
2427  003b a601          	ld	a,#1
2430  003d 2001          	jra	L3621
2431  003f               L1621:
2432                     ; 674     bitstatus = RESET;
2434  003f 4f            	clr	a
2436  0040               L3621:
2437                     ; 678   return((FlagStatus)bitstatus);
2441  0040 5b05          	addw	sp,#5
2442  0042 81            	ret	
2488                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2488                     ; 688 {
2489                     .text:	section	.text,new
2490  0000               _CLK_GetITStatus:
2492  0000 88            	push	a
2493  0001 88            	push	a
2494       00000001      OFST:	set	1
2497                     ; 689   ITStatus bitstatus = RESET;
2499                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2501                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2503  0002 a11c          	cp	a,#28
2504  0004 2609          	jrne	L7031
2505                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2507  0006 c450c5        	and	a,20677
2508  0009 a10c          	cp	a,#12
2509  000b 260f          	jrne	L7131
2510                     ; 699       bitstatus = SET;
2512  000d 2009          	jp	LC007
2513                     ; 703       bitstatus = RESET;
2514  000f               L7031:
2515                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2517  000f c650c8        	ld	a,20680
2518  0012 1402          	and	a,(OFST+1,sp)
2519  0014 a10c          	cp	a,#12
2520  0016 2604          	jrne	L7131
2521                     ; 711       bitstatus = SET;
2523  0018               LC007:
2525  0018 a601          	ld	a,#1
2528  001a 2001          	jra	L5131
2529  001c               L7131:
2530                     ; 715       bitstatus = RESET;
2533  001c 4f            	clr	a
2535  001d               L5131:
2536                     ; 720   return bitstatus;
2540  001d 85            	popw	x
2541  001e 81            	ret	
2577                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2577                     ; 730 {
2578                     .text:	section	.text,new
2579  0000               _CLK_ClearITPendingBit:
2583                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2585                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2587  0000 a10c          	cp	a,#12
2588  0002 2605          	jrne	L1431
2589                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2591  0004 721750c8      	bres	20680,#3
2594  0008 81            	ret	
2595  0009               L1431:
2596                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2598  0009 721750c5      	bres	20677,#3
2599                     ; 745 }
2602  000d 81            	ret	
2637                     	xdef	_CLKPrescTable
2638                     	xdef	_HSIDivFactor
2639                     	xdef	_CLK_ClearITPendingBit
2640                     	xdef	_CLK_GetITStatus
2641                     	xdef	_CLK_GetFlagStatus
2642                     	xdef	_CLK_GetSYSCLKSource
2643                     	xdef	_CLK_GetClockFreq
2644                     	xdef	_CLK_AdjustHSICalibrationValue
2645                     	xdef	_CLK_SYSCLKEmergencyClear
2646                     	xdef	_CLK_ClockSecuritySystemEnable
2647                     	xdef	_CLK_SWIMConfig
2648                     	xdef	_CLK_SYSCLKConfig
2649                     	xdef	_CLK_ITConfig
2650                     	xdef	_CLK_CCOConfig
2651                     	xdef	_CLK_HSIPrescalerConfig
2652                     	xdef	_CLK_ClockSwitchConfig
2653                     	xdef	_CLK_PeripheralClockConfig
2654                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2655                     	xdef	_CLK_FastHaltWakeUpCmd
2656                     	xdef	_CLK_ClockSwitchCmd
2657                     	xdef	_CLK_CCOCmd
2658                     	xdef	_CLK_LSICmd
2659                     	xdef	_CLK_HSICmd
2660                     	xdef	_CLK_HSECmd
2661                     	xdef	_CLK_DeInit
2662                     	xref.b	c_lreg
2663                     	xref.b	c_x
2682                     	xref	c_ltor
2683                     	xref	c_ludv
2684                     	xref	c_rtol
2685                     	end
