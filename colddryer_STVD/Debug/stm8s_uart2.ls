   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  46                     ; 53 void UART2_DeInit(void)
  46                     ; 54 {
  48                     .text:	section	.text,new
  49  0000               _UART2_DeInit:
  53                     ; 57   (void) UART2->SR;
  55  0000 c65240        	ld	a,21056
  56                     ; 58   (void)UART2->DR;
  58  0003 c65241        	ld	a,21057
  59                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  61  0006 725f5243      	clr	21059
  62                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  64  000a 725f5242      	clr	21058
  65                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  67  000e 725f5244      	clr	21060
  68                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  70  0012 725f5245      	clr	21061
  71                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  73  0016 725f5246      	clr	21062
  74                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  76  001a 725f5247      	clr	21063
  77                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  79  001e 725f5248      	clr	21064
  80                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  82  0022 725f5249      	clr	21065
  83                     ; 69 }
  86  0026 81            	ret	
 407                     .const:	section	.text
 408  0000               L41:
 409  0000 00000064      	dc.l	100
 410                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 410                     ; 86 {
 411                     .text:	section	.text,new
 412  0000               _UART2_Init:
 414  0000 520e          	subw	sp,#14
 415       0000000e      OFST:	set	14
 418                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 422                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 426                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 428                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 430                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 432                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 434                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 436                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 438                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 440  0002 72195244      	bres	21060,#4
 441                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 443  0006 c65244        	ld	a,21060
 444  0009 1a15          	or	a,(OFST+7,sp)
 445  000b c75244        	ld	21060,a
 446                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 448  000e c65246        	ld	a,21062
 449  0011 a4cf          	and	a,#207
 450  0013 c75246        	ld	21062,a
 451                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 453  0016 c65246        	ld	a,21062
 454  0019 1a16          	or	a,(OFST+8,sp)
 455  001b c75246        	ld	21062,a
 456                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 458  001e c65244        	ld	a,21060
 459  0021 a4f9          	and	a,#249
 460  0023 c75244        	ld	21060,a
 461                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 463  0026 c65244        	ld	a,21060
 464  0029 1a17          	or	a,(OFST+9,sp)
 465  002b c75244        	ld	21060,a
 466                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 468  002e 725f5242      	clr	21058
 469                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 471  0032 c65243        	ld	a,21059
 472  0035 a40f          	and	a,#15
 473  0037 c75243        	ld	21059,a
 474                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 476  003a c65243        	ld	a,21059
 477  003d a4f0          	and	a,#240
 478  003f c75243        	ld	21059,a
 479                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 481  0042 96            	ldw	x,sp
 482  0043 1c0011        	addw	x,#OFST+3
 483  0046 cd0000        	call	c_ltor
 485  0049 a604          	ld	a,#4
 486  004b cd0000        	call	c_llsh
 488  004e 96            	ldw	x,sp
 489  004f 5c            	incw	x
 490  0050 cd0000        	call	c_rtol
 493  0053 cd0000        	call	_CLK_GetClockFreq
 495  0056 96            	ldw	x,sp
 496  0057 5c            	incw	x
 497  0058 cd0000        	call	c_ludv
 499  005b 96            	ldw	x,sp
 500  005c 1c000b        	addw	x,#OFST-3
 501  005f cd0000        	call	c_rtol
 504                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 506  0062 96            	ldw	x,sp
 507  0063 1c0011        	addw	x,#OFST+3
 508  0066 cd0000        	call	c_ltor
 510  0069 a604          	ld	a,#4
 511  006b cd0000        	call	c_llsh
 513  006e 96            	ldw	x,sp
 514  006f 5c            	incw	x
 515  0070 cd0000        	call	c_rtol
 518  0073 cd0000        	call	_CLK_GetClockFreq
 520  0076 a664          	ld	a,#100
 521  0078 cd0000        	call	c_smul
 523  007b 96            	ldw	x,sp
 524  007c 5c            	incw	x
 525  007d cd0000        	call	c_ludv
 527  0080 96            	ldw	x,sp
 528  0081 1c0007        	addw	x,#OFST-7
 529  0084 cd0000        	call	c_rtol
 532                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 532                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 534  0087 96            	ldw	x,sp
 535  0088 1c000b        	addw	x,#OFST-3
 536  008b cd0000        	call	c_ltor
 538  008e a664          	ld	a,#100
 539  0090 cd0000        	call	c_smul
 541  0093 96            	ldw	x,sp
 542  0094 5c            	incw	x
 543  0095 cd0000        	call	c_rtol
 546  0098 96            	ldw	x,sp
 547  0099 1c0007        	addw	x,#OFST-7
 548  009c cd0000        	call	c_ltor
 550  009f 96            	ldw	x,sp
 551  00a0 5c            	incw	x
 552  00a1 cd0000        	call	c_lsub
 554  00a4 a604          	ld	a,#4
 555  00a6 cd0000        	call	c_llsh
 557  00a9 ae0000        	ldw	x,#L41
 558  00ac cd0000        	call	c_ludv
 560  00af b603          	ld	a,c_lreg+3
 561  00b1 a40f          	and	a,#15
 562  00b3 6b05          	ld	(OFST-9,sp),a
 564                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 566  00b5 96            	ldw	x,sp
 567  00b6 1c000b        	addw	x,#OFST-3
 568  00b9 cd0000        	call	c_ltor
 570  00bc a604          	ld	a,#4
 571  00be cd0000        	call	c_lursh
 573  00c1 b603          	ld	a,c_lreg+3
 574  00c3 a4f0          	and	a,#240
 575  00c5 b703          	ld	c_lreg+3,a
 576  00c7 3f02          	clr	c_lreg+2
 577  00c9 3f01          	clr	c_lreg+1
 578  00cb 3f00          	clr	c_lreg
 579  00cd 6b06          	ld	(OFST-8,sp),a
 581                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 583  00cf 1a05          	or	a,(OFST-9,sp)
 584  00d1 c75243        	ld	21059,a
 585                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 587  00d4 7b0e          	ld	a,(OFST+0,sp)
 588  00d6 c75242        	ld	21058,a
 589                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 591  00d9 c65245        	ld	a,21061
 592  00dc a4f3          	and	a,#243
 593  00de c75245        	ld	21061,a
 594                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 596  00e1 c65246        	ld	a,21062
 597  00e4 a4f8          	and	a,#248
 598  00e6 c75246        	ld	21062,a
 599                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 599                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 601  00e9 7b18          	ld	a,(OFST+10,sp)
 602  00eb a407          	and	a,#7
 603  00ed ca5246        	or	a,21062
 604  00f0 c75246        	ld	21062,a
 605                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 607  00f3 7b19          	ld	a,(OFST+11,sp)
 608  00f5 a504          	bcp	a,#4
 609  00f7 2706          	jreq	L302
 610                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 612  00f9 72165245      	bset	21061,#3
 614  00fd 2004          	jra	L502
 615  00ff               L302:
 616                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 618  00ff 72175245      	bres	21061,#3
 619  0103               L502:
 620                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 622  0103 a508          	bcp	a,#8
 623  0105 2706          	jreq	L702
 624                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 626  0107 72145245      	bset	21061,#2
 628  010b 2004          	jra	L112
 629  010d               L702:
 630                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 632  010d 72155245      	bres	21061,#2
 633  0111               L112:
 634                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 636  0111 7b18          	ld	a,(OFST+10,sp)
 637  0113 2a06          	jrpl	L312
 638                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 640  0115 72175246      	bres	21062,#3
 642  0119 2008          	jra	L512
 643  011b               L312:
 644                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 646  011b a408          	and	a,#8
 647  011d ca5246        	or	a,21062
 648  0120 c75246        	ld	21062,a
 649  0123               L512:
 650                     ; 173 }
 653  0123 5b0e          	addw	sp,#14
 654  0125 81            	ret	
 709                     ; 181 void UART2_Cmd(FunctionalState NewState)
 709                     ; 182 {
 710                     .text:	section	.text,new
 711  0000               _UART2_Cmd:
 715                     ; 183   if (NewState != DISABLE)
 717  0000 4d            	tnz	a
 718  0001 2705          	jreq	L542
 719                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 721  0003 721b5244      	bres	21060,#5
 724  0007 81            	ret	
 725  0008               L542:
 726                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 728  0008 721a5244      	bset	21060,#5
 729                     ; 193 }
 732  000c 81            	ret	
 864                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 864                     ; 211 {
 865                     .text:	section	.text,new
 866  0000               _UART2_ITConfig:
 868  0000 89            	pushw	x
 869  0001 89            	pushw	x
 870       00000002      OFST:	set	2
 873                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 877                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 879                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 881                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 883  0002 9e            	ld	a,xh
 884  0003 6b01          	ld	(OFST-1,sp),a
 886                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 888  0005 9f            	ld	a,xl
 889  0006 a40f          	and	a,#15
 890  0008 5f            	clrw	x
 891  0009 97            	ld	xl,a
 892  000a a601          	ld	a,#1
 893  000c 5d            	tnzw	x
 894  000d 2704          	jreq	L22
 895  000f               L42:
 896  000f 48            	sll	a
 897  0010 5a            	decw	x
 898  0011 26fc          	jrne	L42
 899  0013               L22:
 900  0013 6b02          	ld	(OFST+0,sp),a
 902                     ; 224   if (NewState != DISABLE)
 904  0015 7b07          	ld	a,(OFST+5,sp)
 905  0017 272a          	jreq	L133
 906                     ; 227     if (uartreg == 0x01)
 908  0019 7b01          	ld	a,(OFST-1,sp)
 909  001b a101          	cp	a,#1
 910  001d 2607          	jrne	L333
 911                     ; 229       UART2->CR1 |= itpos;
 913  001f c65244        	ld	a,21060
 914  0022 1a02          	or	a,(OFST+0,sp)
 916  0024 2029          	jp	LC003
 917  0026               L333:
 918                     ; 231     else if (uartreg == 0x02)
 920  0026 a102          	cp	a,#2
 921  0028 2607          	jrne	L733
 922                     ; 233       UART2->CR2 |= itpos;
 924  002a c65245        	ld	a,21061
 925  002d 1a02          	or	a,(OFST+0,sp)
 927  002f 202d          	jp	LC002
 928  0031               L733:
 929                     ; 235     else if (uartreg == 0x03)
 931  0031 a103          	cp	a,#3
 932  0033 2607          	jrne	L343
 933                     ; 237       UART2->CR4 |= itpos;
 935  0035 c65247        	ld	a,21063
 936  0038 1a02          	or	a,(OFST+0,sp)
 938  003a 2031          	jp	LC004
 939  003c               L343:
 940                     ; 241       UART2->CR6 |= itpos;
 942  003c c65249        	ld	a,21065
 943  003f 1a02          	or	a,(OFST+0,sp)
 944  0041 2035          	jp	LC001
 945  0043               L133:
 946                     ; 247     if (uartreg == 0x01)
 948  0043 7b01          	ld	a,(OFST-1,sp)
 949  0045 a101          	cp	a,#1
 950  0047 260b          	jrne	L153
 951                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 953  0049 7b02          	ld	a,(OFST+0,sp)
 954  004b 43            	cpl	a
 955  004c c45244        	and	a,21060
 956  004f               LC003:
 957  004f c75244        	ld	21060,a
 959  0052 2027          	jra	L743
 960  0054               L153:
 961                     ; 251     else if (uartreg == 0x02)
 963  0054 a102          	cp	a,#2
 964  0056 260b          	jrne	L553
 965                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 967  0058 7b02          	ld	a,(OFST+0,sp)
 968  005a 43            	cpl	a
 969  005b c45245        	and	a,21061
 970  005e               LC002:
 971  005e c75245        	ld	21061,a
 973  0061 2018          	jra	L743
 974  0063               L553:
 975                     ; 255     else if (uartreg == 0x03)
 977  0063 a103          	cp	a,#3
 978  0065 260b          	jrne	L163
 979                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 981  0067 7b02          	ld	a,(OFST+0,sp)
 982  0069 43            	cpl	a
 983  006a c45247        	and	a,21063
 984  006d               LC004:
 985  006d c75247        	ld	21063,a
 987  0070 2009          	jra	L743
 988  0072               L163:
 989                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 991  0072 7b02          	ld	a,(OFST+0,sp)
 992  0074 43            	cpl	a
 993  0075 c45249        	and	a,21065
 994  0078               LC001:
 995  0078 c75249        	ld	21065,a
 996  007b               L743:
 997                     ; 264 }
1000  007b 5b04          	addw	sp,#4
1001  007d 81            	ret	
1058                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1058                     ; 273 {
1059                     .text:	section	.text,new
1060  0000               _UART2_IrDAConfig:
1064                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1066                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1068  0000 4d            	tnz	a
1069  0001 2705          	jreq	L314
1070                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1072  0003 72145248      	bset	21064,#2
1075  0007 81            	ret	
1076  0008               L314:
1077                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1079  0008 72155248      	bres	21064,#2
1080                     ; 284 }
1083  000c 81            	ret	
1118                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1118                     ; 293 {
1119                     .text:	section	.text,new
1120  0000               _UART2_IrDACmd:
1124                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1126                     ; 297   if (NewState != DISABLE)
1128  0000 4d            	tnz	a
1129  0001 2705          	jreq	L534
1130                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1132  0003 72125248      	bset	21064,#1
1135  0007 81            	ret	
1136  0008               L534:
1137                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1139  0008 72135248      	bres	21064,#1
1140                     ; 307 }
1143  000c 81            	ret	
1202                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1202                     ; 317 {
1203                     .text:	section	.text,new
1204  0000               _UART2_LINBreakDetectionConfig:
1208                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1210                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1212  0000 4d            	tnz	a
1213  0001 2705          	jreq	L764
1214                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1216  0003 721a5247      	bset	21063,#5
1219  0007 81            	ret	
1220  0008               L764:
1221                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1223  0008 721b5247      	bres	21063,#5
1224                     ; 329 }
1227  000c 81            	ret	
1348                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1348                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1348                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1348                     ; 344 {
1349                     .text:	section	.text,new
1350  0000               _UART2_LINConfig:
1352  0000 89            	pushw	x
1353       00000000      OFST:	set	0
1356                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1358                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1360                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1362                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1364  0001 9e            	ld	a,xh
1365  0002 4d            	tnz	a
1366  0003 2706          	jreq	L155
1367                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1369  0005 721a5249      	bset	21065,#5
1371  0009 2004          	jra	L355
1372  000b               L155:
1373                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1375  000b 721b5249      	bres	21065,#5
1376  000f               L355:
1377                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1379  000f 7b02          	ld	a,(OFST+2,sp)
1380  0011 2706          	jreq	L555
1381                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1383  0013 72185249      	bset	21065,#4
1385  0017 2004          	jra	L755
1386  0019               L555:
1387                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1389  0019 72195249      	bres	21065,#4
1390  001d               L755:
1391                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1393  001d 7b05          	ld	a,(OFST+5,sp)
1394  001f 2706          	jreq	L165
1395                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1397  0021 721e5249      	bset	21065,#7
1399  0025 2004          	jra	L365
1400  0027               L165:
1401                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1403  0027 721f5249      	bres	21065,#7
1404  002b               L365:
1405                     ; 376 }
1408  002b 85            	popw	x
1409  002c 81            	ret	
1444                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1444                     ; 385 {
1445                     .text:	section	.text,new
1446  0000               _UART2_LINCmd:
1450                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1452                     ; 388   if (NewState != DISABLE)
1454  0000 4d            	tnz	a
1455  0001 2705          	jreq	L306
1456                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1458  0003 721c5246      	bset	21062,#6
1461  0007 81            	ret	
1462  0008               L306:
1463                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1465  0008 721d5246      	bres	21062,#6
1466                     ; 398 }
1469  000c 81            	ret	
1504                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1504                     ; 407 {
1505                     .text:	section	.text,new
1506  0000               _UART2_SmartCardCmd:
1510                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1512                     ; 411   if (NewState != DISABLE)
1514  0000 4d            	tnz	a
1515  0001 2705          	jreq	L526
1516                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1518  0003 721a5248      	bset	21064,#5
1521  0007 81            	ret	
1522  0008               L526:
1523                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1525  0008 721b5248      	bres	21064,#5
1526                     ; 421 }
1529  000c 81            	ret	
1565                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1565                     ; 430 {
1566                     .text:	section	.text,new
1567  0000               _UART2_SmartCardNACKCmd:
1571                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1573                     ; 434   if (NewState != DISABLE)
1575  0000 4d            	tnz	a
1576  0001 2705          	jreq	L746
1577                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1579  0003 72185248      	bset	21064,#4
1582  0007 81            	ret	
1583  0008               L746:
1584                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1586  0008 72195248      	bres	21064,#4
1587                     ; 444 }
1590  000c 81            	ret	
1647                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1647                     ; 453 {
1648                     .text:	section	.text,new
1649  0000               _UART2_WakeUpConfig:
1653                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1655                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1657  0000 72175244      	bres	21060,#3
1658                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1660  0004 ca5244        	or	a,21060
1661  0007 c75244        	ld	21060,a
1662                     ; 458 }
1665  000a 81            	ret	
1701                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1701                     ; 467 {
1702                     .text:	section	.text,new
1703  0000               _UART2_ReceiverWakeUpCmd:
1707                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1709                     ; 470   if (NewState != DISABLE)
1711  0000 4d            	tnz	a
1712  0001 2705          	jreq	L717
1713                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1715  0003 72125245      	bset	21061,#1
1718  0007 81            	ret	
1719  0008               L717:
1720                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1722  0008 72135245      	bres	21061,#1
1723                     ; 480 }
1726  000c 81            	ret	
1749                     ; 487 uint8_t UART2_ReceiveData8(void)
1749                     ; 488 {
1750                     .text:	section	.text,new
1751  0000               _UART2_ReceiveData8:
1755                     ; 489   return ((uint8_t)UART2->DR);
1757  0000 c65241        	ld	a,21057
1760  0003 81            	ret	
1794                     ; 497 uint16_t UART2_ReceiveData9(void)
1794                     ; 498 {
1795                     .text:	section	.text,new
1796  0000               _UART2_ReceiveData9:
1798  0000 89            	pushw	x
1799       00000002      OFST:	set	2
1802                     ; 499   uint16_t temp = 0;
1804                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1806  0001 c65244        	ld	a,21060
1807  0004 a480          	and	a,#128
1808  0006 5f            	clrw	x
1809  0007 02            	rlwa	x,a
1810  0008 58            	sllw	x
1811  0009 1f01          	ldw	(OFST-1,sp),x
1813                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1815  000b c65241        	ld	a,21057
1816  000e 5f            	clrw	x
1817  000f 97            	ld	xl,a
1818  0010 01            	rrwa	x,a
1819  0011 1a02          	or	a,(OFST+0,sp)
1820  0013 01            	rrwa	x,a
1821  0014 1a01          	or	a,(OFST-1,sp)
1822  0016 a401          	and	a,#1
1823  0018 01            	rrwa	x,a
1826  0019 5b02          	addw	sp,#2
1827  001b 81            	ret	
1861                     ; 511 void UART2_SendData8(uint8_t Data)
1861                     ; 512 {
1862                     .text:	section	.text,new
1863  0000               _UART2_SendData8:
1867                     ; 514   UART2->DR = Data;
1869  0000 c75241        	ld	21057,a
1870                     ; 515 }
1873  0003 81            	ret	
1907                     ; 522 void UART2_SendData9(uint16_t Data)
1907                     ; 523 {
1908                     .text:	section	.text,new
1909  0000               _UART2_SendData9:
1911  0000 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1917  0001 721d5244      	bres	21060,#6
1918                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1920  0005 54            	srlw	x
1921  0006 54            	srlw	x
1922  0007 9f            	ld	a,xl
1923  0008 a440          	and	a,#64
1924  000a ca5244        	or	a,21060
1925  000d c75244        	ld	21060,a
1926                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1928  0010 7b02          	ld	a,(OFST+2,sp)
1929  0012 c75241        	ld	21057,a
1930                     ; 532 }
1933  0015 85            	popw	x
1934  0016 81            	ret	
1957                     ; 539 void UART2_SendBreak(void)
1957                     ; 540 {
1958                     .text:	section	.text,new
1959  0000               _UART2_SendBreak:
1963                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1965  0000 72105245      	bset	21061,#0
1966                     ; 542 }
1969  0004 81            	ret	
2003                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2003                     ; 550 {
2004                     .text:	section	.text,new
2005  0000               _UART2_SetAddress:
2007  0000 88            	push	a
2008       00000000      OFST:	set	0
2011                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2013                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2015  0001 c65247        	ld	a,21063
2016  0004 a4f0          	and	a,#240
2017  0006 c75247        	ld	21063,a
2018                     ; 557   UART2->CR4 |= UART2_Address;
2020  0009 c65247        	ld	a,21063
2021  000c 1a01          	or	a,(OFST+1,sp)
2022  000e c75247        	ld	21063,a
2023                     ; 558 }
2026  0011 84            	pop	a
2027  0012 81            	ret	
2061                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2061                     ; 567 {
2062                     .text:	section	.text,new
2063  0000               _UART2_SetGuardTime:
2067                     ; 569   UART2->GTR = UART2_GuardTime;
2069  0000 c7524a        	ld	21066,a
2070                     ; 570 }
2073  0003 81            	ret	
2107                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2107                     ; 595 {
2108                     .text:	section	.text,new
2109  0000               _UART2_SetPrescaler:
2113                     ; 597   UART2->PSCR = UART2_Prescaler;
2115  0000 c7524b        	ld	21067,a
2116                     ; 598 }
2119  0003 81            	ret	
2276                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2276                     ; 607 {
2277                     .text:	section	.text,new
2278  0000               _UART2_GetFlagStatus:
2280  0000 89            	pushw	x
2281  0001 88            	push	a
2282       00000001      OFST:	set	1
2285                     ; 608   FlagStatus status = RESET;
2287                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2289                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2291  0002 a30210        	cpw	x,#528
2292  0005 2608          	jrne	L5511
2293                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2295  0007 9f            	ld	a,xl
2296  0008 c45247        	and	a,21063
2297  000b 2726          	jreq	L3611
2298                     ; 619       status = SET;
2300  000d 201f          	jp	LC007
2301                     ; 624       status = RESET;
2302  000f               L5511:
2303                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2305  000f a30101        	cpw	x,#257
2306  0012 2609          	jrne	L5611
2307                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2309  0014 c65245        	ld	a,21061
2310  0017 1503          	bcp	a,(OFST+2,sp)
2311  0019 2717          	jreq	L1021
2312                     ; 632       status = SET;
2314  001b 2011          	jp	LC007
2315                     ; 637       status = RESET;
2316  001d               L5611:
2317                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2319  001d a30302        	cpw	x,#770
2320  0020 2705          	jreq	L7711
2322  0022 a30301        	cpw	x,#769
2323  0025 260f          	jrne	L5711
2324  0027               L7711:
2325                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2327  0027 c65249        	ld	a,21065
2328  002a 1503          	bcp	a,(OFST+2,sp)
2329  002c 2704          	jreq	L1021
2330                     ; 645       status = SET;
2332  002e               LC007:
2336  002e a601          	ld	a,#1
2340  0030 2001          	jra	L3611
2341  0032               L1021:
2342                     ; 650       status = RESET;
2346  0032 4f            	clr	a
2348  0033               L3611:
2349                     ; 668   return  status;
2353  0033 5b03          	addw	sp,#3
2354  0035 81            	ret	
2355  0036               L5711:
2356                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2358  0036 c65240        	ld	a,21056
2359  0039 1503          	bcp	a,(OFST+2,sp)
2360  003b 27f5          	jreq	L1021
2361                     ; 658       status = SET;
2363  003d 20ef          	jp	LC007
2364                     ; 663       status = RESET;
2399                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2399                     ; 700 {
2400                     .text:	section	.text,new
2401  0000               _UART2_ClearFlag:
2403       00000000      OFST:	set	0
2406                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2408                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2410  0000 a30020        	cpw	x,#32
2411  0003 2605          	jrne	L1321
2412                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2414  0005 35df5240      	mov	21056,#223
2417  0009 81            	ret	
2418  000a               L1321:
2419                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2421  000a a30210        	cpw	x,#528
2422  000d 2605          	jrne	L5321
2423                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2425  000f 72195247      	bres	21063,#4
2428  0013 81            	ret	
2429  0014               L5321:
2430                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2432  0014 a30302        	cpw	x,#770
2433  0017 2605          	jrne	L1421
2434                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2436  0019 72135249      	bres	21065,#1
2439  001d 81            	ret	
2440  001e               L1421:
2441                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2443  001e 72115249      	bres	21065,#0
2444                     ; 723 }
2447  0022 81            	ret	
2529                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2529                     ; 739 {
2530                     .text:	section	.text,new
2531  0000               _UART2_GetITStatus:
2533  0000 89            	pushw	x
2534  0001 89            	pushw	x
2535       00000002      OFST:	set	2
2538                     ; 740   ITStatus pendingbitstatus = RESET;
2540                     ; 741   uint8_t itpos = 0;
2542                     ; 742   uint8_t itmask1 = 0;
2544                     ; 743   uint8_t itmask2 = 0;
2546                     ; 744   uint8_t enablestatus = 0;
2548                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2550                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2552  0002 9f            	ld	a,xl
2553  0003 a40f          	and	a,#15
2554  0005 5f            	clrw	x
2555  0006 97            	ld	xl,a
2556  0007 a601          	ld	a,#1
2557  0009 5d            	tnzw	x
2558  000a 2704          	jreq	L67
2559  000c               L001:
2560  000c 48            	sll	a
2561  000d 5a            	decw	x
2562  000e 26fc          	jrne	L001
2563  0010               L67:
2564  0010 6b01          	ld	(OFST-1,sp),a
2566                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2568  0012 7b04          	ld	a,(OFST+2,sp)
2569  0014 4e            	swap	a
2570  0015 a40f          	and	a,#15
2571  0017 6b02          	ld	(OFST+0,sp),a
2573                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2575  0019 5f            	clrw	x
2576  001a 97            	ld	xl,a
2577  001b a601          	ld	a,#1
2578  001d 5d            	tnzw	x
2579  001e 2704          	jreq	L201
2580  0020               L401:
2581  0020 48            	sll	a
2582  0021 5a            	decw	x
2583  0022 26fc          	jrne	L401
2584  0024               L201:
2585  0024 6b02          	ld	(OFST+0,sp),a
2587                     ; 757   if (UART2_IT == UART2_IT_PE)
2589  0026 1e03          	ldw	x,(OFST+1,sp)
2590  0028 a30100        	cpw	x,#256
2591  002b 260c          	jrne	L7031
2592                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2594  002d c65244        	ld	a,21060
2595  0030 1402          	and	a,(OFST+0,sp)
2596  0032 6b02          	ld	(OFST+0,sp),a
2598                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2600  0034 c65240        	ld	a,21056
2602                     ; 766       pendingbitstatus = SET;
2604  0037 2020          	jp	LC010
2605                     ; 771       pendingbitstatus = RESET;
2606  0039               L7031:
2607                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2609  0039 a30346        	cpw	x,#838
2610  003c 260c          	jrne	L7131
2611                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2613  003e c65247        	ld	a,21063
2614  0041 1402          	and	a,(OFST+0,sp)
2615  0043 6b02          	ld	(OFST+0,sp),a
2617                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2619  0045 c65247        	ld	a,21063
2621                     ; 782       pendingbitstatus = SET;
2623  0048 200f          	jp	LC010
2624                     ; 787       pendingbitstatus = RESET;
2625  004a               L7131:
2626                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2628  004a a30412        	cpw	x,#1042
2629  004d 2616          	jrne	L7231
2630                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2632  004f c65249        	ld	a,21065
2633  0052 1402          	and	a,(OFST+0,sp)
2634  0054 6b02          	ld	(OFST+0,sp),a
2636                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2638  0056 c65249        	ld	a,21065
2640  0059               LC010:
2641  0059 1501          	bcp	a,(OFST-1,sp)
2642  005b 271a          	jreq	L7331
2643  005d 7b02          	ld	a,(OFST+0,sp)
2644  005f 2716          	jreq	L7331
2645                     ; 798       pendingbitstatus = SET;
2647  0061               LC009:
2651  0061 a601          	ld	a,#1
2654  0063 2013          	jra	L5131
2655                     ; 803       pendingbitstatus = RESET;
2656  0065               L7231:
2657                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2659  0065 c65245        	ld	a,21061
2660  0068 1402          	and	a,(OFST+0,sp)
2661  006a 6b02          	ld	(OFST+0,sp),a
2663                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2665  006c c65240        	ld	a,21056
2666  006f 1501          	bcp	a,(OFST-1,sp)
2667  0071 2704          	jreq	L7331
2669  0073 7b02          	ld	a,(OFST+0,sp)
2670                     ; 814       pendingbitstatus = SET;
2672  0075 26ea          	jrne	LC009
2673  0077               L7331:
2674                     ; 819       pendingbitstatus = RESET;
2679  0077 4f            	clr	a
2681  0078               L5131:
2682                     ; 823   return  pendingbitstatus;
2686  0078 5b04          	addw	sp,#4
2687  007a 81            	ret	
2723                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2723                     ; 853 {
2724                     .text:	section	.text,new
2725  0000               _UART2_ClearITPendingBit:
2727       00000000      OFST:	set	0
2730                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2732                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2734  0000 a30255        	cpw	x,#597
2735  0003 2605          	jrne	L1631
2736                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2738  0005 35df5240      	mov	21056,#223
2741  0009 81            	ret	
2742  000a               L1631:
2743                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2745  000a a30346        	cpw	x,#838
2746  000d 2605          	jrne	L5631
2747                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2749  000f 72195247      	bres	21063,#4
2752  0013 81            	ret	
2753  0014               L5631:
2754                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2756  0014 72135249      	bres	21065,#1
2757                     ; 871 }
2760  0018 81            	ret	
2773                     	xdef	_UART2_ClearITPendingBit
2774                     	xdef	_UART2_GetITStatus
2775                     	xdef	_UART2_ClearFlag
2776                     	xdef	_UART2_GetFlagStatus
2777                     	xdef	_UART2_SetPrescaler
2778                     	xdef	_UART2_SetGuardTime
2779                     	xdef	_UART2_SetAddress
2780                     	xdef	_UART2_SendBreak
2781                     	xdef	_UART2_SendData9
2782                     	xdef	_UART2_SendData8
2783                     	xdef	_UART2_ReceiveData9
2784                     	xdef	_UART2_ReceiveData8
2785                     	xdef	_UART2_ReceiverWakeUpCmd
2786                     	xdef	_UART2_WakeUpConfig
2787                     	xdef	_UART2_SmartCardNACKCmd
2788                     	xdef	_UART2_SmartCardCmd
2789                     	xdef	_UART2_LINCmd
2790                     	xdef	_UART2_LINConfig
2791                     	xdef	_UART2_LINBreakDetectionConfig
2792                     	xdef	_UART2_IrDACmd
2793                     	xdef	_UART2_IrDAConfig
2794                     	xdef	_UART2_ITConfig
2795                     	xdef	_UART2_Cmd
2796                     	xdef	_UART2_Init
2797                     	xdef	_UART2_DeInit
2798                     	xref	_CLK_GetClockFreq
2799                     	xref.b	c_lreg
2800                     	xref.b	c_x
2819                     	xref	c_lursh
2820                     	xref	c_lsub
2821                     	xref	c_smul
2822                     	xref	c_ludv
2823                     	xref	c_rtol
2824                     	xref	c_llsh
2825                     	xref	c_ltor
2826                     	end
