#!/bin/bash

# TODO: make this loop through files instead of being manual
mv ~/.bashrc ~/.bashrc.dotfiles.bak
mv ~/.bash_profile ~/.bash_profile.dotfiles.bak
mv ~/.gitconfig ~/.gitconfig.dotfiles.bak
mv ~/.gitignore ~/.gitignore.dotfiles.bak
mv ~/.pentadactylrc ~/.gitignore.pentadactylrc.bak

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore
ln -s ~/.dotfiles/.pentadactylrc ~/.pentadactylrc

. ~/.bash_profile
