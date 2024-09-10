# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PLUGIN MANAGER
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# SOURCE LOCAL FILE
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

source "${ZINIT_HOME}/zinit.zsh"

# PROMPT
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HOMEBREW
if type "brew" > /dev/null; then
    eval "$(brew shellenv)"
    fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
fi

# PLUGINS
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit load atuinsh/atuin

# ADDITIONAL COMPLETIONS
zinit snippet OMZP::1password
zinit snippet OMZP::brew
zinit snippet OMZP::fnm
zinit snippet OMZP::gh
zinit snippet OMZP::git
#zinit snippet OMZP::ripgrep
zinit snippet OMZP::rust
zinit snippet OMZP::tmux
zinit snippet OMZP::docker

# LOAD COMPLETIONS
autoload -U compinit && compinit
zinit cdreplay -q
zinit light Aloxaf/fzf-tab

# KEYBINDS
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^y" autosuggest-accept
bindkey -s '^o' '^U tmux-sessionizer ^M'

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
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ALIASES
alias cat="bat"
alias lg="lazygit"
alias la="lsd -la"
alias ll="lsd -l"
alias ls="lsd"
alias tree="lsd --tree"
alias vim="nvim"
alias vi="nvim"

# EXPORTS
export EDITOR="nvim"

export GOPATH="$HOME/.go"
if [ -d "$GOPATH/bin" ]; then
    export PATH="$PATH:$GOPATH/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# ADDITIONAL TOOLS
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
