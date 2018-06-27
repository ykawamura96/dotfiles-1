#!/bin/sh

sudo -s
echo 'KERNEL=="serio2", SUBSYSTEM=="serio", DRIVERS=="psmouse", WAIT_FOR="/sys/devices/platform/i8042/serio1/serio2/sensitivity", ATTR{sensitivity}:="180", ATTR{speed}:="150"' > /etc/udev/rules.d/10-trackpoint.rules
exit
