#!/bin/bash
TMP_HOSTNAME=${HOSTNAME%%.*}
if [ -x "${TBS}/hosts/${TMP_HOSTNAME}.motd" ]
then
    source "${TBS}/hosts/${TMP_HOSTNAME}.motd"
else
    KERNEL=`uname -r`
    SYSTEM=`uname -s`
    MACHINE=`uname -m`
    UPTIME=`uptime`

    date=`date`
    date_de=`date "+%Y-%m-%d"`

    einfo "${TBS_HOST_COLOR}${SYSTEM} / ${MACHINE} / ${KERNEL} / ${TBS_NAME} v.${TBS_VERSION}${NO_COLOR}"
    einfo "${TBS_HOST_COLOR}${date_de} ${UPTIME}${NO_COLOR}"
fi
