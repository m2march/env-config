TARGETS=timidty ssh-key-at-github ~/science
.PHONY: all $(TARGETS)

all: timidity anaconda.done ~/science latex.done

timidity:
ifeq (,$(shell which timidity))
	sudo apt -y install timidity
endif

music21.done:
	sudo python -m pip install music21 && touch music21.done
	cp music21rc ~/.music21rc

anaconda.done:
	bash install-scripts/anaconda.sh
	touch $@

latex.done:
	sudo apt install texlive-latex-base \
		texlive-latex-extra \
		texlive-lang-spanish \
		texlive-science \
		&& touch latex.done

ssh-key-at-github:
	make -f ssh-key.makefile
	@echo ">> Configure new ssh key in github..."
	@read -p ">> Done? " done

~/science: ssh-key-at-github
	git clone git@gitlab.liaa.dc.uba.ar:mmiguel/science.git ~/science
	cd $@ ; git submodule update --recursive
