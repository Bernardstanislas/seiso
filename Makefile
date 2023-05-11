SHELL := /bin/bash
CONFIG := ~/.config
APPLICATION_SUPPORT := ~/Library/Application\ Support

.PHONY: homebrew

install: homebrew homebrew-packages neovim tmux-config git-config fisher-plugins iterm2-config karabiner-config kitty-config osx-config

# Install homebrew
homebrew: /usr/local/bin/brew

# Link my nvim config
neovim: $(CONFIG)/nvim

# Link my tmux config to $(CONFIG)/tmux.conf
tmux-config: $(CONFIG)/tmux/tmux.conf

# Link my .gitconfig to ~/.gitconfig
git-config: ~/.gitconfig

# Install homebrew packages
homebrew-packages:
	brew bundle --file $(PWD)/homebrew/Brewfile

# Install homebrew taps
homebrew-taps:
	$(eval INSTALLED_BREW_TAPS=$(shell brew tap))
	@IFS=$$'\n'; \
	for tap in $(shell cat $(BREW_TAPS_FILE)); do \
		if ! echo "$(INSTALLED_BREW_TAPS)" | grep -w -q "$$tap"; then \
			brew tap $$tap; \
		fi; \
	done

# Install my fisher plugins
fisher-plugins: $(CONFIG)/fish/fish_plugins $(CONFIG)/fish/functions/nvm.fish
	@fish -c "fisher update > /dev/null 2>&1"

# Configure iterm2
iterm2-config:
	@defaults import com.googlecode.iterm2 iterm2/defaults.plist

# Link my karabiner config
karabiner-config: $(CONFIG)/karabiner

# Link my spectacle config
spectacle-config: $(APPLICATION_SUPPORT)/Spectacle/Shortcuts.json

# Configure the system
osx-config:
	sudo $(PWD)/osx.sh

# Link my Kitty configuration
kitty-config: $(CONFIG)/kitty


# ----------------------------------------------------------------------------

/usr/local/bin/brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

$(CONFIG):
	mkdir -p $(CONFIG)

$(CONFIG)/nvim: $(CONFIG)
	ln -sf $(PWD)/nvim $(CONFIG)/nvim

$(CONFIG)/tmux: $(CONFIG)
	mkdir -p $(CONFIG)/tmux

$(CONFIG)/fish: $(CONFIG)
	mkdir -p $(CONFIG)/fish

$(CONFIG)/tmux/tmux.conf: tmux/tmux.conf | $(CONFIG)/tmux
	ln -sf $(PWD)/tmux/tmux.conf $(CONFIG)/tmux/tmux.conf

~/.gitconfig:
	ln -sf $(PWD)/git/.gitconfig ~/.gitconfig

$(CONFIG)/fish/fish_plugins: $(CONFIG)/fish/config.fish
	ln -sf $(PWD)/fish/fish_plugins $(CONFIG)/fish/fish_plugins

$(CONFIG)/fish/config.fish: fish/config.fish | $(CONFIG)/fish
	ln -sf $(PWD)/fish/config.fish $(CONFIG)/fish/config.fish

$(CONFIG)/fish/functions/nvm.fish:
	mkdir -p $(CONFIG)/fish/functions
	ln -sf $(PWD)/fish/functions/nvm.fish $(CONFIG)/fish/functions/nvm.fish

$(CONFIG)/karabiner: $(CONFIG)
	mkdir -p $(CONFIG)/karabiner
	mkdir -p $(CONFIG)/karabiner/assets
	ln -sf $(PWD)/karabiner/karabiner.json $(CONFIG)/karabiner/karabiner.json
	ln -sf $(PWD)/karabiner/complex_modifications $(CONFIG)/karabiner/assets/complex_modifications

$(APPLICATION_SUPPORT)/Spectacle:
	mkdir -p $(APPLICATION_SUPPORT)/Spectacle

$(APPLICATION_SUPPORT)/Spectacle/Shortcuts.json: $(APPLICATION_SUPPORT)/Spectacle
	ln -sf $(PWD)/spectacle/Shortcuts.json $(APPLICATION_SUPPORT)/Spectacle/Shortcuts.json

$(CONFIG)/kitty:
	ln -sf $(PWD)/kitty $(CONFIG)/kitty
