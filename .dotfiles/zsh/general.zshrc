# Enable vim mode in zsh
bindkey -v

# Nice prompt. Show hostname, short elipsis, and then working directory
export PROMPT="%n..%F{75}%1d/%f $ "

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start SSH agent on login...
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

