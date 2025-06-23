-- Neovim base settings
EditorColorScheme()
vim.o.shell = "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""
-- vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = "C:/Users/Hugo/AppData/Local/nvim-data/undo"
vim.opt.undofile = true

vim.opt.updatetime = 300
-- vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 25
vim.o.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.keymodel = ""

---- Font for GUI
-- vim.o.guifont = "CaskaydiaCove Nerd Font:h9.7:#e-antialias:#h-none"
vim.o.guifont = "JetBrainsMono Nerd Font:h10"

-- Neovide settings
require("neovide")

-- Change location to git root if found, otherwise to file's location
vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if vim.fn.filereadable(file) ~= 1 then
      return
    end

    local dir = vim.fn.fnamemodify(file, ":h")
    local git_root = nil

    while dir ~= "" and dir ~= "/" do
      if vim.fn.isdirectory(dir .. "/.git") == 1 then
        git_root = dir
        break
      end

      -- Go one level up
      local parent = vim.fn.fnamemodify(dir, ":h")
      if parent == dir then
        break
      end
      dir = parent
    end

    if git_root then
      vim.cmd.lcd(git_root)
    else
      -- fallback to file's directory
      vim.cmd.lcd(vim.fn.fnamemodify(file, ":h"))
    end
  end,
})
