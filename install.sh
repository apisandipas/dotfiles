#!/usr/bin/env bash

echo "Linking config files...";

echo "Linking $PWD/zshrc";
ln -svi "$PWD/zshrc" ~/.zshrc

echo "Linking $PWD/vimrc";
ln -svi "$PWD/vimrc" ~/.vimrc

echo "Linking $PWD/gitconfig";
ln -svi "$PWD/gitconfig" ~/.gitconfig

echo "Finished linking config files!";

echo "Linking scripts directory...";

ln -svi  "$PWD/scripts" ~/;

echo "Finished linking scripts directory!";
