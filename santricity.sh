#!/bin/bash

server=$2
login=CHANGEME
pass=CHANGEME

declare -a array
array=([1]=IP01 [2]=IP02 [3]=IP03 [4]=IP04 [5]=IP05 [6]=IP06)

while getopts ":dpfb" opt
    do
        case $opt in

            # Check drive
            d) declare array
               if [[ $server = ${array[1]} ]] || [[ $server = ${array[2]} ]] || [[ $server = ${array[3]} ]] || [[ $server = ${array[4]} ]] || [[ $server = ${array[5]} ]] | [[ $server = ${array[6]} ]]
                   then
                       drive=`sudo /opt/SMgr/client/SMcli $server -p $pass -R $login -c "show allDrives summary;" | grep '\(failure\|Failed\)' | wc -l`
                       if [[ $drive -ge 1 ]];
                           then
                               echo 1
                           else
                               echo 0
                       fi
                   else
                       drive=`sudo /opt/SMgr/client/SMcli $server -c "show allDrives summary;" | grep '\(failure\|Failed\)' | wc -l`
                       if [[ $drive -ge 1 ]];
                           then
                               echo 1
                           else
                               echo 0
                       fi
               fi
            ;;

            # Check PSU
            p) declare array
               if [[ $server = ${array[1]} ]] || [[ $server = ${array[2]} ]] || [[ $server = ${array[3]} ]] || [[ $server = ${array[4]} ]] || [[ $server = ${array[5]} ]] || [[ $server = ${array[6]} ]]
                   then
                       psu=`sudo /opt/SMgr/client/SMcli $server -p $pass -R $login -c "show storageArray;" | grep "Power supply status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
                   else
                       psu=`sudo /opt/SMgr/client/SMcli $server -c "show storageArray;" | grep "Power supply status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
               fi
            ;;

            # Check FAN
            f) declare array
               if [[ $server = ${array[1]} ]] || [[ $server = ${array[2]} ]] || [[ $server = ${array[3]} ]] || [[ $server = ${array[4]} ]] || [[ $server = ${array[5]} ]] || [[ $server = ${array[6]} ]] 
                   then
                       psu=`sudo /opt/SMgr/client/SMcli $server -p $pass -R $login -c "show storageArray;" | grep "Fan status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
                   else
                       psu=`sudo /opt/SMgr/client/SMcli $server -c "show storageArray;" | grep "Fan status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
               fi
            ;;

            # Check Battery
            b) declare array
               if [[ $server = ${array[1]} ]] || [[ $server = ${array[2]} ]] || [[ $server = ${array[3]} ]] || [[ $server = ${array[4]} ]] || [[ $server = ${array[5]} ]] || [[ $server = ${array[6]} ]]
                   then
                       psu=`sudo /opt/SMgr/client/SMcli $server -p $pass -R $login -c "show storageArray;" | grep "Battery status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
                   else
                       psu=`sudo /opt/SMgr/client/SMcli $server -c "show storageArray;" | grep "Battery status" | grep Failed | wc -l`
                       if [[ $psu -ge 1 ]]
                           then
                               echo 1
                           else
                               echo 0
                       fi
               fi
            ;;

        esac
    done
