#ifndef _PARAMETER_H_
#define _PARAMETER_H_

//�ڲ�EERPOM��ַ�������
#define HUMSetting_MEM  0x4000   // ʪ���趨ֵ
#define TEMPSetting_MEM 0x4001   // �¶��趨ֵ
#define UsingTimes_MEM  0x4002   // δ����ʹ�ô�������
#define CODEBIT3_MEM    0x4003   // 3λ����
#define CODEBIT2_MEM    0x4004
#define CODEBIT1_MEM    0x4005
#define FUNCLOCK_MEM    0x4006    //����������־λ;  1:��������; 0:����;
#define ADCHANNELCHOICE_MEM 0x4007//AD��ͨ��ѡ��
																	//0x01:����ͨ��;
																	//0x02:�ĸ�ͨ��;
																	//0x03:����ͨ��;
#define HUMOFFSETSetting1_MEM 0x4008 //����ţ�1:��ʾ���ţ�0:��ʾ����
#define HUMOFFSETSetting2_MEM 0x4009 //У������10��,2�൱��0.2
#define UART485ADDRESS_MEM    0x400A //485ͨ�ŵ�ַ

//////////////////////////////2012��9��5������/////////////////////////////////////

#define ALARMENABLE  0x4010 //���Ƿ���Ҫ������1:��ʾ��Ҫ��0:��ʾ������
#define ALARMTIME    0X4011 //�汨��ʱ�䣬��λ�Ƿ���
#define SS1          0X4012 //��ʱ״̬S1����λ�Ƿ���
#define SS2          0X4013 //��ʱ״̬S2����λ�Ƿ���
#define SS3          0X4014 //��ʱ״̬S3����λ��"��"
////////////ʪ�ȴﵽ�趨ֵ�����������Ԥ������Ҳ�ƹ���ʪ������λ %RH////////////////
#define GG1          0X4015 //������������ֵ HUMSetting_MEM>= 20 ʱ��
#define GG2          0X4016 //������������ֵ 20>HUMSetting_MEM>= 10 ʱ��
#define GG3          0X4017 //������������ֵ 10>HUMSetting_MEM>= 5 ʱ��"
#define GG4          0X4018 //������������ֵ 5>HUMSetting_MEM>= 1 ʱ��"
#define TT1          0X4019 //��ʱ״̬S1����λ�Ƿ���,���ڽ��뵽���⴦��ʱ����ʱ����λmin'
#define TT2          0X401A //��ʱ״̬S2����λ�Ƿ��ӣ��������⴦���������������ʱ����λmin'

void Read_parameters(void);
#endif
