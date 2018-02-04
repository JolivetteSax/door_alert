#!/bin/bash

echo gpio | sudo tee /sys/class/leds/led1/trigger

# Flash the red light to indicate system is working
echo 0 | sudo tee /sys/class/leds/led1/brightness
sleep .05
echo 1 | sudo tee /sys/class/leds/led1/brightness
sleep .05
echo 0 | sudo tee /sys/class/leds/led1/brightness
sleep .05
echo 1 | sudo tee /sys/class/leds/led1/brightness
sleep .05
echo 0 | sudo tee /sys/class/leds/led1/brightness
sleep .05

# Switch back to undervolt LED test
echo input | sudo tee /sys/class/leds/led1/trigger

HOUR=`date +%H`
if [ $HOUR -gt 7 ] ; then
  if [ $HOUR -lt 21 ] ; then
    echo "Daytime, no SMS"
    # In order to get alerts at all hours, remove this..
    exit 0;
  fi
fi

#This SMS alert will only be sent if the time is right
cat phone_numbers.txt | while read line ; do
    ./send_sms.sh $line
done
