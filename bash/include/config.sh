#!/bin/bash

TBS_NAME="tbs"
TBS_VERSION="3.0.0"

export HISTFILESIZE=10000
export HISTSIZE=5000
export HISTCONTROL=ignoreboth
# Force prompt to write history after every command.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Global colors for PS1 and motd
export TBS_HOST_COLOR=${LIGHT_BLUE}
export TBS_ROOT_COLOR=${LIGHT_RED}
export TBS_USER_COLOR=${LIGHT_GREEN}
export TBS_DIR_COLOR=${LIGHT_BLUE}
export TBS_SYMBOL_COLOR=${LIGHT_BLUE}
export TBS_PROMPTSYMBOL_COLOR=${LIGHT_BLACK}
export TBS_PROMPT_COLOR=${NO_COLOR}
export TBS_USE_COLOR=1

umask 077

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

TMP_HOSTNAME=${HOSTNAME%%.*}
if [ -x "${TBS}/../hosts/${TMP_HOSTNAME}.config" ]
then
    source "${TBS}/../hosts/${TMP_HOSTNAME}.config"
fi
