
default: help

help:
	@$(MAKE) --no-print-directory echostem
	@printf "\n"
	@echo "# stemkiosk Makefile"
	@echo ""
	@echo "## Options"
	@grep ./Makefile -e '^[a-z].*:' -A 1 | grep -v '^\.'  #| sed 's/:/ - /'


install:
	#type mamba || $(MAKE) install_miniforge
	$(MAKE) install_environmentyml
	$(MAKE) install_requirementstxt
	$(MAKE) install_postInstall

install_requirementstxt:
	pip install -r requirements.txt

MAMBA?=mamba
install_environmentyml:
	echo "MAMBA=${MAMBA}"
	${MAMBA} env update -f environment.yml

install_postInstall:
	bash -x ./postInstall

docs:
	$(MAKE) -C docs html

docs-serve:
	$(MAKE) -C docs serve &
	$(MAKE) -C docs html

docs/topics/math/%.py.cast: docs/topics/math/%.py
	python -m asciifx --width 80 --height 24 -o $@ $<

FONTFAMILY=Source Code Pro for Powerline,JetBrains Mono,Fira Code,SF Mono,Menlo,Consolas,DejaVu Sans Mono,Liberation Mono

AGG=./agg
docs/topics/math/%.py.cast.gif: docs/topics/math/%.py.cast
	${AGG} --speed=10 --font-family="${FONTFAMILY}" --theme=github-dark --font-size=27 $< $@

docs/topics/math/%.py.cast.gif-play: docs/topics/math/%.py.cast.gif
	xdg-open $<

all:
	$(MAKE) docs/topics/math/arithmetic/arithmetic.py.cast
	$(MAKE) docs/topics/math/arithmetic/arithmetic.py.cast.gif

termsaver:
	#pip install termsaver
	termsaver programmer -p ./docs/topics/math/arithmetic/arithmetic.py
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
	@asciinema play --speed=80 docs/topics/math/arithmetic/arithmetic.py.cast

play-arithmetic:
	@asciinema play --speed=25 docs/topics/math/arithmetic/arithmetic.py.cast

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
	rm -f docs/topics/math/arithmetic/*.cast docs/topics/math/arithmetic/*.cast.gif


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
	# create a user named $$SCREENCASTUSER if one doesn't already exist
	id "${SCREENCASTUSER}" || sudo useradd "${SCREENCASTUSER}" --create-home
	# git clone the stemkiosk repo into ~/workspace/stemkiosk
	${sudoscreen} sh -x -c 'mkdir -p ~/workspace; cd ~/workspace/; test -d stemkiosk/ || git clone https://github.com/westurner/stemkiosk; cd stemkiosk/ && ls -al'
	# install miniforge
	$(MAKE) _install-miniforge-screencast-user
	# run `make install` and then ls ~/.local/bin
	${sudoscreen} sh -x -c 'cd ~/workspace/stemkiosk;MAMBA="${mamba}" make install ; test ! -d ~/.local/bin || ls -al ~/.local/bin'
	# login at least once to attempt to clear the initial login banner
	${sudoscreen} -i bash --login -c '(set -x; cat ~/.bash_history) && echo "+ </cat>"; exit'

_rm-screencast-user:
	id "${SCREENCASTUSER}" && sudo userdel --remove "${SCREENCASTUSER}" || true

MINIFORGE3_SH=Miniforge3-$(shell uname)-$(shell uname -m).sh
MINIFORGE3_URL=https://github.com/conda-forge/miniforge/releases/latest/download/${MINIFORGE3_SH}
CONDA_ROOT_SCU=/home/${SCREENCASTUSER}/conda
WORKSPACE=/home/${SCREENCASTUSER}/workspace
mamba=${CONDA_ROOT_SCU}/bin/mamba
XDG_CONFIG_HOME?=/home/${SCREENCASTUSER}/.config
_install-miniforge-screencast-user:
	# Install miniforge:  https://github.com/conda-forge/miniforge
	@echo "MINIFORGE3_URL: ${MINIFORGE3_URL}"
	${sudoscreen} sh -x -c 'cd "${WORKSPACE}" && test -f "${MINIFORGE3_SH}" || curl -L -o "${MINIFORGE3_SH}" "${MINIFORGE3_URL}"'
	# TODO: check checksum
	${sudoscreen} sh -x -c 'cd "${WORKSPACE}" && test -d "${CONDA_ROOT_SCU}" || bash "${MINIFORGE3_SH}" -b -p "${CONDA_ROOT_SCU}"'
	#${sudoscreen} sh -x -c 'ls -al ~/.config/conda*; XDG_CONFIG_HOME="${XDG_CONFIG_HOME}" ${mamba} init'
	${sudoscreen} sh -x -c 'XDG_CONFIG_HOME="/home/${SCREENCASTUSER}" CONDARC="${CONDA_ROOT_SCU}/.condarc" ${mamba} init'
	${sudoscreen} -i bash --login -c 'mamba activate "${CONDA_ROOT_SCU}" && set -x && ${mamba} env export --from-history'

.PHONY: docs



BUILDDIRHTML=docs/_build/html
DOCS_GIT_HTML_BRANCH=gh-pages
gh-pages:
	# Push docs to gh-pages branch with a .nojekyll file
	ghp-import -n -b '${DOCS_GIT_HTML_BRANCH}' -p '${BUILDDIRHTML}' \
		-m "DOC,RLS: :books: docs built from: $(shell git -C $(shell pwd) rev-parse --short HEAD)"
	GIT_PAGER='' git log -n3 --reverse --stat '${DOCS_GIT_HTML_BRANCH}'
