#include "stm8s_it.h"
#include "LED_Disp.h"
#include "Parameter.h"

parametersettingstate_e dt = Tem_Show;
uint8_t StartDelayTimeList[3] = {5,60,120};

static void StartDelayTimeSelect(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;
  if(Current_StartDelayTimeIndex == 2){
		first_dig = 2;
		second_dig = 'L';
	}		
	else{
		first_dig = StartDelayTimeList[Current_StartDelayTimeIndex]/10;
		second_dig = StartDelayTimeList[Current_StartDelayTimeIndex]%10;
	}
	
	if(dig == 1){
		if(*step == 0)
			LD_number_S
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0)
			LD_number_D
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void TemAlarmLimitSet(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;

	first_dig = Current_TemAlarmLimitValue/10;
	second_dig = Current_TemAlarmLimitValue%10;
	
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0)
			LD_number_A
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void TemShow(uint8_t dig){
	char first_dig = 0, second_dig = 0;
	
	if(NTC_TEM_Value >= -9 && NTC_TEM_Value < 0){
		first_dig = '-';
		second_dig = 0 - (NTC_TEM_Value%10);
	}
	else if(NTC_TEM_Value >= 0 && NTC_TEM_Value <= 99){
		first_dig = NTC_TEM_Value/10;
		second_dig = NTC_TEM_Value%10;
	}
	else if(NTC_TEM_Value > 99){
		first_dig = 'H';
		second_dig = 'H';
	}
	else if(NTC_TEM_Value < -9){
		first_dig = 'L';
		second_dig = 'L';
	}
	if(dig == 1)
		LED_SEGCODE(first_dig,1)
	else if(dig == 2)
		LED_SEGCODE(second_dig,2)
}

static void leddisplay_show(uint8_t dig, uint8_t* step){
	switch(dt){
		case Tem_Show:
			TemShow(dig);
			break;
		case Tem_AlarmLimit_Set:
			TemAlarmLimitSet(dig,step);
			break;
		case Start_DelayTime_Select:
			StartDelayTimeSelect(dig,step);
			break;
		default:
			break;
		}
}

void leddisplay_scan(bool sw, uint8_t* step){
	if(sw){
		LD_DIG1;
		leddisplay_show(1, step);//first
	}
	else{
		LD_DIG2;
		leddisplay_show(2, step);//second
	}
	
}

