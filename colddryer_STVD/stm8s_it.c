/**
  ******************************************************************************
  * @file    stm8s_it.c
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all peripherals interrupt service 
  *          routine.
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm8s_it.h"
#include "Periph_Init.h"
#include "LED_Disp.h"
#include "Parameter.h"


/** @addtogroup Template_Project
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/

#define E_Error_DelayTime 3000
#define LP_Error_DelayTime 3000
#define HP_Error_DelayTime 3000
#define RemoteControl_Start_DelayTime 3000
#define RemoteControl_Stop_DelayTime 3000
#define StartStop_KEY_DelayTime 100
#define Set_KEY_DelayTime 3000
#define Tem_Alarm_DelayTime 900000
#define Tem_Update_DelayTime 500

#define NTC_ADC_COUNT_UPLIMIT 8
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
const uint16_t TEMP_TABLE[] =//NTC B:3980 R:10K
{
324,
326,
328,
330,
332,
334,
336,
338,
340,
342,
344,
346,
348,
350,
352,
354,
356,
358,
361,
363,
365,
367,
369,
371,
373,
376,
378,
380,
382,
384,
387,
389,
391,
393,
396,
398,
400,
402,
405,
407,
409,
412,
414,
417,
419,
421,
424,
426,
428,
431,
433,
436,
438,
441,
443,
446,
448,
451,
453,
456,
458,
461,
463,
466,
469,
471,
474,
476,
479,
482,
484,
487,
490,
492,
495,
498,
500,
503,
506,
509,
511,
514,
517,
520,
522,
525,
528,
531,
534,
537,
540,
542,
545,
548,
551,
554,
557,
560,
563,
566,
569,
572,
575,
578,
581,
584,
587,
590,
593,
596,
599,
602,
606,
609,
612,
615,
618,
621,
624,
628,
631,
634,
637,
641,
644,
647,
650,
654,
657,
660,
664,
667,
670,
674,
677,
680,
684,
687,
691,
694,
698,
701,
704,
708,
711,
715,
718,
722,
726,
729,
733,
736,
740,
743,
747,
751,
754,
758,
762,
765,
769,
773,
776,
780,
784,
787,
791,
795,
799,
803,
806,
810,
814,
818,
822,
825,
829,
833,
837,
841,
845,
849,
853,
857,
861,
865,
869,
873,
877,
881,
885,
889,
893,
897,
901,
905,
909,
913,
917,
921,
925,
930,
934,
938,
942,
946,
951,
955,
959,
963,
967,
972,
976,
980,
985,
989,
993,
998,
1002,
1006,
1011,
1015,
1019,
1024,
1028,
1033,
1037,
1041,
1046,
1050,
1055,
1059,
1064,
1068,
1073,
1077,
1082,
1086,
1091,
1095,
1100,
1105,
1109,
1114,
1118,
1123,
1128,
1132,
1137,
1142,
1146,
1151,
1156,
1160,
1165,
1170,
1174,
1179,
1184,
1189,
1194,
1198,
1203,
1208,
1213,
1218,
1222,
1227,
1232,
1237,
1242,
1247,
1251,
1256,
1261,
1266,
1271,
1276,
1281,
1286,
1291,
1296,
1301,
1306,
1311,
1316,
1321,
1326,
1331,
1336,
1341,
1346,
1351,
1356,
1361,
1366,
1371,
1376,
1382,
1387,
1392,
1397,
1402,
1407,
1412,
1418,
1423,
1428,
1433,
1438,
1443,
1449,
1454,
1459,
1464,
1470,
1475,
1480,
1485,
1491,
1496,
1501,
1506,
1512,
1517,
1522,
1528,
1533,
1538,
1544,
1549,
1554,
1560,
1565,
1570,
1576,
1581,
1587,
1592,
1597,
1603,
1608,
1614,
1619,
1624,
1630,
1635,
1641,
1646,
1652,
1657,
1662,
1668,
1673,
1679,
1684,
1690,
1695,
1701,
1706,
1712,
1717,
1723,
1728,
1734,
1739,
1745,
1751,
1756,
1762,
1767,
1773,
1778,
1784,
1789,
1795,
1801,
1806,
1812,
1817,
1823,
1828,
1834,
1840,
1845,
1851,
1856,
1862,
1868,
1873,
1879,
1885,
1890,
1896,
1901,
1907,
1913,
1918,
1924,
1930,
1935,
1941,
1946,
1952,
1958,
1963,
1969,
1975,
1980,
1986,
1992,
1997,
2003,
2009,
2014,
2020,
2026,
2031,
2037,
2043,
2048,
2054,
2060,
2065,
2071,
2077,
2082,
2088,
2094,
2099,
2105,
2111,
2117,
2122,
2128,
2134,
2139,
2145,
2151,
2156,
2162,
2168,
2173,
2179,
2185,
2190,
2196,
2202,
2207,
2213,
2219,
2224,
2230,
2236,
2241,
2247,
2253,
2258,
2264,
2270,
2275,
2281,
2287,
2292,
2298,
2304,
2309,
2315,
2321,
2326,
2332,
2338,
2343,
2349,
2354,
2360,
2366,
2371,
2377,
2383,
2388,
2394,
2399,
2405,
2411,
2416,
2422,
2427,
2433,
2439,
2444,
2450,
2455,
2461,
2467,
2472,
2478,
2483,
2489,
2494,
2500,
2506,
2511,
2517,
2522,
2528,
2533,
2539,
2544,
2550,
2555,
2561,
2566,
2572,
2577,
2583,
2588,
2594,
2599,
2605,
2610,
2616,
2621,
2627,
2632,
2638,
2643,
2648,
2654,
2659,
2665,
2670,
2676,
2681,
2686,
2692,
2697,
2703,
2708,
2713,
2719,
2724,
2729,
2735,
2740,
2745,
2751,
2756,
2761,
2767,
2772,
2777,
2783,
2788,
2793,
2799,
2804,
2809,
2814,
2820,
2825,
2830,
2835,
2841,
2846,
2851,
2856,
2861,
2867,
2872,
2877,
2882,
2887,
2893,
2898,
2903,
2908,
2913,
2918,
2923,
2928,
2934,
2939,
2944,
2949,
2954,
2959,
2964,
2969,
2974,
2979,
2984,
2989,
2994,
2999,
3004,
3009,
3014,
3019,
3024,
3029,
3034,
3039,
3044,
3049,
3054,
3059,
3064,
3069,
3074,
3079,
3083,
3088,
3093,
3098,
3103,
3108,
3113,
3117,
3122,
3127,
3132,
3137,
3141,
3146,
3151,
3156,
3161,
3165,
3170,
3175,
3179,
3184,
3189,
3194,
3198,
3203,
3208,
3212,
3217,
3222,
3226,
3231,
3236,
3240,
3245,
3249,
3254,
3259,
3263,
3268,
3272,
3277,
3281,
3286,
3290,
3295,
3299,
3304,
3308,
3313,
3317,
3322,
3326,
3331,
3335,
3340,
3344,
3348,
3353,
3357,
3362,
3366,
3370,
3375,
3379,
3383,
3388,
3392,
3396,
3401,
3405,
3409,
3413,
3418,
3422,
3426,
3430,
3435,
3439,
3443,
3447,
3452,
3456,
3460,
3464,
3468,
3472,
3477,
3481,
3485,
3489,
3493,
3497,
3501,
3505,
3509,
3513,
3517,
3522,
3526,
3530,
3534,
3538,
3542,
3546,
3550,
3554,
3558,
3561,
3565,
3569,
3573,
3577,
3581,
3585,
3589,
3593,
3597,
3601,
3604,
3608,
3612,
3616,
3620,
3624,
3627,
3631,
3635,
3639,
3642,
3646,
3650,
3654,
3657,
3661,
3665,
3669,
3672,
3676,
3680,
3683,
3687,
3691,
3694,
3698,
3702,
3705,
3709,
3712,
3716,
3720,
3723,
3727,
3730,
3734,
3737,
3741,
3744,
3748,
3751,
3755,
3758,
3762,
3765,
3769,
3772,
3776,
3779,
3783,
3786,
3789,
3793,
3796,
3800,
3803,
3806,
3810,
3813,
3816,
3820,
3823,
3826,
3830,
3833,
3836,
3840,
3843,
3846,
3849,
3853,
3856,
3859,
3862,
3865,
3869,
3872,
3875,
3878,
3881,
3885,
3888,
3891,
3894,
3897,
3900,
3903,
3906,
3910,
3913,
3916,
3919,
3922,
3925,
3928,
3931,
3934,
3937,
3940,
3943,
3946,
3949,
3952,
3955,
3958,
3961,
3964,
3967,
3970,
3973,
3976,
3979,
3981,
3984,
3987,
3990,
3993,
3996,
3999,
4002,
4004,
4007,
4010,
4013,
4016,
4019,
4021,
4024,
4027,
4030,
4032,
4035,
4038,
4041,
4043,
4046,
4049,
4052,
4054,
4057,
4060,
4062,
4065,
4068,
4070,
4073,
4076,
4078,
4081,
4084,
4086,
4089,
4091,
4094,
4097,
4099,
4102,
4104,
4107,
4109,
4112,
4114,
4117,
4119,
4122,
4124,
4127,
4129,
4132,
4134,
4137,
4139,
4142,
4144,
4147,
4149,
4152,
4154,
4156,
4159,
4161,
4164,
4166,
4168,
4171,
4173,
4175,
4178,
4180,
4183,
4185,
4187,
4189,
4192,
4194,
4196,
4199,
4201,
4203,
4206,
4208,
4210,
4212,
4215,
4217,
4219,
4221,
4223,
4226,
4228,
4230,
4232,
4234,
4237,
4239,
4241,
4243,
4245,
4247,
4250,
4252,
4254,
4256,
4258,
4260,
4262,
4264,
4267,
4269,
4271,
4273,
4275,
4277,
4279,
4281,
4283,
4285,
4287,
4289,
4291,
4293,
4295,
4297,
4299,
4301,
4303,
4305,
4307,
4309,
4311,
4313,
4315,
4317,
4319,
4321,
4323,
4325,
4327,
4328,
4330,
4332,
4334,
4336,
4338,
4340,
4342,
4344,
4345,
4347,
4349,
4351,
4353,
4355,
4356,
4358,
4360,
4362,
4364,
4366,
4367,
4369,
4371,
4373,
4374,
4376,
4378,
4380,
4381,
4383,
4385,
4387,
4388,
4390,
4392,
4394,
4395,
4397,
4399,
4400,
4402,
4404,
4405,
4407,
4409,
4410,
4412,
4414,
4415,
4417,
4419,
4420,
4422,
4424,
4425,
4427,
4428,
4430,
4432,
4433,
4435,
4436,
4438,
4440,
4441,
4443,
4444,
4446,
4447,
4449,
4450,
4452,
4454,
4455,
4457,
4458,
4460,
4461,
4463,
4464,
4466,
4467,
4469,
4470,
4472,
4473,
4475,
4476,
4477,
4479,
4480,
4482,
4483,
4485,
4486,
4488,
4489,
4490,
4492,
4493,
4495,
4496,
4498,
4499,
4500,
4502,
4503,
4504,
4506,
4507,
4509,
4510,
4511,
4513,
4514,
4515,
4517,
4518,
4519,
4521,
4522,
4523,
4525,
4526,
4527,
4529,
4530,
4531,
4532,
4534,
4535,
4536,
4538,
4539,
4540,
4541,
4543,
4544,
4545,
4546,
4548,
4549,
4550,
4551,
4553,
4554,
4555,
4556,
4558,
4559,
4560,
4561,
4562,
4564,
4565,
4566,
4567,
4568,
4570,
4571,
4572,
4573,
4574,
4575,
4577,
4578,
4579,
4580,
4581,
4582,
4583,
4585,
4586,
4587,
4588,
4589,
4590,
4591,
4592,
4594,
4595,
4596,
4597,
4598,
4599,
4600,
4601,
4602,
4603,
4604,
4606,
4607,
4608,
4609,
4610,
4611,
4612,
4613,
4614,
4615,
4616,
4617,
4618,
4619,
4620,
4621,
4622,
4623,
4624,
4625,
4626,
4627,
4628,
4629,
4630,
4631,
4632,
4633,
4634,
4635,
4636,
4637,
4638,
4639,
4640,
4641,
4642,
4643,
4644,
4645,
4646,
4647,
4648,
4649,
4650,
4651,
4652,
4652,
4653,
4654,
4655,
4656,
4657,
4658,
4659,
4660,
4661,
4662,
4663,
4663,
4664,
4665,
4666,
4667,
4668,
4669,
4670,
4671,
4671,
4672,
4673,
4674,
4675,
4676,
4677,
4677,
4678,
4679,
4680,
4681,
4682,
4682,
4683,
4684,
4685,
4686,
4687,
4687,
4688,
4689,
4690,
4691,
4692,
4692,
4693,
4694,
4695,
4696,
4696,
4697,
4698,
4699,
4700,
4700,
4701,
4702,
4703,
4703,
4704,
4705,
4706,
4707,
4707,
4708,
4709,
4710,
4710,
4711,
4712,
4713,
4713,
4714,
4715,
4716,
4716,
4717,
4718,
4719,
4719,
4720,
4721,
4721,
4722,
4723,
4724,
4724,
4725,
4726,
4726,
4727,
4728,
4729,
4729,
4730,
4731,
4731,
4732,
4733,
4733,
4734,
4735,
4735,
4736,
4737,
4738,
4738,
4739,
4740,
4740,
4741,
4742,
4742,
4743,
4744,
4744,
4745,
4745,
4746,
4747,
4747,
4748,
4749,
4749,
4750,
4751,
4751,
4752,
4753,
4753,
4754,
4754,
4755,
4756,
4756,
4757,
4758,
4758,
4759,
4759,
4760,
4761,
4761,
4762,
4762,
4763,
4764,
4764,
4765,
4765,
4766,
4767,
4767,
4768,
4768,
4769,
4770,
4770,
4771,
4771,
4772,
4772,
4773,
4774,
4774,
4775,
4775,
4776,
4776,
4777,
4777,
4778,
4779,
4779,
4780,
4780,
4781,
4781,
4782,
4782,
4783,
4784,
4784,
4785,
4785,
4786,
4786,
4787,
4787,
4788,
4788,
4789,
4789,
4790,
4790,
4791,
4791,
4792,
4792,
4793,
4794,
4794,
4795,
4795,
4796,
4796,
4797,
4797,
4798,
4798,
4799,
4799,
4800,
4800,
4801,
4801,
4802,
4802,
4802,
4803,
4803,
4804,
4804
};
bool Parameter_Set_Flag = FALSE;
uint16_t NTC_Conversion_Value = 0,SUM = 0,NTC_ADC_Count = 0;
int16_t NTC_TEM_Value = 0;
uint16_t E_Error_Delay_Count = 0,\
				LP_Error_Delay_Count = 0,\
				HP_Error_Delay_Count = 0,\
				RemoteControl_Start_Delay_Count = 0,\
				RemoteControl_Stop_Delay_Count = 0,\
				StartStop_KEY_Delay_Count = 0,\
				Set_KEY_Delay_Count = 0,\
				Tem_Update_Delay_Count = 0,\
				Run_LED_Flash_Delay_Count = 0,
				Run_LED_FlashFREQ_Delay_Count;
uint32_t Tem_Alarm_Delay_Count = 0;
bool E_Error_Exist_Flag = FALSE,LP_Error_Exist_Flag = FALSE,HP_Error_Exist_Flag = FALSE,TEM_Error_Exist_Flag = FALSE;
bool Total_Error_Flag = FALSE;
bool Dig_Switch_Flag = FALSE;
bool Tem_Update_Flag = FALSE;
bool Relay_Output_Flag = FALSE;
bool Run_LED_Flash_Flag = FALSE;

bool StartStop_KeyLock_Flag = FALSE;

uint8_t step = 0;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef _COSMIC_
/**
  * @brief Dummy Interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*_COSMIC_*/

/**
  * @brief TRAP Interrupt routine
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Top Level Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TLI_IRQHandler, 0)

{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Clock Controller Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CLK_IRQHandler, 2)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTA Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	if(Parameter_Set_Flag){
		switch(dt){
			case Tem_Show:
				break;
			case Tem_AlarmHighLimit_Set:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Tem_AlarmLowLimit_Set;
					else if(step == 1){
						step = 0;
						temalarmhighlimitsetting_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TemAlarmHighLimitValue++;
						if(Current_TemAlarmHighLimitValue > TemAlarm_UpLimit)
							Current_TemAlarmHighLimitValue = TemAlarm_DownLimit;
					}
				}
				break;
			case Tem_AlarmLowLimit_Set:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Tem_Alarm_Enable;
					else if(step == 1){
						step = 0;
						temalarmlowlimitsetting_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TemAlarmLowLimitValue++;
						if(Current_TemAlarmLowLimitValue > TemAlarm_UpLimit)
							Current_TemAlarmLowLimitValue = TemAlarm_DownLimit;
					}
				}
				break;
			case Tem_Alarm_Enable:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Tem_Offset;
					else if(step == 1){
						step = 0;
						temalarmenable_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TEMAlarmEnable++;
						if(Current_TEMAlarmEnable > 1)
							Current_TEMAlarmEnable = 0;
					}
				}
				break;
		case Tem_Show_Enable:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Start_DelayTime_Select;
					else if(step == 1){
						step = 0;
						temshowenable_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TEMShowEnble++;
						if(Current_TEMShowEnble > 1)
							Current_TEMShowEnble = 0;
					}
				}
				break;
		case Tem_Offset:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Tem_Show_Enable;
					else if(step == 1){
						step = 0;
						temoffset_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TEMOffsetSetting++;
						if(Current_TEMOffsetSetting > TemOffset_UpLimit)
							Current_TEMOffsetSetting = TemOffset_DownLimit;
					}
				}
				break;
			case Start_DelayTime_Select:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0){
						dt = Tem_Show;
						Parameter_Set_Flag = FALSE;
					}
					else if(step == 1){
						step = 0;
						startdelaytimeselect_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_StartDelayTimeIndex++;
						if(Current_StartDelayTimeIndex > StartDelayTimeIndex_UpLimit)
							Current_StartDelayTimeIndex = StartDelayTimeIndex_DownLimit;
					}
				}
				break;
			case Other:
				break;
			default:
				break;
		}
		//switch(Tem_Alarmlimit_set_step){
		//	case idle:
		//	break;
		//	default:
		//		break;
	}
}

/**
  * @brief External Interrupt PORTB Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#if defined (STM8S903) || defined (STM8AF622x) 
/**
  * @brief External Interrupt PORTF Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /* (STM8S903) || (STM8AF622x) */

#if defined (STM8S208) || defined (STM8AF52Ax)
/**
  * @brief CAN RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }

/**
  * @brief CAN TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /* (STM8S208) || (STM8AF52Ax) */

/**
  * @brief SPI Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 10)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#if defined (STM8S903) || defined (STM8AF622x)
/**
  * @brief Timer5 Update/Overflow/Break/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
 
/**
  * @brief Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }

#else /* (STM8S208) || (STM8S207) || (STM8S105) || (STM8S103) || (STM8AF62Ax) || (STM8AF52Ax) || (STM8AF626x) */
/**
  * @brief Timer2 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }

/**
  * @brief Timer2 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /* (STM8S903) || (STM8AF622x) */

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
/**
  * @brief Timer3 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	leddisplay_scan(Dig_Switch_Flag,&step);
	Dig_Switch_Flag = !Dig_Switch_Flag;

	/* Cleat Interrupt Pending bit */
  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 }

/**
  * @brief Timer3 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /* (STM8S208) || (STM8S207) || (STM8S105) || (STM8AF62Ax) || (STM8AF52Ax) || (STM8AF626x) */

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
/**
  * @brief UART1 TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }

/**
  * @brief UART1 RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /* (STM8S208) || (STM8S207) || (STM8S103) || (STM8S903) || (STM8AF62Ax) || (STM8AF52Ax) */

#if defined(STM8AF622x)
/**
  * @brief UART4 TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART4_TX_IRQHandler, 17)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }

/**
  * @brief UART4 RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART4_RX_IRQHandler, 18)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /* (STM8AF622x) */

/**
  * @brief I2C Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
/**
  * @brief UART2 TX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }

/**
  * @brief UART2 RX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /* (STM8S105) || (STM8AF626x) */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief UART3 TX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }

/**
  * @brief UART3 RX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /* (STM8S208) || (STM8S207) || (STM8AF52Ax) || (STM8AF62Ax) */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief ADC2 interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#else /* STM8S105 or STM8S103 or STM8S903 or STM8AF626x or STM8AF622x */
/**
  * @brief ADC1 interrupt routine.
  * @par Parameters:
  * None
  * @retval 
  * None
  */
 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
		/* Get converted value */
    SUM += ADC1_GetConversionValue();
		if(++NTC_ADC_Count == NTC_ADC_COUNT_UPLIMIT){
			NTC_ADC_Count = 0;
			NTC_Conversion_Value = (SUM/NTC_ADC_COUNT_UPLIMIT);
			SUM = 0;
			ADC1_ITConfig(ADC1_IT_EOCIE, DISABLE);
		}
		ADC1_ClearITPendingBit(ADC1_IT_EOC);
 }
#endif /* (STM8S208) || (STM8S207) || (STM8AF52Ax) || (STM8AF62Ax) */

#if defined (STM8S903) || defined (STM8AF622x)
/**
  * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#else /* STM8S208 or STM8S207 or STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
/**
  * @brief Timer4 Update/Overflow Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	/*Error Alarm*/
	if(!GPIO_ReadInputPin(Error_Input_PORT,E_Error_PIN)){
		if(++E_Error_Delay_Count == E_Error_DelayTime && E_Error_Exist_Flag == FALSE){
			E_Error_Delay_Count = 0;
			E_Error_Exist_Flag = TRUE;
			GPIO_WriteLow(Electricalfail_LED_PORT,Electricalfail_LED_PIN);
		}
	}
	else{
		E_Error_Delay_Count = 0;
	}
	if(!GPIO_ReadInputPin(Error_Input_PORT,LP_Error_PIN)){
		if(++LP_Error_Delay_Count == LP_Error_DelayTime && LP_Error_Exist_Flag == FALSE){
			LP_Error_Delay_Count = 0;
			LP_Error_Exist_Flag = TRUE;
			GPIO_WriteLow(Lowpressure_LED_PORT,Lowpressure_LED_PIN);
		}
	}
	else{
		LP_Error_Delay_Count = 0;
	}
	if(!GPIO_ReadInputPin(Error_Input_PORT,HP_Error_PIN)){
		if(++HP_Error_Delay_Count == HP_Error_DelayTime && HP_Error_Exist_Flag == FALSE){
			HP_Error_Delay_Count = 0;
			HP_Error_Exist_Flag = TRUE;
			GPIO_WriteLow(Highpressure_LED_PORT,Highpressure_LED_PIN);
		}
	}
	else{
		HP_Error_Delay_Count = 0;
	}
	if( (NTC_TEM_Value > Current_TemAlarmHighLimitValue || NTC_TEM_Value < Current_TemAlarmLowLimitValue) && TEM_Error_Exist_Flag == FALSE && !Parameter_Set_Flag && Relay_Output_Flag && Current_TEMAlarmEnable == 1){
		if(++Tem_Alarm_Delay_Count == Tem_Alarm_DelayTime ){
			Tem_Alarm_Delay_Count = 0;
			TEM_Error_Exist_Flag = TRUE;
			GPIO_WriteLow(Tem_LED_PORT,Tem_LED_PIN);
		}
	}
	else
		Tem_Alarm_Delay_Count = 0;
		
	//	(TEM_Error_Exist_Flag)||
	/*Total Error*/	
	Total_Error_Flag = (HP_Error_Exist_Flag)||(LP_Error_Exist_Flag)||(E_Error_Exist_Flag);
	
	if(Total_Error_Flag && Relay_Output_Flag){
		GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
		GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);
		Relay_Output_Flag = 0;
		Run_LED_Flash_Flag = 0;
	}
	//
	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Start_PIN) && !Total_Error_Flag){
		if(++RemoteControl_Start_Delay_Count == RemoteControl_Start_DelayTime ){
			RemoteControl_Start_Delay_Count = 0;
			GPIO_WriteLow(Run_LED_PORT, Run_LED_PIN);
			GPIO_WriteHigh(RelayControl_PORT,RelayControl_PIN);
		}
	}
	else{
		RemoteControl_Start_Delay_Count = 0;
	}
	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Stop_PIN)){
		if(++RemoteControl_Stop_Delay_Count == RemoteControl_Stop_DelayTime){
			RemoteControl_Stop_Delay_Count = 0;
			GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
			GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);
		}
	}
	else{
		RemoteControl_Stop_Delay_Count = 0;
	}
	//
	if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN) && !Parameter_Set_Flag && !StartStop_KeyLock_Flag){
		
		if(++StartStop_KEY_Delay_Count == StartStop_KEY_DelayTime){
			StartStop_KEY_Delay_Count = 0;
			StartStop_KeyLock_Flag = TRUE;
			
			if(HP_Error_Exist_Flag || LP_Error_Exist_Flag || E_Error_Exist_Flag || TEM_Error_Exist_Flag){
				HP_Error_Exist_Flag = 0;
				LP_Error_Exist_Flag = 0;
				E_Error_Exist_Flag = 0;
				TEM_Error_Exist_Flag = 0;
				GPIO_WriteHigh(Highpressure_LED_PORT,Highpressure_LED_PIN);
				GPIO_WriteHigh(Electricalfail_LED_PORT,Electricalfail_LED_PIN);
				GPIO_WriteHigh(Lowpressure_LED_PORT,Lowpressure_LED_PIN);
				GPIO_WriteHigh(Tem_LED_PORT,Tem_LED_PIN);
			}
			
			if(!Relay_Output_Flag && !Total_Error_Flag){
				Run_LED_Flash_Flag = TRUE;
				GPIO_WriteLow(Run_LED_PORT, Run_LED_PIN);
				//GPIO_WriteHigh(RelayControl_PORT,RelayControl_PIN);
				Relay_Output_Flag = !Relay_Output_Flag;
			}
			else if(Relay_Output_Flag){
				Run_LED_Flash_Flag = FALSE;
				GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
				GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);	
				Relay_Output_Flag = !Relay_Output_Flag;
			}
		}
	}
	else if(GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
			StartStop_KEY_Delay_Count = 0;
			StartStop_KeyLock_Flag = FALSE;
	}	
	
	if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN) && !Parameter_Set_Flag){
		if(++Set_KEY_Delay_Count == Set_KEY_DelayTime){
			Set_KEY_Delay_Count = 0;
			dt = Tem_AlarmHighLimit_Set;//switch to Tem_AlarmLimit_Set mode
			Parameter_Set_Flag = TRUE;//
		}
	}
	else{
			Set_KEY_Delay_Count = 0;
	}		
	//
	if(++Tem_Update_Delay_Count == Tem_Update_DelayTime){
		Tem_Update_Delay_Count = 0;
		Tem_Update_Flag = TRUE;
	}
	
	//RUN LED FLASH
	if(Run_LED_Flash_Flag){
		if(++Run_LED_Flash_Delay_Count == StartDelayTimeList[Current_StartDelayTimeIndex]*1000)
		{
			Run_LED_Flash_Flag = FALSE;
			GPIO_WriteLow(Run_LED_PORT, Run_LED_PIN);
			GPIO_WriteHigh(RelayControl_PORT,RelayControl_PIN);// ¼ÌµçÆ÷Êä³ö
		}
		else{
			if(++Run_LED_FlashFREQ_Delay_Count == 500){
				Run_LED_FlashFREQ_Delay_Count = 0;
				GPIO_WriteReverse(Run_LED_PORT, Run_LED_PIN);
			}
		}
	}
	else{
		Run_LED_Flash_Delay_Count = 0;
		Run_LED_FlashFREQ_Delay_Count = 0;
	}
	/* Cleat Interrupt Pending bit */
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 }
#endif /* (STM8S903) || (STM8AF622x)*/

/**
  * @brief Eeprom EEC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @}
  */


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/