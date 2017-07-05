#include "stm8s_it.h"
#include "LED_Disp.h"

typedef enum{
	Tem_Show = 1,
	Tem_AlarmLimit_Set,
	Start_DelayTime_Select
}parametersettingstate_e;

parametersettingstate_e dt = Tem_Show;

void TemShow(uint8_t dig){
	uint16_t first_dig = 0, second_dig = 0;
	
	if(NTC_TEM_Value > 99){
		LD_number_H;
		return;
	}
	else if(NTC_TEM_Value < -9){
		LD_number_L;	
		return;
	}
	first_dig = NTC_TEM_Value/10;
	second_dig = NTC_TEM_Value%10;
	if(dig == 1){
		
	}
	else if( dig == 2){
		
	}
}

void leddisplay_show(uint8_t dig){
	switch(dt){
		case Tem_Show:
			TemShow(dig);
			break;
		case Tem_AlarmLimit_Set:
		
			break;
		case Start_DelayTime_Select:
			
			break;
		default:
			break;
		}
}

leddisplay_scan(bool sw){
	if(sw){
		leddisplay_show(1);//first
		LD_DIG1;
	}
	else{
		leddisplay_show(2);//second
		LD_DIG2;
	}
	
}

