/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
redshift -t 6500:3000 &
pgrep -x polybar > /dev/null || polybar &