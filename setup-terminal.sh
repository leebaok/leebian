#!/bin/bash

#### solarized for terminal

pwd = $(pwd)
mkdir -p ~/Project/terminal-solarized
cd ~/Project/terminal-solarized

# setup terminal color theme
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
cd gnome-terminal-colors-solarized
./set-light.sh
# in terminal profiles: color/text and background color -- light solarized
#                       color/color pallet -- solarized

# setup 'ls' colors
cd ~/Project/terminal-solarized
git clone https://github.com/seebi/dircolors-solarized.git
cp dircolors-solarized/dircolors.ansi-light ~/.dircolors
eval 'dircolors ~/.dircolors'


cd $pwd

