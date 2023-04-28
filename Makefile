SHELL := /bin/bash
BREW_PACKAGES_FILE := homebrew/packages.txt
INSTALLED_BREW_PACKAGES := $(shell brew list)

.PHONY: install nvchad nvim-config tmux-config brew-packages

install: nvchad nvim-config tmux-config

# Install NvChad
nvchad: ~/.config/nvim

# Copy my nvim config to ~/.config/nvim
nvim-config: ~/.config/nvim/lua/custom

# Copy my tmux config to ~/.config/tmux.conf
tmux-config: ~/.config/tmux/tmux.conf

brew-packages:
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

~/.config/tmux/tmux.conf:
	ln -sf $(PWD)/tmux/tmux.conf ~/.config/tmux/tmux.conf
