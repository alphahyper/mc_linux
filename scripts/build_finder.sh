#!/bin/bash

#This script finds the build version and number


#finds/set a variable for the latest version (use once 1.19 comes out)
latest_version=$(curl https://api.papermc.io/v2/projects/paper | sed 's/.*,"//' | sed 's/"]}//')

#finds/set a variable for the latest build
latest_build=$(curl https://api.papermc.io/v2/projects/paper/versions/${latest_version} | sed 's/.*,//' | sed 's/]}//')
