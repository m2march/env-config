# Base

## Byobu
sudo apt-get install byobu

## Git 
sudo apt-get install git

## Vim
sudo apt-get install vim

## iPython
sudo apt-get install ipython


## Environment setup (gnome-terminal, vim, git, redshift)
git clone git@github.com:m2march/env-config.git
cd env-config
sh install.sh

## Tree
sudo apt-get install tree

## Midnight commander
sudo apt-get install mc

## Sshfs
sudo apt-get install sshfs

## Ack
sudo apt-get install ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

## Chrome
if [ -z `which google-chrome` ];
then
    sudo apt-get install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    rm google-chrome-stable_current_amd64.deb
fi

## Gnome-tweak-tool
sudo apt-get install gnome-tweak-tool

## Compiz Config Settings Manager
sudo apt-get install compizconfig-settings-manager

echo "Configure workspaces"

echo "Workspace bindings"


## Spotify
if [ -z `which spotify` ];
then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
fi

# MateMarote
mm_user=mmiguel
mm_dir=~/matemarote

## Liaa
wget --no-check-certificate https://liaa.cloudapp.net/redmine/attachments/download/1/liaa.crt
sudo cp liaa.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
rm liaa.crt

## Repository
git clone https://$mm_user@liaa.cloudapp.net/scm/git/matemarote $mm_dir
git -C $mm_dir checkout dev
git -C $mm_dir pull 

## Local executables
if [ -d "~/.bin" ];
then
    mkdir ~/.bin
    echo  "export PATH=~/.bin:$PATH" >> .bashrc
fi

## Java 7
sudo apt-get install openjdk-7-jdk

## Jboss AS 7.1.1 (local install)
wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip
mkdir ~/.jboss-as-7
unzip -d ~/.jboss-as-7 ~/jboss-as-7.1.1.Final.zip
rm ~/jboss-as-7.1.1.Final.zip
# TODO(march): ver como agregar ejecutables libres de paths
# ln -s ~/.jboss-as-7/jboss-as-7.1.1.Final/bin/*.sh ~/.bin
echo "" >> ~/.bash_aliases
echo "# Jboss aliases" >> ~/.bash_aliases
ls ~/.jboss-as-7/jboss-as-7.1.1.Final/bin/*.sh | sed 's/\(.*\/\)\(.*\)/alias \2=\1\2/' >> ~/.bash_aliases
. ~/.bash_aliases

## Maven
sudo apt-get install maven

## Libraries
sudo apt-get install python-gflags
sudo apt-get install pip
sudo pip install BeautifulSoup4

# Tesis

## Latex
sudo apt-get install texlive-latex-base texlive-latex-extra

## Matplotlib 1.4(.3)
wget https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.4.3/matplotlib-1.4.3.tar.gz
tar -xvf matplotlib-1.4.3.tar.gz
cd matplotlib-1.4.3
python setup.py install
