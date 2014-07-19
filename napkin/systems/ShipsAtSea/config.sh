
export JRUBY_ARGS="--server -J-Xms96M -J-Xmx96M"

# enable Arduino RX/TX UART on /dev/ttyS1
# 
# either it happens during boot (/etc/rc.local) using setuart program,
# or uncomment below:
# 
# echo "3" > /sys/devices/virtual/misc/gpio/mode/gpio0
# echo "3" > /sys/devices/virtual/misc/gpio/mode/gpio1

