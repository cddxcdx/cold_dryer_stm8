/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "IO.h"

typedef enum{
	paramsetmode = 1,
	normalmode
}runningmode_e;

void CLK_Init(void){
	
}

void Timer_Init(void){
	
}

void WDG_Init(void){
	
}

void Read_parameters(void){
	
}

void system_init(void){
	CLK_Init();
	IO_Init();
	Timer_Init();
	WDG_Init();
	
	Read_parameters();
}

void task_param_set(void){}

main(){
	runningmode_e runningmode;
	system_init();
	while (1){
		if(runningmode == paramsetmode)
			task_param_set();
	}
}