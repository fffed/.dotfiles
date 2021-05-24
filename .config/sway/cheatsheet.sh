#!/usr/bin/bash

# search for "bindsym" that starts(^) from zero or more whitespaces(/s*)
btn_pattern="^\s*bindsym"

#grep $btn_pattern ./config | grep -v XF86 | sed "s/$btn_pattern //"

#parse values with `awk` starting from second to vary end
grep $btn_pattern ~/.config/sway/config | grep -v XF86 \
    | sed "s/swaynag.*/'exit sway'/" \
    | sed "s/\$term -a cheat.*/show keybindings/" \
    | sed "s/--to-code//" \
    | awk '{for(i=2;i<=NF;i++) if (i==2) printf $i"-- "; else printf $i" "; print ""}' \
    | column -t -s '--' \
    | less
