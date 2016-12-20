#!/usr/bin/env bash

# ls
alias ll='ls -halF'
alias lls='ls -halF | less'
alias la='ls -a'
alias l='ls -CF'

# for safety
alias rm='rm -I'

# misc
alias df='df -h'
alias du='du -h'

# git
g () {
  [[ $# -eq 0 ]] && { git status -s; return; }
  git $@
}

# auto-open
alias xo='xdg-open'

