#!/usr/bin/env python3
from decimal import *

MatrixPrecision = Decimal(10) ** -18

def ReadTXT(x):

# citit fisier intro lista de stringuri
    with open(x, 'r') as filehandle:
        list_string = [line.rstrip('\n') for line in open(x)]

# decimalizat list
    list_decimal = []
    for i in list_string:
        list_decimal.append(Decimal(i))
    return list_decimal

def sum_list(items):
    sum_numbers = 0
    #print ("Amounts above 1000 MAN are:")
    for x in items:
        #print (x)
        sum_numbers += x
    return sum_numbers

def sum_list_small(items):
    sum_numbers = 0
    #print ("Amounts below 1000 MAN are:")
    for x in items:
        x = x / (Decimal(10) ** 18)
        print (x)
        sum_numbers += x
    return sum_numbers

print("---------FREE MAN---------")
Free_Big = ReadTXT("Balances.big")
Summ_Free_Big = sum_list(Free_Big)
Free_Small = ReadTXT("Balances.small")
Summ_Free_Small= sum_list_small(Free_Small)
Total_Free = Summ_Free_Big + Summ_Free_Small
print ("---")
print ("Summ of total free coins is")
print (Total_Free)
Need = Decimal("10000") - Total_Free
print ("---")
print("You need this much MAN for the next node:")
print (Need)
print("--------------------------")
print(".")
print("--------STAKED MAN--------")
Stake_Big = ReadTXT("Stake.big")
Summ_Stake_Big = sum_list(Stake_Big)
Stake_Small = ReadTXT("Stake.small")
Summ_Stake_Small = sum_list_small(Stake_Small)
Total_Stake = Summ_Stake_Big + Summ_Stake_Small
Nodes = len(Stake_Big) + len(Stake_Small)
NXT = Nodes+1
Profit = Total_Stake - Nodes * 10000
print ("---")
print ("Summ of total staked coins is")
print (Total_Stake)
print ("---")
print ("Stake Profit is")
print(Profit)
print ("Next node number is")
print (NXT)
print("--------------------------")
print(".")
print ("----------TOTAL----------")
Grand_Total = Total_Free + Total_Stake
print(Grand_Total)


User1 = Decimal("1")

MAN_User1 = Decimal(Grand_Total * User1).quantize(MatrixPrecision, rounding=ROUND_UP)

print ("User1 has:")
print(MAN_User1)

print ("----------TOTAL----------")
