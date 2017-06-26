/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

typedef enum{
	paramsetmode = 1,
	normalmode
}runningmode_e;

void system_init(void){
	CLK_Init();
	IO_Init();
	Timer_Init();
	WDG_Init();
	
	Read_parameters();
}
main(){
	runningmode_e runningmode;
	system_init();
	while (1){
		if(runningmode == paramsetmode)
			task_param_set();
	}
}