#!/bin/sh

# The code belou will stop me from using computer after 23:    00 to 5:00

# systemctl suspend &
time=$(date '+%H')
if 
[  "$time" -gt 22 ] || [ "$time" -lt 5 ];
then systemctl suspend
fi
