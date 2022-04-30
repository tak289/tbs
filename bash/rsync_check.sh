#!/bin/bash
##
## Wrapper to check if a ssh command starts with rsync
## From http://gergap.de/restrict-ssh-to-rsync.html
##
if [ -n "$SSH_ORIGINAL_COMMAND" ]; then
    if [[ "$SSH_ORIGINAL_COMMAND" =~ ^rsync\  ]]; then
        echo "`/bin/date`: $SSH_ORIGINAL_COMMAND" >> /tmp/ssh-command-log
        exec $SSH_ORIGINAL_COMMAND
    else
        echo "`/bin/date`: DENIED $SSH_ORIGINAL_COMMAND" >> /tmp/ssh-command-log
    fi
fi