local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "svelte-language-server",
        "typescript-language-server"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter"
  },
  {
   "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
    lazy = false
  },
  {
    "MunifTanjim/prettier.nvim",
    config = function ()
      require "custom.configs.prettier"
    end,
    lazy = false
  }
}

return plugins

