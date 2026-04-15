#!/bin/bash

source "$CONFIG_DIR/helpers/icon_map.sh"

SOURCES=$(defaults read com.apple.HIToolbox AppleSelectedInputSources)

get_input_icon() {
	case "$1" in
	*Rime* | *Squirrel*)
		echo "􀦇"
		;;
	*ABC*)
		echo "􀂝"
		;;
	*Pinyin* | *Simplified*)
		echo "􀆃"
		;;
	*)
		echo "􀆍"
		;;
	esac
}

if echo "$SOURCES" | grep -q "im.rime.inputmethod.Squirrel"; then
	ICON=$(get_input_icon "Rime")
	ICON_COLOR=0xfff39660
elif echo "$SOURCES" | grep -q '"KeyboardLayout Name" = ABC'; then
	ICON=$(get_input_icon "ABC")
	ICON_COLOR=0xffb39df3
else
	ICON=$(get_input_icon "Unknown")
	ICON_COLOR=0xffb39df3
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$ICON_COLOR" label=""
