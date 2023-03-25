set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SHELL /usr/bin/fish
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls lsd
starship init fish | source
zoxide init fish | source
