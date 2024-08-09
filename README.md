# Dotfiles - Andrew Gerstenslager

This is my dotfiles repo where I will keep my configs stored. This is mostly a document where I can come back and see my own resoning for my configs, but feel free to check out this repo.

### Basic Outline
There are a few features I want in my config:
- Neovim
- Tmux
- Bash Theming

### Bash reasoning
I am using bash to keep my config minimal and for now oh-my-bash gives me every feature I'd like. The only feature not really given to me is autocomplete suggestions in line, but I can still partially type the command and search through the history of the previous commands.

### Neovim
My neovim is a configured Kickstart neovim config [original repo here](https://github.com/nvim-lua/kickstart.nvim).

I have some additional things I've done so far:
- Python LSP support
- Python support for sending code from a python file to a REPL for a feel similar to a jupyter notebook. Plots and images can still be rendered but won't be inline like the rendered views jupyter provides
- In-editor markdown preview rendering
- Enabled most of the kickstart plugins including neotree, autopairs, gitsigns, indentline
- LazyGit popup window with the lazygit plugin alongside installed lazygit

### Setup Process
I also outlined the programs I installed plus the dependencies I have for them in [this file](things_installed_notes.md)
