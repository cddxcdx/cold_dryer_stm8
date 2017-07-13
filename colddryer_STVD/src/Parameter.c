#include "stm8s_it.h"
#include "Parameter.h"

//EEPROM uint8_t UsingTimes @UsingTimes_MEM;
EEPROM int8_t TEMAlarmHighLimitSetting @TEMAlarmHighLimitSetting_MEM;
EEPROM int8_t TEMAlarmLowLimitSetting @TEMAlarmLowLimitSetting_MEM;
EEPROM int8_t TEMOffsetSetting @TEMOffsetSetting_MEM;
EEPROM int8_t TEMAlarmEnable @TEMAlarmEnable_MEM;
EEPROM int8_t StartDelayTime @StartDelayTime_MEM;
EEPROM int8_t FisrtStart_Flag @FisrtStart_Flag_MEM;

int8_t Current_TemAlarmHighLimitValue = 0;
int8_t Current_TemAlarmLowLimitValue = 0;
int8_t Current_TEMOffsetSetting = 0;
int8_t Current_TEMAlarmEnable = 0;
int8_t Current_StartDelayTimeIndex = 0;

bool temalarmhighlimitsetting_update_flag = FALSE;
bool temalarmlowlimitsetting_update_flag = FALSE;
bool temalarmenable_update_flag = FALSE;
bool temoffset_update_flag = FALSE;
bool startdelaytimeselect_update_flag = FALSE;

void EE_Parameters_FirstStart(void){
	if(FisrtStart_Flag == 0){
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmHighLimitSetting_MEM, TEMAlarmHighLimit_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMAlarmLowLimitSetting_MEM, TEMAlarmLowLimit_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMOffsetSetting_MEM, TEMOffset_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMAlarmEnable_MEM, TEMAlarmEnable_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMAlarmEnable_MEM, TEMAlarmEnable_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
}

void EE_Parameters_Read(void){
	Current_TemAlarmHighLimitValue = TEMAlarmHighLimitSetting;
	Current_TemAlarmLowLimitValue = TEMAlarmLowLimitSetting;
	Current_TEMOffsetSetting = TEMOffsetSetting;
	Current_TEMAlarmEnable = TEMAlarmEnable;
	Current_StartDelayTimeIndex = StartDelayTime;
}		

void task_parameterssetting(void){
	if(temalarmhighlimitsetting_update_flag){
		temalarmhighlimitsetting_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmHighLimitSetting_MEM, Current_TemAlarmHighLimitValue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
	if(temalarmlowlimitsetting_update_flag){
		temalarmlowlimitsetting_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmLowLimitSetting_MEM, Current_TemAlarmLowLimitValue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
	if(temalarmenable_update_flag){
		temalarmenable_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmEnable_MEM, Current_TEMAlarmEnable);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}	
	if(temoffset_update_flag){
		temoffset_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMOffsetSetting_MEM, Current_TEMOffsetSetting);
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