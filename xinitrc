#Touchpad support (fake-lclick, fake-rclick, fake-scroll)
synclient TapButton1=1 TapButton2=3 TapButton3=2

#Scaling, background, status bar
xrandr --output eDP-1 --scale 0.4x0.4 --panning 1920x1080
feh --no-fehbg --bg-scale ~/pictures/background
slstatus &

#Execute window manager
exec dwm
