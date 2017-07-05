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
  89  0008               L33:
  90                     ; 17 		task_parameterssetting();
  92  0008 cd0000        	call	_task_parameterssetting
  94                     ; 19 		for(i = 0; i < 1090; i++){
  96  000b 5f            	clrw	x
  97  000c 1f03          	ldw	(OFST-1,sp),x
  99  000e               L73:
 100                     ; 20 			if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 102  000e be00          	ldw	x,_NTC_Conversion_Value
 103  0010 cd0000        	call	c_uitof
 105  0013 ae0004        	ldw	x,#L35
 106  0016 cd0000        	call	c_fdiv
 108  0019 ae0000        	ldw	x,#L36
 109  001c cd0000        	call	c_fmul
 111  001f cd0000        	call	c_ftoi
 113  0022 1603          	ldw	y,(OFST-1,sp)
 114  0024 9058          	sllw	y
 115  0026 bf00          	ldw	c_x,x
 116  0028 93            	ldw	x,y
 117  0029 de0000        	ldw	x,(_TEMP_TABLE,x)
 118  002c b300          	cpw	x,c_x
 119  002e 2318          	jrule	L54
 120                     ; 21 				NTC_TEM_Value = (int16_t)((i - 90 + 5)/10) + current_tem_offset;
 122  0030 1e03          	ldw	x,(OFST-1,sp)
 123  0032 1d0055        	subw	x,#85
 124  0035 a60a          	ld	a,#10
 125  0037 62            	div	x,a
 126  0038 72fb01        	addw	x,(OFST-3,sp)
 127  003b bf00          	ldw	_NTC_TEM_Value,x
 128                     ; 22 				ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 130  003d 4b01          	push	#1
 131  003f ae0020        	ldw	x,#32
 132  0042 cd0000        	call	_ADC1_ITConfig
 134  0045 84            	pop	a
 135                     ; 23 				break;
 137  0046 200e          	jra	L34
 138  0048               L54:
 139                     ; 19 		for(i = 0; i < 1090; i++){
 141  0048 1e03          	ldw	x,(OFST-1,sp)
 142  004a 1c0001        	addw	x,#1
 143  004d 1f03          	ldw	(OFST-1,sp),x
 147  004f 1e03          	ldw	x,(OFST-1,sp)
 148  0051 a30442        	cpw	x,#1090
 149  0054 25b8          	jrult	L73
 150  0056               L34:
 151                     ; 26 		LD_number_A;
 153  0056 4b10          	push	#16
 154  0058 ae500a        	ldw	x,#20490
 155  005b cd0000        	call	_GPIO_WriteLow
 157  005e 84            	pop	a
 160  005f 4b20          	push	#32
 161  0061 ae500a        	ldw	x,#20490
 162  0064 cd0000        	call	_GPIO_WriteLow
 164  0067 84            	pop	a
 167  0068 4b01          	push	#1
 168  006a ae500f        	ldw	x,#20495
 169  006d cd0000        	call	_GPIO_WriteLow
 171  0070 84            	pop	a
 174  0071 4b40          	push	#64
 175  0073 ae500a        	ldw	x,#20490
 176  0076 cd0000        	call	_GPIO_WriteHigh
 178  0079 84            	pop	a
 181  007a 4b01          	push	#1
 182  007c ae5014        	ldw	x,#20500
 183  007f cd0000        	call	_GPIO_WriteLow
 185  0082 84            	pop	a
 188  0083 4b08          	push	#8
 189  0085 ae500a        	ldw	x,#20490
 190  0088 cd0000        	call	_GPIO_WriteLow
 192  008b 84            	pop	a
 195  008c 4b04          	push	#4
 196  008e ae500a        	ldw	x,#20490
 197  0091 cd0000        	call	_GPIO_WriteLow
 199  0094 84            	pop	a
 202  0095 4b80          	push	#128
 203  0097 ae500a        	ldw	x,#20490
 204  009a cd0000        	call	_GPIO_WriteHigh
 206  009d 84            	pop	a
 207                     ; 28     IWDG_ReloadCounter(); 
 210  009e cd0000        	call	_IWDG_ReloadCounter
 213  00a1 ac080008      	jpf	L33
 226                     	xdef	_main
 227                     	xref	_task_parameterssetting
 228                     	xref	_system_init
 229                     	xref.b	_NTC_TEM_Value
 230                     	xref.b	_NTC_Conversion_Value
 231                     	xref	_TEMP_TABLE
 232                     	xref	_IWDG_ReloadCounter
 233                     	xref	_GPIO_WriteLow
 234                     	xref	_GPIO_WriteHigh
 235                     	xref	_ADC1_ITConfig
 236                     .const:	section	.text
 237  0000               L36:
 238  0000 459c4000      	dc.w	17820,16384
 239  0004               L35:
 240  0004 44800000      	dc.w	17536,0
 241                     	xref.b	c_lreg
 242                     	xref.b	c_x
 262                     	xref	c_ftoi
 263                     	xref	c_fmul
 264                     	xref	c_fdiv
 265                     	xref	c_uitof
 266                     	end
