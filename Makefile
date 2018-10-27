.PHONY: apt google-chrome latex.done wallpaper.done anaconda.done vim-config.done

apt:
	@echo ">> Installing general packages"
	sudo apt install git vim byobu \
		htop sshfs ack-grep xclip \
		make timidty cmake

latex.done:
	@echo ">> Installing latex"
	sudo apt install texlive-latex-base \
		texlive-latex-extra \
		texlive-lang-spanish \
		texlive-science \
		&& touch latex.done

wallpaper.done:
	gsettings set org.gnome.desktop.background picture-uri file://./wallpaper/1920x1200.jpg"
	gsettings set org.gnome.desktop.screensaver picture-uri file://./wallpaper/1920x1200.jpg"
	touch wallpaper.done

anaconda.done:
	wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
	sh Anaconda3-5.3.0-Linux-x86_64.sh
	touch anaconda.done


google-chrome:
ifeq (,$$(shell which $@))
	@echo ">> Installing google-chrome"
	sh install-scripts/chrome.sh
endif

vim-config.done:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp .vimrc ~/.vimrc
	vim -c ":VundleInstall"
	# YouCompleteMe
	sudo apt -y install build-essential cmake python3-dev
	python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
	touch vim-config.done

git-config.done:
	cp .gitconfig ~/.gitconfig
	touch git-config.done

spotify:
ifeq (,$$(shell which $@))
	@echo "Install from Ubuntu Software"
	@echo "Press enter when installed..."
	@read OK
endif

terminal-colors.done:
	wget -O xt https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/hybrid.sh && \
	    chmod +x xt && \
	    ./xt && rm xt && \
    	    touch terminal-colors.done

terminal-fonts.done:
	sh install-terminal-font.sh
	@echo "Configure font in terminal settings"
	@echo "Press enter when done..."
	@read OK
	touch terminal-fonts.done

workspaces.done:
	sudo apt -y install gnome-tweaks
	@echo "\nOpen Gnome Tweak Tools and set 4 static workspaces"
	@echo "Press enter when done..."
	@read OK
	@echo "\nOpen Keyboard shortcut settings and map the workspace keys"
	@echo "Press enter when done..."
	@read OK
