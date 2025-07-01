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

-- vim.opt.hlsearch = false

vim.opt.termguicolors = true

-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = "C:/Users/Hugo/AppData/Local/nvim-data/undo"
vim.opt.undofile = true

vim.opt.updatetime = 400
-- vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 25
vim.o.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.keymodel = ""

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
vim.o.guifont = "JetBrainsMono Nerd Font:h9.5"

-- Neovide settings
require("neovide")

-- Change location to git root if found, otherwise to file's location
-- TODO don't run this if opened through projects
function SmartChangeDir()
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
  vim.cmd("pwd")
end

function SmartSaveSession()
  local cwd = vim.fn.getcwd()
  local git_dir = cwd .. "/.git"

  if not vim.loop.fs_stat(git_dir) then
    return
  end

  local listed_buffers = vim.tbl_filter(function(buf)
    return vim.fn.buflisted(buf) == 1
  end, vim.api.nvim_list_bufs())

  if #listed_buffers > 1 then
    vim.notify("Session saved", vim.log.levels.INFO)
    -- Replace / or \ with %
    local session_name = cwd:gsub("[:/\\]", "%%") .. ".vim"
    local session_path = "C:/Users/Hugo/AppData/Local/nvim-data/sessions/" .. session_name

    vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
  end
end

-- Before leaving
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    SmartSaveSession()
  end,
})

-- After buffer opened
vim.api.nvim_create_autocmd("BufAdd", {
  callback = function()
    SmartSaveSession()
  end,
})

-- -- After buffer opened only once
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     SmartChangeDir()
--   end,
-- })

---- Reduce timeoutlen in insert and Cmdline mode for faster key sequences
for _, event in ipairs({ "InsertEnter", "CmdlineEnter" }) do
  vim.api.nvim_create_autocmd(event, {
    callback = function()
      vim.o.timeoutlen = 50
    end,
  })
end

---- Restore timeoutlen when leaving insert and Cmdline mode
for _, event in ipairs({ "InsertLeave", "CmdlineLeave" }) do
  vim.api.nvim_create_autocmd(event, {
    callback = function()
      vim.o.timeoutlen = 500
    end,
  })
end
