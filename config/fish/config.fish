if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias lvim  "~/.local/bin/lvim"

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
set PATH ~/.nvm/versions/node/*/bin $PATH


xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = Escape"
starship init fish | source
