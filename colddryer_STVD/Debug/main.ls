   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  70                     ; 11 main(){
  72                     	switch	.text
  73  0000               _main:
  75  0000 5204          	subw	sp,#4
  76       00000004      OFST:	set	4
  79                     ; 13 	uint16_t current_tem_offset = 0;
  81  0002 5f            	clrw	x
  82  0003 1f01          	ldw	(OFST-3,sp),x
  84                     ; 14 	system_init();
  86  0005 cd0000        	call	_system_init
  88  0008               L33:
  89                     ; 17 		task_parameterssetting();
  91  0008 cd0000        	call	_task_parameterssetting
  93                     ; 19 		if(Tem_Update_Flag){		
  95  000b 3d00          	tnz	_Tem_Update_Flag
  96  000d 274d          	jreq	L73
  97                     ; 20 			Tem_Update_Flag = FALSE;
  99  000f 3f00          	clr	_Tem_Update_Flag
 100                     ; 21 			for(i = 0; i < 1090; i++){
 102  0011 5f            	clrw	x
 103  0012 1f03          	ldw	(OFST-1,sp),x
 105  0014               L14:
 106                     ; 22 				if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 108  0014 be00          	ldw	x,_NTC_Conversion_Value
 109  0016 cd0000        	call	c_uitof
 111  0019 ae0004        	ldw	x,#L55
 112  001c cd0000        	call	c_fdiv
 114  001f ae0000        	ldw	x,#L56
 115  0022 cd0000        	call	c_fmul
 117  0025 cd0000        	call	c_ftoi
 119  0028 1603          	ldw	y,(OFST-1,sp)
 120  002a 9058          	sllw	y
 121  002c bf00          	ldw	c_x,x
 122  002e 93            	ldw	x,y
 123  002f de0000        	ldw	x,(_TEMP_TABLE,x)
 124  0032 b300          	cpw	x,c_x
 125  0034 2318          	jrule	L74
 126                     ; 23 					NTC_TEM_Value = (int16_t)((i - 90 + 5)/10) + current_tem_offset;
 128  0036 1e03          	ldw	x,(OFST-1,sp)
 129  0038 1d0055        	subw	x,#85
 130  003b a60a          	ld	a,#10
 131  003d 62            	div	x,a
 132  003e 72fb01        	addw	x,(OFST-3,sp)
 133  0041 bf00          	ldw	_NTC_TEM_Value,x
 134                     ; 24 					ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 136  0043 4b01          	push	#1
 137  0045 ae0020        	ldw	x,#32
 138  0048 cd0000        	call	_ADC1_ITConfig
 140  004b 84            	pop	a
 141                     ; 25 					break;
 143  004c 200e          	jra	L73
 144  004e               L74:
 145                     ; 21 			for(i = 0; i < 1090; i++){
 147  004e 1e03          	ldw	x,(OFST-1,sp)
 148  0050 1c0001        	addw	x,#1
 149  0053 1f03          	ldw	(OFST-1,sp),x
 153  0055 1e03          	ldw	x,(OFST-1,sp)
 154  0057 a30442        	cpw	x,#1090
 155  005a 25b8          	jrult	L14
 156  005c               L73:
 157                     ; 30     IWDG_ReloadCounter(); 
 159  005c cd0000        	call	_IWDG_ReloadCounter
 162  005f 20a7          	jra	L33
 175                     	xdef	_main
 176                     	xref	_task_parameterssetting
 177                     	xref	_system_init
 178                     	xref.b	_Tem_Update_Flag
 179                     	xref.b	_NTC_TEM_Value
 180                     	xref.b	_NTC_Conversion_Value
 181                     	xref	_TEMP_TABLE
 182                     	xref	_IWDG_ReloadCounter
 183                     	xref	_ADC1_ITConfig
 184                     .const:	section	.text
 185  0000               L56:
 186  0000 459c4000      	dc.w	17820,16384
 187  0004               L55:
 188  0004 44800000      	dc.w	17536,0
 189                     	xref.b	c_lreg
 190                     	xref.b	c_x
 210                     	xref	c_ftoi
 211                     	xref	c_fmul
 212                     	xref	c_fdiv
 213                     	xref	c_uitof
 214                     	end
