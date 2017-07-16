   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 109                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 54 {
 111                     .text:	section	.text,new
 112  0000               _GPIO_DeInit:
 116                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 59 }
 131  0007 81            	ret
 371                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 371                     ; 72 {
 372                     .text:	section	.text,new
 373  0000               _GPIO_Init:
 375  0000 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 381                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 383                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0001 7b05          	ld	a,(OFST+5,sp)
 386  0003 43            	cpl	a
 387  0004 e404          	and	a,(4,x)
 388  0006 e704          	ld	(4,x),a
 389                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 391  0008 7b06          	ld	a,(OFST+6,sp)
 392  000a a580          	bcp	a,#128
 393  000c 271d          	jreq	L771
 394                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 396  000e 7b06          	ld	a,(OFST+6,sp)
 397  0010 a510          	bcp	a,#16
 398  0012 2706          	jreq	L102
 399                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 401  0014 f6            	ld	a,(x)
 402  0015 1a05          	or	a,(OFST+5,sp)
 403  0017 f7            	ld	(x),a
 405  0018 2007          	jra	L302
 406  001a               L102:
 407                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  001a 1e01          	ldw	x,(OFST+1,sp)
 410  001c 7b05          	ld	a,(OFST+5,sp)
 411  001e 43            	cpl	a
 412  001f f4            	and	a,(x)
 413  0020 f7            	ld	(x),a
 414  0021               L302:
 415                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0021 1e01          	ldw	x,(OFST+1,sp)
 418  0023 e602          	ld	a,(2,x)
 419  0025 1a05          	or	a,(OFST+5,sp)
 420  0027 e702          	ld	(2,x),a
 422  0029 2009          	jra	L502
 423  002b               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  002b 1e01          	ldw	x,(OFST+1,sp)
 427  002d 7b05          	ld	a,(OFST+5,sp)
 428  002f 43            	cpl	a
 429  0030 e402          	and	a,(2,x)
 430  0032 e702          	ld	(2,x),a
 431  0034               L502:
 432                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  0034 7b06          	ld	a,(OFST+6,sp)
 435  0036 a540          	bcp	a,#64
 436  0038 270a          	jreq	L702
 437                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  003a 1e01          	ldw	x,(OFST+1,sp)
 440  003c e603          	ld	a,(3,x)
 441  003e 1a05          	or	a,(OFST+5,sp)
 442  0040 e703          	ld	(3,x),a
 444  0042 2009          	jra	L112
 445  0044               L702:
 446                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 448  0044 1e01          	ldw	x,(OFST+1,sp)
 449  0046 7b05          	ld	a,(OFST+5,sp)
 450  0048 43            	cpl	a
 451  0049 e403          	and	a,(3,x)
 452  004b e703          	ld	(3,x),a
 453  004d               L112:
 454                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 456  004d 7b06          	ld	a,(OFST+6,sp)
 457  004f a520          	bcp	a,#32
 458  0051 270a          	jreq	L312
 459                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 461  0053 1e01          	ldw	x,(OFST+1,sp)
 462  0055 e604          	ld	a,(4,x)
 463  0057 1a05          	or	a,(OFST+5,sp)
 464  0059 e704          	ld	(4,x),a
 466  005b 2009          	jra	L512
 467  005d               L312:
 468                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 470  005d 1e01          	ldw	x,(OFST+1,sp)
 471  005f 7b05          	ld	a,(OFST+5,sp)
 472  0061 43            	cpl	a
 473  0062 e404          	and	a,(4,x)
 474  0064 e704          	ld	(4,x),a
 475  0066               L512:
 476                     ; 131 }
 479  0066 85            	popw	x
 480  0067 81            	ret
 526                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 526                     ; 142 {
 527                     .text:	section	.text,new
 528  0000               _GPIO_Write:
 530  0000 89            	pushw	x
 531       00000000      OFST:	set	0
 534                     ; 143   GPIOx->ODR = PortVal;
 536  0001 7b05          	ld	a,(OFST+5,sp)
 537  0003 1e01          	ldw	x,(OFST+1,sp)
 538  0005 f7            	ld	(x),a
 539                     ; 144 }
 542  0006 85            	popw	x
 543  0007 81            	ret
 590                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 590                     ; 155 {
 591                     .text:	section	.text,new
 592  0000               _GPIO_WriteHigh:
 594  0000 89            	pushw	x
 595       00000000      OFST:	set	0
 598                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 600  0001 f6            	ld	a,(x)
 601  0002 1a05          	or	a,(OFST+5,sp)
 602  0004 f7            	ld	(x),a
 603                     ; 157 }
 606  0005 85            	popw	x
 607  0006 81            	ret
 654                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 654                     ; 168 {
 655                     .text:	section	.text,new
 656  0000               _GPIO_WriteLow:
 658  0000 89            	pushw	x
 659       00000000      OFST:	set	0
 662                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 664  0001 7b05          	ld	a,(OFST+5,sp)
 665  0003 43            	cpl	a
 666  0004 f4            	and	a,(x)
 667  0005 f7            	ld	(x),a
 668                     ; 170 }
 671  0006 85            	popw	x
 672  0007 81            	ret
 719                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 719                     ; 181 {
 720                     .text:	section	.text,new
 721  0000               _GPIO_WriteReverse:
 723  0000 89            	pushw	x
 724       00000000      OFST:	set	0
 727                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 729  0001 f6            	ld	a,(x)
 730  0002 1805          	xor	a,	(OFST+5,sp)
 731  0004 f7            	ld	(x),a
 732                     ; 183 }
 735  0005 85            	popw	x
 736  0006 81            	ret
 774                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 774                     ; 192 {
 775                     .text:	section	.text,new
 776  0000               _GPIO_ReadOutputData:
 780                     ; 193   return ((uint8_t)GPIOx->ODR);
 782  0000 f6            	ld	a,(x)
 785  0001 81            	ret
 822                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 822                     ; 203 {
 823                     .text:	section	.text,new
 824  0000               _GPIO_ReadInputData:
 828                     ; 204   return ((uint8_t)GPIOx->IDR);
 830  0000 e601          	ld	a,(1,x)
 833  0002 81            	ret
 901                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 901                     ; 214 {
 902                     .text:	section	.text,new
 903  0000               _GPIO_ReadInputPin:
 905  0000 89            	pushw	x
 906       00000000      OFST:	set	0
 909                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 911  0001 e601          	ld	a,(1,x)
 912  0003 1405          	and	a,(OFST+5,sp)
 915  0005 85            	popw	x
 916  0006 81            	ret
 994                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 994                     ; 226 {
 995                     .text:	section	.text,new
 996  0000               _GPIO_ExternalPullUpConfig:
 998  0000 89            	pushw	x
 999       00000000      OFST:	set	0
1002                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1004                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1006                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1008  0001 0d06          	tnz	(OFST+6,sp)
1009  0003 2708          	jreq	L374
1010                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1012  0005 e603          	ld	a,(3,x)
1013  0007 1a05          	or	a,(OFST+5,sp)
1014  0009 e703          	ld	(3,x),a
1016  000b 2009          	jra	L574
1017  000d               L374:
1018                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1020  000d 1e01          	ldw	x,(OFST+1,sp)
1021  000f 7b05          	ld	a,(OFST+5,sp)
1022  0011 43            	cpl	a
1023  0012 e403          	and	a,(3,x)
1024  0014 e703          	ld	(3,x),a
1025  0016               L574:
1026                     ; 238 }
1029  0016 85            	popw	x
1030  0017 81            	ret
1043                     	xdef	_GPIO_ExternalPullUpConfig
1044                     	xdef	_GPIO_ReadInputPin
1045                     	xdef	_GPIO_ReadOutputData
1046                     	xdef	_GPIO_ReadInputData
1047                     	xdef	_GPIO_WriteReverse
1048                     	xdef	_GPIO_WriteLow
1049                     	xdef	_GPIO_WriteHigh
1050                     	xdef	_GPIO_Write
1051                     	xdef	_GPIO_Init
1052                     	xdef	_GPIO_DeInit
1071                     	end
