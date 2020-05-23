# tbs
These are some bash scripts and config files for convenient shell settings.

## Installation

- Basic cloning.
```
umask 022
INSTALL_FOLDER=/opt/tbs
git clone https://github.com/tak289/tbs.git "$INSTALL_FOLDER"
```

- Scripts need to be sourced on login:
```
echo "source \"$INSTALL_FOLDER/bash/bash_login.sh\"" >> /root/.bashrc
echo "source \"$INSTALL_FOLDER/bash/bash_login.sh\"" >> /etc/skel/.bashrc
# Additional users - assuming /opt/tbs here
echo "source \"/opt/tbs/bash/bash_login.sh\"" >> $HOME/.bashrc
```

## Comments

- Login scripts are not including any 'fancy' calls like weather forecast you'll find around the internet. Enjoy the fast login without much overhead and look out the window instead :)
