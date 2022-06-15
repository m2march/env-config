.PHONY: apps bash_aliases vim z cmake ipython_startup

apps:
	sudo apt install byobu tree sshfs ack xclip htop g++-8

vim:
	sudo add-apt-repository ppa:jonathonf/vim
	sudo apt update
	sudo apt install vim

bash_aliases:
	cp .bash_aliases ~/

cmake:
	sudo snap install cmake --classic

z:
	git submodule update --init z
	echo ". ~/env-config/z/z.sh" >> ~/.bashrc

ipython_startup:
	cp ipython_startup.py ~/.ipython/profile_default/startup

git_config:
	cp .gitconfig ~/.git

# https://gogh-co.github.io/Gogh/
terminal_colors: 
	echo 'Select themes: Ura, Hibrid'
	bash -c  "$(wget -qO- https://git.io/vQgMr)"

latex:
	sudo apt install texlive-latex-recommended texlive-latex-extras texlive-luatex texlive-lang-spanish
