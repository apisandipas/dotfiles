#!/usr/bin/env bash


echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/vimrc";
ln -svi "$PWD/vimrc" ~/.vimrc;

echo "Linking $PWD/coc-settings.json"; 
ln -svi "$PWD/coc-settings.json" ~/.config/nvim/coc-settings.json;

echo "Linking $PWD/tmux"; 
ln -svi "$PWD/tmux" ~/.tmux.conf;

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

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/scripts" ~/;

echo "Finished linking scripts directory!";
