EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0101
U 1 1 608DE3B7
P 8700 5250
F 0 "#PWR0101" H 8700 5000 50  0001 C CNN
F 1 "GND" H 8705 5077 50  0000 C CNN
F 2 "" H 8700 5250 50  0001 C CNN
F 3 "" H 8700 5250 50  0001 C CNN
	1    8700 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 5250 8800 5350
Wire Wire Line
	8500 4750 8500 5350
Wire Wire Line
	8100 4250 8100 5350
Wire Wire Line
	8200 4350 8200 5350
Wire Wire Line
	8300 4450 8300 5350
Wire Wire Line
	8600 4550 8600 5350
Wire Wire Line
	8400 4650 8400 5350
$Comp
L power:GND #PWR0102
U 1 1 60A1C105
P 5750 5250
F 0 "#PWR0102" H 5750 5000 50  0001 C CNN
F 1 "GND" H 5755 5077 50  0000 C CNN
F 2 "" H 5750 5250 50  0001 C CNN
F 3 "" H 5750 5250 50  0001 C CNN
	1    5750 5250
	1    0    0    -1  
$EndComp
NoConn ~ 3400 4150
NoConn ~ 3400 4250
NoConn ~ 3400 4550
Wire Wire Line
	3150 3450 3150 3200
$Comp
L Switch:SW_SPST SW1
U 1 1 60ABF0C6
P 3150 3000
F 0 "SW1" V 3196 2912 50  0000 R CNN
F 1 "SW_SPST" V 3105 2912 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3150 3000 50  0001 C CNN
F 3 "~" H 3150 3000 50  0001 C CNN
	1    3150 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60ABFC21
P 3150 2800
F 0 "#PWR0103" H 3150 2550 50  0001 C CNN
F 1 "GND" H 3155 2627 50  0000 C CNN
F 2 "" H 3150 2800 50  0001 C CNN
F 3 "" H 3150 2800 50  0001 C CNN
	1    3150 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 60ADC88F
P 10000 3300
F 0 "R5" H 9930 3254 50  0000 R CNN
F 1 "330" H 9930 3345 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9930 3300 50  0001 C CNN
F 3 "~" H 10000 3300 50  0001 C CNN
	1    10000 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 60AE10EF
P 10450 3300
F 0 "R6" H 10380 3254 50  0000 R CNN
F 1 "330" H 10380 3345 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10380 3300 50  0001 C CNN
F 3 "~" H 10450 3300 50  0001 C CNN
	1    10450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3450 10250 3450
Wire Wire Line
	10250 3450 10250 3950
Connection ~ 10250 3450
Wire Wire Line
	10250 3450 10450 3450
$Comp
L power:GND #PWR0104
U 1 1 60B07B2B
P 10250 3950
F 0 "#PWR0104" H 10250 3700 50  0001 C CNN
F 1 "GND" H 10255 3777 50  0000 C CNN
F 2 "" H 10250 3950 50  0001 C CNN
F 3 "" H 10250 3950 50  0001 C CNN
	1    10250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4950 5750 5250
Text Label 4050 1050 2    50   ~ 0
LED1
Text Label 4050 1350 2    50   ~ 0
LED2
Text Label 4050 1650 2    50   ~ 0
LED3
Text Label 4050 1950 2    50   ~ 0
LED4
Text Label 4050 2250 2    50   ~ 0
LED5
Text Label 4050 2550 2    50   ~ 0
LED6
Text Label 4050 2850 2    50   ~ 0
LED7
Text Label 4050 750  2    50   ~ 0
LED0
$Comp
L power:GND #PWR0107
U 1 1 60ADFDF8
P 1600 4650
F 0 "#PWR0107" H 1600 4400 50  0001 C CNN
F 1 "GND" H 1605 4477 50  0000 C CNN
F 2 "" H 1600 4650 50  0001 C CNN
F 3 "" H 1600 4650 50  0001 C CNN
	1    1600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3550 2100 3450
Wire Wire Line
	2100 4050 2500 4050
Wire Wire Line
	2100 4250 2200 4250
NoConn ~ 5800 3000
$Comp
L Device:R_Network08 RN2
U 1 1 60B3550B
P 9850 2300
F 0 "RN2" H 9370 2254 50  0000 R CNN
F 1 "330" H 9370 2345 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10325 2300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9850 2300 50  0001 C CNN
	1    9850 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60B4F99E
P 9450 2000
F 0 "#PWR0108" H 9450 1750 50  0001 C CNN
F 1 "GND" H 9455 1827 50  0000 C CNN
F 2 "" H 9450 2000 50  0001 C CNN
F 3 "" H 9450 2000 50  0001 C CNN
	1    9450 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 2100 9450 2000
Text Label 8050 3550 0    50   ~ 0
SW1
Text Label 8050 3650 0    50   ~ 0
SW2
Text Label 8050 3750 0    50   ~ 0
SW3
Text Label 8050 3850 0    50   ~ 0
SW4
Text Label 8050 3950 0    50   ~ 0
SW5
Text Label 8050 4050 0    50   ~ 0
SW6
Text Label 8050 4150 0    50   ~ 0
SW7
Text Label 8050 3450 0    50   ~ 0
SW0
Text Label 10050 2600 3    50   ~ 0
SW1
Text Label 9950 2600 3    50   ~ 0
SW2
Text Label 9850 2600 3    50   ~ 0
SW3
Text Label 9750 2600 3    50   ~ 0
SW4
Text Label 9650 2600 3    50   ~ 0
SW5
Text Label 9550 2600 3    50   ~ 0
SW6
Text Label 9450 2600 3    50   ~ 0
SW7
Text Label 10150 2600 3    50   ~ 0
SW0
Wire Wire Line
	9450 2600 9450 2500
Wire Wire Line
	9550 2500 9550 2600
Wire Wire Line
	9650 2600 9650 2500
Wire Wire Line
	9750 2500 9750 2600
Wire Wire Line
	9850 2600 9850 2500
Wire Wire Line
	9950 2500 9950 2600
Wire Wire Line
	10050 2600 10050 2500
Wire Wire Line
	10150 2500 10150 2600
NoConn ~ 7950 3350
Wire Wire Line
	5450 3000 5450 2750
$Comp
L power:+3.3V #PWR0110
U 1 1 60A2189F
P 5450 2750
F 0 "#PWR0110" H 5450 2600 50  0001 C CNN
F 1 "+3.3V" H 5465 2923 50  0000 C CNN
F 2 "" H 5450 2750 50  0001 C CNN
F 3 "" H 5450 2750 50  0001 C CNN
	1    5450 2750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 60C899C1
P 6150 2850
F 0 "#PWR0111" H 6150 2700 50  0001 C CNN
F 1 "VCC" H 6165 3023 50  0000 C CNN
F 2 "" H 6150 2850 50  0001 C CNN
F 3 "" H 6150 2850 50  0001 C CNN
	1    6150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2850 6150 3000
$Comp
L power:VCC #PWR0112
U 1 1 60C969FC
P 8800 5250
F 0 "#PWR0112" H 8800 5100 50  0001 C CNN
F 1 "VCC" H 8815 5423 50  0000 C CNN
F 2 "" H 8800 5250 50  0001 C CNN
F 3 "" H 8800 5250 50  0001 C CNN
	1    8800 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60CBD227
P 1550 1600
F 0 "R1" V 1343 1600 50  0000 C CNN
F 1 "180" V 1434 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1480 1600 50  0001 C CNN
F 3 "~" H 1550 1600 50  0001 C CNN
	1    1550 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 60CCF067
P 9700 3300
F 0 "R4" H 9630 3254 50  0000 R CNN
F 1 "330" H 9630 3345 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9630 3300 50  0001 C CNN
F 3 "~" H 9700 3300 50  0001 C CNN
	1    9700 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 3150 9700 3150
Wire Wire Line
	7950 4750 8500 4750
Wire Wire Line
	7950 4650 8400 4650
Wire Wire Line
	7950 4550 8600 4550
Wire Wire Line
	7950 4450 8300 4450
Wire Wire Line
	7950 4350 8200 4350
Wire Wire Line
	7950 4250 8100 4250
Wire Wire Line
	7950 4150 8050 4150
Wire Wire Line
	8050 4050 7950 4050
Wire Wire Line
	7950 3950 8050 3950
Wire Wire Line
	8050 3850 7950 3850
Wire Wire Line
	7950 3750 8050 3750
Wire Wire Line
	8050 3650 7950 3650
Wire Wire Line
	7950 3550 8050 3550
Wire Wire Line
	8050 3450 7950 3450
Wire Wire Line
	5650 4950 5750 4950
Wire Wire Line
	2200 1400 2300 1400
Connection ~ 2200 1400
Wire Wire Line
	2200 1300 2200 1400
$Comp
L Device:D D6
U 1 1 60CF6820
P 2350 1300
F 0 "D6" H 2350 1083 50  0000 C CNN
F 1 "D" H 2350 1174 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2350 1300 50  0001 C CNN
F 3 "~" H 2350 1300 50  0001 C CNN
	1    2350 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 1800 2250 1800
$Comp
L power:GND #PWR0115
U 1 1 60CB81A0
P 2250 1800
F 0 "#PWR0115" H 2250 1550 50  0001 C CNN
F 1 "GND" H 2255 1627 50  0000 C CNN
F 2 "" H 2250 1800 50  0001 C CNN
F 3 "" H 2250 1800 50  0001 C CNN
	1    2250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1400 2200 1400
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 60CA80AE
P 1950 1600
F 0 "Q1" H 2141 1646 50  0000 L CNN
F 1 "Q_NPN_BCE" H 2141 1555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 2150 1700 50  0001 C CNN
F 3 "~" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 60CA40ED
P 2400 1500
F 0 "BZ1" V 2358 1652 50  0000 L CNN
F 1 "Buzzer" V 2449 1652 50  0000 L CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_CUI_CST-931RP-A" V 2375 1600 50  0001 C CNN
F 3 "~" V 2375 1600 50  0001 C CNN
	1    2400 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 1600 1750 1600
Text Label 1350 1600 2    50   ~ 0
BUZZER
Wire Wire Line
	1350 1600 1400 1600
Text Label 3400 4850 3    50   ~ 0
BUZZER
Wire Wire Line
	3400 4750 3400 4850
Text Label 3300 4650 2    50   ~ 0
N_PAGE
Wire Wire Line
	3400 4650 3300 4650
Text Label 10450 3050 2    50   ~ 0
N_PAGE
Wire Wire Line
	10450 3050 10450 3150
Text Label 3300 4450 2    50   ~ 0
P_PAGE
Wire Wire Line
	9850 3150 10000 3150
Wire Wire Line
	3300 4450 3400 4450
Text Label 9850 3050 2    50   ~ 0
P_PAGE
Wire Wire Line
	9850 3050 9850 3150
Text Label 3300 4350 2    50   ~ 0
SELECT
Wire Wire Line
	3300 4350 3400 4350
Text Label 9550 3050 2    50   ~ 0
SELECT
Wire Wire Line
	9550 3050 9550 3150
$Comp
L Device:R R2
U 1 1 60D6F5BE
P 2200 4400
F 0 "R2" H 2270 4446 50  0000 L CNN
F 1 "R" H 2270 4355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2130 4400 50  0001 C CNN
F 3 "~" H 2200 4400 50  0001 C CNN
	1    2200 4400
	1    0    0    -1  
$EndComp
Connection ~ 2200 4250
Wire Wire Line
	2200 4250 3250 4250
$Comp
L Device:R R3
U 1 1 60D70BFF
P 2500 4200
F 0 "R3" H 2570 4246 50  0000 L CNN
F 1 "R" H 2570 4155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2430 4200 50  0001 C CNN
F 3 "~" H 2500 4200 50  0001 C CNN
	1    2500 4200
	1    0    0    -1  
$EndComp
Connection ~ 2500 4050
$Comp
L power:GND #PWR0116
U 1 1 60D71467
P 2500 4400
F 0 "#PWR0116" H 2500 4150 50  0001 C CNN
F 1 "GND" H 2505 4227 50  0000 C CNN
F 2 "" H 2500 4400 50  0001 C CNN
F 3 "" H 2500 4400 50  0001 C CNN
	1    2500 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 609F2A76
P 4350 1050
F 0 "R8" H 4420 1096 50  0000 L CNN
F 1 "330" H 4420 1005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 1050 50  0001 C CNN
F 3 "~" H 4350 1050 50  0001 C CNN
	1    4350 1050
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 LED_CONN1
U 1 1 609F4C1E
P 5300 1750
F 0 "LED_CONN1" H 5380 1742 50  0000 L CNN
F 1 "Conn_01x08" H 5380 1651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 5300 1750 50  0001 C CNN
F 3 "~" H 5300 1750 50  0001 C CNN
	1    5300 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 609F2FA0
P 4350 750
F 0 "R7" H 4420 796 50  0000 L CNN
F 1 "330" H 4420 705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 750 50  0001 C CNN
F 3 "~" H 4350 750 50  0001 C CNN
	1    4350 750 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 60A31CAE
P 4350 1650
F 0 "R10" H 4420 1696 50  0000 L CNN
F 1 "330" H 4420 1605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 1650 50  0001 C CNN
F 3 "~" H 4350 1650 50  0001 C CNN
	1    4350 1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 60A31CB4
P 4350 1350
F 0 "R9" H 4420 1396 50  0000 L CNN
F 1 "330" H 4420 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 1350 50  0001 C CNN
F 3 "~" H 4350 1350 50  0001 C CNN
	1    4350 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 60A36ABB
P 4350 2250
F 0 "R12" H 4420 2296 50  0000 L CNN
F 1 "330" H 4420 2205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2250 50  0001 C CNN
F 3 "~" H 4350 2250 50  0001 C CNN
	1    4350 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 60A36AC1
P 4350 1950
F 0 "R11" H 4420 1996 50  0000 L CNN
F 1 "330" H 4420 1905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 1950 50  0001 C CNN
F 3 "~" H 4350 1950 50  0001 C CNN
	1    4350 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 60A3B990
P 4350 2850
F 0 "R14" H 4420 2896 50  0000 L CNN
F 1 "330" H 4420 2805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2850 50  0001 C CNN
F 3 "~" H 4350 2850 50  0001 C CNN
	1    4350 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 60A3B996
P 4350 2550
F 0 "R13" H 4420 2596 50  0000 L CNN
F 1 "330" H 4420 2505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2550 50  0001 C CNN
F 3 "~" H 4350 2550 50  0001 C CNN
	1    4350 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 2850 5100 2850
Wire Wire Line
	4500 2550 5050 2550
Wire Wire Line
	4500 2250 5000 2250
Wire Wire Line
	4500 1950 4950 1950
Wire Wire Line
	4500 750  5100 750 
Wire Wire Line
	4500 1650 4950 1650
Wire Wire Line
	4500 1350 5000 1350
Wire Wire Line
	4500 1050 5050 1050
Wire Wire Line
	5100 2850 5100 2150
Wire Wire Line
	5050 2550 5050 2050
Wire Wire Line
	5050 2050 5100 2050
Wire Wire Line
	5000 2250 5000 1950
Wire Wire Line
	5000 1950 5100 1950
Wire Wire Line
	4950 1950 4950 1850
Wire Wire Line
	4950 1850 5100 1850
Wire Wire Line
	4950 1650 4950 1750
Wire Wire Line
	4950 1750 5100 1750
Wire Wire Line
	5000 1350 5000 1650
Wire Wire Line
	5000 1650 5100 1650
Wire Wire Line
	5050 1050 5050 1550
Wire Wire Line
	5050 1550 5100 1550
Wire Wire Line
	5100 750  5100 1450
Wire Wire Line
	4050 750  4200 750 
Wire Wire Line
	4200 1050 4050 1050
Wire Wire Line
	4050 1350 4200 1350
Wire Wire Line
	4200 1650 4050 1650
Wire Wire Line
	4050 1950 4200 1950
Wire Wire Line
	4200 2250 4050 2250
Wire Wire Line
	4050 2550 4200 2550
Wire Wire Line
	4200 2850 4050 2850
Connection ~ 5750 4950
Wire Wire Line
	3400 3550 2100 3550
Wire Wire Line
	3400 3450 3150 3450
Wire Wire Line
	8700 2550 8600 2550
Wire Wire Line
	8600 2450 8700 2450
Wire Wire Line
	8700 2350 8600 2350
Wire Wire Line
	8600 2250 8700 2250
Wire Wire Line
	8700 2150 8600 2150
Wire Wire Line
	8600 2050 8700 2050
Wire Wire Line
	8700 1950 8600 1950
Wire Wire Line
	8600 1850 8700 1850
Text Label 8700 1850 0    50   ~ 0
SW0
Text Label 8700 2550 0    50   ~ 0
SW7
Text Label 8700 2450 0    50   ~ 0
SW6
Text Label 8700 2350 0    50   ~ 0
SW5
Text Label 8700 2250 0    50   ~ 0
SW4
Text Label 8700 2150 0    50   ~ 0
SW3
Text Label 8700 2050 0    50   ~ 0
SW2
Text Label 8700 1950 0    50   ~ 0
SW1
$Comp
L Connector_Generic:Conn_01x11 SWITCH_CONN1
U 1 1 609F5F89
P 8400 2350
F 0 "SWITCH_CONN1" H 8318 3067 50  0000 C CNN
F 1 "Conn_01x08" H 8318 2976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x11_P2.54mm_Horizontal" H 8400 2350 50  0001 C CNN
F 3 "~" H 8400 2350 50  0001 C CNN
	1    8400 2350
	-1   0    0    -1  
$EndComp
$Comp
L schematics:Heltec_Wifi_Kit_32_V2 U2
U 1 1 6089F606
P 5700 3300
F 0 "U2" H 5675 1561 50  0000 C CNN
F 1 "Heltec_Wifi_Kit_32_V2" H 5675 1470 50  0000 C CNN
F 2 "schematics:Heltec_WiFi_Kit_32" H 5700 3300 50  0001 C CNN
F 3 "" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2650 8700 2650
Wire Wire Line
	8700 2750 8600 2750
Wire Wire Line
	8600 2850 8700 2850
Wire Wire Line
	9700 3450 10000 3450
Connection ~ 10000 3450
Wire Wire Line
	2100 3650 3150 3650
Wire Wire Line
	3150 3650 3150 3850
Wire Wire Line
	3150 3850 3400 3850
Wire Wire Line
	2100 3750 3400 3750
Wire Wire Line
	2100 3850 2950 3850
Wire Wire Line
	2950 3850 2950 3700
Wire Wire Line
	2950 3700 3250 3700
Wire Wire Line
	3250 3700 3250 3650
Wire Wire Line
	3250 3650 3400 3650
Wire Wire Line
	5450 3000 5600 3000
Connection ~ 5450 3000
Wire Wire Line
	6000 3000 6150 3000
Connection ~ 6150 3000
Text Label 950  4150 2    50   ~ 0
LED7
Text Label 950  4050 2    50   ~ 0
LED6
Text Label 950  3950 2    50   ~ 0
LED5
Text Label 950  3850 2    50   ~ 0
LED4
Text Label 8700 2650 0    50   ~ 0
SELECT
Text Label 8700 2750 0    50   ~ 0
P_PAGE
Text Label 8700 2850 0    50   ~ 0
N_PAGE
$Comp
L schematics:E-InkScreen EINK_CONN1
U 1 1 608B208A
P 8500 5550
F 0 "EINK_CONN1" V 8441 5938 50  0000 L CNN
F 1 "E-InkScreen" V 8532 5938 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 8500 5550 50  0001 C CNN
F 3 "~" H 8500 5550 50  0001 C CNN
	1    8500 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 4050 3150 4050
Wire Wire Line
	3150 4050 3150 3950
Wire Wire Line
	3250 4250 3250 4050
Wire Wire Line
	3150 3950 3400 3950
Wire Wire Line
	3250 4050 3400 4050
$Comp
L power:+3V3 #PWR0105
U 1 1 60D5A7FB
P 2550 1300
F 0 "#PWR0105" H 2550 1150 50  0001 C CNN
F 1 "+3V3" V 2565 1428 50  0000 L CNN
F 2 "" H 2550 1300 50  0001 C CNN
F 3 "" H 2550 1300 50  0001 C CNN
	1    2550 1300
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0106
U 1 1 60D5C9D1
P 1400 3150
F 0 "#PWR0106" H 1400 3000 50  0001 C CNN
F 1 "+3V3" H 1415 3323 50  0000 C CNN
F 2 "" H 1400 3150 50  0001 C CNN
F 3 "" H 1400 3150 50  0001 C CNN
	1    1400 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  4150 1100 4150
Wire Wire Line
	1100 4050 950  4050
Wire Wire Line
	1100 3950 950  3950
Wire Wire Line
	1100 3850 950  3850
Wire Wire Line
	950  3750 1100 3750
Wire Wire Line
	1100 3650 950  3650
Wire Wire Line
	950  3550 1100 3550
Wire Wire Line
	1100 3450 950  3450
$Comp
L 74xx:74LS259 U1
U 1 1 6097AF4E
P 1600 3850
F 0 "U1" H 1600 4731 50  0000 C CNN
F 1 "74LS259" H 1600 4640 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1600 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS259" H 1600 3850 50  0001 C CNN
	1    1600 3850
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 60D67734
P 2200 4700
F 0 "#PWR01" H 2200 4550 50  0001 C CNN
F 1 "+3V3" H 2215 4873 50  0000 C CNN
F 2 "" H 2200 4700 50  0001 C CNN
F 3 "" H 2200 4700 50  0001 C CNN
	1    2200 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 4550 2200 4700
$Comp
L Connector_Generic:Conn_01x02 POWER_CONN1
U 1 1 60D791DF
P 6700 1200
F 0 "POWER_CONN1" V 6572 1280 50  0000 L CNN
F 1 "Conn_01x02" V 6663 1280 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 6700 1200 50  0001 C CNN
F 3 "~" H 6700 1200 50  0001 C CNN
	1    6700 1200
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 60D7AC89
P 6700 1000
F 0 "#PWR03" H 6700 850 50  0001 C CNN
F 1 "+3.3V" H 6715 1173 50  0000 C CNN
F 2 "" H 6700 1000 50  0001 C CNN
F 3 "" H 6700 1000 50  0001 C CNN
	1    6700 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60D7B622
P 6600 1000
F 0 "#PWR02" H 6600 750 50  0001 C CNN
F 1 "GND" H 6605 827 50  0000 C CNN
F 2 "" H 6600 1000 50  0001 C CNN
F 3 "" H 6600 1000 50  0001 C CNN
	1    6600 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 4350 2500 4400
Wire Wire Line
	8700 5350 8700 5250
Wire Wire Line
	1600 4650 1600 4550
Wire Wire Line
	1400 3150 1600 3150
Wire Wire Line
	2500 1400 2500 1300
Wire Wire Line
	2550 1300 2500 1300
Connection ~ 2500 1300
Text Label 950  3750 2    50   ~ 0
LED0
Text Label 950  3450 2    50   ~ 0
LED3
Text Label 950  3550 2    50   ~ 0
LED2
Text Label 950  3650 2    50   ~ 0
LED1
NoConn ~ 4300 6200
NoConn ~ 4200 6200
NoConn ~ 4100 6200
NoConn ~ 4000 6200
NoConn ~ 3900 6200
NoConn ~ 3800 6200
NoConn ~ 3700 6200
NoConn ~ 3600 6200
NoConn ~ 3500 6200
NoConn ~ 3400 6200
NoConn ~ 3300 6200
NoConn ~ 3200 6200
NoConn ~ 3100 6200
NoConn ~ 3000 6200
NoConn ~ 2900 6200
NoConn ~ 2800 6200
NoConn ~ 2700 6200
NoConn ~ 2600 6200
NoConn ~ 2500 6200
NoConn ~ 2400 6200
NoConn ~ 2300 6200
NoConn ~ 2200 6200
NoConn ~ 2100 6200
NoConn ~ 2000 6200
NoConn ~ 1900 6200
NoConn ~ 1800 6200
NoConn ~ 1700 6200
NoConn ~ 1600 6200
NoConn ~ 1500 6200
NoConn ~ 1400 6200
NoConn ~ 1300 6200
NoConn ~ 1200 6200
NoConn ~ 1100 6200
NoConn ~ 1000 6200
NoConn ~ 900  6200
NoConn ~ 4400 6200
$Comp
L Connector_Generic:Conn_01x36 J2
U 1 1 60F26944
P 2600 6000
F 0 "J2" V 2817 5946 50  0000 C CNN
F 1 "BREADBOARD" V 2726 5946 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x36_P2.54mm_Vertical" H 2600 6000 50  0001 C CNN
F 3 "~" H 2600 6000 50  0001 C CNN
	1    2600 6000
	0    -1   -1   0   
$EndComp
NoConn ~ 4300 6700
NoConn ~ 4200 6700
NoConn ~ 4100 6700
NoConn ~ 4000 6700
NoConn ~ 3900 6700
NoConn ~ 3800 6700
NoConn ~ 3700 6700
NoConn ~ 3600 6700
NoConn ~ 3500 6700
NoConn ~ 3400 6700
NoConn ~ 3300 6700
NoConn ~ 3200 6700
NoConn ~ 3100 6700
NoConn ~ 3000 6700
NoConn ~ 2900 6700
NoConn ~ 2800 6700
NoConn ~ 2700 6700
NoConn ~ 2600 6700
NoConn ~ 2500 6700
NoConn ~ 2400 6700
NoConn ~ 2300 6700
NoConn ~ 2200 6700
NoConn ~ 2100 6700
NoConn ~ 2000 6700
NoConn ~ 1900 6700
NoConn ~ 1800 6700
NoConn ~ 1700 6700
NoConn ~ 1600 6700
NoConn ~ 1500 6700
NoConn ~ 1400 6700
NoConn ~ 1300 6700
NoConn ~ 1200 6700
NoConn ~ 1100 6700
NoConn ~ 1000 6700
NoConn ~ 900  6700
NoConn ~ 4400 6700
$Comp
L Connector_Generic:Conn_01x36 J3
U 1 1 60F5EA85
P 2600 6500
F 0 "J3" V 2817 6446 50  0000 C CNN
F 1 "BREADBOARD" V 2726 6446 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x36_P2.54mm_Vertical" H 2600 6500 50  0001 C CNN
F 3 "~" H 2600 6500 50  0001 C CNN
	1    2600 6500
	0    -1   -1   0   
$EndComp
NoConn ~ 4300 7200
NoConn ~ 4200 7200
NoConn ~ 4100 7200
NoConn ~ 4000 7200
NoConn ~ 3900 7200
NoConn ~ 3800 7200
NoConn ~ 3700 7200
NoConn ~ 3600 7200
NoConn ~ 3500 7200
NoConn ~ 3400 7200
NoConn ~ 3300 7200
NoConn ~ 3200 7200
NoConn ~ 3100 7200
NoConn ~ 3000 7200
NoConn ~ 2900 7200
NoConn ~ 2800 7200
NoConn ~ 2700 7200
NoConn ~ 2600 7200
NoConn ~ 2500 7200
NoConn ~ 2400 7200
NoConn ~ 2300 7200
NoConn ~ 2200 7200
NoConn ~ 2100 7200
NoConn ~ 2000 7200
NoConn ~ 1900 7200
NoConn ~ 1800 7200
NoConn ~ 1700 7200
NoConn ~ 1600 7200
NoConn ~ 1500 7200
NoConn ~ 1400 7200
NoConn ~ 1300 7200
NoConn ~ 1200 7200
NoConn ~ 1100 7200
NoConn ~ 1000 7200
NoConn ~ 900  7200
NoConn ~ 4400 7200
$Comp
L Connector_Generic:Conn_01x36 J4
U 1 1 60F6FE3A
P 2600 7000
F 0 "J4" V 2817 6946 50  0000 C CNN
F 1 "BREADBOARD" V 2726 6946 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x36_P2.54mm_Vertical" H 2600 7000 50  0001 C CNN
F 3 "~" H 2600 7000 50  0001 C CNN
	1    2600 7000
	0    -1   -1   0   
$EndComp
NoConn ~ 4300 7700
NoConn ~ 4200 7700
NoConn ~ 4100 7700
NoConn ~ 4000 7700
NoConn ~ 3900 7700
NoConn ~ 3800 7700
NoConn ~ 3700 7700
NoConn ~ 3600 7700
NoConn ~ 3500 7700
NoConn ~ 3400 7700
NoConn ~ 3300 7700
NoConn ~ 3200 7700
NoConn ~ 3100 7700
NoConn ~ 3000 7700
NoConn ~ 2900 7700
NoConn ~ 2800 7700
NoConn ~ 2700 7700
NoConn ~ 2600 7700
NoConn ~ 2500 7700
NoConn ~ 2400 7700
NoConn ~ 2300 7700
NoConn ~ 2200 7700
NoConn ~ 2100 7700
NoConn ~ 2000 7700
NoConn ~ 1900 7700
NoConn ~ 1800 7700
NoConn ~ 1700 7700
NoConn ~ 1600 7700
NoConn ~ 1500 7700
NoConn ~ 1400 7700
NoConn ~ 1300 7700
NoConn ~ 1200 7700
NoConn ~ 1100 7700
NoConn ~ 1000 7700
NoConn ~ 900  7700
NoConn ~ 4400 7700
$Comp
L Connector_Generic:Conn_01x36 J5
U 1 1 60F6FE64
P 2600 7500
F 0 "J5" V 2817 7446 50  0000 C CNN
F 1 "BREADBOARD" V 2726 7446 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x36_P2.54mm_Vertical" H 2600 7500 50  0001 C CNN
F 3 "~" H 2600 7500 50  0001 C CNN
	1    2600 7500
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 60F8C35B
P 650 7650
F 0 "H1" H 750 7696 50  0000 L CNN
F 1 "MountingHole" H 750 7605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 650 7650 50  0001 C CNN
F 3 "~" H 650 7650 50  0001 C CNN
	1    650  7650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 60F8D601
P 10950 700
F 0 "H4" H 11050 746 50  0000 L CNN
F 1 "MountingHole" H 11050 655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 10950 700 50  0001 C CNN
F 3 "~" H 10950 700 50  0001 C CNN
	1    10950 700 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 60F8DD8D
P 10850 6250
F 0 "H3" H 10950 6296 50  0000 L CNN
F 1 "MountingHole" H 10950 6205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 10850 6250 50  0001 C CNN
F 3 "~" H 10850 6250 50  0001 C CNN
	1    10850 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 3v3
U 1 1 60FA7D78
P 5000 6000
F 0 "3v3" V 4872 6180 50  0000 L CNN
F 1 "BREAD 3v3" V 4963 6180 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5000 6000 50  0001 C CNN
F 3 "~" H 5000 6000 50  0001 C CNN
	1    5000 6000
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 GND1
U 1 1 60FA9AE0
P 5000 6500
F 0 "GND1" V 4872 6680 50  0000 L CNN
F 1 "BREAD GND" V 4963 6680 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5000 6500 50  0001 C CNN
F 3 "~" H 5000 6500 50  0001 C CNN
	1    5000 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 5800 4900 5800
Connection ~ 4900 5800
Wire Wire Line
	4900 5800 5000 5800
Connection ~ 5000 5800
Wire Wire Line
	5000 5800 5100 5800
Wire Wire Line
	4800 6300 4900 6300
Connection ~ 4900 6300
Wire Wire Line
	4900 6300 5000 6300
Connection ~ 5000 6300
Wire Wire Line
	5000 6300 5100 6300
$Comp
L power:+3.3V #PWR04
U 1 1 60FB8413
P 4800 5800
F 0 "#PWR04" H 4800 5650 50  0001 C CNN
F 1 "+3.3V" H 4815 5973 50  0000 C CNN
F 2 "" H 4800 5800 50  0001 C CNN
F 3 "" H 4800 5800 50  0001 C CNN
	1    4800 5800
	1    0    0    -1  
$EndComp
Connection ~ 4800 5800
$Comp
L power:GND #PWR05
U 1 1 60FB8BBB
P 4800 6300
F 0 "#PWR05" H 4800 6050 50  0001 C CNN
F 1 "GND" H 4805 6127 50  0000 C CNN
F 2 "" H 4800 6300 50  0001 C CNN
F 3 "" H 4800 6300 50  0001 C CNN
	1    4800 6300
	-1   0    0    1   
$EndComp
Connection ~ 4800 6300
$EndSCHEMATC
