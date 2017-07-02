#include "stm8s.h"
#include "IO.h"

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
	//define error input pins
	GPIO_Init(Error_Input_PORT,(E_Error_PIN|LP_Error_PIN|HP_Error_PIN),GPIO_MODE_IN_FL_IT);
	//define relay output pins
	GPIO_Init(RelayControl_PORT,RelayControl_PIN,GPIO_MODE_OUT_PP_HIGH_FAST );
	//define LED Disp pins
	GPIO_Init(LED_Disp_Dig1_PORT,(LED_Disp_Dig1_PIN|LED_Disp_b_PIN|LED_Disp_c_PIN|LED_Disp_e_PIN|LED_Disp_d_PIN|LED_Disp_g_PIN|LED_Disp_dp_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );
	GPIO_Init(LED_Disp_Dig2_PORT,(LED_Disp_Dig2_PIN|LED_Disp_f_PIN),GPIO_MODE_OUT_PP_HIGH_FAST );
	GPIO_Init(LED_Disp_a_PORT,LED_Disp_a_PIN,GPIO_MODE_OUT_PP_HIGH_FAST );
	//define tem input pins
	GPIO_Init(NTC_Input_PORT,NTC_Input_PIN,GPIO_MODE_IN_FL_IT);//???????
	//define remote control pins
	GPIO_Init(RemoteControl_PORT,(RemoteControl_Start_PIN|RemoteControl_Stop_PIN),GPIO_MODE_IN_FL_IT );
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
