#ifndef _PARAMETER_H_
#define _PARAMETER_H_
#include "stm8s.h"

//�¶�У������
#define TEM_OFFSET 1       //1�൱��1�棬��׼��һ�μӼ����� ���ֵ

//�ڲ�EERPOM��ַ�������
#define TEMAlarmLimitSetting_MEM  0x4000   // �¶ȱ��������趨ֵ
#define StartDelayTime_MEM			  0x4001   // ������ʱ�����趨ֵ
#define UsingTimes_MEM  0x4002   // δ����ʹ�ô�������
#define CODEBIT3_MEM    0x4003   // 3λ����
#define CODEBIT2_MEM    0x4004
#define CODEBIT1_MEM    0x4005
#define FUNCLOCK_MEM    0x4006    //����������־λ; 1:��������; 0:����;
#define TEMOFFSETSetting1_MEM 0x4008 //����ţ�1:��ʾ���ţ�0:��ʾ����
#define TEMOFFSETSetting2_MEM 0x4009 //0λС����
#define UART485ADDRESS_MEM    0x400A //485ͨ�ŵ�ַ
#define ALARMENABLE  0x4010 //���Ƿ���Ҫ������1:��ʾ��Ҫ��0:��ʾ������

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
