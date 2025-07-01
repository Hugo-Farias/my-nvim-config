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
  if not IsProject then
    return
  end

  -- vim.notify("Saving session...", vim.log.levels.INFO, { title = "Session" })

  local cwd = vim.fn.getcwd()
  local git_dir = cwd .. "/.git"

  ---@diagnostic disable-next-line: undefined-field
  if not vim.loop.fs_stat(git_dir) then
    return
  end

  local session_path = SessionName(cwd)

  -- Check for listed buffers that are associated with a real file on disk
  local has_real_files = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if
      vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_buf_get_name(buf) ~= ""
      and vim.loop.fs_stat(vim.api.nvim_buf_get_name(buf))
    then
      has_real_files = true
      break
    end
  end

  -- vim.notify("Has real files: " .. tostring(has_real_files), vim.log.levels.INFO, { title = "Session" })

  if has_real_files then
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
  else
    -- Delete session file if it no buffers associated with files exist
    if vim.loop.fs_stat(session_path) then
      ---@diagnostic disable-next-line: undefined-field
      vim.loop.fs_unlink(session_path)
    end
  end
end

-- Before leaving and after buffer opened
vim.api.nvim_create_autocmd({ "QuitPre", "BufAdd" }, {
  callback = function()
    SmartSaveSession()
  end,
})

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     SmartChangeDir()
--   end,
-- })

---- Reduce timeoutlen in insert and Cmdline mode for faster key sequences
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

---- Restore timeoutlen when leaving insert and Cmdline mode
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})
