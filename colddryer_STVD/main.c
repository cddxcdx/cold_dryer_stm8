/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "Periph_Init.h"
#include "parameter.h"

typedef enum{
	paramsetmode = 1,
	normalmode
}runningmode_e;

void task_param_set(void){}

main(){
	runningmode_e runningmode = paramsetmode;
	system_init();
	while (1){
		if(runningmode == paramsetmode)
			task_param_set();
		//Input_test();
		/* Reload IWDG counter */
    IWDG_ReloadCounter(); 
	}
}