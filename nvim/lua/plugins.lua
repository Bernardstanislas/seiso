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
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
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
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = false,
          case_mode = "smart_case",
        }
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true prompt_position=top<cr>", desc = "find files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "find help" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "find keymaps" },
      { "<leader><space>", "<cmd>lua require'config.plugins.telescope'.project_files()<cr>", desc = "find project files" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = true
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function ()
      return require "config.plugins.cmp"
    end,
  },
  {
	"nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    build = function()
      local job = require("plenary.job")
      job:new({
        command = "make",
        cwd = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim",
      }):sync()
    end,
    config = function()
      require("telescope").load_extension("fzf")
    end
  }
}

return plugins
