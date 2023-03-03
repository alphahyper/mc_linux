#!/bin/bash

#This backups up world file and deletes them periodically


#changes directory to backups
cd ~/Minecraft

#Date Generator
#finds date and sets it as a variable
day=$(date +"%m.%d.%y")


#Daily Backups: Creates daily backups
#finds and adds the number of daily backups made (counter)
dailyCounter=$(cat backups/daily/counter)
let dailyCounter++
#updates daily counter file
echo $dailyCounter > backups/daily/counter
#uses temp variable for formating of file name (this variable will format all backup file names)
tempFormat=$(printf "%05d" $dailyCounter)
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


#Weekly Backups and Deletion: Creates backups and deletes every Monday

#checks if it is Monday
if [ $(date +"%a") = Mon ]; then

  
  #Weekly Backups: Creates weekly backups
  ##finds and adds the number of weekly backups made (counter)
  weeklyCounter=$(cat backup/weekly/counter)
  let weeklyCounter++
  #updates weekly counter file
  echo $weeklyCounter > backups/weekly/counter
  #uses temp variable for formating of file name (this variable will format all backup file names)
  tempFormat=$(printf "%05d" $weeklyCounter)
  #creates daily backup folder (counter-d.m.y)
  mkdir backups/weekly/$tempFormat'-'$day
  #backups data into new folder
  cp -r world world_nether world_the_end backups/weekly/$tempFormat'-'$day
  
  #Weekly Deletion: Deletes weekly backups from 4 weeks ago
  #creates a variable of the counter 4 weeks ago
  weeklyDeletion=$((weeklyCounter - 4))
  #uses temp variable for formating of file name (this variable will format all deletion file names)
  deleteFormat=$(printf "%05d" $weeklyDeletion)
  #deletes the backup
  rm -r backups/daily/$deleteFormat*
  

#Monthly Backups: Creates backups every 1st of a month

#checks if it is the 1st of a month
if [ $(date +"%d") = 1 ]; then





#if true, backups into monthly folder
