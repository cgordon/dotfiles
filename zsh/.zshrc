# Based on https://github.com/dreamsofautonomy/zensh

# ---------------------------------------------------------------------------
# Zinit
# ---------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

zinit light zsh-users/zsh-completions

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------
autoload -Uz compinit

# Keep the dump out of $ZDOTDIR (which is a git checkout) and only do the
# full, slow rescan of fpath once a day; otherwise trust the cached dump.
_zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zcompdump:h}"
if [[ -n "$_zcompdump"(#qN.mh+24) || ! -f "$_zcompdump" ]]; then
  compinit -d "$_zcompdump"
else
  compinit -C -d "$_zcompdump"
fi
unset _zcompdump

zinit cdreplay -q
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# ---------------------------------------------------------------------------
# Keybindings
# ---------------------------------------------------------------------------
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt sharehistory           # implies inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups   # implies hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------
export EDITOR=vim
export VISUAL="$EDITOR"

# Colors for zsh completion and fzf-tab listings. macOS ls reads LSCOLORS, not
# LS_COLORS, so this is the GNU-style translation of the BSD ls default
# palette (exfxcxdxbxegedabagacad) to keep the two consistent.
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# bat as the man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf: use ripgrep for file listing, bat for previews
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
export FZF_ALT_C_OPTS="--preview 'ls --color {}'"

# ---------------------------------------------------------------------------
# Completion styling
# ---------------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
# Previews run in a non-tty, so bare --color (== always on macOS) is what we want here.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color "$realpath"'

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ls='ls --color=auto'   # bare --color forces color into pipes on macOS

# ---------------------------------------------------------------------------
# Shell integrations
# ---------------------------------------------------------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
