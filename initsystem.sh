#!/bin/bash

# Get script dir - see https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
TBS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export TBS

source "${TBS}/bash/functions.sh"

#########

einfo "Copy config files to /etc"
cp -r $INSTALL_FOLDER/etc/* /etc/

##
## SSHD
##
einfo "Adjusting SSHD. No password, no root login."
TBS_SSHD_CONFIG_FILE="${TBS_SSHD_CONFIG_FILE:-/etc/ssh/sshd_config}"
if [ -f ${TBS_SSHD_CONFIG_FILE} ]
then
    if [ ! -f ${TBS_SSHD_CONFIG_FILE}.save ]
    then
        einfo "Save config file ${TBS_SSHD_CONFIG_FILE}"
        cp ${TBS_SSHD_CONFIG_FILE} ${TBS_SSHD_CONFIG_FILE}.save
    fi

    sed -i "s/^\(#PasswordAuthentication yes\)/# TD\n#\1\nPasswordAuthentication no/g" ${TBS_SSHD_CONFIG_FILE}
    sed -i "s/^\(PasswordAuthentication yes\)/# TD\n#\1\nPasswordAuthentication no/g" ${TBS_SSHD_CONFIG_FILE}
    sed -i "s/^\(#PermitRootLogin.*\)/# TD\n#\1\nPermitRootLogin no/g" ${TBS_SSHD_CONFIG_FILE}
    sed -i "s/^\(PermitRootLogin yes\)/# TD\n#\1\nPermitRootLogin no/g" ${TBS_SSHD_CONFIG_FILE}
else
    ewarn "No SSHD config file found in ${TBS_SSHD_CONFIG_FILE}"
fi
