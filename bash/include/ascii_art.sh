#!/bin/bash

TMP_HOSTNAME=${HOSTNAME%%.*}
if [ -x "${TBS}/../hosts/${TMP_HOSTNAME}.ascii" ]
then
    source "${TBS}/../hosts/${TMP_HOSTNAME}.ascii"
else
    echo -e "${LIGHT_BLACK}
            _______
            \   _  \
    ______  /  /_\  \    ______
   /_____/  \  \_/   \  /_____/
             \_____  /
                   \/
    ${RESET}"
fi
