#!/bin/sh

set -e

# is stow in our $PATH?
command -v stow

# run stow against all dirs
for dir in *; do
  if [ -d "$dir" ]; then
    stow --verbose=2 "$dir"
  fi
done

# install Tmux Plugin Manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# update vim-plug
vim +PlugUpgrade +qall

# install and update vim plugins
vim +PlugInstall +PlugUpdate +qall
