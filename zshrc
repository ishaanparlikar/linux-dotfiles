ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

#Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

#Syntax Highlighting
zinit light zsh-users/zsh-syntax-highlighting
#Completions
zinit light zsh-users/zsh-completions
# Auto Suggestions
zinit light zsh-users/zsh-autosuggestions
# FZF Tab
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

#Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias ls='eza --color=always --long --git --level=2 --icons=always --no-filesize --no-time'
alias vim='nvim'
alias c='clear'

# Starship Shell integrations
eval "$(starship init zsh)"


eval "$(fzf --zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ishan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ishan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ishan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ishan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# fnm
# export PATH="/home/ishan/.local/share/fnm:$PATH"
# eval "$(fnm env --use-on-cd)"

# Replace find with FD in FZF

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

eval "$(zoxide init zsh)"
alias cd="z"

# Open File in Neovim with FZF,FD and tmux
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"


# pnpm
export PNPM_HOME="/home/ishan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2024-07-08 18:48:11
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# eval "$(zellij setup --generate-auto-start zsh)"
# if [ -z "$ZELLIJ" ]; then
#   zellij attach || zellij
# fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(fzf --zsh)"

# Ani-cli directory
# export ANI_CLI_DOWNLOAD_DIR="$HOME/Sakura/Media/data/media/anime/series/"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd)"

export PATH="$PATH:$HOME/.local/bin"
export NVIM_APPNAME=nvim
export BROWSER=/usr/bin/brave-browser
export FZF_DEFAULT_COMMAND='fd --hidden --follow --color=always --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export WAYLAND_DISPLAY=wayland-1

