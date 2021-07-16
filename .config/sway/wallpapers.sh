#!/bin/bash

#get active connection
connected_device=$(nmcli -g device connection show --active)

#check if connection is metered
if [[ $(nmcli -t -f GENERAL.METERED dev show $connected_device) = 'GENERAL.METERED:no (guessed)' ]]; then
  #Store the wallpapers in /var/tmp/ instead of /tmp/, assuming that we want to keep these images in temporary but persistent folder
  temp_path="/var/tmp/"
  wl_path="${temp_path}wallpaper.jpg"
  lsw_path="${temp_path}wallpaper-lock.jpg"

  wl_url="https://source.unsplash.com/1920x1080"
  wget -O $wl_path $wl_url

  killall swaybg || true
  swaymsg "output * bg $wl_path fill"

  convert $wl_path -filter Gaussian -blur 0x8 -level 10%,90%,0.5 $lsw_path
  #&& gsettings set org.gnome.desktop.background picture-uri file:///var/tmp/wallpaper.jpg
fi
