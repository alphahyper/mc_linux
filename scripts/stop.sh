#!/bin/bash

#countdowns & stops the Minecraft server
#(screen -S Minecraft -X stuff) makes everything in quotes execute in console screen (Also ^M = ENTER)

#60 second reminder
screen -S Minecraft -X stuff "echo say restarting in 60 seconds^M"
sleep 50
#10 second reminder
screen -S Minecraft -X stuff "echo say restarting in 10 seconds"
sleep 5
#5 second countdown
screen -S Minecraft -X stuff "echo say restarting in:^M"
screen -S Minecraft -X stuff "echo say 5^M"
sleep 1
screen -S Minecraft -X stuff "echo say 4^M"
sleep 1
screen -S Minecraft -X stuff "echo say 3^M"
sleep 1
screen -S Minecraft -X stuff "echo say 2^M"
sleep 1 
screen -S Minecraft -X stuff "echo say 1^M"
sleep 1
#stops the server
screen -S Minecraft -X stuff "echo stop^M"
