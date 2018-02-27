# alz_alert

Grammy has begun to wander, and is in danger of getting out on a cold night. 
Even with certain extra locking mechanisms to keep her in, we want to track
when the door opens after certain hours, since we may fail to set a lock or
she may still be able to defeat them.

the send_sms.sh script is not included in the github repository because this
script contains twilio authentication information and consists of nothing else

The raspberrypi3 has a red led that will flash on door open. The General purpose
input output pinouts on the raspberry pi are ideal for reading the state of a 
magnetic door sensor. 

## Hardware list

Raspberry Pi 3 + power cable (a canakit is a useful buy)
Magnetic door/window GPIO project kit
 - breadboard 
 - mag door sensor
 - 3 meters of bell wire
 - resistors and molex connections 
 - manual

## Software

 - gpio_test 
   - initial setup test, verify wiring of sensor before install
 - door_log
   - main program, records log of open/close since last startup
 - open_alert
   - flashes LED and launches sms send for each phone number
 - send_sms
   - You provide - twilio CURL statement with whatever else you want 

## Installing

The open_alert program will look at phone_numbers.txt for a list of recipients

Set up the raspberry pi to connect to your wifi, it will reconnect on startup.

In order to make the PI run the door_alert automatically, edit this file:

.config/lxsession/LXDE-pi/autostart

And add this line to the end of it

```
@/home/pi/door_alert/start_door.sh
```
