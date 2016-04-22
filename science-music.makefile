.PHONY: all \
	timidity music21

all: timidity music21

timidity:
	sudo apt-get install timidity

music21:
	sudo python -m pip install music21
