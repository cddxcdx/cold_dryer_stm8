#ifndef _PARAMETER_H_
#define _PARAMETER_H_
#include "stm8s.h"

#define SoftwareVersion 1.1
#define HardwareVersion 1.3

//�¶�У������
#define TEM_OFFSET 1       //1�൱��1�棬��׼��һ�μӼ����� ���ֵ

//�ڲ�EERPOM��ַ�������
#define FisrtStart_Flag_MEM						0x4000
#define TEMAlarmHighLimitSetting_MEM  0x4001   // �¶ȱ��������趨ֵ
#define TEMAlarmLowLimitSetting_MEM  	0x4002   // �¶ȱ��������趨ֵ
#define TEMOffsetSetting_MEM 					0x4003
#define TEMAlarmEnable_MEM 						0x4004   // �¶��Ƿ���Ҫ������1:��ʾ��Ҫ��0:��ʾ������
#define StartDelayTime_MEM			  		0x4005   // ������ʱ�����趨ֵ
#define TEMShowEnble_MEM              0x4006
#define TEMHighAlarmAutostop_MEM			0x4007   // �¶ȸ߱����Ƿ�ͣ����1:��ʾ��Ҫ��0:��ʾ������

#define ColdDryerStatus_MEM           0x4020

#define TEMAlarmHighLimit_defaultvalue 20
#define TEMAlarmLowLimit_defaultvalue -5
#define TEMAlarmEnable_defaultvalue 1
#define TEMOffset_defaultvalue 0
#define StartDelayTimeIndex_defaultvalue 0
#define TEMShowEnble_defaultvalue 1
#define TEMHighAlarmAutostop_defaultvalue 0

#define TemAlarm_UpLimit 99 //<100
#define TemAlarm_DownLimit -9 //>=0 

#define StartDelayTimeIndex_UpLimit 2
#define StartDelayTimeIndex_DownLimit 0

#define TemOffset_UpLimit 9
#define TemOffset_DownLimit -9

extern int8_t Current_TemAlarmHighLimitValue;
extern int8_t Current_TemAlarmLowLimitValue;
extern int8_t Current_TEMOffsetSetting;
extern int8_t Current_TEMAlarmEnable;
extern int8_t Current_StartDelayTimeIndex;
extern int8_t Current_TEMShowEnble;
extern uint8_t Current_ColdDryerStatus;
extern int8_t Current_TEMHighAlarmAutostop;

extern bool temalarmhighlimitsetting_update_flag;
extern bool temalarmlowlimitsetting_update_flag;
extern bool temalarmenable_update_flag;
extern bool temoffset_update_flag;
extern bool temshowenable_update_flag;
extern bool startdelaytimeselect_update_flag;
extern bool temhighalarmautostop_update_flag;

//void EE_Parameters_FirstStart(void);
void EE_Parameters_Read(void);
void task_parameterssetting(void);

#endif
