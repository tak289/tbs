#!/bin/bash
##
## Wrapper to check if a ssh command starts with rsync
## From http://gergap.de/restrict-ssh-to-rsync.html
##
if [ -n "$SSH_ORIGINAL_COMMAND" ]; then
    if [[ "$SSH_ORIGINAL_COMMAND" =~ ^rsync\  ]]; then
        echo "Executing rsync-based command with ssh." | systemd-cat -t ssh-rsync-check
        exec $SSH_ORIGINAL_COMMAND
    else
        echo "DENIED $SSH_ORIGINAL_COMMAND" | systemd-cat -t ssh-rsync-check -p emerg
    fi
fi