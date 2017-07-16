   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 72 void CLK_DeInit(void)
  58                     ; 73 {
  60                     .text:	section	.text,new
  61  0000               _CLK_DeInit:
  65                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 88 }
 111  0037 81            	ret
 167                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 100 {
 168                     .text:	section	.text,new
 169  0000               _CLK_FastHaltWakeUpCmd:
 173                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175                     ; 104   if (NewState != DISABLE)
 177  0000 4d            	tnz	a
 178  0001 2706          	jreq	L75
 179                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 181  0003 721450c0      	bset	20672,#2
 183  0007 2004          	jra	L16
 184  0009               L75:
 185                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 187  0009 721550c0      	bres	20672,#2
 188  000d               L16:
 189                     ; 114 }
 192  000d 81            	ret
 227                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 227                     ; 122 {
 228                     .text:	section	.text,new
 229  0000               _CLK_HSECmd:
 233                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 235                     ; 126   if (NewState != DISABLE)
 237  0000 4d            	tnz	a
 238  0001 2706          	jreq	L101
 239                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 241  0003 721050c1      	bset	20673,#0
 243  0007 2004          	jra	L301
 244  0009               L101:
 245                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 247  0009 721150c1      	bres	20673,#0
 248  000d               L301:
 249                     ; 136 }
 252  000d 81            	ret
 287                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 287                     ; 144 {
 288                     .text:	section	.text,new
 289  0000               _CLK_HSICmd:
 293                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 295                     ; 148   if (NewState != DISABLE)
 297  0000 4d            	tnz	a
 298  0001 2706          	jreq	L321
 299                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 301  0003 721050c0      	bset	20672,#0
 303  0007 2004          	jra	L521
 304  0009               L321:
 305                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 307  0009 721150c0      	bres	20672,#0
 308  000d               L521:
 309                     ; 158 }
 312  000d 81            	ret
 347                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 347                     ; 167 {
 348                     .text:	section	.text,new
 349  0000               _CLK_LSICmd:
 353                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 355                     ; 171   if (NewState != DISABLE)
 357  0000 4d            	tnz	a
 358  0001 2706          	jreq	L541
 359                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 361  0003 721650c0      	bset	20672,#3
 363  0007 2004          	jra	L741
 364  0009               L541:
 365                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 367  0009 721750c0      	bres	20672,#3
 368  000d               L741:
 369                     ; 181 }
 372  000d 81            	ret
 407                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 407                     ; 190 {
 408                     .text:	section	.text,new
 409  0000               _CLK_CCOCmd:
 413                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 194   if (NewState != DISABLE)
 417  0000 4d            	tnz	a
 418  0001 2706          	jreq	L761
 419                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 421  0003 721050c9      	bset	20681,#0
 423  0007 2004          	jra	L171
 424  0009               L761:
 425                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 427  0009 721150c9      	bres	20681,#0
 428  000d               L171:
 429                     ; 204 }
 432  000d 81            	ret
 467                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 467                     ; 214 {
 468                     .text:	section	.text,new
 469  0000               _CLK_ClockSwitchCmd:
 473                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 475                     ; 218   if (NewState != DISABLE )
 477  0000 4d            	tnz	a
 478  0001 2706          	jreq	L112
 479                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 481  0003 721250c5      	bset	20677,#1
 483  0007 2004          	jra	L312
 484  0009               L112:
 485                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 487  0009 721350c5      	bres	20677,#1
 488  000d               L312:
 489                     ; 228 }
 492  000d 81            	ret
 528                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 528                     ; 239 {
 529                     .text:	section	.text,new
 530  0000               _CLK_SlowActiveHaltWakeUpCmd:
 534                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 536                     ; 243   if (NewState != DISABLE)
 538  0000 4d            	tnz	a
 539  0001 2706          	jreq	L332
 540                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 542  0003 721a50c0      	bset	20672,#5
 544  0007 2004          	jra	L532
 545  0009               L332:
 546                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 548  0009 721b50c0      	bres	20672,#5
 549  000d               L532:
 550                     ; 253 }
 553  000d 81            	ret
 712                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 712                     ; 264 {
 713                     .text:	section	.text,new
 714  0000               _CLK_PeripheralClockConfig:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 722                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 724                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 726  0001 9e            	ld	a,xh
 727  0002 a510          	bcp	a,#16
 728  0004 2633          	jrne	L123
 729                     ; 271     if (NewState != DISABLE)
 731  0006 0d02          	tnz	(OFST+2,sp)
 732  0008 2717          	jreq	L323
 733                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 735  000a 7b01          	ld	a,(OFST+1,sp)
 736  000c a40f          	and	a,#15
 737  000e 5f            	clrw	x
 738  000f 97            	ld	xl,a
 739  0010 a601          	ld	a,#1
 740  0012 5d            	tnzw	x
 741  0013 2704          	jreq	L62
 742  0015               L03:
 743  0015 48            	sll	a
 744  0016 5a            	decw	x
 745  0017 26fc          	jrne	L03
 746  0019               L62:
 747  0019 ca50c7        	or	a,20679
 748  001c c750c7        	ld	20679,a
 750  001f 2049          	jra	L723
 751  0021               L323:
 752                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  0021 7b01          	ld	a,(OFST+1,sp)
 755  0023 a40f          	and	a,#15
 756  0025 5f            	clrw	x
 757  0026 97            	ld	xl,a
 758  0027 a601          	ld	a,#1
 759  0029 5d            	tnzw	x
 760  002a 2704          	jreq	L23
 761  002c               L43:
 762  002c 48            	sll	a
 763  002d 5a            	decw	x
 764  002e 26fc          	jrne	L43
 765  0030               L23:
 766  0030 43            	cpl	a
 767  0031 c450c7        	and	a,20679
 768  0034 c750c7        	ld	20679,a
 769  0037 2031          	jra	L723
 770  0039               L123:
 771                     ; 284     if (NewState != DISABLE)
 773  0039 0d02          	tnz	(OFST+2,sp)
 774  003b 2717          	jreq	L133
 775                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 777  003d 7b01          	ld	a,(OFST+1,sp)
 778  003f a40f          	and	a,#15
 779  0041 5f            	clrw	x
 780  0042 97            	ld	xl,a
 781  0043 a601          	ld	a,#1
 782  0045 5d            	tnzw	x
 783  0046 2704          	jreq	L63
 784  0048               L04:
 785  0048 48            	sll	a
 786  0049 5a            	decw	x
 787  004a 26fc          	jrne	L04
 788  004c               L63:
 789  004c ca50ca        	or	a,20682
 790  004f c750ca        	ld	20682,a
 792  0052 2016          	jra	L723
 793  0054               L133:
 794                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  0054 7b01          	ld	a,(OFST+1,sp)
 797  0056 a40f          	and	a,#15
 798  0058 5f            	clrw	x
 799  0059 97            	ld	xl,a
 800  005a a601          	ld	a,#1
 801  005c 5d            	tnzw	x
 802  005d 2704          	jreq	L24
 803  005f               L44:
 804  005f 48            	sll	a
 805  0060 5a            	decw	x
 806  0061 26fc          	jrne	L44
 807  0063               L24:
 808  0063 43            	cpl	a
 809  0064 c450ca        	and	a,20682
 810  0067 c750ca        	ld	20682,a
 811  006a               L723:
 812                     ; 295 }
 815  006a 85            	popw	x
 816  006b 81            	ret
1004                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1004                     ; 310 {
1005                     .text:	section	.text,new
1006  0000               _CLK_ClockSwitchConfig:
1008  0000 89            	pushw	x
1009  0001 5204          	subw	sp,#4
1010       00000004      OFST:	set	4
1013                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1015  0003 aeffff        	ldw	x,#65535
1016  0006 1f03          	ldw	(OFST-1,sp),x
1018                     ; 313   ErrorStatus Swif = ERROR;
1020                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1022                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1024                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1026                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1028                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1030  0008 c650c3        	ld	a,20675
1031  000b 6b01          	ld	(OFST-3,sp),a
1033                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1035  000d 7b05          	ld	a,(OFST+1,sp)
1036  000f a101          	cp	a,#1
1037  0011 264b          	jrne	L544
1038                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1040  0013 721250c5      	bset	20677,#1
1041                     ; 331     if (ITState != DISABLE)
1043  0017 0d09          	tnz	(OFST+5,sp)
1044  0019 2706          	jreq	L744
1045                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1047  001b 721450c5      	bset	20677,#2
1049  001f 2004          	jra	L154
1050  0021               L744:
1051                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1053  0021 721550c5      	bres	20677,#2
1054  0025               L154:
1055                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1057  0025 7b06          	ld	a,(OFST+2,sp)
1058  0027 c750c4        	ld	20676,a
1060  002a 2007          	jra	L754
1061  002c               L354:
1062                     ; 346       DownCounter--;
1064  002c 1e03          	ldw	x,(OFST-1,sp)
1065  002e 1d0001        	subw	x,#1
1066  0031 1f03          	ldw	(OFST-1,sp),x
1068  0033               L754:
1069                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1071  0033 c650c5        	ld	a,20677
1072  0036 a501          	bcp	a,#1
1073  0038 2704          	jreq	L364
1075  003a 1e03          	ldw	x,(OFST-1,sp)
1076  003c 26ee          	jrne	L354
1077  003e               L364:
1078                     ; 349     if(DownCounter != 0)
1080  003e 1e03          	ldw	x,(OFST-1,sp)
1081  0040 2706          	jreq	L564
1082                     ; 351       Swif = SUCCESS;
1084  0042 a601          	ld	a,#1
1085  0044 6b02          	ld	(OFST-2,sp),a
1088  0046 2002          	jra	L174
1089  0048               L564:
1090                     ; 355       Swif = ERROR;
1092  0048 0f02          	clr	(OFST-2,sp)
1094  004a               L174:
1095                     ; 390   if(Swif != ERROR)
1097  004a 0d02          	tnz	(OFST-2,sp)
1098  004c 2767          	jreq	L515
1099                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1101  004e 0d0a          	tnz	(OFST+6,sp)
1102  0050 2645          	jrne	L715
1104  0052 7b01          	ld	a,(OFST-3,sp)
1105  0054 a1e1          	cp	a,#225
1106  0056 263f          	jrne	L715
1107                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1109  0058 721150c0      	bres	20672,#0
1111  005c 2057          	jra	L515
1112  005e               L544:
1113                     ; 361     if (ITState != DISABLE)
1115  005e 0d09          	tnz	(OFST+5,sp)
1116  0060 2706          	jreq	L374
1117                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1119  0062 721450c5      	bset	20677,#2
1121  0066 2004          	jra	L574
1122  0068               L374:
1123                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1125  0068 721550c5      	bres	20677,#2
1126  006c               L574:
1127                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1129  006c 7b06          	ld	a,(OFST+2,sp)
1130  006e c750c4        	ld	20676,a
1132  0071 2007          	jra	L305
1133  0073               L774:
1134                     ; 376       DownCounter--;
1136  0073 1e03          	ldw	x,(OFST-1,sp)
1137  0075 1d0001        	subw	x,#1
1138  0078 1f03          	ldw	(OFST-1,sp),x
1140  007a               L305:
1141                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1143  007a c650c5        	ld	a,20677
1144  007d a508          	bcp	a,#8
1145  007f 2704          	jreq	L705
1147  0081 1e03          	ldw	x,(OFST-1,sp)
1148  0083 26ee          	jrne	L774
1149  0085               L705:
1150                     ; 379     if(DownCounter != 0)
1152  0085 1e03          	ldw	x,(OFST-1,sp)
1153  0087 270a          	jreq	L115
1154                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1156  0089 721250c5      	bset	20677,#1
1157                     ; 383       Swif = SUCCESS;
1159  008d a601          	ld	a,#1
1160  008f 6b02          	ld	(OFST-2,sp),a
1163  0091 20b7          	jra	L174
1164  0093               L115:
1165                     ; 387       Swif = ERROR;
1167  0093 0f02          	clr	(OFST-2,sp)
1169  0095 20b3          	jra	L174
1170  0097               L715:
1171                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1173  0097 0d0a          	tnz	(OFST+6,sp)
1174  0099 260c          	jrne	L325
1176  009b 7b01          	ld	a,(OFST-3,sp)
1177  009d a1d2          	cp	a,#210
1178  009f 2606          	jrne	L325
1179                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1181  00a1 721750c0      	bres	20672,#3
1183  00a5 200e          	jra	L515
1184  00a7               L325:
1185                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1187  00a7 0d0a          	tnz	(OFST+6,sp)
1188  00a9 260a          	jrne	L515
1190  00ab 7b01          	ld	a,(OFST-3,sp)
1191  00ad a1b4          	cp	a,#180
1192  00af 2604          	jrne	L515
1193                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1195  00b1 721150c1      	bres	20673,#0
1196  00b5               L515:
1197                     ; 406   return(Swif);
1199  00b5 7b02          	ld	a,(OFST-2,sp)
1202  00b7 5b06          	addw	sp,#6
1203  00b9 81            	ret
1341                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1341                     ; 416 {
1342                     .text:	section	.text,new
1343  0000               _CLK_HSIPrescalerConfig:
1345  0000 88            	push	a
1346       00000000      OFST:	set	0
1349                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1351                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1353  0001 c650c6        	ld	a,20678
1354  0004 a4e7          	and	a,#231
1355  0006 c750c6        	ld	20678,a
1356                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1358  0009 c650c6        	ld	a,20678
1359  000c 1a01          	or	a,(OFST+1,sp)
1360  000e c750c6        	ld	20678,a
1361                     ; 425 }
1364  0011 84            	pop	a
1365  0012 81            	ret
1500                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1500                     ; 437 {
1501                     .text:	section	.text,new
1502  0000               _CLK_CCOConfig:
1504  0000 88            	push	a
1505       00000000      OFST:	set	0
1508                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1510                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1512  0001 c650c9        	ld	a,20681
1513  0004 a4e1          	and	a,#225
1514  0006 c750c9        	ld	20681,a
1515                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1517  0009 c650c9        	ld	a,20681
1518  000c 1a01          	or	a,(OFST+1,sp)
1519  000e c750c9        	ld	20681,a
1520                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1522  0011 721050c9      	bset	20681,#0
1523                     ; 449 }
1526  0015 84            	pop	a
1527  0016 81            	ret
1592                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1592                     ; 460 {
1593                     .text:	section	.text,new
1594  0000               _CLK_ITConfig:
1596  0000 89            	pushw	x
1597       00000000      OFST:	set	0
1600                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1602                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1604                     ; 465   if (NewState != DISABLE)
1606  0001 9f            	ld	a,xl
1607  0002 4d            	tnz	a
1608  0003 2719          	jreq	L527
1609                     ; 467     switch (CLK_IT)
1611  0005 9e            	ld	a,xh
1613                     ; 475     default:
1613                     ; 476       break;
1614  0006 a00c          	sub	a,#12
1615  0008 270a          	jreq	L166
1616  000a a010          	sub	a,#16
1617  000c 2624          	jrne	L337
1618                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1618                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1620  000e 721450c5      	bset	20677,#2
1621                     ; 471       break;
1623  0012 201e          	jra	L337
1624  0014               L166:
1625                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1625                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1627  0014 721450c8      	bset	20680,#2
1628                     ; 474       break;
1630  0018 2018          	jra	L337
1631  001a               L366:
1632                     ; 475     default:
1632                     ; 476       break;
1634  001a 2016          	jra	L337
1635  001c               L137:
1637  001c 2014          	jra	L337
1638  001e               L527:
1639                     ; 481     switch (CLK_IT)
1641  001e 7b01          	ld	a,(OFST+1,sp)
1643                     ; 489     default:
1643                     ; 490       break;
1644  0020 a00c          	sub	a,#12
1645  0022 270a          	jreq	L766
1646  0024 a010          	sub	a,#16
1647  0026 260a          	jrne	L337
1648                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1648                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1650  0028 721550c5      	bres	20677,#2
1651                     ; 485       break;
1653  002c 2004          	jra	L337
1654  002e               L766:
1655                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1655                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1657  002e 721550c8      	bres	20680,#2
1658                     ; 488       break;
1659  0032               L337:
1660                     ; 493 }
1663  0032 85            	popw	x
1664  0033 81            	ret
1665  0034               L176:
1666                     ; 489     default:
1666                     ; 490       break;
1668  0034 20fc          	jra	L337
1669  0036               L737:
1670  0036 20fa          	jra	L337
1705                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1705                     ; 501 {
1706                     .text:	section	.text,new
1707  0000               _CLK_SYSCLKConfig:
1709  0000 88            	push	a
1710       00000000      OFST:	set	0
1713                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1715                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1717  0001 a580          	bcp	a,#128
1718  0003 2614          	jrne	L757
1719                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1721  0005 c650c6        	ld	a,20678
1722  0008 a4e7          	and	a,#231
1723  000a c750c6        	ld	20678,a
1724                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1726  000d 7b01          	ld	a,(OFST+1,sp)
1727  000f a418          	and	a,#24
1728  0011 ca50c6        	or	a,20678
1729  0014 c750c6        	ld	20678,a
1731  0017 2012          	jra	L167
1732  0019               L757:
1733                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1735  0019 c650c6        	ld	a,20678
1736  001c a4f8          	and	a,#248
1737  001e c750c6        	ld	20678,a
1738                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1740  0021 7b01          	ld	a,(OFST+1,sp)
1741  0023 a407          	and	a,#7
1742  0025 ca50c6        	or	a,20678
1743  0028 c750c6        	ld	20678,a
1744  002b               L167:
1745                     ; 515 }
1748  002b 84            	pop	a
1749  002c 81            	ret
1805                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1805                     ; 524 {
1806                     .text:	section	.text,new
1807  0000               _CLK_SWIMConfig:
1811                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1813                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1815  0000 4d            	tnz	a
1816  0001 2706          	jreq	L1101
1817                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1819  0003 721050cd      	bset	20685,#0
1821  0007 2004          	jra	L3101
1822  0009               L1101:
1823                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1825  0009 721150cd      	bres	20685,#0
1826  000d               L3101:
1827                     ; 538 }
1830  000d 81            	ret
1854                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1854                     ; 548 {
1855                     .text:	section	.text,new
1856  0000               _CLK_ClockSecuritySystemEnable:
1860                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1862  0000 721050c8      	bset	20680,#0
1863                     ; 551 }
1866  0004 81            	ret
1891                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1891                     ; 560 {
1892                     .text:	section	.text,new
1893  0000               _CLK_GetSYSCLKSource:
1897                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1899  0000 c650c3        	ld	a,20675
1902  0003 81            	ret
1965                     ; 569 uint32_t CLK_GetClockFreq(void)
1965                     ; 570 {
1966                     .text:	section	.text,new
1967  0000               _CLK_GetClockFreq:
1969  0000 5209          	subw	sp,#9
1970       00000009      OFST:	set	9
1973                     ; 571   uint32_t clockfrequency = 0;
1975                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1977                     ; 573   uint8_t tmp = 0, presc = 0;
1981                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1983  0002 c650c3        	ld	a,20675
1984  0005 6b09          	ld	(OFST+0,sp),a
1986                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1988  0007 7b09          	ld	a,(OFST+0,sp)
1989  0009 a1e1          	cp	a,#225
1990  000b 2641          	jrne	L7601
1991                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1993  000d c650c6        	ld	a,20678
1994  0010 a418          	and	a,#24
1995  0012 6b09          	ld	(OFST+0,sp),a
1997                     ; 581     tmp = (uint8_t)(tmp >> 3);
1999  0014 0409          	srl	(OFST+0,sp)
2000  0016 0409          	srl	(OFST+0,sp)
2001  0018 0409          	srl	(OFST+0,sp)
2003                     ; 582     presc = HSIDivFactor[tmp];
2005  001a 7b09          	ld	a,(OFST+0,sp)
2006  001c 5f            	clrw	x
2007  001d 97            	ld	xl,a
2008  001e d60000        	ld	a,(_HSIDivFactor,x)
2009  0021 6b09          	ld	(OFST+0,sp),a
2011                     ; 583     clockfrequency = HSI_VALUE / presc;
2013  0023 7b09          	ld	a,(OFST+0,sp)
2014  0025 b703          	ld	c_lreg+3,a
2015  0027 3f02          	clr	c_lreg+2
2016  0029 3f01          	clr	c_lreg+1
2017  002b 3f00          	clr	c_lreg
2018  002d 96            	ldw	x,sp
2019  002e 1c0001        	addw	x,#OFST-8
2020  0031 cd0000        	call	c_rtol
2023  0034 ae2400        	ldw	x,#9216
2024  0037 bf02          	ldw	c_lreg+2,x
2025  0039 ae00f4        	ldw	x,#244
2026  003c bf00          	ldw	c_lreg,x
2027  003e 96            	ldw	x,sp
2028  003f 1c0001        	addw	x,#OFST-8
2029  0042 cd0000        	call	c_ludv
2031  0045 96            	ldw	x,sp
2032  0046 1c0005        	addw	x,#OFST-4
2033  0049 cd0000        	call	c_rtol
2037  004c 201c          	jra	L1701
2038  004e               L7601:
2039                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2041  004e 7b09          	ld	a,(OFST+0,sp)
2042  0050 a1d2          	cp	a,#210
2043  0052 260c          	jrne	L3701
2044                     ; 587     clockfrequency = LSI_VALUE;
2046  0054 aef400        	ldw	x,#62464
2047  0057 1f07          	ldw	(OFST-2,sp),x
2048  0059 ae0001        	ldw	x,#1
2049  005c 1f05          	ldw	(OFST-4,sp),x
2052  005e 200a          	jra	L1701
2053  0060               L3701:
2054                     ; 591     clockfrequency = HSE_VALUE;
2056  0060 ae2400        	ldw	x,#9216
2057  0063 1f07          	ldw	(OFST-2,sp),x
2058  0065 ae00f4        	ldw	x,#244
2059  0068 1f05          	ldw	(OFST-4,sp),x
2061  006a               L1701:
2062                     ; 594   return((uint32_t)clockfrequency);
2064  006a 96            	ldw	x,sp
2065  006b 1c0005        	addw	x,#OFST-4
2066  006e cd0000        	call	c_ltor
2070  0071 5b09          	addw	sp,#9
2071  0073 81            	ret
2170                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2170                     ; 605 {
2171                     .text:	section	.text,new
2172  0000               _CLK_AdjustHSICalibrationValue:
2174  0000 88            	push	a
2175       00000000      OFST:	set	0
2178                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2180                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2182  0001 c650cc        	ld	a,20684
2183  0004 a4f8          	and	a,#248
2184  0006 1a01          	or	a,(OFST+1,sp)
2185  0008 c750cc        	ld	20684,a
2186                     ; 611 }
2189  000b 84            	pop	a
2190  000c 81            	ret
2214                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2214                     ; 623 {
2215                     .text:	section	.text,new
2216  0000               _CLK_SYSCLKEmergencyClear:
2220                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2222  0000 721150c5      	bres	20677,#0
2223                     ; 625 }
2226  0004 81            	ret
2379                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2379                     ; 635 {
2380                     .text:	section	.text,new
2381  0000               _CLK_GetFlagStatus:
2383  0000 89            	pushw	x
2384  0001 5203          	subw	sp,#3
2385       00000003      OFST:	set	3
2388                     ; 636   uint16_t statusreg = 0;
2390                     ; 637   uint8_t tmpreg = 0;
2392                     ; 638   FlagStatus bitstatus = RESET;
2394                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2396                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2398  0003 01            	rrwa	x,a
2399  0004 9f            	ld	a,xl
2400  0005 a4ff          	and	a,#255
2401  0007 97            	ld	xl,a
2402  0008 4f            	clr	a
2403  0009 02            	rlwa	x,a
2404  000a 1f01          	ldw	(OFST-2,sp),x
2405  000c 01            	rrwa	x,a
2407                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2409  000d 1e01          	ldw	x,(OFST-2,sp)
2410  000f a30100        	cpw	x,#256
2411  0012 2607          	jrne	L1421
2412                     ; 649     tmpreg = CLK->ICKR;
2414  0014 c650c0        	ld	a,20672
2415  0017 6b03          	ld	(OFST+0,sp),a
2418  0019 202f          	jra	L3421
2419  001b               L1421:
2420                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2422  001b 1e01          	ldw	x,(OFST-2,sp)
2423  001d a30200        	cpw	x,#512
2424  0020 2607          	jrne	L5421
2425                     ; 653     tmpreg = CLK->ECKR;
2427  0022 c650c1        	ld	a,20673
2428  0025 6b03          	ld	(OFST+0,sp),a
2431  0027 2021          	jra	L3421
2432  0029               L5421:
2433                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2435  0029 1e01          	ldw	x,(OFST-2,sp)
2436  002b a30300        	cpw	x,#768
2437  002e 2607          	jrne	L1521
2438                     ; 657     tmpreg = CLK->SWCR;
2440  0030 c650c5        	ld	a,20677
2441  0033 6b03          	ld	(OFST+0,sp),a
2444  0035 2013          	jra	L3421
2445  0037               L1521:
2446                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2448  0037 1e01          	ldw	x,(OFST-2,sp)
2449  0039 a30400        	cpw	x,#1024
2450  003c 2607          	jrne	L5521
2451                     ; 661     tmpreg = CLK->CSSR;
2453  003e c650c8        	ld	a,20680
2454  0041 6b03          	ld	(OFST+0,sp),a
2457  0043 2005          	jra	L3421
2458  0045               L5521:
2459                     ; 665     tmpreg = CLK->CCOR;
2461  0045 c650c9        	ld	a,20681
2462  0048 6b03          	ld	(OFST+0,sp),a
2464  004a               L3421:
2465                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2467  004a 7b05          	ld	a,(OFST+2,sp)
2468  004c 1503          	bcp	a,(OFST+0,sp)
2469  004e 2706          	jreq	L1621
2470                     ; 670     bitstatus = SET;
2472  0050 a601          	ld	a,#1
2473  0052 6b03          	ld	(OFST+0,sp),a
2476  0054 2002          	jra	L3621
2477  0056               L1621:
2478                     ; 674     bitstatus = RESET;
2480  0056 0f03          	clr	(OFST+0,sp)
2482  0058               L3621:
2483                     ; 678   return((FlagStatus)bitstatus);
2485  0058 7b03          	ld	a,(OFST+0,sp)
2488  005a 5b05          	addw	sp,#5
2489  005c 81            	ret
2535                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2535                     ; 688 {
2536                     .text:	section	.text,new
2537  0000               _CLK_GetITStatus:
2539  0000 88            	push	a
2540  0001 88            	push	a
2541       00000001      OFST:	set	1
2544                     ; 689   ITStatus bitstatus = RESET;
2546                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2548                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2550  0002 a11c          	cp	a,#28
2551  0004 2611          	jrne	L7031
2552                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2554  0006 c450c5        	and	a,20677
2555  0009 a10c          	cp	a,#12
2556  000b 2606          	jrne	L1131
2557                     ; 699       bitstatus = SET;
2559  000d a601          	ld	a,#1
2560  000f 6b01          	ld	(OFST+0,sp),a
2563  0011 2015          	jra	L5131
2564  0013               L1131:
2565                     ; 703       bitstatus = RESET;
2567  0013 0f01          	clr	(OFST+0,sp)
2569  0015 2011          	jra	L5131
2570  0017               L7031:
2571                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2573  0017 c650c8        	ld	a,20680
2574  001a 1402          	and	a,(OFST+1,sp)
2575  001c a10c          	cp	a,#12
2576  001e 2606          	jrne	L7131
2577                     ; 711       bitstatus = SET;
2579  0020 a601          	ld	a,#1
2580  0022 6b01          	ld	(OFST+0,sp),a
2583  0024 2002          	jra	L5131
2584  0026               L7131:
2585                     ; 715       bitstatus = RESET;
2587  0026 0f01          	clr	(OFST+0,sp)
2589  0028               L5131:
2590                     ; 720   return bitstatus;
2592  0028 7b01          	ld	a,(OFST+0,sp)
2595  002a 85            	popw	x
2596  002b 81            	ret
2632                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2632                     ; 730 {
2633                     .text:	section	.text,new
2634  0000               _CLK_ClearITPendingBit:
2638                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2640                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2642  0000 a10c          	cp	a,#12
2643  0002 2606          	jrne	L1431
2644                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2646  0004 721750c8      	bres	20680,#3
2648  0008 2004          	jra	L3431
2649  000a               L1431:
2650                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2652  000a 721750c5      	bres	20677,#3
2653  000e               L3431:
2654                     ; 745 }
2657  000e 81            	ret
2692                     	xdef	_CLKPrescTable
2693                     	xdef	_HSIDivFactor
2694                     	xdef	_CLK_ClearITPendingBit
2695                     	xdef	_CLK_GetITStatus
2696                     	xdef	_CLK_GetFlagStatus
2697                     	xdef	_CLK_GetSYSCLKSource
2698                     	xdef	_CLK_GetClockFreq
2699                     	xdef	_CLK_AdjustHSICalibrationValue
2700                     	xdef	_CLK_SYSCLKEmergencyClear
2701                     	xdef	_CLK_ClockSecuritySystemEnable
2702                     	xdef	_CLK_SWIMConfig
2703                     	xdef	_CLK_SYSCLKConfig
2704                     	xdef	_CLK_ITConfig
2705                     	xdef	_CLK_CCOConfig
2706                     	xdef	_CLK_HSIPrescalerConfig
2707                     	xdef	_CLK_ClockSwitchConfig
2708                     	xdef	_CLK_PeripheralClockConfig
2709                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2710                     	xdef	_CLK_FastHaltWakeUpCmd
2711                     	xdef	_CLK_ClockSwitchCmd
2712                     	xdef	_CLK_CCOCmd
2713                     	xdef	_CLK_LSICmd
2714                     	xdef	_CLK_HSICmd
2715                     	xdef	_CLK_HSECmd
2716                     	xdef	_CLK_DeInit
2717                     	xref.b	c_lreg
2718                     	xref.b	c_x
2737                     	xref	c_ltor
2738                     	xref	c_ludv
2739                     	xref	c_rtol
2740                     	end
