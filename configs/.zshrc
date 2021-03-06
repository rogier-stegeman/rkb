echo Welcome back Commander! o7
echo RKB .zshrc Version 1.0.3

if [[ -o interactive ]]; then
  if [ -f "/tmp/daily-fortune.txt" ]; then
    echo ""
    echo Your daily fortune:
    cat /tmp/daily-fortune.txt | lolcat
    rm /tmp/daily-fortune.txt
  fi
fi

# gnome-terminal --geometry=80x10+x+y --zoom=2 --command="your program"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.zshenv

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$username/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         bundler
         rake
         zsh-syntax-highlighting
         history-substring-search
         z
         zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTSIZE=10000000
SAVEHIST=10000000

#### Custom RKB ####

autoload -Uz zcalc

# Aliases
alias calc="zcalc"
alias cd..="cd .."
alias fd=fdfind
alias py="python3"
alias python="python3"
alias stpy='export startimports="import datetime; import json; import os; import random; import sys; import time; import numpy as np; import pandas as pd; import requests" && echo $startimports | sed -r "s<; <\n<g" && python -i -c $startimports'
alias pick="pick-colour-picker"
alias "code."="code ."
alias "code. -d"="code . && exit"
alias "code . -d"="code . && exit"
alias pip="pip3"
alias vue="~/.yarn/bin/vue"
if [[ -d "/hdd/hdd_one/projects/" ]]; then
  alias RD="cd /hdd/hdd_one/projects"
fi


if command -v lolcat >/dev/null; then
  function pip() {
    if [[ $@ == "freeze" ]]; then
      command python -m pip freeze | lolcat
    else
      command python -m pip "$@"
    fi
  }


  function pip3() {
    if [[ $@ == "freeze" ]]; then
      command python3 -m pip freeze | lolcat
    else
      command python3 -m pip "$@"
    fi
  }
fi

alias rm="saferm"
function saferm() {
  echo "place -r at the end"
  for arg in $@:
  do
    if [[ "$arg" == "/:" || "$arg" == "/" || "$arg" == "*" || "$arg" == "/*" || "$arg" == "*/" || "$arg" == "*:" || "$arg" == "/*:" || "$arg" == "*/:" ]]; then
      echo "roger roger, deleting entire filesys-"
      echo "No no no no no"
      echo "I suggest you check your command again"
      return 1
    fi
  done
  command rm "$@"
}

if [[ x`pip --version` == *"python 2"* ]]; then
  alias pip="echo 'Warning, pip defaults to pip2'&&sleep 0.2 && pip"
fi

# Function to open current directory in a standard ubuntu container.
function rsudo {
    docker run -it -w '/mounted' --rm --name rsudo-container --volume $(pwd):/mounted docker.pkg.github.com/rogier-stegeman/rkb/rsudo:latest
}
# Function to create standard python container. Mounts cwd in /mounted but doesn't use it as default location.
function rpython {
    docker run -it --rm --name rpython-container --volume $(pwd):/mounted docker.pkg.github.com/rogier-stegeman/rkb/rpython:latest
}


if [[ -d "/hdd/hdd_one/shared/research_development" ]]; then
  function rdmux() {
      loc="/hdd/hdd_one/shared/research_development/tmuxs"
      if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "help" ]] || [[ "$1" == "" ]]; then
          echo "Custom tmux shortcuts command for Research and Development group."
          echo "You can append -h, --help or simply help to most commands to get more info."
          echo "You can append -c or --close to close the terminal after the command completes"
          echo "Currently available commands:"
          echo "  - new OR n"
          echo "  - attach OR a"
          echo "  - list OR ls"
      elif [[ "$1" == "ls" ]] || [[ "$1" == "list" ]]; then
          if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
              echo "Lists all Tmux windows present in the custom tmux folder"
          else
              tmux -S $loc ls
          fi
      elif [[ "$1" == "new" ]] || [[ "$1" == "n" ]]; then
          if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
              echo "Creates a new Tmux session with provided name."
              echo "Example:"
              echo "  rdmux new TESTTMUX"
          elif [[ -z  "$2" ]]; then
              echo "Please provide a name for the new Tmux session."
          else
              tmux -f "/hdd/hdd_one/shared/research_development/.rdmux.conf" -S $loc new -s $2
          fi
      elif [[ "$1" == "attach" ]] || [[ "$1" == "a" ]]; then
          if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
              echo "Attach to an existing Tmux session with provided name."
              echo "Example:"
              echo "  rdmux attach TESTTMUX"
          elif [[ -z  "$2" ]]; then
              tmux -S $loc attach
          else
              tmux -S $loc attach -t $2
          fi
      fi

      while [ $# -gt 0 ]
      do
          lastarg=$1
          shift
      done
      if [[ "$lastarg" == "-c" ]] || [[ "$lastarg" == "--close" ]]; then
          exit
      fi
  }
fi

# rgr variables
timer_on=false
# rgr helper functions
function timer_int() {
  timer_on=false
}

# Aliases for following rgr() function.
alias disc="r o disc -c"
alias r=rgr
alias rdu="rgr du"
alias rh="rgr h"
alias rkb="rgr o kb c"
alias rmon="rgr mon"
alias ro="rgr o"
alias robc="rgr o b c"
alias rofc="rgr o f c"
alias roger=rgr
alias rokbc="rgr o kb c"
alias rosc="rgr o s c"
alias rotc="rgr o t c"
alias rozc="rgr o z c"
alias tr="rgr tr"
alias trc="rgr tr -c"
alias rvenv="rgr venv"
function rgr {
  if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "help" ]] || [[ "$1" == "" ]]; then
    echo "Personal commands by Roger."
    echo "You can append -h, --help or simply help to most commands to get more info."
    echo "You can append c, -c or --close to close the terminal after the command completes"
    echo "Currently available commands:"
    echo "  - open [o]"
    echo "  - sleep"
    echo "  - go [g]"
    echo "  - up"
    echo "  - update"
    echo "  - history [h]"
    echo "  - translate [t]"
    echo "  - du"
    echo "  -s py"
  elif [[ "$1" == "open" ]] || [[ "$1" == "o" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
        echo "Used to open applications and files. Currently available:"
	      echo "  -bashrc [b] (File where this function is programmed)"
	      echo "  -zshrc [z] (File where this function is programmed)"
	      echo "  -ssh [s] (ssh config)"
        echo "  -discord [d, disc] (discord browser window)"
	      echo "Projects:"
	      echo "  -rkb [kb] (r-knowledge-base)"
	      echo "  -test [t, testing, testing-grounds] (testing-grounds)"
	      echo "  -fir [f] (firenze-platform)"
	      echo "  -int [i] (intelligent-entity-tagging)"
	      echo "  -nmt [n] (neural-machine-translation)"
	      echo "  -firenze [f] (firenze-core)"
    elif [[ "$2" == "bashrc" ]] || [[ "$2" == "b" ]]; then
      code ~/.bashrc -n
    elif [[ "$2" == "zshrc" ]] || [[ "$2" == "z" ]]; then
      code ~/.zshrc -n
    elif [[ "$2" == "rkb" ]] || [[ "$2" == "kb" ]]; then
      code ~/dev/personal/rkb -n
    elif [[ "$2" == "ssh" ]] || [[ "$2" == "s" ]]; then
      code ~/.ssh/config -n
    elif [[ "$2" == "test" ]] || [[ "$2" == "testing" ]] || [[ "$2" == "testing-grounds" ]] || [[ "$2" == "t" ]]; then
      code ~/dev/testing-grounds
    elif [[ "$2" == "discord" ]] || [[ "$2" == "disc" ]] || [[ "$2" == "d" ]]; then
      firefox --new-window "https://discord.com/channels/@me"
    elif [[ "$2" == "int" ]] || [[ "$2" == "i" ]]; then
      code ~/dev/intelligent-entity-tagging -n
    elif [[ "$2" == "nmt" ]] || [[ "$2" == "n" ]]; then
      code ~/dev/neural-machine-translation -n
    elif [[ "$2" == "firenze" ]] || [[ "$2" == "f" ]]; then
      code ~/dev/projects/firenze-platform -n
    fi
  elif [[ "$1" == "sleep" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
        echo "Calls systemctl suspend"
    elif [ -z "$2"]; then
      SECONDS=0
      echo "No time to rest!"
      # systemctl suspend
      read "?Press any key to see how long you've been away for, and to fix the desktop wallpaper."
      diff=$SECONDS
      echo -e "Welcome back! You have been gone for:\n$(($diff / 86400)) days\n$(($(($diff / 3600)) % 24)) hours\n$(($(($diff / 60)) % 60)) minutes\n$(($diff % 60)) seconds."
      gsettings set org.gnome.desktop.background picture-options none
      gsettings set org.gnome.desktop.background picture-options wallpaper
    fi
  elif [[ "$1" == "go" ]] || [[ "$1" == "g" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
      echo "Used to go to certain locations. Simply calls 'cd' Currently available:"
      echo "  -dev [d]"
      echo "  -ssh [s]"
    elif [[ "$2" == "dev" ]] || [[ "$2" == "d" ]]; then
      cd ~/dev
    elif [[ "$2" == "ssh" ]] || [[ "$2" == "s" ]]; then
      cd ~/.ssh
    fi
  elif [[ "$1" == "up" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
      echo "  -up [N] This command allows you to go up N folders"
    else
      n=$2
      chr="/.."
      str=".."
      for ((i = 1; i < n; i++)); do 
          str="$str$chr"
      done
      cd $str
    fi
  elif [[ "$1" == "update" ]]; then
    source ~/.zshrc
  elif [[ "$1" == "history" ]] || [[ "$1" == "h" ]]; then
    if [[ $# -ne 2 ]]; then
      echo "How many lines?"
      read "his_nr?>>>"
      tail -n $his_nr ~/.zsh_history
    else
      cat ~/.zsh_history | grep "${@:2}"
    fi
  elif [[ "$1" == "monitor" || "$1" == "mon" ]]; then
    smi_processes=$(nvidia-smi pmon -c 1 | wc -l)
    smi_height=$((${smi_processes} + 6))
    smi_height2=$(($smi_height - 7))
    if [[ "$2" == "v" || "$2" == "-v" ]]; then
      tmux \
        new-session  'htop' \; \
        split-window -v 'nvtop'\; \
        split-window -v 'xdotool key F11 && zsh' \; \
        select-pane -t 0 \; \
        split-window -vbl $smi_height2 'nvidia-smi -l 1' \; \
        select-pane -t 3 \;
        
        # split-window -v 'xdotool key F11'\; \
        # select-pane -t 1 \;
        # split-window -vl $smi_height 'nvidia-smi -l 1' \; \
        # select-pane -t 2 \;
    else
      tmux \
        new-session  'htop' \; \
        split-window -h 'zsh' \; \
        select-pane -t 0 \; \
        split-window -vl $smi_height 'nvtop'\; \
        resize-pane -t 0 -y $smi_height \; \
        select-pane -t 2 \; \
        split-window -vbl $smi_height 'nvidia-smi -l 1' \; \
        split-window -v 'xdotool key F11'\; \
        select-pane -t 4 \;
    fi
    read "?Press Return to exit fullscreen"
    xdotool key F11
  elif [[ "$1" == "translate" || "$1" == "t" || "$1" == "tr" ]]; then
    optional="$2"
    if [[ "$optional" == "-c" ]] || [[ "$optional" == "c" ]] ||[[ "$optional" == "--close" ]]; then
      pat=${@:3}
      pat="${pat// /%20}"
      google-chrome "https://translate.google.nl/?source=osdd#auto|auto|$pat" >/dev/null 2>&1
      exit
    else
      pat=${@:2}
      pat="${pat// /%20}"
      google-chrome "https://translate.google.nl/?source=osdd#auto|auto|$pat" >/dev/null 2>&1
    fi
  elif [[ "$1" == "timer" ]]; then
    trap timer_int INT
    timer_on=true
    if [[ $# -ne 2 ]]; then
      date1=`date +%s`
      days=$(( $(($(date +%s) - date1)) / 86400 ))
      while $timer_on; do 
        days=$(( $(($(date +%s) - date1)) / 86400 ))
        echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 0.1
        done
      echo -e "\b\b$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    else
      echo not implemented yet
    fi
  elif [[ "$1" == "du" ]]; then
    du -sh * | sort -rh
  elif [[ "$1" == "venv" ]]; then
    if [ -d "/venv" ]; then
      source /venv/bin/activate
    else
      python -m virtualenv venv
      source /venv/bin/activate
    fi
  elif [[ "$1" == "spy" ]]; then
    echo BASH
    sudo cat /home/*/.bash_history | grep "${@:2}"
    echo ZSH
    sudo cat /home/*/.zsh_history | grep "${@:2}"
  fi
  while [ $# -gt 0 ]
  do
    lastarg=$1
    shift
  done
  if [[ "$lastarg" == "-c" ]] || [[ "$lastarg" == "c" ]] ||[[ "$lastarg" == "--close" ]]; then
    exit
  fi
}

# Do not add anything below this line.
# To customise or add anything to this file for a single machine, create a file called .zshrc.local in rkb/configs.
# Described in the RKB README
if [ -f ~/.zshrc.local ]; then
    . ~/.zshrc.local
fi
