# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

echo Welcome back Commander! o7

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

#### Custom by Roger ####

# Aliases
alias cd..="cd .."
alias py="python3"
if [[ -d "/hdd/hdd_one/shared/research_development" ]]; then
  alias RD="cd /hdd/hdd_one/shared/research_development"
fi


if command -v lolcat >/dev/null; then
  pip() {
    if [[ $@ == "freeze" ]]; then
      command pip freeze | lolcat
    else
      command pip "$@"
    fi
  }


  pip3() {
    if [[ $@ == "freeze" ]]; then
      command pip3 freeze | lolcat
    else
      command pip3 "$@"
    fi
  }
fi

if [[ x`pip --version` == *"python 2"* ]]; then
  alias pip="echo 'Warning, pip defaults to pip2'&&pip"
fi

# Function to open current directory in a standard ubuntu container.
function rsudo {
    docker run -it -w '/mounted' --rm --name rsudo-container --volume $(pwd):/mounted registry.gitlab.com/r.stegeman/rkb/rsudo
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

# Aliases for following rgr() function.
alias r=rgr
alias roger=rgr
alias robc="r o b c"
alias rotc="r o t c"
alias rosc="r o s c"
function rgr {
  if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "help" ]] || [[ "$1" == "" ]]; then
    echo "Personal commands by Roger."
    echo "You can append -h, --help or simply help to most commands to get more info."
    echo "You can append c, -c or --close to close the terminal after the command completes"
    echo "Currently available commands:"
    echo "  - open [o]"
    echo "  - sleep"
    echo "  - go"
    echo "  - up"
  elif [[ "$1" == "open" ]] || [[ "$1" == "o" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
        echo "Used to open applications and files. Currently available:"
        echo "  -jmeter [j] (Load testing application)"
	      echo "  -bashrc [b] (File where this function is programmed)"
	      echo "  -ssh [s] (ssh config)"
	      echo "Projects:"
	      echo "  -test [t, testing, testing-grounds] (testing-grounds)"
	      echo "  -int [i] (intelligent-entity-tagging)"
	      echo "  -nmt [n] (neural-machine-translation)"
    elif [[ "$2" == "jmeter" ]] || [[ "$2" == "j" ]]; then
      if [[ "$3" == "-d" ]]; then
        command gnome-terminal -- sh ~/Downloads/apache-jmeter-5.1.1/bin/jmeter.sh
      else
        command sh ~/Downloads/apache-jmeter-5.1.1/bin/jmeter.sh
      fi
    elif [[ "$2" == "bashrc" ]] || [[ "$2" == "b" ]]; then
      code ~/.bashrc -n
    elif [[ "$2" == "ssh" ]] || [[ "$2" == "s" ]]; then
      code ~/.ssh/config -n
    elif [[ "$2" == "test" ]] || [[ "$2" == "testing" ]] || [[ "$2" == "testing-grounds" ]] || [[ "$2" == "t" ]]; then
      code ~/dev/testing-grounds
    elif [[ "$2" == "int" ]] || [[ "$2" == "i" ]]; then
      code ~/dev/intelligent-entity-tagging -n
    elif [[ "$2" == "nmt" ]] || [[ "$2" == "n" ]]; then
      code ~/dev/neural-machine-translation -n
    fi
  elif [[ "$1" == "sleep" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
        echo "Calls systemctl suspend"
    elif [ -z "$2"]; then
      SECONDS=0
      systemctl suspend
      read -p "Press any key to see how long you've been away for."
      diff=$SECONDS
      echo -e "Welcome back! You have been gone for:\n$(($diff / 86400)) days\n$(($diff / 3600)) hours\n$((($diff / 60) % 60)) minutes\n$(($diff % 60)) seconds."
    fi
  elif [[ "$1" == "go" ]]; then
    if [[ "$2" == "-h" ]] || [[ "$2" == "--help" ]] || [[ "$2" == "help" ]]; then
      echo "Used to go to certain locations. Simply calls 'cd' Currently available:"
      echo "  -dev"
    elif [[ "$2" == "dev" ]]; then
      cd ~/dev
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
export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
########              Had a space here ^ after the dash