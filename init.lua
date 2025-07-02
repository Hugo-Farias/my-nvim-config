vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add lazy.nvim to runtime path
require("config.lazy")
-- local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
-- vim.opt.rtp:prepend(lazypath)

require("helper")
require("autocmd")
require("set")
require("keymaps")
require("lazyload")

EditorColorScheme()
