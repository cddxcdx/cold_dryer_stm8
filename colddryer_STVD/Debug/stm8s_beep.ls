   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  46                     ; 54 void BEEP_DeInit(void)
  46                     ; 55 {
  48                     .text:	section	.text,new
  49  0000               _BEEP_DeInit:
  53                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  55  0000 351f50f3      	mov	20723,#31
  56                     ; 57 }
  59  0004 81            	ret	
 124                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 124                     ; 68 {
 125                     .text:	section	.text,new
 126  0000               _BEEP_Init:
 128  0000 88            	push	a
 129       00000000      OFST:	set	0
 132                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 134                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 136  0001 c650f3        	ld	a,20723
 137  0004 a41f          	and	a,#31
 138  0006 a11f          	cp	a,#31
 139  0008 2610          	jrne	L15
 140                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 142  000a c650f3        	ld	a,20723
 143  000d a4e0          	and	a,#224
 144  000f c750f3        	ld	20723,a
 145                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 147  0012 c650f3        	ld	a,20723
 148  0015 aa0b          	or	a,#11
 149  0017 c750f3        	ld	20723,a
 150  001a               L15:
 151                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 153  001a c650f3        	ld	a,20723
 154  001d a43f          	and	a,#63
 155  001f c750f3        	ld	20723,a
 156                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 158  0022 c650f3        	ld	a,20723
 159  0025 1a01          	or	a,(OFST+1,sp)
 160  0027 c750f3        	ld	20723,a
 161                     ; 82 }
 164  002a 84            	pop	a
 165  002b 81            	ret	
 220                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 220                     ; 92 {
 221                     .text:	section	.text,new
 222  0000               _BEEP_Cmd:
 226                     ; 93   if (NewState != DISABLE)
 228  0000 4d            	tnz	a
 229  0001 2705          	jreq	L101
 230                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 232  0003 721a50f3      	bset	20723,#5
 235  0007 81            	ret	
 236  0008               L101:
 237                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 239  0008 721b50f3      	bres	20723,#5
 240                     ; 103 }
 243  000c 81            	ret	
 296                     .const:	section	.text
 297  0000               L41:
 298  0000 000003e8      	dc.l	1000
 299                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 299                     ; 119 {
 300                     .text:	section	.text,new
 301  0000               _BEEP_LSICalibrationConfig:
 303  0000 5206          	subw	sp,#6
 304       00000006      OFST:	set	6
 307                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 309                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 311  0002 96            	ldw	x,sp
 312  0003 1c0009        	addw	x,#OFST+3
 313  0006 cd0000        	call	c_ltor
 315  0009 ae0000        	ldw	x,#L41
 316  000c cd0000        	call	c_ludv
 318  000f be02          	ldw	x,c_lreg+2
 319  0011 1f03          	ldw	(OFST-3,sp),x
 321                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 323  0013 c650f3        	ld	a,20723
 324  0016 a4e0          	and	a,#224
 325  0018 c750f3        	ld	20723,a
 326                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 328  001b 54            	srlw	x
 329  001c 54            	srlw	x
 330  001d 54            	srlw	x
 331  001e 1f05          	ldw	(OFST-1,sp),x
 333                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 335  0020 58            	sllw	x
 336  0021 58            	sllw	x
 337  0022 58            	sllw	x
 338  0023 1f01          	ldw	(OFST-5,sp),x
 340  0025 1e03          	ldw	x,(OFST-3,sp)
 341  0027 72f001        	subw	x,(OFST-5,sp)
 342  002a 1605          	ldw	y,(OFST-1,sp)
 343  002c 9058          	sllw	y
 344  002e 905c          	incw	y
 345  0030 cd0000        	call	c_imul
 347  0033 1605          	ldw	y,(OFST-1,sp)
 348  0035 9058          	sllw	y
 349  0037 9058          	sllw	y
 350  0039 bf00          	ldw	c_x,x
 351  003b 9058          	sllw	y
 352  003d 90b300        	cpw	y,c_x
 353  0040 7b06          	ld	a,(OFST+0,sp)
 354  0042 2504          	jrult	L331
 355                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 357  0044 a002          	sub	a,#2
 359  0046 2001          	jra	L531
 360  0048               L331:
 361                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 363  0048 4a            	dec	a
 364  0049               L531:
 365  0049 ca50f3        	or	a,20723
 366  004c c750f3        	ld	20723,a
 367                     ; 142 }
 370  004f 5b06          	addw	sp,#6
 371  0051 81            	ret	
 384                     	xdef	_BEEP_LSICalibrationConfig
 385                     	xdef	_BEEP_Cmd
 386                     	xdef	_BEEP_Init
 387                     	xdef	_BEEP_DeInit
 388                     	xref.b	c_lreg
 389                     	xref.b	c_x
 408                     	xref	c_imul
 409                     	xref	c_ludv
 410                     	xref	c_ltor
 411                     	end
