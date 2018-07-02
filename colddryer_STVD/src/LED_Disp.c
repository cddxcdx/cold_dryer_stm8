#include "stm8s_it.h"
#include "LED_Disp.h"
#include "Parameter.h"

parametersettingstate_e dt = Tem_Show;
uint8_t StartDelayTimeList[3] = {5,60,120};

static void 
LANControlEnable(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;

	if(Current_LANControlEnable == 0){
		first_dig = 0;
		second_dig = 'N';
	}
	else if(Current_LANControlEnable == 1){
		first_dig = 0;
		second_dig = 'Y';
	}
	
	if(dig == 1){
		if(*step == 0)
			LD_number_L
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_C
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemOffset(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;

	if(Current_TEMOffsetSetting >= -9 && Current_TEMOffsetSetting < 0){
		first_dig = '-';
		second_dig = 0 - (Current_TEMOffsetSetting%10);
	}
	else if(Current_TEMOffsetSetting >= 0 && Current_TEMOffsetSetting <= 99){
		first_dig = Current_TEMOffsetSetting/10;
		second_dig = Current_TEMOffsetSetting%10;	
	}
	
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_C
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemShowEnable(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;
	if(Current_TEMShowEnble == 0){
		first_dig = 0;
		second_dig = 'N';
	}
	else if(Current_TEMShowEnble == 1){
		first_dig = 0;
		second_dig = 'Y';
	}
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_S
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemAlarmEnable(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;
	if(Current_TEMAlarmEnable == 0){
		first_dig = 0;
		second_dig = 'N';
	}
	else if(Current_TEMAlarmEnable == 1){
		first_dig = 0;
		second_dig = 'Y';
	}
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_E
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemHighAlarmAutostop(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;
	if(Current_TEMHighAlarmAutostop == 0){
		first_dig = 0;
		second_dig = 'N';
	}
	else if(Current_TEMHighAlarmAutostop == 1){
		first_dig = 0;
		second_dig = 'Y';
	}
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_A
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
StartDelayTimeSelect(uint8_t dig, uint8_t* step){
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
		if(*step == 0){
			LD_number_T
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemAlarmHighLimitSet(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;

	if(Current_TemAlarmHighLimitValue >= -9 && Current_TemAlarmHighLimitValue < 0){
		first_dig = '-';
		second_dig = 0 - (Current_TemAlarmHighLimitValue%10);
	}
	else if(Current_TemAlarmHighLimitValue >= 0 && Current_TemAlarmHighLimitValue <= 99){
		first_dig = Current_TemAlarmHighLimitValue/10;
		second_dig = Current_TemAlarmHighLimitValue%10;	
	}
	
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_H
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemAlarmLowLimitSet(uint8_t dig, uint8_t* step){
	char first_dig = 0, second_dig = 0;

	if(Current_TemAlarmLowLimitValue >= -9 && Current_TemAlarmLowLimitValue < 0){
		first_dig = '-';
		second_dig = 0 - (Current_TemAlarmLowLimitValue%10);
	}
	else if(Current_TemAlarmLowLimitValue >= 0 && Current_TemAlarmLowLimitValue <= 99){
		first_dig = Current_TemAlarmLowLimitValue/10;
		second_dig = Current_TemAlarmLowLimitValue%10;	
	}
	
	if(dig == 1){
		if(*step == 0)
			LD_number_T
		else if(*step == 1)
			LED_SEGCODE(first_dig,1)
	}
	else if(dig == 2){
		if(*step == 0){
			LD_number_L
			LD_number_DP
		}
		else if(*step == 1)
			LED_SEGCODE(second_dig,2)
	}
}

static void 
TemShow(uint8_t dig){
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

static void 
leddisplay_show(uint8_t dig, uint8_t* step){
	switch(dt){
		case Tem_Show:
			if(Current_TEMShowEnble)
				TemShow(dig);
			else
			{
				LED_SEGCODE('-',1)
				LED_SEGCODE('-',2)
			}
			break;
		case Tem_AlarmHighLimit_Set:
			TemAlarmHighLimitSet(dig,step);
			break;
		case Tem_AlarmLowLimit_Set:
			TemAlarmLowLimitSet(dig,step);
			break;
		case Tem_Alarm_Enable:
			TemAlarmEnable(dig,step);
			break;
		case Tem_Offset:
			TemOffset(dig,step);
			break;
		case Tem_Show_Enable:
			TemShowEnable(dig,step);
			break;
		case Start_DelayTime_Select:
			StartDelayTimeSelect(dig,step);
			break;
		case Tem_HighAlarm_Autostop:
			TemHighAlarmAutostop(dig,step);
			break;
		case LANControl_Enable:
			LANControlEnable(dig,step);
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

