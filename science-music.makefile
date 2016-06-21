TARGETS=timidty 
.PHONY: all $(TARGETS)

all: timidity music21.done matplotlib.done

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
