/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "IO.h"
#include "parameter.h"
typedef enum{
	paramsetmode = 1,
	normalmode
}runningmode_e;

//温度校正增量
#define TEM_OFFSET 2       //2相当于0.2，基准，一次加减都是 这个值

void CLK_Init(void){
	CLK_HSICmd(ENABLE);
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));
}

void Timer_Init(void){
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);

  TIM1_DeInit();
	TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_UP, 10000, 0x00); // 10ms 鏃堕棿鍩哄噯
	//TIM1_PrescalerConfig(TIM1_PRESCALER_16,TIM1_PSCRELOADMODE_IMMEDIATE);
	TIM1_SetAutoreload(10000);
	//TIM1_ARRPreloadConfig(ENABLE);
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
	TIM1_Cmd(ENABLE);
}

void WDG_Init(void){
	
}



void system_init(void){
	CLK_Init();
	IO_Init();
	ADC_Init();
	Timer_Init();
	WDG_Init();
}

void task_param_set(void){}

main(){
	runningmode_e runningmode;
	system_init();

	enableInterrupts();
	while (1){
		if(runningmode == paramsetmode)
			task_param_set();
	}
}