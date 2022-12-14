#!/bin/sh

HOST="ifconfig.me"
ping=$(ping -n -c 1 -W 1 $HOST)

[ $? -ne 0 ] && echo "%{F#d60606}%{F-} error" && exit 1

rtt=$(echo "$ping" | sed -rn 's/.*temps=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

if [ $rtt -lt 50 ]; then
    icon="%{F#3cb703}%{F-}"
elif [ $rtt -lt 150 ]; then
    icon="%{F#f9dd04}%{F-}"
else
    icon="%{F#d60606}%{F-}"
fi

echo "$icon $rtt ms"
