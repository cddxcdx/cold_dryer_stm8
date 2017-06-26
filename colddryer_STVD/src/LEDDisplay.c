#include "stm8s.h"

/*LED*/
#define Run_LED_PORT GPIOD
#define Run_LED_PIN GPIO_PIN_3
#define Electricalfail_LED_PORT RUN_LED_PORT
#define Electricalfail_LED_PIN GPIO_PIN_4
#define Lowpressure_LED_PORT RUN_LED_PORT
#define Lowpressure_LED_PIN GPIO_PIN_5
#define Highpressure_LED_PORT RUN_LED_PORT
#define Highpressure_LED_PIN GPIO_PIN_6
#define Tem_LED_PORT RUN_LED_PORT
#define Tem_LED_PIN GPIO_PIN_7
/*KEY*/
#define StartStop_KEY_PORT GPIOA
#define StartStop_KEY_PIN GPIO_PIN_5
#define Set_KEY_PORT StartStop_KEY_PORT
#define Set_KEY_PIN GPIO_PIN_6
/**/



void IO_Init(void)
{
  GPIO_Init(Run_LED_PORT,(Run_LED_PIN|Electricalfail_LED_PIN|Tem_LED_PIN|Lowpressure_LED_PIN|Highpressure_LED_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );//define LED pins
	
	GPIO_Init(StartStop_KEY_PORT,(StartStop_KEY_PIN|Set_KEY_PIN),GPIO_MODE_IN_FL_IT);//define key input pins
	
	//define error input pins
	
	//define remote control pins
	
	//define LED Disp pins
	
	//define tem input pins
	
	//define relay output pins
}


