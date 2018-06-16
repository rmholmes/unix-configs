SSH_ENV=$HOME/.ssh/environment

cd /mnt/c/Users/Ryan\ Holmes/
  
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
  
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
	 ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
else
    start_agent;
fi

# Add bash profile:
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# WSL:

export DISPLAY=127.0.0.1:0.0

