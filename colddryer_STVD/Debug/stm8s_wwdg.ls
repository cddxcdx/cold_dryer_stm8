   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  63                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 54 {
  65                     .text:	section	.text,new
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  74                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d2      	mov	20690,#127
  77                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aac0          	or	a,#192
  81  0008 c750d1        	ld	20689,a
  82                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d aa40          	or	a,#64
  86  000f a47f          	and	a,#127
  87  0011 c750d2        	ld	20690,a
  88                     ; 61 }
  91  0014 85            	popw	x
  92  0015 81            	ret
 126                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 126                     ; 70 {
 127                     .text:	section	.text,new
 128  0000               _WWDG_SetCounter:
 132                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 134                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 136  0000 a47f          	and	a,#127
 137  0002 c750d1        	ld	20689,a
 138                     ; 77 }
 141  0005 81            	ret
 164                     ; 86 uint8_t WWDG_GetCounter(void)
 164                     ; 87 {
 165                     .text:	section	.text,new
 166  0000               _WWDG_GetCounter:
 170                     ; 88   return(WWDG->CR);
 172  0000 c650d1        	ld	a,20689
 175  0003 81            	ret
 198                     ; 96 void WWDG_SWReset(void)
 198                     ; 97 {
 199                     .text:	section	.text,new
 200  0000               _WWDG_SWReset:
 204                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 206  0000 358050d1      	mov	20689,#128
 207                     ; 99 }
 210  0004 81            	ret
 245                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 245                     ; 109 {
 246                     .text:	section	.text,new
 247  0000               _WWDG_SetWindowValue:
 251                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 253                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 255  0000 aa40          	or	a,#64
 256  0002 a47f          	and	a,#127
 257  0004 c750d2        	ld	20690,a
 258                     ; 114 }
 261  0007 81            	ret
 274                     	xdef	_WWDG_SetWindowValue
 275                     	xdef	_WWDG_SWReset
 276                     	xdef	_WWDG_GetCounter
 277                     	xdef	_WWDG_SetCounter
 278                     	xdef	_WWDG_Init
 297                     	end
