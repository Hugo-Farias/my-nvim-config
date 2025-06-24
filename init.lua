-- Add lazy.nvim to runtime path
local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("loadplugins")
require("set")
