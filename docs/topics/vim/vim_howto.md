
## Vim
- Src: https://github.com/vim/vim
- Wikipedia: https://en.wikipedia.org/wiki/Vim_(text_editor)
- Homepage: https://www.vim.org/
- Docs: https://www.vim.org/docs.php
- Docs: https://github.com/vim/vim/blob/master/runtime/tutor/en/vim-01-beginner.tutor
- Docs: https://learnxinyminutes.com/docs/vim/
- Src: git https://github.com/vim/vim

ViM (Vi-iMproved) is an open source text editor written in C
that's available on very many platforms.

* Vim help can be accessed with `:help` and `:help help`
  (Press `<esc>`, Type `:help help`, Press Enter)
* Vi is almost always installed on Linux and BSD boxes.
* Vi is often included with Busybox.
* Vi and Vim are installed with OSX.
* Vi and Vim are installed by default with many :ref:`Linux
  Distributions`
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