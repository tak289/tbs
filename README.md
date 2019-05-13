# tbs
These are some bash scripts and config files for convenient shell settings as well as setup scripts for post-installation steps after installing a system from-scratch.

Settings will work on Debian-systems (e.g. Debian Jessie, Buster; Raspbian; Ubuntu; Linux Mint). You can use them as a source of inspiration for your shell logins and post-install steps.

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

## From-scratch post-installation scripts

- After setting up a new (Debian-based) system, these scripts can be used for an initial setup of basic packages and settings.
- This will initialize a new system. Please ensure you have a look first what happens here before executing, this will _**break**_ existing configurations!
  - Will copy (and overwrite!) config files in /etc.
  - Install many base packages you have to install manually otherwise. Arguments indicate in which subfolders the script should look into (e.g. if non-gui system, remove that argument)
```
$INSTALL_FOLDER/setup/initsystem.sh
$INSTALL_FOLDER/setup/installpackages.sh 01-basic-packages 15-docker-req-packages 50-gui-packages 90-td-basic-packages 95-td-desktop-packages
```

- Local configuration files. You can override the global settings for specific users, e.g.:
```
cp /opt/tbs/setup/files/.vimrc $HOME/
cp -r /opt/tbs/setup/files/.vim $HOME/
cp /opt/tbs/setup/files/.screenrc $HOME/
```



## Comments

- Login scripts are not including any 'fancy' calls like weather forecast you'll find around the internet. Enjoy the fast login without much overhead and look out the window instead :)
