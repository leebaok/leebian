#!/bin/bash

echo "deb http://mirrors.ustc.edu.cn/debian testing main non-free contrib" > /etc/apt/sources.list

apt-get update
apt-get dist-upgrade 

# here we use vim-nox : vim with script option enhanced
apt-get install vim-nox sudo 

usermod -a -G sudo leebaok

apt-get install fonts-wqy-microhei fonts-wqy-zenhei ttf-wqy-microhei ttf-wqy-zenhei

apt-get install ibus ibus-pinyin
# gnome-control-center/region&language/input sources to add chinese pinyin(ibus)
# maybe ibus need to do some settings by click the input button in right-up corner
# and then restart ibus by : ibus restart (restart is necessary, if not, chinese input may be in chaos)

apt-get install git 

# to hide terminal menu bar by default, in terminal, click edit/preference (编辑/首选项)

apt-get purge aisleriot goobox empathy gnome-chess five-or-more four-in-a-row hitori iagno gnome-robots gnome-nibbles gnome-mahjongg gnome-klotski lightsoff gnome-mines gnome-sudoku gnome-tetravex tali swell-foop xboard fairymax quadrapassel

apt-get purge libreoffice libreoffice-gnome libreoffice-core libreoffice-base libreoffice-common 
