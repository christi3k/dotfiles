# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
	## include .bashrc if it exists
	#if [ -f "$HOME/.bashrc" ]; then
	#. "$HOME/.bashrc"
	#fi
#fi

source ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
    PATH="/usr/lib/git-core/:$PATH"
    PATH="/usr/local/bin/:$PATH"

# set up named colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[1;37m\]"
UNDERLINE="\[\033[4m\]"
NO_COLOUR="\[\033[0m\]"

INVERSE="\e[7m"
NORMAL="\e[m"

#if [ -f /usr/share/stgit/completion/stgit-completion.bash ]; then
	#source /usr/share/stgit/completion/stgit-completion.bash
#fi
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
GIT_PS1_SHOWDIRTYSTATE=true

function parse_git_branch {
  if [ $(which git-symbolic-ref) ]; then
    ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo " : ${ref#refs/heads/}"
  fi
}

function return_value_indicator {
  if [ $? == 0 ]; then echo ":)"; else echo ":("; fi
}

function rvm_prompt_ck {
  if [ -f ~/.rvm/bin/rvm-prompt ]; then
	rvm_result=$(~/.rvm/bin/rvm-prompt)
	if [ ${rvm_result} != "system" ]; then echo " ∴ ${rvm_result}"; fi
  fi
}

function prompt {
  case $HOSTNAME in
    christie-desktop ) host_section="$PURPLE\h";;
    ck-shopigniter ) host_section="$PURPLE\h";;
    christie-netbook) host_section="$BLUE\h";;
    starbuck) host_section="$BLUE\h";;
    ripley) host_section="$BLUE\h";;
    scully) host_section="$GREEN\h";;
    #si-ci ) host_section="$BROWN\h";;
    si-ci ) host_section="$GREEN$INVERSE\h$NORMAL";;
    #blue.paydici.com ) host_section="$BLUE$INVERSE\h$NORMAL";;
    * ) host_section="$INVERSE\h$NORMAL"
  esac
  #PS1="$WHITE\n[$host_section $WHITE\$(return_value_indicator) $BLUE\w$RED\$(parse_git_branch)$YELLOW$WHITE] \n$GREEN\u$WHITE\$ $WHITE
  PS1="$WHITE\n[$host_section $WHITE\$(return_value_indicator) $BLUE\w$RED\$(__git_ps1)$YELLOW\$(rvm_prompt_ck)$WHITE] \n$GREEN\u$WHITE\$ $WHITE"
}

# set the prompt
prompt

export PYTHONPATH=/home/christie/Work/Django:$PYTHONPATH
export PYTHONPATH=/home/christie/Projects/Django:$PYTHONPATH
