CONFIG := $(HOME)/.config

.PHONY: install \
	install-macos \
	install-macos-defaults \
	install-git \
	install-ssh \
	install-ghostty \
	install-tmux \
	install-starship \
	install-vim \
	install-zsh

install: install-macos \
	install-macos-defaults \
	install-git \
	install-ssh \
	install-ghostty \
	install-tmux \
	install-starship \
	install-vim \
	install-zsh

# link <source>,<target>: replace <target> with a symlink to <source>.
# Refuses to clobber a real file or directory so nothing is lost silently.
define link
	@if [ -e "$(2)" ] && [ ! -L "$(2)" ]; then \
		echo "error: $(2) exists and is not a symlink; move it aside first" >&2; \
		exit 1; \
	fi
	rm -f "$(2)"
	ln -s "$(1)" "$(2)"
endef

install-macos:
	@command -v brew >/dev/null || { echo "error: Homebrew is not installed, see https://brew.sh" >&2; exit 1; }
	brew bundle --file macos/Brewfile

install-macos-defaults:
	sh macos/defaults.sh

install-git: $(CONFIG)
	$(call link,$(CURDIR)/git,$(CONFIG)/git)

install-ssh:
	mkdir -p -m 700 $(HOME)/.ssh
	$(call link,$(CURDIR)/ssh/config,$(HOME)/.ssh/config)

install-ghostty: $(CONFIG)
	$(call link,$(CURDIR)/ghostty,$(CONFIG)/ghostty)

install-tmux: $(CONFIG)
	rm -f $(HOME)/.tmux.conf
	$(call link,$(CURDIR)/tmux,$(CONFIG)/tmux)

install-starship: $(CONFIG)
	$(call link,$(CURDIR)/starship/starship.toml,$(CONFIG)/starship.toml)

install-vim: $(CONFIG)
	$(call link,$(CURDIR)/vim,$(CONFIG)/vim)

# ~/.zshenv sets ZDOTDIR=~/.config/zsh, so .zprofile/.zshrc are read from there.
install-zsh: $(CONFIG)
	rm -f $(HOME)/.zshrc $(HOME)/.zprofile
	$(call link,$(CURDIR)/zsh,$(CONFIG)/zsh)
	$(call link,$(CURDIR)/zsh/.zshenv,$(HOME)/.zshenv)

$(CONFIG):
	mkdir -p $@
