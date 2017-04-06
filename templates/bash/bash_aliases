#!/usr/bin/env bash



alias e="$EDITOR"
alias v="$EDITOR -R"

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
  git "$@"
}
# git completion
if [[ -f /usr/share/bash-completion/completions/git ]]; then
  . /usr/share/bash-completion/completions/git
  __git_complete g __git_main
fi

# auto-open
alias xo='xdg-open'

