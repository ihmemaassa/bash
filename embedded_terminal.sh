#!/bin/bash

#export DISPLAY=:0 #this should make the terminal to open in a specific workspace, not in use so maybe it didn't work
xfce4-terminal --title=inter --hide-menubar --hide-borders --hide-toolbar --hide-scrollbar --color-bg="rgba(0,0,0,0.3)" &
sleep 20 #my pc is so slow it has to sleep this long, test your perfect timing
wmctrl -F -r inter -t 2 && #this too should workspace too, but in mine it opens in space 0.. no idea what's happening here
wmctrl -F -r inter -e 0,50,50,535,540 && #these are location and size
wmctrl -F -r inter -b add,below && #this makes it sit on desktop, behind other windows
wmctrl -F -r inter -b add,skip_pager,skip_taskbar #removes pager and taskbar
