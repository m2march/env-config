APP_TARGETS=vim byobu ipython tree mc sshfs ack chrome \
	unity-tweak-tool spotify \
	redshift xclip htop openssh-server
DONE_TARGETS=workspace-config.done font.done \
	YouCompleteMe.done vim-config.done z.done \
	git-config.done pip.done
.PHONY: all $(APP_TARGETS) 

all: $(APP_TARGETS) $(DONE_TARGETS)

byobu: 
ifeq (,$(shell which byobu))
	sudo apt -y install byobu
endif

vim:
ifeq (,$(shell which vim))
	sudo apt -y install vim-nox-py2
endif

ipython: 
ifeq (,$(shell which ipython))
	sudo apt -y install ipython
endif

pip.done:
	sudo apt install python-pip && touch pip.done

tree:
ifeq (,$(shell which tree))
	sudo apt -y install tree
endif

mc:
ifeq (,$(shell which mc))
	sudo apt -y install mc
endif

htop:
ifeq (,$(shell which htop))
	sudo apt install htop
endif

sshfs:
ifeq (,$(shell which sshfs))
	sudo apt -y install sshfs
endif

ack:
ifeq (,$(shell which ack))
	sudo apt -y install ack-grep
endif

openssh-server:
ifeq (,$(shell which sshd))
	sudo apt -y install openssh-server
endif

google-chrome:
ifeq (,$$(shell which $@))
	sh install-scripts/chrome.sh
endif


unity-tweak-tool:
ifeq (,$(shell which unity-tweak-tool))
	sudo apt -y install unity-tweak-tool
endif

workspace-config.done: | unity-tweak-tool
	@echo ""
	@echo ">> Configure workspaces disposition..."
	unity-tweak-tool
	@read -p ">> Done? " done
	@echo ">> Configure workspace bidings... (keyboard settings)"
	@read -p ">> Done? " done
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
	cp vim-config/.vimrc ~/.vimrc
	touch vim-config.done
	

YouCompleteMe.done: vim-config
	sudo apt -y install cmake python-dev
	cd ~/.vim/bundle/YouCompleteMe && ./install.sh
	touch YouCompleteMe.done

git-config.done:
	cp .gitconfig ~/.gitconfig && touch git-config.done

gnome-terminal.done:
	./m2-gnome-terminal.conf.sh && touch gnome-terminal.done

redshift:
ifeq (,$(shell which redshift))
	sudo apt -y install redshift
		cp redshift.conf ~/.config/redshift.conf
endif

xclip:
ifeq (,$(shell which xclip))
	sudo apt -y install xclip
	echo '' >> ~/.bash_aliases
	echo '# xclip aliases' >> ~/.bash_aliases
	echo 'alias copy="xclip -i -selection clipboard"' >> ~/.bash_aliases
	echo 'alias paste="xclip -o -selection clipboard"' >> ~/.bash_aliases
endif

z.done:
	cd z; git submodule update --init
	echo '' >> ~/.bashrc
	echo '# z (https://github.com/rupa/z)' >> ~/.bashrc
	rm -rf ~/.z-script
	cp -r z ~/.z-script
	echo '. ~/.z-script/z.sh' >> ~/.bashrc
	touch z.done

cool_aliases.done:
	cat cool_aliases.sh >> ~/.bash_aliases	
	touch cool_aliases.done
