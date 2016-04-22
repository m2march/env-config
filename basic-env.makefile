.PHONY: font vim-config YouCompleteMe git-config gnome-terminal \
	redshift xclip

font:
	sh install-terminal-font.sh

vim-config:
	git submodule update --init --recursive
	cd vim-config

YouCompleteMe: vim-config
	sudo apt-get install cmake python-dev
	pushd ~/.vim/bundle/YouCompleteMe
	./install.sh
	popd

git-config:
	cp .gitconfig ~/.gitconfig

gnome-terminal:
	./m2-gnome-terminal.conf.sh

redshift:
	sudo apt-get install redshift
	cp .redshiftrc ~/.redshiftrc

xclip:
	sudo apt-get install xclip
	echo '' >> ~/.bash_aliases
	echo '# xclip aliases' >> ~/.bash_aliases
	echo 'alias copy="xclip -i -selection clipboard"' >> ~/.bash_aliases
	echo 'alias paste="xclip -o -selection clipboard"' >> ~/.bash_aliases

z:
	echo '' >> ~/.bashrc
	echo '# z (https://github.com/rupa/z)' >> ~/.bashrc
	cp z ~/.z
	echo '. ~/.z/z.sh' >> ~/.bashrc
