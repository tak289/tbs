#!/bin/bash

#!/bin/bash

BLACK='\033[0;30m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
BROWN='\033[0;33m'


LIGHT_BLACK='\033[1;30m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m'
LIGHT_RED='\033[1;31m'
LIGHT_MAGENTA='\033[1;35m'
LIGHT_WHITE='\033[0;37m'
LIGHT_YELLOW='\033[1;33m'

RESET='\e[0m'
NO_COLOR='\033[0m'

einfo()
{
    echo -e "${LIGHT_GREEN} * ${RESET}$*"
}
eerror()
{
    echo -e "${LIGHT_RED} * ${RESET}$*"
}
ewarn()
{
    echo -e "${LIGHT_YELLOW} * ${RESET}$*"
}
ebegin()
{
    echo -e "${LIGHT_GREEN} * ${RESET}$*"
}
eend()
{
    # Do Nothing
    NOTHING=0
}
