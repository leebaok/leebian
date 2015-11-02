#!/bin/bash

dconf load /org/gnome/desktop/wm/keybindings/ < keybindings-1

# gnome-terminal and screen-shot shortcut should be set in gnome-control-center. i don't know where they are stored

dconf load /org/gnome/mutter/keybindings/ < keybindings-3
