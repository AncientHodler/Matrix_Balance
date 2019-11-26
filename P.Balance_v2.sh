#!/bin/bash
echo ""
echo $(date)

CL_NO=''                                                                        #How many addresses should be drained - enter between quotes
Bench=''                                                                        #Name of the container image that runs the gman - enter between  quotes

#Personal Addresses to be drained, address zero is where all funds are transfered (drained)
MAN0=''

MAN1=''
MAN2=''
MAN3=''
MAN4=''
MAN5=''
MAN6=''
MAN7=''
MAN8=''
MAN9=''
MAN10=''
MAN11=''
MAN12=''
MAN13=''
MAN14=''
MAN15=''
MAN16=''
MAN17=''
MAN18=''
MAN19=''
MAN20=''
MAN21=''
MAN22=''
MAN23=''
MAN24=''
MAN25=''
MAN26=''
MAN27=''
MAN28=''
MAN29=''
MAN30=''
MAN31=''
MAN32=''
MAN33=''
MAN34=''
MAN35=''
MAN36=''
MAN37=''
MAN38=''
MAN39=''
MAN40=''
MAN41=''
MAN42=''
MAN43=''
MAN44=''
MAN45=''
MAN46=''
MAN47=''
MAN48=''
MAN49=''
MAN50=''
MAN51=''
MAN52=''
MAN53=''
MAN54=''
MAN55=''
MAN56=''
MAN57=''
MAN58=''
MAN59=''
MAN60=''
MAN61=''
MAN62=''
MAN63=''
MAN64=''
MAN65=''
MAN66=''
MAN67=''
MAN68=''
MAN69=''
MAN70=''
MAN71=''
MAN72=''
MAN73=''
MAN74=''
MAN75=''
MAN76=''
MAN77=''
MAN78=''
MAN79=''
MAN80=''
MAN81=''
MAN82=''
MAN83=''
MAN84=''
MAN85=''
MAN86=''
MAN87=''
MAN88=''
MAN89=''
MAN90=''
MAN91=''
MAN92=''
MAN93=''
MAN94=''
MAN95=''
MAN96=''
MAN97=''
MAN98=''
MAN99=''
MAN100=''

B1='Balances.big'
B2='Balances.small'
B3='Stake.big'
B4='Stake.small'

if [ -a $B1 ]; then
  rm $B1
fi

if [ -a $B2 ]; then
  rm $B2
fi

if [ -a $B3 ]; then
  rm $B3
fi

if [ -a $B4 ]; then
  rm $B4
fi

touch $B1
touch $B2
touch $B3
touch $B4

for ((i=0;i<=CL_NO;i++))
do
    WalletA="MAN$i"

    echo "Reading FRE "$i"/"$CL_NO": "${!WalletA}
    Raw_Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6)
    E_TEST=$(sed 's|[^e]||g' <<< "$Raw_Free")
    if [ "$E_TEST" == "e" ]; then
      Free_Raw_Last2=$(sed -r 's|.*(.{2})|\1|' <<< "$Raw_Free")
      if [ "$Free_Raw_Last2" == "21" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{4\}\)|\1.|' )
        echo "$Free" >> Balances.big
      elif [ "$Free_Raw_Last2" == "22" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{5\}\)|\1.|' )
        echo "$Free" >> Balances.big
      elif [ "$Free_Raw_Last2" == "23" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{6\}\)|\1.|' )
        echo "$Free" >> Balances.big
      elif [ "$Free_Raw_Last2" == "24" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{7\}\)|\1.|' )
        echo "$Free" >> Balances.big
      elif [ "$Free_Raw_Last2" == "25" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{8\}\)|\1.|' )
        echo "$Free" >> Balances.big
      elif [ "$Free_Raw_Last2" == "26" ]; then
        Free=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{9\}\)|\1.|' )
        echo "$Free" >> Balances.big
      fi
    else
      echo "$Raw_Free" >> Balances.small
    fi

    if [ "$i" != 0 ]; then
    echo "Reading STK "$i"/"$CL_NO": "${!WalletA}
    Raw_Deposit=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' )
    E_TEST2=$(sed 's|[^e]||g' <<< "$Raw_Deposit")
    if [ "$E_TEST2" == "e" ]; then
      Deposit_last2=$(sed -r 's|.*(.{2})|\1|' <<< "$Raw_Deposit")
      if [ "$Deposit_last2" == "21" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{4\}\)|\1.|')
        echo "$Stake" >> Stake.big
      elif [ "$Deposit_last2" == "22" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{5\}\)|\1.|')
        #echo "Stake curatit este $Stake"
        echo "$Stake" >> Stake.big
      elif [ "$Deposit_last2" == "23" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{6\}\)|\1.|')
        echo "$Stake" >> Stake.big
      elif [ "$Deposit_last2" == "24" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{7\}\)|\1.|')
        echo "$Stake" >> Stake.big
      elif [ "$Deposit_last2" == "25" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{8\}\)|\1.|')
        echo "$Stake" >> Stake.big
      elif [ "$Deposit_last2" == "26" ]; then
        Stake=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getDeposit\(\)' | grep -A 1 "${!WalletA}" | grep Deposit | sed 's|^.*Deposit: ||' | sed 's|.$||' | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{9\}\)|\1.|')
        echo "$Stake" >> Stake.big
      fi
    else
      echo "$Raw_Deposit" >> Stake.small
    fi
  fi
  echo ""
done

echo "Read amounts are as follow: "
echo ""
sudo ./P.PythonAdder_v2.py
echo $(date)
echo ""
