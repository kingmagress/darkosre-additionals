#!/bin/bash

#Ensure we can write to the LED gpio77
sudo chmod 777 /sys/class/gpio/export
echo 77 > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio77/direction
sudo echo out > /sys/class/gpio/gpio77/direction
sudo chmod 777 /sys/class/gpio/gpio77/value

#Set the LED color to red.
echo 1 > /sys/class/gpio/gpio77/value

#Change the battery life warning script to accomodate for this change
sudo cp -f -v /usr/local/bin/batt_life_warning.py.red /usr/local/bin/batt_life_warning.py
sudo systemctl daemon-reload
sudo systemctl restart batt_led

printf "\033c" >> /dev/tty1
sudo systemctl restart emulationstation