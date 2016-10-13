#!/bin/sh

mkdir -p $HOME/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git $HOME/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

ln -s $HOME/dotfiles/.bash_profile $HOME
ln -s $HOME/dotfiles/.bashrc       $HOME
ln -s $HOME/dotfiles/.tmux.conf    $HOME
ln -s $HOME/dotfiles/.vim          $HOME
ln -s $HOME/dotfiles/.vimrc        $HOME
ln -s $HOME/dotfiles/.vrapperrc    $HOME
ln -s $HOME/dotfiles/.xvimrc       $HOME
ln -s $HOME/dotfiles/.zprofile     $HOME
ln -s $HOME/dotfiles/.zshrc        $HOME

