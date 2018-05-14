killall -q polybar
MONITOR=eDP-1 polybar mybarTop &
MONITOR=HDMI-1 polybar mybarTop &
MONITOR=eDP-1 polybar mybarDown &
MONITOR=HDMI-1 polybar mybarDown &

MONITOR=eDP-1-1 polybar mybarTop &
MONITOR=HDMI-1-1 polybar mybarTop &
MONITOR=eDP-1-1 polybar mybarDown &
MONITOR=HDMI-1-1 polybar mybarDown &

