if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias lvim  "~/.local/bin/lvim"
set -gx EDITOR nvim
set fish_greeting
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
set PATH ~/.nvm/versions/node/*/bin $PATH


# xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = Escape"
starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/hazelnut/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
# Neofetch
fastfetch

thefuck --alias | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
