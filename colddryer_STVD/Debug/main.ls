   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  69                     ; 10 main(){
  71                     	switch	.text
  72  0000               _main:
  74  0000 5204          	subw	sp,#4
  75       00000004      OFST:	set	4
  78                     ; 12 	uint16_t current_tem_offset = 0;
  80  0002 5f            	clrw	x
  81  0003 1f01          	ldw	(OFST-3,sp),x
  83                     ; 13 	system_init();
  85  0005 cd0000        	call	_system_init
  87  0008               L33:
  88                     ; 16 		task_parameterssetting();
  90  0008 cd0000        	call	_task_parameterssetting
  92                     ; 19 		for(i = 0; i < 1090; i++){
  94  000b 5f            	clrw	x
  95  000c 1f03          	ldw	(OFST-1,sp),x
  97  000e               L73:
  98                     ; 20 			if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
 100  000e be00          	ldw	x,_NTC_Conversion_Value
 101  0010 cd0000        	call	c_uitof
 103  0013 ae0004        	ldw	x,#L35
 104  0016 cd0000        	call	c_fdiv
 106  0019 ae0000        	ldw	x,#L36
 107  001c cd0000        	call	c_fmul
 109  001f cd0000        	call	c_ftoi
 111  0022 1603          	ldw	y,(OFST-1,sp)
 112  0024 9058          	sllw	y
 113  0026 bf00          	ldw	c_x,x
 114  0028 93            	ldw	x,y
 115  0029 de0000        	ldw	x,(_TEMP_TABLE,x)
 116  002c b300          	cpw	x,c_x
 117  002e 2318          	jrule	L54
 118                     ; 21 				NTC_TEM_Value = (i - 90 + 5)/10 + current_tem_offset;
 120  0030 1e03          	ldw	x,(OFST-1,sp)
 121  0032 1d0055        	subw	x,#85
 122  0035 a60a          	ld	a,#10
 123  0037 62            	div	x,a
 124  0038 72fb01        	addw	x,(OFST-3,sp)
 125  003b bf00          	ldw	_NTC_TEM_Value,x
 126                     ; 22 				ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 128  003d 4b01          	push	#1
 129  003f ae0020        	ldw	x,#32
 130  0042 cd0000        	call	_ADC1_ITConfig
 132  0045 84            	pop	a
 133                     ; 23 				break;
 135  0046 200e          	jra	L34
 136  0048               L54:
 137                     ; 19 		for(i = 0; i < 1090; i++){
 139  0048 1e03          	ldw	x,(OFST-1,sp)
 140  004a 1c0001        	addw	x,#1
 141  004d 1f03          	ldw	(OFST-1,sp),x
 145  004f 1e03          	ldw	x,(OFST-1,sp)
 146  0051 a30442        	cpw	x,#1090
 147  0054 25b8          	jrult	L73
 148  0056               L34:
 149                     ; 27     IWDG_ReloadCounter(); 
 151  0056 cd0000        	call	_IWDG_ReloadCounter
 154  0059 20ad          	jra	L33
 167                     	xdef	_main
 168                     	xref	_task_parameterssetting
 169                     	xref	_system_init
 170                     	xref.b	_NTC_TEM_Value
 171                     	xref.b	_NTC_Conversion_Value
 172                     	xref	_TEMP_TABLE
 173                     	xref	_IWDG_ReloadCounter
 174                     	xref	_ADC1_ITConfig
 175                     .const:	section	.text
 176  0000               L36:
 177  0000 459c4000      	dc.w	17820,16384
 178  0004               L35:
 179  0004 44800000      	dc.w	17536,0
 180                     	xref.b	c_lreg
 181                     	xref.b	c_x
 201                     	xref	c_ftoi
 202                     	xref	c_fmul
 203                     	xref	c_fdiv
 204                     	xref	c_uitof
 205                     	end
