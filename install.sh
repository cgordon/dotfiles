#!/bin/sh

cd ~/.dotfiles

for f in * .*; do
    if [ "$f" = ".git" ]; then
        continue
    fi

    if [ ! -e ~/$f ]; then
        ln -s ~/.dotfiles/$f ~/$f
    fi
done
