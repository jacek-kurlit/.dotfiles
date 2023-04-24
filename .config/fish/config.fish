set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SHELL /usr/bin/fish
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# nvim switcher

function nvims
    set items NvChad AstroNvim
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end
alias ls lsd
starship init fish | source
zoxide init fish | source
