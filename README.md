# STEM kiosk project

## Roadmap
- stemkiosk: screencast videos to demo arithmetic and other topics in jupyter notebooks and as `.cast` ASCII casts
  - [ ] create a github org account
  - [ ] create a youtube channel
  - [ ] create content
  - names:
    - **stemkiosk**
    - stemnotebooks
- curriculumtool: curriculum graph tool for coverage
  - create and validate YAML-LD files for each curriculum item
    - create new from template
    - spec: schema.org classes and properties
      - schema.org/CreativeWork
      - schema.org/name
      - schema.org/educationalAlignment
      - schema.org/about
  - example:
    - adding numbers in notebooks ex:depends_upon how to create a notebook
    - how to create a notebook ex:depends_upon / ex:is_satisfied_by / ex:is_covered_by:
      - create a notebook in jupyter notebook
      - create a notebook in jupyter lab
      - create a notebook in colab
      - create a notebook in vscode
      - create a notebook in vscode.dev
      - create a notebook from markdown with jupytext
      - create a notebook from python with jupytext
  - generate reports from the graph nodes and edges:
    - graph traversals through the topologically-sorted curricula items
    - video playlists
    - combined video sequence(s) that inductively present the material
      - e.g. a transitive sort with `tsort` should present the requisite
        material first, if there are enough edges between the
        curriculum items

### screencast recording setup
  - create a screencast user
  - create a screencast container or vm
  - set the screen resolution and font dpi
  - record browser interaction test cases with:
    - selenium ide, TODO [...]
  - generate a screencast script from a test case
    - manual script for human to record with human typing speed
    - automated script with random typing speed variation
    - titlecards and any other hints for editing
  - add text titlecards
  - generate description of video from curriculumtool metadata
  - zoom in and out
  - display touch and click events:
    - android: default screen recorder
  - display key pressed events:
    - linux: screenkey
  - OBS: Open _ Studio
    - video bitrate:
      - youtube video upload bitrate recommendation: 20000 ?
  - asciicinema or similar
    - ascii terminal session replay
    - probably similar to notebooks for same,
      so maybe useful for getting the tutorial concepts written in code somewhere
- manim-jupyter-simulator
  - generate a manim Python script to replay a notebook in a manim video

## Use Cases, User Stories, Why
- Teach Computer Math, Coding, and STEM at a Science Fair -style event
  - Passive Video
    - Play a Video on repeat on a spare TV
    - Play a Video playlist on repeat on a spare TV
    - Play a Playlist of youtube videos on repeat on spare TV
      - show the shorturl of each video as a subtitle
  - Active Interaction
    - Jupyterlite in a browser tab that gets closed and re-opened after
      a period of inactivity
    - Jupyter in a container that gets shutdown and recreated from a
      container image after a period of inactivity
      - This is how Google Colab and BinderHub and github.dev
        (and gitpod, devpod, kasm,) work
      - BinderHub: User clicks a 'launch in Binder' badge image,
        container is created in the cloud (repo2docker) with everything
        installed,
        the user is logged in and redirected to Jupyter notebook or
        JupyterLab running in the container.
        for the user from a git repo, and then logs them into the
        container, and when it times out, the container is destroyed
      - Github.dev, gitpod etc; basically the same thing
      - https://mybinder.org/ works)

## CurriculaGraph

- Tools
  - Notebooks: Create a notebook in {JupyterLite, Colab, vscode.dev,}
  - Python: Arithmetic in Python
  - Git: Learn git with learngitbranching.js.org
  -

##  STEM Kiosk Roadmap: Phase 1

```sh
$ tree ./stemkiosk/   # TODO: re-run this
```

```
stemkiosk/     # project directory
./.git/        # learngitbranching.js.org


./README.md    # Markdown or
./README.rst   # ReStructuredText
./docs/        # Documentation; "Read The Docs"
./data/
./notebooks/
./scripts/
./scripts/
./screencasts/
./COPYING      #
./LICENSE      # 
```


## Memes
- STEM AI is the Future
  You should learn to code
- STEM AI is the Future
  Everybody Codes Now

.

- Stem AI is the Future
  How to Python and Shell

# Tools


## Programming Languages
### Python

### Bash

### Make

## IDEs

### Vim
- Src: https://github.com/vim/vim
- Wikipedia: https://en.wikipedia.org/wiki/Vim_(text_editor)
- Homepage: https://www.vim.org/
- Docs: https://www.vim.org/docs.php
- Docs: https://github.com/vim/vim/blob/master/runtime/tutor/en/vim-01-beginner.tutor
- Docs: https://learnxinyminutes.com/docs/vim/
- Src: git https://github.com/vim/vim

ViM (Vi-iMproved) is an open source programmers' text editor written in C
that's available on very many platforms.

* Vim help can be accessed with `:help` and `:help help`
  (Press `<esc>`, Type `:help help`, Press Enter)
* Vi is almost always installed on Linux and BSD boxes.
* Vi is often included with Busybox.
* Vi and Vim are installed with OSX.
* Vi and Vim are installed by default on many Linux
  Distributions.
* Vim runs in a terminal, over SSH, and with a GUI window manager
  (Gvim, Macvim)
* Vim configuration is written in the vim language.
* Vim reads a few vimrc configuration files in sequence (`:help vimrc`)
* GVim is Vim for Gnome window manager
* GVim reads a few vimrc configuration files in sequence (`:help gvimrc`)
* MacVim is Vim for OSX
* One way to write changes and exit vim: `:wq!`
  (Press `<esc>`, Type `:wq!`, Press Enter)
* There are many plugins for vim.
* NERDTree is an example of a vim plugin:
  https://github.com/scrooloose/nerdtree (`:help nerdtree`)
* SpaceVim and westurner/dotvim include the NERDtree plugin
* Vim keyboard shortcuts are calling mappings.
* Vim mappings are defined in a vimrc file.
* Examples of vim mappings:
  `\e` opens NERDTree, `\E` opens NERDTree to the current file
* Vim mappings can be defined for different vim modes:
  `:map \e` (command mode), `:imap \e` (insert mode) (`:help modes`)
* Press `i` or `a` while in command mode to enter
  insert or append mode (`:help vim-modes`)
* Press `<Esc>` to return to command mode

Browser extensions with vim-style keyboard shortcuts:

* Vimium (Chrome)
* Vimperator (Firefox)
* Wasavi (Chrome, Opera, Firefox)

A number of web apps support vim-style keyboard shortcuts
like `j` and `k` for up and down:

- GMail (`?` for help)
- Facebook (`?` for help)
- X (`?` for help)
- GitHub (`?` for help, `<Esc>` to close help)

Games with support for vim-style keyboard shortcuts:

- vimtutor: `:e $VIMRUNTIME/tutor/en/vim-01-beginner.tutor`
- https://vim-adventures.com/

IDEs with support for vim-style keyboard shortcuts:

- vscode, https://vscode.dev/, https://github.dev/, gitpod, devpod, code-server
- jupyterlab, jupyterlite
- colab
- neovim
- vim
- vi (busybox (initrd,))

How to access help in vim:

- `:help` -- open help in a split (`<Esc>`, then `:help`, then **Enter** (`<CR>`); `:q` to close)
- `C-w-j` -- focus a window down ((`<Esc>` to exit insert or append mode), then `<Ctrl><w> <h/j/k/l>`; `:map <C-W>J`)
- `Ctrl-]` -- follow (help,) link under cursor
- `Ctrl-O` -- go back
- `Ctrl-I` -- go forward


### VSCode
- Wikipedia: https://en.wikipedia.org/wiki/Visual_Studio_Code
- Homepage: https://code.visualstudio.com/
- Src: https://github.com/Microsoft/vscode
- Download: https://code.visualstudio.com/Download
- ChocolateyPkg: https://chocolatey.org/packages/vscode
- BrewPkg: https://formulae.brew.sh/cask/visual-studio-code
- FlatpakPkg: https://flathub.org/apps/com.visualstudio.code
- Docs: https://code.visualstudio.com/docs/
- Docs: https://code.visualstudio.com/docs/getstarted/tips-and-tricks
- Docs: https://code.visualstudio.com/docs/getstarted/keybindings

VSCode (*Visual Studio Code*) is an open source programmer's text editor
written in TypeScript, Javascript, and CSS
that's available for Windows, Mac, and Linux.

* VSCode extensions are written in JS and TS.
* VSCode has collaborative editing features with multiple cursors.
* VSCode and MS Visual Studio are different projects.
* VSCode supports many of the Visual Studio keyboard shortcuts.
* There is an official Vim extension for VSCode.
* VSCode takes inspiration from the NERDTree, CtrlP, and TagBar vim extensions.
* The vscode Outline view is below the open directory in the Explorer tab of the sidebar.
* VScode keyboard shortcuts for Linux and Windows:
  * `Ctrl-Shift-p` or `F1` opens the Command Palette
  * `Ctrl-p` opens the Go to File dialogue
    (which lists all available commands based on your current context)
  * `Ctrl-Space` opens the context-sensitive Intellisense code completion
  * `` Ctrl-` ``  (Ctrl-backtick) toggles the Terminal open and closed
  * `Ctrl-D` (or `Enter`) advances to the next `Ctrl-F` search match.
  * `Ctrl-Shift-.` opens breadcrumbs
  * `Ctrl-B` toggles the sidebar
  * `Ctrl-Shift-E` toggles or sets focus to Explorer
  * `Ctrl-Shift-G` toggles or sets focus to Source Control (git)
  * `Ctrl-Shift-V` opens a Markdown HTML preview
  * `Ctrl-w` closes a tab
  * `Shift-Alt` + Click-and-Drag selects a rectangle of rows and/or columns of characters
  * `Alt-Up/Down` moves the current line or selection up or down 
  * `Home` and `End` (`Fn-Left` and `Fn-Right`) go the the beginning and end of a line
  * `F5` runs the file or the debugger
  * `Shift-F5` stops the debugger
  * `F11` / `Shift-F11` Step into/out
  * `F10` Step over
  * `Ctrl-K Ctrl-R` or `Ctrl-Shift-P` + "Help: Keyboard Shortcuts References"
     opens the *online* vscode keyboard shortcuts document for Win/Mac/Lin:
    * https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf `Ctrl`
    * https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf `⌘`
    * https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf `Ctrl`
  * VScode keybindings docs: https://code.visualstudio.com/docs/getstarted/keybindings
* `Ctrl-Shift-P` "Remote Tunnels:" > "Get started with tunnels"
  - https://aka.ms/remote-tunnels-doc
* `Ctrl-Shift-P` "Remote-SSH:" > "Help", "Settings"
  - https://aka.ms/vscode-remote/ssh
* `Ctrl-Shift-P` "Dev containers:" > "Help"
  - https://aka.ms/vscode-remote/containers


#### vscode.dev
- Homepage: https://vscode.dev/
- Docs: https://code.visualstudio.com/docs/editor/vscode-web
- Docs: https://code.visualstudio.com/api/extension-guides/web-extensions

Visual Studio Code for the Web (vscode.dev) is a WASM (WebAssembly)
build of `vscode`_ that runs in a browser,
optionally without connecting to a `code-server` on a server.

* vscode.dev works in Chrome on Chromebooks.
* The `Ctrl-Shift-P` to open Command Palette keyboard shortcut doesn't work in Firefox. 
* some vscode extensions support vscode.dev

Extensions that work in vscode.dev on a Chromebook:

- vscode-pyodide: https://marketplace.visualstudio.com/items?itemName=joyceerhl.vscode-pyodide
- Pyodide Runner: https://marketplace.visualstudio.com/items?itemName=tym-inc.pyodide
- Python: https://marketplace.visualstudio.com/items?itemName=ms-python.python
- Jupyter: https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter
- container-wasm: https://marketplace.visualstudio.com/items?itemName=ktock.container-wasm
  - container2wasm: https://github.com/ktock/container2wasm


### devcontainer.json
- Homepage: https://containers.dev/
- Spec: https://containers.dev/implementors/json_reference/
- Src: https://github.com/devcontainers/spec
- Src: https://github.com/devcontainers/features/tree/main/src
- Src: https://github.com/devcontainers/cli
- Src: https://github.com/devcontainers

Devcontainer.json is a specification for specifying one or more containers to run;
specifically for IDEs like {ref}`vscode`.

#### vscode Dev Containers
- Docs: https://code.visualstudio.com/docs/devcontainers/containers

Keyboard Shortcuts for vscode Dev Containers:

- `Ctrl-Shift-P` "Dev Containers:"
- `Ctrl-Shift-P` "Dev Containers: Open Container Configuration File"
- `Ctrl-Shift-P` "Dev Containers: Open Folder in Container"
- `Ctrl-Shift-P` "Dev Containers: Open Workspace in Container"
- `Ctrl-Shift P` "Dev Containers: Reopen Folder Locally"
- `Ctrl-Shift P` "Dev Containers: Help"

Devcontainer Features:

- Devcontainer Features are composable; you can add multiple features to a `devcontainer.json`.
- Devcontainer Features split configuration that can be just one `Dockerfile` into many JSON & `Dockerfile`s.
- An SBOM tool could discover the versions of software installed in a devcontainer
  by: instructions in the devcontainer.json, instructions in the Dockerfile, Devcontainer Features,
  or other.


## Screencasting Tools review
- Lists, Reviews
  - awesome-terminal-recorder
    https://github.com/orangekame3/awesome-terminal-recorder
  - https://www.linuxlinks.com/best-free-open-source-terminal-session-recording/

### OBS Studio
- Web: https://obsproject.com/
- Src: https://github.com/obsproject/obs-studio
- FlatpakPkg: https://flathub.org/apps/com.obsproject.Studio
- Description: OBS Studio is an open source video recording and live streaming app
  for Windows, Mac, and Linux that supports recording screencasts

### GPU Screen Recorder
- Src: https://git.dec05eba.com/gpu-screen-recorder
- Src: https://git.dec05eba.com/gpu-screen-recorder-gtk/
- FlatpakPkg: https://flathub.org/apps/com.dec05eba.gpu_screen_recorder
- GPU Screen Recorder is an open source screeen recording app that
  does GPU hardware offloading for encoding,

### t-rec-rs
- Src: https://github.com/sassman/t-rec-rs
- t-rec doesn't support wayland, but does support X11:
  https://github.com/sassman/t-rec-rs/issues/211#issuecomment-2606297216


## Show keys pressed in the screencast
### screenkey
- Src: https://gitlab.com/screenkey/screenkey
- screenkey doesn't support wayland, but does support X11:
  https://gitlab.com/screenkey/screenkey/-/issues/61

### showmethekey
- Src: https://github.com/AlynxZhou/showmethekey

## Text-based screencast tools

### asciinema
- https://github.com/topics/asciinema
- Asciinema is an open source screencast recorder that generates a .cast JSON file containing the log of keyboard button presses.

- Asciinema v1 was written in Python.
- Asciinema v2 is written in Rust.
- The `.cast` v2 file format is JSON.
- Asciinema calls `agg` (Rust) to generate `.gif` from a `.cast` file.
- TODO: generates an *SVG* screencast from a `.cast` file with minimal file size
  (because each terminal character is encoded as an SVG symbol)


### asciifx
- Src: https://github.com/apparebit/asciifx
- Src: https://github.com/apparebit/asciifx/tree/boss/asciifx
- Description: asciifx is an open source ASCII screencast tool
  which generates a .cast file from a .py file with `#[pragma]` comments.

```sh
python -m ensurepip -U && pip install pipx && pipx install --include-deps asciifx
python -m asciifx --width 80 --height 24 -o output.cast scripts/math/arithmetic.py
```
- [ ] add syntax highlighting to asciifx
  - https://github.com/apparebit/asciifx/issues/1

## Chromebook
### Coding on a Chromebook
- Chromebooks support HTML, JS, and WASM.
- Some Chromebooks support Android apps from the Play Store.
- Some Chromebooks support containers, but not for student users.
- Chromebooks support WebExtensions for Chrome, but not for student users.
- Chromebooks support SSH, but not for student users.
- Web Terminals that work in Chrome on a Chromebook:
  - Google Colab, Kaggle Kernels, GitHub.dev Codespaces
  - Self-hosted: MoSH, JupyterLab Terminal
  - repl.it
- *Inspect Element* (Devtools; Ctrl-Shift-I) is disabled on chromebooks
  for student users.
  - jsfiddle, repl.it
- container2wasm compiles containers to WASM

### ChromeOS Flex VM w/ QEMU
- [ ] TODO: link to virt-manager/qemu-system-x86 script form ChromeOS flex that works with VNC but either the mouse or the GL graphics are borked; variations
- ChromeOS Flex doesn't support containers or Android apps.
  - Waydroid supports Android apps within a LineageOS x86 container.


### Android apps for Python and Data Science
#### Termux
- PlayStore: https://play.google.com/store/apps/details?id=com.termux
- FDroid: https://f-droid.org/en/packages/com.termux/
- Docs: https://wiki.termux.com/wiki/Python
```sh
pkg update && pkg upgrade \
pkg install python python-numpy matplotlib
```
```sh
#pkg install build-essential
#pkg install proot proot-distro
#pkg install vim git sqlite bash
#pkg install gitea
```
- https://github.com/westurner/dotfiles/blob/develop/scripts/setup_conda_termux.sh
  - `proot-distro`
  - TODO: test: Miniforge3 arm64
