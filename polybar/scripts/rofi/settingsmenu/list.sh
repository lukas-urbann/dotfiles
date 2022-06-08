#!/usr/bin/env bash
dir="~/.config/polybar/scripts/rofi/settingsmenu"

rofi_command="rofi -theme $dir/style.rasi"

# Options
close=" Close"
display=" Configure display"
power=" Power settings"
wallpaper=" Change wallpaper"

# Variable passed to rofi

display_count=`xrandr -d :0 -q | grep 'eDP' | wc -l`

if [ "$display_count" -ge "0" ]; then
	options="$close\n$display\n$power\n$wallpaper"
else
	options="$close\n$power\n$wallpaper"
fi

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $display)
		~/.config/polybar/scripts/rofi/settingsmenu/display.sh
        ;;
	$power)
		~/.config/polybar/scripts/rofi/settingsmenu/power.sh
        ;;
	$wallpaper)
		nitrogen
        ;;
esac
