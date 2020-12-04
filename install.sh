#!/usr/bin/env bash

echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/nvim";
ln -svi "$PWD/nvim" ~/.config/;

# @REFACTOR
echo "Linking $PWD/tmux"; 
ln -svi "$PWD/tmux.conf" ~/.tmux.conf;

echo "Linking $PWD/gitconfig";
ln -svi "$PWD/gitconfig" ~/.gitconfig;

echo "Linking $PWD/i3config";
ln -svi "$PWD/i3config" ~/.i3/config;

# @REFACTOR
echo "Linking $PWD/alacritty.yml";
ln -svi "$PWD/alacritty.yml" ~/.alacritty.yml;

# @REFACTOR
echo "Linking $PWD/kitty.conf"
ln -svi "$PWD/kitty.conf" ~/.config/kitty/kitty.conf;

echo "Linking $PWD/Xresources";
#ln -svi "$PWD/Xresources" ~/.Xresources;
ln -svi "$PWD/pimento-dark.Xresources" ~/.Xresources;

# @REFACTOR
echo "Linking $PWD/polybar/";
ln -svi "$PWD/polybar" ~/.config/ ;

# @REFACTOR
echo "Linkg $PWD/picom.conf";
ln -svi "$PWD/picom.conf" ~/.config/ ;

# @REFACTOR
echo "Linking $PWD/picom.conf";
ln -svi "$PWD/picom.conf" ~/.config/picom/picom.conf;

echo "Linking $PWD/myclirc";
ln -svi "$PWD/myclirc" ~/.myclirc;

# @REFACTOR
echo "Linking $PWD/rofi/"
ln -svi "$PWD/rofi" ~/.config/;

# @REFACTOR
echo "Linking $PWD/p10k.zsh"
ln -svi "$PWD/p10k.zsh" ~/.p10k.zsh

echo "Finished linking config files!";

