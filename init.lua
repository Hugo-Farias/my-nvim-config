vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy") -- Add lazy.nvim to runtime path

-- vim.loader.enable()

require("vim._core.ui2").enable({
  enable = true,
})

require("set")
require("keymaps")
require("autocmd")
require("commands")
require("lazyload")
-- require("neovide")

vim.cmd.colorscheme("tokyonight-moon")
