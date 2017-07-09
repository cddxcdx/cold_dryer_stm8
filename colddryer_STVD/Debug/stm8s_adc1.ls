   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  46                     ; 52 void ADC1_DeInit(void)
  46                     ; 53 {
  48                     .text:	section	.text,new
  49  0000               _ADC1_DeInit:
  53                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  55  0000 725f5400      	clr	21504
  56                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  58  0004 725f5401      	clr	21505
  59                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  61  0008 725f5402      	clr	21506
  62                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  64  000c 725f5403      	clr	21507
  65                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  67  0010 725f5406      	clr	21510
  68                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  70  0014 725f5407      	clr	21511
  71                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  73  0018 35ff5408      	mov	21512,#255
  74                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  76  001c 35035409      	mov	21513,#3
  77                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  79  0020 725f540a      	clr	21514
  80                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  82  0024 725f540b      	clr	21515
  83                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  85  0028 725f540e      	clr	21518
  86                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  88  002c 725f540f      	clr	21519
  89                     ; 66 }
  92  0030 81            	ret	
 543                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 543                     ; 89 {
 544                     .text:	section	.text,new
 545  0000               _ADC1_Init:
 547  0000 89            	pushw	x
 548       00000000      OFST:	set	0
 551                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 553                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 555                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 557                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 559                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 561                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 563                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 565                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 567                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 569  0001 7b08          	ld	a,(OFST+8,sp)
 570  0003 88            	push	a
 571  0004 7b02          	ld	a,(OFST+2,sp)
 572  0006 95            	ld	xh,a
 573  0007 cd0000        	call	_ADC1_ConversionConfig
 575  000a 84            	pop	a
 576                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  000b 7b05          	ld	a,(OFST+5,sp)
 579  000d cd0000        	call	_ADC1_PrescalerConfig
 581                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0010 7b07          	ld	a,(OFST+7,sp)
 584  0012 97            	ld	xl,a
 585  0013 7b06          	ld	a,(OFST+6,sp)
 586  0015 95            	ld	xh,a
 587  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 589                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  0019 7b0a          	ld	a,(OFST+10,sp)
 592  001b 97            	ld	xl,a
 593  001c 7b09          	ld	a,(OFST+9,sp)
 594  001e 95            	ld	xh,a
 595  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 597                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 599  0022 72105401      	bset	21505,#0
 600                     ; 119 }
 603  0026 85            	popw	x
 604  0027 81            	ret	
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     .text:	section	.text,new
 641  0000               _ADC1_Cmd:
 645                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 131   if (NewState != DISABLE)
 649  0000 4d            	tnz	a
 650  0001 2705          	jreq	L362
 651                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 653  0003 72105401      	bset	21505,#0
 656  0007 81            	ret	
 657  0008               L362:
 658                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 660  0008 72115401      	bres	21505,#0
 661                     ; 139 }
 664  000c 81            	ret	
 699                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 147 {
 700                     .text:	section	.text,new
 701  0000               _ADC1_ScanModeCmd:
 705                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 151   if (NewState != DISABLE)
 709  0000 4d            	tnz	a
 710  0001 2705          	jreq	L503
 711                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 713  0003 72125402      	bset	21506,#1
 716  0007 81            	ret	
 717  0008               L503:
 718                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 720  0008 72135402      	bres	21506,#1
 721                     ; 159 }
 724  000c 81            	ret	
 759                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 167 {
 760                     .text:	section	.text,new
 761  0000               _ADC1_DataBufferCmd:
 765                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 171   if (NewState != DISABLE)
 769  0000 4d            	tnz	a
 770  0001 2705          	jreq	L723
 771                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0003 721e5403      	bset	21507,#7
 776  0007 81            	ret	
 777  0008               L723:
 778                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 780  0008 721f5403      	bres	21507,#7
 781                     ; 179 }
 784  000c 81            	ret	
 940                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 191 {
 941                     .text:	section	.text,new
 942  0000               _ADC1_ITConfig:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 196   if (NewState != DISABLE)
 954  0001 7b05          	ld	a,(OFST+5,sp)
 955  0003 2706          	jreq	L714
 956                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0005 9f            	ld	a,xl
 959  0006 ca5400        	or	a,21504
 961  0009 2006          	jra	L124
 962  000b               L714:
 963                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  000b 7b02          	ld	a,(OFST+2,sp)
 966  000d 43            	cpl	a
 967  000e c45400        	and	a,21504
 968  0011               L124:
 969  0011 c75400        	ld	21504,a
 970                     ; 206 }
 973  0014 85            	popw	x
 974  0015 81            	ret	
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
1096  0002 4c            	inc	a
1097  0003 261d          	jrne	L364
1098                     ; 241     if (NewState != DISABLE)
1100  0005 9f            	ld	a,xl
1101  0006 4d            	tnz	a
1102  0007 270a          	jreq	L564
1103                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1105  0009 725f5407      	clr	21511
1106                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1108  000d 725f5406      	clr	21510
1110  0011 2065          	jra	L174
1111  0013               L564:
1112                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1114  0013 c65407        	ld	a,21511
1115  0016 aaff          	or	a,#255
1116  0018 c75407        	ld	21511,a
1117                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1119  001b c65406        	ld	a,21510
1120  001e aaff          	or	a,#255
1121  0020 2053          	jp	LC001
1122  0022               L364:
1123                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1125  0022 7b01          	ld	a,(OFST+1,sp)
1126  0024 a108          	cp	a,#8
1127  0026 0d02          	tnz	(OFST+2,sp)
1128  0028 2426          	jruge	L374
1129                     ; 254     if (NewState != DISABLE)
1131  002a 2714          	jreq	L574
1132                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1134  002c 5f            	clrw	x
1135  002d 97            	ld	xl,a
1136  002e a601          	ld	a,#1
1137  0030 5d            	tnzw	x
1138  0031 2704          	jreq	L43
1139  0033               L63:
1140  0033 48            	sll	a
1141  0034 5a            	decw	x
1142  0035 26fc          	jrne	L63
1143  0037               L43:
1144  0037 43            	cpl	a
1145  0038 c45407        	and	a,21511
1146  003b               LC002:
1147  003b c75407        	ld	21511,a
1149  003e 2038          	jra	L174
1150  0040               L574:
1151                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1153  0040 5f            	clrw	x
1154  0041 97            	ld	xl,a
1155  0042 a601          	ld	a,#1
1156  0044 5d            	tnzw	x
1157  0045 2704          	jreq	L04
1158  0047               L24:
1159  0047 48            	sll	a
1160  0048 5a            	decw	x
1161  0049 26fc          	jrne	L24
1162  004b               L04:
1163  004b ca5407        	or	a,21511
1164  004e 20eb          	jp	LC002
1165  0050               L374:
1166                     ; 265     if (NewState != DISABLE)
1168  0050 2713          	jreq	L305
1169                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1171  0052 a008          	sub	a,#8
1172  0054 5f            	clrw	x
1173  0055 97            	ld	xl,a
1174  0056 a601          	ld	a,#1
1175  0058 5d            	tnzw	x
1176  0059 2704          	jreq	L44
1177  005b               L64:
1178  005b 48            	sll	a
1179  005c 5a            	decw	x
1180  005d 26fc          	jrne	L64
1181  005f               L44:
1182  005f 43            	cpl	a
1183  0060 c45406        	and	a,21510
1185  0063 2010          	jp	LC001
1186  0065               L305:
1187                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1189  0065 a008          	sub	a,#8
1190  0067 5f            	clrw	x
1191  0068 97            	ld	xl,a
1192  0069 a601          	ld	a,#1
1193  006b 5d            	tnzw	x
1194  006c 2704          	jreq	L05
1195  006e               L25:
1196  006e 48            	sll	a
1197  006f 5a            	decw	x
1198  0070 26fc          	jrne	L25
1199  0072               L05:
1200  0072 ca5406        	or	a,21510
1201  0075               LC001:
1202  0075 c75406        	ld	21510,a
1203  0078               L174:
1204                     ; 274 }
1207  0078 85            	popw	x
1208  0079 81            	ret	
1265                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1265                     ; 287 {
1266                     .text:	section	.text,new
1267  0000               _ADC1_ConversionConfig:
1269  0000 89            	pushw	x
1270       00000000      OFST:	set	0
1273                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1275                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1277                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1279                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1281  0001 72175402      	bres	21506,#3
1282                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1284  0005 c65402        	ld	a,21506
1285  0008 1a05          	or	a,(OFST+5,sp)
1286  000a c75402        	ld	21506,a
1287                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1289  000d 9e            	ld	a,xh
1290  000e 4a            	dec	a
1291  000f 2606          	jrne	L535
1292                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1294  0011 72125401      	bset	21505,#1
1296  0015 2004          	jra	L735
1297  0017               L535:
1298                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1300  0017 72135401      	bres	21505,#1
1301  001b               L735:
1302                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1304  001b c65400        	ld	a,21504
1305  001e a4f0          	and	a,#240
1306  0020 c75400        	ld	21504,a
1307                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1309  0023 c65400        	ld	a,21504
1310  0026 1a02          	or	a,(OFST+2,sp)
1311  0028 c75400        	ld	21504,a
1312                     ; 313 }
1315  002b 85            	popw	x
1316  002c 81            	ret	
1362                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1362                     ; 326 {
1363                     .text:	section	.text,new
1364  0000               _ADC1_ExternalTriggerConfig:
1366  0000 89            	pushw	x
1367       00000000      OFST:	set	0
1370                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1372                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1374                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1376  0001 c65402        	ld	a,21506
1377  0004 a4cf          	and	a,#207
1378  0006 c75402        	ld	21506,a
1379                     ; 334   if (NewState != DISABLE)
1381  0009 9f            	ld	a,xl
1382  000a 4d            	tnz	a
1383  000b 2706          	jreq	L365
1384                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1386  000d 721c5402      	bset	21506,#6
1388  0011 2004          	jra	L565
1389  0013               L365:
1390                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1392  0013 721d5402      	bres	21506,#6
1393  0017               L565:
1394                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1396  0017 c65402        	ld	a,21506
1397  001a 1a01          	or	a,(OFST+1,sp)
1398  001c c75402        	ld	21506,a
1399                     ; 347 }
1402  001f 85            	popw	x
1403  0020 81            	ret	
1427                     ; 358 void ADC1_StartConversion(void)
1427                     ; 359 {
1428                     .text:	section	.text,new
1429  0000               _ADC1_StartConversion:
1433                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1435  0000 72105401      	bset	21505,#0
1436                     ; 361 }
1439  0004 81            	ret	
1483                     ; 370 uint16_t ADC1_GetConversionValue(void)
1483                     ; 371 {
1484                     .text:	section	.text,new
1485  0000               _ADC1_GetConversionValue:
1487  0000 5205          	subw	sp,#5
1488       00000005      OFST:	set	5
1491                     ; 372   uint16_t temph = 0;
1493                     ; 373   uint8_t templ = 0;
1495                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1497  0002 720754020e    	btjf	21506,#3,L126
1498                     ; 378     templ = ADC1->DRL;
1500  0007 c65405        	ld	a,21509
1501  000a 6b03          	ld	(OFST-2,sp),a
1503                     ; 380     temph = ADC1->DRH;
1505  000c c65404        	ld	a,21508
1506  000f 97            	ld	xl,a
1508                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1510  0010 7b03          	ld	a,(OFST-2,sp)
1511  0012 02            	rlwa	x,a
1514  0013 201a          	jra	L326
1515  0015               L126:
1516                     ; 387     temph = ADC1->DRH;
1518  0015 c65404        	ld	a,21508
1519  0018 97            	ld	xl,a
1521                     ; 389     templ = ADC1->DRL;
1523  0019 c65405        	ld	a,21509
1524  001c 6b03          	ld	(OFST-2,sp),a
1526                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1528  001e 4f            	clr	a
1529  001f 02            	rlwa	x,a
1530  0020 1f01          	ldw	(OFST-4,sp),x
1532  0022 7b03          	ld	a,(OFST-2,sp)
1533  0024 97            	ld	xl,a
1534  0025 a640          	ld	a,#64
1535  0027 42            	mul	x,a
1536  0028 01            	rrwa	x,a
1537  0029 1a02          	or	a,(OFST-3,sp)
1538  002b 01            	rrwa	x,a
1539  002c 1a01          	or	a,(OFST-4,sp)
1540  002e 01            	rrwa	x,a
1542  002f               L326:
1543                     ; 394   return ((uint16_t)temph);
1547  002f 5b05          	addw	sp,#5
1548  0031 81            	ret	
1594                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1594                     ; 406 {
1595                     .text:	section	.text,new
1596  0000               _ADC1_AWDChannelConfig:
1598  0000 89            	pushw	x
1599       00000000      OFST:	set	0
1602                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1604                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1606                     ; 411   if (Channel < (uint8_t)8)
1608  0001 9e            	ld	a,xh
1609  0002 a108          	cp	a,#8
1610  0004 242b          	jruge	L746
1611                     ; 413     if (NewState != DISABLE)
1613  0006 9f            	ld	a,xl
1614  0007 4d            	tnz	a
1615  0008 2711          	jreq	L156
1616                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1618  000a 9e            	ld	a,xh
1619  000b 5f            	clrw	x
1620  000c 97            	ld	xl,a
1621  000d a601          	ld	a,#1
1622  000f 5d            	tnzw	x
1623  0010 2704          	jreq	L66
1624  0012               L07:
1625  0012 48            	sll	a
1626  0013 5a            	decw	x
1627  0014 26fc          	jrne	L07
1628  0016               L66:
1629  0016 ca540f        	or	a,21519
1631  0019 2011          	jp	LC004
1632  001b               L156:
1633                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1635  001b 7b01          	ld	a,(OFST+1,sp)
1636  001d 5f            	clrw	x
1637  001e 97            	ld	xl,a
1638  001f a601          	ld	a,#1
1639  0021 5d            	tnzw	x
1640  0022 2704          	jreq	L27
1641  0024               L47:
1642  0024 48            	sll	a
1643  0025 5a            	decw	x
1644  0026 26fc          	jrne	L47
1645  0028               L27:
1646  0028 43            	cpl	a
1647  0029 c4540f        	and	a,21519
1648  002c               LC004:
1649  002c c7540f        	ld	21519,a
1650  002f 202e          	jra	L556
1651  0031               L746:
1652                     ; 424     if (NewState != DISABLE)
1654  0031 7b02          	ld	a,(OFST+2,sp)
1655  0033 2714          	jreq	L756
1656                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1658  0035 7b01          	ld	a,(OFST+1,sp)
1659  0037 a008          	sub	a,#8
1660  0039 5f            	clrw	x
1661  003a 97            	ld	xl,a
1662  003b a601          	ld	a,#1
1663  003d 5d            	tnzw	x
1664  003e 2704          	jreq	L67
1665  0040               L001:
1666  0040 48            	sll	a
1667  0041 5a            	decw	x
1668  0042 26fc          	jrne	L001
1669  0044               L67:
1670  0044 ca540e        	or	a,21518
1672  0047 2013          	jp	LC003
1673  0049               L756:
1674                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1676  0049 7b01          	ld	a,(OFST+1,sp)
1677  004b a008          	sub	a,#8
1678  004d 5f            	clrw	x
1679  004e 97            	ld	xl,a
1680  004f a601          	ld	a,#1
1681  0051 5d            	tnzw	x
1682  0052 2704          	jreq	L201
1683  0054               L401:
1684  0054 48            	sll	a
1685  0055 5a            	decw	x
1686  0056 26fc          	jrne	L401
1687  0058               L201:
1688  0058 43            	cpl	a
1689  0059 c4540e        	and	a,21518
1690  005c               LC003:
1691  005c c7540e        	ld	21518,a
1692  005f               L556:
1693                     ; 433 }
1696  005f 85            	popw	x
1697  0060 81            	ret	
1732                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1732                     ; 442 {
1733                     .text:	section	.text,new
1734  0000               _ADC1_SetHighThreshold:
1736  0000 89            	pushw	x
1737       00000000      OFST:	set	0
1740                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1742  0001 54            	srlw	x
1743  0002 54            	srlw	x
1744  0003 9f            	ld	a,xl
1745  0004 c75408        	ld	21512,a
1746                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1748  0007 7b02          	ld	a,(OFST+2,sp)
1749  0009 c75409        	ld	21513,a
1750                     ; 445 }
1753  000c 85            	popw	x
1754  000d 81            	ret	
1789                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1789                     ; 454 {
1790                     .text:	section	.text,new
1791  0000               _ADC1_SetLowThreshold:
1795                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1797  0000 9f            	ld	a,xl
1798  0001 c7540b        	ld	21515,a
1799                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1801  0004 54            	srlw	x
1802  0005 54            	srlw	x
1803  0006 9f            	ld	a,xl
1804  0007 c7540a        	ld	21514,a
1805                     ; 457 }
1808  000a 81            	ret	
1861                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1861                     ; 467 {
1862                     .text:	section	.text,new
1863  0000               _ADC1_GetBufferValue:
1865  0000 88            	push	a
1866  0001 5205          	subw	sp,#5
1867       00000005      OFST:	set	5
1870                     ; 468   uint16_t temph = 0;
1872                     ; 469   uint8_t templ = 0;
1874                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1876                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1878  0003 48            	sll	a
1879  0004 5f            	clrw	x
1880  0005 97            	ld	xl,a
1881  0006 7207540213    	btjf	21506,#3,L547
1882                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1884  000b d653e1        	ld	a,(21473,x)
1885  000e 6b03          	ld	(OFST-2,sp),a
1887                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1889  0010 7b06          	ld	a,(OFST+1,sp)
1890  0012 48            	sll	a
1891  0013 5f            	clrw	x
1892  0014 97            	ld	xl,a
1893  0015 d653e0        	ld	a,(21472,x)
1894  0018 97            	ld	xl,a
1896                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1898  0019 7b03          	ld	a,(OFST-2,sp)
1899  001b 02            	rlwa	x,a
1902  001c 2024          	jra	L747
1903  001e               L547:
1904                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1906  001e d653e0        	ld	a,(21472,x)
1907  0021 5f            	clrw	x
1908  0022 97            	ld	xl,a
1909  0023 1f04          	ldw	(OFST-1,sp),x
1911                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1913  0025 7b06          	ld	a,(OFST+1,sp)
1914  0027 48            	sll	a
1915  0028 5f            	clrw	x
1916  0029 97            	ld	xl,a
1917  002a d653e1        	ld	a,(21473,x)
1918  002d 6b03          	ld	(OFST-2,sp),a
1920                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1922  002f 4f            	clr	a
1923  0030 1e04          	ldw	x,(OFST-1,sp)
1924  0032 02            	rlwa	x,a
1925  0033 1f01          	ldw	(OFST-4,sp),x
1927  0035 7b03          	ld	a,(OFST-2,sp)
1928  0037 97            	ld	xl,a
1929  0038 a640          	ld	a,#64
1930  003a 42            	mul	x,a
1931  003b 01            	rrwa	x,a
1932  003c 1a02          	or	a,(OFST-3,sp)
1933  003e 01            	rrwa	x,a
1934  003f 1a01          	or	a,(OFST-4,sp)
1935  0041 01            	rrwa	x,a
1937  0042               L747:
1938                     ; 493   return ((uint16_t)temph);
1942  0042 5b06          	addw	sp,#6
1943  0044 81            	ret	
2009                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2009                     ; 503 {
2010                     .text:	section	.text,new
2011  0000               _ADC1_GetAWDChannelStatus:
2013       00000001      OFST:	set	1
2016                     ; 504   uint8_t status = 0;
2018                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2020                     ; 509   if (Channel < (uint8_t)8)
2022  0000 a108          	cp	a,#8
2023  0002 240f          	jruge	L3001
2024                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2026  0004 5f            	clrw	x
2027  0005 97            	ld	xl,a
2028  0006 a601          	ld	a,#1
2029  0008 5d            	tnzw	x
2030  0009 2704          	jreq	L611
2031  000b               L021:
2032  000b 48            	sll	a
2033  000c 5a            	decw	x
2034  000d 26fc          	jrne	L021
2035  000f               L611:
2036  000f c4540d        	and	a,21517
2040  0012 81            	ret	
2041  0013               L3001:
2042                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2044  0013 a008          	sub	a,#8
2045  0015 5f            	clrw	x
2046  0016 97            	ld	xl,a
2047  0017 a601          	ld	a,#1
2048  0019 5d            	tnzw	x
2049  001a 2704          	jreq	L221
2050  001c               L421:
2051  001c 48            	sll	a
2052  001d 5a            	decw	x
2053  001e 26fc          	jrne	L421
2054  0020               L221:
2055  0020 c4540c        	and	a,21516
2057                     ; 518   return ((FlagStatus)status);
2061  0023 81            	ret	
2219                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2219                     ; 528 {
2220                     .text:	section	.text,new
2221  0000               _ADC1_GetFlagStatus:
2223  0000 88            	push	a
2224  0001 88            	push	a
2225       00000001      OFST:	set	1
2228                     ; 529   uint8_t flagstatus = 0;
2230                     ; 530   uint8_t temp = 0;
2232                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2234                     ; 535   if ((Flag & 0x0F) == 0x01)
2236  0002 a40f          	and	a,#15
2237  0004 4a            	dec	a
2238  0005 2607          	jrne	L5701
2239                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2241  0007 c65403        	ld	a,21507
2242  000a a440          	and	a,#64
2245  000c 2039          	jra	L7701
2246  000e               L5701:
2247                     ; 540   else if ((Flag & 0xF0) == 0x10)
2249  000e 7b02          	ld	a,(OFST+1,sp)
2250  0010 a4f0          	and	a,#240
2251  0012 a110          	cp	a,#16
2252  0014 262c          	jrne	L1011
2253                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2255  0016 7b02          	ld	a,(OFST+1,sp)
2256  0018 a40f          	and	a,#15
2257  001a 6b01          	ld	(OFST+0,sp),a
2259                     ; 544     if (temp < 8)
2261  001c a108          	cp	a,#8
2262  001e 2410          	jruge	L3011
2263                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2265  0020 5f            	clrw	x
2266  0021 97            	ld	xl,a
2267  0022 a601          	ld	a,#1
2268  0024 5d            	tnzw	x
2269  0025 2704          	jreq	L031
2270  0027               L231:
2271  0027 48            	sll	a
2272  0028 5a            	decw	x
2273  0029 26fc          	jrne	L231
2274  002b               L031:
2275  002b c4540d        	and	a,21517
2278  002e 2017          	jra	L7701
2279  0030               L3011:
2280                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2282  0030 a008          	sub	a,#8
2283  0032 5f            	clrw	x
2284  0033 97            	ld	xl,a
2285  0034 a601          	ld	a,#1
2286  0036 5d            	tnzw	x
2287  0037 2704          	jreq	L431
2288  0039               L631:
2289  0039 48            	sll	a
2290  003a 5a            	decw	x
2291  003b 26fc          	jrne	L631
2292  003d               L431:
2293  003d c4540c        	and	a,21516
2295  0040 2005          	jra	L7701
2296  0042               L1011:
2297                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2299  0042 c65400        	ld	a,21504
2300  0045 1402          	and	a,(OFST+1,sp)
2302  0047               L7701:
2303                     ; 557   return ((FlagStatus)flagstatus);
2307  0047 85            	popw	x
2308  0048 81            	ret	
2352                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2352                     ; 568 {
2353                     .text:	section	.text,new
2354  0000               _ADC1_ClearFlag:
2356  0000 88            	push	a
2357  0001 88            	push	a
2358       00000001      OFST:	set	1
2361                     ; 569   uint8_t temp = 0;
2363                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2365                     ; 574   if ((Flag & 0x0F) == 0x01)
2367  0002 a40f          	and	a,#15
2368  0004 4a            	dec	a
2369  0005 2606          	jrne	L3311
2370                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2372  0007 721d5403      	bres	21507,#6
2374  000b 2045          	jra	L5311
2375  000d               L3311:
2376                     ; 579   else if ((Flag & 0xF0) == 0x10)
2378  000d 7b02          	ld	a,(OFST+1,sp)
2379  000f a4f0          	and	a,#240
2380  0011 a110          	cp	a,#16
2381  0013 2634          	jrne	L7311
2382                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2384  0015 7b02          	ld	a,(OFST+1,sp)
2385  0017 a40f          	and	a,#15
2386  0019 6b01          	ld	(OFST+0,sp),a
2388                     ; 583     if (temp < 8)
2390  001b a108          	cp	a,#8
2391  001d 2414          	jruge	L1411
2392                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2394  001f 5f            	clrw	x
2395  0020 97            	ld	xl,a
2396  0021 a601          	ld	a,#1
2397  0023 5d            	tnzw	x
2398  0024 2704          	jreq	L241
2399  0026               L441:
2400  0026 48            	sll	a
2401  0027 5a            	decw	x
2402  0028 26fc          	jrne	L441
2403  002a               L241:
2404  002a 43            	cpl	a
2405  002b c4540d        	and	a,21517
2406  002e c7540d        	ld	21517,a
2408  0031 201f          	jra	L5311
2409  0033               L1411:
2410                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2412  0033 a008          	sub	a,#8
2413  0035 5f            	clrw	x
2414  0036 97            	ld	xl,a
2415  0037 a601          	ld	a,#1
2416  0039 5d            	tnzw	x
2417  003a 2704          	jreq	L641
2418  003c               L051:
2419  003c 48            	sll	a
2420  003d 5a            	decw	x
2421  003e 26fc          	jrne	L051
2422  0040               L641:
2423  0040 43            	cpl	a
2424  0041 c4540c        	and	a,21516
2425  0044 c7540c        	ld	21516,a
2426  0047 2009          	jra	L5311
2427  0049               L7311:
2428                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2430  0049 7b02          	ld	a,(OFST+1,sp)
2431  004b 43            	cpl	a
2432  004c c45400        	and	a,21504
2433  004f c75400        	ld	21504,a
2434  0052               L5311:
2435                     ; 596 }
2438  0052 85            	popw	x
2439  0053 81            	ret	
2494                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2494                     ; 617 {
2495                     .text:	section	.text,new
2496  0000               _ADC1_GetITStatus:
2498  0000 89            	pushw	x
2499  0001 88            	push	a
2500       00000001      OFST:	set	1
2503                     ; 618   ITStatus itstatus = RESET;
2505                     ; 619   uint8_t temp = 0;
2507                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2509                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2511  0002 01            	rrwa	x,a
2512  0003 a4f0          	and	a,#240
2513  0005 5f            	clrw	x
2514  0006 02            	rlwa	x,a
2515  0007 a30010        	cpw	x,#16
2516  000a 262c          	jrne	L5711
2517                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2519  000c 7b03          	ld	a,(OFST+2,sp)
2520  000e a40f          	and	a,#15
2521  0010 6b01          	ld	(OFST+0,sp),a
2523                     ; 628     if (temp < 8)
2525  0012 a108          	cp	a,#8
2526  0014 2410          	jruge	L7711
2527                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2529  0016 5f            	clrw	x
2530  0017 97            	ld	xl,a
2531  0018 a601          	ld	a,#1
2532  001a 5d            	tnzw	x
2533  001b 2704          	jreq	L451
2534  001d               L651:
2535  001d 48            	sll	a
2536  001e 5a            	decw	x
2537  001f 26fc          	jrne	L651
2538  0021               L451:
2539  0021 c4540d        	and	a,21517
2542  0024 2017          	jra	L3021
2543  0026               L7711:
2544                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2546  0026 a008          	sub	a,#8
2547  0028 5f            	clrw	x
2548  0029 97            	ld	xl,a
2549  002a a601          	ld	a,#1
2550  002c 5d            	tnzw	x
2551  002d 2704          	jreq	L061
2552  002f               L261:
2553  002f 48            	sll	a
2554  0030 5a            	decw	x
2555  0031 26fc          	jrne	L261
2556  0033               L061:
2557  0033 c4540c        	and	a,21516
2559  0036 2005          	jra	L3021
2560  0038               L5711:
2561                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2563  0038 c65400        	ld	a,21504
2564  003b 1403          	and	a,(OFST+2,sp)
2566  003d               L3021:
2567                     ; 641   return ((ITStatus)itstatus);
2571  003d 5b03          	addw	sp,#3
2572  003f 81            	ret	
2617                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2617                     ; 663 {
2618                     .text:	section	.text,new
2619  0000               _ADC1_ClearITPendingBit:
2621  0000 89            	pushw	x
2622  0001 88            	push	a
2623       00000001      OFST:	set	1
2626                     ; 664   uint8_t temp = 0;
2628                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2630                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2632  0002 01            	rrwa	x,a
2633  0003 a4f0          	and	a,#240
2634  0005 5f            	clrw	x
2635  0006 02            	rlwa	x,a
2636  0007 a30010        	cpw	x,#16
2637  000a 2634          	jrne	L7221
2638                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2640  000c 7b03          	ld	a,(OFST+2,sp)
2641  000e a40f          	and	a,#15
2642  0010 6b01          	ld	(OFST+0,sp),a
2644                     ; 673     if (temp < 8)
2646  0012 a108          	cp	a,#8
2647  0014 2414          	jruge	L1321
2648                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2650  0016 5f            	clrw	x
2651  0017 97            	ld	xl,a
2652  0018 a601          	ld	a,#1
2653  001a 5d            	tnzw	x
2654  001b 2704          	jreq	L661
2655  001d               L071:
2656  001d 48            	sll	a
2657  001e 5a            	decw	x
2658  001f 26fc          	jrne	L071
2659  0021               L661:
2660  0021 43            	cpl	a
2661  0022 c4540d        	and	a,21517
2662  0025 c7540d        	ld	21517,a
2664  0028 201f          	jra	L5321
2665  002a               L1321:
2666                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2668  002a a008          	sub	a,#8
2669  002c 5f            	clrw	x
2670  002d 97            	ld	xl,a
2671  002e a601          	ld	a,#1
2672  0030 5d            	tnzw	x
2673  0031 2704          	jreq	L271
2674  0033               L471:
2675  0033 48            	sll	a
2676  0034 5a            	decw	x
2677  0035 26fc          	jrne	L471
2678  0037               L271:
2679  0037 43            	cpl	a
2680  0038 c4540c        	and	a,21516
2681  003b c7540c        	ld	21516,a
2682  003e 2009          	jra	L5321
2683  0040               L7221:
2684                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2686  0040 7b03          	ld	a,(OFST+2,sp)
2687  0042 43            	cpl	a
2688  0043 c45400        	and	a,21504
2689  0046 c75400        	ld	21504,a
2690  0049               L5321:
2691                     ; 686 }
2694  0049 5b03          	addw	sp,#3
2695  004b 81            	ret	
2708                     	xdef	_ADC1_ClearITPendingBit
2709                     	xdef	_ADC1_GetITStatus
2710                     	xdef	_ADC1_ClearFlag
2711                     	xdef	_ADC1_GetFlagStatus
2712                     	xdef	_ADC1_GetAWDChannelStatus
2713                     	xdef	_ADC1_GetBufferValue
2714                     	xdef	_ADC1_SetLowThreshold
2715                     	xdef	_ADC1_SetHighThreshold
2716                     	xdef	_ADC1_GetConversionValue
2717                     	xdef	_ADC1_StartConversion
2718                     	xdef	_ADC1_AWDChannelConfig
2719                     	xdef	_ADC1_ExternalTriggerConfig
2720                     	xdef	_ADC1_ConversionConfig
2721                     	xdef	_ADC1_SchmittTriggerConfig
2722                     	xdef	_ADC1_PrescalerConfig
2723                     	xdef	_ADC1_ITConfig
2724                     	xdef	_ADC1_DataBufferCmd
2725                     	xdef	_ADC1_ScanModeCmd
2726                     	xdef	_ADC1_Cmd
2727                     	xdef	_ADC1_Init
2728                     	xdef	_ADC1_DeInit
2747                     	end
