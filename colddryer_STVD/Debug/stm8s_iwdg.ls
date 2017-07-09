   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  81                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  81                     ; 49 {
  83                     .text:	section	.text,new
  84  0000               _IWDG_WriteAccessCmd:
  88                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  90                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  92  0000 c750e0        	ld	20704,a
  93                     ; 54 }
  96  0003 81            	ret	
 186                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 186                     ; 64 {
 187                     .text:	section	.text,new
 188  0000               _IWDG_SetPrescaler:
 192                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 194                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 196  0000 c750e1        	ld	20705,a
 197                     ; 69 }
 200  0003 81            	ret	
 234                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 234                     ; 79 {
 235                     .text:	section	.text,new
 236  0000               _IWDG_SetReload:
 240                     ; 80   IWDG->RLR = IWDG_Reload;
 242  0000 c750e2        	ld	20706,a
 243                     ; 81 }
 246  0003 81            	ret	
 269                     ; 89 void IWDG_ReloadCounter(void)
 269                     ; 90 {
 270                     .text:	section	.text,new
 271  0000               _IWDG_ReloadCounter:
 275                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 277  0000 35aa50e0      	mov	20704,#170
 278                     ; 92 }
 281  0004 81            	ret	
 304                     ; 99 void IWDG_Enable(void)
 304                     ; 100 {
 305                     .text:	section	.text,new
 306  0000               _IWDG_Enable:
 310                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 312  0000 35cc50e0      	mov	20704,#204
 313                     ; 102 }
 316  0004 81            	ret	
 329                     	xdef	_IWDG_Enable
 330                     	xdef	_IWDG_ReloadCounter
 331                     	xdef	_IWDG_SetReload
 332                     	xdef	_IWDG_SetPrescaler
 333                     	xdef	_IWDG_WriteAccessCmd
 352                     	end
