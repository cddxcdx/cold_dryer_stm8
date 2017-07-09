#include "stm8s_it.h"
#include "Parameter.h"

EEPROM uint8_t UsingTimes @UsingTimes_MEM;
EEPROM uint8_t TEMAlarmLimitSetting @TEMAlarmLimitSetting_MEM;
EEPROM uint8_t StartDelayTime @StartDelayTime_MEM;

uint8_t Current_TemAlarmLimitValue = 0;
uint8_t Current_StartDelayTimeIndex = 0;


bool temalarmlimitsetting_update_flag = FALSE;
bool startdelaytimeselect_update_flag = FALSE;

void EE_Parameters_Read(void){
	Current_TemAlarmLimitValue = TEMAlarmLimitSetting;
	Current_StartDelayTimeIndex = StartDelayTime;
}		

void task_parameterssetting(void){
	if(temalarmlimitsetting_update_flag){
		temalarmlimitsetting_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmLimitSetting_MEM, Current_TemAlarmLimitValue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
	if(startdelaytimeselect_update_flag){
		startdelaytimeselect_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(StartDelayTime_MEM, Current_StartDelayTimeIndex);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
}