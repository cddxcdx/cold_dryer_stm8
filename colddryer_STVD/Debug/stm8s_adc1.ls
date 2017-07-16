   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  43                     ; 52 void ADC1_DeInit(void)
  43                     ; 53 {
  45                     .text:	section	.text,new
  46  0000               _ADC1_DeInit:
  50                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  61  000c 725f5403      	clr	21507
  62                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  64  0010 725f5406      	clr	21510
  65                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  67  0014 725f5407      	clr	21511
  68                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  70  0018 35ff5408      	mov	21512,#255
  71                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  73  001c 35035409      	mov	21513,#3
  74                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  76  0020 725f540a      	clr	21514
  77                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  79  0024 725f540b      	clr	21515
  80                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  82  0028 725f540e      	clr	21518
  83                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  85  002c 725f540f      	clr	21519
  86                     ; 66 }
  89  0030 81            	ret
 540                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 540                     ; 89 {
 541                     .text:	section	.text,new
 542  0000               _ADC1_Init:
 544  0000 89            	pushw	x
 545       00000000      OFST:	set	0
 548                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 550                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 552                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 554                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 556                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 558                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 560                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 562                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 564                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 566  0001 7b08          	ld	a,(OFST+8,sp)
 567  0003 88            	push	a
 568  0004 9f            	ld	a,xl
 569  0005 97            	ld	xl,a
 570  0006 7b02          	ld	a,(OFST+2,sp)
 571  0008 95            	ld	xh,a
 572  0009 cd0000        	call	_ADC1_ConversionConfig
 574  000c 84            	pop	a
 575                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 577  000d 7b05          	ld	a,(OFST+5,sp)
 578  000f cd0000        	call	_ADC1_PrescalerConfig
 580                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 582  0012 7b07          	ld	a,(OFST+7,sp)
 583  0014 97            	ld	xl,a
 584  0015 7b06          	ld	a,(OFST+6,sp)
 585  0017 95            	ld	xh,a
 586  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 588                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 590  001b 7b0a          	ld	a,(OFST+10,sp)
 591  001d 97            	ld	xl,a
 592  001e 7b09          	ld	a,(OFST+9,sp)
 593  0020 95            	ld	xh,a
 594  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 596                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 598  0024 72105401      	bset	21505,#0
 599                     ; 119 }
 602  0028 85            	popw	x
 603  0029 81            	ret
 638                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 638                     ; 127 {
 639                     .text:	section	.text,new
 640  0000               _ADC1_Cmd:
 644                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 646                     ; 131   if (NewState != DISABLE)
 648  0000 4d            	tnz	a
 649  0001 2706          	jreq	L362
 650                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 652  0003 72105401      	bset	21505,#0
 654  0007 2004          	jra	L562
 655  0009               L362:
 656                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 658  0009 72115401      	bres	21505,#0
 659  000d               L562:
 660                     ; 139 }
 663  000d 81            	ret
 698                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 698                     ; 147 {
 699                     .text:	section	.text,new
 700  0000               _ADC1_ScanModeCmd:
 704                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 706                     ; 151   if (NewState != DISABLE)
 708  0000 4d            	tnz	a
 709  0001 2706          	jreq	L503
 710                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 712  0003 72125402      	bset	21506,#1
 714  0007 2004          	jra	L703
 715  0009               L503:
 716                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 718  0009 72135402      	bres	21506,#1
 719  000d               L703:
 720                     ; 159 }
 723  000d 81            	ret
 758                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 758                     ; 167 {
 759                     .text:	section	.text,new
 760  0000               _ADC1_DataBufferCmd:
 764                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 766                     ; 171   if (NewState != DISABLE)
 768  0000 4d            	tnz	a
 769  0001 2706          	jreq	L723
 770                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 772  0003 721e5403      	bset	21507,#7
 774  0007 2004          	jra	L133
 775  0009               L723:
 776                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 778  0009 721f5403      	bres	21507,#7
 779  000d               L133:
 780                     ; 179 }
 783  000d 81            	ret
 939                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 939                     ; 191 {
 940                     .text:	section	.text,new
 941  0000               _ADC1_ITConfig:
 943  0000 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 949                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 951                     ; 196   if (NewState != DISABLE)
 953  0001 0d05          	tnz	(OFST+5,sp)
 954  0003 2709          	jreq	L714
 955                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 957  0005 9f            	ld	a,xl
 958  0006 ca5400        	or	a,21504
 959  0009 c75400        	ld	21504,a
 961  000c 2009          	jra	L124
 962  000e               L714:
 963                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  000e 7b02          	ld	a,(OFST+2,sp)
 966  0010 43            	cpl	a
 967  0011 c45400        	and	a,21504
 968  0014 c75400        	ld	21504,a
 969  0017               L124:
 970                     ; 206 }
 973  0017 85            	popw	x
 974  0018 81            	ret
1010                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1010                     ; 215 {
1011                     .text:	section	.text,new
1012  0000               _ADC1_PrescalerConfig:
1014  0000 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1020                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1022  0001 c65401        	ld	a,21505
1023  0004 a48f          	and	a,#143
1024  0006 c75401        	ld	21505,a
1025                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1027  0009 c65401        	ld	a,21505
1028  000c 1a01          	or	a,(OFST+1,sp)
1029  000e c75401        	ld	21505,a
1030                     ; 223 }
1033  0011 84            	pop	a
1034  0012 81            	ret
1081                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1081                     ; 234 {
1082                     .text:	section	.text,new
1083  0000               _ADC1_SchmittTriggerConfig:
1085  0000 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1091                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1093                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1095  0001 9e            	ld	a,xh
1096  0002 a1ff          	cp	a,#255
1097  0004 2620          	jrne	L364
1098                     ; 241     if (NewState != DISABLE)
1100  0006 9f            	ld	a,xl
1101  0007 4d            	tnz	a
1102  0008 270a          	jreq	L564
1103                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1105  000a 725f5407      	clr	21511
1106                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1108  000e 725f5406      	clr	21510
1110  0012 2078          	jra	L174
1111  0014               L564:
1112                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1114  0014 c65407        	ld	a,21511
1115  0017 aaff          	or	a,#255
1116  0019 c75407        	ld	21511,a
1117                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1119  001c c65406        	ld	a,21510
1120  001f aaff          	or	a,#255
1121  0021 c75406        	ld	21510,a
1122  0024 2066          	jra	L174
1123  0026               L364:
1124                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1126  0026 7b01          	ld	a,(OFST+1,sp)
1127  0028 a108          	cp	a,#8
1128  002a 242f          	jruge	L374
1129                     ; 254     if (NewState != DISABLE)
1131  002c 0d02          	tnz	(OFST+2,sp)
1132  002e 2716          	jreq	L574
1133                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1135  0030 7b01          	ld	a,(OFST+1,sp)
1136  0032 5f            	clrw	x
1137  0033 97            	ld	xl,a
1138  0034 a601          	ld	a,#1
1139  0036 5d            	tnzw	x
1140  0037 2704          	jreq	L42
1141  0039               L62:
1142  0039 48            	sll	a
1143  003a 5a            	decw	x
1144  003b 26fc          	jrne	L62
1145  003d               L42:
1146  003d 43            	cpl	a
1147  003e c45407        	and	a,21511
1148  0041 c75407        	ld	21511,a
1150  0044 2046          	jra	L174
1151  0046               L574:
1152                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1154  0046 7b01          	ld	a,(OFST+1,sp)
1155  0048 5f            	clrw	x
1156  0049 97            	ld	xl,a
1157  004a a601          	ld	a,#1
1158  004c 5d            	tnzw	x
1159  004d 2704          	jreq	L03
1160  004f               L23:
1161  004f 48            	sll	a
1162  0050 5a            	decw	x
1163  0051 26fc          	jrne	L23
1164  0053               L03:
1165  0053 ca5407        	or	a,21511
1166  0056 c75407        	ld	21511,a
1167  0059 2031          	jra	L174
1168  005b               L374:
1169                     ; 265     if (NewState != DISABLE)
1171  005b 0d02          	tnz	(OFST+2,sp)
1172  005d 2718          	jreq	L305
1173                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1175  005f 7b01          	ld	a,(OFST+1,sp)
1176  0061 a008          	sub	a,#8
1177  0063 5f            	clrw	x
1178  0064 97            	ld	xl,a
1179  0065 a601          	ld	a,#1
1180  0067 5d            	tnzw	x
1181  0068 2704          	jreq	L43
1182  006a               L63:
1183  006a 48            	sll	a
1184  006b 5a            	decw	x
1185  006c 26fc          	jrne	L63
1186  006e               L43:
1187  006e 43            	cpl	a
1188  006f c45406        	and	a,21510
1189  0072 c75406        	ld	21510,a
1191  0075 2015          	jra	L174
1192  0077               L305:
1193                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1195  0077 7b01          	ld	a,(OFST+1,sp)
1196  0079 a008          	sub	a,#8
1197  007b 5f            	clrw	x
1198  007c 97            	ld	xl,a
1199  007d a601          	ld	a,#1
1200  007f 5d            	tnzw	x
1201  0080 2704          	jreq	L04
1202  0082               L24:
1203  0082 48            	sll	a
1204  0083 5a            	decw	x
1205  0084 26fc          	jrne	L24
1206  0086               L04:
1207  0086 ca5406        	or	a,21510
1208  0089 c75406        	ld	21510,a
1209  008c               L174:
1210                     ; 274 }
1213  008c 85            	popw	x
1214  008d 81            	ret
1271                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1271                     ; 287 {
1272                     .text:	section	.text,new
1273  0000               _ADC1_ConversionConfig:
1275  0000 89            	pushw	x
1276       00000000      OFST:	set	0
1279                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1281                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1283                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1285                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1287  0001 72175402      	bres	21506,#3
1288                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1290  0005 c65402        	ld	a,21506
1291  0008 1a05          	or	a,(OFST+5,sp)
1292  000a c75402        	ld	21506,a
1293                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1295  000d 9e            	ld	a,xh
1296  000e a101          	cp	a,#1
1297  0010 2606          	jrne	L535
1298                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1300  0012 72125401      	bset	21505,#1
1302  0016 2004          	jra	L735
1303  0018               L535:
1304                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1306  0018 72135401      	bres	21505,#1
1307  001c               L735:
1308                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1310  001c c65400        	ld	a,21504
1311  001f a4f0          	and	a,#240
1312  0021 c75400        	ld	21504,a
1313                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1315  0024 c65400        	ld	a,21504
1316  0027 1a02          	or	a,(OFST+2,sp)
1317  0029 c75400        	ld	21504,a
1318                     ; 313 }
1321  002c 85            	popw	x
1322  002d 81            	ret
1368                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1368                     ; 326 {
1369                     .text:	section	.text,new
1370  0000               _ADC1_ExternalTriggerConfig:
1372  0000 89            	pushw	x
1373       00000000      OFST:	set	0
1376                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1378                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1380                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1382  0001 c65402        	ld	a,21506
1383  0004 a4cf          	and	a,#207
1384  0006 c75402        	ld	21506,a
1385                     ; 334   if (NewState != DISABLE)
1387  0009 9f            	ld	a,xl
1388  000a 4d            	tnz	a
1389  000b 2706          	jreq	L365
1390                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1392  000d 721c5402      	bset	21506,#6
1394  0011 2004          	jra	L565
1395  0013               L365:
1396                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1398  0013 721d5402      	bres	21506,#6
1399  0017               L565:
1400                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1402  0017 c65402        	ld	a,21506
1403  001a 1a01          	or	a,(OFST+1,sp)
1404  001c c75402        	ld	21506,a
1405                     ; 347 }
1408  001f 85            	popw	x
1409  0020 81            	ret
1433                     ; 358 void ADC1_StartConversion(void)
1433                     ; 359 {
1434                     .text:	section	.text,new
1435  0000               _ADC1_StartConversion:
1439                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1441  0000 72105401      	bset	21505,#0
1442                     ; 361 }
1445  0004 81            	ret
1489                     ; 370 uint16_t ADC1_GetConversionValue(void)
1489                     ; 371 {
1490                     .text:	section	.text,new
1491  0000               _ADC1_GetConversionValue:
1493  0000 5205          	subw	sp,#5
1494       00000005      OFST:	set	5
1497                     ; 372   uint16_t temph = 0;
1499                     ; 373   uint8_t templ = 0;
1501                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1503  0002 c65402        	ld	a,21506
1504  0005 a508          	bcp	a,#8
1505  0007 2715          	jreq	L126
1506                     ; 378     templ = ADC1->DRL;
1508  0009 c65405        	ld	a,21509
1509  000c 6b03          	ld	(OFST-2,sp),a
1511                     ; 380     temph = ADC1->DRH;
1513  000e c65404        	ld	a,21508
1514  0011 5f            	clrw	x
1515  0012 97            	ld	xl,a
1516  0013 1f04          	ldw	(OFST-1,sp),x
1518                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1520  0015 1e04          	ldw	x,(OFST-1,sp)
1521  0017 7b03          	ld	a,(OFST-2,sp)
1522  0019 02            	rlwa	x,a
1523  001a 1f04          	ldw	(OFST-1,sp),x
1526  001c 2021          	jra	L326
1527  001e               L126:
1528                     ; 387     temph = ADC1->DRH;
1530  001e c65404        	ld	a,21508
1531  0021 5f            	clrw	x
1532  0022 97            	ld	xl,a
1533  0023 1f04          	ldw	(OFST-1,sp),x
1535                     ; 389     templ = ADC1->DRL;
1537  0025 c65405        	ld	a,21509
1538  0028 6b03          	ld	(OFST-2,sp),a
1540                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1542  002a 1e04          	ldw	x,(OFST-1,sp)
1543  002c 4f            	clr	a
1544  002d 02            	rlwa	x,a
1545  002e 1f01          	ldw	(OFST-4,sp),x
1547  0030 7b03          	ld	a,(OFST-2,sp)
1548  0032 97            	ld	xl,a
1549  0033 a640          	ld	a,#64
1550  0035 42            	mul	x,a
1551  0036 01            	rrwa	x,a
1552  0037 1a02          	or	a,(OFST-3,sp)
1553  0039 01            	rrwa	x,a
1554  003a 1a01          	or	a,(OFST-4,sp)
1555  003c 01            	rrwa	x,a
1556  003d 1f04          	ldw	(OFST-1,sp),x
1558  003f               L326:
1559                     ; 394   return ((uint16_t)temph);
1561  003f 1e04          	ldw	x,(OFST-1,sp)
1564  0041 5b05          	addw	sp,#5
1565  0043 81            	ret
1611                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1611                     ; 406 {
1612                     .text:	section	.text,new
1613  0000               _ADC1_AWDChannelConfig:
1615  0000 89            	pushw	x
1616       00000000      OFST:	set	0
1619                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1621                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1623                     ; 411   if (Channel < (uint8_t)8)
1625  0001 9e            	ld	a,xh
1626  0002 a108          	cp	a,#8
1627  0004 242e          	jruge	L746
1628                     ; 413     if (NewState != DISABLE)
1630  0006 9f            	ld	a,xl
1631  0007 4d            	tnz	a
1632  0008 2714          	jreq	L156
1633                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1635  000a 9e            	ld	a,xh
1636  000b 5f            	clrw	x
1637  000c 97            	ld	xl,a
1638  000d a601          	ld	a,#1
1639  000f 5d            	tnzw	x
1640  0010 2704          	jreq	L65
1641  0012               L06:
1642  0012 48            	sll	a
1643  0013 5a            	decw	x
1644  0014 26fc          	jrne	L06
1645  0016               L65:
1646  0016 ca540f        	or	a,21519
1647  0019 c7540f        	ld	21519,a
1649  001c 2047          	jra	L556
1650  001e               L156:
1651                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1653  001e 7b01          	ld	a,(OFST+1,sp)
1654  0020 5f            	clrw	x
1655  0021 97            	ld	xl,a
1656  0022 a601          	ld	a,#1
1657  0024 5d            	tnzw	x
1658  0025 2704          	jreq	L26
1659  0027               L46:
1660  0027 48            	sll	a
1661  0028 5a            	decw	x
1662  0029 26fc          	jrne	L46
1663  002b               L26:
1664  002b 43            	cpl	a
1665  002c c4540f        	and	a,21519
1666  002f c7540f        	ld	21519,a
1667  0032 2031          	jra	L556
1668  0034               L746:
1669                     ; 424     if (NewState != DISABLE)
1671  0034 0d02          	tnz	(OFST+2,sp)
1672  0036 2717          	jreq	L756
1673                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1675  0038 7b01          	ld	a,(OFST+1,sp)
1676  003a a008          	sub	a,#8
1677  003c 5f            	clrw	x
1678  003d 97            	ld	xl,a
1679  003e a601          	ld	a,#1
1680  0040 5d            	tnzw	x
1681  0041 2704          	jreq	L66
1682  0043               L07:
1683  0043 48            	sll	a
1684  0044 5a            	decw	x
1685  0045 26fc          	jrne	L07
1686  0047               L66:
1687  0047 ca540e        	or	a,21518
1688  004a c7540e        	ld	21518,a
1690  004d 2016          	jra	L556
1691  004f               L756:
1692                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1694  004f 7b01          	ld	a,(OFST+1,sp)
1695  0051 a008          	sub	a,#8
1696  0053 5f            	clrw	x
1697  0054 97            	ld	xl,a
1698  0055 a601          	ld	a,#1
1699  0057 5d            	tnzw	x
1700  0058 2704          	jreq	L27
1701  005a               L47:
1702  005a 48            	sll	a
1703  005b 5a            	decw	x
1704  005c 26fc          	jrne	L47
1705  005e               L27:
1706  005e 43            	cpl	a
1707  005f c4540e        	and	a,21518
1708  0062 c7540e        	ld	21518,a
1709  0065               L556:
1710                     ; 433 }
1713  0065 85            	popw	x
1714  0066 81            	ret
1749                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1749                     ; 442 {
1750                     .text:	section	.text,new
1751  0000               _ADC1_SetHighThreshold:
1753  0000 89            	pushw	x
1754       00000000      OFST:	set	0
1757                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1759  0001 54            	srlw	x
1760  0002 54            	srlw	x
1761  0003 9f            	ld	a,xl
1762  0004 c75408        	ld	21512,a
1763                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1765  0007 7b02          	ld	a,(OFST+2,sp)
1766  0009 c75409        	ld	21513,a
1767                     ; 445 }
1770  000c 85            	popw	x
1771  000d 81            	ret
1806                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1806                     ; 454 {
1807                     .text:	section	.text,new
1808  0000               _ADC1_SetLowThreshold:
1812                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1814  0000 9f            	ld	a,xl
1815  0001 c7540b        	ld	21515,a
1816                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1818  0004 54            	srlw	x
1819  0005 54            	srlw	x
1820  0006 9f            	ld	a,xl
1821  0007 c7540a        	ld	21514,a
1822                     ; 457 }
1825  000a 81            	ret
1878                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1878                     ; 467 {
1879                     .text:	section	.text,new
1880  0000               _ADC1_GetBufferValue:
1882  0000 88            	push	a
1883  0001 5205          	subw	sp,#5
1884       00000005      OFST:	set	5
1887                     ; 468   uint16_t temph = 0;
1889                     ; 469   uint8_t templ = 0;
1891                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1893                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1895  0003 c65402        	ld	a,21506
1896  0006 a508          	bcp	a,#8
1897  0008 271f          	jreq	L547
1898                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1900  000a 7b06          	ld	a,(OFST+1,sp)
1901  000c 48            	sll	a
1902  000d 5f            	clrw	x
1903  000e 97            	ld	xl,a
1904  000f d653e1        	ld	a,(21473,x)
1905  0012 6b03          	ld	(OFST-2,sp),a
1907                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1909  0014 7b06          	ld	a,(OFST+1,sp)
1910  0016 48            	sll	a
1911  0017 5f            	clrw	x
1912  0018 97            	ld	xl,a
1913  0019 d653e0        	ld	a,(21472,x)
1914  001c 5f            	clrw	x
1915  001d 97            	ld	xl,a
1916  001e 1f04          	ldw	(OFST-1,sp),x
1918                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1920  0020 1e04          	ldw	x,(OFST-1,sp)
1921  0022 7b03          	ld	a,(OFST-2,sp)
1922  0024 02            	rlwa	x,a
1923  0025 1f04          	ldw	(OFST-1,sp),x
1926  0027 202b          	jra	L747
1927  0029               L547:
1928                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1930  0029 7b06          	ld	a,(OFST+1,sp)
1931  002b 48            	sll	a
1932  002c 5f            	clrw	x
1933  002d 97            	ld	xl,a
1934  002e d653e0        	ld	a,(21472,x)
1935  0031 5f            	clrw	x
1936  0032 97            	ld	xl,a
1937  0033 1f04          	ldw	(OFST-1,sp),x
1939                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1941  0035 7b06          	ld	a,(OFST+1,sp)
1942  0037 48            	sll	a
1943  0038 5f            	clrw	x
1944  0039 97            	ld	xl,a
1945  003a d653e1        	ld	a,(21473,x)
1946  003d 6b03          	ld	(OFST-2,sp),a
1948                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1950  003f 1e04          	ldw	x,(OFST-1,sp)
1951  0041 4f            	clr	a
1952  0042 02            	rlwa	x,a
1953  0043 1f01          	ldw	(OFST-4,sp),x
1955  0045 7b03          	ld	a,(OFST-2,sp)
1956  0047 97            	ld	xl,a
1957  0048 a640          	ld	a,#64
1958  004a 42            	mul	x,a
1959  004b 01            	rrwa	x,a
1960  004c 1a02          	or	a,(OFST-3,sp)
1961  004e 01            	rrwa	x,a
1962  004f 1a01          	or	a,(OFST-4,sp)
1963  0051 01            	rrwa	x,a
1964  0052 1f04          	ldw	(OFST-1,sp),x
1966  0054               L747:
1967                     ; 493   return ((uint16_t)temph);
1969  0054 1e04          	ldw	x,(OFST-1,sp)
1972  0056 5b06          	addw	sp,#6
1973  0058 81            	ret
2039                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2039                     ; 503 {
2040                     .text:	section	.text,new
2041  0000               _ADC1_GetAWDChannelStatus:
2043  0000 88            	push	a
2044  0001 88            	push	a
2045       00000001      OFST:	set	1
2048                     ; 504   uint8_t status = 0;
2050                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2052                     ; 509   if (Channel < (uint8_t)8)
2054  0002 a108          	cp	a,#8
2055  0004 2412          	jruge	L3001
2056                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2058  0006 5f            	clrw	x
2059  0007 97            	ld	xl,a
2060  0008 a601          	ld	a,#1
2061  000a 5d            	tnzw	x
2062  000b 2704          	jreq	L601
2063  000d               L011:
2064  000d 48            	sll	a
2065  000e 5a            	decw	x
2066  000f 26fc          	jrne	L011
2067  0011               L601:
2068  0011 c4540d        	and	a,21517
2069  0014 6b01          	ld	(OFST+0,sp),a
2072  0016 2014          	jra	L5001
2073  0018               L3001:
2074                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2076  0018 7b02          	ld	a,(OFST+1,sp)
2077  001a a008          	sub	a,#8
2078  001c 5f            	clrw	x
2079  001d 97            	ld	xl,a
2080  001e a601          	ld	a,#1
2081  0020 5d            	tnzw	x
2082  0021 2704          	jreq	L211
2083  0023               L411:
2084  0023 48            	sll	a
2085  0024 5a            	decw	x
2086  0025 26fc          	jrne	L411
2087  0027               L211:
2088  0027 c4540c        	and	a,21516
2089  002a 6b01          	ld	(OFST+0,sp),a
2091  002c               L5001:
2092                     ; 518   return ((FlagStatus)status);
2094  002c 7b01          	ld	a,(OFST+0,sp)
2097  002e 85            	popw	x
2098  002f 81            	ret
2256                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2256                     ; 528 {
2257                     .text:	section	.text,new
2258  0000               _ADC1_GetFlagStatus:
2260  0000 88            	push	a
2261  0001 88            	push	a
2262       00000001      OFST:	set	1
2265                     ; 529   uint8_t flagstatus = 0;
2267                     ; 530   uint8_t temp = 0;
2269                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2271                     ; 535   if ((Flag & 0x0F) == 0x01)
2273  0002 a40f          	and	a,#15
2274  0004 a101          	cp	a,#1
2275  0006 2609          	jrne	L5701
2276                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2278  0008 c65403        	ld	a,21507
2279  000b a440          	and	a,#64
2280  000d 6b01          	ld	(OFST+0,sp),a
2283  000f 2045          	jra	L7701
2284  0011               L5701:
2285                     ; 540   else if ((Flag & 0xF0) == 0x10)
2287  0011 7b02          	ld	a,(OFST+1,sp)
2288  0013 a4f0          	and	a,#240
2289  0015 a110          	cp	a,#16
2290  0017 2636          	jrne	L1011
2291                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2293  0019 7b02          	ld	a,(OFST+1,sp)
2294  001b a40f          	and	a,#15
2295  001d 6b01          	ld	(OFST+0,sp),a
2297                     ; 544     if (temp < 8)
2299  001f 7b01          	ld	a,(OFST+0,sp)
2300  0021 a108          	cp	a,#8
2301  0023 2414          	jruge	L3011
2302                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2304  0025 7b01          	ld	a,(OFST+0,sp)
2305  0027 5f            	clrw	x
2306  0028 97            	ld	xl,a
2307  0029 a601          	ld	a,#1
2308  002b 5d            	tnzw	x
2309  002c 2704          	jreq	L021
2310  002e               L221:
2311  002e 48            	sll	a
2312  002f 5a            	decw	x
2313  0030 26fc          	jrne	L221
2314  0032               L021:
2315  0032 c4540d        	and	a,21517
2316  0035 6b01          	ld	(OFST+0,sp),a
2319  0037 201d          	jra	L7701
2320  0039               L3011:
2321                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2323  0039 7b01          	ld	a,(OFST+0,sp)
2324  003b a008          	sub	a,#8
2325  003d 5f            	clrw	x
2326  003e 97            	ld	xl,a
2327  003f a601          	ld	a,#1
2328  0041 5d            	tnzw	x
2329  0042 2704          	jreq	L421
2330  0044               L621:
2331  0044 48            	sll	a
2332  0045 5a            	decw	x
2333  0046 26fc          	jrne	L621
2334  0048               L421:
2335  0048 c4540c        	and	a,21516
2336  004b 6b01          	ld	(OFST+0,sp),a
2338  004d 2007          	jra	L7701
2339  004f               L1011:
2340                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2342  004f c65400        	ld	a,21504
2343  0052 1402          	and	a,(OFST+1,sp)
2344  0054 6b01          	ld	(OFST+0,sp),a
2346  0056               L7701:
2347                     ; 557   return ((FlagStatus)flagstatus);
2349  0056 7b01          	ld	a,(OFST+0,sp)
2352  0058 85            	popw	x
2353  0059 81            	ret
2397                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2397                     ; 568 {
2398                     .text:	section	.text,new
2399  0000               _ADC1_ClearFlag:
2401  0000 88            	push	a
2402  0001 88            	push	a
2403       00000001      OFST:	set	1
2406                     ; 569   uint8_t temp = 0;
2408                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2410                     ; 574   if ((Flag & 0x0F) == 0x01)
2412  0002 a40f          	and	a,#15
2413  0004 a101          	cp	a,#1
2414  0006 2606          	jrne	L3311
2415                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2417  0008 721d5403      	bres	21507,#6
2419  000c 204b          	jra	L5311
2420  000e               L3311:
2421                     ; 579   else if ((Flag & 0xF0) == 0x10)
2423  000e 7b02          	ld	a,(OFST+1,sp)
2424  0010 a4f0          	and	a,#240
2425  0012 a110          	cp	a,#16
2426  0014 263a          	jrne	L7311
2427                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2429  0016 7b02          	ld	a,(OFST+1,sp)
2430  0018 a40f          	and	a,#15
2431  001a 6b01          	ld	(OFST+0,sp),a
2433                     ; 583     if (temp < 8)
2435  001c 7b01          	ld	a,(OFST+0,sp)
2436  001e a108          	cp	a,#8
2437  0020 2416          	jruge	L1411
2438                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2440  0022 7b01          	ld	a,(OFST+0,sp)
2441  0024 5f            	clrw	x
2442  0025 97            	ld	xl,a
2443  0026 a601          	ld	a,#1
2444  0028 5d            	tnzw	x
2445  0029 2704          	jreq	L231
2446  002b               L431:
2447  002b 48            	sll	a
2448  002c 5a            	decw	x
2449  002d 26fc          	jrne	L431
2450  002f               L231:
2451  002f 43            	cpl	a
2452  0030 c4540d        	and	a,21517
2453  0033 c7540d        	ld	21517,a
2455  0036 2021          	jra	L5311
2456  0038               L1411:
2457                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2459  0038 7b01          	ld	a,(OFST+0,sp)
2460  003a a008          	sub	a,#8
2461  003c 5f            	clrw	x
2462  003d 97            	ld	xl,a
2463  003e a601          	ld	a,#1
2464  0040 5d            	tnzw	x
2465  0041 2704          	jreq	L631
2466  0043               L041:
2467  0043 48            	sll	a
2468  0044 5a            	decw	x
2469  0045 26fc          	jrne	L041
2470  0047               L631:
2471  0047 43            	cpl	a
2472  0048 c4540c        	and	a,21516
2473  004b c7540c        	ld	21516,a
2474  004e 2009          	jra	L5311
2475  0050               L7311:
2476                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2478  0050 7b02          	ld	a,(OFST+1,sp)
2479  0052 43            	cpl	a
2480  0053 c45400        	and	a,21504
2481  0056 c75400        	ld	21504,a
2482  0059               L5311:
2483                     ; 596 }
2486  0059 85            	popw	x
2487  005a 81            	ret
2542                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2542                     ; 617 {
2543                     .text:	section	.text,new
2544  0000               _ADC1_GetITStatus:
2546  0000 89            	pushw	x
2547  0001 88            	push	a
2548       00000001      OFST:	set	1
2551                     ; 618   ITStatus itstatus = RESET;
2553                     ; 619   uint8_t temp = 0;
2555                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2557                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2559  0002 01            	rrwa	x,a
2560  0003 a4f0          	and	a,#240
2561  0005 5f            	clrw	x
2562  0006 02            	rlwa	x,a
2563  0007 a30010        	cpw	x,#16
2564  000a 2636          	jrne	L5711
2565                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2567  000c 7b03          	ld	a,(OFST+2,sp)
2568  000e a40f          	and	a,#15
2569  0010 6b01          	ld	(OFST+0,sp),a
2571                     ; 628     if (temp < 8)
2573  0012 7b01          	ld	a,(OFST+0,sp)
2574  0014 a108          	cp	a,#8
2575  0016 2414          	jruge	L7711
2576                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2578  0018 7b01          	ld	a,(OFST+0,sp)
2579  001a 5f            	clrw	x
2580  001b 97            	ld	xl,a
2581  001c a601          	ld	a,#1
2582  001e 5d            	tnzw	x
2583  001f 2704          	jreq	L441
2584  0021               L641:
2585  0021 48            	sll	a
2586  0022 5a            	decw	x
2587  0023 26fc          	jrne	L641
2588  0025               L441:
2589  0025 c4540d        	and	a,21517
2590  0028 6b01          	ld	(OFST+0,sp),a
2593  002a 201d          	jra	L3021
2594  002c               L7711:
2595                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2597  002c 7b01          	ld	a,(OFST+0,sp)
2598  002e a008          	sub	a,#8
2599  0030 5f            	clrw	x
2600  0031 97            	ld	xl,a
2601  0032 a601          	ld	a,#1
2602  0034 5d            	tnzw	x
2603  0035 2704          	jreq	L051
2604  0037               L251:
2605  0037 48            	sll	a
2606  0038 5a            	decw	x
2607  0039 26fc          	jrne	L251
2608  003b               L051:
2609  003b c4540c        	and	a,21516
2610  003e 6b01          	ld	(OFST+0,sp),a
2612  0040 2007          	jra	L3021
2613  0042               L5711:
2614                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2616  0042 c65400        	ld	a,21504
2617  0045 1403          	and	a,(OFST+2,sp)
2618  0047 6b01          	ld	(OFST+0,sp),a
2620  0049               L3021:
2621                     ; 641   return ((ITStatus)itstatus);
2623  0049 7b01          	ld	a,(OFST+0,sp)
2626  004b 5b03          	addw	sp,#3
2627  004d 81            	ret
2672                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2672                     ; 663 {
2673                     .text:	section	.text,new
2674  0000               _ADC1_ClearITPendingBit:
2676  0000 89            	pushw	x
2677  0001 88            	push	a
2678       00000001      OFST:	set	1
2681                     ; 664   uint8_t temp = 0;
2683                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2685                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2687  0002 01            	rrwa	x,a
2688  0003 a4f0          	and	a,#240
2689  0005 5f            	clrw	x
2690  0006 02            	rlwa	x,a
2691  0007 a30010        	cpw	x,#16
2692  000a 263a          	jrne	L7221
2693                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2695  000c 7b03          	ld	a,(OFST+2,sp)
2696  000e a40f          	and	a,#15
2697  0010 6b01          	ld	(OFST+0,sp),a
2699                     ; 673     if (temp < 8)
2701  0012 7b01          	ld	a,(OFST+0,sp)
2702  0014 a108          	cp	a,#8
2703  0016 2416          	jruge	L1321
2704                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2706  0018 7b01          	ld	a,(OFST+0,sp)
2707  001a 5f            	clrw	x
2708  001b 97            	ld	xl,a
2709  001c a601          	ld	a,#1
2710  001e 5d            	tnzw	x
2711  001f 2704          	jreq	L651
2712  0021               L061:
2713  0021 48            	sll	a
2714  0022 5a            	decw	x
2715  0023 26fc          	jrne	L061
2716  0025               L651:
2717  0025 43            	cpl	a
2718  0026 c4540d        	and	a,21517
2719  0029 c7540d        	ld	21517,a
2721  002c 2021          	jra	L5321
2722  002e               L1321:
2723                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2725  002e 7b01          	ld	a,(OFST+0,sp)
2726  0030 a008          	sub	a,#8
2727  0032 5f            	clrw	x
2728  0033 97            	ld	xl,a
2729  0034 a601          	ld	a,#1
2730  0036 5d            	tnzw	x
2731  0037 2704          	jreq	L261
2732  0039               L461:
2733  0039 48            	sll	a
2734  003a 5a            	decw	x
2735  003b 26fc          	jrne	L461
2736  003d               L261:
2737  003d 43            	cpl	a
2738  003e c4540c        	and	a,21516
2739  0041 c7540c        	ld	21516,a
2740  0044 2009          	jra	L5321
2741  0046               L7221:
2742                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2744  0046 7b03          	ld	a,(OFST+2,sp)
2745  0048 43            	cpl	a
2746  0049 c45400        	and	a,21504
2747  004c c75400        	ld	21504,a
2748  004f               L5321:
2749                     ; 686 }
2752  004f 5b03          	addw	sp,#3
2753  0051 81            	ret
2766                     	xdef	_ADC1_ClearITPendingBit
2767                     	xdef	_ADC1_GetITStatus
2768                     	xdef	_ADC1_ClearFlag
2769                     	xdef	_ADC1_GetFlagStatus
2770                     	xdef	_ADC1_GetAWDChannelStatus
2771                     	xdef	_ADC1_GetBufferValue
2772                     	xdef	_ADC1_SetLowThreshold
2773                     	xdef	_ADC1_SetHighThreshold
2774                     	xdef	_ADC1_GetConversionValue
2775                     	xdef	_ADC1_StartConversion
2776                     	xdef	_ADC1_AWDChannelConfig
2777                     	xdef	_ADC1_ExternalTriggerConfig
2778                     	xdef	_ADC1_ConversionConfig
2779                     	xdef	_ADC1_SchmittTriggerConfig
2780                     	xdef	_ADC1_PrescalerConfig
2781                     	xdef	_ADC1_ITConfig
2782                     	xdef	_ADC1_DataBufferCmd
2783                     	xdef	_ADC1_ScanModeCmd
2784                     	xdef	_ADC1_Cmd
2785                     	xdef	_ADC1_Init
2786                     	xdef	_ADC1_DeInit
2805                     	end
