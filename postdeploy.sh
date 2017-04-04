#!/usr/bin/env bash

xrdb -load ~/.Xresources
killall -USR1 termite

python3 ~/.scripts/nvim-reload.py "$(find /tmp/nvim* -type s)"

