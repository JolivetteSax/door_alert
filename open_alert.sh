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

# TODO Check time of day
cat phone_numbers.txt | while read line ; do
    ./send_sms.sh $line
done
