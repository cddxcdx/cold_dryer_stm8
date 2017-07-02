   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 13 void CLK_Init(void){
  44                     	switch	.text
  45  0000               _CLK_Init:
  49                     ; 15 }
  52  0000 81            	ret
  75                     ; 17 void Timer_Init(void){
  76                     	switch	.text
  77  0001               _Timer_Init:
  81                     ; 19 }
  84  0001 81            	ret
 107                     ; 21 void WDG_Init(void){
 108                     	switch	.text
 109  0002               _WDG_Init:
 113                     ; 23 }
 116  0002 81            	ret
 139                     ; 25 void Read_parameters(void){
 140                     	switch	.text
 141  0003               _Read_parameters:
 145                     ; 27 }
 148  0003 81            	ret
 176                     ; 29 void system_init(void){
 177                     	switch	.text
 178  0004               _system_init:
 182                     ; 30 	CLK_Init();
 184  0004 adfa          	call	_CLK_Init
 186                     ; 31 	IO_Init();
 188  0006 cd0000        	call	_IO_Init
 190                     ; 32 	Timer_Init();
 192  0009 adf6          	call	_Timer_Init
 194                     ; 33 	WDG_Init();
 196  000b adf5          	call	_WDG_Init
 198                     ; 35 	Read_parameters();
 200  000d adf4          	call	_Read_parameters
 202                     ; 36 }
 205  000f 81            	ret
 228                     ; 38 void task_param_set(void){}
 229                     	switch	.text
 230  0010               _task_param_set:
 237  0010 81            	ret
 294                     ; 40 main(){
 295                     	switch	.text
 296  0011               _main:
 298  0011 88            	push	a
 299       00000001      OFST:	set	1
 302                     ; 42 	system_init();
 304  0012 adf0          	call	_system_init
 306  0014               L711:
 307                     ; 44 		if(runningmode == paramsetmode)
 309  0014 7b01          	ld	a,(OFST+0,sp)
 310  0016 a101          	cp	a,#1
 311  0018 26fa          	jrne	L711
 312                     ; 45 			task_param_set();
 314  001a adf4          	call	_task_param_set
 316  001c 20f6          	jra	L711
 329                     	xdef	_main
 330                     	xdef	_task_param_set
 331                     	xdef	_system_init
 332                     	xdef	_Read_parameters
 333                     	xdef	_WDG_Init
 334                     	xdef	_Timer_Init
 335                     	xdef	_CLK_Init
 336                     	xref	_IO_Init
 355                     	end
