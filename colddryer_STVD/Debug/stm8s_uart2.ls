   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  43                     ; 53 void UART2_DeInit(void)
  43                     ; 54 {
  45                     .text:	section	.text,new
  46  0000               _UART2_DeInit:
  50                     ; 57   (void) UART2->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 58   (void)UART2->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  76  001e 725f5248      	clr	21064
  77                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  79  0022 725f5249      	clr	21065
  80                     ; 69 }
  83  0026 81            	ret
 404                     .const:	section	.text
 405  0000               L01:
 406  0000 00000064      	dc.l	100
 407                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 407                     ; 86 {
 408                     .text:	section	.text,new
 409  0000               _UART2_Init:
 411  0000 520e          	subw	sp,#14
 412       0000000e      OFST:	set	14
 415                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 419                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 423                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 425                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 427                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 429                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 431                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 433                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 435                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 437  0002 72195244      	bres	21060,#4
 438                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 440  0006 c65244        	ld	a,21060
 441  0009 1a15          	or	a,(OFST+7,sp)
 442  000b c75244        	ld	21060,a
 443                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 445  000e c65246        	ld	a,21062
 446  0011 a4cf          	and	a,#207
 447  0013 c75246        	ld	21062,a
 448                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 450  0016 c65246        	ld	a,21062
 451  0019 1a16          	or	a,(OFST+8,sp)
 452  001b c75246        	ld	21062,a
 453                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 455  001e c65244        	ld	a,21060
 456  0021 a4f9          	and	a,#249
 457  0023 c75244        	ld	21060,a
 458                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 460  0026 c65244        	ld	a,21060
 461  0029 1a17          	or	a,(OFST+9,sp)
 462  002b c75244        	ld	21060,a
 463                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 465  002e 725f5242      	clr	21058
 466                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 468  0032 c65243        	ld	a,21059
 469  0035 a40f          	and	a,#15
 470  0037 c75243        	ld	21059,a
 471                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 473  003a c65243        	ld	a,21059
 474  003d a4f0          	and	a,#240
 475  003f c75243        	ld	21059,a
 476                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 478  0042 96            	ldw	x,sp
 479  0043 1c0011        	addw	x,#OFST+3
 480  0046 cd0000        	call	c_ltor
 482  0049 a604          	ld	a,#4
 483  004b cd0000        	call	c_llsh
 485  004e 96            	ldw	x,sp
 486  004f 1c0001        	addw	x,#OFST-13
 487  0052 cd0000        	call	c_rtol
 490  0055 cd0000        	call	_CLK_GetClockFreq
 492  0058 96            	ldw	x,sp
 493  0059 1c0001        	addw	x,#OFST-13
 494  005c cd0000        	call	c_ludv
 496  005f 96            	ldw	x,sp
 497  0060 1c000b        	addw	x,#OFST-3
 498  0063 cd0000        	call	c_rtol
 501                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 503  0066 96            	ldw	x,sp
 504  0067 1c0011        	addw	x,#OFST+3
 505  006a cd0000        	call	c_ltor
 507  006d a604          	ld	a,#4
 508  006f cd0000        	call	c_llsh
 510  0072 96            	ldw	x,sp
 511  0073 1c0001        	addw	x,#OFST-13
 512  0076 cd0000        	call	c_rtol
 515  0079 cd0000        	call	_CLK_GetClockFreq
 517  007c a664          	ld	a,#100
 518  007e cd0000        	call	c_smul
 520  0081 96            	ldw	x,sp
 521  0082 1c0001        	addw	x,#OFST-13
 522  0085 cd0000        	call	c_ludv
 524  0088 96            	ldw	x,sp
 525  0089 1c0007        	addw	x,#OFST-7
 526  008c cd0000        	call	c_rtol
 529                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 529                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 531  008f 96            	ldw	x,sp
 532  0090 1c000b        	addw	x,#OFST-3
 533  0093 cd0000        	call	c_ltor
 535  0096 a664          	ld	a,#100
 536  0098 cd0000        	call	c_smul
 538  009b 96            	ldw	x,sp
 539  009c 1c0001        	addw	x,#OFST-13
 540  009f cd0000        	call	c_rtol
 543  00a2 96            	ldw	x,sp
 544  00a3 1c0007        	addw	x,#OFST-7
 545  00a6 cd0000        	call	c_ltor
 547  00a9 96            	ldw	x,sp
 548  00aa 1c0001        	addw	x,#OFST-13
 549  00ad cd0000        	call	c_lsub
 551  00b0 a604          	ld	a,#4
 552  00b2 cd0000        	call	c_llsh
 554  00b5 ae0000        	ldw	x,#L01
 555  00b8 cd0000        	call	c_ludv
 557  00bb b603          	ld	a,c_lreg+3
 558  00bd a40f          	and	a,#15
 559  00bf 6b05          	ld	(OFST-9,sp),a
 561                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 563  00c1 96            	ldw	x,sp
 564  00c2 1c000b        	addw	x,#OFST-3
 565  00c5 cd0000        	call	c_ltor
 567  00c8 a604          	ld	a,#4
 568  00ca cd0000        	call	c_lursh
 570  00cd b603          	ld	a,c_lreg+3
 571  00cf a4f0          	and	a,#240
 572  00d1 b703          	ld	c_lreg+3,a
 573  00d3 3f02          	clr	c_lreg+2
 574  00d5 3f01          	clr	c_lreg+1
 575  00d7 3f00          	clr	c_lreg
 576  00d9 b603          	ld	a,c_lreg+3
 577  00db 6b06          	ld	(OFST-8,sp),a
 579                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 581  00dd 7b05          	ld	a,(OFST-9,sp)
 582  00df 1a06          	or	a,(OFST-8,sp)
 583  00e1 c75243        	ld	21059,a
 584                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 586  00e4 7b0e          	ld	a,(OFST+0,sp)
 587  00e6 c75242        	ld	21058,a
 588                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 590  00e9 c65245        	ld	a,21061
 591  00ec a4f3          	and	a,#243
 592  00ee c75245        	ld	21061,a
 593                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 595  00f1 c65246        	ld	a,21062
 596  00f4 a4f8          	and	a,#248
 597  00f6 c75246        	ld	21062,a
 598                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 598                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 600  00f9 7b18          	ld	a,(OFST+10,sp)
 601  00fb a407          	and	a,#7
 602  00fd ca5246        	or	a,21062
 603  0100 c75246        	ld	21062,a
 604                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 606  0103 7b19          	ld	a,(OFST+11,sp)
 607  0105 a504          	bcp	a,#4
 608  0107 2706          	jreq	L302
 609                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 611  0109 72165245      	bset	21061,#3
 613  010d 2004          	jra	L502
 614  010f               L302:
 615                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 617  010f 72175245      	bres	21061,#3
 618  0113               L502:
 619                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 621  0113 7b19          	ld	a,(OFST+11,sp)
 622  0115 a508          	bcp	a,#8
 623  0117 2706          	jreq	L702
 624                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 626  0119 72145245      	bset	21061,#2
 628  011d 2004          	jra	L112
 629  011f               L702:
 630                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 632  011f 72155245      	bres	21061,#2
 633  0123               L112:
 634                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 636  0123 7b18          	ld	a,(OFST+10,sp)
 637  0125 a580          	bcp	a,#128
 638  0127 2706          	jreq	L312
 639                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 641  0129 72175246      	bres	21062,#3
 643  012d 200a          	jra	L512
 644  012f               L312:
 645                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 647  012f 7b18          	ld	a,(OFST+10,sp)
 648  0131 a408          	and	a,#8
 649  0133 ca5246        	or	a,21062
 650  0136 c75246        	ld	21062,a
 651  0139               L512:
 652                     ; 173 }
 655  0139 5b0e          	addw	sp,#14
 656  013b 81            	ret
 711                     ; 181 void UART2_Cmd(FunctionalState NewState)
 711                     ; 182 {
 712                     .text:	section	.text,new
 713  0000               _UART2_Cmd:
 717                     ; 183   if (NewState != DISABLE)
 719  0000 4d            	tnz	a
 720  0001 2706          	jreq	L542
 721                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 723  0003 721b5244      	bres	21060,#5
 725  0007 2004          	jra	L742
 726  0009               L542:
 727                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 729  0009 721a5244      	bset	21060,#5
 730  000d               L742:
 731                     ; 193 }
 734  000d 81            	ret
 866                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 866                     ; 211 {
 867                     .text:	section	.text,new
 868  0000               _UART2_ITConfig:
 870  0000 89            	pushw	x
 871  0001 89            	pushw	x
 872       00000002      OFST:	set	2
 875                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 879                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 881                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 883                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 885  0002 9e            	ld	a,xh
 886  0003 6b01          	ld	(OFST-1,sp),a
 888                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 890  0005 9f            	ld	a,xl
 891  0006 a40f          	and	a,#15
 892  0008 5f            	clrw	x
 893  0009 97            	ld	xl,a
 894  000a a601          	ld	a,#1
 895  000c 5d            	tnzw	x
 896  000d 2704          	jreq	L61
 897  000f               L02:
 898  000f 48            	sll	a
 899  0010 5a            	decw	x
 900  0011 26fc          	jrne	L02
 901  0013               L61:
 902  0013 6b02          	ld	(OFST+0,sp),a
 904                     ; 224   if (NewState != DISABLE)
 906  0015 0d07          	tnz	(OFST+5,sp)
 907  0017 273a          	jreq	L133
 908                     ; 227     if (uartreg == 0x01)
 910  0019 7b01          	ld	a,(OFST-1,sp)
 911  001b a101          	cp	a,#1
 912  001d 260a          	jrne	L333
 913                     ; 229       UART2->CR1 |= itpos;
 915  001f c65244        	ld	a,21060
 916  0022 1a02          	or	a,(OFST+0,sp)
 917  0024 c75244        	ld	21060,a
 919  0027 2066          	jra	L743
 920  0029               L333:
 921                     ; 231     else if (uartreg == 0x02)
 923  0029 7b01          	ld	a,(OFST-1,sp)
 924  002b a102          	cp	a,#2
 925  002d 260a          	jrne	L733
 926                     ; 233       UART2->CR2 |= itpos;
 928  002f c65245        	ld	a,21061
 929  0032 1a02          	or	a,(OFST+0,sp)
 930  0034 c75245        	ld	21061,a
 932  0037 2056          	jra	L743
 933  0039               L733:
 934                     ; 235     else if (uartreg == 0x03)
 936  0039 7b01          	ld	a,(OFST-1,sp)
 937  003b a103          	cp	a,#3
 938  003d 260a          	jrne	L343
 939                     ; 237       UART2->CR4 |= itpos;
 941  003f c65247        	ld	a,21063
 942  0042 1a02          	or	a,(OFST+0,sp)
 943  0044 c75247        	ld	21063,a
 945  0047 2046          	jra	L743
 946  0049               L343:
 947                     ; 241       UART2->CR6 |= itpos;
 949  0049 c65249        	ld	a,21065
 950  004c 1a02          	or	a,(OFST+0,sp)
 951  004e c75249        	ld	21065,a
 952  0051 203c          	jra	L743
 953  0053               L133:
 954                     ; 247     if (uartreg == 0x01)
 956  0053 7b01          	ld	a,(OFST-1,sp)
 957  0055 a101          	cp	a,#1
 958  0057 260b          	jrne	L153
 959                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 961  0059 7b02          	ld	a,(OFST+0,sp)
 962  005b 43            	cpl	a
 963  005c c45244        	and	a,21060
 964  005f c75244        	ld	21060,a
 966  0062 202b          	jra	L743
 967  0064               L153:
 968                     ; 251     else if (uartreg == 0x02)
 970  0064 7b01          	ld	a,(OFST-1,sp)
 971  0066 a102          	cp	a,#2
 972  0068 260b          	jrne	L553
 973                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 975  006a 7b02          	ld	a,(OFST+0,sp)
 976  006c 43            	cpl	a
 977  006d c45245        	and	a,21061
 978  0070 c75245        	ld	21061,a
 980  0073 201a          	jra	L743
 981  0075               L553:
 982                     ; 255     else if (uartreg == 0x03)
 984  0075 7b01          	ld	a,(OFST-1,sp)
 985  0077 a103          	cp	a,#3
 986  0079 260b          	jrne	L163
 987                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 989  007b 7b02          	ld	a,(OFST+0,sp)
 990  007d 43            	cpl	a
 991  007e c45247        	and	a,21063
 992  0081 c75247        	ld	21063,a
 994  0084 2009          	jra	L743
 995  0086               L163:
 996                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 998  0086 7b02          	ld	a,(OFST+0,sp)
 999  0088 43            	cpl	a
1000  0089 c45249        	and	a,21065
1001  008c c75249        	ld	21065,a
1002  008f               L743:
1003                     ; 264 }
1006  008f 5b04          	addw	sp,#4
1007  0091 81            	ret
1064                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1064                     ; 273 {
1065                     .text:	section	.text,new
1066  0000               _UART2_IrDAConfig:
1070                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1072                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1074  0000 4d            	tnz	a
1075  0001 2706          	jreq	L314
1076                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1078  0003 72145248      	bset	21064,#2
1080  0007 2004          	jra	L514
1081  0009               L314:
1082                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1084  0009 72155248      	bres	21064,#2
1085  000d               L514:
1086                     ; 284 }
1089  000d 81            	ret
1124                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1124                     ; 293 {
1125                     .text:	section	.text,new
1126  0000               _UART2_IrDACmd:
1130                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1132                     ; 297   if (NewState != DISABLE)
1134  0000 4d            	tnz	a
1135  0001 2706          	jreq	L534
1136                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1138  0003 72125248      	bset	21064,#1
1140  0007 2004          	jra	L734
1141  0009               L534:
1142                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1144  0009 72135248      	bres	21064,#1
1145  000d               L734:
1146                     ; 307 }
1149  000d 81            	ret
1208                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1208                     ; 317 {
1209                     .text:	section	.text,new
1210  0000               _UART2_LINBreakDetectionConfig:
1214                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1216                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1218  0000 4d            	tnz	a
1219  0001 2706          	jreq	L764
1220                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1222  0003 721a5247      	bset	21063,#5
1224  0007 2004          	jra	L174
1225  0009               L764:
1226                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1228  0009 721b5247      	bres	21063,#5
1229  000d               L174:
1230                     ; 329 }
1233  000d 81            	ret
1354                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1354                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1354                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1354                     ; 344 {
1355                     .text:	section	.text,new
1356  0000               _UART2_LINConfig:
1358  0000 89            	pushw	x
1359       00000000      OFST:	set	0
1362                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1364                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1366                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1368                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1370  0001 9e            	ld	a,xh
1371  0002 4d            	tnz	a
1372  0003 2706          	jreq	L155
1373                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1375  0005 721a5249      	bset	21065,#5
1377  0009 2004          	jra	L355
1378  000b               L155:
1379                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1381  000b 721b5249      	bres	21065,#5
1382  000f               L355:
1383                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1385  000f 0d02          	tnz	(OFST+2,sp)
1386  0011 2706          	jreq	L555
1387                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1389  0013 72185249      	bset	21065,#4
1391  0017 2004          	jra	L755
1392  0019               L555:
1393                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1395  0019 72195249      	bres	21065,#4
1396  001d               L755:
1397                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1399  001d 0d05          	tnz	(OFST+5,sp)
1400  001f 2706          	jreq	L165
1401                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1403  0021 721e5249      	bset	21065,#7
1405  0025 2004          	jra	L365
1406  0027               L165:
1407                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1409  0027 721f5249      	bres	21065,#7
1410  002b               L365:
1411                     ; 376 }
1414  002b 85            	popw	x
1415  002c 81            	ret
1450                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1450                     ; 385 {
1451                     .text:	section	.text,new
1452  0000               _UART2_LINCmd:
1456                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1458                     ; 388   if (NewState != DISABLE)
1460  0000 4d            	tnz	a
1461  0001 2706          	jreq	L306
1462                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1464  0003 721c5246      	bset	21062,#6
1466  0007 2004          	jra	L506
1467  0009               L306:
1468                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1470  0009 721d5246      	bres	21062,#6
1471  000d               L506:
1472                     ; 398 }
1475  000d 81            	ret
1510                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1510                     ; 407 {
1511                     .text:	section	.text,new
1512  0000               _UART2_SmartCardCmd:
1516                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1518                     ; 411   if (NewState != DISABLE)
1520  0000 4d            	tnz	a
1521  0001 2706          	jreq	L526
1522                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1524  0003 721a5248      	bset	21064,#5
1526  0007 2004          	jra	L726
1527  0009               L526:
1528                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1530  0009 721b5248      	bres	21064,#5
1531  000d               L726:
1532                     ; 421 }
1535  000d 81            	ret
1571                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1571                     ; 430 {
1572                     .text:	section	.text,new
1573  0000               _UART2_SmartCardNACKCmd:
1577                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1579                     ; 434   if (NewState != DISABLE)
1581  0000 4d            	tnz	a
1582  0001 2706          	jreq	L746
1583                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1585  0003 72185248      	bset	21064,#4
1587  0007 2004          	jra	L156
1588  0009               L746:
1589                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1591  0009 72195248      	bres	21064,#4
1592  000d               L156:
1593                     ; 444 }
1596  000d 81            	ret
1653                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1653                     ; 453 {
1654                     .text:	section	.text,new
1655  0000               _UART2_WakeUpConfig:
1659                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1661                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1663  0000 72175244      	bres	21060,#3
1664                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1666  0004 ca5244        	or	a,21060
1667  0007 c75244        	ld	21060,a
1668                     ; 458 }
1671  000a 81            	ret
1707                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1707                     ; 467 {
1708                     .text:	section	.text,new
1709  0000               _UART2_ReceiverWakeUpCmd:
1713                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1715                     ; 470   if (NewState != DISABLE)
1717  0000 4d            	tnz	a
1718  0001 2706          	jreq	L717
1719                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1721  0003 72125245      	bset	21061,#1
1723  0007 2004          	jra	L127
1724  0009               L717:
1725                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1727  0009 72135245      	bres	21061,#1
1728  000d               L127:
1729                     ; 480 }
1732  000d 81            	ret
1755                     ; 487 uint8_t UART2_ReceiveData8(void)
1755                     ; 488 {
1756                     .text:	section	.text,new
1757  0000               _UART2_ReceiveData8:
1761                     ; 489   return ((uint8_t)UART2->DR);
1763  0000 c65241        	ld	a,21057
1766  0003 81            	ret
1800                     ; 497 uint16_t UART2_ReceiveData9(void)
1800                     ; 498 {
1801                     .text:	section	.text,new
1802  0000               _UART2_ReceiveData9:
1804  0000 89            	pushw	x
1805       00000002      OFST:	set	2
1808                     ; 499   uint16_t temp = 0;
1810                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1812  0001 c65244        	ld	a,21060
1813  0004 5f            	clrw	x
1814  0005 a480          	and	a,#128
1815  0007 5f            	clrw	x
1816  0008 02            	rlwa	x,a
1817  0009 58            	sllw	x
1818  000a 1f01          	ldw	(OFST-1,sp),x
1820                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1822  000c c65241        	ld	a,21057
1823  000f 5f            	clrw	x
1824  0010 97            	ld	xl,a
1825  0011 01            	rrwa	x,a
1826  0012 1a02          	or	a,(OFST+0,sp)
1827  0014 01            	rrwa	x,a
1828  0015 1a01          	or	a,(OFST-1,sp)
1829  0017 01            	rrwa	x,a
1830  0018 01            	rrwa	x,a
1831  0019 a4ff          	and	a,#255
1832  001b 01            	rrwa	x,a
1833  001c a401          	and	a,#1
1834  001e 01            	rrwa	x,a
1837  001f 5b02          	addw	sp,#2
1838  0021 81            	ret
1872                     ; 511 void UART2_SendData8(uint8_t Data)
1872                     ; 512 {
1873                     .text:	section	.text,new
1874  0000               _UART2_SendData8:
1878                     ; 514   UART2->DR = Data;
1880  0000 c75241        	ld	21057,a
1881                     ; 515 }
1884  0003 81            	ret
1918                     ; 522 void UART2_SendData9(uint16_t Data)
1918                     ; 523 {
1919                     .text:	section	.text,new
1920  0000               _UART2_SendData9:
1922  0000 89            	pushw	x
1923       00000000      OFST:	set	0
1926                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1928  0001 721d5244      	bres	21060,#6
1929                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1931  0005 54            	srlw	x
1932  0006 54            	srlw	x
1933  0007 9f            	ld	a,xl
1934  0008 a440          	and	a,#64
1935  000a ca5244        	or	a,21060
1936  000d c75244        	ld	21060,a
1937                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1939  0010 7b02          	ld	a,(OFST+2,sp)
1940  0012 c75241        	ld	21057,a
1941                     ; 532 }
1944  0015 85            	popw	x
1945  0016 81            	ret
1968                     ; 539 void UART2_SendBreak(void)
1968                     ; 540 {
1969                     .text:	section	.text,new
1970  0000               _UART2_SendBreak:
1974                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1976  0000 72105245      	bset	21061,#0
1977                     ; 542 }
1980  0004 81            	ret
2014                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2014                     ; 550 {
2015                     .text:	section	.text,new
2016  0000               _UART2_SetAddress:
2018  0000 88            	push	a
2019       00000000      OFST:	set	0
2022                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2024                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2026  0001 c65247        	ld	a,21063
2027  0004 a4f0          	and	a,#240
2028  0006 c75247        	ld	21063,a
2029                     ; 557   UART2->CR4 |= UART2_Address;
2031  0009 c65247        	ld	a,21063
2032  000c 1a01          	or	a,(OFST+1,sp)
2033  000e c75247        	ld	21063,a
2034                     ; 558 }
2037  0011 84            	pop	a
2038  0012 81            	ret
2072                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2072                     ; 567 {
2073                     .text:	section	.text,new
2074  0000               _UART2_SetGuardTime:
2078                     ; 569   UART2->GTR = UART2_GuardTime;
2080  0000 c7524a        	ld	21066,a
2081                     ; 570 }
2084  0003 81            	ret
2118                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2118                     ; 595 {
2119                     .text:	section	.text,new
2120  0000               _UART2_SetPrescaler:
2124                     ; 597   UART2->PSCR = UART2_Prescaler;
2126  0000 c7524b        	ld	21067,a
2127                     ; 598 }
2130  0003 81            	ret
2287                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2287                     ; 607 {
2288                     .text:	section	.text,new
2289  0000               _UART2_GetFlagStatus:
2291  0000 89            	pushw	x
2292  0001 88            	push	a
2293       00000001      OFST:	set	1
2296                     ; 608   FlagStatus status = RESET;
2298                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2300                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2302  0002 a30210        	cpw	x,#528
2303  0005 2610          	jrne	L5511
2304                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2306  0007 9f            	ld	a,xl
2307  0008 c45247        	and	a,21063
2308  000b 2706          	jreq	L7511
2309                     ; 619       status = SET;
2311  000d a601          	ld	a,#1
2312  000f 6b01          	ld	(OFST+0,sp),a
2315  0011 2039          	jra	L3611
2316  0013               L7511:
2317                     ; 624       status = RESET;
2319  0013 0f01          	clr	(OFST+0,sp)
2321  0015 2035          	jra	L3611
2322  0017               L5511:
2323                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2325  0017 1e02          	ldw	x,(OFST+1,sp)
2326  0019 a30101        	cpw	x,#257
2327  001c 2611          	jrne	L5611
2328                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2330  001e c65245        	ld	a,21061
2331  0021 1503          	bcp	a,(OFST+2,sp)
2332  0023 2706          	jreq	L7611
2333                     ; 632       status = SET;
2335  0025 a601          	ld	a,#1
2336  0027 6b01          	ld	(OFST+0,sp),a
2339  0029 2021          	jra	L3611
2340  002b               L7611:
2341                     ; 637       status = RESET;
2343  002b 0f01          	clr	(OFST+0,sp)
2345  002d 201d          	jra	L3611
2346  002f               L5611:
2347                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2349  002f 1e02          	ldw	x,(OFST+1,sp)
2350  0031 a30302        	cpw	x,#770
2351  0034 2707          	jreq	L7711
2353  0036 1e02          	ldw	x,(OFST+1,sp)
2354  0038 a30301        	cpw	x,#769
2355  003b 2614          	jrne	L5711
2356  003d               L7711:
2357                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2359  003d c65249        	ld	a,21065
2360  0040 1503          	bcp	a,(OFST+2,sp)
2361  0042 2706          	jreq	L1021
2362                     ; 645       status = SET;
2364  0044 a601          	ld	a,#1
2365  0046 6b01          	ld	(OFST+0,sp),a
2368  0048 2002          	jra	L3611
2369  004a               L1021:
2370                     ; 650       status = RESET;
2372  004a 0f01          	clr	(OFST+0,sp)
2374  004c               L3611:
2375                     ; 668   return  status;
2377  004c 7b01          	ld	a,(OFST+0,sp)
2380  004e 5b03          	addw	sp,#3
2381  0050 81            	ret
2382  0051               L5711:
2383                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2385  0051 c65240        	ld	a,21056
2386  0054 1503          	bcp	a,(OFST+2,sp)
2387  0056 2706          	jreq	L7021
2388                     ; 658       status = SET;
2390  0058 a601          	ld	a,#1
2391  005a 6b01          	ld	(OFST+0,sp),a
2394  005c 20ee          	jra	L3611
2395  005e               L7021:
2396                     ; 663       status = RESET;
2398  005e 0f01          	clr	(OFST+0,sp)
2400  0060 20ea          	jra	L3611
2435                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2435                     ; 700 {
2436                     .text:	section	.text,new
2437  0000               _UART2_ClearFlag:
2439  0000 89            	pushw	x
2440       00000000      OFST:	set	0
2443                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2445                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2447  0001 a30020        	cpw	x,#32
2448  0004 2606          	jrne	L1321
2449                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2451  0006 35df5240      	mov	21056,#223
2453  000a 201e          	jra	L3321
2454  000c               L1321:
2455                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2457  000c 1e01          	ldw	x,(OFST+1,sp)
2458  000e a30210        	cpw	x,#528
2459  0011 2606          	jrne	L5321
2460                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2462  0013 72195247      	bres	21063,#4
2464  0017 2011          	jra	L3321
2465  0019               L5321:
2466                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2468  0019 1e01          	ldw	x,(OFST+1,sp)
2469  001b a30302        	cpw	x,#770
2470  001e 2606          	jrne	L1421
2471                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2473  0020 72135249      	bres	21065,#1
2475  0024 2004          	jra	L3321
2476  0026               L1421:
2477                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2479  0026 72115249      	bres	21065,#0
2480  002a               L3321:
2481                     ; 723 }
2484  002a 85            	popw	x
2485  002b 81            	ret
2567                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2567                     ; 739 {
2568                     .text:	section	.text,new
2569  0000               _UART2_GetITStatus:
2571  0000 89            	pushw	x
2572  0001 89            	pushw	x
2573       00000002      OFST:	set	2
2576                     ; 740   ITStatus pendingbitstatus = RESET;
2578                     ; 741   uint8_t itpos = 0;
2580                     ; 742   uint8_t itmask1 = 0;
2582                     ; 743   uint8_t itmask2 = 0;
2584                     ; 744   uint8_t enablestatus = 0;
2586                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2588                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2590  0002 9f            	ld	a,xl
2591  0003 a40f          	and	a,#15
2592  0005 5f            	clrw	x
2593  0006 97            	ld	xl,a
2594  0007 a601          	ld	a,#1
2595  0009 5d            	tnzw	x
2596  000a 2704          	jreq	L27
2597  000c               L47:
2598  000c 48            	sll	a
2599  000d 5a            	decw	x
2600  000e 26fc          	jrne	L47
2601  0010               L27:
2602  0010 6b01          	ld	(OFST-1,sp),a
2604                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2606  0012 7b04          	ld	a,(OFST+2,sp)
2607  0014 4e            	swap	a
2608  0015 a40f          	and	a,#15
2609  0017 6b02          	ld	(OFST+0,sp),a
2611                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2613  0019 7b02          	ld	a,(OFST+0,sp)
2614  001b 5f            	clrw	x
2615  001c 97            	ld	xl,a
2616  001d a601          	ld	a,#1
2617  001f 5d            	tnzw	x
2618  0020 2704          	jreq	L67
2619  0022               L001:
2620  0022 48            	sll	a
2621  0023 5a            	decw	x
2622  0024 26fc          	jrne	L001
2623  0026               L67:
2624  0026 6b02          	ld	(OFST+0,sp),a
2626                     ; 757   if (UART2_IT == UART2_IT_PE)
2628  0028 1e03          	ldw	x,(OFST+1,sp)
2629  002a a30100        	cpw	x,#256
2630  002d 261c          	jrne	L7031
2631                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2633  002f c65244        	ld	a,21060
2634  0032 1402          	and	a,(OFST+0,sp)
2635  0034 6b02          	ld	(OFST+0,sp),a
2637                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2639  0036 c65240        	ld	a,21056
2640  0039 1501          	bcp	a,(OFST-1,sp)
2641  003b 270a          	jreq	L1131
2643  003d 0d02          	tnz	(OFST+0,sp)
2644  003f 2706          	jreq	L1131
2645                     ; 766       pendingbitstatus = SET;
2647  0041 a601          	ld	a,#1
2648  0043 6b02          	ld	(OFST+0,sp),a
2651  0045 2064          	jra	L5131
2652  0047               L1131:
2653                     ; 771       pendingbitstatus = RESET;
2655  0047 0f02          	clr	(OFST+0,sp)
2657  0049 2060          	jra	L5131
2658  004b               L7031:
2659                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2661  004b 1e03          	ldw	x,(OFST+1,sp)
2662  004d a30346        	cpw	x,#838
2663  0050 261c          	jrne	L7131
2664                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2666  0052 c65247        	ld	a,21063
2667  0055 1402          	and	a,(OFST+0,sp)
2668  0057 6b02          	ld	(OFST+0,sp),a
2670                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2672  0059 c65247        	ld	a,21063
2673  005c 1501          	bcp	a,(OFST-1,sp)
2674  005e 270a          	jreq	L1231
2676  0060 0d02          	tnz	(OFST+0,sp)
2677  0062 2706          	jreq	L1231
2678                     ; 782       pendingbitstatus = SET;
2680  0064 a601          	ld	a,#1
2681  0066 6b02          	ld	(OFST+0,sp),a
2684  0068 2041          	jra	L5131
2685  006a               L1231:
2686                     ; 787       pendingbitstatus = RESET;
2688  006a 0f02          	clr	(OFST+0,sp)
2690  006c 203d          	jra	L5131
2691  006e               L7131:
2692                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2694  006e 1e03          	ldw	x,(OFST+1,sp)
2695  0070 a30412        	cpw	x,#1042
2696  0073 261c          	jrne	L7231
2697                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2699  0075 c65249        	ld	a,21065
2700  0078 1402          	and	a,(OFST+0,sp)
2701  007a 6b02          	ld	(OFST+0,sp),a
2703                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2705  007c c65249        	ld	a,21065
2706  007f 1501          	bcp	a,(OFST-1,sp)
2707  0081 270a          	jreq	L1331
2709  0083 0d02          	tnz	(OFST+0,sp)
2710  0085 2706          	jreq	L1331
2711                     ; 798       pendingbitstatus = SET;
2713  0087 a601          	ld	a,#1
2714  0089 6b02          	ld	(OFST+0,sp),a
2717  008b 201e          	jra	L5131
2718  008d               L1331:
2719                     ; 803       pendingbitstatus = RESET;
2721  008d 0f02          	clr	(OFST+0,sp)
2723  008f 201a          	jra	L5131
2724  0091               L7231:
2725                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2727  0091 c65245        	ld	a,21061
2728  0094 1402          	and	a,(OFST+0,sp)
2729  0096 6b02          	ld	(OFST+0,sp),a
2731                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2733  0098 c65240        	ld	a,21056
2734  009b 1501          	bcp	a,(OFST-1,sp)
2735  009d 270a          	jreq	L7331
2737  009f 0d02          	tnz	(OFST+0,sp)
2738  00a1 2706          	jreq	L7331
2739                     ; 814       pendingbitstatus = SET;
2741  00a3 a601          	ld	a,#1
2742  00a5 6b02          	ld	(OFST+0,sp),a
2745  00a7 2002          	jra	L5131
2746  00a9               L7331:
2747                     ; 819       pendingbitstatus = RESET;
2749  00a9 0f02          	clr	(OFST+0,sp)
2751  00ab               L5131:
2752                     ; 823   return  pendingbitstatus;
2754  00ab 7b02          	ld	a,(OFST+0,sp)
2757  00ad 5b04          	addw	sp,#4
2758  00af 81            	ret
2794                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2794                     ; 853 {
2795                     .text:	section	.text,new
2796  0000               _UART2_ClearITPendingBit:
2798  0000 89            	pushw	x
2799       00000000      OFST:	set	0
2802                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2804                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2806  0001 a30255        	cpw	x,#597
2807  0004 2606          	jrne	L1631
2808                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2810  0006 35df5240      	mov	21056,#223
2812  000a 2011          	jra	L3631
2813  000c               L1631:
2814                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2816  000c 1e01          	ldw	x,(OFST+1,sp)
2817  000e a30346        	cpw	x,#838
2818  0011 2606          	jrne	L5631
2819                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2821  0013 72195247      	bres	21063,#4
2823  0017 2004          	jra	L3631
2824  0019               L5631:
2825                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2827  0019 72135249      	bres	21065,#1
2828  001d               L3631:
2829                     ; 871 }
2832  001d 85            	popw	x
2833  001e 81            	ret
2846                     	xdef	_UART2_ClearITPendingBit
2847                     	xdef	_UART2_GetITStatus
2848                     	xdef	_UART2_ClearFlag
2849                     	xdef	_UART2_GetFlagStatus
2850                     	xdef	_UART2_SetPrescaler
2851                     	xdef	_UART2_SetGuardTime
2852                     	xdef	_UART2_SetAddress
2853                     	xdef	_UART2_SendBreak
2854                     	xdef	_UART2_SendData9
2855                     	xdef	_UART2_SendData8
2856                     	xdef	_UART2_ReceiveData9
2857                     	xdef	_UART2_ReceiveData8
2858                     	xdef	_UART2_ReceiverWakeUpCmd
2859                     	xdef	_UART2_WakeUpConfig
2860                     	xdef	_UART2_SmartCardNACKCmd
2861                     	xdef	_UART2_SmartCardCmd
2862                     	xdef	_UART2_LINCmd
2863                     	xdef	_UART2_LINConfig
2864                     	xdef	_UART2_LINBreakDetectionConfig
2865                     	xdef	_UART2_IrDACmd
2866                     	xdef	_UART2_IrDAConfig
2867                     	xdef	_UART2_ITConfig
2868                     	xdef	_UART2_Cmd
2869                     	xdef	_UART2_Init
2870                     	xdef	_UART2_DeInit
2871                     	xref	_CLK_GetClockFreq
2872                     	xref.b	c_lreg
2873                     	xref.b	c_x
2892                     	xref	c_lursh
2893                     	xref	c_lsub
2894                     	xref	c_smul
2895                     	xref	c_ludv
2896                     	xref	c_rtol
2897                     	xref	c_llsh
2898                     	xref	c_ltor
2899                     	end
