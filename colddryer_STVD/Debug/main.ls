   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 16 void task_param_set(void){}
  44                     	switch	.text
  45  0000               _task_param_set:
  52  0000 81            	ret
 123                     ; 18 main(){
 124                     	switch	.text
 125  0001               _main:
 127  0001 5203          	subw	sp,#3
 128       00000003      OFST:	set	3
 131                     ; 19 	runningmode_e runningmode = paramsetmode;
 133  0003 a601          	ld	a,#1
 134  0005 6b01          	ld	(OFST-2,sp),a
 136                     ; 21 	system_init();
 138  0007 cd0000        	call	_system_init
 140  000a               L35:
 141                     ; 23 		if(runningmode == paramsetmode)
 143  000a 7b01          	ld	a,(OFST-2,sp)
 144  000c a101          	cp	a,#1
 145  000e 2602          	jrne	L75
 146                     ; 24 			task_param_set();
 148  0010 adee          	call	_task_param_set
 150  0012               L75:
 151                     ; 26 		for(i = 0; i < 1090; i++){
 153  0012 5f            	clrw	x
 154  0013 1f02          	ldw	(OFST-1,sp),x
 156  0015               L16:
 157                     ; 27 			if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 159  0015 be00          	ldw	x,_NTC_Conversion_Value
 160  0017 cd0000        	call	c_uitof
 162  001a ae0004        	ldw	x,#L57
 163  001d cd0000        	call	c_fdiv
 165  0020 ae0000        	ldw	x,#L501
 166  0023 cd0000        	call	c_fmul
 168  0026 cd0000        	call	c_ftoi
 170  0029 1602          	ldw	y,(OFST-1,sp)
 171  002b 9058          	sllw	y
 172  002d bf00          	ldw	c_x,x
 173  002f 93            	ldw	x,y
 174  0030 de0000        	ldw	x,(_TEMP_TABLE,x)
 175  0033 b300          	cpw	x,c_x
 176  0035 2312          	jrule	L76
 177                     ; 28 				NTC_TEM_Value = i - 90;
 179  0037 1e02          	ldw	x,(OFST-1,sp)
 180  0039 1d005a        	subw	x,#90
 181  003c bf00          	ldw	_NTC_TEM_Value,x
 182                     ; 29 				ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 184  003e 4b01          	push	#1
 185  0040 ae0020        	ldw	x,#32
 186  0043 cd0000        	call	_ADC1_ITConfig
 188  0046 84            	pop	a
 189                     ; 30 				break;
 191  0047 200e          	jra	L56
 192  0049               L76:
 193                     ; 26 		for(i = 0; i < 1090; i++){
 195  0049 1e02          	ldw	x,(OFST-1,sp)
 196  004b 1c0001        	addw	x,#1
 197  004e 1f02          	ldw	(OFST-1,sp),x
 201  0050 1e02          	ldw	x,(OFST-1,sp)
 202  0052 a30442        	cpw	x,#1090
 203  0055 25be          	jrult	L16
 204  0057               L56:
 205                     ; 35     IWDG_ReloadCounter(); 
 207  0057 cd0000        	call	_IWDG_ReloadCounter
 210  005a 20ae          	jra	L35
 223                     	xdef	_main
 224                     	xdef	_task_param_set
 225                     	xref	_system_init
 226                     	xref.b	_NTC_TEM_Value
 227                     	xref.b	_NTC_Conversion_Value
 228                     	xref	_TEMP_TABLE
 229                     	xref	_IWDG_ReloadCounter
 230                     	xref	_ADC1_ITConfig
 231                     .const:	section	.text
 232  0000               L501:
 233  0000 459c4000      	dc.w	17820,16384
 234  0004               L57:
 235  0004 44800000      	dc.w	17536,0
 236                     	xref.b	c_lreg
 237                     	xref.b	c_x
 257                     	xref	c_ftoi
 258                     	xref	c_fmul
 259                     	xref	c_fdiv
 260                     	xref	c_uitof
 261                     	end
