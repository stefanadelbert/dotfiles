MONITOR=`xrandr --query | grep " connected" | awk '{print $1}'`

echo "Setting resolution for monitor ${MONITOR}"

xrandr --output ${MONITOR} --mode 1920x1080
