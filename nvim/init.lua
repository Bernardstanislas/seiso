local opt = vim.opt
local g = vim.g

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

------------------------------- options ----------------------------

-- disable Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- update leader
g.mapleader = " "

-- disable leader timeout
vim.api.nvim_set_option('timeout', false)

-- set termguicolors to enable highlight groups
opt.termguicolors = true

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

g.transparency = false
----------------------------- Lazy vim -----------------------------
require "init.lazy"

------------------------------ plugins -----------------------------
local plugins = require "plugins"
require("lazy").setup(plugins)

------------------------------ mappings ----------------------------
require "mappings"
