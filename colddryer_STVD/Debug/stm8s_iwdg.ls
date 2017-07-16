   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  78                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  78                     ; 49 {
  80                     .text:	section	.text,new
  81  0000               _IWDG_WriteAccessCmd:
  85                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  87                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  89  0000 c750e0        	ld	20704,a
  90                     ; 54 }
  93  0003 81            	ret
 183                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 183                     ; 64 {
 184                     .text:	section	.text,new
 185  0000               _IWDG_SetPrescaler:
 189                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 191                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 193  0000 c750e1        	ld	20705,a
 194                     ; 69 }
 197  0003 81            	ret
 231                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 231                     ; 79 {
 232                     .text:	section	.text,new
 233  0000               _IWDG_SetReload:
 237                     ; 80   IWDG->RLR = IWDG_Reload;
 239  0000 c750e2        	ld	20706,a
 240                     ; 81 }
 243  0003 81            	ret
 266                     ; 89 void IWDG_ReloadCounter(void)
 266                     ; 90 {
 267                     .text:	section	.text,new
 268  0000               _IWDG_ReloadCounter:
 272                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 274  0000 35aa50e0      	mov	20704,#170
 275                     ; 92 }
 278  0004 81            	ret
 301                     ; 99 void IWDG_Enable(void)
 301                     ; 100 {
 302                     .text:	section	.text,new
 303  0000               _IWDG_Enable:
 307                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 309  0000 35cc50e0      	mov	20704,#204
 310                     ; 102 }
 313  0004 81            	ret
 326                     	xdef	_IWDG_Enable
 327                     	xdef	_IWDG_ReloadCounter
 328                     	xdef	_IWDG_SetReload
 329                     	xdef	_IWDG_SetPrescaler
 330                     	xdef	_IWDG_WriteAccessCmd
 349                     	end
