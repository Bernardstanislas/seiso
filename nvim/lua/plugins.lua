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
      vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", {silent = true})
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
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require "telescope"
      local builtin = require "telescope.builtin"
      telescope.setup()
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    end
  }
}

return plugins
