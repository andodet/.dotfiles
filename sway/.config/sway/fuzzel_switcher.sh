#!/bin/sh

set -e

row=$(swaymsg -t get_tree | jq  -r '
    ..
    | objects
    | select(.type == "workspace") as $ws
    | ..
    | objects
    | select(has("app_id"))
    | (if .focused == true then "*" else " " end) as $asterisk
    | "\($asterisk)[\($ws.name)]\(.app_id): \(.name) (\(.id))\u0000icon\u001f\(.app_id)"' \
| fuzzel --dmenu)

if [ ! -z "$row" ]
then
    # shellcheck disable=SC2001
    winid=$(echo "$row" | sed 's/.*(\([0-9]*\))$/\1/')
    swaymsg "[con_id=$winid] focus"
fi
