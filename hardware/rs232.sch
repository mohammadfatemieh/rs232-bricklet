EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
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
LIBS:rs232-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Serial Bricklet"
Date "4 mar 2015"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2015, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SC16IS740 U2
U 1 1 5045DDB0
P 3250 5050
F 0 "U2" H 2800 5900 60  0000 C CNN
F 1 "SC16IS740" H 3600 4300 60  0000 C CNN
F 2 "TSSOP16" H 3250 5050 60  0001 C CNN
F 3 "" H 3250 5050 60  0001 C CNN
	1    3250 5050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR01
U 1 1 5045D372
P 1700 3750
F 0 "#PWR01" H 1700 3850 30  0001 C CNN
F 1 "VCC" H 1700 3850 30  0000 C CNN
F 2 "" H 1700 3750 60  0001 C CNN
F 3 "" H 1700 3750 60  0001 C CNN
	1    1700 3750
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5045D360
P 1950 3850
F 0 "R2" V 2030 3850 50  0000 C CNN
F 1 "0" V 1950 3850 50  0000 C CNN
F 2 "0603" H 1950 3850 60  0001 C CNN
F 3 "" H 1950 3850 60  0001 C CNN
	1    1950 3850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 4F018B38
P 2550 5000
F 0 "#PWR02" H 2550 5000 30  0001 C CNN
F 1 "GND" H 2550 4930 30  0001 C CNN
F 2 "" H 2550 5000 60  0001 C CNN
F 3 "" H 2550 5000 60  0001 C CNN
	1    2550 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 4F018B1E
P 1500 6400
F 0 "#PWR03" H 1500 6400 30  0001 C CNN
F 1 "GND" H 1500 6330 30  0001 C CNN
F 2 "" H 1500 6400 60  0001 C CNN
F 3 "" H 1500 6400 60  0001 C CNN
	1    1500 6400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 4F018B1C
P 2100 6400
F 0 "#PWR04" H 2100 6400 30  0001 C CNN
F 1 "GND" H 2100 6330 30  0001 C CNN
F 2 "" H 2100 6400 60  0001 C CNN
F 3 "" H 2100 6400 60  0001 C CNN
	1    2100 6400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 4F018B19
P 2100 6100
F 0 "C2" V 2250 6100 50  0000 L CNN
F 1 "18pF" V 1950 6100 50  0000 L CNN
F 2 "0603" H 2100 6100 60  0001 C CNN
F 3 "" H 2100 6100 60  0001 C CNN
	1    2100 6100
	-1   0    0    1   
$EndComp
$Comp
L C C1
U 1 1 4F018B16
P 1500 6100
F 0 "C1" V 1650 6100 50  0000 L CNN
F 1 "18pF" V 1350 6100 50  0000 L CNN
F 2 "0603" H 1500 6100 60  0001 C CNN
F 3 "" H 1500 6100 60  0001 C CNN
	1    1500 6100
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 4F018B10
P 1800 5900
F 0 "R1" V 1700 5900 50  0000 C CNN
F 1 "1M" V 1800 5900 50  0000 C CNN
F 2 "0603" H 1800 5900 60  0001 C CNN
F 3 "" H 1800 5900 60  0001 C CNN
	1    1800 5900
	0    -1   -1   0   
$EndComp
$Comp
L CRYSTAL X1
U 1 1 4F018ACA
P 1800 5600
F 0 "X1" H 1850 5450 60  0000 C CNN
F 1 "14.7456Mhz" H 1800 5750 60  0000 C CNN
F 2 "HC49_US" H 1800 5600 60  0001 C CNN
F 3 "" H 1800 5600 60  0001 C CNN
	1    1800 5600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 4F018A9A
P 3750 4150
F 0 "#PWR05" H 3750 4150 30  0001 C CNN
F 1 "GND" H 3750 4080 30  0001 C CNN
F 2 "" H 3750 4150 60  0001 C CNN
F 3 "" H 3750 4150 60  0001 C CNN
	1    3750 4150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR06
U 1 1 4F018A8C
P 2350 5650
F 0 "#PWR06" H 2350 5750 30  0001 C CNN
F 1 "VCC" H 2350 5750 30  0000 C CNN
F 2 "" H 2350 5650 60  0001 C CNN
F 3 "" H 2350 5650 60  0001 C CNN
	1    2350 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 4F018A88
P 3250 6050
F 0 "#PWR07" H 3250 6050 30  0001 C CNN
F 1 "GND" H 3250 5980 30  0001 C CNN
F 2 "" H 3250 6050 60  0001 C CNN
F 3 "" H 3250 6050 60  0001 C CNN
	1    3250 6050
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 4F018A86
P 3550 4050
F 0 "C5" V 3700 4050 50  0000 L CNN
F 1 "100nF" V 3400 4050 50  0000 L CNN
F 2 "0603" H 3550 4050 60  0001 C CNN
F 3 "" H 3550 4050 60  0001 C CNN
	1    3550 4050
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR08
U 1 1 4F018A84
P 3250 4050
F 0 "#PWR08" H 3250 4150 30  0001 C CNN
F 1 "VCC" H 3250 4150 30  0000 C CNN
F 2 "" H 3250 4050 60  0001 C CNN
F 3 "" H 3250 4050 60  0001 C CNN
	1    3250 4050
	1    0    0    -1  
$EndComp
Text GLabel 2100 4650 0    60   Input ~ 0
SDA
Text GLabel 2100 4550 0    60   Input ~ 0
SCL
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2015.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
NoConn ~ 2250 1700
$Comp
L GND #PWR09
U 1 1 4CE29748
P 3850 3300
F 0 "#PWR09" H 3850 3300 30  0001 C CNN
F 1 "GND" H 3850 3230 30  0001 C CNN
F 2 "" H 3850 3300 60  0001 C CNN
F 3 "" H 3850 3300 60  0001 C CNN
	1    3850 3300
	1    0    0    -1  
$EndComp
NoConn ~ 3400 3350
$Comp
L DRILL U4
U 1 1 4C6050A5
P 10650 6150
F 0 "U4" H 10700 6200 60  0001 C CNN
F 1 "DRILL" H 10650 6150 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6150 60  0001 C CNN
F 3 "" H 10650 6150 60  0001 C CNN
	1    10650 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C6050A2
P 10650 6350
F 0 "U5" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0001 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U7
U 1 1 4C60509F
P 11000 6350
F 0 "U7" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 4C605099
P 11000 6150
F 0 "U6" H 11050 6200 60  0001 C CNN
F 1 "DRILL" H 11000 6150 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6150 60  0001 C CNN
F 3 "" H 11000 6150 60  0001 C CNN
	1    11000 6150
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 4C5FD6ED
P 3650 3150
F 0 "C6" V 3800 3150 50  0000 L CNN
F 1 "100nF" V 3500 3150 50  0000 L CNN
F 2 "0603" H 3650 3150 60  0001 C CNN
F 3 "" H 3650 3150 60  0001 C CNN
	1    3650 3150
	0    -1   -1   0   
$EndComp
Text GLabel 3850 3550 2    60   Input ~ 0
SDA
Text GLabel 3850 3450 2    60   Input ~ 0
SCL
Text GLabel 2600 2100 2    60   Output ~ 0
SDA
Text GLabel 2600 2000 2    60   Output ~ 0
SCL
$Comp
L VCC #PWR010
U 1 1 4C5FD35E
P 4250 3850
F 0 "#PWR010" H 4250 3950 30  0001 C CNN
F 1 "VCC" H 4250 3950 30  0000 C CNN
F 2 "" H 4250 3850 60  0001 C CNN
F 3 "" H 4250 3850 60  0001 C CNN
	1    4250 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 4C5FD34E
P 2500 3650
F 0 "#PWR011" H 2500 3650 30  0001 C CNN
F 1 "GND" H 2500 3580 30  0001 C CNN
F 2 "" H 2500 3650 60  0001 C CNN
F 3 "" H 2500 3650 60  0001 C CNN
	1    2500 3650
	1    0    0    -1  
$EndComp
$Comp
L CAT24C U1
U 1 1 4C5FD337
P 3000 3650
F 0 "U1" H 2850 4150 60  0000 C CNN
F 1 "M24C64" H 3000 3650 60  0000 C CNN
F 2 "SOIC8" H 3000 3650 60  0001 C CNN
F 3 "" H 3000 3650 60  0001 C CNN
	1    3000 3650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 4C5FCFB4
P 3450 1150
F 0 "#PWR012" H 3450 1250 30  0001 C CNN
F 1 "VCC" H 3450 1250 30  0000 C CNN
F 2 "" H 3450 1150 60  0001 C CNN
F 3 "" H 3450 1150 60  0001 C CNN
	1    3450 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 4C5FCF5E
P 3100 1900
F 0 "#PWR013" H 3100 1900 30  0001 C CNN
F 1 "GND" H 3100 1830 30  0001 C CNN
F 2 "" H 3100 1900 60  0001 C CNN
F 3 "" H 3100 1900 60  0001 C CNN
	1    3100 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 4C5FCF4F
P 1800 2850
F 0 "#PWR014" H 1800 2850 30  0001 C CNN
F 1 "GND" H 1800 2780 30  0001 C CNN
F 2 "" H 1800 2850 60  0001 C CNN
F 3 "" H 1800 2850 60  0001 C CNN
	1    1800 2850
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 4C5FCF27
P 1800 2150
F 0 "P1" H 1550 2700 60  0000 C CNN
F 1 "CON-SENSOR" V 1950 2150 60  0000 C CNN
F 2 "CON-SENSOR" H 1800 2150 60  0001 C CNN
F 3 "" H 1800 2150 60  0001 C CNN
	1    1800 2150
	-1   0    0    -1  
$EndComp
$Comp
L MAX232 U3
U 1 1 54F73E90
P 6000 4600
F 0 "U3" H 6000 5450 70  0000 C CNN
F 1 "SP3232EBCN" H 6000 3750 70  0000 C CNN
F 2 "SOIC16" H 6000 4600 60  0001 C CNN
F 3 "" H 6000 4600 60  0000 C CNN
	1    6000 4600
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 54F73F51
P 5250 4100
F 0 "C7" V 5400 4100 50  0000 L CNN
F 1 "100nF" V 5100 4100 50  0000 L CNN
F 2 "0603" H 5250 4100 60  0001 C CNN
F 3 "" H 5250 4100 60  0001 C CNN
	1    5250 4100
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 54F74048
P 5250 4600
F 0 "C8" V 5400 4600 50  0000 L CNN
F 1 "100nF" V 5100 4600 50  0000 L CNN
F 2 "0603" H 5250 4600 60  0001 C CNN
F 3 "" H 5250 4600 60  0001 C CNN
	1    5250 4600
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 54F74216
P 7050 4300
F 0 "C10" V 7200 4300 50  0000 L CNN
F 1 "100nF" V 6900 4300 50  0000 L CNN
F 2 "0603" H 7050 4300 60  0001 C CNN
F 3 "" H 7050 4300 60  0001 C CNN
	1    7050 4300
	0    1    1    0   
$EndComp
$Comp
L C C11
U 1 1 54F742C7
P 7050 4800
F 0 "C11" V 7200 4800 50  0000 L CNN
F 1 "100nF" V 6900 4800 50  0000 L CNN
F 2 "0603" H 7050 4800 60  0001 C CNN
F 3 "" H 7050 4800 60  0001 C CNN
	1    7050 4800
	0    1    1    0   
$EndComp
$Comp
L C C9
U 1 1 54F7433F
P 7050 3900
F 0 "C9" V 7200 3900 50  0000 L CNN
F 1 "100nF" V 6900 3900 50  0000 L CNN
F 2 "0603" H 7050 3900 60  0001 C CNN
F 3 "" H 7050 3900 60  0001 C CNN
	1    7050 3900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR015
U 1 1 54F74411
P 7250 4850
F 0 "#PWR015" H 7250 4850 30  0001 C CNN
F 1 "GND" H 7250 4780 30  0001 C CNN
F 2 "" H 7250 4850 60  0001 C CNN
F 3 "" H 7250 4850 60  0001 C CNN
	1    7250 4850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR016
U 1 1 54F746EE
P 6750 3800
F 0 "#PWR016" H 6750 3900 30  0001 C CNN
F 1 "VCC" H 6750 3900 30  0000 C CNN
F 2 "" H 6750 3800 60  0001 C CNN
F 3 "" H 6750 3800 60  0001 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_5 P2
U 1 1 54F74CD7
P 9450 4950
F 0 "P2" V 9400 4950 50  0000 C CNN
F 1 "CONN_5" V 9500 4950 50  0000 C CNN
F 2 "AKL_5_5" H 9450 4950 60  0001 C CNN
F 3 "" H 9450 4950 60  0000 C CNN
	1    9450 4950
	1    0    0    1   
$EndComp
$Comp
L DB9 J1
U 1 1 54F75050
P 9550 3750
F 0 "J1" H 9550 4300 70  0000 C CNN
F 1 "DB9" H 9550 3200 70  0000 C CNN
F 2 "SUB09-EU" H 9550 3750 60  0001 C CNN
F 3 "" H 9550 3750 60  0000 C CNN
	1    9550 3750
	1    0    0    1   
$EndComp
Text Notes 9900 3800 0    60   ~ 0
TX 3->3\nRX 2->4\nRTS 7->8\nCTS 8->7\nGND 5->1
$Comp
L GND #PWR017
U 1 1 54F75747
P 8900 3450
F 0 "#PWR017" H 8900 3450 30  0001 C CNN
F 1 "GND" H 8900 3380 30  0001 C CNN
F 2 "" H 8900 3450 60  0001 C CNN
F 3 "" H 8900 3450 60  0001 C CNN
	1    8900 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 54F75907
P 8950 5300
F 0 "#PWR018" H 8950 5300 30  0001 C CNN
F 1 "GND" H 8950 5230 30  0001 C CNN
F 2 "" H 8950 5300 60  0001 C CNN
F 3 "" H 8950 5300 60  0001 C CNN
	1    8950 5300
	1    0    0    -1  
$EndComp
NoConn ~ 9100 4050
NoConn ~ 9100 4150
NoConn ~ 9100 3550
NoConn ~ 9100 3450
Text Notes 9900 5200 0    60   ~ 0
TX 1\nRX 2\nRTS 3\nCTS 4\nGND 5
$Comp
L FILTER FB1
U 1 1 54F7633D
P 2850 1150
F 0 "FB1" H 2850 1300 60  0000 C CNN
F 1 "FILTER" H 2850 1050 60  0000 C CNN
F 2 "0603" H 2850 1150 60  0001 C CNN
F 3 "" H 2850 1150 60  0000 C CNN
	1    2850 1150
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 54F764A0
P 2850 1800
F 0 "R3" V 2930 1800 50  0000 C CNN
F 1 "0" V 2850 1800 50  0000 C CNN
F 2 "0603" H 2850 1800 60  0001 C CNN
F 3 "" H 2850 1800 60  0001 C CNN
	1    2850 1800
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 54F76B96
P 2500 1400
F 0 "C3" V 2600 1550 50  0000 L CNN
F 1 "100nF" V 2350 1400 50  0000 L CNN
F 2 "0603" H 2500 1400 60  0001 C CNN
F 3 "" H 2500 1400 60  0001 C CNN
	1    2500 1400
	-1   0    0    1   
$EndComp
$Comp
L C C4
U 1 1 54F77AA5
P 3250 1400
F 0 "C4" V 3350 1550 50  0000 L CNN
F 1 "100nF" V 3100 1400 50  0000 L CNN
F 2 "0603" H 3250 1400 60  0001 C CNN
F 3 "" H 3250 1400 60  0001 C CNN
	1    3250 1400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 54F77AEA
P 3250 1650
F 0 "#PWR019" H 3250 1650 30  0001 C CNN
F 1 "GND" H 3250 1580 30  0001 C CNN
F 2 "" H 3250 1650 60  0001 C CNN
F 3 "" H 3250 1650 60  0001 C CNN
	1    3250 1650
	1    0    0    -1  
$EndComp
NoConn ~ 2550 4750
$Comp
L CONN_5 P3
U 1 1 54F77C76
P 4600 3450
F 0 "P3" V 4550 3450 50  0000 C CNN
F 1 "CONN_5" V 4650 3450 50  0000 C CNN
F 2 "pin_array_5x1" H 4600 3450 60  0001 C CNN
F 3 "" H 4600 3450 60  0000 C CNN
	1    4600 3450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR020
U 1 1 54F7824F
P 4500 3950
F 0 "#PWR020" H 4500 3950 30  0001 C CNN
F 1 "GND" H 4500 3880 30  0001 C CNN
F 2 "" H 4500 3950 60  0001 C CNN
F 3 "" H 4500 3950 60  0001 C CNN
	1    4500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5900 1500 5900
Connection ~ 2100 5600
Wire Wire Line
	2100 5500 2100 5900
Wire Wire Line
	2100 6400 2100 6300
Wire Wire Line
	2100 5500 2550 5500
Wire Wire Line
	3350 4050 3250 4050
Wire Wire Line
	2350 5650 2550 5650
Wire Wire Line
	2100 4550 2550 4550
Wire Wire Line
	3400 3250 3400 3150
Wire Wire Line
	3400 3450 3850 3450
Wire Wire Line
	2250 2100 2600 2100
Connection ~ 2500 3550
Wire Wire Line
	2500 3350 2600 3350
Wire Wire Line
	2600 3450 2400 3450
Wire Wire Line
	2250 2200 2400 2200
Wire Wire Line
	1800 2850 1800 2750
Wire Wire Line
	2600 3550 2500 3550
Wire Wire Line
	2500 3650 2500 3250
Wire Wire Line
	2500 3250 2600 3250
Connection ~ 2500 3350
Wire Wire Line
	2250 2000 2600 2000
Wire Wire Line
	3400 3550 3850 3550
Wire Wire Line
	3850 3300 3850 3150
Wire Wire Line
	3400 3150 3450 3150
Connection ~ 3400 3150
Wire Wire Line
	2400 2200 2400 4850
Wire Wire Line
	2400 4850 2550 4850
Connection ~ 2400 3450
Wire Wire Line
	2550 4650 2100 4650
Wire Wire Line
	3250 5850 3250 6050
Wire Wire Line
	3250 4050 3250 4150
Wire Wire Line
	3750 4050 3750 4150
Wire Wire Line
	2550 5400 1500 5400
Wire Wire Line
	2100 5900 2050 5900
Wire Wire Line
	1500 5400 1500 5900
Connection ~ 1500 5600
Wire Wire Line
	1500 6300 1500 6400
Wire Wire Line
	2350 2300 2350 5200
Wire Wire Line
	1700 3850 1700 3750
Wire Wire Line
	2550 5000 2550 4950
Wire Wire Line
	5250 3900 5400 3900
Wire Wire Line
	5400 4300 5250 4300
Wire Wire Line
	5250 4400 5400 4400
Wire Wire Line
	5400 4800 5250 4800
Wire Wire Line
	6600 4500 7250 4500
Wire Wire Line
	7250 3900 7250 4850
Connection ~ 7250 4500
Connection ~ 7250 4300
Wire Wire Line
	6600 3900 6850 3900
Wire Wire Line
	6600 4300 6850 4300
Wire Wire Line
	6600 4800 6850 4800
Wire Wire Line
	6750 3800 6750 3900
Connection ~ 6750 3900
Connection ~ 7250 4800
Connection ~ 3250 4050
Wire Wire Line
	3900 4350 4600 4350
Wire Wire Line
	4600 3850 4600 5000
Wire Wire Line
	4600 5000 5400 5000
Wire Wire Line
	3900 4450 4700 4450
Wire Wire Line
	3900 5400 4250 5400
Wire Wire Line
	4250 5400 4250 5100
Wire Wire Line
	4250 5100 5400 5100
Wire Wire Line
	3900 5500 4350 5500
Wire Wire Line
	4350 5500 4350 5300
Wire Wire Line
	6600 5000 8000 5000
Wire Wire Line
	8000 5000 8000 3750
Wire Wire Line
	8000 3750 9100 3750
Wire Wire Line
	6600 5200 8200 5200
Wire Wire Line
	8200 5200 8200 3950
Wire Wire Line
	8200 3950 9100 3950
Wire Wire Line
	6600 5100 8100 5100
Wire Wire Line
	8100 5100 8100 3850
Wire Wire Line
	8100 3850 9100 3850
Wire Wire Line
	6600 5300 7900 5300
Wire Wire Line
	7900 5300 7900 3650
Wire Wire Line
	7900 3650 9100 3650
Wire Wire Line
	9100 3350 8900 3350
Wire Wire Line
	8900 3350 8900 3450
Wire Wire Line
	9050 5150 8950 5150
Wire Wire Line
	8950 5150 8950 5300
Wire Wire Line
	9050 4750 8900 4750
Wire Wire Line
	8900 4750 8900 3750
Connection ~ 8900 3750
Wire Wire Line
	9050 4850 8800 4850
Wire Wire Line
	8800 4850 8800 3950
Connection ~ 8800 3950
Wire Wire Line
	9050 4950 8700 4950
Wire Wire Line
	8700 4950 8700 3850
Connection ~ 8700 3850
Wire Wire Line
	9050 5050 8600 5050
Wire Wire Line
	8600 5050 8600 3650
Connection ~ 8600 3650
Wire Wire Line
	2250 1800 2600 1800
Wire Wire Line
	2350 1150 2500 1150
Wire Wire Line
	2250 1900 2350 1900
Wire Wire Line
	3100 1800 3100 1900
Wire Wire Line
	3200 1150 3450 1150
Wire Wire Line
	2350 1900 2350 1150
Wire Wire Line
	3250 1650 3250 1600
Wire Wire Line
	2500 1150 2500 1200
Wire Wire Line
	3250 1200 3250 1150
Connection ~ 3250 1150
Connection ~ 2500 1150
Wire Wire Line
	2350 5200 2550 5200
Wire Wire Line
	2550 4350 2300 4350
Wire Wire Line
	2300 4350 2300 2400
Wire Wire Line
	2300 2400 2250 2400
Wire Wire Line
	2200 3850 2300 3850
Connection ~ 2300 3850
Wire Wire Line
	2250 2300 2350 2300
Wire Wire Line
	2500 1800 2500 1600
Connection ~ 2500 1800
Wire Wire Line
	4500 3950 4500 3850
Wire Wire Line
	4400 3850 4250 3850
Wire Wire Line
	4350 5300 5400 5300
Connection ~ 4600 4350
Wire Wire Line
	4700 4450 4700 3850
Wire Wire Line
	4800 3850 4800 5200
Wire Wire Line
	4800 5200 5400 5200
$Comp
L VCC #PWR?
U 1 1 55115BDB
P 3400 3150
F 0 "#PWR?" H 3400 3250 30  0001 C CNN
F 1 "VCC" H 3400 3250 30  0000 C CNN
F 2 "" H 3400 3150 60  0001 C CNN
F 3 "" H 3400 3150 60  0001 C CNN
	1    3400 3150
	1    0    0    -1  
$EndComp
NoConn ~ 2250 2500
NoConn ~ 2250 2600
$EndSCHEMATC
