EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:qth-060-01-h-d-a
LIBS:Shield_debug-cache
EELAYER 25 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 1
Title "Shield de depuración conector J20 NVIDIA JETSON"
Date "2018-02-22"
Rev "Rev 1.0"
Comp "Universidad de la Laguna "
Comment1 "Iván Rodríguez Méndez "
Comment2 "Adaptación multicámara NVIDIA JETSON TX2"
Comment3 "Área de Teoría de la Señal y Comunicación "
Comment4 "Departamento de Ingeniería Industrial"
$EndDescr
NoConn ~ 3000 7200
NoConn ~ 3000 7275
$Comp
L GND #PWR1
U 1 1 5A8F8F7B
P 2875 7745
F 0 "#PWR1" H 2875 7495 50  0001 C CNN
F 1 "GND" H 2875 7595 50  0000 C CNN
F 2 "" H 2875 7745 50  0001 C CNN
F 3 "" H 2875 7745 50  0001 C CNN
	1    2875 7745
	1    0    0    -1  
$EndComp
NoConn ~ 3000 5100
NoConn ~ 3000 5175
NoConn ~ 5000 5175
NoConn ~ 5000 5250
NoConn ~ 5000 7275
$Comp
L Conn_01x09 J1
U 1 1 5A8F63F1
P 1005 1450
F 0 "J1" H 1005 1950 50  0000 C CNN
F 1 "Conn_01x09" H 1005 950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 1005 1450 50  0001 C CNN
F 3 "" H 1005 1450 50  0001 C CNN
	1    1005 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2315 1850 1205 1850
Wire Wire Line
	2315 3675 2315 1850
Wire Wire Line
	3000 3675 2315 3675
Wire Wire Line
	2415 3600 3000 3600
Wire Wire Line
	2415 1750 2415 3600
Wire Wire Line
	1205 1750 2415 1750
Wire Wire Line
	2515 1650 1205 1650
Wire Wire Line
	2515 3525 2515 1650
Wire Wire Line
	3000 3525 2515 3525
Wire Wire Line
	2590 3450 3000 3450
Wire Wire Line
	2590 1550 2590 3450
Wire Wire Line
	1205 1550 2590 1550
Wire Wire Line
	2720 1450 1205 1450
Wire Wire Line
	2720 3375 2720 1450
Wire Wire Line
	3000 3375 2720 3375
Wire Wire Line
	2825 3300 3000 3300
Wire Wire Line
	2825 1350 2825 3300
Wire Wire Line
	1205 1350 2825 1350
Wire Wire Line
	2895 1250 1205 1250
Wire Wire Line
	2895 3225 2895 1250
Wire Wire Line
	3000 3225 2895 3225
Wire Wire Line
	2950 3150 3000 3150
Wire Wire Line
	2950 1150 2950 3150
Wire Wire Line
	1205 1150 2950 1150
Wire Wire Line
	3000 1050 1205 1050
Wire Wire Line
	3000 3075 3000 1050
Wire Wire Line
	2875 5625 2875 7745
Wire Wire Line
	3000 7350 2875 7350
$Comp
L Conn_01x09 J2
U 1 1 5A8F6CC2
P 1005 2595
F 0 "J2" H 1005 3095 50  0000 C CNN
F 1 "Conn_01x09" H 1005 2095 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 1005 2595 50  0001 C CNN
F 3 "" H 1005 2595 50  0001 C CNN
	1    1005 2595
	-1   0    0    1   
$EndComp
Wire Wire Line
	1205 2195 2225 2195
Wire Wire Line
	2225 2195 2225 3750
Wire Wire Line
	2225 3750 3000 3750
Wire Wire Line
	3000 3825 2165 3825
Wire Wire Line
	2165 3825 2165 2295
Wire Wire Line
	2165 2295 1205 2295
Wire Wire Line
	1205 2395 2105 2395
Wire Wire Line
	2105 2395 2105 3900
Wire Wire Line
	2105 3900 3000 3900
Wire Wire Line
	3000 3975 2040 3975
Wire Wire Line
	2040 3975 2040 2495
Wire Wire Line
	2040 2495 1205 2495
Wire Wire Line
	1205 2595 1965 2595
Wire Wire Line
	1965 2595 1965 4050
Wire Wire Line
	1965 4050 3000 4050
Wire Wire Line
	3000 4125 1890 4125
Wire Wire Line
	1890 4125 1890 2695
Wire Wire Line
	1890 2695 1205 2695
Wire Wire Line
	1205 2795 1805 2795
Wire Wire Line
	1805 2795 1805 4200
Wire Wire Line
	1805 4200 3000 4200
Wire Wire Line
	3000 4275 1740 4275
Wire Wire Line
	1740 4275 1740 2895
Wire Wire Line
	1740 2895 1205 2895
Wire Wire Line
	1205 2995 1695 2995
Wire Wire Line
	1695 2995 1695 4350
Wire Wire Line
	1695 4350 3000 4350
NoConn ~ 3000 5250
NoConn ~ 3000 5325
NoConn ~ 3000 5400
NoConn ~ 3000 5475
NoConn ~ 3000 5550
NoConn ~ 5000 5325
NoConn ~ 5000 5400
NoConn ~ 5000 5475
NoConn ~ 5000 5550
NoConn ~ 5000 5100
$Comp
L Conn_01x09 J3
U 1 1 5A8F75AD
P 1005 3915
F 0 "J3" H 1005 4415 50  0000 C CNN
F 1 "Conn_01x09" H 1005 3415 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 1005 3915 50  0001 C CNN
F 3 "" H 1005 3915 50  0001 C CNN
	1    1005 3915
	-1   0    0    1   
$EndComp
Wire Wire Line
	1205 3515 1665 3515
Wire Wire Line
	1665 3515 1665 4425
Wire Wire Line
	1665 4425 3000 4425
Wire Wire Line
	3000 4500 1620 4500
Wire Wire Line
	1620 4500 1620 3615
Wire Wire Line
	1620 3615 1205 3615
Wire Wire Line
	1205 3715 1590 3715
Wire Wire Line
	1590 3715 1590 4575
Wire Wire Line
	1590 4575 3000 4575
Wire Wire Line
	3000 4650 1555 4650
Wire Wire Line
	1555 4650 1555 3815
Wire Wire Line
	1555 3815 1205 3815
Wire Wire Line
	1205 3915 1525 3915
Wire Wire Line
	1525 3915 1525 4725
Wire Wire Line
	1525 4725 3000 4725
Wire Wire Line
	3000 4800 1480 4800
Wire Wire Line
	1480 4800 1480 4015
Wire Wire Line
	1480 4015 1205 4015
Wire Wire Line
	1205 4115 1435 4115
Wire Wire Line
	1435 4115 1435 4875
Wire Wire Line
	1435 4875 3000 4875
Wire Wire Line
	3000 4950 1405 4950
Wire Wire Line
	1405 4950 1405 4215
Wire Wire Line
	1405 4215 1205 4215
Wire Wire Line
	1205 4315 1365 4315
Wire Wire Line
	1365 4315 1365 5025
Wire Wire Line
	1365 5025 3000 5025
Wire Wire Line
	2875 6750 3000 6750
Connection ~ 2875 7350
Wire Wire Line
	2530 6000 3000 6000
Connection ~ 2875 6750
Wire Wire Line
	2875 5625 3000 5625
Connection ~ 2875 6000
NoConn ~ 3000 5700
NoConn ~ 3000 5775
NoConn ~ 5000 7200
NoConn ~ 5000 5700
NoConn ~ 5000 5775
NoConn ~ 5000 5850
NoConn ~ 5000 5925
Wire Wire Line
	5065 7350 5000 7350
Wire Wire Line
	5065 5625 5065 7710
Wire Wire Line
	5065 7710 2875 7710
Connection ~ 2875 7710
Wire Wire Line
	5000 6750 6215 6750
Connection ~ 5065 7350
Wire Wire Line
	5065 6000 5000 6000
Connection ~ 5065 6750
$Comp
L Conn_01x02 J5
U 1 1 5A8F8A3D
P 1015 5200
F 0 "J5" H 1015 5300 50  0000 C CNN
F 1 "Conn_01x02" H 1015 5000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1015 5200 50  0001 C CNN
F 3 "" H 1015 5200 50  0001 C CNN
	1    1015 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 6075 3000 6150
$Comp
L Conn_01x02 J6
U 1 1 5A8F9312
P 1015 5560
F 0 "J6" H 1015 5660 50  0000 C CNN
F 1 "Conn_01x02" H 1015 5360 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1015 5560 50  0001 C CNN
F 3 "" H 1015 5560 50  0001 C CNN
	1    1015 5560
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x07 J7
U 1 1 5A8F98C4
P 1015 6130
F 0 "J7" H 1015 6530 50  0000 C CNN
F 1 "Conn_01x07" H 1015 5730 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 1015 6130 50  0001 C CNN
F 3 "" H 1015 6130 50  0001 C CNN
	1    1015 6130
	-1   0    0    1   
$EndComp
$Comp
L QTH-060-01-H-D-A P1
U 1 1 5A8EB9EB
P 3200 8725
F 0 "P1" H 4030 9680 60  0000 C CNN
F 1 "QTH-060-01-H-D-A" H 4000 9825 60  0000 C CNN
F 2 "QTH-060-01-H-D-A:QTH-060-01-H-D-A" H 3200 8725 60  0001 C CNN
F 3 "" H 3200 8725 60  0001 C CNN
	1    3200 8725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5850 2670 5850
Wire Wire Line
	2670 5850 2670 5100
Wire Wire Line
	2670 5100 1215 5100
Wire Wire Line
	1215 5200 2595 5200
Wire Wire Line
	2595 5200 2595 5925
Wire Wire Line
	2595 5925 3000 5925
Wire Wire Line
	2530 6000 2530 5460
Wire Wire Line
	2530 5460 1215 5460
Wire Wire Line
	1215 5560 2485 5560
Wire Wire Line
	2485 5560 2485 6110
Wire Wire Line
	2485 6110 3000 6110
Connection ~ 3000 6110
$Comp
L Conn_01x07 J4
U 1 1 5A8FAFBD
P 1010 7165
F 0 "J4" H 1010 7565 50  0000 C CNN
F 1 "Conn_01x07" H 1010 6765 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 1010 7165 50  0001 C CNN
F 3 "" H 1010 7165 50  0001 C CNN
	1    1010 7165
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 6225 2425 6225
Wire Wire Line
	2425 6225 2425 5830
Wire Wire Line
	2425 5830 1215 5830
Wire Wire Line
	1215 5930 2395 5930
Wire Wire Line
	2395 5930 2395 6300
Wire Wire Line
	2395 6300 3000 6300
Wire Wire Line
	3000 6375 2360 6375
Wire Wire Line
	2360 6375 2360 6030
Wire Wire Line
	2360 6030 1215 6030
Wire Wire Line
	1215 6130 2325 6130
Wire Wire Line
	2325 6130 2330 6450
Wire Wire Line
	2330 6450 3000 6450
Wire Wire Line
	3000 6525 2285 6525
Wire Wire Line
	2285 6525 2285 6230
Wire Wire Line
	2285 6230 1215 6230
Wire Wire Line
	1215 6330 2255 6330
Wire Wire Line
	2255 6330 2255 6600
Wire Wire Line
	2255 6600 3000 6600
Wire Wire Line
	3000 6675 2215 6675
Wire Wire Line
	2215 6675 2215 6430
Wire Wire Line
	2215 6430 1215 6430
Wire Wire Line
	1210 6865 2840 6865
Wire Wire Line
	2840 6865 2840 6825
Wire Wire Line
	2840 6825 3000 6825
Wire Wire Line
	3000 6900 1210 6900
Wire Wire Line
	1210 6900 1210 6965
Wire Wire Line
	1210 7065 1240 7065
Wire Wire Line
	1240 7065 1240 6975
Wire Wire Line
	1240 6975 3000 6975
Wire Wire Line
	3000 7050 1280 7050
Wire Wire Line
	1280 7050 1280 7165
Wire Wire Line
	1280 7165 1210 7165
Wire Wire Line
	1210 7265 1310 7265
Wire Wire Line
	1310 7265 1310 7125
Wire Wire Line
	1310 7125 3000 7125
Wire Wire Line
	3000 7425 1210 7425
Wire Wire Line
	1210 7425 1210 7365
Wire Wire Line
	1210 7465 3000 7465
Wire Wire Line
	3000 7465 3000 7500
Wire Wire Line
	5065 5625 5000 5625
Connection ~ 5065 6000
Wire Wire Line
	5000 7500 5000 7425
Wire Wire Line
	5000 7050 5000 7125
$Comp
L Conn_01x09 J12
U 1 1 5A8FD01B
P 7165 1440
F 0 "J12" H 7165 1940 50  0000 C CNN
F 1 "Conn_01x09" H 7165 940 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 7165 1440 50  0001 C CNN
F 3 "" H 7165 1440 50  0001 C CNN
	1    7165 1440
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3075 5055 3075
Wire Wire Line
	5055 3075 5055 1040
Wire Wire Line
	5055 1040 6965 1040
Wire Wire Line
	6965 1140 5080 1140
Wire Wire Line
	5080 1140 5080 3150
Wire Wire Line
	5080 3150 5000 3150
Wire Wire Line
	5000 3225 5120 3225
Wire Wire Line
	5120 3225 5120 1240
Wire Wire Line
	5120 1240 6965 1240
Wire Wire Line
	6965 1340 5155 1340
Wire Wire Line
	5155 1340 5155 3300
Wire Wire Line
	5155 3300 5000 3300
Wire Wire Line
	5000 3375 5175 3375
Wire Wire Line
	5175 3375 5175 1440
Wire Wire Line
	5175 1440 6965 1440
Wire Wire Line
	6965 1540 5220 1540
Wire Wire Line
	5220 1540 5220 3450
Wire Wire Line
	5220 3450 5000 3450
Wire Wire Line
	5000 3525 5260 3525
Wire Wire Line
	5260 3525 5260 1640
Wire Wire Line
	5260 1640 6965 1640
Wire Wire Line
	6965 1740 5295 1740
Wire Wire Line
	5295 1740 5295 3600
Wire Wire Line
	5295 3600 5000 3600
Wire Wire Line
	5000 3675 5325 3675
Wire Wire Line
	5325 3675 5325 1840
Wire Wire Line
	5325 1840 6965 1840
$Comp
L Conn_01x09 J11
U 1 1 5A8FE2FB
P 7160 2610
F 0 "J11" H 7160 3110 50  0000 C CNN
F 1 "Conn_01x09" H 7160 2110 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 7160 2610 50  0001 C CNN
F 3 "" H 7160 2610 50  0001 C CNN
	1    7160 2610
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3750 5420 3750
Wire Wire Line
	5420 3750 5420 2210
Wire Wire Line
	5420 2210 6960 2210
Wire Wire Line
	6960 2310 5465 2310
Wire Wire Line
	5465 2310 5465 3825
Wire Wire Line
	5465 3825 5000 3825
Wire Wire Line
	5000 3900 5500 3900
Wire Wire Line
	5500 3900 5500 2410
Wire Wire Line
	5500 2410 6960 2410
Wire Wire Line
	6960 2510 5530 2510
Wire Wire Line
	5530 2510 5530 3975
Wire Wire Line
	5530 3975 5000 3975
Wire Wire Line
	5000 4050 5565 4050
Wire Wire Line
	5565 4050 5565 2610
Wire Wire Line
	5565 2610 6960 2610
Wire Wire Line
	6960 2710 5615 2710
Wire Wire Line
	5615 2710 5615 4125
Wire Wire Line
	5615 4125 5000 4125
Wire Wire Line
	5000 4200 5675 4200
Wire Wire Line
	5675 4200 5675 2810
Wire Wire Line
	5675 2810 6960 2810
Wire Wire Line
	6960 2910 5730 2910
Wire Wire Line
	5730 2910 5730 4275
Wire Wire Line
	5730 4275 5000 4275
Wire Wire Line
	5000 4350 5785 4350
Wire Wire Line
	5785 4350 5785 3010
Wire Wire Line
	5785 3010 6960 3010
$Comp
L Conn_01x09 J10
U 1 1 5A8FF4D1
P 7145 3885
F 0 "J10" H 7145 4385 50  0000 C CNN
F 1 "Conn_01x09" H 7145 3385 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 7145 3885 50  0001 C CNN
F 3 "" H 7145 3885 50  0001 C CNN
	1    7145 3885
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4425 5820 4425
Wire Wire Line
	5820 4425 5820 3485
Wire Wire Line
	5820 3485 6945 3485
Wire Wire Line
	6945 3585 5885 3585
Wire Wire Line
	5885 3585 5885 4500
Wire Wire Line
	5885 4500 5000 4500
Wire Wire Line
	5000 4575 5935 4575
Wire Wire Line
	5935 4575 5935 3685
Wire Wire Line
	5935 3685 6945 3685
Wire Wire Line
	6945 3785 5990 3785
Wire Wire Line
	5990 3785 5990 4650
Wire Wire Line
	5990 4650 5000 4650
Wire Wire Line
	5000 4725 6070 4725
Wire Wire Line
	6070 4725 6070 3885
Wire Wire Line
	6070 3885 6945 3885
Wire Wire Line
	6945 3985 6130 3985
Wire Wire Line
	6130 3985 6130 4800
Wire Wire Line
	6130 4800 5000 4800
Wire Wire Line
	5000 4875 6180 4875
Wire Wire Line
	6180 4875 6180 4085
Wire Wire Line
	6180 4085 6945 4085
Wire Wire Line
	6945 4185 6230 4185
Wire Wire Line
	6230 4185 6230 4950
Wire Wire Line
	6230 4950 5000 4950
Wire Wire Line
	5000 5025 6285 5025
Wire Wire Line
	6285 5025 6285 4285
Wire Wire Line
	6285 4285 6945 4285
$Comp
L Conn_01x09 J9
U 1 1 5A9007BF
P 7135 5560
F 0 "J9" H 7135 6060 50  0000 C CNN
F 1 "Conn_01x09" H 7135 5060 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 7135 5560 50  0001 C CNN
F 3 "" H 7135 5560 50  0001 C CNN
	1    7135 5560
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6075 5250 6075
Wire Wire Line
	5250 6075 5250 5160
Wire Wire Line
	5250 5160 6935 5160
Wire Wire Line
	6935 5260 5350 5260
Wire Wire Line
	5350 5260 5350 6150
Wire Wire Line
	5350 6150 5000 6150
Wire Wire Line
	5000 6225 5410 6225
Wire Wire Line
	5410 6225 5410 5360
Wire Wire Line
	5410 5360 6935 5360
Wire Wire Line
	6935 5460 5475 5460
Wire Wire Line
	5475 5460 5475 6300
Wire Wire Line
	5475 6300 5000 6300
Wire Wire Line
	5000 6375 5510 6375
Wire Wire Line
	5510 6375 5510 5565
Wire Wire Line
	5510 5565 6935 5565
Wire Wire Line
	6935 5565 6935 5560
Wire Wire Line
	6935 5660 5565 5660
Wire Wire Line
	5565 5660 5565 6450
Wire Wire Line
	5565 6450 5000 6450
Wire Wire Line
	5000 6525 5625 6525
Wire Wire Line
	5625 6525 5625 5760
Wire Wire Line
	5625 5760 6935 5760
Wire Wire Line
	6935 5860 5685 5860
Wire Wire Line
	5685 5860 5685 6600
Wire Wire Line
	5685 6600 5000 6600
Wire Wire Line
	5000 6675 5745 6675
Wire Wire Line
	5745 6675 5745 5960
Wire Wire Line
	5745 5960 6935 5960
$Comp
L Conn_01x06 J8
U 1 1 5A901E0B
P 7115 6770
F 0 "J8" H 7115 7070 50  0000 C CNN
F 1 "Conn_01x06" H 7115 6370 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 7115 6770 50  0001 C CNN
F 3 "" H 7115 6770 50  0001 C CNN
	1    7115 6770
	1    0    0    -1  
$EndComp
Wire Wire Line
	6215 6750 6215 6570
Wire Wire Line
	6215 6570 6915 6570
Wire Wire Line
	5000 6825 6245 6825
Wire Wire Line
	6245 6825 6245 6670
Wire Wire Line
	6245 6670 6915 6670
Wire Wire Line
	6915 6770 6290 6770
Wire Wire Line
	6290 6770 6290 6900
Wire Wire Line
	6290 6900 5000 6900
Wire Wire Line
	5000 6975 6340 6975
Wire Wire Line
	6340 6975 6340 6870
Wire Wire Line
	6340 6870 6915 6870
Wire Wire Line
	6915 6970 6375 6970
Wire Wire Line
	6375 6970 6375 7085
Wire Wire Line
	6375 7085 5000 7085
Connection ~ 5000 7085
Wire Wire Line
	5000 7460 6410 7460
Wire Wire Line
	6410 7460 6410 7070
Wire Wire Line
	6410 7070 6915 7070
Connection ~ 5000 7460
$EndSCHEMATC
