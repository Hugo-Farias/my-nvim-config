-- Neovim base settings
vim.o.shell = "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""
-- vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.have_nerd_font = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- vim.opt.nohlsearch = true

vim.opt.updatetime = 400
-- vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 25
vim.o.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.o.keymodel = ""

-- Fix for session restoring with blank buffer
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "terminal",
  "folds",
}

---- Font for GUI
-- vim.o.guifont = "CaskaydiaCove Nerd Font:h9.7:#e-antialias:#h-none"
vim.o.guifont = "JetBrainsMono NF"

-- Neovide setting
require("neovide")

vim.api.nvim_create_user_command("NvimClean", function()
  CleanShaDaFiles()
end, { desc = "Run PowerShell alias nvimclean" })
