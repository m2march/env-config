TARGETS=vim byobu ipython tree mc sshfs ack chrome \
	unity-tweak-tool spotify \
	redshift xclip
DONE_TARGETS=workspace-config.done font.done \
	YouCompleteMe.done vim-config.done z.done \
	git-config.done pip.done
.PHONY: all $(TARGETS) 

all: $(TARGETS) $(DONE_TARGETS)

byobu: 
ifeq (,$(shell which byobu))
	sudo apt-get -y install byobu
endif

vim:
ifeq (,$(shell which vim))
	sudo apt-get -y install vim
endif

ipython: 
ifeq (,$(shell which ipython))
	sudo apt-get -y install ipython
endif

pip.done:
	sudo apt-get install python-pip && touch pip.done

tree:
ifeq (,$(shell which tree))
	sudo apt-get -y install tree
endif

mc:
ifeq (,$(shell which mc))
	sudo apt-get -y install mc
endif

sshfs:
ifeq (,$(shell which sshfs))
	sudo apt-get -y install sshfs
endif

ack:
ifeq (,$(shell which ack))
	sudo apt-get -y install ack-grep
endif

google-chrome:
ifeq (,$$(shell which $@))
	sh install-scripts/chrome.sh
endif


unity-tweak-tool:
ifeq (,$(shell which unity-tweak-tool))
	sudo apt-get -y install unity-tweak-tool
endif

workspace-config.done: | unity-tweak-tool
	@echo ""
	@echo ">> Configure workspaces disposition..."
	unity-tweak-tool
	@read -p ">> Done?" done
	@echo ">> Configure workspace bidings... (keyboard settings)"
	@read -p ">> Done?" done
	touch workspace-config.done

spotify:
ifeq (, $(shell which spotify))
	sh install-scripts/spotify.sh
endif

font.done:
	sh install-terminal-font.sh
	touch font.done

vim-config.done: vim
	git submodule update --init --recursive
	if [ -d "~/.vim" ]; then mkdir ~/.vim; fi
	cp -r vim-config/* ~/.vim
	touch vim-config.done
	

YouCompleteMe.done: vim-config
	sudo apt-get -y install cmake python-dev
	cd ~/.vim/bundle/YouCompleteMe && ./install.sh
	touch YouCompleteMe.done

git-config.done:
	cp .gitconfig ~/.gitconfig && touch git-config.done

gnome-terminal.done:
	./m2-gnome-terminal.conf.sh && touch gnome-terminal.done

redshift:
ifeq (,$(shell which redshift))
	sudo apt-get -y install redshift
	cp .redshiftrc ~/.redshiftrc
endif

xclip:
ifeq (,$(shell which xclip))
	sudo apt-get -y install xclip
	echo '' >> ~/.bash_aliases
	echo '# xclip aliases' >> ~/.bash_aliases
	echo 'alias copy="xclip -i -selection clipboard"' >> ~/.bash_aliases
	echo 'alias paste="xclip -o -selection clipboard"' >> ~/.bash_aliases
endif

z.done:
	echo '' >> ~/.bashrc
	echo '# z (https://github.com/rupa/z)' >> ~/.bashrc
	cp -r z ~/.z-script
	echo '. ~/.z-script/z.sh' >> ~/.bashrc
	touch z.done
