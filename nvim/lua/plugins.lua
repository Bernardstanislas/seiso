local plugins = {
  {
    "kwsp/halcyon-neovim",
    config = function ()
      vim.cmd("colorscheme halcyon")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-b>",  "<cmd>Neotree toggle<cr>", silent = true, desc = "toggle neotree"},
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "window left"},
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "window down"},
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "window up"},
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "window right"},
    },
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", "open lazygit" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true prompt_position=true<cr>", desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "find help" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "find keymaps" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = true
  }
}

return plugins
