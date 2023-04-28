if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$PATH:/Users/stan/.cargo/bin"

thefuck --alias | source

starship init fish | source

alias vim=nvim
