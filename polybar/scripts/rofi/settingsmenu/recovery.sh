#!/usr/bin/env bash
dir="~/.config/polybar/scripts/rofi/settingsmenu"

rofi_command="rofi -theme $dir/style.rasi"

# Options
back=" Go Back"
auto="Automatic"
power="(Power) Gentoo simulator"
battery="(Battery) There is no outlet help"

options="$back\n$auto\n$power\n$battery"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
	$back)
		~/.config/polybar/scripts/rofi/settingsmenu/list.sh
		;;
    $auto)
		pkexec sudo tlp start
        ;;
	$power)
		pkexec sudo tlp ac
        ;;
	$battery)
		pkexec sudo tlp bat
        ;;
esac
