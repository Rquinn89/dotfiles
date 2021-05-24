# Set a flag for MacOS
if [[ $(uname -s) == Darwin ]]; then
    MAC=1
fi

source ~/.dotfiles/zsh/oh-my-zsh.zshrc
source ~/.dotfiles/zsh/general.zshrc
source ~/.dotfiles/zsh/aliases.zshrc
source ~/.dotfiles/zsh/custom_functions.zshrc

#MacOS only options
if [[  ${MAC} ]]; then
    source ~/.dotfiles/zsh/macos.zshrc
    export PRJ=~/Projects
fi
