# dotfiles
Forked from shrubskrub's dotfiles. **Now with 100% less foxes!**

![Image of lockscreen](./misc/lockscreens/green.png?raw=true "Lockscreen")
![Image of setup](./misc/screencap.jpg?raw=true "Setup")

### Ingredients:
* **WM:** i3-gaps (w/compton)
* **Terminal:** Xterm
* **Editor:** Vim (w/[Vundle](https://github.com/VundleVim/Vundle.vim))
* **Browser:** Firefox (w/[Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/))
* **File Browser:** Ranger
* **Image Viewer/Wallpapers:** Feh
* **Screenshots:** Scrot
* **PDF Viewer:** Zathura
* **Lockscreen:** i3lock

## Setup

Chroot:
Download from 
https://goo.gl/fd3zc

Next, run: `sudo sh ~/Downloads/crouton -r xenial -t xorg`

then install git:
`sudo apt-get install git`

After cloning this repo to your home folder...
1. Run `dotfiles/scripts/installers/installscriptP1`
2. Start i3 and run through the setup
3. Run `dotfiles/scripts/installers/installscriptP2`

A few things will not be installed automatically:
* dunstrc
* Gtk Theme
* Vimium dotfiles
* Firefox custom UI dotfiles
* Ranger and rtv dotfiles that improve their usage of Feh
* Chromebook specific Xmodmap configuration (for keybinds such as `Search` to `Ctrl`)

You'll have to do those manually, lazy.
## Re-installing from a .tar.gz file

1. Download cruton from https://goo.gl/fd3zc
2. Go to the crosh terminal (ctrl + alt + t) and type `shell`
3. Restore the backup with `sudo sh -e ~/Downloads/crouton -f path_to_backup.tar.gz`
4. Enter the chroot with `sudo enter-chroot xinit`

## Backing up to a .tar.gz file

From the Crosh Shell, run `sudo edit-chroot -b xenial`

## Further reference on Cruton

can be found [here](https://github.com/dnschneid/crouton/wiki/Crouton-Command-Cheat-Sheet).

## Other info
All actual configuration files are found under `dots` in the same way they would be if it was under `~`.

[i3bindings.md](i3bindings.md) contains a short list of most of the bindings used by i3. <sub><sup>You should still read the [actual config file](dots/.config/i3/config) though...</sup></sub>

If you're getting performance issues, kill compton with `killall compton`

Remember that .Xdefaults is used *instead of* .Xresources

If something doesn't end up working as intended, keep in mind that this was originally designed for personal use on my own chromebook running crouton. I didn't plan on this becoming a drop in installer for a basic setup, but here we are. When something breaks, don't forget to go Googling!
