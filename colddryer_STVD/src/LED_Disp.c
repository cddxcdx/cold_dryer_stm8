#include "stm8s_it.h"
#include "LED_Disp.h"
#include "Parameter.h"

#define TemAlarm_UpLimit 50 //<100
#define TemAlarm_DownLimit 0 //>=0 

uint16_t Current_TemAlarmLimitValue = 0;

parametersettingstate_e dt = Tem_Show;

static void TemAlarmLimitSet(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;
	
	if(*step == 0){//这段代码不应该放在这里，这里主要处理显示
		Current_TemAlarmLimitValue = TEMAlarmLimitSetting;
		*step = 1;
		return;
	}		
	
	if(Current_TemAlarmLimitValue >= TemAlarm_DownLimit && Current_TemAlarmLimitValue <= TemAlarm_UpLimit){
		first_dig = Current_TemAlarmLimitValue/10;
		second_dig = Current_TemAlarmLimitValue%10;
	}
	
	if(dig == 1){
		if(*step == 1)
			LD_number_T
		else if(*step == 2)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 1)
			LD_number_A
		else if(*step == 2)
			LED_SEGCODE(second_dig,2)
	}
}

static void TemShow(uint8_t dig){
	char first_dig = 0, second_dig = 0;
	
	/*if(NTC_TEM_Value > 99){
		LD_number_H;
		return;
	}
	else if(NTC_TEM_Value < -9){
		LD_number_L;	
		return;
	}*/
	if(NTC_TEM_Value >= -9 && NTC_TEM_Value < 0){
		first_dig = '-';
		second_dig = 0 - (NTC_TEM_Value%10);
	}
	else if(NTC_TEM_Value >= 0 && NTC_TEM_Value <= 99){
		first_dig = NTC_TEM_Value/10;
		second_dig = NTC_TEM_Value%10;
	}
	else if(NTC_TEM_Value > 99){
		first_dig = 'L';
		second_dig = 'L';
	}
	else if(NTC_TEM_Value < -9){
		first_dig = 'H';
		second_dig = 'H';
	}
	if(dig == 1)
		LED_SEGCODE(first_dig,1)
	else if(dig == 2)
		LED_SEGCODE(second_dig,2)
	/*if(dig == 1){
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
	}*/
}

static void leddisplay_show(uint8_t dig){
	switch(dt){
		case Tem_Show:
			TemShow(dig);
			break;
		case Tem_AlarmLimit_Set:
			
			break;
		case Start_DelayTime_Select:
			LD_number_T;
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

