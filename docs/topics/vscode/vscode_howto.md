## VSCode
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


### vscode.dev
- Homepage: https://vscode.dev/
- Docs: https://code.visualstudio.com/docs/editor/vscode-web
- Docs: https://code.visualstudio.com/api/extension-guides/web-extensions

vscode.dev is a WASM build of `vscode`_ (Visual Sutdio Code for the Web)
that runs in a browser,
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


## devcontainer.json
- Homepage: https://containers.dev/
- Spec: https://containers.dev/implementors/json_reference/
- Src: https://github.com/devcontainers/spec
- Src: https://github.com/devcontainers/features/tree/main/src
- Src: https://github.com/devcontainers/cli
- Src: https://github.com/devcontainers

Devcontainer.json is a specification for specifying one or more containers to run;
specifically for IDEs like `vscode`_.

### vscode Dev Containers:
- Docs: https://code.visualstudio.com/docs/devcontainers/containers

Keyboard Shortcuts for vscode Dev Containers:

- `Ctrl-Shift-P` "Dev Containers:"
- `Ctrl-Shift-P` "Dev Containers: Open Container Configuration File"
- `Ctrl-Shift-P` "Dev Containers: Open Folder in Container"
- `Ctrl-Shift-P` "Dev Containers: Open Workspace in Container"
- `Ctrl-Shift P` "Dev Containers: Reopen Folder Locally"
- `Ctrl-Shift P` "Dev Containers: Help"

Devcontainer Features:

- Devcontainer Features are composable; you can add multiple features to a devcontainer.json.
- Devcontainer Features split configuration that would be in just one Dockerfile into many JSON and Dockerfiles.
- An SBOM tool could discover the versions of software installed in a devcontainer
  by: instructions in the devcontainer.json, instructions in the Dockerfile, Devcontainer Features,
  or other.
