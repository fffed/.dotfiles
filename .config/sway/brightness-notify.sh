#!/usr/bin/bash

new_value=$1

notify-send " Brightness" --hint=int:value:$new_value
