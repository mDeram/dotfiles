# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[91m\]\u@\h\[\033[00m\]: $(case $PWD in
        $HOME) HPWD="~";;
        $HOME/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        $HOME/*) HPWD="~/${PWD##*/}";;
        /*/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        *) HPWD="$PWD";;
      esac; printf %s "$HPWD") \$ '

set -o vi
alias dev='cd /home/matutu/Development'
alias work='cd /home/matutu/Work'
alias articles='cd /home/matutu/Development/blog/articles && lv'
alias lv='ls -1'
alias lva='ls -1a'
alias lt='ls -1t | head'
alias gitone='git log --oneline'
alias gitpushall='git push && git push live'
alias npmcheck='npm pack && tar -xvzf *.tgz && rm -rf package *.tgz'
alias vim='nvim'
alias tor='/home/matutu/Programs/tor/Browser/start-tor-browser'
alias remaps='cat /home/matutu/.config/nvim/remaps'
alias vimall='ls | xargs -n1 -I {} nvim {}'
alias csgo='steam -applaunch 730'
alias ntree='tree -I "node_modules|dist|build"'
#alias passg='pass generate -c 21'
alias proji='project-initializer'
alias projs='kitty --session .project-starter &'
alias proje='kill %%'
alias kid='kitty --detach'
alias minesweeper='wine ~/Games/Arbiter_0.52.3/ms_arbiter.exe'

alias current='cd ~/Development/Learning/fullstack_ben_reddit2'
alias curprog='current_progress 13 3'

alias c2hot4u='bluetoothctl connect 00:42:79:B8:14:2B'
alias d2hot4u='bluetoothctl disconnect 00:42:79:B8:14:2B'
alias mouseNoAccel='xinput --set-prop 16 "libinput Accel Profile Enabled" 0, 1'
alias mouseAccel='xinput --set-prop 16 "libinput Accel Profile Enabled" 1, 0'

alias updateN='npm config set prefix="/usr/local" && sudo npm update -g n && npm config set prefix="/home/matutu/.local"'
alias countPackageLock='wc -l package-lock.json'
alias curlTimeInfo='curl --output /dev/null --silent --write-out "http_code: %{http_code}, time_appconnect: %{time_appconnect}, time_connect: %{time_connect}, time_namelookup: %{time_namelookup}, time_pretransfer: %{time_pretransfer}, time_starttransfer: %{time_starttransfer}, time_total: %{time_total}"'

alias rasp-status='ssh -t rasp pm2 list'
alias rasp-temp='ssh rasp sensors'

source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
export FZF_CTRL_T_COMMAND='find ~/Development/* -type d -not -path "*/\.git/*" -not -path "*/node_modules/*"'
export NODE_ENV='development'
export PATH=/home/matutu/.local/scripts:$PATH
export PATH=/home/matutu/go/bin:$PATH

phonebackupold() {
    find "/run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_ad06170205ed0912ae/Phone/DCIM/" -type f -not -mtime -180 -exec mv {} /run/timeshift/backup/Phone_old/DCIM/ \;
    rsync -aAXv "/run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_ad06170205ed0912ae/Phone" "/run/timeshift/backup"
}

addlive() {
    if [ -z "$1" ]; then
        echo "error: specify a repo project name"
    else
        git remote add live "ssh://matutu@192.168.0.26:1711/home/matutu/$1.git"
    fi
}

bind '"\C-H": backward-kill-word'
