#ifndef _IO_H_
#define _IO_H_

/*LEDDisplay*/
#define LED_Disp_Dig1_PORT GPIOC
#define LED_Disp_Dig1_PIN GPIO_PIN_1
#define LED_Disp_b_PIN GPIO_PIN_2
#define LED_Disp_c_PIN GPIO_PIN_3
#define LED_Disp_e_PIN GPIO_PIN_4
#define LED_Disp_d_PIN GPIO_PIN_5
#define LED_Disp_g_PIN GPIO_PIN_6
#define LED_Disp_dp_PIN GPIO_PIN_7

#define LED_Disp_Dig2_PORT GPIOD
#define LED_Disp_Dig2_PIN GPIO_PIN_2
#define LED_Disp_f_PIN GPIO_PIN_0

#define LED_Disp_a_PORT GPIOE
#define LED_Disp_a_PIN GPIO_PIN_0
/*LED*/
#define Run_LED_PORT GPIOD
#define Run_LED_PIN GPIO_PIN_3
#define Electricalfail_LED_PORT Run_LED_PORT
#define Electricalfail_LED_PIN GPIO_PIN_4
#define Lowpressure_LED_PORT Run_LED_PORT
#define Lowpressure_LED_PIN GPIO_PIN_5
#define Highpressure_LED_PORT Run_LED_PORT
#define Highpressure_LED_PIN GPIO_PIN_6
#define Tem_LED_PORT Run_LED_PORT
#define Tem_LED_PIN GPIO_PIN_7
/*KEY*/
#define StartStop_KEY_PORT GPIOA
#define StartStop_KEY_PIN GPIO_PIN_5
#define Set_KEY_PORT StartStop_KEY_PORT
#define Set_KEY_PIN GPIO_PIN_6
/*Error Input*/
#define Error_Input_PORT GPIOB
#define E_Error_PIN GPIO_PIN_3
#define LP_Error_PIN GPIO_PIN_2
#define HP_Error_PIN GPIO_PIN_1
/*remote control*/
#define RemoteControl_PORT GPIOB
#define RemoteControl_Start_PIN GPIO_PIN_5
#define RemoteControl_Stop_PIN GPIO_PIN_4
/*relay control*/
#define RelayControl_PORT GPIOA
#define RelayControl_PIN GPIO_PIN_4
/*NTC*/
#define NTC_Input_PORT GPIOB
#define NTC_Input_PIN GPIO_PIN_0

void IO_Init(void);

#endif