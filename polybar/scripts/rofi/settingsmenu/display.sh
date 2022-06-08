#!/usr/bin/env bash
dir="~/.config/polybar/scripts/rofi/settingsmenu"

rofi_command="rofi -theme $dir/style.rasi"

# Options
back=" Go Back"
solohdmi="Solo HDMI"
soloedp="Solo eDP"
mirrorhdmi="Mirror eDP to HDMI"
primaryhdmi="Set primary HDMI"
primaryedp=" Set primary eDP"
onedp="Enable eDP"
offedp="Disable eDP"
refreshedp="Refresh eDP"

# Variable passed to rofi
#
display_count=`xrandr -d :0 -q | grep ' connected' | wc -l`
DISPLAYS_NUM=2

if [ "$display_count" -ge "$DISPLAYS_NUM" ]; then
	options="$back\n$solohdmi\n$soloedp\n$mirrorhdmi\n$primaryhdmi\n$primaryedp\n$onedp\n$offedp"
else
	options="$back\n$refreshedp"
fi

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
	$back)
		~/.config/polybar/scripts/rofi/settingsmenu/list.sh
		;;
    $solohdmi)
		xrandr --output eDP1 --off && xrandr --output HDMI2 --auto && xrandr --output HDMI2 --primary && bspc wm -r
        ;;
	$soloedp)
		xrandr --output eDP1 --auto && xrandr --output HDMI2 --off && xrandr --output eDP1 --primary && bspc wm -r
        ;;
	$mirrorhdmi)
		xrandr --output HDMI2 --same-as eDP1
        ;;
	$primaryhdmi)
		xrandr --output HDMI2 --primary
        ;;
	$primaryedp)
		xrandr --output eDP1 --primary
        ;;
	$onedp)
		xrandr --output eDP1 --auto
        ;;
	$offedp)
		xrandr --output eDP1 --off
        ;;
	$refreshedp)
		xrandr --output eDP1 --auto && xrandr --output HDMI2 --off && xrandr --output eDP1 --primary && bspc wm -r
        ;;
esac
