#include "stm8s.h"
#include "Periph_Init.h"

void Input_test(void);
/*LEDDISP Show*/
//#define LD_number_one {GPIO_WriteHigh(Run_LED_PIN, Run_LED_PIN);}
//#define LD_number_one {GPIO_WriteHigh(Run_LED_PIN, Run_LED_PIN);}

/*void leddisplay_show(unsigned char showtype, void* showcontent){
	switch(showtype){
		case number:
		
			break;
		case letter:
			break;
		case sign:
			break;
		default:
			break;
}

leddisplay_scan(unsigned char showtype, void* showcontent){  //less then 20ms every running
	if(switchDigital == 1){
		leddisplay_show();//first
		switchDigital = 0;
	}
	else{
		leddisplay_show();//second
		switchDigital = 1;
	}
	
}
*/

void IO_Init(void)
{
	//define LED pins
	GPIO_Init(Run_LED_PORT,(Run_LED_PIN|Electricalfail_LED_PIN|Tem_LED_PIN|Lowpressure_LED_PIN|Highpressure_LED_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );
	//define key input pins
	GPIO_Init(StartStop_KEY_PORT,(StartStop_KEY_PIN|Set_KEY_PIN),GPIO_MODE_IN_FL_IT);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
	//define error input pins
	GPIO_Init(Error_Input_PORT,(E_Error_PIN|LP_Error_PIN|HP_Error_PIN),GPIO_MODE_IN_FL_NO_IT);
	//define relay output pins
	GPIO_Init(RelayControl_PORT,RelayControl_PIN,GPIO_MODE_OUT_PP_LOW_SLOW );
	//define LED Disp pins
	GPIO_Init(LED_Disp_Dig1_PORT,(LED_Disp_Dig1_PIN|LED_Disp_b_PIN|LED_Disp_c_PIN|LED_Disp_e_PIN|LED_Disp_d_PIN|LED_Disp_g_PIN|LED_Disp_dp_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );
	GPIO_Init(LED_Disp_Dig2_PORT,(LED_Disp_Dig2_PIN|LED_Disp_f_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );
	GPIO_Init(LED_Disp_a_PORT,LED_Disp_a_PIN,GPIO_MODE_OUT_PP_HIGH_FAST );
	//define tem input pins
	//GPIO_Init(NTC_Input_PORT,NTC_Input_PIN,GPIO_MODE_IN_FL_IT);//???????
	//define remote control pins
	GPIO_Init(RemoteControl_PORT,(RemoteControl_Start_PIN|RemoteControl_Stop_PIN),GPIO_MODE_IN_FL_NO_IT );
	
	
}

void ADC_Init(void){
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC , ENABLE);
	GPIO_Init(NTC_Input_PORT, NTC_Input_PIN , GPIO_MODE_IN_FL_NO_IT);
  ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_0, ADC1_PRESSEL_FCPU_D10,  ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL0, DISABLE);
  ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
	ADC1_StartConversion();
}

void CLK_Init(void){
	CLK_HSICmd(ENABLE);
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  while(!CLK_GetFlagStatus(CLK_FLAG_HSIRDY));
}

void Timer_Init(void){
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3|CLK_PERIPHERAL_TIMER4, ENABLE);
  /* TIM4 configuration:
   - TIM4CLK is set to 16 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
   clock used is 16 MHz / 128 = 125 000 Hz
  - With 125 000 Hz we can generate time base:
      max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
      min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
  - In this example we need to generate a time base equal to 1 ms
   so TIM4_PERIOD = (0.001 * 125000 - 1) = 124 */
  /* Time base configuration */
  TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
  /* Clear TIM4 update flag */
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  /* Enable TIM4 */
  TIM4_Cmd(ENABLE);
	
  /* TIM3 configuration:
   - TIM3CLK is set to 16 MHz, the TIM3 Prescaler is equal to 128 so the TIM1 counter
   clock used is 16 MHz / 128 = 125 000 Hz
  - With 125 000 Hz we can generate time base:
      max time base is 2.048 ms if TIM3_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
      min time base is 0.016 ms if TIM3_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
  - In this example we need to generate a time base equal to 1 ms
   so TIM3_PERIOD = (0.02 * 125000 - 1) = 2480 */
  /* Time base configuration */
  TIM3_TimeBaseInit(TIM3_PRESCALER_128, TIM3_PERIOD);
  /* Clear TIM3 update flag */
  TIM3_ClearFlag(TIM3_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);
}

void WDG_Init(void){
	/* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
	/* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  /* IWDG counter clock: LSI/128 */
  IWDG_SetPrescaler(IWDG_Prescaler_128);
  
  /* Set counter reload value to obtain 250ms IWDG TimeOut.
    Counter Reload Value = 250ms/IWDG counter clock period
                         = 250ms * (128K/2/128)
                         = 125
   */
  IWDG_SetReload(125);
  /* Reload IWDG counter */
  IWDG_ReloadCounter();	
}

void system_init(void){
	CLK_Init();
	IO_Init();
	ADC_Init();
	Timer_Init();
	WDG_Init();
	
	enableInterrupts();
}


/*Followed for test*/
void LED_TEST(void){
	GPIO_WriteLow(Run_LED_PORT,(Run_LED_PIN|Electricalfail_LED_PIN|Tem_LED_PIN|Lowpressure_LED_PIN|Highpressure_LED_PIN));
}

void LEDDisplay_TEST(void){
	GPIO_WriteLow(LED_Disp_Dig1_PORT,(LED_Disp_b_PIN|LED_Disp_c_PIN|LED_Disp_e_PIN|LED_Disp_d_PIN|LED_Disp_g_PIN|LED_Disp_dp_PIN));
	GPIO_WriteLow(LED_Disp_Dig2_PORT,(LED_Disp_f_PIN));
	GPIO_WriteLow(LED_Disp_a_PORT,LED_Disp_a_PIN);
	GPIO_WriteLow(LED_Disp_Dig2_PORT,LED_Disp_Dig2_PIN);
	GPIO_WriteLow(LED_Disp_Dig1_PORT,LED_Disp_Dig1_PIN);
}

void Relay_TEST(void){
	if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN))
			GPIO_WriteHigh(RelayControl_PORT,RelayControl_PIN);
		else
			GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);
}

void Input_test(void){
		if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN))
			GPIO_WriteLow(Run_LED_PORT,Run_LED_PIN);
		else
			GPIO_WriteHigh(Run_LED_PORT,Run_LED_PIN);
			
		if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN))
			GPIO_WriteLow(Electricalfail_LED_PORT,Electricalfail_LED_PIN);
		else
			GPIO_WriteHigh(Electricalfail_LED_PORT,Electricalfail_LED_PIN);
			
		if((!GPIO_ReadInputPin(Error_Input_PORT,E_Error_PIN))||(!GPIO_ReadInputPin(Error_Input_PORT,LP_Error_PIN))||(!GPIO_ReadInputPin(Error_Input_PORT,HP_Error_PIN))||(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Start_PIN))||(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Stop_PIN)))
			GPIO_WriteLow(Lowpressure_LED_PORT,Lowpressure_LED_PIN);
		else
			GPIO_WriteHigh(Lowpressure_LED_PORT,Lowpressure_LED_PIN);
}
