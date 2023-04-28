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
      encure_installed = {
        "rust-analyzer",
        "svelte-language-server",
        "typescript-language-server"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "rust",
        -- "vue", "svelte",
        "svelte",
      },
    },
  },
}

return plugins

