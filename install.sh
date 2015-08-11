# Font
sh install-terminal-font.sh

# Vim config
git submodule update --init --recursive
cp vim-config ~/.vim
cp .vim ~/.vim

# Git config
cp .gitconfig ~/.gitconfig

# Gnome terminal
mkdir -p ~/.gconf/apps/gnome-terminal/profiles/m2-dev/
cp m2-gnome-terminal.conf.xml ~/.gconf/apps/gnome-terminal/profiles/m2-dev/%gconf.xml
