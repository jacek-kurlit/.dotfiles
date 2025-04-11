# All config that should not be synced with git
LOCAL_DEV_CONFIG_FILE="$HOME/.local_development.sh"

if [ -f $LOCAL_DEV_CONFIG_FILE ]; then
    source $LOCAL_DEV_CONFIG_FILE
fi
ZSH_THEME=""
export FZF_BASE=`which fzf`
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# fzf not working with vim plugin.... seems like I should use either 
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search aliases fzf)


source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='/usr/bin/nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ls="lsd"
alias xcc='xclip -sel clipboard'
alias cout='xclip -o selection clipboard'
alias cin='xclip -i -sel clipboard'
alias dsa='docker ps -q | xargs docker stop'
alias json_to_csv="xclip -o | jq -r '.elements[] | [.id, .name] | @csv' | sed 's/\"//g'"
alias decode_jwt="xclip -o | jq -R 'split(\".\") | .[0],.[1] | @base64d | fromjson'"
alias json_beauty='xclip -o | jq . | xclip -sel clipboard'
alias neo='neovide --size=3000x3000'
alias fzfp='fzf --preview "bat --color=always --style=numbers {}"'

# local bin add to path
export PATH=$HOME/.local/bin:/usr/local/go/bin:$PATH

# STAR SHIP
eval "$(starship init zsh)"

# ZOXIDE
eval "$(zoxide init zsh)"

# yazi with cwd
function yy() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=~/.sdkman/candidates/java/current

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
