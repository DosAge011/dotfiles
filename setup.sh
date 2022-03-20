########## NEOVIM SETUP ##################

sudo pacman -S --noconfirm neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
ln -s nvim ~/.config/nvim

