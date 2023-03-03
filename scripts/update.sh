#!/bin/bash

#changes directory to Minecraft
cd ~/Minecraft

#runs build_finder.sh to get variables
. ./scripts/build_finder.sh

#finds/deletes old build file
old_build=$(cat paper_build/build.txt | sed '1d')
rm paper_build/$old_build

#replaces the old paper build name with the new one
sed -i "s/\paper.*/paper-${latest_version}-${latest_build}.jar/" paper_build/build.txt

#downloads latest build in paper_build
(cd paper_build && curl -O https://api.papermc.io/v2/projects/paper/versions/${latest_version}/builds/${latest_build}/downloads/paper-${latest_version}-${latest_build}.jar)
