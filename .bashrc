# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Example: Add /usr/local/gnutls/bin to PATH (adjust as needed)
export PATH=$PATH:/usr/local/gnutls/bin
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
alias j="sudo service jenkins restart"
alias eb="rm -f ~/.ABORT; exec bash"
[ -e "$HOME/.ABORT" ] && return
>"$HOME/.ABORT"
############################################################
[ -z "$PS1" ] && return
[ -e ~/.cddrc ] || touch ~/.cddrc
[ -e ~/.frc ] || touch ~/.frc
[ -e ~/.cdrc ] || echo $HOME > ~/.cdrc
[ -e ~/.filterwords ] || echo PASSWORD > ~/.filterwords

#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Add the following lines to maven.sh
export TZ="America/New_York"
export EDITOR=vim
export M2_HOME=/opt/apache-maven-3.0.5
export M2=$M2_HOME/bin
PATH=$M2:$PATH 
export a b c d e f g h i j k l m n o p q r s t u v w x y z
export NODE_PATH="~/node_modules"
export CDPATH=".:~"
export GOROOT="$HOME/go"
export GOPROXY=https://proxy.golang.org,direct
export PATH=~/bin:/bin:/usr/bin:/usr/local/bin:$GOROOT/bin:/opt/local/bin:/opt/local/sbin:$PATH:/home/linuxbrew/.linuxbrew/bin
export LC_COLLATE=C
export HISTSIZE=""
export GREP_OPTIONS='--color=auto'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/"
export JRE_HOME="$JAVA_HOME/jre"
export GOROOT="/usr/local/go"

# some aliases
alias rj="cd !/jenkins_setup; nohup java  -jar /Applications/Jenkins/jenkins.war --enable-future-java &"
alias rp="cd ~/jenkins_setup; nohup ./proxy &"
alias n="~/weather-station/launch.sh"
alias vv="vi svg_sun_up.svg sunrise_parse.py template.svg parse_weather.py"
alias chrome="'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --headless --disable-gpu --screenshot=moon.png moon.html"
alias ws="cd /Users/jamestjordan/weather-display/server; nohup python -m SimpleHTTPServer 8000 &" 
alias dcn="sudo docker ps -notrunc"
alias lxa="sudo lxc-attach -n"
alias lh="history | less -n"
alias pst="ps afx"
alias dri='sudo docker rmi $( sudo docker images | grep "^<none>" | awk "{print $3}")'
alias dr="sudo docker run -t -d -P -name "
alias dsh="sudo docker run -a stdin -a stdout -i -t ubuntu /bin/bash"

alias drm="sudo docker rm"
alias drmi="sudo docker rmi"
alias da="sudo docker attach"
alias dp="sudo docker port"
alias dc="sudo docker ps"
alias di="sudo docker images"
alias dh="sudo docker help"
alias dhst="sudo docker history"
alias dt="sudo docker top"
alias dhs="sudo docker history"
alias dv="sudo docker version"
alias d0="sudo docker stop"
alias d1="sudo docker start"
alias vd="vi Dockerfile"
alias d="sudo docker"
alias vc="sudo vi ~/projects/MyProject/conf/trac.ini"
alias server="python -m SimpleHTTPServer"
alias sai="sudo apt-get install"
alias lip="curl http://169.254.169.254/latest/meta-data/local-ipv4;echo"
alias a=type
alias aa=alias
alias t=tree
alias ec="eag-compile"
function ecc () {
	eag-compile $1
	eagcc ${1}_leftcorner
  mv $_ $1
}
alias ull="cd /usr/local/lib"
alias ulb="cd /usr/local/bin"
alias uli="cd /usr/local/include"
alias ub2='ssh thordan@192.168.4.36'
alias x="exec bash"
alias eag=/home/thordan/eag/gen/eagcc
alias lx="ls -1 | egrep '^[^.]*$'"
alias ch="sudo chef-server-ctl"
alias wp="sudo netstat -tulpn>/tmp/wp.$$; sudo ps -ef>>/tmp/wp.$$;less -n /tmp/wp.$$;rm /tmp/wp.$$"
alias lnm="ls ~/node_modules"
alias plan="vi ~/.plan;"
alias cj='cat *.json'
alias lj='less *.json'
alias g=git
alias gp="git pull"
alias gco="git checkout"
alias gr="git reset --hard HEAD"
alias ga="git add"
alias gpt="git push origin --tags"
alias gts="git tag"
alias gc="git commit -a -m '`date`';gpom"
alias gs="git status"
alias gpom="git push origin master"
alias sg="sudo su git"
alias myip='echo `curl -s http://169.254.169.254/latest/meta-data/public-ipv4`'
alias ua=unalias
alias us=unset
alias c8="cd *"
alias v8="vim *"
alias n8="node *.js"
alias l8="less *"
alias vi=vim
alias y='cat *.yml'
alias -- -="cd -;"
alias sx="svn ci -mz"
alias vf="vim ~/.filterwords"
alias p.="p=\`pwd\`"
alias cd.='cd $_;l'
alias ccd="cdd"
alias cl="clear"
alias c="ccd"
alias ..="cd ..;"
alias ...="cd ../..;"
alias ....="cd ../../..;"
alias crc="./cruisecontrol.sh"
alias cs=csvn
alias e="cd ~;vi .vimrc;cd -"
alias h='history'
alias j=jobs
alias k1="kill -9 %1"
alias k2="kill -9 %2"
alias k3="kill -9 %3"
alias k4="kill -9 %4"
alias k5="kill -9 %5"
alias k6="kill -9 %6"
alias k7="kill -9 %7"
alias k8="kill -9 %8"
alias k9="sudo kill -9"
alias la='ls -A'
alias ll='ls -la -G'
alias l='ls -CFxaG'
alias m="java mocha.Decompiler"
alias mn=makensis
alias .b='. ~/.bashrc'
alias b='vi ~/.bashrc;.b'
alias .p='. ~/.profile'
alias p='vi ~/.bash_profile;.p'
alias pipi="pip install --install-option='--prefix=$HOME/local'"
alias pipu="pip uninstall"
alias v="fc -s 'vi '"
alias vr="vi README*" 
alias v.="vi $_"
alias find.="find . -name"
alias less="less -N"
alias q="vi ~/bin/.load_prerequisites"
alias s=store
alias wn="route get default | grep interface"
alias t1="tree -L 1 -a -p"
alias t2="tree -L 2 -a -p"
alias t3="tree -L 3 -a -p"
alias t4="tree -L 4 -a -p"
alias getw="curl https://api.weather.gov/gridpoints/OKX/33,35/forecast"
alias getf="curl https://api.weather.gov/gridpoints/OKX/33,35/forecast | jq '.properties.periods[0].detailedForecast'"
alias getp="curl https://api.weather.gov/gridpoints/OKX/33,35/forecast | jq .properties.periods[0].detailedForecast | sed  's/pre//'"
alias gw="curl http://api.worldweatheronline.com/premium/v1/weather.ashx?key=df7aa36af67145308e873424182212&q=new+york"
alias accw="curl http://apidev.accuweather.com/currentconditions/v1/335315.json?apikey= apikey=3nd45BH6lq4VXtHyLnYCQVk1f4lq15O1" 
alias accl="curl https://www.accuweather.com/en/us/new-york-ny/10007/current-weather/349727?lang=en-us&apikey=3nd45BH6lq4VXtHyLnYCQVk1f4lq15O1" 
title () {
	echo -n -e "\033]0;$1\007"
}


build() {
TRAVIS_TOKEN="$( /usr/local/bin/yq r ~/.pass.yml travis.token )"
echo $TRAVIS_TOKEN
body='{
  "request": {
  "branch":"master"
}}'

echo curl -s -X POST \
   -H "Content-Type: application/json" \
   -H "Accept: application/json" \
   -H "Travis-API-Version: 3" \
   -H "Authorization: token $TRAVIS_TOKEN" \
   -d "$body" \
   https://api.travis-ci.com/repo/tjordanchat%2Fjenkins_setup/requests
}

gg () {
  wget "https://raw.githubusercontent.com/$1"
}

gt () {
  gp
  git tag -d demo
  git push origin :refs/tags/demo
	gts "demo"
	gpt
}

set -o vi

nse () {
	sudo nsenter -m -u -i -n -p -t $1 -r -w -- /bin/su -
}

extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

function cdd {
        if [ $# -lt 1 ]
        then
                cat ~/.cddrc |
                        sed 's/export //;s/=/        /'
                return
        fi
        if [ $1 = v ]
        then 
                vi ~/.cddrc
                return
        fi
        if [ $# -eq 2 ]
        then 
                if [ -e "$1" ]
                then
                        cd "$1"
                        cdd "$2"
                        return
                else
                        return
                fi
        fi
        . ~/.cddrc
        _d="echo \$$1"
        _o="echo $( eval $_d )"
        r="$( eval $_o )"
        if [ -z "$r" ]
        then
                echo "export $1=`pwd`" >> ~/.cddrc
                tput setaf 1
                echo "exported \$$1 as `pwd`"
                tput setaf 9
                export "$1=`pwd`"
                return
        fi
        cd $r
        tput setaf 1
        echo ">>> $r"
        tput setaf 9
        l
}
. ~/.cddrc

function f {
    if [ $# = 0 ]
    then
        eval $( cat ~/.frc )
        return 0
    fi
    if [ -f "~/bin/$1" ]
    then 
        echo "vi ~/bin/$1" > ~/.frc
        vi "~/bin/$1"
    else 
        touch "~/bin/$1"
        chmod +x "~/bin/$1"
        echo "vi ~/bin/$1" > ~/.frc
        vi "~/bin/$1"
    fi
}


PROMPT_COMMAND='export O=$?;[ ! $O = 0 ] && PS1="$(hostname):\W:$O> " || PS1="$(hostname):\W> ";history -a ; history -n ; printf %s "$PWD" > ~/.cdrc'

shopt -s histappend
shopt -s cmdhist
export HISTIGNORE="&:ls:l:pwd:wp:wu:b:h:pp:v:p:cd:c:ccd:ll:d:di:dc:df:dv:da:[bf]g:exit"

export TERM="xterm-256color"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


if [ -e ~/.111 ]
then
        ZZ="$HOME/.111/*"
        UDIR=`basename $ZZ`
else
        UDIR=timsdb
        [ -d ~/timsdb ] || mkdir ~/timsdb
fi

function ff {
	sudo find . -type f -print -exec egrep "$1" {} \;
}

function filt {
        sed "s#$LOGNAME#XXXXXXXX#gI" |
        sed 's#[i-n][aeiou][lnrst][a-e][aeiou][lmnprst]#XXXXXXXX#gI' |
        sed 's#google[A-Z./a-z0-9]*#XXXXXXXX#gI' |
        sed "s#$UDIR#XXXXXXXX#gI" 
}

function filt2 {
        sed "s#$LOGNAME#XXXXXXXX#gI" |
        sed 's#google[A-Z./a-z0-9]*#XXXXXXXX#gI' |
        sed "s#$(cat ~/.filterwords)#XXXXXXXX#gI"
}

function ys {
/usr/bin/python<<!!!
import yaml

f = open("dotcloud.yml","r")
b = yaml.load(f.read())
for bb in b:
        if b[bb]['type'] == 'nodejs':
                print bb
!!!
}

function ydb {
/usr/bin/python<<!!!
import yaml

f = open("dotcloud.yml","r")
b = yaml.load(f.read())
for bb in b:
        if b[bb]['type'] == 'mongodb':
                print bb
!!!
}


function line1 {
        width=$(tput cols)
        for (( i=${#line} ; i<$width ; i++ )); do echo -n "_" ; done; echo ""
}
cd $( cat ~/.cdrc )

function store {
        HDIR="$PWD"
        ZT="$HOME/$UDIR"
        cd ~
        cp .bash_profile .bashrc .vimrc $ZT
        cp -r ~/bin/ $ZT
        cp ~/.env/.* $ZT/env 2>/dev/null
        filt < ~/.bash_history > $ZT/.bash_history.ref
        filt < ~/.cddrc > $ZT/.cddrc.ref
        cd "$ZT"
        git add .
        git commit -m "`date`"
        git push origin master
        cd $HDIR
}


function pp {
        curdir=$(pwd|sed s#$HOME#~#)
        width=$(tput cols)
        halfwid=$((($width-${#curdir})/2))
        echo;echo;echo;echo;echo
        if [ -e ~/.plan ]
        then
                line1
                echo
                tput setaf 4
                cat ~/.plan
                tput setaf 0
        fi
        line1
        echo
        tail  -20 ~/.bash_history
        line1
        echo
        for (( i=${#line} ; i<$halfwid ; i++ )); do echo -n " " ; done;
        echo "$(tput setaf 1;tput smul)$(echo $curdir|sed s#$HOME#~#)$(tput setaf 0;tput smul)"
        echo
        l
        line1
        echo
}

############################################################
###trap 'store; exit' 0 15
############################################################
rm "$HOME/.ABORT" 
export IP=68.183.106.150
alias sdor="ssh -l root $IP"
alias sdo="ssh -l tjordan $IP"
alias fdo="sftp tjordan@$IP"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jamestjordan/.sdkman"
[[ -s "/Users/jamestjordan/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jamestjordan/.sdkman/bin/sdkman-init.sh"

# added by travis gem
[ -f /Users/jamestjordan/.travis/travis.sh ] && source /Users/jamestjordan/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/jjordan/.travis/travis.sh ] && source /Users/jjordan/.travis/travis.sh
