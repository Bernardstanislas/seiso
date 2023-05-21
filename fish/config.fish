if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH /Users/stan/.cargo/bin /Users/stan/Library/Python/3.11/bin /usr/local/opt/node@18/bin $PATH

set SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

thefuck --alias | source

starship init fish | source

alias vim=nvim
