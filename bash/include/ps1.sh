#!/bin/bash
# sanitize TERM
safe_term=${TERM//[^[:alnum:]]/.}

if [ "`id -u`" -eq 0 ]
then
    TMP_USER_COLOR="`echo $TBS_ROOT_COLOR`"
    TBS_PROMPT_SIGN="\$"
else
    TMP_USER_COLOR="`echo $TBS_USER_COLOR`"
    TBS_PROMPT_SIGN="#"
fi

TMP_HOSTNAME=${HOSTNAME%%.*}
if [ -x "${TBS}/hosts/${TMP_HOSTNAME}.ps1" ]
then
    source "${TBS}/hosts/${TMP_HOSTNAME}.ps1"
else
    if [ ${TBS_USE_COLOR} ]
    then
        PS1="\n${TMP_USER_COLOR}${USER}${RESET}${TBS_HOST_COLOR}@${HOSTNAME}${RESET}${TBS_SYMBOL_COLOR}:${RESET}${TBS_DIR_COLOR}\w${RESET}\n=> "
    else
        PS1='\n\u@\h:\w${TBS_PROMPT_SIGN} '
    fi

    export PS1
fi
