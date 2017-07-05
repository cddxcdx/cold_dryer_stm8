#ifndef _LED_DISP_H_
#define _LED_DISP_H_
#include "stm8s.h"
#include "Periph_Init.h"

#define LD_number_1 {\
												GPIO_WriteHigh(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteHigh(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteHigh(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_2 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteHigh(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteHigh(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_3 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteHigh(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_4 {\
												GPIO_WriteHigh(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_5 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteHigh(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_6 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteHigh(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_7 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteHigh(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteHigh(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_8 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_9 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_0 {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteHigh(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_L {\
												GPIO_WriteHigh(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteHigh(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteHigh(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteLow(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteHigh(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}
#define LD_number_H {\
												GPIO_WriteHigh(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}//H
#define LD_number_NEG {\
												GPIO_WriteHigh(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteHigh(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteHigh(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteHigh(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteHigh(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}//-
#define LD_number_S LD_number_5
#define LD_number_D LD_number_0
#define LD_number_T {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteHigh(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteHigh(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteHigh(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}//T		
#define LD_number_A {\
												GPIO_WriteLow(LED_Disp_a_PORT, LED_Disp_a_PIN);\
												GPIO_WriteLow(LED_Disp_b_PORT, LED_Disp_b_PIN);\
												GPIO_WriteLow(LED_Disp_c_PORT, LED_Disp_c_PIN);\
												GPIO_WriteHigh(LED_Disp_d_PORT, LED_Disp_d_PIN);\
												GPIO_WriteLow(LED_Disp_e_PORT, LED_Disp_e_PIN);\
												GPIO_WriteLow(LED_Disp_f_PORT, LED_Disp_f_PIN);\
												GPIO_WriteLow(LED_Disp_g_PORT, LED_Disp_g_PIN);\
												GPIO_WriteHigh(LED_Disp_dp_PORT, LED_Disp_dp_PIN);\
											}//A	

#define LD_DIG1 		GPIO_WriteLow(LED_Disp_Dig1_PORT, LED_Disp_Dig1_PIN);\
										GPIO_WriteHigh(LED_Disp_Dig2_PORT, LED_Disp_Dig2_PIN);
#define LD_DIG2 		GPIO_WriteHigh(LED_Disp_Dig1_PORT, LED_Disp_Dig1_PIN);\
										GPIO_WriteLow(LED_Disp_Dig2_PORT, LED_Disp_Dig2_PIN);
#endif
