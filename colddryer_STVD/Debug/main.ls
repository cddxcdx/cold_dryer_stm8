   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 14 void task_param_set(void){}
  44                     	switch	.text
  45  0000               _task_param_set:
  52  0000 81            	ret
 110                     ; 16 main(){
 111                     	switch	.text
 112  0001               _main:
 114  0001 88            	push	a
 115       00000001      OFST:	set	1
 118                     ; 17 	runningmode_e runningmode = paramsetmode;
 120  0002 a601          	ld	a,#1
 121  0004 6b01          	ld	(OFST+0,sp),a
 123                     ; 18 	system_init();
 125  0006 cd0000        	call	_system_init
 127  0009               L74:
 128                     ; 20 		if(runningmode == paramsetmode)
 130  0009 7b01          	ld	a,(OFST+0,sp)
 131  000b a101          	cp	a,#1
 132  000d 2602          	jrne	L35
 133                     ; 21 			task_param_set();
 135  000f adef          	call	_task_param_set
 137  0011               L35:
 138                     ; 24     IWDG_ReloadCounter(); 
 140  0011 cd0000        	call	_IWDG_ReloadCounter
 143  0014 20f3          	jra	L74
 156                     	xdef	_main
 157                     	xdef	_task_param_set
 158                     	xref	_system_init
 159                     	xref	_IWDG_ReloadCounter
 178                     	end
