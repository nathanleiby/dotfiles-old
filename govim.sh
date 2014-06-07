#!/bin/bash
mkdir $HOME/.vim/ftdetect
mkdir $HOME/.vim/syntax
mkdir $HOME/.vim/autoload
mkdir $HOME/.vim/autoload/go
mkdir $HOME/.vim/ftplugin
mkdir $HOME/.vim/ftplugin/go
mkdir $HOME/.vim/indent
mkdir $HOME/.vim/compiler
mkdir $HOME/.vim/plugin
mkdir $HOME/.vim/plugin/godoc
ln -s $HOME/.vim/bundle/vim-golang/ftdetect/gofiletype.vim $HOME/.vim/ftdetect
ln -s $HOME/.vim/bundle/vim-golang/syntax/go.vim $HOME/.vim/syntax/
ln -s $HOME/.vim/bundle/vim-golang/autoload/go/complete.vim $HOME/.vim/autoload/go/
ln -s $HOME/.vim/bundle/vim-golang/ftplugin/go.vim $HOME/.vim/ftplugin/
ln -s $HOME/.vim/bundle/vim-golang/ftplugin/go/*.vim $HOME/.vim/ftplugin/go/
ln -s $HOME/.vim/bundle/vim-golang/indent/go.vim $HOME/.vim/indent/
ln -s $HOME/.vim/bundle/vim-golang/compiler/go.vim $HOME/.vim/compiler/
ln -s $HOME/.vim/bundle/vim-golang/plugin/godoc/godoc.vim $HOME/.vim/plugin/godoc/
ln -s $HOME/.vim/bundle/vim-golang/syntax/godoc.vim $HOME/.vim/syntax/
