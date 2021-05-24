ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    git-prompt
    zsh-256color
)
# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
#### End set by oh-my-zsh ####
