.PHONY: install \
	install-macos \
	install-macos-defaults \
	install-git \
	install-ghostty \
	install-tmux \
	install-starship \
	install-zsh

install: install-macos \
	install-macos-defaults \
	install-git \
	install-ghostty \
	install-tmux \
	install-starship \
	install-zsh

install-macos:
	brew bundle --file macos/Brewfile

install-macos-defaults:
	sh macos/defaults.sh

install-git: ~/.config
	rm -f ~/.config/git
	ln -s $(CURDIR)/git ~/.config/git

install-ghostty: ~/.config
	rm -f ~/.config/ghostty
	ln -s $(CURDIR)/ghostty ~/.config/ghostty

install-tmux:
	rm -f ~/.tmux.conf
	ln -s $(CURDIR)/tmux/tmux.conf ~/.tmux.conf

install-starship: ~/.config
	rm -f ~/.config/starship.toml
	ln -s $(CURDIR)/starship/starship.toml ~/.config/starship.toml

install-zsh: ~/.config
	rm -f ~/.zshrc ~/.config/zsh
	ln -s $(CURDIR)/zsh ~/.config/zsh
	echo "source $$HOME/.config/zsh/zshrc" > ~/.zshrc

~/.config:
	mkdir ~/.config
