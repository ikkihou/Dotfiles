#!/bin/bash

readonly MY_PATH="$HOME/Documents/GitHub/dotfiles"

## update all config

## vscode
cp "$HOME/Library/Application Support/Code/User/"*.json "$MY_PATH/vscode"

## neovim
cp -r "$HOME/.config/nvim/"* "$MY_PATH/nvim/"

## posh theme
cp "$HOME/Posh/"* "$MY_PATH/Posh"

## zsh
cp "$HOME/.zshrc" "$MY_PATH/zsh"

## kitty
cp "$HOME/.config/kitty/"* "$MY_PATH/kitty"
