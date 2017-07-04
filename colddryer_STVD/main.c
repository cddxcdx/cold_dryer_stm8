/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "stm8s_it.h"
#include "Periph_Init.h"
#include "parameter.h"


typedef enum{
	paramsetmode = 1,
	normalmode
}runningmode_e;

void task_param_set(void){}

main(){
	runningmode_e runningmode = paramsetmode;
	uint16_t i;
	system_init();
	while (1){
		if(runningmode == paramsetmode)
			task_param_set();
			
		for(i = 0; i < 1090; i++){
			if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
				NTC_TEM_Value = i - 90;
				ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
				break;
			}
		}
		
		/* Reload IWDG counter */
    IWDG_ReloadCounter(); 
	}
}