#!/bin/bash

echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

while true; do 
    trap 'echo "4" > /sys/class/gpio/unexport' 0
    stat=`cat /sys/class/gpio/gpio4/value`
    echo "status is $stat"
done
exit 0

