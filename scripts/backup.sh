#!/bin/bash

#This backups up world file and deletes them periodically

#changes directory to backups
cd ~/Minecraft
#finds and adds the number of daily backups made (counter)
dailyCounter=$(cat backups/daily/counter)
let dailyCounter++
#updates counter file
echo $dailyCounter > backups/daily/counter
#uses temp variable for formating of file name (this variable will format all file names)
tempFormat=$(printf "%05d" $dailyCounter)
#finds date and sets it as a variable
day=$(date +"%m.%d.%y")
#creates daily backup folder (counter_d-m-y)
mkdir backups/daily/$tempFormat'-'$day
#backups data into new folder
cp -r world world_nether world_the_end backups/daily/$tempFormat'-'$day

#deletes the backup 14 days ago
#creates a variable of the counter 14 days ago
dailyDeletion=$((dailyCounter - 14))
#uses temp variable for formating of file name (this variable will format all file names)
tempFormat=$(printf "%05d" $dailyDeletion)
#deletes the backup
rm -r backups/daily/$tempFormat*


#checks if it is Monday

#if true, backups into weekly folder & deletes the backup 4 weeks ago

#checks if it is the 1st of a month

#if true, backups into monthly folder
