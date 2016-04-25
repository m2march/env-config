TARGETS=timidty 
.PHONY: all $(TARGETS)

all: timidity music21.done matplotlib.done

timidity:
ifeq (,$(shell which timidity))
	sudo apt-get -y install timidity
endif

music21.done:
	sudo python -m pip install music21 && touch music21.done

latex.done:
	sudo apt-get install texlive-latex-base texlive-latex-extra && touch latex.done

matplotlib.done:
	sudo apt-get install python-matplotlib
	touch matplotlib.done
