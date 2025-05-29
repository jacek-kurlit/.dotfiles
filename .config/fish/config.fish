if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    random choice "Hello!" "Hi" "G'day" "Howdy"
end

if test -e local_development.fish
  source local_development.fish
end

zoxide init fish | source
starship init fish | source
