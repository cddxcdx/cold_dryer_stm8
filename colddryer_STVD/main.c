/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "stm8s_it.h"
#include "Periph_Init.h"
#include "Parameter.h"
#include "LED_Disp.h"

main(){
	int16_t i;
	int16_t current_tem_offset = 0;
	system_init();
	EE_Parameters_Read();
	while (1){
		/*Parameters_Seting Mode*/
		task_parameterssetting();
		/*NTC Temperature Value Calculate*/
		if(Tem_Update_Flag){		
			Tem_Update_Flag = FALSE;
			for(i = 0; i < 1451; i++){
				if(TEMP_TABLE[i] > (uint16_t)((float)NTC_Conversion_Value/Resolution*VREF)){
					NTC_TEM_Value = (int16_t)((i - 250 + 5)/10) + current_tem_offset;
					ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
					break;
				}
			}
		}
		/* Reload IWDG counter */
    IWDG_ReloadCounter(); 
	}
}