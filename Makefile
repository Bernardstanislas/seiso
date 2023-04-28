install: nvchad nvim-config

# Install NvChad
nvchad: ~/.config/nvim

# Copy my nvim config to ~/.config/nvim
nvim-config: ~/.config/nvim/lua/custom

~/.config/nvim/lua/custom:
	ln -sf $(PWD)/nvim/lua/custom ~/.config/nvim/lua/custom

~/.config/nvim:
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
