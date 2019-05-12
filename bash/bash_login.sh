#!/bin/bash

# If not running interactively, just return
[ -z "$PS1" ] && return

# Bash started? Else: LEAVE !
if [ ! "$BASH" ]
then
    NOTHING=1
else
    # Get script dir - see https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
    TBS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    export TBS

    source "${TBS}/functions.sh"

    source "${TBS}/include/config.sh"
    source "${TBS}/include/ascii_art.sh"
    source "${TBS}/include/motd.sh"
    source "${TBS}/include/ps1.sh"
fi
