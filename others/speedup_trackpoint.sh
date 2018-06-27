#!/bin/sh

# before setting 'sensitivity' and 'speed', check the parameters with commands like below:
# sudo -s
# echo -n 180 > /sys/devices//platform/i8042/serio1/serio2/sensitivity
# echo -n 150 > /sys/devices//platform/i8042/serio1/serio2/speed


sudo -s
echo 'KERNEL=="serio2", SUBSYSTEM=="serio", DRIVERS=="psmouse", WAIT_FOR="/sys/devices/platform/i8042/serio1/serio2/sensitivity", ATTR{sensitivity}:="180", ATTR{speed}:="150"' > /etc/udev/rules.d/10-trackpoint.rules
exit
