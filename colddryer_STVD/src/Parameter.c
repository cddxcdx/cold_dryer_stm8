#include "stm8s.h"
#include "stm8s_it.h"
#include "Parameter.h"

EEPROM uint8_t UsingTimes @UsingTimes_MEM;




void EE_Parameters_Read(void){
}		

void task_parameterssetting(void){
	if(!Parameter_Set_Flag) return;
	
}