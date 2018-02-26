#!/bin/bash
# Script to copy dotfiles from various locations and backup to gitrepo

# Copy .vimrc
    # cmp checks for difference between files
cmp /home/shrub/.vimrc /home/shrub/dotfiles/.vimrc
    # $? returns success value of previous run command
if [ $? -eq 0 ];then
    echo "No change to .vimrc"
else
    echo "Backing up .vimrc..."
    cp /home/shrub/.vimrc /home/shrub/dotfiles/.vimrc
fi

# Copy .Xresources
cmp /home/shrub/.Xresources /home/shrub/dotfiles/.Xresources
if [ $? -eq 0 ];then
    echo "No change to .Xresources"
else
    echo "Backing up .Xresources..."
    cp /home/shrub/.Xresources /home/shrub/dotfiles/.Xresources
fi

# Copy .Xdefaults
cmp /home/shrub/.Xdefaults /home/shrub/dotfiles/.Xdefaults
if [ $? -eq 0 ];then
    echo "No change to .Xdefaults"
else
    echo "Backing up .Xdefaults..."
    cp /home/shrub/.Xdefaults /home/shrub/dotfiles/.Xdefaults
fi

# Copy .Xmodmap
cmp /home/shrub/.Xmodmap /home/shrub/dotfiles/.Xmodmap
if [ $? -eq 0 ];then
    echo "No change to .Xmodmap"
else
    echo "Backing up .Xmodmap..."
    cp /home/shrub/.Xmodmap /home/shrub/dotfiles/.Xmodmap
fi

# Copy compton.conf
cmp /home/shrub/.config/compton.conf /home/shrub/dotfiles/compton.conf
if [ $? -eq 0 ];then
    echo "No change to compton.conf"
else
    echo "Backing up compton.conf..."
    cp /home/shrub/.config/compton.conf /home/shrub/dotfiles/compton.conf
fi

# Rename i3 files upon copy
# Copy i3config
cmp /home/shrub/.config/i3/config /home/shrub/dotfiles/i3config
if [ $? -eq 0 ];then
    echo "No change to .i3config"
else
    echo "Backing up .i3config..."
    cp /home/shrub/.config/i3/config /home/shrub/dotfiles/i3config
fi

# Copy i3status config
cmp /home/shrub/.config/i3status/config /home/shrub/dotfiles/i3statusconfig
if [ $? -eq 0 ];then
    echo "No change to .i3statusconfig"
else
    echo "Backing up .i3statusconfig..."
    cp /home/shrub/.config/i3status/config /home/shrub/dotfiles/i3statusconfig
fi

# Copy userChrome.css
cmp /home/shrub/.mozilla/firefox/0g49vgfs.default/chrome/userChrome.css /home/shrub/dotfiles/userChrome.css
if [ $? -eq 0 ];then
    echo "No change to userChrome.css"
else
    echo "Backing up userChrome.css"
    cp /home/shrub/.mozilla/firefox/0g49vgfs.default/chrome/userChrome.css /home/shrub/dotfiles/userChrome.css
fi

echo "Finished copying files."
