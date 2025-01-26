
default: help

help:
	@$(MAKE) --no-print-directory echostem
	@printf "\n"
	@echo "# stemkiosk Makefile"
	@echo ""
	@echo "## Options"
	@grep ./Makefile -e '^[a-z].*:' -A 1 | grep -v '^\.'  #| sed 's/:/ - /'


install:
	$(MAKE) install_environmentyml
	$(MAKE) install_requirementstxt
	$(MAKE) install_postInstall

install_requirementstxt:
	pip install -r requirements.txt

install_environmentyml:
	mamba env update -f requirements.txt

install_postInstall:
	bash -x ./postInstall

docs/topics/math/%.py.cast: docs/topics/math/%.py
	python -m asciifx --width 80 --height 24 -o $@ $<

FONTFAMILY=Source Code Pro for Powerline,JetBrains Mono,Fira Code,SF Mono,Menlo,Consolas,DejaVu Sans Mono,Liberation Mono

AGG=./agg
docs/topics/math/%.py.cast.gif: docs/topics/math/%.py.cast
	${AGG} --speed=10 --font-family="${FONTFAMILY}" --theme=github-dark --font-size=27 $< $@

docs/topics/math/%.py.cast.gif-play: docs/topics/math/%.py.cast.gif
	xdg-open $<

all:
	@#docs/topics/math/%.py.cast
	$(MAKE) docs/topics/math/arithmetic.py.cast.gif

termsaver:
	#pip install termsaver
	termsaver programmer -p ./docs/topics/math/arithmetic.py
	@echo https://github.com/brunobraga/termsaver

termsaver-matrix:
	termsaver matrix

echostem:
	@echo -e '\033[1m'
	@cat data/ascii_stem_1__taag.txt
	@echo -e '\033[0m'

echotitle1:
	@echo -e '\033[1m'
	@cat data/ascii_stem_night_1__carty.txt
	@echo -e '\033[0m'

echotitle1_flashing:
	@echo -e '\033[1m\033[5m'
	@cat data/ascii_stem_night_1__carty.txt
	@echo -e '\033[0m'

echotitle2:
	@echo -e '\033[1m'
	@cat data/ascii_stem_night_2__carty.txt
	@echo -e '\033[0m'

echotitle2_flashing:
	@echo -e '\033[1m\033[5m'
	@cat data/ascii_stem_night_2__carty.txt
	@echo -e '\033[0m'

echotitle: echotitle1 echocurriculum

echocurriculum:
	@cat data/stem_curriculum.md

reset:
	@reset

play-arithmetic-too-fast:
	@asciinema play --speed=800 docs/topics/math/arithmetic.py.cast

play-arithmetic:
	@asciinema play --speed=10 docs/topics/math/arithmetic.py.cast

play:
	@reset
	@$(MAKE) --no-print-directory echotitle1_flashing
	@sleep 8 && reset
	@$(MAKE) --no-print-directory echotitle1
	@$(MAKE) --no-print-directory echocurriculum  # TODO: character by character
	@sleep 8
	@echo "Arithmetic in Python with tests and test assertions"
	@#$(MAKE) --no-print-directory termsaver-matrix || true  # TODO: n seconds, increase font size
	@$(MAKE) --no-print-directory play-arithmetic
	@sleep 10 && reset
	@$(MAKE) --no-print-directory echotitle2
	@sleep 2
	@$(MAKE) --no-print-directory echocurriculum  # TODO: character by character
	@sleep 8
	@$(MAKE) --no-print-directory play-arithmetic
	@sleep 10
	@#$(MAKE) docs/topics/math/arithmetic.py.cast.gif-play

time:
	time make play

clean:
	rm -f docs/topics/math/*.cast docs/topics/math/*.cast.gif


_create-docs-folder:
	pip install -q sphinx myst-parser
	mkdir -p docs/_build/html
	sphinx-quickstart \
		--ext-autodoc \
		--ext-doctest \
		--ext-intersphinx \
		--ext-todo \
		--ext-coverage \
		--ext-ifconfig \
		--ext-imgmath \
		--ext-mathjax \
		--ext-viewcode \
		--ext-githubpages \
		--extensions "myst_parser,sphinxcontrib.srclinks" \
		--no-sep \
		--project "stemkiosk" \
		--author "@stemkiosk" \
		--version "0.0.01" \
		--release "1" \
		--language "en" \
		--suffix ".md,.rst" \
		--master README.md \
		--makefile \
		--batchfile \
		docs/
	tree docs/ || ls -alR docs/

SCREENCASTUSER=demo
sudoscreen=sudo -u "${SCREENCASTUSER}"
_create-screencast-user:
	id "${SCREENCASTUSER}" || sudo useradd "${SCREENCASTUSER}" --create-home
	# git clone the stemkiosk repo into ~/workspace/stemkiosk
	${sudoscreen} sh -x -c 'mkdir -p ~/workspace; cd ~/workspace/; test -d stemkiosk/ || git clone https://github.com/westurner/stemkiosk; cd stemkiosk/ && ls -al'
	${sudoscreen} sh -x -c 'cd ~/workspace/stemkiosk; make install; ls -al ~/.local/bin'
