vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: find solution for shada files being created with 0 bytes

require("config.lazy") -- Add lazy.nvim to runtime path

require("helper")
require("autocmd")
require("keymaps")
require("set")
require("lazyload")

EditorColorScheme("tokyonight-night")
