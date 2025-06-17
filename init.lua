-- Add lazy.nvim to runtime path
local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("keymaps")

require("lazy").setup({
  require("plugins"),
  require("colors")
})

-- Neovim base settings
EditorScheme()
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

-- Neovide settings
if vim.g.neovide then
  -- vim.g.neovide.
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_window_blurred = true
  vim.g.neovide_normal_opacity = 0.8
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- inactive window
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- floating windows
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }) -- borders
end

vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if vim.fn.filereadable(file) ~= 1 then
      return
    end

    -- local function count_dirs(path)
    --   local dirs = vim.fn.globpath(path, "*/", false, true)
    --   return #dirs
    -- end

    local dir = vim.fn.fnamemodify(file, ":h")
    local git_root = nil

    while dir ~= "" and dir ~= "/" do
      -- if count_dirs(dir) > 20 then
      --   -- Too many folders, stop searching
      --   break
      -- end

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
