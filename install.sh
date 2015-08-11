# Font
sh install-terminal-font.sh

# Vim config
git submodule update --init --recursive
cd vim-config
sh install-ycm.sh
cd ..
cp -r vim-config ~/.vim
cp .vimrc ~/.vimrc

## YouCompleteMe
sudo apt-get install cmake python-dev
old_pwd=`pwd`
cd ~/.vim/bundle/YouCompleteMe
./install.sh
cd $old_pwd

# Git config
cp .gitconfig ~/.gitconfig

# Gnome terminal
mkdir -p ~/.gconf/apps/gnome-terminal/profiles/m2-dev/
cp m2-gnome-terminal.conf.xml ~/.gconf/apps/gnome-terminal/profiles/m2-dev/%gconf.xml
