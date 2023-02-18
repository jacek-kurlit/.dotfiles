ZSH_THEME=""
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(rust zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='/usr/bin/nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias sldev="saml2aws login -a developers --force"
alias sll3="saml2aws login -a l3support --force"
alias xcc='xclip -sel clipboard'
alias dsa='docker ps -q | xargs docker stop'

# local bin add to path
export PATH=$HOME/.local/bin:$PATH

# STAR SHIP
eval "$(starship init zsh)"

# SAML2AWS
eval "$(saml2aws --completion-script-zsh)"

# ZOXIDE
eval "$(zoxide init zsh)"

# ENV CONFIG
export RIGHTBITE_CODEARTIFACT_REPOSITORY_URL='https://rightbite-main-373297882832.d.codeartifact.eu-west-1.amazonaws.com/maven/mvn-artifacts/'
# This is fix for aws vpn client
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Export variables to make downloading artifacts from s3 possible
export AWS_PROFILE=kitopi-developers
export AWS_REGION=eu-west-1

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=~/.sdkman/candidates/java/current

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
