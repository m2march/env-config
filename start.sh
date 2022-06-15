sudo apt install make
echo "Download Chrome"
read "Continue [ENTER]"
echo "Download Anaconda"
read "Continue [ENTER]"
echo "Install Anaconda"
read "Continue [ENTER]"
make apps vim z git_config terminal_colors latex
git submodule update --init vim-config
cd vim-config && make
echo "Install gnome-tweak-tool"
read "Continue [ENTER]"
sudo apt install gnome-tweak-tool
echo "Configure static workspaces"
read "Continue [ENTER]"
gnome-tweaks
