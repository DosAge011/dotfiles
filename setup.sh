#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'

ZSH="$HOME/.zshrc"
NVIM="$HOME/.config/nvim"
PICOM="$HOME/.config/qtile/scripts/picom.conf"


create_symlinks(){
   if [ -L $3 ] ; then
      if [ -e $3 ] ; then
         echo -e "${GREEN}${1} Symbolic link is in place"
      else
         echo -e "${RED}${1} Broken symbolic link repairing"
         rm $3
         ln -s $2 $3
      fi
   elif [ -e $3 ] ; then
      echo -e "${GREEN}Old ${1} configuration detected, backing it up"
      mv $3 $3"_BAK"
      ln -s $2 $3
   else
      echo -e "${GREEN}No existing ${1} configuration. Creating it"
      ln -s $2 $3
   fi
}


########## SET DEFAULT CHELL TO ZSH ##################
chsh -s /bin/zsh
sudo pacman -S starship
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
create_symlinks "ZSH" $(pwd)/zsh/.zshrc $ZSH



########## NEOVIM SETUP ##################
sudo pacman -S neovim --noconfirm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
create_symlinks "NVIM" $(pwd)/nvim $NVIM 
nvim +PluginInstall +qall


########## PICOM SETUP ##################
create_symlinks "PICOM" $(pwd)/picom/picom.conf $PICOM














