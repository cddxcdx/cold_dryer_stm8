   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  72                     ; 11 main(){
  74                     	switch	.text
  75  0000               _main:
  77  0000 5206          	subw	sp,#6
  78       00000006      OFST:	set	6
  81                     ; 13 	int16_t current_tem_offset = 0;
  83                     ; 14 	system_init();
  85  0002 cd0000        	call	_system_init
  87                     ; 15 	EE_Parameters_Read();
  89  0005 cd0000        	call	_EE_Parameters_Read
  91  0008               L33:
  92                     ; 18 		task_parameterssetting();
  94  0008 cd0000        	call	_task_parameterssetting
  96                     ; 20 		if(Tem_Update_Flag){		
  98  000b 3d00          	tnz	_Tem_Update_Flag
  99  000d 2759          	jreq	L73
 100                     ; 21 			Tem_Update_Flag = FALSE;
 102  000f 3f00          	clr	_Tem_Update_Flag
 103                     ; 22 			for(i = 0; i < 1451; i++){
 105  0011 5f            	clrw	x
 106  0012 1f05          	ldw	(OFST-1,sp),x
 108  0014               L14:
 109                     ; 23 				if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 111  0014 be00          	ldw	x,_NTC_Conversion_Value
 112  0016 cd0000        	call	c_uitof
 114  0019 ae0004        	ldw	x,#L55
 115  001c cd0000        	call	c_fdiv
 117  001f ae0000        	ldw	x,#L56
 118  0022 cd0000        	call	c_fmul
 120  0025 cd0000        	call	c_ftoi
 122  0028 1605          	ldw	y,(OFST-1,sp)
 123  002a 9058          	sllw	y
 124  002c bf00          	ldw	c_x,x
 125  002e 93            	ldw	x,y
 126  002f de0000        	ldw	x,(_TEMP_TABLE,x)
 127  0032 b300          	cpw	x,c_x
 128  0034 2323          	jrule	L74
 129                     ; 24 					NTC_TEM_Value = (int16_t)((i - 250 + 5)/10) + Current_TEMOffsetSetting;
 131  0036 5f            	clrw	x
 132  0037 b600          	ld	a,_Current_TEMOffsetSetting
 133  0039 2a01          	jrpl	L6
 134  003b 53            	cplw	x
 135  003c               L6:
 136  003c 97            	ld	xl,a
 137  003d 1f01          	ldw	(OFST-5,sp),x
 139  003f 1e05          	ldw	x,(OFST-1,sp)
 140  0041 1d00f5        	subw	x,#245
 141  0044 a60a          	ld	a,#10
 142  0046 cd0000        	call	c_sdivx
 144  0049 72fb01        	addw	x,(OFST-5,sp)
 145  004c bf00          	ldw	_NTC_TEM_Value,x
 146                     ; 25 					ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 148  004e 4b01          	push	#1
 149  0050 ae0020        	ldw	x,#32
 150  0053 cd0000        	call	_ADC1_ITConfig
 152  0056 84            	pop	a
 153                     ; 26 					break;
 155  0057 200f          	jra	L73
 156  0059               L74:
 157                     ; 22 			for(i = 0; i < 1451; i++){
 159  0059 1e05          	ldw	x,(OFST-1,sp)
 160  005b 1c0001        	addw	x,#1
 161  005e 1f05          	ldw	(OFST-1,sp),x
 165  0060 9c            	rvf
 166  0061 1e05          	ldw	x,(OFST-1,sp)
 167  0063 a305ab        	cpw	x,#1451
 168  0066 2fac          	jrslt	L14
 169  0068               L73:
 170                     ; 31     IWDG_ReloadCounter(); 
 172  0068 cd0000        	call	_IWDG_ReloadCounter
 175  006b 209b          	jra	L33
 188                     	xdef	_main
 189                     	xref	_task_parameterssetting
 190                     	xref	_EE_Parameters_Read
 191                     	xref.b	_Current_TEMOffsetSetting
 192                     	xref	_system_init
 193                     	xref.b	_Tem_Update_Flag
 194                     	xref.b	_NTC_TEM_Value
 195                     	xref.b	_NTC_Conversion_Value
 196                     	xref	_TEMP_TABLE
 197                     	xref	_IWDG_ReloadCounter
 198                     	xref	_ADC1_ITConfig
 199                     .const:	section	.text
 200  0000               L56:
 201  0000 459c4000      	dc.w	17820,16384
 202  0004               L55:
 203  0004 44800000      	dc.w	17536,0
 204                     	xref.b	c_lreg
 205                     	xref.b	c_x
 225                     	xref	c_sdivx
 226                     	xref	c_ftoi
 227                     	xref	c_fmul
 228                     	xref	c_fdiv
 229                     	xref	c_uitof
 230                     	end
