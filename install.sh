# Font
sh install-terminal-font.sh

# Vim config
git submodule update --init --recursive
cp -r vim-config ~/.vim
cp .vimrc ~/.vimrc

# Git config
cp .gitconfig ~/.gitconfig

# Gnome terminal
mkdir -p ~/.gconf/apps/gnome-terminal/profiles/m2-dev/
cp m2-gnome-terminal.conf.xml ~/.gconf/apps/gnome-terminal/profiles/m2-dev/%gconf.xml
