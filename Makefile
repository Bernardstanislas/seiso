SHELL := /bin/bash
BREW_PACKAGES_FILE := homebrew/packages.txt
INSTALLED_BREW_PACKAGES := $(shell brew list)

install: homebrew homebrew-packages nvchad nvim-config tmux-config git-config

homebrew:
	@which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install NvChad
nvchad: ~/.config/nvim

# Copy my nvim config to ~/.config/nvim
nvim-config: ~/.config/nvim/lua/custom

# Copy my tmux config to ~/.config/tmux.conf
tmux-config: ~/.config/tmux/tmux.conf

# Copy my .gitconfig to ~/.gitconfig
git-config:	~/.gitconfig

# Install homebrew packages
homebrew-packages:
	@IFS=$$'\n'; \
	for package in $(shell cat $(BREW_PACKAGES_FILE)); do \
		if ! echo "$(INSTALLED_BREW_PACKAGES)" | grep -w -q "$$package"; then \
			brew install $$package; \
		fi; \
	done

~/.config/nvim/lua/custom:
	ln -sf $(PWD)/nvim/lua/custom ~/.config/nvim/lua/custom

~/.config/nvim:
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

~/.config/tmux:
	mkdir -p ~/.config/tmux

~/.config/tmux/tmux.conf: tmux/tmux.conf | ~/.config/tmux
	ln -sf $(PWD)/tmux/tmux.conf ~/.config/tmux/tmux.conf

~/.gitconfig:
	ln -sf $(PWD)/git/.gitconfig ~/.gitconfig
