#!/bin/bash

# Get script dir - see https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
TBS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export TBS

source "${TBS}/../bash/functions.sh"

#########

export DEBIAN_FRONTEND=noninteractive

for var in "$@"
do
    if [ -f "${TBS}/deb/$var" ]
    then
        einfo "Installing packages listed in $var"

        # Combine all packages in a single line
        TBS_INSTALL_PACKAGES="$(sed -f "${TBS}/scripts/cleanup.sed" < "${TBS}/deb/$var")"
        apt-get install --no-install-recommends -y $TBS_INSTALL_PACKAGES

    else
        eerror "File does not exist for $var"
    fi
done
