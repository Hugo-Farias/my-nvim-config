-- Windows Only settings
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.env.CC = "gcc"
end

-- Neovim base settings
-- vim.o.guicursor = ""
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true

vim.lsp.document_color.enable(false)
vim.g.have_nerd_font = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakat = " "

vim.opt.termguicolors = true

vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- vim.opt.updatetime = 2000
-- vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
-- vim.o.keymodel = ""

-- WORKAROUND: for session restoring with blank buffer
-- vim.opt.sessionoptions = {
--   "buffers",
--   "curdir",
--   "tabpages",
--   "winsize",
--   "help",
--   "terminal",
--   "folds",
-- }
