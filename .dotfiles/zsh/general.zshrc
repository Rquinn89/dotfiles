# Enable vim mode in zsh
bindkey -v

# Nice prompt. Show hostname, short elipsis, and then working directory
export PROMPT="%n..%F{75}%1d/%f $ "

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#### PATH Settings ####
# Add mosh-server so I can connect
export PATH=/opt/homebrew/bin/mosh-server:$PATH
# Add .NET core for MS VSCode
export PATH=/usr/local/share/dotnet:$PATH
