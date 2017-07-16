   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  73                     ; 11 main(){
  75                     .text:	section	.text,new
  76  0000               _main:
  78  0000 5206          	subw	sp,#6
  79       00000006      OFST:	set	6
  82                     ; 13 	int16_t current_tem_offset = 0;
  84                     ; 14 	system_init();
  86  0002 cd0000        	call	_system_init
  88                     ; 15 	EE_Parameters_Read();
  90  0005 cd0000        	call	_EE_Parameters_Read
  92  0008               L33:
  93                     ; 18 		task_parameterssetting();
  95  0008 cd0000        	call	_task_parameterssetting
  97                     ; 20 		if(Tem_Update_Flag){		
  99  000b 3d00          	tnz	_Tem_Update_Flag
 100  000d 2759          	jreq	L73
 101                     ; 21 			Tem_Update_Flag = FALSE;
 103  000f 3f00          	clr	_Tem_Update_Flag
 104                     ; 22 			for(i = 0; i < 1451; i++){
 106  0011 5f            	clrw	x
 107  0012 1f05          	ldw	(OFST-1,sp),x
 109  0014               L14:
 110                     ; 23 				if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 112  0014 be00          	ldw	x,_NTC_Conversion_Value
 113  0016 cd0000        	call	c_uitof
 115  0019 ae0004        	ldw	x,#L55
 116  001c cd0000        	call	c_fdiv
 118  001f ae0000        	ldw	x,#L56
 119  0022 cd0000        	call	c_fmul
 121  0025 cd0000        	call	c_ftoi
 123  0028 1605          	ldw	y,(OFST-1,sp)
 124  002a 9058          	sllw	y
 125  002c bf00          	ldw	c_x,x
 126  002e 93            	ldw	x,y
 127  002f de0000        	ldw	x,(_TEMP_TABLE,x)
 128  0032 b300          	cpw	x,c_x
 129  0034 2323          	jrule	L74
 130                     ; 24 					NTC_TEM_Value = (int16_t)((i - 250 + 5)/10) + Current_TEMOffsetSetting;
 132  0036 5f            	clrw	x
 133  0037 b600          	ld	a,_Current_TEMOffsetSetting
 134  0039 2a01          	jrpl	L6
 135  003b 53            	cplw	x
 136  003c               L6:
 137  003c 97            	ld	xl,a
 138  003d 1f01          	ldw	(OFST-5,sp),x
 140  003f 1e05          	ldw	x,(OFST-1,sp)
 141  0041 1d00f5        	subw	x,#245
 142  0044 a60a          	ld	a,#10
 143  0046 cd0000        	call	c_sdivx
 145  0049 72fb01        	addw	x,(OFST-5,sp)
 146  004c bf00          	ldw	_NTC_TEM_Value,x
 147                     ; 25 					ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 149  004e 4b01          	push	#1
 150  0050 ae0020        	ldw	x,#32
 151  0053 cd0000        	call	_ADC1_ITConfig
 153  0056 84            	pop	a
 154                     ; 26 					break;
 156  0057 200f          	jra	L73
 157  0059               L74:
 158                     ; 22 			for(i = 0; i < 1451; i++){
 160  0059 1e05          	ldw	x,(OFST-1,sp)
 161  005b 1c0001        	addw	x,#1
 162  005e 1f05          	ldw	(OFST-1,sp),x
 166  0060 9c            	rvf
 167  0061 1e05          	ldw	x,(OFST-1,sp)
 168  0063 a305ab        	cpw	x,#1451
 169  0066 2fac          	jrslt	L14
 170  0068               L73:
 171                     ; 31     IWDG_ReloadCounter(); 
 173  0068 cd0000        	call	_IWDG_ReloadCounter
 176  006b 209b          	jra	L33
 189                     	xdef	_main
 190                     	xref	_task_parameterssetting
 191                     	xref	_EE_Parameters_Read
 192                     	xref.b	_Current_TEMOffsetSetting
 193                     	xref	_system_init
 194                     	xref.b	_Tem_Update_Flag
 195                     	xref.b	_NTC_TEM_Value
 196                     	xref.b	_NTC_Conversion_Value
 197                     	xref	_TEMP_TABLE
 198                     	xref	_IWDG_ReloadCounter
 199                     	xref	_ADC1_ITConfig
 200                     .const:	section	.text
 201  0000               L56:
 202  0000 459c4000      	dc.w	17820,16384
 203  0004               L55:
 204  0004 44800000      	dc.w	17536,0
 205                     	xref.b	c_lreg
 206                     	xref.b	c_x
 226                     	xref	c_sdivx
 227                     	xref	c_ftoi
 228                     	xref	c_fmul
 229                     	xref	c_fdiv
 230                     	xref	c_uitof
 231                     	end
