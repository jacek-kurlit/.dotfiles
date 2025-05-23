#! /bin/bash

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ohmyzsh plugins
ZSH_PLUGINS_DIR="${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_PLUGINS_DIR}"/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_PLUGINS_DIR}"/zsh-syntax-highlighting
# this plugin is causing problems with other plugins
# git clone https://github.com/jeffreytse/zsh-vi-mode "${ZSH_PLUGINS_DIR}"/zsh-vi-mode

# sdkman
curl -s "https://get.sdkman.io" | bash

# java
sdk install java 17.0.8-tem
sdk default java 17.0.8-tem

# flatpak apps
flatpak install fedora org.keepassxc.KeePassXC
flatpak install us.zoom.Zoom
flatpak install com.slack.Slack
flatpak install com.mongodb.Compass
# Binary from offical site may work better
flatpak install com.getpostman.Postman

# Optionals

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# probably it is good to also install this https://nexte.st/book/pre-built-binaries.html

# starship
curl -sS https://starship.rs/install.sh | sh
# zoxide
sudo dnf install zoxide
# better grep
sudo dnf install -y ripgrep
# better cat
sudo dnf install -y bat
# better ls
sudo dnf install -y lsd
# better find
sudo dnf install -y fd-find
# neovim
sudo dnf install -y neovim python3-neovim
# stow for dotfiles
sudo dnf install -y stow
# fuzzy finder
sudo dnf install -y fzf
# pass terminal password manager
sudo yum install pass
# yazi file manager
cargo install --locked yazi-fm

# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
