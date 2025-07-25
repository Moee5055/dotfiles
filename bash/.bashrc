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
HISTSIZE=10000
HISTFILESIZE=20000

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

#my configuration 
#nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

#adding zen to path
export PATH=$PATH:/home/kshitij/zen
export PATH=$PATH:/home/kshitij/scripts

#adding cursor to path
export PATH=$PATH:/home/kshitij/cursor

#adding alias for cursor
alias cursor="cursor.AppImage --no-sandbox"

#enabling vim keybindings in terminal
set -o vi

#python alias
alias py="python3"

#git alias
alias gs='git status'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias glog='git log --oneline'
alias gb='git branch'
alias gloggraph='git log --oneline --graph --all'
alias glogparents='git log --oneline --decorate --parents'
alias gcat='git cat-file -p'
alias gsw='git switch'

#my alisa
alias vi='nvim'
alias h='cd ~'
alias ba='nvim ~/.bashrc'
alias so="source ~/.bashrc"
alias off='shutdown now'
alias reboot='shutdown now -r'
alias hs="history | grep"
alias ls="lsd"
alias rundocker="systemctl --user start docker-desktop"
alias pkg="~/scripts/package.sh"
alias move="rsync -a --info=progress2"

#fzf path
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

auto_tmux.sh

#tmux alisa
alias tmk="tmux kill-session -t"

# FZF configuration using fd
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow'

# Optional: Also configure FZF_DEFAULT_COMMAND for file search (Ctrl+T)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# Optional: Configure FZF_CTRL_T_COMMAND for file search
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow'

# Optional: FZF options for better appearance
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Optional: Preview window for directories (requires tree or ls)
#export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'
export FZF_ALT_C_OPTS='--preview "tree -aC -I \"node_modules|.git|cache|.cache|build|dist|__pycache__|venv|.venv|.npm|.yarn|vendor|logs|tmp|.tmp|.pytest_cache|.mypy_cache|.tox|coverage|htmlcov|.coverage|target|.gradle|.m2|.cargo|.rustup|.local|snap|.mozilla|.config|.thunderbird|.steam\" {} | head -100"'

