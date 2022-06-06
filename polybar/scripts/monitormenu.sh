#!/usr/bin/env bash
dir="~/.config/polybar/scripts/rofi"

rofi_command="rofi -theme $dir/monitormenu.rasi"

# Options
solohdmi="Přepnout na solo HDMI"
soloedp="Přepnout na solo eDP"
mirrorhdmi="Zrcadlit eDP na HDMI"
primaryhdmi="Nastavit primární HDMI"
primaryedp="Nastavit primární eDP"
onedp="Zapnout eDP"
offedp="Vypnout eDP"

# Variable passed to rofi
options="$solohdmi\n$soloedp\n$mirrorhdmi\n$primaryhdmi\n$primaryedp\n$onedp\n$offedp"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $solohdmi)
		xrandr --output eDP-1 --off && xrandr --output HDMI-2 --auto && xrandr --output HDMI-2 --primary && bspc wm -r
        ;;
	$soloedp)
		xrandr --output eDP-1 --auto && xrandr --output HDMI-2 --off && xrandr --output eDP-1 --primary && bspc wm -r
        ;;
	$mirrorhdmi)
		xrandr --output HDMI-2 --same-as eDP-1
        ;;
	$primaryhdmi)
		xrandr --output HDMI-2 --primary
        ;;
	$primaryedp)
		xrandr --output eDP-1 --primary
        ;;
	$onedp)
		xrandr --output eDP-1 --auto
        ;;
	$offedp)
		xrandr --output eDP-1 --off
        ;;
esac
