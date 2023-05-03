local plugins = {
  {
    "kwsp/halcyon-neovim",
    config = function ()
      vim.cmd("colorscheme halcyon")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>")
    end
  },
  "christoomey/vim-tmux-navigator",
  "TimUntersberger/neogit"
}

return plugins
