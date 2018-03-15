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
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
const uint16_t TEMP_TABLE[] =//NTC B:3980 R:10K
{
4676,
4674,
4672,
4670,
4668,
4666,
4664,
4662,
4660,
4658,
4656,
4654,
4652,
4650,
4648,
4646,
4644,
4642,
4639,
4637,
4635,
4633,
4631,
4629,
4627,
4624,
4622,
4620,
4618,
4616,
4613,
4611,
4609,
4607,
4604,
4602,
4600,
4598,
4595,
4593,
4591,
4588,
4586,
4583,
4581,
4579,
4576,
4574,
4572,
4569,
4567,
4564,
4562,
4559,
4557,
4554,
4552,
4549,
4547,
4544,
4542,
4539,
4537,
4534,
4531,
4529,
4526,
4524,
4521,
4518,
4516,
4513,
4510,
4508,
4505,
4502,
4500,
4497,
4494,
4491,
4489,
4486,
4483,
4480,
4478,
4475,
4472,
4469,
4466,
4463,
4460,
4458,
4455,
4452,
4449,
4446,
4443,
4440,
4437,
4434,
4431,
4428,
4425,
4422,
4419,
4416,
4413,
4410,
4407,
4404,
4401,
4398,
4394,
4391,
4388,
4385,
4382,
4379,
4376,
4372,
4369,
4366,
4363,
4359,
4356,
4353,
4350,
4346,
4343,
4340,
4336,
4333,
4330,
4326,
4323,
4320,
4316,
4313,
4309,
4306,
4302,
4299,
4296,
4292,
4289,
4285,
4282,
4278,
4274,
4271,
4267,
4264,
4260,
4257,
4253,
4249,
4246,
4242,
4238,
4235,
4231,
4227,
4224,
4220,
4216,
4213,
4209,
4205,
4201,
4197,
4194,
4190,
4186,
4182,
4178,
4175,
4171,
4167,
4163,
4159,
4155,
4151,
4147,
4143,
4139,
4135,
4131,
4127,
4123,
4119,
4115,
4111,
4107,
4103,
4099,
4095,
4091,
4087,
4083,
4079,
4075,
4070,
4066,
4062,
4058,
4054,
4049,
4045,
4041,
4037,
4033,
4028,
4024,
4020,
4015,
4011,
4007,
4002,
3998,
3994,
3989,
3985,
3981,
3976,
3972,
3967,
3963,
3959,
3954,
3950,
3945,
3941,
3936,
3932,
3927,
3923,
3918,
3914,
3909,
3905,
3900,
3895,
3891,
3886,
3882,
3877,
3872,
3868,
3863,
3858,
3854,
3849,
3844,
3840,
3835,
3830,
3826,
3821,
3816,
3811,
3806,
3802,
3797,
3792,
3787,
3782,
3778,
3773,
3768,
3763,
3758,
3753,
3749,
3744,
3739,
3734,
3729,
3724,
3719,
3714,
3709,
3704,
3699,
3694,
3689,
3684,
3679,
3674,
3669,
3664,
3659,
3654,
3649,
3644,
3639,
3634,
3629,
3624,
3618,
3613,
3608,
3603,
3598,
3593,
3588,
3582,
3577,
3572,
3567,
3562,
3557,
3551,
3546,
3541,
3536,
3530,
3525,
3520,
3515,
3509,
3504,
3499,
3494,
3488,
3483,
3478,
3472,
3467,
3462,
3456,
3451,
3446,
3440,
3435,
3430,
3424,
3419,
3413,
3408,
3403,
3397,
3392,
3386,
3381,
3376,
3370,
3365,
3359,
3354,
3348,
3343,
3338,
3332,
3327,
3321,
3316,
3310,
3305,
3299,
3294,
3288,
3283,
3277,
3272,
3266,
3261,
3255,
3249,
3244,
3238,
3233,
3227,
3222,
3216,
3211,
3205,
3199,
3194,
3188,
3183,
3177,
3172,
3166,
3160,
3155,
3149,
3144,
3138,
3132,
3127,
3121,
3115,
3110,
3104,
3099,
3093,
3087,
3082,
3076,
3070,
3065,
3059,
3054,
3048,
3042,
3037,
3031,
3025,
3020,
3014,
3008,
3003,
2997,
2991,
2986,
2980,
2974,
2969,
2963,
2957,
2952,
2946,
2940,
2935,
2929,
2923,
2918,
2912,
2906,
2901,
2895,
2889,
2883,
2878,
2872,
2866,
2861,
2855,
2849,
2844,
2838,
2832,
2827,
2821,
2815,
2810,
2804,
2798,
2793,
2787,
2781,
2776,
2770,
2764,
2759,
2753,
2747,
2742,
2736,
2730,
2725,
2719,
2713,
2708,
2702,
2696,
2691,
2685,
2679,
2674,
2668,
2662,
2657,
2651,
2646,
2640,
2634,
2629,
2623,
2617,
2612,
2606,
2601,
2595,
2589,
2584,
2578,
2573,
2567,
2561,
2556,
2550,
2545,
2539,
2533,
2528,
2522,
2517,
2511,
2506,
2500,
2494,
2489,
2483,
2478,
2472,
2467,
2461,
2456,
2450,
2445,
2439,
2434,
2428,
2423,
2417,
2412,
2406,
2401,
2395,
2390,
2384,
2379,
2373,
2368,
2362,
2357,
2352,
2346,
2341,
2335,
2330,
2324,
2319,
2314,
2308,
2303,
2297,
2292,
2287,
2281,
2276,
2271,
2265,
2260,
2255,
2249,
2244,
2239,
2233,
2228,
2223,
2217,
2212,
2207,
2201,
2196,
2191,
2186,
2180,
2175,
2170,
2165,
2159,
2154,
2149,
2144,
2139,
2133,
2128,
2123,
2118,
2113,
2107,
2102,
2097,
2092,
2087,
2082,
2077,
2072,
2066,
2061,
2056,
2051,
2046,
2041,
2036,
2031,
2026,
2021,
2016,
2011,
2006,
2001,
1996,
1991,
1986,
1981,
1976,
1971,
1966,
1961,
1956,
1951,
1946,
1941,
1936,
1931,
1926,
1921,
1917,
1912,
1907,
1902,
1897,
1892,
1887,
1883,
1878,
1873,
1868,
1863,
1859,
1854,
1849,
1844,
1839,
1835,
1830,
1825,
1821,
1816,
1811,
1806,
1802,
1797,
1792,
1788,
1783,
1778,
1774,
1769,
1764,
1760,
1755,
1751,
1746,
1741,
1737,
1732,
1728,
1723,
1719,
1714,
1710,
1705,
1701,
1696,
1692,
1687,
1683,
1678,
1674,
1669,
1665,
1660,
1656,
1652,
1647,
1643,
1638,
1634,
1630,
1625,
1621,
1617,
1612,
1608,
1604,
1599,
1595,
1591,
1587,
1582,
1578,
1574,
1570,
1565,
1561,
1557,
1553,
1548,
1544,
1540,
1536,
1532,
1528,
1523,
1519,
1515,
1511,
1507,
1503,
1499,
1495,
1491,
1487,
1483,
1478,
1474,
1470,
1466,
1462,
1458,
1454,
1450,
1446,
1442,
1439,
1435,
1431,
1427,
1423,
1419,
1415,
1411,
1407,
1403,
1399,
1396,
1392,
1388,
1384,
1380,
1376,
1373,
1369,
1365,
1361,
1358,
1354,
1350,
1346,
1343,
1339,
1335,
1331,
1328,
1324,
1320,
1317,
1313,
1309,
1306,
1302,
1298,
1295,
1291,
1288,
1284,
1280,
1277,
1273,
1270,
1266,
1263,
1259,
1256,
1252,
1249,
1245,
1242,
1238,
1235,
1231,
1228,
1224,
1221,
1217,
1214,
1211,
1207,
1204,
1200,
1197,
1194,
1190,
1187,
1184,
1180,
1177,
1174,
1170,
1167,
1164,
1160,
1157,
1154,
1151,
1147,
1144,
1141,
1138,
1135,
1131,
1128,
1125,
1122,
1119,
1115,
1112,
1109,
1106,
1103,
1100,
1097,
1094,
1090,
1087,
1084,
1081,
1078,
1075,
1072,
1069,
1066,
1063,
1060,
1057,
1054,
1051,
1048,
1045,
1042,
1039,
1036,
1033,
1030,
1027,
1024,
1021,
1019,
1016,
1013,
1010,
1007,
1004,
1001,
998,
996,
993,
990,
987,
984,
981,
979,
976,
973,
970,
968,
965,
962,
959,
957,
954,
951,
948,
946,
943,
940,
938,
935,
932,
930,
927,
924,
922,
919,
916,
914,
911,
909,
906,
903,
901,
898,
896,
893,
891,
888,
886,
883,
881,
878,
876,
873,
871,
868,
866,
863,
861,
858,
856,
853,
851,
848,
846,
844,
841,
839,
836,
834,
832,
829,
827,
825,
822,
820,
817,
815,
813,
811,
808,
806,
804,
801,
799,
797,
794,
792,
790,
788,
785,
783,
781,
779,
777,
774,
772,
770,
768,
766,
763,
761,
759,
757,
755,
753,
750,
748,
746,
744,
742,
740,
738,
736,
733,
731,
729,
727,
725,
723,
721,
719,
717,
715,
713,
711,
709,
707,
705,
703,
701,
699,
697,
695,
693,
691,
689,
687,
685,
683,
681,
679,
677,
675,
673,
672,
670,
668,
666,
664,
662,
660,
658,
656,
655,
653,
651,
649,
647,
645,
644,
642,
640,
638,
636,
634,
633,
631,
629,
627,
626,
624,
622,
620,
619,
617,
615,
613,
612,
610,
608,
606,
605,
603,
601,
600,
598,
596,
595,
593,
591,
590,
588,
586,
585,
583,
581,
580,
578,
576,
575,
573,
572,
570,
568,
567,
565,
564,
562,
560,
559,
557,
556,
554,
553,
551,
550,
548,
546,
545,
543,
542,
540,
539,
537,
536,
534,
533,
531,
530,
528,
527,
525,
524,
523,
521,
520,
518,
517,
515,
514,
512,
511,
510,
508,
507,
505,
504,
502,
501,
500,
498,
497,
496,
494,
493,
491,
490,
489,
487,
486,
485,
483,
482,
481,
479,
478,
477,
475,
474,
473,
471,
470,
469,
468,
466,
465,
464,
462,
461,
460,
459,
457,
456,
455,
454,
452,
451,
450,
449,
447,
446,
445,
444,
442,
441,
440,
439,
438,
436,
435,
434,
433,
432,
430,
429,
428,
427,
426,
425,
423,
422,
421,
420,
419,
418,
417,
415,
414,
413,
412,
411,
410,
409,
408,
406,
405,
404,
403,
402,
401,
400,
399,
398,
397,
396,
394,
393,
392,
391,
390,
389,
388,
387,
386,
385,
384,
383,
382,
381,
380,
379,
378,
377,
376,
375,
374,
373,
372,
371,
370,
369,
368,
367,
366,
365,
364,
363,
362,
361,
360,
359,
358,
357,
356,
355,
354,
353,
352,
351,
350,
349,
348,
348,
347,
346,
345,
344,
343,
342,
341,
340,
339,
338,
337,
337,
336,
335,
334,
333,
332,
331,
330,
329,
329,
328,
327,
326,
325,
324,
323,
323,
322,
321,
320,
319,
318,
318,
317,
316,
315,
314,
313,
313,
312,
311,
310,
309,
308,
308,
307,
306,
305,
304,
304,
303,
302,
301,
300,
300,
299,
298,
297,
297,
296,
295,
294,
293,
293,
292,
291,
290,
290,
289,
288,
287,
287,
286,
285,
284,
284,
283,
282,
281,
281,
280,
279,
279,
278,
277,
276,
276,
275,
274,
274,
273,
272,
271,
271,
270,
269,
269,
268,
267,
267,
266,
265,
265,
264,
263,
262,
262,
261,
260,
260,
259,
258,
258,
257,
256,
256,
255,
255,
254,
253,
253,
252,
251,
251,
250,
249,
249,
248,
247,
247,
246,
246,
245,
244,
244,
243,
242,
242,
241,
241,
240,
239,
239,
238,
238,
237,
236,
236,
235,
235,
234,
233,
233,
232,
232,
231,
230,
230,
229,
229,
228,
228,
227,
226,
226,
225,
225,
224,
224,
223,
223,
222,
221,
221,
220,
220,
219,
219,
218,
218,
217,
216,
216,
215,
215,
214,
214,
213,
213,
212,
212,
211,
211,
210,
210,
209,
209,
208,
208,
207,
206,
206,
205,
205,
204,
204,
203,
203,
202,
202,
201,
201,
200,
200,
199,
199,
198,
198,
198,
197,
197,
196,
196
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
				Run_LED_FlashFREQ_Delay_Count;
uint32_t Tem_Alarm_Delay_Count = 0,\
				Tem_Alarm_Reset_Count = 0,\
				Run_LED_Flash_Delay_Count = 0,\
				ParameterMode_Autoquit_Count = 0,\
				TEM_Error_Flash_Delay_Count = 0\
				;
bool E_Error_Exist_Flag = FALSE,LP_Error_Exist_Flag = FALSE,HP_Error_Exist_Flag = FALSE,TEM_Error_Exist_Flag = FALSE, TEM_Error_Flash_Flag = FALSE;
bool Total_Error_Flag = FALSE;
bool Dig_Switch_Flag = FALSE;
bool Tem_Update_Flag = FALSE;
bool Relay_Output_Flag = FALSE;
bool Run_LED_Flash_Flag = FALSE;
bool StartStop_KeyLock_Flag = FALSE;
bool ColdDryerStatus_Update_Flag = FALSE;
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
		if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)\
			||!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
				ParameterMode_Autoquit_Count = 0;
		}
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
						dt = Tem_HighAlarm_Autostop;//Start_DelayTime_Select;
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
			case Tem_HighAlarm_Autostop:
				if(!GPIO_ReadInputPin(Set_KEY_PORT,Set_KEY_PIN)){
					if(step == 0)
						dt = Start_DelayTime_Select;
					else if(step == 1){
						step = 0;
						temhighalarmautostop_update_flag = TRUE;
					}	
				}
				if(!GPIO_ReadInputPin(StartStop_KEY_PORT,StartStop_KEY_PIN)){
					if(step == 0){
						step = 1;
					}
					else if(step == 1){
						Current_TEMHighAlarmAutostop++;
						if(Current_TEMHighAlarmAutostop > 1)
							Current_TEMHighAlarmAutostop = 0;
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
	if(NTC_TEM_Value > Current_TemAlarmHighLimitValue && !TEM_Error_Exist_Flag && !Parameter_Set_Flag && Relay_Output_Flag && Current_TEMAlarmEnable == 1){
		Tem_Alarm_Reset_Count = 0;
		if(++Tem_Alarm_Delay_Count == Tem_Alarm_DelayTime ){
			Tem_Alarm_Delay_Count = 0;
			TEM_Error_Exist_Flag = TRUE;
			TEM_Error_Flash_Flag = FALSE;
			GPIO_WriteLow(Tem_LED_PORT,Tem_LED_PIN);
		}
	}
	else if(NTC_TEM_Value < Current_TemAlarmLowLimitValue && !TEM_Error_Exist_Flag && !Parameter_Set_Flag && Relay_Output_Flag && Current_TEMAlarmEnable == 1){
		Tem_Alarm_Reset_Count = 0;
		if(++Tem_Alarm_Delay_Count == Tem_Alarm_DelayTime ){
			Tem_Alarm_Delay_Count = 0;
			TEM_Error_Exist_Flag = TRUE;
			TEM_Error_Flash_Flag = TRUE;
			GPIO_WriteLow(Tem_LED_PORT,Tem_LED_PIN);
		}
	}
	else if( (NTC_TEM_Value <= Current_TemAlarmHighLimitValue && NTC_TEM_Value >= Current_TemAlarmLowLimitValue) && TEM_Error_Exist_Flag && !Parameter_Set_Flag && Relay_Output_Flag && Current_TEMAlarmEnable == 1){
		Tem_Alarm_Delay_Count = 0;
		if(Current_TEMHighAlarmAutostop == 0){
			if(++Tem_Alarm_Reset_Count == Tem_Alarm_Reset_DelayTime ){
				Tem_Alarm_Reset_Count = 0;
				TEM_Error_Exist_Flag = FALSE;
				TEM_Error_Flash_Flag = FALSE;
				GPIO_WriteHigh(Tem_LED_PORT,Tem_LED_PIN);
			}
		}
	}
	else{
		Tem_Alarm_Delay_Count = 0;
		Tem_Alarm_Reset_Count = 0;
	}
	
	if(TEM_Error_Flash_Flag){
		if(++TEM_Error_Flash_Delay_Count == 500){
				TEM_Error_Flash_Delay_Count = 0;
				GPIO_WriteReverse(Tem_LED_PORT,Tem_LED_PIN);
			}
	}
		
	//	(TEM_Error_Exist_Flag)||
	/*Total Error*/	
	Total_Error_Flag = (TEM_Error_Exist_Flag&&(Current_TEMHighAlarmAutostop == 1))
											||(HP_Error_Exist_Flag)
											||(LP_Error_Exist_Flag)
											||(E_Error_Exist_Flag);
	
	if(Total_Error_Flag && Relay_Output_Flag){
		GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
		GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);
		Relay_Output_Flag = 0;
		Run_LED_Flash_Flag = 0;
		Current_ColdDryerStatus = 0;
		ColdDryerStatus_Update_Flag = TRUE;
	}
	//
	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Start_PIN) && !Total_Error_Flag){
		if(++RemoteControl_Start_Delay_Count == RemoteControl_Start_DelayTime ){
			RemoteControl_Start_Delay_Count = 0;
			if(!Relay_Output_Flag){
				Run_LED_Flash_Flag = TRUE;
				GPIO_WriteLow(Run_LED_PORT, Run_LED_PIN);
				Relay_Output_Flag = TRUE;
				Current_ColdDryerStatus = 1;
				ColdDryerStatus_Update_Flag = TRUE;
			}
		}
	}
	else{
		RemoteControl_Start_Delay_Count = 0;
	}
	if(!GPIO_ReadInputPin(RemoteControl_PORT,RemoteControl_Stop_PIN)){
		if(++RemoteControl_Stop_Delay_Count == RemoteControl_Stop_DelayTime){
			RemoteControl_Stop_Delay_Count = 0;
			if(Relay_Output_Flag){
				Run_LED_Flash_Flag = FALSE;
				GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
				GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);	
				Relay_Output_Flag = FALSE;
				Current_ColdDryerStatus = 0;
				ColdDryerStatus_Update_Flag = TRUE;
			}
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
				TEM_Error_Flash_Flag = FALSE;
				GPIO_WriteHigh(Highpressure_LED_PORT,Highpressure_LED_PIN);
				GPIO_WriteHigh(Electricalfail_LED_PORT,Electricalfail_LED_PIN);
				GPIO_WriteHigh(Lowpressure_LED_PORT,Lowpressure_LED_PIN);
				GPIO_WriteHigh(Tem_LED_PORT,Tem_LED_PIN);
			}
			
			if(!Relay_Output_Flag && !Total_Error_Flag){
				Run_LED_Flash_Flag = TRUE;
				GPIO_WriteLow(Run_LED_PORT, Run_LED_PIN);
				Relay_Output_Flag = TRUE;
				Current_ColdDryerStatus = 1;
				ColdDryerStatus_Update_Flag = TRUE;
			}
			else if(Relay_Output_Flag){
				Run_LED_Flash_Flag = FALSE;
				GPIO_WriteHigh(Run_LED_PORT, Run_LED_PIN);
				GPIO_WriteLow(RelayControl_PORT,RelayControl_PIN);	
				Relay_Output_Flag = FALSE;
				Current_ColdDryerStatus = 0;
				ColdDryerStatus_Update_Flag = TRUE;
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
		if(++Run_LED_Flash_Delay_Count == (uint32_t)StartDelayTimeList[Current_StartDelayTimeIndex]*1000)
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
	
	//ParameterMode AutoQuit
	if(Parameter_Set_Flag){
		if(++ParameterMode_Autoquit_Count == ParameterMode_Autoquit_Delaytime){
			ParameterMode_Autoquit_Count = 0;
			Parameter_Set_Flag = FALSE;
			dt = Tem_Show;
		}
	}
	else
		ParameterMode_Autoquit_Count = 0;
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