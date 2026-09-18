#!/bin/sh

chflags nohidden ~/Library

# Fast key repeat. Press-and-hold must be off or holding a key shows the
# accent popup instead of repeating.
defaults write NSGlobalDomain InitialKeyRepeat -int 25
defaults write NSGlobalDomain KeyRepeat -int 4
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

killall Finder
echo "Key repeat settings take effect after logging out and back in."
