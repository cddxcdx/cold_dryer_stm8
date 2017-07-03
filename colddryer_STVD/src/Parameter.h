#ifndef _PARAMETER_H_
#define _PARAMETER_H_

//内部EERPOM地址分配情况
#define HUMSetting_MEM  0x4000   // 湿度设定值
#define TEMPSetting_MEM 0x4001   // 温度设定值
#define UsingTimes_MEM  0x4002   // 未解密使用次数限制
#define CODEBIT3_MEM    0x4003   // 3位密码
#define CODEBIT2_MEM    0x4004
#define CODEBIT1_MEM    0x4005
#define FUNCLOCK_MEM    0x4006    //功能锁定标志位;  1:功能锁定; 0:解锁;
#define ADCHANNELCHOICE_MEM 0x4007//AD多通道选择
																	//0x01:两个通道;
																	//0x02:四个通道;
																	//0x03:六个通道;
#define HUMOFFSETSetting1_MEM 0x4008 //存符号，1:表示负号；0:表示正号
#define HUMOFFSETSetting2_MEM 0x4009 //校正量的10倍,2相当于0.2
#define UART485ADDRESS_MEM    0x400A //485通信地址

//////////////////////////////2012年9月5号新增/////////////////////////////////////

#define ALARMENABLE  0x4010 //存是否需要报警，1:表示需要；0:表示不报警
#define ALARMTIME    0X4011 //存报警时间，单位是分钟
#define SS1          0X4012 //延时状态S1，单位是分钟
#define SS2          0X4013 //延时状态S2，单位是分钟
#define SS3          0X4014 //延时状态S3，单位是"秒"
////////////湿度达到设定值后继续工作，预留量，也称过除湿量，单位 %RH////////////////
#define GG1          0X4015 //适用于在设置值 HUMSetting_MEM>= 20 时候
#define GG2          0X4016 //适用于在设置值 20>HUMSetting_MEM>= 10 时候
#define GG3          0X4017 //适用于在设置值 10>HUMSetting_MEM>= 5 时候"
#define GG4          0X4018 //适用于在设置值 5>HUMSetting_MEM>= 1 时候"
#define TT1          0X4019 //延时状态S1，单位是分钟,用于进入到特殊处理时的延时，单位min'
#define TT2          0X401A //延时状态S2，单位是分钟，用于特殊处理跳到主处理的延时，单位min'

void Read_parameters(void);
#endif
