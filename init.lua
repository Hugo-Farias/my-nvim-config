vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy") -- Add lazy.nvim to runtime path

-- vim.loader.enable()

require("vim._core.ui2").enable({
  enable = true,
})

local utils = require("utils")

require("set")
require("keymaps")
require("autocmd")
require("commands")
require("lazyload")
-- require("neovide")

utils.set_colorscheme("vague")
