# Getting Dev Environment Running Notes

Here are some notes that I've taken of things I've installed over the time gettting my fresh WSL 24.04 installation up and running to where I'm happy using it.

### Updating packages
> sudo apt update
>
> sudo apt upgrade

## Terminal Stuff
I'm using bash because ohmybash gives me a pretty good set of features without having to install since most systems normally use bash.

I'm using the 'agnoster' theme, but catppuccin's green does not play well with the white, so I changed it to black. The file is located at ~/.oh-my-bash/themes/agnoster/agnoster.theme.sh and in the 'prompt_virtualenv', 'prompt_pyenv', and 'prompt_condaenv' change the 'cyan white' to 'cyan black' colors to make the text more readable.

### Bash config
##### oh my bash: https://github.com/ohmybash/oh-my-bash
> bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

### Tmux
> sudo apt install tmux

##### tmux plugin manager: https://github.com/tmux-plugins/tpm
> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Neovim

### Dependencies
##### installing these for neovim LSP support (Mason Dependency)
> curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
> sudo apt install -y nodejs
> sudo apt install npm

##### neovim dependency
> sudo apt install unzip
>
> sudo apt install luarocks
>
> sudo apt install ripgrep

##### lazygit for git integration: https://github.com/jesseduffield/lazygit
> LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
>
> curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
> tar xf lazygit.tar.gz lazygit
>
> sudo install lazygit /usr/local/bin

### Neovim itself
> sudo apt-get install software-properties-common
>
> sudo add-apt-repository ppa:neovim-ppa/unstable
>
> sudo apt-get update
>
> sudo apt-get install neovim

### Homebrew
##### docs page https://brew.sh/
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
> echo >> /home/andrew/.bashrc
> echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/andrew/.bashrc
> eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Image Support
Image Nvim Page [here](https://github.com/3rd/image.nvim?tab=readme-ov-file)
##### ImageMagic
> sudo apt install libmagickwand-dev
> brew install jstkdng/programs/ueberzugpp

##### Image Test
![image](portrait.jpg)


### Other misc things
> sudo apt install python3-pip
>
> sudo apt install graphviz

### Adding the symbolic links
> . create_symbolic_links.sh


### Tensorflow stuff needed (https://towardsdatascience.com/installing-tensorflow-gpu-in-ubuntu-20-04-4ee3ca4cb75d)
1. Install latest cuda drivers
2. Install latest cudnn
3. Install miniconda
4. Make python environment 3.10 is the one that worked with the openai gym
5. > pip install tensorflow[and-cuda]

