#include "stm8s_it.h"
#include "Parameter.h"

//EEPROM uint8_t UsingTimes @UsingTimes_MEM;
EEPROM int8_t TEMAlarmHighLimitSetting @TEMAlarmHighLimitSetting_MEM;
EEPROM int8_t TEMAlarmLowLimitSetting @TEMAlarmLowLimitSetting_MEM;
EEPROM int8_t TEMOffsetSetting @TEMOffsetSetting_MEM;
EEPROM int8_t TEMAlarmEnable @TEMAlarmEnable_MEM;
EEPROM int8_t StartDelayTime @StartDelayTime_MEM;
EEPROM uint8_t FisrtStart_Flag @FisrtStart_Flag_MEM;
EEPROM int8_t TEMShowEnble @TEMShowEnble_MEM;
EEPROM int8_t TEMHighAlarmAutostop @TEMHighAlarmAutostop_MEM;
EEPROM uint8_t ColdDryerStatus @ColdDryerStatus_MEM;

int8_t Current_TemAlarmHighLimitValue = 0;
int8_t Current_TemAlarmLowLimitValue = 0;
int8_t Current_TEMOffsetSetting = 0;
int8_t Current_TEMAlarmEnable = 0;
int8_t Current_StartDelayTimeIndex = 0;
int8_t Current_TEMShowEnble = 0;
uint8_t Current_ColdDryerStatus = 0;
int8_t Current_TEMHighAlarmAutostop = 0;

bool temalarmhighlimitsetting_update_flag = FALSE;
bool temalarmlowlimitsetting_update_flag = FALSE;
bool temalarmenable_update_flag = FALSE;
bool temoffset_update_flag = FALSE;
bool startdelaytimeselect_update_flag = FALSE;
bool temshowenable_update_flag = FALSE;
bool temhighalarmautostop_update_flag = FALSE;

void EE_Parameters_FirstStart(void){
	if(FisrtStart_Flag != 0xAA){
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMAlarmHighLimitSetting_MEM, TEMAlarmHighLimit_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMAlarmLowLimitSetting_MEM, TEMAlarmLowLimit_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMOffsetSetting_MEM, TEMOffset_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMAlarmEnable_MEM, TEMAlarmEnable_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(StartDelayTime_MEM, StartDelayTimeIndex_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMShowEnble_MEM, TEMShowEnble_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_ProgramByte(TEMHighAlarmAutostop_MEM, TEMHighAlarmAutostop_defaultvalue);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		
		FLASH_ProgramByte(FisrtStart_Flag_MEM, 0xAA);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
}

void EE_Parameters_Read(void){
	EE_Parameters_FirstStart();
	
	Current_TemAlarmHighLimitValue = TEMAlarmHighLimitSetting;
	Current_TemAlarmLowLimitValue = TEMAlarmLowLimitSetting;
	Current_TEMOffsetSetting = TEMOffsetSetting;
	Current_TEMAlarmEnable = TEMAlarmEnable;
	Current_StartDelayTimeIndex = StartDelayTime;
	Current_TEMShowEnble = TEMShowEnble;
	Current_ColdDryerStatus = ColdDryerStatus;
	Current_TEMHighAlarmAutostop = TEMHighAlarmAutostop;
	//autorun
	if(Current_ColdDryerStatus == 1){
		Relay_Output_Flag = TRUE;
		Run_LED_Flash_Flag =TRUE;
	}
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
	if(temshowenable_update_flag){
		temshowenable_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMShowEnble_MEM, Current_TEMShowEnble);
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
	if(temhighalarmautostop_update_flag){
		temhighalarmautostop_update_flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(TEMHighAlarmAutostop_MEM, Current_TEMHighAlarmAutostop);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
	//autorun
	if(ColdDryerStatus_Update_Flag){
		 ColdDryerStatus_Update_Flag = FALSE;
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//解锁, 将设定值写入内部EEPROM
		FLASH_ProgramByte(ColdDryerStatus_MEM, Current_ColdDryerStatus);
		FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
		FLASH_Unlock(FLASH_MEMTYPE_DATA );//上锁
	}
}