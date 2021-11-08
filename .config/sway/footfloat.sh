#!/bin/bash
CMD="footclient --app-id floating_foot nvim"
echo $CMD 
swaymsg exec "$CMD"
