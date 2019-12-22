#!/bin/sh

export FIRMWARE="20191128.bin"

while [ true ]; do
ping -c 3 192.168.1.1
if [ "$(echo $?)" -ne "0" ];then
    echo "\n\n\nERROR !!!"
    sleep 1
    continue
else
    break
fi
done

curl 192.168.1.1 | grep "Breed Web"

if [ "$(echo $?)" -ne "0" ];then
    echo "\n\n\nERROR !!!"
    echo "Breed Not Found\n\n\n"
    sleep 1
    exit
fi

if [ ! -f ${FIRMWARE} ]; then
    echo "\n\n\nERROR !!!"
    echo "Firmware Not Found\n\n\n"
    sleep 1
    exit
fi

curl -L -i -X POST -H "Content-Type: multipart/form-data" -F autoreboot=1 -F boot_file= -F eeprom_file= -F flash_layout=reference -F fw_check=1 -F fw_file=@${FIRMWARE} -F fw_type=generic -F submit=Upload http://192.168.1.1/upload.html

sleep 1

curl -L -i -X POST -H "Content-Type: multipart/form-data" -F autoreboot=1 -F boot_file= -F eeprom_file= -F flash_layout=reference -F fw_check=1 -F fw_file=@${FIRMWARE} -F fw_type=generic -F submit=Upload http://192.168.1.1/upload.html -L -X GET http://192.168.1.1/upgrading.html | grep upgrade_query


if [ "$(echo $?)" -ne "0" ];then
    echo "\n\n\nERROR !!!"
    echo "Upload Fail\n\n\n"
    exit
fi

echo "\n\n\nRebooting ... "
echo "\n\n\n"

while true; do
    echo "\n\n\nchecking breed ..."
    ping -c 1 192.168.1.1
    if [ "$(echo $?)" -ne "0" ];then
        echo "\n\n\nRebooted"
        echo "Change New Booard\n\n\n"
        echo "======================== OK ===========================\n\n\n\n\n"
        ( speaker-test -t sine -f 1000 )& pid=$! ; sleep 2s ; kill -9 $pid 
        sleep 3
        exit
    fi
    sleep 1
done
