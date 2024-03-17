if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin
source ~/.asdf/asdf.fish

thefuck --alias | source

starship init fish | source

alias vim=nvim
alias lg="lazygit"
alias k="kubectl"

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_available
