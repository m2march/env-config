TARGETS=timidty ssh-key-at-github ~/science
.PHONY: all $(TARGETS)

all: timidity music21.done matplotlib.done ~/science

timidity:
ifeq (,$(shell which timidity))
	sudo apt -y install timidity
endif

music21.done:
	sudo python -m pip install music21 && touch music21.done
	cp music21rc ~/.music21rc

latex.done:
	sudo apt install texlive-latex-base \
		texlive-latex-extra \
		texlive-lang-spanish \
		texlive-science \
		&& touch latex.done

matplotlib.done:
	sudo apt install python-matplotlib
	touch matplotlib.done

ssh-key-at-github:
	make -f ssh-key.makefile
	@echo ">> Configure new ssh key in github..."
	@read -p ">> Done? " done

~/science: ssh-key-at-github
	git clone git@gitlab.liaa.dc.uba.ar:mmiguel/science.git 
	cd $@ ; git submodule update --recursive
