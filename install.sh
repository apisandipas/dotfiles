#!/usr/bin/env bash

echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/nvim";
ln -svi "$PWD/nvim" ~/.config/;

echo "Linking $PWD/tmux"; 
ln -svi "$PWD/tmux.conf" ~/.tmux.conf;

echo "Linking $PWD/gitconfig";
ln -svi "$PWD/gitconfig" ~/.gitconfig;

echo "Linking $PWD/i3config";
ln -svi "$PWD/i3config" ~/.i3/config;

echo "Linking $PWD/alacritty.yml";
ln -svi "$PWD/alacritty.yml" ~/.alacritty.yml;

echo "Linking $PWD/Xresources";
ln -svi "$PWD/Xresources" ~/.Xresources;

echo "Linking $PWD/polybar/";
ln -svi "$PWD/polybar" ~/.config/ ;

echo "Linking $PWD/picom.conf";
ln -svi "$PWD/picom.conf" ~/.config/picom/picom.conf;

echo "Linking $PWD/myclirc";
ln -svi "$PWD/myclirc" ~/.myclirc;

echo "Linking $PWD/rofi/"
ln -svi "$PWD/rofi" ~/.config/;

echo "Linking $PWD/p10k.zsh"
ln -svi "$PWD/p10k.zsh" ~/.p10k.zsh

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/bin" ~/;

echo "Finished linking scripts directory!";
