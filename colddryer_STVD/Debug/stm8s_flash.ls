   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  75                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  75                     ; 88 {
  77                     .text:	section	.text,new
  78  0000               _FLASH_Unlock:
  82                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  84                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  86  0000 a1fd          	cp	a,#253
  87  0002 260a          	jrne	L73
  88                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  90  0004 35565062      	mov	20578,#86
  91                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  93  0008 35ae5062      	mov	20578,#174
  95  000c 2008          	jra	L14
  96  000e               L73:
  97                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  99  000e 35ae5064      	mov	20580,#174
 100                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 102  0012 35565064      	mov	20580,#86
 103  0016               L14:
 104                     ; 104 }
 107  0016 81            	ret
 142                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 142                     ; 113 {
 143                     .text:	section	.text,new
 144  0000               _FLASH_Lock:
 148                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 150                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 152  0000 c4505f        	and	a,20575
 153  0003 c7505f        	ld	20575,a
 154                     ; 119 }
 157  0006 81            	ret
 180                     ; 126 void FLASH_DeInit(void)
 180                     ; 127 {
 181                     .text:	section	.text,new
 182  0000               _FLASH_DeInit:
 186                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 188  0000 725f505a      	clr	20570
 189                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 191  0004 725f505b      	clr	20571
 192                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 194  0008 35ff505c      	mov	20572,#255
 195                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 197  000c 7217505f      	bres	20575,#3
 198                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 200  0010 7213505f      	bres	20575,#1
 201                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 203  0014 c6505f        	ld	a,20575
 204                     ; 134 }
 207  0017 81            	ret
 262                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 262                     ; 143 {
 263                     .text:	section	.text,new
 264  0000               _FLASH_ITConfig:
 268                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 270                     ; 147   if(NewState != DISABLE)
 272  0000 4d            	tnz	a
 273  0001 2706          	jreq	L711
 274                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 276  0003 7212505a      	bset	20570,#1
 278  0007 2004          	jra	L121
 279  0009               L711:
 280                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 282  0009 7213505a      	bres	20570,#1
 283  000d               L121:
 284                     ; 155 }
 287  000d 81            	ret
 321                     ; 164 void FLASH_EraseByte(uint32_t Address)
 321                     ; 165 {
 322                     .text:	section	.text,new
 323  0000               _FLASH_EraseByte:
 325       00000000      OFST:	set	0
 328                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 330                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 332  0000 1e05          	ldw	x,(OFST+5,sp)
 333  0002 7f            	clr	(x)
 334                     ; 171 }
 337  0003 81            	ret
 380                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 380                     ; 182 {
 381                     .text:	section	.text,new
 382  0000               _FLASH_ProgramByte:
 384       00000000      OFST:	set	0
 387                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 389                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 391  0000 7b07          	ld	a,(OFST+7,sp)
 392  0002 1e05          	ldw	x,(OFST+5,sp)
 393  0004 f7            	ld	(x),a
 394                     ; 186 }
 397  0005 81            	ret
 431                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 431                     ; 196 {
 432                     .text:	section	.text,new
 433  0000               _FLASH_ReadByte:
 435       00000000      OFST:	set	0
 438                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 440                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 442  0000 1e05          	ldw	x,(OFST+5,sp)
 443  0002 f6            	ld	a,(x)
 446  0003 81            	ret
 489                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 489                     ; 213 {
 490                     .text:	section	.text,new
 491  0000               _FLASH_ProgramWord:
 493       00000000      OFST:	set	0
 496                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 498                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 500  0000 721c505b      	bset	20571,#6
 501                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 503  0004 721d505c      	bres	20572,#6
 504                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 506  0008 7b07          	ld	a,(OFST+7,sp)
 507  000a 1e05          	ldw	x,(OFST+5,sp)
 508  000c f7            	ld	(x),a
 509                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 511  000d 7b08          	ld	a,(OFST+8,sp)
 512  000f 1e05          	ldw	x,(OFST+5,sp)
 513  0011 e701          	ld	(1,x),a
 514                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 516  0013 7b09          	ld	a,(OFST+9,sp)
 517  0015 1e05          	ldw	x,(OFST+5,sp)
 518  0017 e702          	ld	(2,x),a
 519                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 521  0019 7b0a          	ld	a,(OFST+10,sp)
 522  001b 1e05          	ldw	x,(OFST+5,sp)
 523  001d e703          	ld	(3,x),a
 524                     ; 229 }
 527  001f 81            	ret
 572                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 572                     ; 238 {
 573                     .text:	section	.text,new
 574  0000               _FLASH_ProgramOptionByte:
 576  0000 89            	pushw	x
 577       00000000      OFST:	set	0
 580                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 582                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 584  0001 721e505b      	bset	20571,#7
 585                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 587  0005 721f505c      	bres	20572,#7
 588                     ; 247   if(Address == 0x4800)
 590  0009 a34800        	cpw	x,#18432
 591  000c 2607          	jrne	L542
 592                     ; 250     *((NEAR uint8_t*)Address) = Data;
 594  000e 7b05          	ld	a,(OFST+5,sp)
 595  0010 1e01          	ldw	x,(OFST+1,sp)
 596  0012 f7            	ld	(x),a
 598  0013 200c          	jra	L742
 599  0015               L542:
 600                     ; 255     *((NEAR uint8_t*)Address) = Data;
 602  0015 7b05          	ld	a,(OFST+5,sp)
 603  0017 1e01          	ldw	x,(OFST+1,sp)
 604  0019 f7            	ld	(x),a
 605                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 607  001a 7b05          	ld	a,(OFST+5,sp)
 608  001c 43            	cpl	a
 609  001d 1e01          	ldw	x,(OFST+1,sp)
 610  001f e701          	ld	(1,x),a
 611  0021               L742:
 612                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 614  0021 a6fd          	ld	a,#253
 615  0023 cd0000        	call	_FLASH_WaitForLastOperation
 617                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 619  0026 721f505b      	bres	20571,#7
 620                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 622  002a 721e505c      	bset	20572,#7
 623                     ; 263 }
 626  002e 85            	popw	x
 627  002f 81            	ret
 663                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 663                     ; 271 {
 664                     .text:	section	.text,new
 665  0000               _FLASH_EraseOptionByte:
 667  0000 89            	pushw	x
 668       00000000      OFST:	set	0
 671                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 673                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 675  0001 721e505b      	bset	20571,#7
 676                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 678  0005 721f505c      	bres	20572,#7
 679                     ; 280   if(Address == 0x4800)
 681  0009 a34800        	cpw	x,#18432
 682  000c 2603          	jrne	L762
 683                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 685  000e 7f            	clr	(x)
 687  000f 2009          	jra	L172
 688  0011               L762:
 689                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 691  0011 1e01          	ldw	x,(OFST+1,sp)
 692  0013 7f            	clr	(x)
 693                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 695  0014 1e01          	ldw	x,(OFST+1,sp)
 696  0016 a6ff          	ld	a,#255
 697  0018 e701          	ld	(1,x),a
 698  001a               L172:
 699                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 701  001a a6fd          	ld	a,#253
 702  001c cd0000        	call	_FLASH_WaitForLastOperation
 704                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 706  001f 721f505b      	bres	20571,#7
 707                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 709  0023 721e505c      	bset	20572,#7
 710                     ; 296 }
 713  0027 85            	popw	x
 714  0028 81            	ret
 777                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 777                     ; 304 {
 778                     .text:	section	.text,new
 779  0000               _FLASH_ReadOptionByte:
 781  0000 5204          	subw	sp,#4
 782       00000004      OFST:	set	4
 785                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 787                     ; 306   uint16_t res_value = 0;
 789                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 791                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 793  0002 f6            	ld	a,(x)
 794  0003 6b01          	ld	(OFST-3,sp),a
 796                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 798  0005 e601          	ld	a,(1,x)
 799  0007 6b02          	ld	(OFST-2,sp),a
 801                     ; 315   if(Address == 0x4800)	 
 803  0009 a34800        	cpw	x,#18432
 804  000c 2608          	jrne	L523
 805                     ; 317     res_value =	 value_optbyte;
 807  000e 7b01          	ld	a,(OFST-3,sp)
 808  0010 5f            	clrw	x
 809  0011 97            	ld	xl,a
 810  0012 1f03          	ldw	(OFST-1,sp),x
 813  0014 2023          	jra	L723
 814  0016               L523:
 815                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 817  0016 7b02          	ld	a,(OFST-2,sp)
 818  0018 43            	cpl	a
 819  0019 1101          	cp	a,(OFST-3,sp)
 820  001b 2617          	jrne	L133
 821                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 823  001d 7b01          	ld	a,(OFST-3,sp)
 824  001f 5f            	clrw	x
 825  0020 97            	ld	xl,a
 826  0021 4f            	clr	a
 827  0022 02            	rlwa	x,a
 828  0023 1f03          	ldw	(OFST-1,sp),x
 830                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 832  0025 7b02          	ld	a,(OFST-2,sp)
 833  0027 5f            	clrw	x
 834  0028 97            	ld	xl,a
 835  0029 01            	rrwa	x,a
 836  002a 1a04          	or	a,(OFST+0,sp)
 837  002c 01            	rrwa	x,a
 838  002d 1a03          	or	a,(OFST-1,sp)
 839  002f 01            	rrwa	x,a
 840  0030 1f03          	ldw	(OFST-1,sp),x
 843  0032 2005          	jra	L723
 844  0034               L133:
 845                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 847  0034 ae5555        	ldw	x,#21845
 848  0037 1f03          	ldw	(OFST-1,sp),x
 850  0039               L723:
 851                     ; 331   return(res_value);
 853  0039 1e03          	ldw	x,(OFST-1,sp)
 856  003b 5b04          	addw	sp,#4
 857  003d 81            	ret
 931                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 931                     ; 341 {
 932                     .text:	section	.text,new
 933  0000               _FLASH_SetLowPowerMode:
 935  0000 88            	push	a
 936       00000000      OFST:	set	0
 939                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 941                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 943  0001 c6505a        	ld	a,20570
 944  0004 a4f3          	and	a,#243
 945  0006 c7505a        	ld	20570,a
 946                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 948  0009 c6505a        	ld	a,20570
 949  000c 1a01          	or	a,(OFST+1,sp)
 950  000e c7505a        	ld	20570,a
 951                     ; 350 }
 954  0011 84            	pop	a
 955  0012 81            	ret
1013                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1013                     ; 359 {
1014                     .text:	section	.text,new
1015  0000               _FLASH_SetProgrammingTime:
1019                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1021                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1023  0000 7211505a      	bres	20570,#0
1024                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1026  0004 ca505a        	or	a,20570
1027  0007 c7505a        	ld	20570,a
1028                     ; 365 }
1031  000a 81            	ret
1056                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1056                     ; 373 {
1057                     .text:	section	.text,new
1058  0000               _FLASH_GetLowPowerMode:
1062                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1064  0000 c6505a        	ld	a,20570
1065  0003 a40c          	and	a,#12
1068  0005 81            	ret
1093                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1093                     ; 383 {
1094                     .text:	section	.text,new
1095  0000               _FLASH_GetProgrammingTime:
1099                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1101  0000 c6505a        	ld	a,20570
1102  0003 a401          	and	a,#1
1105  0005 81            	ret
1139                     ; 392 uint32_t FLASH_GetBootSize(void)
1139                     ; 393 {
1140                     .text:	section	.text,new
1141  0000               _FLASH_GetBootSize:
1143  0000 5204          	subw	sp,#4
1144       00000004      OFST:	set	4
1147                     ; 394   uint32_t temp = 0;
1149                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1151  0002 c6505d        	ld	a,20573
1152  0005 5f            	clrw	x
1153  0006 97            	ld	xl,a
1154  0007 90ae0200      	ldw	y,#512
1155  000b cd0000        	call	c_umul
1157  000e 96            	ldw	x,sp
1158  000f 1c0001        	addw	x,#OFST-3
1159  0012 cd0000        	call	c_rtol
1162                     ; 400   if(FLASH->FPR == 0xFF)
1164  0015 c6505d        	ld	a,20573
1165  0018 a1ff          	cp	a,#255
1166  001a 2611          	jrne	L354
1167                     ; 402     temp += 512;
1169  001c ae0200        	ldw	x,#512
1170  001f bf02          	ldw	c_lreg+2,x
1171  0021 ae0000        	ldw	x,#0
1172  0024 bf00          	ldw	c_lreg,x
1173  0026 96            	ldw	x,sp
1174  0027 1c0001        	addw	x,#OFST-3
1175  002a cd0000        	call	c_lgadd
1178  002d               L354:
1179                     ; 406   return(temp);
1181  002d 96            	ldw	x,sp
1182  002e 1c0001        	addw	x,#OFST-3
1183  0031 cd0000        	call	c_ltor
1187  0034 5b04          	addw	sp,#4
1188  0036 81            	ret
1297                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1297                     ; 418 {
1298                     .text:	section	.text,new
1299  0000               _FLASH_GetFlagStatus:
1301  0000 88            	push	a
1302       00000001      OFST:	set	1
1305                     ; 419   FlagStatus status = RESET;
1307                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1309                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1311  0001 c4505f        	and	a,20575
1312  0004 2706          	jreq	L525
1313                     ; 426     status = SET; /* FLASH_FLAG is set */
1315  0006 a601          	ld	a,#1
1316  0008 6b01          	ld	(OFST+0,sp),a
1319  000a 2002          	jra	L725
1320  000c               L525:
1321                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1323  000c 0f01          	clr	(OFST+0,sp)
1325  000e               L725:
1326                     ; 434   return status;
1328  000e 7b01          	ld	a,(OFST+0,sp)
1331  0010 5b01          	addw	sp,#1
1332  0012 81            	ret
1425                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1425                     ; 550 {
1426                     .text:	section	.text,new
1427  0000               _FLASH_WaitForLastOperation:
1429  0000 5203          	subw	sp,#3
1430       00000003      OFST:	set	3
1433                     ; 551   uint8_t flagstatus = 0x00;
1435  0002 0f03          	clr	(OFST+0,sp)
1437                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1439  0004 aeffff        	ldw	x,#65535
1440  0007 1f01          	ldw	(OFST-2,sp),x
1442                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1444  0009 a1fd          	cp	a,#253
1445  000b 2628          	jrne	L116
1447  000d 200e          	jra	L775
1448  000f               L575:
1449                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1449                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1451  000f c6505f        	ld	a,20575
1452  0012 a405          	and	a,#5
1453  0014 6b03          	ld	(OFST+0,sp),a
1455                     ; 563         timeout--;
1457  0016 1e01          	ldw	x,(OFST-2,sp)
1458  0018 1d0001        	subw	x,#1
1459  001b 1f01          	ldw	(OFST-2,sp),x
1461  001d               L775:
1462                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1464  001d 0d03          	tnz	(OFST+0,sp)
1465  001f 261c          	jrne	L506
1467  0021 1e01          	ldw	x,(OFST-2,sp)
1468  0023 26ea          	jrne	L575
1469  0025 2016          	jra	L506
1470  0027               L706:
1471                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1471                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1473  0027 c6505f        	ld	a,20575
1474  002a a441          	and	a,#65
1475  002c 6b03          	ld	(OFST+0,sp),a
1477                     ; 572         timeout--;
1479  002e 1e01          	ldw	x,(OFST-2,sp)
1480  0030 1d0001        	subw	x,#1
1481  0033 1f01          	ldw	(OFST-2,sp),x
1483  0035               L116:
1484                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1486  0035 0d03          	tnz	(OFST+0,sp)
1487  0037 2604          	jrne	L506
1489  0039 1e01          	ldw	x,(OFST-2,sp)
1490  003b 26ea          	jrne	L706
1491  003d               L506:
1492                     ; 583   if(timeout == 0x00 )
1494  003d 1e01          	ldw	x,(OFST-2,sp)
1495  003f 2604          	jrne	L716
1496                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1498  0041 a602          	ld	a,#2
1499  0043 6b03          	ld	(OFST+0,sp),a
1501  0045               L716:
1502                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1504  0045 7b03          	ld	a,(OFST+0,sp)
1507  0047 5b03          	addw	sp,#3
1508  0049 81            	ret
1571                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1571                     ; 599 {
1572                     .text:	section	.text,new
1573  0000               _FLASH_EraseBlock:
1575  0000 89            	pushw	x
1576  0001 5206          	subw	sp,#6
1577       00000006      OFST:	set	6
1580                     ; 600   uint32_t startaddress = 0;
1582                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1584                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1586  0003 7b0b          	ld	a,(OFST+5,sp)
1587  0005 a1fd          	cp	a,#253
1588  0007 260c          	jrne	L356
1589                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1591                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1593  0009 ae8000        	ldw	x,#32768
1594  000c 1f05          	ldw	(OFST-1,sp),x
1595  000e ae0000        	ldw	x,#0
1596  0011 1f03          	ldw	(OFST-3,sp),x
1599  0013 200a          	jra	L556
1600  0015               L356:
1601                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1603                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1605  0015 ae4000        	ldw	x,#16384
1606  0018 1f05          	ldw	(OFST-1,sp),x
1607  001a ae0000        	ldw	x,#0
1608  001d 1f03          	ldw	(OFST-3,sp),x
1610  001f               L556:
1611                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1613  001f 1e07          	ldw	x,(OFST+1,sp)
1614  0021 a680          	ld	a,#128
1615  0023 cd0000        	call	c_cmulx
1617  0026 96            	ldw	x,sp
1618  0027 1c0003        	addw	x,#OFST-3
1619  002a cd0000        	call	c_ladd
1621  002d be02          	ldw	x,c_lreg+2
1622  002f 1f01          	ldw	(OFST-5,sp),x
1624                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1626  0031 721a505b      	bset	20571,#5
1627                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1629  0035 721b505c      	bres	20572,#5
1630                     ; 636     *pwFlash = (uint32_t)0;
1632  0039 1e01          	ldw	x,(OFST-5,sp)
1633  003b a600          	ld	a,#0
1634  003d e703          	ld	(3,x),a
1635  003f a600          	ld	a,#0
1636  0041 e702          	ld	(2,x),a
1637  0043 a600          	ld	a,#0
1638  0045 e701          	ld	(1,x),a
1639  0047 a600          	ld	a,#0
1640  0049 f7            	ld	(x),a
1641                     ; 644 }
1644  004a 5b08          	addw	sp,#8
1645  004c 81            	ret
1749                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1749                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1749                     ; 657 {
1750                     .text:	section	.text,new
1751  0000               _FLASH_ProgramBlock:
1753  0000 89            	pushw	x
1754  0001 5206          	subw	sp,#6
1755       00000006      OFST:	set	6
1758                     ; 658   uint16_t Count = 0;
1760                     ; 659   uint32_t startaddress = 0;
1762                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1764                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1766                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1768  0003 7b0b          	ld	a,(OFST+5,sp)
1769  0005 a1fd          	cp	a,#253
1770  0007 260c          	jrne	L137
1771                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1773                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1775  0009 ae8000        	ldw	x,#32768
1776  000c 1f03          	ldw	(OFST-3,sp),x
1777  000e ae0000        	ldw	x,#0
1778  0011 1f01          	ldw	(OFST-5,sp),x
1781  0013 200a          	jra	L337
1782  0015               L137:
1783                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1785                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1787  0015 ae4000        	ldw	x,#16384
1788  0018 1f03          	ldw	(OFST-3,sp),x
1789  001a ae0000        	ldw	x,#0
1790  001d 1f01          	ldw	(OFST-5,sp),x
1792  001f               L337:
1793                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1795  001f 1e07          	ldw	x,(OFST+1,sp)
1796  0021 a680          	ld	a,#128
1797  0023 cd0000        	call	c_cmulx
1799  0026 96            	ldw	x,sp
1800  0027 1c0001        	addw	x,#OFST-5
1801  002a cd0000        	call	c_lgadd
1804                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1806  002d 0d0c          	tnz	(OFST+6,sp)
1807  002f 260a          	jrne	L537
1808                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1810  0031 7210505b      	bset	20571,#0
1811                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1813  0035 7211505c      	bres	20572,#0
1815  0039 2008          	jra	L737
1816  003b               L537:
1817                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1819  003b 7218505b      	bset	20571,#4
1820                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1822  003f 7219505c      	bres	20572,#4
1823  0043               L737:
1824                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1826  0043 5f            	clrw	x
1827  0044 1f05          	ldw	(OFST-1,sp),x
1829  0046               L147:
1830                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1832  0046 1e0d          	ldw	x,(OFST+7,sp)
1833  0048 72fb05        	addw	x,(OFST-1,sp)
1834  004b f6            	ld	a,(x)
1835  004c 1e03          	ldw	x,(OFST-3,sp)
1836  004e 72fb05        	addw	x,(OFST-1,sp)
1837  0051 f7            	ld	(x),a
1838                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1840  0052 1e05          	ldw	x,(OFST-1,sp)
1841  0054 1c0001        	addw	x,#1
1842  0057 1f05          	ldw	(OFST-1,sp),x
1846  0059 1e05          	ldw	x,(OFST-1,sp)
1847  005b a30080        	cpw	x,#128
1848  005e 25e6          	jrult	L147
1849                     ; 697 }
1852  0060 5b08          	addw	sp,#8
1853  0062 81            	ret
1866                     	xdef	_FLASH_WaitForLastOperation
1867                     	xdef	_FLASH_ProgramBlock
1868                     	xdef	_FLASH_EraseBlock
1869                     	xdef	_FLASH_GetFlagStatus
1870                     	xdef	_FLASH_GetBootSize
1871                     	xdef	_FLASH_GetProgrammingTime
1872                     	xdef	_FLASH_GetLowPowerMode
1873                     	xdef	_FLASH_SetProgrammingTime
1874                     	xdef	_FLASH_SetLowPowerMode
1875                     	xdef	_FLASH_EraseOptionByte
1876                     	xdef	_FLASH_ProgramOptionByte
1877                     	xdef	_FLASH_ReadOptionByte
1878                     	xdef	_FLASH_ProgramWord
1879                     	xdef	_FLASH_ReadByte
1880                     	xdef	_FLASH_ProgramByte
1881                     	xdef	_FLASH_EraseByte
1882                     	xdef	_FLASH_ITConfig
1883                     	xdef	_FLASH_DeInit
1884                     	xdef	_FLASH_Lock
1885                     	xdef	_FLASH_Unlock
1886                     	xref.b	c_lreg
1887                     	xref.b	c_x
1888                     	xref.b	c_y
1907                     	xref	c_ladd
1908                     	xref	c_cmulx
1909                     	xref	c_ltor
1910                     	xref	c_lgadd
1911                     	xref	c_rtol
1912                     	xref	c_umul
1913                     	end
