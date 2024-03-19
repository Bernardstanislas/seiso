# Seiso: Mac Provisioning for the Lean Developer

## Fresh install? No problem!

- invert scrolling direction
- manual install of 1Password
- setup 1Password
- setup the SSH Agent in the 1Password settings
- login to Google account in Safari to unlock any Wifi stuff
- `xcode-select --install`
- install [homebrew](https://brew.sh/)
- `mkdir -p ~/code && cd ~/code`
- `git clone git@github.com:Bernardstanislas/seiso.git`
- install [ASDF](https://asdf-vm.com/)
- `/opt/homebrew/bin/brew install fish`
- `sudo vim /etc/shells` and add `/opt/homebrew/bin/fish`
- `chsh -s /opt/homebrew/bin/fish`
- `/opt/homebrew/bin/brew install stow`
- `rm -r ~/.config`
- `/opt/homebrew/bin/stow -t $HOME dotfiles`
- relaunch the terminal
- `ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions`
- `brew bundle --file homebrew/Brewfile`
- enable ICloud from the settings
- download and install Arc from your emails
- `defaults write com.apple.dock "static-only" -bool "true" && killall Dock`
- `defaults write com.apple.dock "autohide" -bool "true" && killall Dock`
- `stow -t ~/Library/Application\ Support/Spectacle spectacle`
- `asdf plugin add kubectx`
- `asdf plugin add kubectl`
- `asdf plugin add nodejs`
- `asdf plugin add awscli`
- `asdf plugin add k9s`
- `asdf plugin add gcloud https://github.com/Bernardstanislas/asdf-gcloud.git` -> this is a temporary fork to fix an issue with the base repository, fix this line when the base repository is fixed
- `asdf plugin add terragrunt`
- `asdf install`
- `terraform -install-autocomplete`
- setup Raycast
