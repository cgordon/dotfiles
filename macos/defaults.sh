#!/bin/sh

chflags nohidden ~/Library

defaults write NSGlobalDomain InitialKeyRepeat -int 25
defaults write NSGlobalDomain KeyRepeat -int 4
