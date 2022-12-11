#!/bin/bash

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.tmux.conf .
cp ~/.config/alacritty/alacritty.yml .

mkdir ./nvim
cp ~/.config/nvim/init.lua ./nvim/init.lua
cp ~/.config/nvim/lua/      ./nvim/lua/ -r
cp ~/.config/nvim/snippets/ ./nvim/snippets/ -r
rm -r ./nvim/lua/.config/
