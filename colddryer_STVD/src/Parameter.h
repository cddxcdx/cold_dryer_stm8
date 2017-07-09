#ifndef _PARAMETER_H_
#define _PARAMETER_H_
#include "stm8s.h"

//温度校正增量
#define TEM_OFFSET 1       //1相当于1℃，基准，一次加减都是 这个值

//内部EERPOM地址分配情况
#define TEMAlarmLimitSetting_MEM  0x4000   // 温度报警限制设定值
#define StartDelayTime_MEM			  0x4001   // 启动延时限制设定值
#define UsingTimes_MEM  0x4002   // 未解密使用次数限制
#define CODEBIT3_MEM    0x4003   // 3位密码
#define CODEBIT2_MEM    0x4004
#define CODEBIT1_MEM    0x4005
#define FUNCLOCK_MEM    0x4006    //功能锁定标志位; 1:功能锁定; 0:解锁;
#define TEMOFFSETSetting1_MEM 0x4008 //存符号，1:表示负号；0:表示正号
#define TEMOFFSETSetting2_MEM 0x4009 //0位小数点
#define UART485ADDRESS_MEM    0x400A //485通信地址
#define ALARMENABLE  0x4010 //存是否需要报警，1:表示需要；0:表示不报警

#define TemAlarm_UpLimit 50 //<100
#define TemAlarm_DownLimit 0 //>=0 

#define StartDelayTimeIndex_UpLimit 2
#define StartDelayTimeIndex_DownLimit 0

extern EEPROM uint8_t TEMAlarmLimitSetting;
extern EEPROM uint8_t StartDelayTime;
extern uint8_t Current_TemAlarmLimitValue;
extern uint8_t Current_StartDelayTimeIndex;
extern bool temalarmlimitsetting_update_flag;
extern bool startdelaytimeselect_update_flag;

void EE_Parameters_Read(void);
void task_parameterssetting(void);
#endif
