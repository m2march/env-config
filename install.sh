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
./m2-gnome-terminal.conf.sh

# Redshift
sudo apt-get install redshift
cp .redshiftrc ~/.redshiftrc

# xclip
sudo apt-get install xclip
echo '' >> ~/.bash_aliases
echo '# xclip aliases' >> ~/.bash_aliases
echo 'alias copy="xclip -i -selection clipboard"' >> ~/.bash_aliases
echo 'alias paste="xclip -o -selection clipboard"' >> ~/.bash_aliases
