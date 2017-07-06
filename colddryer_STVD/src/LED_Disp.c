#include "stm8s_it.h"
#include "LED_Disp.h"

parametersettingstate_e dt = Tem_Show;

static void TemShow(uint8_t dig){
	uint16_t first_dig = 0, second_dig = 0;
	
	if(NTC_TEM_Value > 99){
		LD_number_H;
		return;
	}
	else if(NTC_TEM_Value < -9){
		LD_number_L;	
		return;
	}
	if(NTC_TEM_Value < 0){
		first_dig = 10;
	}
	else
		first_dig = NTC_TEM_Value/10;
	second_dig = NTC_TEM_Value%10;
	if(dig == 1){
		switch(first_dig){
			case 0:
				LD_number_blank;
				break;
			case 1:
				LD_number_1;
				break;
			case 2:
				LD_number_2;
				break;
			case 3:
				LD_number_3;
				break;
			case 4:
				LD_number_4;
				break;
			case 5:
				LD_number_5;
				break;
			case 6:
				LD_number_6;
				break;
			case 7:
				LD_number_7;
				break;
			case 8:
				LD_number_8;
				break;
			case 9:
				LD_number_9;
			case 10:
				LD_number_NEG;
				break;
			default:
				break;
		}
	}
	else if( dig == 2){
		switch(second_dig){
			case 0:
				LD_number_0;
				break;
			case 1:
				LD_number_1;
				break;
			case 2:
				LD_number_2;
				break;
			case 3:
				LD_number_3;
				break;
			case 4:
				LD_number_4;
				break;
			case 5:
				LD_number_5;
				break;
			case 6:
				LD_number_6;
				break;
			case 7:
				LD_number_7;
				break;
			case 8:
				LD_number_8;
				break;
			case 9:
				LD_number_9;
				break;
			default:
				break;
		}
	}
}

static void leddisplay_show(uint8_t dig){
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

void leddisplay_scan(bool sw){
	if(sw){
		LD_DIG1;
		leddisplay_show(1);//first
	}
	else{
		LD_DIG2;
		leddisplay_show(2);//second
	}
	
}

