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

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/scripts" ~/;

echo "Finished linking scripts directory!";
