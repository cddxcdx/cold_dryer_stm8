   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  43                     ; 53 void EXTI_DeInit(void)
  43                     ; 54 {
  45                     .text:	section	.text,new
  46  0000               _EXTI_DeInit:
  50                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 57 }
  59  0008 81            	ret
 184                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 184                     ; 71 {
 185                     .text:	section	.text,new
 186  0000               _EXTI_SetExtIntSensitivity:
 188  0000 89            	pushw	x
 189       00000000      OFST:	set	0
 192                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 194                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 196                     ; 77   switch (Port)
 198  0001 9e            	ld	a,xh
 200                     ; 99   default:
 200                     ; 100     break;
 201  0002 4d            	tnz	a
 202  0003 270e          	jreq	L12
 203  0005 4a            	dec	a
 204  0006 271d          	jreq	L32
 205  0008 4a            	dec	a
 206  0009 272e          	jreq	L52
 207  000b 4a            	dec	a
 208  000c 2742          	jreq	L72
 209  000e 4a            	dec	a
 210  000f 2756          	jreq	L13
 211  0011 2064          	jra	L311
 212  0013               L12:
 213                     ; 79   case EXTI_PORT_GPIOA:
 213                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 215  0013 c650a0        	ld	a,20640
 216  0016 a4fc          	and	a,#252
 217  0018 c750a0        	ld	20640,a
 218                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 220  001b c650a0        	ld	a,20640
 221  001e 1a02          	or	a,(OFST+2,sp)
 222  0020 c750a0        	ld	20640,a
 223                     ; 82     break;
 225  0023 2052          	jra	L311
 226  0025               L32:
 227                     ; 83   case EXTI_PORT_GPIOB:
 227                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 229  0025 c650a0        	ld	a,20640
 230  0028 a4f3          	and	a,#243
 231  002a c750a0        	ld	20640,a
 232                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 234  002d 7b02          	ld	a,(OFST+2,sp)
 235  002f 48            	sll	a
 236  0030 48            	sll	a
 237  0031 ca50a0        	or	a,20640
 238  0034 c750a0        	ld	20640,a
 239                     ; 86     break;
 241  0037 203e          	jra	L311
 242  0039               L52:
 243                     ; 87   case EXTI_PORT_GPIOC:
 243                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 245  0039 c650a0        	ld	a,20640
 246  003c a4cf          	and	a,#207
 247  003e c750a0        	ld	20640,a
 248                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 250  0041 7b02          	ld	a,(OFST+2,sp)
 251  0043 97            	ld	xl,a
 252  0044 a610          	ld	a,#16
 253  0046 42            	mul	x,a
 254  0047 9f            	ld	a,xl
 255  0048 ca50a0        	or	a,20640
 256  004b c750a0        	ld	20640,a
 257                     ; 90     break;
 259  004e 2027          	jra	L311
 260  0050               L72:
 261                     ; 91   case EXTI_PORT_GPIOD:
 261                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 263  0050 c650a0        	ld	a,20640
 264  0053 a43f          	and	a,#63
 265  0055 c750a0        	ld	20640,a
 266                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 268  0058 7b02          	ld	a,(OFST+2,sp)
 269  005a 97            	ld	xl,a
 270  005b a640          	ld	a,#64
 271  005d 42            	mul	x,a
 272  005e 9f            	ld	a,xl
 273  005f ca50a0        	or	a,20640
 274  0062 c750a0        	ld	20640,a
 275                     ; 94     break;
 277  0065 2010          	jra	L311
 278  0067               L13:
 279                     ; 95   case EXTI_PORT_GPIOE:
 279                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 281  0067 c650a1        	ld	a,20641
 282  006a a4fc          	and	a,#252
 283  006c c750a1        	ld	20641,a
 284                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 286  006f c650a1        	ld	a,20641
 287  0072 1a02          	or	a,(OFST+2,sp)
 288  0074 c750a1        	ld	20641,a
 289                     ; 98     break;
 291  0077               L33:
 292                     ; 99   default:
 292                     ; 100     break;
 294  0077               L311:
 295                     ; 102 }
 298  0077 85            	popw	x
 299  0078 81            	ret
 357                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 357                     ; 112 {
 358                     .text:	section	.text,new
 359  0000               _EXTI_SetTLISensitivity:
 363                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 365                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 367  0000 721550a1      	bres	20641,#2
 368                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 370  0004 ca50a1        	or	a,20641
 371  0007 c750a1        	ld	20641,a
 372                     ; 119 }
 375  000a 81            	ret
 421                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 421                     ; 127 {
 422                     .text:	section	.text,new
 423  0000               _EXTI_GetExtIntSensitivity:
 425  0000 88            	push	a
 426       00000001      OFST:	set	1
 429                     ; 128   uint8_t value = 0;
 431  0001 0f01          	clr	(OFST+0,sp)
 433                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 435                     ; 133   switch (Port)
 438                     ; 150   default:
 438                     ; 151     break;
 439  0003 4d            	tnz	a
 440  0004 270e          	jreq	L341
 441  0006 4a            	dec	a
 442  0007 2714          	jreq	L541
 443  0009 4a            	dec	a
 444  000a 271c          	jreq	L741
 445  000c 4a            	dec	a
 446  000d 2725          	jreq	L151
 447  000f 4a            	dec	a
 448  0010 2730          	jreq	L351
 449  0012 2035          	jra	L302
 450  0014               L341:
 451                     ; 135   case EXTI_PORT_GPIOA:
 451                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 453  0014 c650a0        	ld	a,20640
 454  0017 a403          	and	a,#3
 455  0019 6b01          	ld	(OFST+0,sp),a
 457                     ; 137     break;
 459  001b 202c          	jra	L302
 460  001d               L541:
 461                     ; 138   case EXTI_PORT_GPIOB:
 461                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 463  001d c650a0        	ld	a,20640
 464  0020 a40c          	and	a,#12
 465  0022 44            	srl	a
 466  0023 44            	srl	a
 467  0024 6b01          	ld	(OFST+0,sp),a
 469                     ; 140     break;
 471  0026 2021          	jra	L302
 472  0028               L741:
 473                     ; 141   case EXTI_PORT_GPIOC:
 473                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 475  0028 c650a0        	ld	a,20640
 476  002b a430          	and	a,#48
 477  002d 4e            	swap	a
 478  002e a40f          	and	a,#15
 479  0030 6b01          	ld	(OFST+0,sp),a
 481                     ; 143     break;
 483  0032 2015          	jra	L302
 484  0034               L151:
 485                     ; 144   case EXTI_PORT_GPIOD:
 485                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 487  0034 c650a0        	ld	a,20640
 488  0037 a4c0          	and	a,#192
 489  0039 4e            	swap	a
 490  003a 44            	srl	a
 491  003b 44            	srl	a
 492  003c a403          	and	a,#3
 493  003e 6b01          	ld	(OFST+0,sp),a
 495                     ; 146     break;
 497  0040 2007          	jra	L302
 498  0042               L351:
 499                     ; 147   case EXTI_PORT_GPIOE:
 499                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 501  0042 c650a1        	ld	a,20641
 502  0045 a403          	and	a,#3
 503  0047 6b01          	ld	(OFST+0,sp),a
 505                     ; 149     break;
 507  0049               L551:
 508                     ; 150   default:
 508                     ; 151     break;
 510  0049               L302:
 511                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 513  0049 7b01          	ld	a,(OFST+0,sp)
 516  004b 5b01          	addw	sp,#1
 517  004d 81            	ret
 553                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 553                     ; 163 {
 554                     .text:	section	.text,new
 555  0000               _EXTI_GetTLISensitivity:
 557  0000 88            	push	a
 558       00000001      OFST:	set	1
 561                     ; 164   uint8_t value = 0;
 563                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 565  0001 c650a1        	ld	a,20641
 566  0004 a404          	and	a,#4
 567  0006 6b01          	ld	(OFST+0,sp),a
 569                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 571  0008 7b01          	ld	a,(OFST+0,sp)
 574  000a 5b01          	addw	sp,#1
 575  000c 81            	ret
 588                     	xdef	_EXTI_GetTLISensitivity
 589                     	xdef	_EXTI_GetExtIntSensitivity
 590                     	xdef	_EXTI_SetTLISensitivity
 591                     	xdef	_EXTI_SetExtIntSensitivity
 592                     	xdef	_EXTI_DeInit
 611                     	end
