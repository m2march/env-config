TARGETS=timidty 
.PHONY: all $(TARGETS)

all: timidity music21.done matplotlib.done

timidity:
ifeq (,$(shell which timidity))
	sudo apt -y install timidity
endif

music21.done:
	sudo python -m pip install music21 && touch music21.done

latex.done:
	sudo apt install texlive-latex-base texlive-latex-extra && touch latex.done

matplotlib.done:
	sudo apt install python-matplotlib
	touch matplotlib.done
