~/.config/nvim/lua/custom:
	ln -sf $(PWD)/nvim/lua/custom ~/.config/nvim/lua/custom

# Copy my nvim config to ~/.config/nvim
nvim-config: ~/.config/nvim/lua/custom
