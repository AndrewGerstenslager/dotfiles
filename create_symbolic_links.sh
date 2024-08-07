#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create a symbolic link for tmux.conf
if [ -f "$SCRIPT_DIR/tmux.conf" ]; then
    ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
    echo "Linked $SCRIPT_DIR/tmux.conf to ~/.tmux.conf"
else
    echo "tmux.conf not found in $SCRIPT_DIR"
fi

# Create a symbolic link for the Neovim configuration directory
if [ -d "$SCRIPT_DIR/nvim" ]; then
    # Remove the existing Neovim configuration directory if it exists
    rm -rf ~/.config/nvim
    ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim
    echo "Linked $SCRIPT_DIR/nvim to ~/.config/nvim"
else
    echo "nvim directory not found in $SCRIPT_DIR"
fi

