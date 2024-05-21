# PLUGIN MANAGER
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# PROMPT
eval "$(starship init zsh)"

# HOMEBREW
eval "$(brew shellenv)"
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ADDITIONAL COMPLETIONS
zinit snippet OMZP::brew
zinit snippet OMZP::gh
zinit snippet OMZP::git
zinit snippet OMZP::rust

# LOAD COMPLETIONS
autoload -U compinit && compinit

# KEYBINDS
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# HISTORY TWEAKS
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# CASE INSENSITIVE COMPLETIONS + COLORS
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# FZF INTEGRATION
eval "$(fzf --zsh)"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ADDITIONAL TOOLS
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"

# ALIASES
alias cat="bat"
alias lg="lazygit"
alias la="lsd -la"
alias ll="lsd -l"
alias ls="lsd"
alias vim="nvim"
alias vi="nvim"
