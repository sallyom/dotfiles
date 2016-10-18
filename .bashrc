# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH=$PATH:/usr/local/go/bin:/home/somalley/code/gowork/src/github.com/openshift/origin/_output/local/bin/linux/amd64

export GOPATH=$HOME/code/gowork
export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
export ONLINE_REPO=/home/somalley/code/gowork/src/github.com/openshift/online
export INSTANCE_NAME=somalley-online-dev

alias ll='ls -l'
alias rm='rm -i'
alias path='export PATH=$PATH:`pwd`'
alias origin='cd /home/somalley/code/gowork/src/github.com/openshift/origin'
alias oc-config='sudo chmod +r openshift.local.config/master/openshift-registry.kubeconfig;sudo chmod +r openshift.local.config/master/admin.kubeconfig;./oadm registry --create --credentials=openshift.local.config/master/openshift-registry.kubeconfig --config=openshift.local.config/master/admin.kubeconfig'
alias newdyn='sudo AUTO_GOPATH=1 hack/make.sh dynbinary'

alias amazon='cat ~/Documents/somalley.cred'
alias jenkins='cat ~/Documents/jenkins.cred.txt'
alias ircgrep='grep -R ~/.config/hexchat/logs/rhat'

# Helper function for our fancy prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Fancy prompt function
function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       BLACK="\[\033[0;30m\]"
  local       RESET="\[\e[0m\]"

  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

  PS1="\h$RED:$BLUE\W$RED\$(parse_git_branch)${RESET}$ "
  PS2='> '
  PS4='+ '
}

# Call the fancy prompt function
proml

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

PATH="/home/somalley/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/somalley/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/somalley/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/somalley/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/somalley/perl5"; export PERL_MM_OPT;
