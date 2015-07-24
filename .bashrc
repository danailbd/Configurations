
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -z ${DISPLAY:=""} ]; then
	get_xserver
	if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || ${XSERVER} == "unix" ]]; then
		# Display on local host
		DISPLAY=":0.0"
	else
		# Display on remote host
		DISPLAY=${XSERVER}:0.0
	fi
fi

export DISPLAY

#---------------
# Some settings
#---------------

# No coredumps
ulimit -S -c 0

# Disable options:
shopt -u mailwarn
unset MAILCHECK

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts # Put a list of remote hosts in ~/.hosts

# Bash history control
export HISTIGNORE="&:bg:fg:ll:l:ls"
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

#-----------------------
# Greeting, motd etc...
#-----------------------

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m' # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.

    # ~/.bashrc: executed by bash(1) for non-login shells.
    # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
    # for examples

    export INTELLIJ_HOME=/home/danailbd/Programs/idea-IU-141.178.9/bin
    export JDK_HOME=/usr/lib64/jvm/java
    export JAVA_HOME=$JDK_HOME

    export PATH=$INTELLIJ_HOME:$JAVA_HOME:$PATH
    # Pager
    #export PAGER=most

    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return

    # don't put duplicate lines in the history. See bash(1) for more options
    # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
    HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    #[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes

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
        PS1='\[\e[0;32m\]┌──[\[\e[1;34m\]\u\[\e[0;31m\]@\[\e[0;35m\]\h\[\e[0;32m\]]──\[\e[0;32m\][\[\e[0;36m\]\w\[\e[0;32m\]] \n└── \[\e[0;32m\]'
    else
        PS1='┌────[\u@\h]────────────────────────────────────────[\t]────┐ \n└───>[${PWD}] \$ '
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

    # Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        #alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        #alias grep='grep --color=auto'
        #alias fgrep='fgrep --color=auto'
        #alias egrep='egrep --color=auto'
    fi

    # some more ls aliases
    #alias ll='ls -l'
    #alias la='ls -A'
    alias l='ls -CF'
    alias zin='sudo zypper in'
    alias update='sudo zypper update'
   # alias upgrade='sudo apt-get -u upgrade'
   # alias agi='sudo apt-get install'
   # alias agu='sudo apt-get update'
   # alias agg='sudo apt-get -u upgrade'

    # personal aliases
# The 'ls' family (this assumes you use the GNU ls)
alias l='pwd; ls -lFh --color=auto'
alias ll='pwd; ls -alFh --color=auto'
alias lt='pwd; ls -lFtrh --color=auto'
alias tree='tree -C'
    alias ls='ls -hF --color'    # add colors for filetype recognition
    alias lx='ls -lXB'        # sort by extension
    alias lk='ls -lSr'        # sort by size
    alias la='ls -Al'        # show hidden files
    alias lr='ls -lR'        # recursice ls
#    alias lt='ls -ltr'        # sort by date
    alias lm='ls -al |more'        # pipe through 'more'
#    alias ll='ls -l'        # long listing
    alias lsize='ls --sort=size -lhr' # list by size
    alias lsd='ls -l | grep "^d"'   #list only directories
    alias lalf='ls -alF'
    alias acyl='cd ~/.icons/ACYL_Icon_Theme_0.9.3/ && bash AnyColorYouLike'
    alias reboot='sudo shutdown -r now'
    alias shutdown='sudo shutdown -h now'

    #Command substitution
    alias h='history | grep $1'
    alias rm='rm -i'
    alias cp='cp -v -i'
    alias mv='mv -i'
    alias which='type -all'
    alias ..='cd ..'

    # Creates an archive from given directory
    mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
    mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
    mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

    ### FUNCTIONS

    # Easy extract
    # uncompress depending on extension...
    extract() {
      if [ -f "$1" ] ; then
        case "$1" in
          *.tar.bz2) tar xvjf "$1"   ;;
          *.tar.gz)  tar xvzf "$1"   ;;
          *.bz2)     bunzip2 "$1"    ;;
          *.rar)     unrar x "$1"    ;;
          *.gz)      gunzip "$1"     ;;
          *.tar)     tar xvf "$1"    ;;
          *.tbz2)    tar xvjf "$1"   ;;
          *.tgz)     tar xvzf "$1"   ;;
          *.zip)     unzip "$1"      ;;
          *.Z)       uncompress "$1" ;;
          *.7z)      7z x "$1"       ;;
          *)
          echo "'$1' cannot be extracted"
          return 1
          ;;
        esac
      else
        echo "'$1' is not a valid file"
        return 1
      fi
      return 0
    }

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    #------------------------------------------////
    # Colors:
    #------------------------------------------////
    black='\e[0;30m'
    blue='\e[0;34m'
    green='\e[0;32m'
    cyan='\e[0;36m'
    red='\e[0;31m'
    purple='\e[0;35m'
    brown='\e[0;33m'
    lightgray='\e[0;37m'
    darkgray='\e[1;30m'
    lightblue='\e[1;34m'
    lightgreen='\e[1;32m'
    lightcyan='\e[1;36m'
    lightred='\e[1;31m'
    lightpurple='\e[1;35m'
    yellow='\e[1;33m'
    white='\e[1;37m'
    nc='\e[0m'

    #!/bin/bash
    # Term Colors

    FGNAMES=('▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐')
    BGNAMES=('  ')

    for b in $(seq 0 0); do
        if [ "$b" -gt 0 ]; then
          bg=$(($b+39))
        fi
    #echo -en "\033[0m ${BGNAMES[$b]}"
    echo
        for f in $(seq 0 7); do
          echo -en "\033[${bg}m\033[$(($f+30))m ${FGNAMES[$f]} "
          echo -en "\033[${bg}m\033[1;$(($f+30))m ${FGNAMES[$f]} "
        done

	# Only output text if the shell is interactive (otherwise scp and likewise will fail!)
	if [ "$PS1" ]
	then

		# Looks best on a black background...
		echo -e "\n\n${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"

		echo -e "${lightblue}"
		date
		echo -e "${lightgreen}"
		fortune # makes our day a bit more fun.... :-)

		# function to run upon exit of shell
	function _exit()
	{
		echo -e "${RED}Goodbye!${NC}"
	}
	trap _exit EXIT
	fi
    echo
      echo -e "\033[0m"
    done
