#!/usr/bin/env sh

DIR=$(dirname $(readlink -f $0))

mv ~/.bashrc ~/.bashrc.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.vimrc ~/.vimrc.old

ln -s "${DIR}/bashrc" ~/.bashrc
ln -s "${DIR}/tmux.conf" ~/.tmux.conf
ln -s "${DIR}/vimrc" ~/.vimrc

