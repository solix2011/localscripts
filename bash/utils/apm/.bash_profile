#!/bin/bash
umask 022

PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/usr/ucb:/etc:/usr/X11R6/bin:/sbin:/user/hcm/yvo/working/scripts/tools

set history=32

PATH=$PATH:/tools/perforce/p4/v2007.2/bin/
export PATH

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
PS1='\[\e[0;32m\]┌── \u@\h\[\e[m\] \[\e[0;33m\]\w\[\e[m\]\n\[\e[0;32m\]└─> \[\e[0m\]'

export P4PORT=ipcswsvdcp4:1666
export P4USER=nvo
x=$(/bin/uname -n)

if [ "$x" = "hcmlab-sw2" ]; then
    echo 'You are working on' $x
	export P4CLIENT=nvo_swlab02
	export USER_PATH=/user/hcm/yvo/working/scripts/tools/sw2
elif [ "$x" = "hcmlab-sw3" ]; then
    echo 'You are working on' $x
	export P4CLIENT=nvo_swlab03 
	export USER_PATH=/user/hcm/yvo/working/scripts/tools/sw2
elif [ "$x" = "hcmlab-sw1" ]; then
    echo 'You are working on' $x
	export P4CLIENT=nvo_swlab01
	export USER_PATH=/user/hcm/yvo/working/scripts/tools/sw1
else
	export P4CLIENT=
	export P4USER=
	export P4PORT=
fi
export P4DIFF=/usr/bin/diff
export CVSROOT=:ext:10.38.7.140:/var/cvsroot
export CVS_RSH=/usr/bin/ssh
export CVS_SERVER= cvs
export P4EDITOR=vim
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias grep='grep -n --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cdb='cd /AMCC/'
alias cdo='cd /AMCC/yvo/working/draft'
alias cdw='cd /AMCC/yvo/working/projects/himawari_ig4/release'
alias b='cd -'
alias findf='/user/hcm/yvo/working/scripts/cmd/findf.sh'

alias sw3='source /user/hcm/yvo/working/scripts/sw3_ddwrt.env'
alias ppc='source /user/hcm/yvo/working/scripts/ppc.env'
alias ppcFP='source /user/hcm/yvo/working/scripts/ppcFP.env'
alias codesourcery='source /user/hcm/yvo/working/scripts/codesourcery.env'
alias clearenv='source /user/hcm/yvo/working/scripts/clear_env.env'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias du='du -sh'
alias s1='export PATH1=$PWD'
alias s2='export PATH2=$PWD'
alias s3='export PATH3=$PWD'
alias q1='cd $PATH1'
alias q2='cd $PATH2'
alias q3='cd $PATH3'
alias showpath='echo -e "path1=$PATH1 \npath2=$PATH2 \npath3=$PATH3\n..."'

#kB 1000, K 1024, MB 1000*1000, M 1024*1024
alias lm='ls -alF --block-size=MB'
alias lk='ls -alF --block-size=kB'

alias diffme='diff -rBNup'
alias z1='export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$"'
alias z2='export PS1="\[\e[0;32m\]┌── \u@\h\[\e[m\] \[\e[0;33m\]\w\[\e[m\]\n\[\e[0;32m\]└─> \[\e[0m\]"'
alias z3='export PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[0;33m\]\w\[\e[m\]\n\[\e[0;32m\]-> \[\e[0m\]"'

export PATH=$PATH:/user/hcm/yvo/autojump_v14/
source /user/hcm/yvo/autojump_v14/autojump.bash
export BACKUP_PATH=$PATH

alias diffme='diff -rBNup'
alias ww='screen -xS yvo -R'
alias vi='vim'
alias cdwin='cd /win/hcm/shared/engineering'
alias perry='ssh buildsw@svdclsw001'
alias listtar="tar -tvf"
alias cds='cd /user/hcm/yvo/working/scripts/tools'

alias hexdump='/usr/bin/hexdump -C'

alias tarh='tar -czhf'

alias cgdb="cgdb -d powerpc-apm-linux-gnu-gdb"

#GIT
export LOCAL_GIT_DIR=/AMCC/yvo/repository/git
#alias gitclone='git clone -l -s -n'
alias gits_upd="git status -s | grep 'M '"
alias gits_del="git status -s | grep 'D '"
alias gits_add="git status -s | grep 'A '"

alias gitlog="git log --abbrev-commit --pretty=oneline"
