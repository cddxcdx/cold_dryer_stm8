#ifndef _PARAMETER_H_
#define _PARAMETER_H_

typedef enum{
	Tem_Alarm_Limit = 1,
	Start_DelayTime_Select,
	Exit
}parametersettingstate_e;

//�¶�У������
#define TEM_OFFSET 2       //2�൱��2����׼��һ�μӼ����� ���ֵ

//�ڲ�EERPOM��ַ�������
#define HUMSetting_MEM  0x4000   // ʪ���趨ֵ
#define TEMPSetting_MEM 0x4001   // �¶��趨ֵ
#define UsingTimes_MEM  0x4002   // δ����ʹ�ô�������
#define CODEBIT3_MEM    0x4003   // 3λ����
#define CODEBIT2_MEM    0x4004
#define CODEBIT1_MEM    0x4005
#define FUNCLOCK_MEM    0x4006    //����������־λ;  1:��������; 0:����;
#define HUMOFFSETSetting1_MEM 0x4008 //����ţ�1:��ʾ���ţ�0:��ʾ����
#define HUMOFFSETSetting2_MEM 0x4009 //У������10��,2�൱��0.2
#define UART485ADDRESS_MEM    0x400A //485ͨ�ŵ�ַ

#define ALARMENABLE  0x4010 //���Ƿ���Ҫ������1:��ʾ��Ҫ��0:��ʾ������
#define ALARMTIME    0X4011 //�汨��ʱ�䣬��λ�Ƿ���
#define SS1          0X4012 //��ʱ״̬S1����λ�Ƿ���
#define SS2          0X4013 //��ʱ״̬S2����λ�Ƿ���
#define SS3          0X4014 //��ʱ״̬S3����λ��"��"


void EE_Parameters_Read(void);
void task_parameterssetting(void);
#endif
