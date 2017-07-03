   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               _Conversion_Value:
  16  0000 0000          	dc.w	0
  17  0002               _E_Error_Delay_Count:
  18  0002 0000          	dc.w	0
  19  0004               _LP_Error_Delay_Count:
  20  0004 0000          	dc.w	0
  21  0006               _HP_Error_Delay_Count:
  22  0006 0000          	dc.w	0
  23  0008               _RemoteControl_Start_Delay_Count:
  24  0008 0000          	dc.w	0
  25  000a               _RemoteControl_Stop_Delay_Count:
  26  000a 0000          	dc.w	0
  27  000c               _E_Error_Exist_Flag:
  28  000c 00            	dc.b	0
  58                     ; 63 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  58                     ; 64 {
  59                     	switch	.text
  60  0000               f_NonHandledInterrupt:
  64                     ; 68 }
  67  0000 80            	iret
  89                     ; 76 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  89                     ; 77 {
  90                     	switch	.text
  91  0001               f_TRAP_IRQHandler:
  95                     ; 81 }
  98  0001 80            	iret
 120                     ; 88 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 120                     ; 89 
 120                     ; 90 {
 121                     	switch	.text
 122  0002               f_TLI_IRQHandler:
 126                     ; 94 }
 129  0002 80            	iret
 151                     ; 101 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 151                     ; 102 {
 152                     	switch	.text
 153  0003               f_AWU_IRQHandler:
 157                     ; 106 }
 160  0003 80            	iret
 182                     ; 113 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 182                     ; 114 {
 183                     	switch	.text
 184  0004               f_CLK_IRQHandler:
 188                     ; 118 }
 191  0004 80            	iret
 214                     ; 125 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 214                     ; 126 {
 215                     	switch	.text
 216  0005               f_EXTI_PORTA_IRQHandler:
 220                     ; 130 }
 223  0005 80            	iret
 246                     ; 137 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 246                     ; 138 {
 247                     	switch	.text
 248  0006               f_EXTI_PORTB_IRQHandler:
 252                     ; 142 }
 255  0006 80            	iret
 278                     ; 149 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 278                     ; 150 {
 279                     	switch	.text
 280  0007               f_EXTI_PORTC_IRQHandler:
 284                     ; 154 }
 287  0007 80            	iret
 310                     ; 161 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 310                     ; 162 {
 311                     	switch	.text
 312  0008               f_EXTI_PORTD_IRQHandler:
 316                     ; 166 }
 319  0008 80            	iret
 342                     ; 173 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 342                     ; 174 {
 343                     	switch	.text
 344  0009               f_EXTI_PORTE_IRQHandler:
 348                     ; 178 }
 351  0009 80            	iret
 373                     ; 225 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 373                     ; 226 {
 374                     	switch	.text
 375  000a               f_SPI_IRQHandler:
 379                     ; 230 }
 382  000a 80            	iret
 405                     ; 237 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 405                     ; 238 {
 406                     	switch	.text
 407  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 411                     ; 242 }
 414  000b 80            	iret
 437                     ; 249 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 437                     ; 250 {
 438                     	switch	.text
 439  000c               f_TIM1_CAP_COM_IRQHandler:
 443                     ; 254 }
 446  000c 80            	iret
 469                     ; 287  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 469                     ; 288  {
 470                     	switch	.text
 471  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 475                     ; 292  }
 478  000d 80            	iret
 501                     ; 299  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 501                     ; 300  {
 502                     	switch	.text
 503  000e               f_TIM2_CAP_COM_IRQHandler:
 507                     ; 304  }
 510  000e 80            	iret
 534                     ; 314  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 534                     ; 315  {
 535                     	switch	.text
 536  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 538  000f 8a            	push	cc
 539  0010 84            	pop	a
 540  0011 a4bf          	and	a,#191
 541  0013 88            	push	a
 542  0014 86            	pop	cc
 543  0015 3b0002        	push	c_x+2
 544  0018 be00          	ldw	x,c_x
 545  001a 89            	pushw	x
 546  001b 3b0002        	push	c_y+2
 547  001e be00          	ldw	x,c_y
 548  0020 89            	pushw	x
 551                     ; 320   TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 553  0021 a601          	ld	a,#1
 554  0023 cd0000        	call	_TIM3_ClearITPendingBit
 556                     ; 321  }
 559  0026 85            	popw	x
 560  0027 bf00          	ldw	c_y,x
 561  0029 320002        	pop	c_y+2
 562  002c 85            	popw	x
 563  002d bf00          	ldw	c_x,x
 564  002f 320002        	pop	c_x+2
 565  0032 80            	iret
 588                     ; 328  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 588                     ; 329  {
 589                     	switch	.text
 590  0033               f_TIM3_CAP_COM_IRQHandler:
 594                     ; 333  }
 597  0033 80            	iret
 619                     ; 394 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 619                     ; 395 {
 620                     	switch	.text
 621  0034               f_I2C_IRQHandler:
 625                     ; 399 }
 628  0034 80            	iret
 651                     ; 407  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 651                     ; 408  {
 652                     	switch	.text
 653  0035               f_UART2_TX_IRQHandler:
 657                     ; 412  }
 660  0035 80            	iret
 683                     ; 419  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 683                     ; 420  {
 684                     	switch	.text
 685  0036               f_UART2_RX_IRQHandler:
 689                     ; 424  }
 692  0036 80            	iret
 717                     ; 473  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 717                     ; 474  {
 718                     	switch	.text
 719  0037               f_ADC1_IRQHandler:
 721  0037 8a            	push	cc
 722  0038 84            	pop	a
 723  0039 a4bf          	and	a,#191
 724  003b 88            	push	a
 725  003c 86            	pop	cc
 726  003d 3b0002        	push	c_x+2
 727  0040 be00          	ldw	x,c_x
 728  0042 89            	pushw	x
 729  0043 3b0002        	push	c_y+2
 730  0046 be00          	ldw	x,c_y
 731  0048 89            	pushw	x
 734                     ; 479     Conversion_Value = ADC1_GetConversionValue();
 736  0049 cd0000        	call	_ADC1_GetConversionValue
 738  004c bf00          	ldw	_Conversion_Value,x
 739                     ; 481 		ADC1_ClearITPendingBit(ADC1_IT_EOC);
 741  004e ae0080        	ldw	x,#128
 742  0051 cd0000        	call	_ADC1_ClearITPendingBit
 744                     ; 482  }
 747  0054 85            	popw	x
 748  0055 bf00          	ldw	c_y,x
 749  0057 320002        	pop	c_y+2
 750  005a 85            	popw	x
 751  005b bf00          	ldw	c_x,x
 752  005d 320002        	pop	c_x+2
 753  0060 80            	iret
 782                     ; 503  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 782                     ; 504  {
 783                     	switch	.text
 784  0061               f_TIM4_UPD_OVF_IRQHandler:
 786  0061 8a            	push	cc
 787  0062 84            	pop	a
 788  0063 a4bf          	and	a,#191
 789  0065 88            	push	a
 790  0066 86            	pop	cc
 791  0067 3b0002        	push	c_x+2
 792  006a be00          	ldw	x,c_x
 793  006c 89            	pushw	x
 794  006d 3b0002        	push	c_y+2
 795  0070 be00          	ldw	x,c_y
 796  0072 89            	pushw	x
 799                     ; 509 	if(!GPIO_ReadInputPin(Error_Input_PORT,E_Error_PIN)){
 801  0073 4b08          	push	#8
 802  0075 ae5005        	ldw	x,#20485
 803  0078 cd0000        	call	_GPIO_ReadInputPin
 805  007b 5b01          	addw	sp,#1
 806  007d 4d            	tnz	a
 807  007e 2622          	jrne	L172
 808                     ; 510 		if(++E_Error_Delay_Count == E_Error_DelayTime && E_Error_Exist_Flag == FALSE){
 810  0080 be02          	ldw	x,_E_Error_Delay_Count
 811  0082 1c0001        	addw	x,#1
 812  0085 bf02          	ldw	_E_Error_Delay_Count,x
 813  0087 a30bb8        	cpw	x,#3000
 814  008a 2619          	jrne	L572
 816  008c 3d0c          	tnz	_E_Error_Exist_Flag
 817  008e 2615          	jrne	L572
 818                     ; 511 			E_Error_Delay_Count = 0;
 820  0090 5f            	clrw	x
 821  0091 bf02          	ldw	_E_Error_Delay_Count,x
 822                     ; 512 			E_Error_Exist_Flag = TRUE;
 824  0093 3501000c      	mov	_E_Error_Exist_Flag,#1
 825                     ; 513 			GPIO_WriteLow(Run_LED_PORT,Electricalfail_LED_PIN);
 827  0097 4b10          	push	#16
 828  0099 ae500f        	ldw	x,#20495
 829  009c cd0000        	call	_GPIO_WriteLow
 831  009f 84            	pop	a
 832  00a0 2003          	jra	L572
 833  00a2               L172:
 834                     ; 517 		E_Error_Delay_Count = 0;
 836  00a2 5f            	clrw	x
 837  00a3 bf02          	ldw	_E_Error_Delay_Count,x
 838  00a5               L572:
 839                     ; 519 	if(GPIO_ReadInputPin(Error_Input_PORT,LP_Error_PIN)){
 841  00a5 4b04          	push	#4
 842  00a7 ae5005        	ldw	x,#20485
 843  00aa cd0000        	call	_GPIO_ReadInputPin
 845  00ad 5b01          	addw	sp,#1
 846  00af 4d            	tnz	a
 847                     ; 521 	if(GPIO_ReadInputPin(Error_Input_PORT,HP_Error_PIN)){
 849  00b0 4b02          	push	#2
 850  00b2 ae5005        	ldw	x,#20485
 851  00b5 cd0000        	call	_GPIO_ReadInputPin
 853  00b8 5b01          	addw	sp,#1
 854  00ba 4d            	tnz	a
 855                     ; 524 	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Start_PIN)){
 857  00bb 4b20          	push	#32
 858  00bd ae5005        	ldw	x,#20485
 859  00c0 cd0000        	call	_GPIO_ReadInputPin
 861  00c3 5b01          	addw	sp,#1
 862  00c5 4d            	tnz	a
 864  00c6               L503:
 865                     ; 530 	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Stop_PIN)){
 867  00c6 4b10          	push	#16
 868  00c8 ae5005        	ldw	x,#20485
 869  00cb cd0000        	call	_GPIO_ReadInputPin
 871  00ce 5b01          	addw	sp,#1
 872  00d0 4d            	tnz	a
 874  00d1               L113:
 875                     ; 537 	if(E_Error_Exist_Flag == TRUE){
 877  00d1 b60c          	ld	a,_E_Error_Exist_Flag
 878  00d3 a101          	cp	a,#1
 879  00d5 2618          	jrne	L313
 880                     ; 538 		if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
 882  00d7 4b20          	push	#32
 883  00d9 ae5000        	ldw	x,#20480
 884  00dc cd0000        	call	_GPIO_ReadInputPin
 886  00df 5b01          	addw	sp,#1
 887  00e1 4d            	tnz	a
 888  00e2 260b          	jrne	L313
 889                     ; 539 			E_Error_Exist_Flag = 0;
 891  00e4 3f0c          	clr	_E_Error_Exist_Flag
 892                     ; 540 		GPIO_WriteHigh(Run_LED_PORT,Electricalfail_LED_PIN);}
 894  00e6 4b10          	push	#16
 895  00e8 ae500f        	ldw	x,#20495
 896  00eb cd0000        	call	_GPIO_WriteHigh
 898  00ee 84            	pop	a
 899  00ef               L313:
 900                     ; 544   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 902  00ef a601          	ld	a,#1
 903  00f1 cd0000        	call	_TIM4_ClearITPendingBit
 905                     ; 545  }
 908  00f4 85            	popw	x
 909  00f5 bf00          	ldw	c_y,x
 910  00f7 320002        	pop	c_y+2
 911  00fa 85            	popw	x
 912  00fb bf00          	ldw	c_x,x
 913  00fd 320002        	pop	c_x+2
 914  0100 80            	iret
 937                     ; 553 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 937                     ; 554 {
 938                     	switch	.text
 939  0101               f_EEPROM_EEC_IRQHandler:
 943                     ; 558 }
 946  0101 80            	iret
1049                     	xdef	_E_Error_Exist_Flag
1050                     	xdef	_RemoteControl_Stop_Delay_Count
1051                     	xdef	_RemoteControl_Start_Delay_Count
1052                     	xdef	_HP_Error_Delay_Count
1053                     	xdef	_LP_Error_Delay_Count
1054                     	xdef	_E_Error_Delay_Count
1055                     	xdef	_Conversion_Value
1056                     	xdef	f_EEPROM_EEC_IRQHandler
1057                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1058                     	xdef	f_ADC1_IRQHandler
1059                     	xdef	f_UART2_TX_IRQHandler
1060                     	xdef	f_UART2_RX_IRQHandler
1061                     	xdef	f_I2C_IRQHandler
1062                     	xdef	f_TIM3_CAP_COM_IRQHandler
1063                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1064                     	xdef	f_TIM2_CAP_COM_IRQHandler
1065                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1066                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1067                     	xdef	f_TIM1_CAP_COM_IRQHandler
1068                     	xdef	f_SPI_IRQHandler
1069                     	xdef	f_EXTI_PORTE_IRQHandler
1070                     	xdef	f_EXTI_PORTD_IRQHandler
1071                     	xdef	f_EXTI_PORTC_IRQHandler
1072                     	xdef	f_EXTI_PORTB_IRQHandler
1073                     	xdef	f_EXTI_PORTA_IRQHandler
1074                     	xdef	f_CLK_IRQHandler
1075                     	xdef	f_AWU_IRQHandler
1076                     	xdef	f_TLI_IRQHandler
1077                     	xdef	f_TRAP_IRQHandler
1078                     	xdef	f_NonHandledInterrupt
1079                     	xref	_TIM4_ClearITPendingBit
1080                     	xref	_TIM3_ClearITPendingBit
1081                     	xref	_GPIO_ReadInputPin
1082                     	xref	_GPIO_WriteLow
1083                     	xref	_GPIO_WriteHigh
1084                     	xref	_ADC1_ClearITPendingBit
1085                     	xref	_ADC1_GetConversionValue
1086                     	xref.b	c_x
1087                     	xref.b	c_y
1106                     	end
