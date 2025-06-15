-- Add lazy.nvim to runtime path
local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("keymaps")

require("lazy").setup({
  require("plugins"),
  require("colors")
})

-- Neovim base settings
editorScheme()
-- vim.o.cmdheight = 0
vim.o.shell = "pwsh"
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 25
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.o.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Neovide settings
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_opacity = 0.83
end

-- Change nvim's location to first opened file's location
vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if vim.fn.filereadable(file) == 1 then
      vim.cmd.lcd(vim.fn.fnamemodify(file, ":h"))
    end
  end,
})


-- vim.api.nvim_create_user_command("Cdf", function()
-- vim.cmd("cd " .. vim.fn.expand("%:p:h"))
-- end, { desc = "Change directory to current file's folder" })
