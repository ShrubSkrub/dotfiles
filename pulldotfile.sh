#!/bin/bash
# Script to copy dotfiles from git repo and place in needed location

#   Old script
# echo "Copying .vimrc"
# cp /home/shrub/dotfiles/.vimrc /home/shrub/.vimrc
# echo "Copying .Xresources"
# cp /home/shrub/dotfiles/.Xresources /home/shrub/.Xresources
# echo "Copying .Xdefaults"
# cp /home/shrub/dotfiles/.Xdefaults /home/shrub/.Xdefaults
# echo "Copying .Xmodmap"
# cp /home/shrub/dotfiles/.Xmodmap /home/shrub/.Xmodmap
#
# # Rename i3 files upon copy
# echo "Copying i3config"
# cp /home/shrub/dotfiles/i3config /home/shrub/.config/i3/config
# echo "Copying i3statusconfig"
# cp /home/shrub/dotfiles/i3statusconfig /home/shrub/.config/i3status/config

# Copy .vimrc
    # cmp checks for difference between files
cmp /home/shrub/dotfiles/.vimrc /home/shrub/.vimrc
    # $? returns success value of previous run command
if [ $? -eq 0 ];then
    echo "No change to .vimrc"
else
    echo "Pulling .vimrc..."
    cp /home/shrub/dotfiles/.vimrc /home/shrub/.vimrc
fi

# Copy .Xresources
cmp /home/shrub/dotfiles/.Xresources /home/shrub/.Xresources
if [ $? -eq 0 ];then
    echo "No change to .Xresources"
else
    echo "Pulling .Xresources..."
    cp /home/shrub/dotfiles/.Xresources /home/shrub/.Xresources
fi

# Copy .Xdefaults
cmp /home/shrub/dotfiles/.Xdefaults /home/shrub/.Xdefaults
if [ $? -eq 0 ];then
    echo "No change to .Xdefaults"
else
    echo "Pulling .Xdefaults..."
    cmp /home/shrub/dotfiles/.Xdefaults /home/shrub/.Xdefaults
fi

# Copy .Xmodmap
cmp /home/shrub/dotfiles/.Xmodmap /home/shrub/.Xmodmap
if [ $? -eq 0 ];then
    echo "No change to .Xmodmap"
else
    echo "Pulling .Xmodmap..."
    cp /home/shrub/dotfiles/.Xmodmap /home/shrub/.Xmodmap
fi

# Rename i3 files upon copy
# Copy i3config
cmp /home/shrub/dotfiles/i3config /home/shrub/.config/i3/config
if [ $? -eq 0 ];then
    echo "No change to .i3config"
else
    echo "Pulling .i3config..."
    cp /home/shrub/dotfiles/i3config /home/shrub/.config/i3/config
fi

# Copy i3status config
cmp /home/shrub/dotfiles/i3statusconfig /home/shrub/.config/i3status/config
if [ $? -eq 0 ];then
    echo "No change to .i3statusconfig"
else
    echo "Pulling .i3statusconfig..."
    cp /home/shrub/dotfiles/i3statusconfig /home/shrub/.config/i3status/config
fi

echo "Finished pulling files from dotfiles repo."
