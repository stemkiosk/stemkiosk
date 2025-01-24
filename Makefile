
default: help

help:
	@echo "stemkiosk Makefile"

install:
	pip install -r requirements.txt

scripts/math/%.py.cast: scripts/math/%.py
	python -m asciifx --width 80 --height 24 -o $@ $<

AGG=./agg
scripts/math/%.py.cast.gif: scripts/math/%.py.cast
	${AGG} --theme=github-dark --font-size=28 $< $@

scripts/math/%.py.cast.gif-play: scripts/math/%.py.cast.gif
	xdg-open $<

all:
	@#scripts/math/%.py.cast
	$(MAKE) scripts/math/arithmetic.py.cast.gif

termsaver:
	#pip install termsaver
	termsaver programmer -p ./scripts/math/arithmetic.py
	@echo https://github.com/brunobraga/termsaver

termsaver-matrix:
	termsaver matrix


play:
	@echo "Arithmetic in Python with tests and test assertions"
	@#$(MAKE) termsaver-matrix || true  # TODO: n seconds, increase font size
	asciinema play --speed=80 scripts/math/arithmetic.py.cast
	asciinema play --speed=10 scripts/math/arithmetic.py.cast
	@#$(MAKE) scripts/math/arithmetic.py.cast.gif-play

clean:
	rm -f scripts/math/*.cast scripts/math/*.cast.gif