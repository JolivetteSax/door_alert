#!/bin/bash

# 5 min door prop wait time
sleep 300

cat phone_numbers.txt | while read line ; do
    ./send_sms.sh $line
done

exit 0
