ZSH_THEME=""
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(rust zsh-autosuggestions zsh-syntax-highlighting web-search zsh-interactive-cd aliases)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='/usr/bin/nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ls="lsd"
alias cd="z"
alias xcc='xclip -sel clipboard'
alias dsa='docker ps -q | xargs docker stop'
alias json_to_csv="xclip -o | jq -r '.elements[] | [.id, .name] | @csv' | sed 's/\"//g'"
alias decode_jwt="xclip -o | jq -R 'split(\".\") | .[0],.[1] | @base64d | fromjson'"
alias java_native="/home/jacek.kurlit/graalvm-ce-java17-22.3.1/bin/native-image"
alias json_beaty='xclip -o | jq . | xclip -sel clipboard'
alias neo='neovide --size=3000x3000'


# nvim switcher
function nvims() {
  items=("default(LazyVim)" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default(LazyVim)" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
# All config that should not be synced with git
LOCAL_DEV_CONFIG_FILE="$HOME/.local_development.sh"

if [ -f $LOCAL_DEV_CONFIG_FILE ]; then
    source $LOCAL_DEV_CONFIG_FILE
fi

# local bin add to path
export PATH=$HOME/.local/bin:$PATH

# STAR SHIP
eval "$(starship init zsh)"

# ZOXIDE
eval "$(zoxide init zsh)"

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=~/.sdkman/candidates/java/current

