if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$PATH:/Users/stan/.cargo/bin"
export PATH="$PATH:/Users/stan/Library/Python/3.11/bin"
export PATH="$PATH:/usr/local/opt/node@18/bin"

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

thefuck --alias | source

starship init fish | source

alias vim=nvim
