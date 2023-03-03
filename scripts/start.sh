#!/bin/bash

#changes directory to Minecraft/scripts
cd ~/Minecraft

#takes variables from update.sh
. ./scripts/build_finder.sh

#starts the server
java -Xms24G -Xmx24G -jar paper_build/paper-${latest_version}-${latest_build}.jar --nogui
