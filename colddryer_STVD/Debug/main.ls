   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 16 void CLK_Init(void){
  47                     	switch	.text
  48  0000               _CLK_Init:
  52                     ; 17 	CLK_HSICmd(ENABLE);
  54  0000 a601          	ld	a,#1
  55  0002 cd0000        	call	_CLK_HSICmd
  57                     ; 18   CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  59  0005 4f            	clr	a
  60  0006 cd0000        	call	_CLK_SYSCLKConfig
  63  0009               L32:
  64                     ; 19   while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));
  66  0009 ae0102        	ldw	x,#258
  67  000c cd0000        	call	_CLK_GetFlagStatus
  69  000f 4d            	tnz	a
  70  0010 27f7          	jreq	L32
  71                     ; 20 }
  74  0012 81            	ret
 103                     ; 22 void Timer_Init(void){
 104                     	switch	.text
 105  0013               _Timer_Init:
 109                     ; 23 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 111  0013 ae0701        	ldw	x,#1793
 112  0016 cd0000        	call	_CLK_PeripheralClockConfig
 114                     ; 25   TIM1_DeInit();
 116  0019 cd0000        	call	_TIM1_DeInit
 118                     ; 26 	TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_UP, 10000, 0x00); // 10ms 时间基准
 120  001c 4b00          	push	#0
 121  001e ae2710        	ldw	x,#10000
 122  0021 89            	pushw	x
 123  0022 4b00          	push	#0
 124  0024 ae0010        	ldw	x,#16
 125  0027 cd0000        	call	_TIM1_TimeBaseInit
 127  002a 5b04          	addw	sp,#4
 128                     ; 28 	TIM1_SetAutoreload(10000);
 130  002c ae2710        	ldw	x,#10000
 131  002f cd0000        	call	_TIM1_SetAutoreload
 133                     ; 30 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 135  0032 ae0101        	ldw	x,#257
 136  0035 cd0000        	call	_TIM1_ITConfig
 138                     ; 31 	TIM1_Cmd(ENABLE);
 140  0038 a601          	ld	a,#1
 141  003a cd0000        	call	_TIM1_Cmd
 143                     ; 32 }
 146  003d 81            	ret
 169                     ; 34 void WDG_Init(void){
 170                     	switch	.text
 171  003e               _WDG_Init:
 175                     ; 36 }
 178  003e 81            	ret
 206                     ; 40 void system_init(void){
 207                     	switch	.text
 208  003f               _system_init:
 212                     ; 41 	CLK_Init();
 214  003f adbf          	call	_CLK_Init
 216                     ; 42 	IO_Init();
 218  0041 cd0000        	call	_IO_Init
 220                     ; 43 	ADC_Init();
 222  0044 cd0000        	call	_ADC_Init
 224                     ; 44 	Timer_Init();
 226  0047 adca          	call	_Timer_Init
 228                     ; 45 	WDG_Init();
 230  0049 adf3          	call	_WDG_Init
 232                     ; 46 }
 235  004b 81            	ret
 258                     ; 48 void task_param_set(void){}
 259                     	switch	.text
 260  004c               _task_param_set:
 267  004c 81            	ret
 325                     ; 50 main(){
 326                     	switch	.text
 327  004d               _main:
 329  004d 88            	push	a
 330       00000001      OFST:	set	1
 333                     ; 52 	system_init();
 335  004e adef          	call	_system_init
 337                     ; 54 	enableInterrupts();
 340  0050 9a            rim
 342  0051               L511:
 343                     ; 56 		if(runningmode == paramsetmode)
 345  0051 7b01          	ld	a,(OFST+0,sp)
 346  0053 a101          	cp	a,#1
 347  0055 26fa          	jrne	L511
 348                     ; 57 			task_param_set();
 350  0057 adf3          	call	_task_param_set
 352  0059 20f6          	jra	L511
 365                     	xdef	_main
 366                     	xdef	_task_param_set
 367                     	xdef	_system_init
 368                     	xdef	_WDG_Init
 369                     	xdef	_Timer_Init
 370                     	xdef	_CLK_Init
 371                     	xref	_ADC_Init
 372                     	xref	_IO_Init
 373                     	xref	_TIM1_SetAutoreload
 374                     	xref	_TIM1_ITConfig
 375                     	xref	_TIM1_Cmd
 376                     	xref	_TIM1_TimeBaseInit
 377                     	xref	_TIM1_DeInit
 378                     	xref	_CLK_GetFlagStatus
 379                     	xref	_CLK_SYSCLKConfig
 380                     	xref	_CLK_PeripheralClockConfig
 381                     	xref	_CLK_HSICmd
 400                     	end
