#!/bin/bash

# Set up the GPIO4 pinout as a readable state device
echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

# When this program quits, it will turn off GPIO4
trap 'echo "4" > /sys/class/gpio/unexport' 0

last=0
while true; do 

    # It's unnecessary to read the state of the pin more often
    sleep .1

    # Get the current state of the pin
    status=`cat /sys/class/gpio/gpio4/value`

    # Has the sensor changed since last checked?
    if [ $last -ne $status ] ; then
      verb="closed"
      time=`date +%T`
      date=`date "+%b %d %Y"`
      if [ $status -eq 1 ] ; then
        verb="opened"
        sudo ./open_alert.sh &> /dev/null &
      fi

      # This script outputs the simplest possible log
      echo "Door $verb at $time on $date"

      # update state for the next time through the loop
      last=$status

    fi
done
exit 0
