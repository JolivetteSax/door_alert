#!/bin/bash

echo "starting"
cd ~
cd door_alert

if [ -f log.txt ] ; then
  mv log.txt log.backup.txt
fi

sudo ./door_log.sh %> log.txt &
