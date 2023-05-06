SHELL := /bin/bash
BREW_PACKAGES_FILE := homebrew/packages.txt
BREW_TAPS_FILE := homebrew/taps.txt
INSTALLED_BREW_PACKAGES := $(shell brew list)
INSTALLED_BREW_TAPS := $(shell brew tap)

install: homebrew homebrew-packages neovim tmux-config git-config fisher-plugins iterm2-config

homebrew:
	@which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Link my nvim config
neovim: ~/.config/nvim

# Link my tmux config to ~/.config/tmux.conf
tmux-config: ~/.config/tmux/tmux.conf

# Link my .gitconfig to ~/.gitconfig
git-config:	~/.gitconfig

# Install homebrew packages
homebrew-packages: homebrew-taps
	@IFS=$$'\n'; \
	for package in $(shell cat $(BREW_PACKAGES_FILE)); do \
		if ! echo "$(INSTALLED_BREW_PACKAGES)" | grep -w -q "$$package"; then \
			brew install $$package; \
		fi; \
	done

# Install homebrew taps
homebrew-taps:
	@IFS=$$'\n'; \
	for tap in $(shell cat $(BREW_TAPS_FILE)); do \
		if ! echo "$(INSTALLED_BREW_TAPS)" | grep -w -q "$$tap"; then \
			brew tap $$tap; \
		fi; \
	done

# Install my fisher plugins
fisher-plugins: ~/.config/fish/fish_plugins ~/.config/fish/functions/nvm.fish
	@fish -c "fisher update > /dev/null 2>&1"

# Configure iterm2
iterm2-config:
	@defaults import com.googlecode.iterm2 iterm2/defaults.plist

~/.config/nvim:
	ln -sf $(PWD)/nvim ~/.config/nvim

~/.config/tmux:
	mkdir -p ~/.config/tmux

~/.config/fish:
	mkdir -p ~/.config/fish

~/.config/tmux/tmux.conf: tmux/tmux.conf | ~/.config/tmux
	ln -sf $(PWD)/tmux/tmux.conf ~/.config/tmux/tmux.conf

~/.gitconfig:
	ln -sf $(PWD)/git/.gitconfig ~/.gitconfig

~/.config/fish/fish_plugins: ~/.config/fish/config.fish
	ln -sf $(PWD)/fish/fish_plugins ~/.config/fish/fish_plugins

~/.config/fish/config.fish: fish/config.fish | ~/.config/fish
	ln -sf $(PWD)/fish/config.fish ~/.config/fish/config.fish

~/.config/fish/functions/nvm.fish:
	mkdir -p ~/.config/fish/functions
	ln -sf $(PWD)/fish/functions/nvm.fish ~/.config/fish/functions/nvm.fish
