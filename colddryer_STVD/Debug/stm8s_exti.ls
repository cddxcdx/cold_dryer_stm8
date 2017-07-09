   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  46                     ; 53 void EXTI_DeInit(void)
  46                     ; 54 {
  48                     .text:	section	.text,new
  49  0000               _EXTI_DeInit:
  53                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  55  0000 725f50a0      	clr	20640
  56                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  58  0004 725f50a1      	clr	20641
  59                     ; 57 }
  62  0008 81            	ret	
 187                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 187                     ; 71 {
 188                     .text:	section	.text,new
 189  0000               _EXTI_SetExtIntSensitivity:
 191  0000 89            	pushw	x
 192       00000000      OFST:	set	0
 195                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 197                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 199                     ; 77   switch (Port)
 201  0001 9e            	ld	a,xh
 203                     ; 99   default:
 203                     ; 100     break;
 204  0002 4d            	tnz	a
 205  0003 270e          	jreq	L12
 206  0005 4a            	dec	a
 207  0006 271a          	jreq	L32
 208  0008 4a            	dec	a
 209  0009 2725          	jreq	L52
 210  000b 4a            	dec	a
 211  000c 2731          	jreq	L72
 212  000e 4a            	dec	a
 213  000f 2745          	jreq	L13
 214  0011 2053          	jra	L311
 215  0013               L12:
 216                     ; 79   case EXTI_PORT_GPIOA:
 216                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 218  0013 c650a0        	ld	a,20640
 219  0016 a4fc          	and	a,#252
 220  0018 c750a0        	ld	20640,a
 221                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 223  001b c650a0        	ld	a,20640
 224  001e 1a02          	or	a,(OFST+2,sp)
 225                     ; 82     break;
 227  0020 202f          	jp	LC001
 228  0022               L32:
 229                     ; 83   case EXTI_PORT_GPIOB:
 229                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 231  0022 c650a0        	ld	a,20640
 232  0025 a4f3          	and	a,#243
 233  0027 c750a0        	ld	20640,a
 234                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 236  002a 7b02          	ld	a,(OFST+2,sp)
 237  002c 48            	sll	a
 238  002d 48            	sll	a
 239                     ; 86     break;
 241  002e 201e          	jp	LC002
 242  0030               L52:
 243                     ; 87   case EXTI_PORT_GPIOC:
 243                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 245  0030 c650a0        	ld	a,20640
 246  0033 a4cf          	and	a,#207
 247  0035 c750a0        	ld	20640,a
 248                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 250  0038 7b02          	ld	a,(OFST+2,sp)
 251  003a 97            	ld	xl,a
 252  003b a610          	ld	a,#16
 253                     ; 90     break;
 255  003d 200d          	jp	LC003
 256  003f               L72:
 257                     ; 91   case EXTI_PORT_GPIOD:
 257                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 259  003f c650a0        	ld	a,20640
 260  0042 a43f          	and	a,#63
 261  0044 c750a0        	ld	20640,a
 262                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 264  0047 7b02          	ld	a,(OFST+2,sp)
 265  0049 97            	ld	xl,a
 266  004a a640          	ld	a,#64
 267  004c               LC003:
 268  004c 42            	mul	x,a
 269  004d 9f            	ld	a,xl
 270  004e               LC002:
 271  004e ca50a0        	or	a,20640
 272  0051               LC001:
 273  0051 c750a0        	ld	20640,a
 274                     ; 94     break;
 276  0054 2010          	jra	L311
 277  0056               L13:
 278                     ; 95   case EXTI_PORT_GPIOE:
 278                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 280  0056 c650a1        	ld	a,20641
 281  0059 a4fc          	and	a,#252
 282  005b c750a1        	ld	20641,a
 283                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 285  005e c650a1        	ld	a,20641
 286  0061 1a02          	or	a,(OFST+2,sp)
 287  0063 c750a1        	ld	20641,a
 288                     ; 98     break;
 290                     ; 99   default:
 290                     ; 100     break;
 292  0066               L311:
 293                     ; 102 }
 296  0066 85            	popw	x
 297  0067 81            	ret	
 355                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 355                     ; 112 {
 356                     .text:	section	.text,new
 357  0000               _EXTI_SetTLISensitivity:
 361                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 363                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 365  0000 721550a1      	bres	20641,#2
 366                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 368  0004 ca50a1        	or	a,20641
 369  0007 c750a1        	ld	20641,a
 370                     ; 119 }
 373  000a 81            	ret	
 419                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 419                     ; 127 {
 420                     .text:	section	.text,new
 421  0000               _EXTI_GetExtIntSensitivity:
 423  0000 88            	push	a
 424       00000001      OFST:	set	1
 427                     ; 128   uint8_t value = 0;
 429  0001 0f01          	clr	(OFST+0,sp)
 431                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 433                     ; 133   switch (Port)
 436                     ; 150   default:
 436                     ; 151     break;
 437  0003 4d            	tnz	a
 438  0004 2710          	jreq	L341
 439  0006 4a            	dec	a
 440  0007 2712          	jreq	L541
 441  0009 4a            	dec	a
 442  000a 2718          	jreq	L741
 443  000c 4a            	dec	a
 444  000d 271b          	jreq	L151
 445  000f 4a            	dec	a
 446  0010 2722          	jreq	L351
 447  0012 7b01          	ld	a,(OFST+0,sp)
 448  0014 2023          	jra	LC004
 449  0016               L341:
 450                     ; 135   case EXTI_PORT_GPIOA:
 450                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 452  0016 c650a0        	ld	a,20640
 453                     ; 137     break;
 455  0019 201c          	jp	LC005
 456  001b               L541:
 457                     ; 138   case EXTI_PORT_GPIOB:
 457                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 459  001b c650a0        	ld	a,20640
 460  001e a40c          	and	a,#12
 461  0020 44            	srl	a
 462  0021 44            	srl	a
 463                     ; 140     break;
 465  0022 2015          	jp	LC004
 466  0024               L741:
 467                     ; 141   case EXTI_PORT_GPIOC:
 467                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 469  0024 c650a0        	ld	a,20640
 470  0027 4e            	swap	a
 471                     ; 143     break;
 473  0028 200d          	jp	LC005
 474  002a               L151:
 475                     ; 144   case EXTI_PORT_GPIOD:
 475                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 477  002a c650a0        	ld	a,20640
 478  002d 4e            	swap	a
 479  002e a40c          	and	a,#12
 480  0030 44            	srl	a
 481  0031 44            	srl	a
 482                     ; 146     break;
 484  0032 2003          	jp	LC005
 485  0034               L351:
 486                     ; 147   case EXTI_PORT_GPIOE:
 486                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 488  0034 c650a1        	ld	a,20641
 489  0037               LC005:
 490  0037 a403          	and	a,#3
 491  0039               LC004:
 493                     ; 149     break;
 495                     ; 150   default:
 495                     ; 151     break;
 497                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 501  0039 5b01          	addw	sp,#1
 502  003b 81            	ret	
 538                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 538                     ; 163 {
 539                     .text:	section	.text,new
 540  0000               _EXTI_GetTLISensitivity:
 542       00000001      OFST:	set	1
 545                     ; 164   uint8_t value = 0;
 547                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 549  0000 c650a1        	ld	a,20641
 550  0003 a404          	and	a,#4
 552                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 556  0005 81            	ret	
 569                     	xdef	_EXTI_GetTLISensitivity
 570                     	xdef	_EXTI_GetExtIntSensitivity
 571                     	xdef	_EXTI_SetTLISensitivity
 572                     	xdef	_EXTI_SetExtIntSensitivity
 573                     	xdef	_EXTI_DeInit
 592                     	end
