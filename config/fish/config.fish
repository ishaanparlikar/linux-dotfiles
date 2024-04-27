starship init fish | source

set -gx PATH "$HOME/.cargo/bin" $PATH;

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH;
# pnpm
set -gx PNPM_HOME "/home/hazelnut/.local/share/nvm/v21.7.2/bin/pnpm"

set --export PATH "$HOME/.local/bin/" $PATH;

#zoxide 
zoxide init fish | source
