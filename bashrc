# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Ignore EOF
export IGNOREEOF=2

# Update the values of LINES and COLUMNS on resize
shopt -s checkwinsize

# Allow ** glob
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colorscheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Bash aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Bash completion
[[ -f /etc/bash_completion ]] && ! shopt -oq posix && . /etc/bash_completion

# Colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Git prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

# Virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1 # disable default prompt
export WORKON_HOME=$HOME/.virtualenvs
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

# venv prompt
__venv_ps1 () {
  [[ -z $VIRTUAL_ENV ]] && return
  echo "($(basename $VIRTUAL_ENV)) "
}

# Custom prompt
PS1='\n\[\e[01;36m\]\u\[\e[0m\]\[\e[00;37m\] \h \[\e[1m\]\[\e[01;34m\]\w\[\e[0m\]\[\e[00;37m\]$(__git_ps1 " (%s)")\n$(__venv_ps1)\[\e[01;37m\]\$ \[\e[0m\]'

# Editor
export EDITOR='vim'

