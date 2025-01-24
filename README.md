# STEM kiosk project

## Roadmap
- stemkiosk: short-form videos to demo arithmetic in jupyter notebooks
  - create a github org account
  - create a youtube channel
  - create content
  - names:
    - stemkiosk
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
- screencast recording setup
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
- Teach Computer Math and STEM at a Science Fair -style event
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
./scripts/{
./screencasts/
./COPYING      #
./LICENSE      # 
```


## Tools review
- Lists, Reviews
  - awesome-terminal-recorder
    https://github.com/orangekame3/awesome-terminal-recorder
  - https://www.linuxlinks.com/best-free-open-source-terminal-session-recording/
- OBS Studio
  - Web: https://obsproject.com/
  - Src: https://github.com/obsproject/obs-studio
  - FlatpakPkg: https://flathub.org/apps/com.obsproject.Studio
  - Description: OBS Studio is an open source video recording and live streaming app
    for Windows, Mac, and Linux that supports recording screencasts
- GPU Screen Recorder
  - Src: https://git.dec05eba.com/gpu-screen-recorder
  - Src: https://git.dec05eba.com/gpu-screen-recorder-gtk/
  - FlatpakPkg: https://flathub.org/apps/com.dec05eba.gpu_screen_recorder
  - GPU Screen Recorder is an open source screeen recording app that
    does GPU hardware offloading for encoding,
- t-rec-rs
  - Src: https://github.com/sassman/t-rec-rs
  - t-rec doesn't support wayland, but does support X11:
    https://github.com/sassman/t-rec-rs/issues/211#issuecomment-2606297216
- screenkey
  - Src: https://gitlab.com/screenkey/screenkey
  - screenkey doesn't support wayland, but does support X11:
    https://gitlab.com/screenkey/screenkey/-/issues/61
- showmethekey
  - Src: https://github.com/AlynxZhou/showmethekey
- asciinema
  - https://github.com/topics/asciinema
- asciifx
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

### Chromebook support for development
- Chromebooks support HTML, JS, and WASM.
- Some Chromebooks support Android apps from the Play Store.
- Some Chromebooks support containers, but not for student users.
- *Inspect Element* (Devtools; Ctrl-Shift-I) is disabled on chromebooks
  for student users.
- Chromebooks support WebExtensions for Chrome, but not for student users
- container2wasm compiles containers to WASM

### ChromeOS Flex VM w/ QEMU
- [ ] TODO: script that almost works, variations

#### Android apps for Python and Data Science
##### Termux
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

## Memes
- STEM AI is the Future
  You should learn to code
- STEM AI is the Future
  Everybody Codes Now

.

- Stem AI is the Future
  How to Python and Shell

