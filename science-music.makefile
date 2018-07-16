TARGETS=timidty ssh-key-at-github ~/science
.PHONY: all $(TARGETS)

all: timidity anaconda.done music21.done matplotlib.done ~/science latex.done

timidity:
ifeq (,$(shell which timidity))
	sudo apt -y install timidity
endif

music21.done:
	pip install music21 && touch music21.done
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

matplotlib.done:
	pip install matplotlib
	touch matplotlib.done

ssh-key-at-github.done:
	make -f ssh-key.makefile
	@echo ">> Configure new ssh key in github..."
	@read -p ">> Done? " done
	touch $@

~/science: ssh-key-at-github
	git clone git@gitlab.liaa.dc.uba.ar:mmiguel/science.git ~/science
	cd $@ ; git submodule update --recursive
	touch $@
