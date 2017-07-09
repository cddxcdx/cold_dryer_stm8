   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
 112                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 112                     ; 54 {
 114                     .text:	section	.text,new
 115  0000               _GPIO_DeInit:
 119                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0000 7f            	clr	(x)
 122                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0001 6f02          	clr	(2,x)
 125                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0003 6f03          	clr	(3,x)
 128                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 130  0005 6f04          	clr	(4,x)
 131                     ; 59 }
 134  0007 81            	ret	
 374                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 374                     ; 72 {
 375                     .text:	section	.text,new
 376  0000               _GPIO_Init:
 378  0000 89            	pushw	x
 379       00000000      OFST:	set	0
 382                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 384                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 386                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 388  0001 7b05          	ld	a,(OFST+5,sp)
 389  0003 43            	cpl	a
 390  0004 e404          	and	a,(4,x)
 391  0006 e704          	ld	(4,x),a
 392                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 394  0008 7b06          	ld	a,(OFST+6,sp)
 395  000a 2a16          	jrpl	L771
 396                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 398  000c a510          	bcp	a,#16
 399  000e 2705          	jreq	L102
 400                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 402  0010 f6            	ld	a,(x)
 403  0011 1a05          	or	a,(OFST+5,sp)
 405  0013 2004          	jra	L302
 406  0015               L102:
 407                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  0015 7b05          	ld	a,(OFST+5,sp)
 410  0017 43            	cpl	a
 411  0018 f4            	and	a,(x)
 412  0019               L302:
 413  0019 f7            	ld	(x),a
 414                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 416  001a 1e01          	ldw	x,(OFST+1,sp)
 417  001c e602          	ld	a,(2,x)
 418  001e 1a05          	or	a,(OFST+5,sp)
 420  0020 2005          	jra	L502
 421  0022               L771:
 422                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 424  0022 7b05          	ld	a,(OFST+5,sp)
 425  0024 43            	cpl	a
 426  0025 e402          	and	a,(2,x)
 427  0027               L502:
 428  0027 e702          	ld	(2,x),a
 429                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 431  0029 7b06          	ld	a,(OFST+6,sp)
 432  002b a540          	bcp	a,#64
 433  002d 2706          	jreq	L702
 434                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 436  002f e603          	ld	a,(3,x)
 437  0031 1a05          	or	a,(OFST+5,sp)
 439  0033 2005          	jra	L112
 440  0035               L702:
 441                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 443  0035 7b05          	ld	a,(OFST+5,sp)
 444  0037 43            	cpl	a
 445  0038 e403          	and	a,(3,x)
 446  003a               L112:
 447  003a e703          	ld	(3,x),a
 448                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 450  003c 7b06          	ld	a,(OFST+6,sp)
 451  003e a520          	bcp	a,#32
 452  0040 2706          	jreq	L312
 453                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 455  0042 e604          	ld	a,(4,x)
 456  0044 1a05          	or	a,(OFST+5,sp)
 458  0046 2005          	jra	L512
 459  0048               L312:
 460                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 462  0048 7b05          	ld	a,(OFST+5,sp)
 463  004a 43            	cpl	a
 464  004b e404          	and	a,(4,x)
 465  004d               L512:
 466  004d e704          	ld	(4,x),a
 467                     ; 131 }
 470  004f 85            	popw	x
 471  0050 81            	ret	
 517                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 517                     ; 142 {
 518                     .text:	section	.text,new
 519  0000               _GPIO_Write:
 521       fffffffe      OFST: set -2
 524                     ; 143   GPIOx->ODR = PortVal;
 526  0000 7b03          	ld	a,(OFST+5,sp)
 527  0002 f7            	ld	(x),a
 528                     ; 144 }
 531  0003 81            	ret	
 578                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 578                     ; 155 {
 579                     .text:	section	.text,new
 580  0000               _GPIO_WriteHigh:
 582       fffffffe      OFST: set -2
 585                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 587  0000 f6            	ld	a,(x)
 588  0001 1a03          	or	a,(OFST+5,sp)
 589  0003 f7            	ld	(x),a
 590                     ; 157 }
 593  0004 81            	ret	
 640                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 640                     ; 168 {
 641                     .text:	section	.text,new
 642  0000               _GPIO_WriteLow:
 644       fffffffe      OFST: set -2
 647                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 649  0000 7b03          	ld	a,(OFST+5,sp)
 650  0002 43            	cpl	a
 651  0003 f4            	and	a,(x)
 652  0004 f7            	ld	(x),a
 653                     ; 170 }
 656  0005 81            	ret	
 703                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 703                     ; 181 {
 704                     .text:	section	.text,new
 705  0000               _GPIO_WriteReverse:
 707       fffffffe      OFST: set -2
 710                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 712  0000 f6            	ld	a,(x)
 713  0001 1803          	xor	a,(OFST+5,sp)
 714  0003 f7            	ld	(x),a
 715                     ; 183 }
 718  0004 81            	ret	
 756                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 756                     ; 192 {
 757                     .text:	section	.text,new
 758  0000               _GPIO_ReadOutputData:
 762                     ; 193   return ((uint8_t)GPIOx->ODR);
 764  0000 f6            	ld	a,(x)
 767  0001 81            	ret	
 804                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 804                     ; 203 {
 805                     .text:	section	.text,new
 806  0000               _GPIO_ReadInputData:
 810                     ; 204   return ((uint8_t)GPIOx->IDR);
 812  0000 e601          	ld	a,(1,x)
 815  0002 81            	ret	
 883                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 883                     ; 214 {
 884                     .text:	section	.text,new
 885  0000               _GPIO_ReadInputPin:
 887       fffffffe      OFST: set -2
 890                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 892  0000 e601          	ld	a,(1,x)
 893  0002 1403          	and	a,(OFST+5,sp)
 896  0004 81            	ret	
 974                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 974                     ; 226 {
 975                     .text:	section	.text,new
 976  0000               _GPIO_ExternalPullUpConfig:
 978       fffffffe      OFST: set -2
 981                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 983                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 985                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 987  0000 7b04          	ld	a,(OFST+6,sp)
 988  0002 2706          	jreq	L374
 989                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 991  0004 e603          	ld	a,(3,x)
 992  0006 1a03          	or	a,(OFST+5,sp)
 994  0008 2005          	jra	L574
 995  000a               L374:
 996                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 998  000a 7b03          	ld	a,(OFST+5,sp)
 999  000c 43            	cpl	a
1000  000d e403          	and	a,(3,x)
1001  000f               L574:
1002  000f e703          	ld	(3,x),a
1003                     ; 238 }
1006  0011 81            	ret	
1019                     	xdef	_GPIO_ExternalPullUpConfig
1020                     	xdef	_GPIO_ReadInputPin
1021                     	xdef	_GPIO_ReadOutputData
1022                     	xdef	_GPIO_ReadInputData
1023                     	xdef	_GPIO_WriteReverse
1024                     	xdef	_GPIO_WriteLow
1025                     	xdef	_GPIO_WriteHigh
1026                     	xdef	_GPIO_Write
1027                     	xdef	_GPIO_Init
1028                     	xdef	_GPIO_DeInit
1047                     	end
