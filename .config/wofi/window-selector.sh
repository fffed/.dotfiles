#!/bin/sh

# Get available windows
windows=$(swaymsg -t get_tree | jq -r '
	recurse(.nodes[]?) |
		recurse(.floating_nodes[]?) |
		select(.type=="con"), select(.type=="floating_con") |
			(.id | tostring) + " " + .app_id + ": " + .name')

# Select window with wofi
selected=$(printf "$windows" | wofi --config=$HOME/.config/wofi/config -d -i -p "Switch to:" | awk '{print $1}')

# Tell sway to focus said window
swaymsg [con_id="$selected"] focus

