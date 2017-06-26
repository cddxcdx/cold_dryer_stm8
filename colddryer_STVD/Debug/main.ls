   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 6 void system_init(void){
  44                     	switch	.text
  45  0000               _system_init:
  49                     ; 8 }
  52  0000 81            	ret
  76                     ; 9 main(){
  77                     	switch	.text
  78  0001               _main:
  82                     ; 11 	system_init();
  84  0001 adfd          	call	_system_init
  86  0003               L13:
  87                     ; 12 	while (1);
  89  0003 20fe          	jra	L13
 102                     	xdef	_main
 103                     	xdef	_system_init
 122                     	end
