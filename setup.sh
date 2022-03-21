########## NEOVIM SETUP ##################

sudo pacman -S neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
ln -s nvim ~/.config/nvim


########## PICOM SETUP ##################

ln -s $(pwd)/picom/picom.conf ~/.config/qtile/scripts/picom.conf

