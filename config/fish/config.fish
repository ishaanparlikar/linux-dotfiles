
set -gx PATH "$HOME/.cargo/bin" $PATH;

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH;
# pnpm
set -gx PNPM_HOME "/home/hazelnut/.local/share/nvm/*/bin/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# set --export PATH "$HOME/.local/bin/" $PATH;

#zoxide 
zoxide init fish | source

starship init fish | source


