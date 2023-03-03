#!/bin/bash

#This backups up world file and deletes them periodically


#changes directory to backups
cd ~/Minecraft

#File Name Generator:
#finds date and sets it as a variable
day=$(date +"%m.%d.%y")
#finds and adds the number of daily backups made (counter)
dailyCounter=$(cat backups/daily/counter)
let dailyCounter++
#updates counter file
echo $dailyCounter > backups/daily/counter
#uses temp variable for formating of file name (this variable will format all file names)
tempFormat=$(printf "%05d" $dailyCounter)


#Daily Backups: Creates backups everyday
#creates daily backup folder (counter-d.m.y)
mkdir backups/daily/$tempFormat'-'$day
#backups data into new folder
cp -r world world_nether world_the_end backups/daily/$tempFormat'-'$day

#Daily Deletion: Deletes daily backups from 14 days ago
#creates a variable of the counter 14 days ago
dailyDeletion=$((dailyCounter - 14))
#uses temp variable for formating of file name (this variable will format all file names)
deleteFormat=$(printf "%05d" $dailyDeletion)
#deletes the backup
rm -r backups/daily/$deleteFormat*


#Weekly Backups: Creates backups every Monday
#checks if it is Monday

#Weekly Deletion: Deletes weekly backups from 4 weeks ago
#if true, backups into weekly folder & deletes the backup 4 weeks ago


#Monthly Backups: Creates backups every 1st of a month
#checks if it is the 1st of a month

#if true, backups into monthly folder
