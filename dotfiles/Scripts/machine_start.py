#!/usr/bin/python

''' This is going to act like the machine startup'''
import os
import time
import sys

def print_intro(string):
	for character in string:
		sys.stdout.write(str(character))
		sys.stdout.flush()
		time.sleep(0.025)

def printf(string):
        for character in string:
                sys.stdout.write(str(character))
                sys.stdout.flush()
                time.sleep(0.001)

def print_slow(string):
        for character in string:
                sys.stdout.write(str(character))
                sys.stdout.flush()
                time.sleep(1.0)


def print_array(a_1,b_1,a_2,b_2,a_3,b_3):
        printf("\
00:50:C2:" + str(a_1) + ":" + str(b_1) + ":00/36  \
00:50:C2:" + str(a_2) + ":" + str(b_2) + ":00/36  \
00:50:C2:" + str(a_3) + ":" + str(b_3) + ":00/36  \
        \n")

os.system("clear")

print_intro("\033[93m[!]\033[0m:./action.SYSTEM.REBOOT\n\n")

time.sleep(0.5)

print_intro("\033[93m[!]\033[0m::./initiating.DEBUG.MODE\n\n")

time.sleep(1.0)

print("./check.BOOT")

for i in range(23):
	printf("  [<00000" + str(i) + "n0>] b.group_block" + str(i) + "\n")

printf("\n./check.OPERATORS\n")

printf("\n  [<var.Mserv_read>]\n")

printf("\t./read_OPERATORS_ALL\t--!\n")

printf("\t./load_OPERATORS_ALL\t--!\n")

printf("\n\t  [<sub.Mserv_load>]\n")

printf("\t\t/array_00001-03000\n")

printf("\t\t/array_03001-06000\n")

for i in range(1,4):
	printf("\t\t+ /S.array_m80009." + str(i) + "10\n")

printf("\n  =array_ALL\n")

printf("\n  [\n")

print_array("00","00","00","10","00","20")
print_array("00","30","00","40","00","50")
print_array("00","60","00","70","00","80")
print_array("00","A0","00","B0","00","C0")
print_array("00","E0","00","F0","00","00")
print_array("01","10","01","20","01","30")
print_array("01","40","01","50","01","60")
print_array("01","70","01","80","01","90")
print_array("01","A0","01","B0","01","D0")
print_array("01","E0","02","00","02","30")
print_array("01","10","01","20","01","30")
print_array("01","40","01","50","01","60")
print_array("01","70","01","80","01","90")
print_array("01","A0","01","B0","01","D0")
print_array("01","E0","02","00","02","30")

printf("]\n")

printf("  =S.array_ALL\n")

printf("\n  [\n")

print_array("02","40","0C","00","0C","20")
print_array("0C","40","0C","60","0C","80")
print_array("02","40","0C","00","0C","20")
print_array("0C","40","0C","60","0C","80")
print_array("01","10","01","20","01","30")
print_array("01","40","01","50","01","60")
print_array("01","70","01","80","01","90")
print_array("01","A0","01","B0","01","D0")
print_array("00","E0","00","F0","01","00")
print_array("01","10","01","20","01","30")
print_array("01","40","01","50","01","60")
print_array("01","70","01","80","01","90")

printf("]\n")


printf("./check.ASSETS\n\n")

printf("./load.OPERATIONS\n\n")

printf("01010001011101010110100101110011001000000110001101110101011100\n")
printf("11011101000110111101100100011010010110010101110100001000000110\n")
printf("10010111000001110011011011110111001100100000011000110111010101\n")
printf("1100110111010001101111011001000110010101110011\n")

os.system("clear")

printf("\033[93m[!]\033[0m:./initializing.SYSTEM.RECOVERY")

time.sleep(1.5)

os.system("clear")

for i in range(0,2):
	printf("SEEKING ADMIN")
	print_slow(" ...")
	os.system("clear")
