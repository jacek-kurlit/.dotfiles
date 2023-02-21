set -gx EDITOR /usr/bin/nvim
set -gx VISUAL /usr/bin/nvim
set -gx SHELL /usr/bin/fish
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source
