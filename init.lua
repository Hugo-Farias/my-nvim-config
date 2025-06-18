-- Add lazy.nvim to runtime path
local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("keymaps")

require("lazy").setup({
  require("plugins"),
  require("colors")
})

-- Neovim base settings
EditorColorScheme()
vim.o.shell = "pwsh"
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 25
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.o.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true

---- Font for GUI
vim.o.guifont = "CaskaydiaCove Nerd Font:h11:#e-antialias:#h-none"

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
