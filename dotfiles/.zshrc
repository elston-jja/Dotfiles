# Path to your oh-my-zsh installation.
export ZSH=/home/ea/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
DEFAULT_USER=ea

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

# User configuration

  export PATH="/usr/lib/hardening-wrapper/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# History File
# Old Config
HISTFILE=~/.histfile
# History Size
HISTSIZE=1000
# History Lines Saved
SAVEHIST=1000
# Emacs Bind
bindkey -e
# No info to show
zstyle :compinstall filename '/home/ea/.zshrc'
# Begining of Edits
autoload -Uz compinit
compinit
# List All Atributes of Files
alias lsa='ls -Ahfl'
# Runs Connect Script
alias vpn="python2 /home/ea/Scripts/vpn_connect.py"
# Kills VPN
alias dcvpn="sudo killall python2 openvpn"
# Searches Whole PC for File
function search(){echo "Searching for $1";echo "Please enter your password to continue";sudo find / | grep $1 }
# emacs standalone
function emacss(){nohup emacs "$@" > /dev/null &}
# Ping Google Servers 
alias test='ping -c 4 8.8.8.8'
# Pacman Search to install
alias pkg="sudo pacman -Ss | grep"
# Pacman Base Command 
alias pac='sudo pacman'
# Pacman Install Package and Dependecies
alias paci='sudo pacman -S'
# Pacman Remove Packages 
alias pacr='sudo pacman -R'
# Pacman Remove Packages and Dependincies
alias pacrf='sudo pacman -Rsc'
# Independent xfce4 Terminal
alias term='nohup xfce4-terminal > /dev/null &'
# Edit with Emacs (SU)
function edit(){emacs "$@" &}
# Changes to Work Directory
alias work='cd ~/Dropbox/Projects/work'
# System OFF
alias poweroff='sudo systemctl poweroff'
# System Hibernate
alias halt='sudo systemctl halt'
# System Restart
alias restart='sudo systemctl reboot'
# Kills Xorg Session
alias killsession='pkill -15 Xorg'
# Play youtube video in mplayer
function yt(){. /home/ea/Scripts/yt_play.sh}
#Allows you to lock session
function lock(){pkill -15 Xorg; vlock -a}

alias ls="ls -aCHXhFs --color=always"
alias push="git push"
alias pull="git pull"
alias commit="git commit -m"
alias cpt="cd ~/Dropbox/cpt"
alias change="git checkout"



alias h="history"
alias machine="python2 $HOME/Scripts/machine_start.py"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
