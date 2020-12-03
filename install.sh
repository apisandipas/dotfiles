#!/usr/bin/env bash

echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc;

echo "Linking $PWD/Xresources";
ln -svi "$PWD/Xresources" ~/.Xresources;

echo "Linking $PWD/tmux"; 
ln -svi "$PWD/tmux.conf" ~/.tmux.conf;

echo "Linking $PWD/myclirc";
ln -svi "$PWD/myclirc" ~/.myclirc;

echo "Linking $PWD/gitconfig";
ln -svi "$PWD/gitconfig" ~/.gitconfig;

echo "Linking $PWD/config/nvim";
ln -svi "$PWD/config/nvim" ~/.config/;

echo "Linking $PWD/config/alacritty";
ln -svi "$PWD/config/alacritty" ~/.config/;

echo "Linking $PWD/config/kitty"
ln -svi "$PWD/config/kitty" ~/.config/;

echo "Linking $PWD/config/polybar";
ln -svi "$PWD/config/polybar" ~/.config/ ;

ln -svi "$PWD/config/picom" ~/.config/ ;
echo "Linking $PWD/config/picom";

echo "Linking $PWD/config/i3";
ln -svi "$PWD/config/i3" ~/.config/;

echo "Linking $PWD/config/rofi"
ln -svi "$PWD/config/rofi" ~/.config/;


echo "Linking $PWD/config/starship.toml"
ln -svi "$PWD/config/starship.toml" ~/.config/starship.toml;

echo "Finished linking config files!";

