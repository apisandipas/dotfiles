#!/usr/bin/env bash

echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/vimrc";
ln -svi "$PWD/vimrc" ~/.vimrc;

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

echo "Linking $PWD/rofi/nord.rasi"
ln -svi "$PWD/rofi/nord.rasi" ~/.config/rofi/nord.rasi

echo "Linking $PWD/.fehbg"
ln -svi "$PWD/.fehbg" ~/.fehbg 

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/scripts" ~/;

echo "Finished linking scripts directory!";
