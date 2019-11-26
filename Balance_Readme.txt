A)Description:
This Script works by leveraging Disarmm's dockerized gman (which runs through a container), to display the values in MAN held by your wallets.
It reads the total value accumulated in Stake, as well as the Free Values of MAN earned by mining.

It can display them both, but also adds them and tells you how much you need for the next mining node.
The script is free to use. No donations are incurred for using it.

B)Requirements:
--Disarmms containerized gman working and running, with the node synced

C)What you need to add to the script in order to make it actually work
C1)Fill in the addresses.
  --MAN0 is the draining address used in the Drainer script. As such, the script will only read Free MAN values from it.
    If address MAN0 has staked MAN, it wont read it.
    Fill the MAN0 address on line 9; If you leave it empty, the PythonAdder will return an error
    If you dont have a draining address, you need to use an empty address for MAN0.
  --Addresses from 1 to 100 are the Miner addresses. From these addresses both staked MAN and free MAN will be read.
    Fill the Miner addresses from line 11 to 110.
C2)Specify their number, variable CL_NO, line 5
C3)Specify the name of the container running gman, that will do the heavy lifting
    Variable Bench, line 6

Custom P.PythonAdder_v2.py modification.
P.PythonAdder_v2.py is used to add up the read values, and do the math calculations using Decimal.
The main bash script reads the values through gman IPC, and transfers them in Python for the math processing.

1)Removing the # from line 22 would display the staked values of the read wallets.
The displaying of the staked values is off by default, but you can enable it this way

The python script assumes all the MAN on the read addresses is yours.
That is way a single user, User1 is wrote in line this:


<<<PythonCODE
User1 = Decimal("1")

MAN_User1 = Decimal(Grand_Total * User1).quantize(MatrixPrecision, rounding=ROUND_UP)

print ("User1 has:")
print(MAN_User1)
>>>PythonCODE

However, if you hold MAN for yourself, and lets say for your two sisters, you can use python to display individual values like This:
As you can see, Brother + Sister1 + Sister2 must equal exactly 1

<<<PythonCODE
Brother = Decimal("0.27995631591497324956")
Sister1 = Decimal("0.17354543653554534533")
Sister2 = 1 - (Brother + Sister1)


MAN_Brother = Decimal(Grand_Total * Brother).quantize(MatrixPrecision, rounding=ROUND_UP)
MAN_Sister1 = Decimal(Grand_Total * Sister1).quantize(MatrixPrecision, rounding=ROUND_UP)
MAN_Sister2 = Decimal(Grand_Total * Sister2).quantize(MatrixPrecision, rounding=ROUND_UP)

print ("Brother has:")
print(MAN_Brother)

print ("Sister1 has:")
print(MAN_Sister1)

print ("Sister2 has:")
print(MAN_Sister2)

>>>PythonCODE

HISTORY
=======
P.Balance_v2
First version
=======

Copyright AncientHodler
