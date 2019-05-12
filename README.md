# tbs
These are some bash scripts and config files for convenient shell settings.
Settings will work on Debian-systems (e.g. Debian Jessie, Buster; Raspbian; Ubuntu; Linux Mint).

You can use them 'as is' or as a source of inspiration for your shell logins and post-install steps.

## Installation

- Basic cloning
```
INSTALL_FOLDER=/opt/tbs
git clone https://github.com/tak289/tbs.git "$INSTALL_FOLDER"
```

- Bash scripts
```
echo "source \"$INSTALL_FOLDER/bash/bash_login.sh\"" >> /etc/skel/.bashrc
echo "source \"$INSTALL_FOLDER/bash/bash_login.sh\"" >> $HOME/.bashrc
```

- Initialize a new system. Please ensure you have a look first what happens here before executing, this will break existing configurations!
-- Will copy (and overwrite!) config files in /etc
-- Install many base packages you have to install manually otherwise. Arguments indicate in which subfolders the script should look into (e.g. if non-gui system, remove that argument)
```
$INSTALL_FOLDER/setup/initsystem.sh
$INSTALL_FOLDER/setup/installpackages.sh 01-basic-packages 15-docker-req-packages 50-gui-packages 90-td-basic-packages 95-td-desktop-packages
```

- Local configuration files. You can override the global settings for specific users, e.g.:
```
cp $INSTALL_FOLDER/setup/files/.vimrc $HOME/
cp $INSTALL_FOLDER/setup/files/.screenrc $HOME/
```



## Comments

- Login scripts are not including any 'fancy' calls like weather forecast you'll find around the internet. Enjoy the fast login without much overhead and look out the window instead :)
