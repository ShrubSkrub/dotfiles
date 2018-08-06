# Manual Installation
Try using the installers first! This way takes longer.

1. Install i3, Vim, Firefox, compton, feh, scrot, i3lock, dunst
    * `sudo apt-get install i3 vim firefox compton feh scrot i3lock dunst`
2. Install i3gaps, instructions ![here](https://github.com/Airblader/i3/wiki/Compiling-&-Installing)
    * Remember to run i3 *before* installing i3gaps, or else you may end up with a black screen.
3. Copy all dotfiles.  Treat `dots/` like `~/`
    * `~/`
        * `.vimrc`
        * `.Xmodmap`
        * `.Xdefaults` | `XdefaultsSwitching/DarkCyberAltBlackX` is the default
        * Copy contents of `.bashrc` to end of generated file
    * `~/.config`
        * `compton.conf`
        * `zathura/zathurarc`
        * `i3/config | Rename it from i3config`
        * `i3status/config` | Rename it from `i3statusconfig`
    * `~/.mozilla/[Default profile]/chrome`
        * `userChrome.css`
        * `userChrome.js`
        * `userChrome.xml`
        * `userContent.css`
4. Add `exec i3` to `~/.xinintrc`
5. Setup Vim
    1. Clone Vundle
        * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    2. Open `~/.vimrc`
    3. Run `:PluginInstall`
    4. Save and exit file | `ZZ` or `:wq`
