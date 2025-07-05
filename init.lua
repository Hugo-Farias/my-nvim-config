vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add lazy.nvim to runtime path
require("config.lazy")

require("helper")
require("autocmd")
require("keymaps")
require("set")
require("lazyload")

EditorColorScheme("tokyonight-night")
