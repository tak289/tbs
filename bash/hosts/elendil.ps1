#!/bin/bash
if [ "`id -u`" -eq 0 ]
then
    TBS_PROMPT_SIGN="=\$"
else
    TBS_PROMPT_SIGN="=>"
fi
PS1="\n${TMP_USER_COLOR}${USER}${RESET}${TBS_HOST_COLOR}@${HOSTNAME}${RESET}${TBS_SYMBOL_COLOR}:${RESET}${TBS_DIR_COLOR}\w${RESET}\n${TBS_PROMPTSYMBOL_COLOR}=> ${RESET}"
export PS1
