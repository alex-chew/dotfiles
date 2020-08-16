#!/usr/bin/env bash

set -eux

killall -q polybar

primary_monitor=$(polybar --list-monitors | grep primary | cut -d':' -f 1)
logfile=/tmp/polybar_primary.log
echo "Starting primary polybar on monitor $primary_monitor" > $logfile
MONITOR=$primary_monitor polybar --reload main >>$logfile 2>&1 & disown

for secondary_monitor in $(polybar --list-monitors | grep -v primary | cut -d':' -f 1); do
  logfile="/tmp/polybar_secondary_${secondary_monitor}.log"
  echo "Starting secondary polybar on monitor $secondary_monitor" > $logfile
  MONITOR=$secondary_monitor POLYBAR_TRAY=none \
    polybar --reload main >>$logfile 2>&1 & disown
done
