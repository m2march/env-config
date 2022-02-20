.PHONY: apps bash_aliases vim z cmake ipython_startup

apps:
	sudo apt install vim byobu tree sshfs ack xclip htop g++-8

vim:
	sudo add-apt-repository ppa:jonathonf/vim
	sudo apt update
	sudo apt install vim

bash_aliases:
	cp .bash_aliases ~/

cmake:
	sudo snap install cmake --classic

z:
	git submodule init z
	echo ". ~/env-config/z/z.sh" >> ~/.bashrc

ipython_startup:
	cp ipython_startup.py ~/.ipython/profile_default/startup
