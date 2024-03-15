if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin
source ~/.asdf/asdf.fish

thefuck --alias | source

starship init fish | source

alias vim=nvim
alias lg="lazygit"

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
