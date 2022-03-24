#!/bin/zsh

RED='\033[0;31m'
GREEN='\033[0;32m'

ZSH="$HOME/.zshrc"
NVIM="$HOME/.config/nvim"
PICOM="$HOME/.config/qtile/scripts/picom.conf"
SXHKD="$HOME/.config/qtile/sxhkd/sxhkdrc"


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


########## SET DEFAULT SHELL TO ZSH ##################
chsh -s /bin/zsh
sudo pacman -S starship --noconfirm
create_symlinks "ZSH" $(pwd)/zsh/.zshrc $ZSH
source $ZSH
#loginctl | grep seat0 | awk '{print $3}' | loginctl terminate-user


sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


########## NEOVIM SETUP ##################
sudo pacman -S neovim --noconfirm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
create_symlinks "NVIM" $(pwd)/nvim $NVIM 
nvim +PluginInstall +qall


########## PICOM SETUP ##################
create_symlinks "PICOM" $(pwd)/picom/picom.conf $PICOM

########## SXHKD SETUP ##################
create_symlinks "SXHKD" $(pwd)/sxhkd/sxhkdrc $SXHKD

############# ROFI ####################
mkdir temp
cd temp
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
### create_symlinks "SXHKD" $(pwd)/sxhkd/sxhkdrc $SXHKD













