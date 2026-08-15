vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy") -- Add lazy.nvim to runtime path

-- vim.loader.enable()

require("vim._core.ui2").enable({
  enable = true,
})

require("autocmd")
require("keymaps")
require("set")
require("lazyload")
require("commands")
-- require("neovide")

require("utils").set_colorscheme("tokyonight-moon")
