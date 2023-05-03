vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "init.lazy"

local plugins = require "plugins"
require("lazy").setup(plugins)

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
