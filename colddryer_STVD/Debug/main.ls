   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  71                     ; 11 main(){
  73                     	switch	.text
  74  0000               _main:
  76  0000 5204          	subw	sp,#4
  77       00000004      OFST:	set	4
  80                     ; 13 	uint16_t current_tem_offset = 0;
  82  0002 5f            	clrw	x
  83  0003 1f01          	ldw	(OFST-3,sp),x
  85                     ; 14 	system_init();
  87  0005 cd0000        	call	_system_init
  89                     ; 15 	EE_Parameters_Read();
  91  0008 cd0000        	call	_EE_Parameters_Read
  93  000b               L33:
  94                     ; 18 		task_parameterssetting();
  96  000b cd0000        	call	_task_parameterssetting
  98                     ; 20 		if(Tem_Update_Flag){		
 100  000e 3d00          	tnz	_Tem_Update_Flag
 101  0010 274d          	jreq	L73
 102                     ; 21 			Tem_Update_Flag = FALSE;
 104  0012 3f00          	clr	_Tem_Update_Flag
 105                     ; 22 			for(i = 0; i < 1451; i++){
 107  0014 5f            	clrw	x
 108  0015 1f03          	ldw	(OFST-1,sp),x
 110  0017               L14:
 111                     ; 24 				if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 113  0017 be00          	ldw	x,_NTC_Conversion_Value
 114  0019 cd0000        	call	c_uitof
 116  001c ae0004        	ldw	x,#L55
 117  001f cd0000        	call	c_fdiv
 119  0022 ae0000        	ldw	x,#L56
 120  0025 cd0000        	call	c_fmul
 122  0028 cd0000        	call	c_ftoi
 124  002b 1603          	ldw	y,(OFST-1,sp)
 125  002d 9058          	sllw	y
 126  002f bf00          	ldw	c_x,x
 127  0031 93            	ldw	x,y
 128  0032 de0000        	ldw	x,(_TEMP_TABLE,x)
 129  0035 b300          	cpw	x,c_x
 130  0037 2318          	jrule	L74
 131                     ; 25 					NTC_TEM_Value = (int16_t)((i - 250 + 5)/10) + current_tem_offset;
 133  0039 1e03          	ldw	x,(OFST-1,sp)
 134  003b 1d00f5        	subw	x,#245
 135  003e a60a          	ld	a,#10
 136  0040 62            	div	x,a
 137  0041 72fb01        	addw	x,(OFST-3,sp)
 138  0044 bf00          	ldw	_NTC_TEM_Value,x
 139                     ; 26 					ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 141  0046 4b01          	push	#1
 142  0048 ae0020        	ldw	x,#32
 143  004b cd0000        	call	_ADC1_ITConfig
 145  004e 84            	pop	a
 146                     ; 27 					break;
 148  004f 200e          	jra	L73
 149  0051               L74:
 150                     ; 22 			for(i = 0; i < 1451; i++){
 152  0051 1e03          	ldw	x,(OFST-1,sp)
 153  0053 1c0001        	addw	x,#1
 154  0056 1f03          	ldw	(OFST-1,sp),x
 158  0058 1e03          	ldw	x,(OFST-1,sp)
 159  005a a305ab        	cpw	x,#1451
 160  005d 25b8          	jrult	L14
 161  005f               L73:
 162                     ; 32     IWDG_ReloadCounter(); 
 164  005f cd0000        	call	_IWDG_ReloadCounter
 167  0062 20a7          	jra	L33
 180                     	xdef	_main
 181                     	xref	_task_parameterssetting
 182                     	xref	_EE_Parameters_Read
 183                     	xref	_system_init
 184                     	xref.b	_Tem_Update_Flag
 185                     	xref.b	_NTC_TEM_Value
 186                     	xref.b	_NTC_Conversion_Value
 187                     	xref	_TEMP_TABLE
 188                     	xref	_IWDG_ReloadCounter
 189                     	xref	_ADC1_ITConfig
 190                     .const:	section	.text
 191  0000               L56:
 192  0000 459c4000      	dc.w	17820,16384
 193  0004               L55:
 194  0004 44800000      	dc.w	17536,0
 195                     	xref.b	c_lreg
 196                     	xref.b	c_x
 216                     	xref	c_ftoi
 217                     	xref	c_fmul
 218                     	xref	c_fdiv
 219                     	xref	c_uitof
 220                     	end
