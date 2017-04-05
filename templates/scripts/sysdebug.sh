#!/bin/bash

output="${HOME}/debug"
ts=$(date '+%F %T')
tcpu=$(ps -e --sort=-pcpu -o pid,time,pcpu,pmem,command | head -n 11)

echo "* $ts" >> $output
echo "$tcpu" | sed 's/^/  /' >> $output

