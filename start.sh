sudo apt install make
echo "Download Chrome"
read "Continue"
echo "Download Anaconda"
read "Continue"
make apps vim z git_config terminal_colors
git submodule update --init vim-config
cd vim-config && make
