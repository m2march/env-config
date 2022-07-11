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

ipython_vim_bindings:
	# You may need the following to create the directoy
	mkdir -p `jupyter --data-dir`/nbextensions/vim_binding
	# Not download a plugin file
	jupyter nbextension install https://raw.githubusercontent.com/lambdalisue/jupyter-vim-binding/master/vim_binding.js --nbextensions=`jupyter --data-dir`/nbextensions/vim_binding
	jupyter nbextension enable vim_binding/vim_binding

git_config:
	cp .gitconfig ~/.gitconfig

# https://gogh-co.github.io/Gogh/
terminal_colors: 
	echo 'Select themes: Ura, Hibrid'
	bash -c  "$(wget -qO- https://git.io/vQgMr)"

latex:
	sudo apt install texlive-latex-recommended texlive-latex-extras texlive-luatex texlive-lang-spanish

vim-config.done:
	git submodule update --init --recursive
	if [ -d "~/.vim" ]; then mkdir ~/.vim; fi
	cp -r vim-config/* ~/.vim
	cp vim-config/.vimrc ~/.vimrc
	cd ~/.vim && sh install.sh
	touch vim-config.done
