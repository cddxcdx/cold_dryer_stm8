   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  66                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  66                     ; 54 {
  68                     .text:	section	.text,new
  69  0000               _WWDG_Init:
  71  0000 89            	pushw	x
  72       00000000      OFST:	set	0
  75                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  77                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  79  0001 357f50d2      	mov	20690,#127
  80                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  82  0005 9e            	ld	a,xh
  83  0006 aac0          	or	a,#192
  84  0008 c750d1        	ld	20689,a
  85                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  87  000b 7b02          	ld	a,(OFST+2,sp)
  88  000d a47f          	and	a,#127
  89  000f aa40          	or	a,#64
  90  0011 c750d2        	ld	20690,a
  91                     ; 61 }
  94  0014 85            	popw	x
  95  0015 81            	ret	
 129                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 129                     ; 70 {
 130                     .text:	section	.text,new
 131  0000               _WWDG_SetCounter:
 135                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 137                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 139  0000 a47f          	and	a,#127
 140  0002 c750d1        	ld	20689,a
 141                     ; 77 }
 144  0005 81            	ret	
 167                     ; 86 uint8_t WWDG_GetCounter(void)
 167                     ; 87 {
 168                     .text:	section	.text,new
 169  0000               _WWDG_GetCounter:
 173                     ; 88   return(WWDG->CR);
 175  0000 c650d1        	ld	a,20689
 178  0003 81            	ret	
 201                     ; 96 void WWDG_SWReset(void)
 201                     ; 97 {
 202                     .text:	section	.text,new
 203  0000               _WWDG_SWReset:
 207                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 209  0000 358050d1      	mov	20689,#128
 210                     ; 99 }
 213  0004 81            	ret	
 248                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 248                     ; 109 {
 249                     .text:	section	.text,new
 250  0000               _WWDG_SetWindowValue:
 254                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 256                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 258  0000 a47f          	and	a,#127
 259  0002 aa40          	or	a,#64
 260  0004 c750d2        	ld	20690,a
 261                     ; 114 }
 264  0007 81            	ret	
 277                     	xdef	_WWDG_SetWindowValue
 278                     	xdef	_WWDG_SWReset
 279                     	xdef	_WWDG_GetCounter
 280                     	xdef	_WWDG_SetCounter
 281                     	xdef	_WWDG_Init
 300                     	end
