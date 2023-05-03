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
  {
    "christoomey/vim-tmux-navigator",
    init = function ()
      vim.keymap.set({"n", "i"}, "<C-h>", ":TmuxNavigateLeft<CR>")
      vim.keymap.set({"n", "i"}, "<C-j>", ":TmuxNavigateDown<CR>")
      vim.keymap.set({"n", "i"}, "<C-k>", ":TmuxNavigateUp<CR>")
      vim.keymap.set({"n", "i"}, "<C-l>", ":TmuxNavigateRight<CR>")
    end
  },
  {
    "TimUntersberger/neogit",
    init = function ()
      vim.keymap.set({"n", "i"}, "<Leader>gg", ":Neogit<CR>")
    end,
    opts = {
      kind = "split"
    }
  }
}

return plugins
