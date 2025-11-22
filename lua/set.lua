-- Neovim base settings
if vim.fn.has("win32") == 1 then
  vim.o.shell = "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.g.have_nerd_font = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.breakat = " "

opt.termguicolors = true

-- opt.swapfile = false
-- opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true

-- vim.o.hlsearch = false
-- opt.incsearch = true

opt.updatetime = 2000
-- opt.colorcolumn = "80"

opt.scrolloff = 20
vim.o.timeoutlen = 500
opt.ignorecase = true
opt.smartcase = true
-- vim.o.keymodel = ""

-- Fix for session restoring with blank buffer
opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "terminal",
  "folds",
}

-- Neovide settings
-- require("neovide")

vim.api.nvim_create_user_command("NvimClean", function()
  CleanShaDaFiles()
end, { desc = "Run PowerShell alias nvimclean" })
