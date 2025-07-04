vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add lazy.nvim to runtime path
require("config.lazy")

require("helper")
require("autocmd")
require("set")
require("keymaps")
require("lazyload")

EditorColorScheme("tokyonight-night")
