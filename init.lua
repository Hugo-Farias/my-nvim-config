vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.g.neovide_scale_factor = 0.7

require("keymaps")

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_cursor_trail_length = 0
  -- vim.g.neovide_cursor_vfx_mode = ""
end

-- Change nvim's location to currently opened file's location
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local file = vim.fn.expand("%:p")
    if vim.fn.filereadable(file) == 1 then
      vim.cmd("cd " .. vim.fn.fnamemodify(file, ":h"))
    end
  end,
})

vim.api.nvim_create_user_command("Cdf", function()
  vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, { desc = "Change directory to current file's folder" })

vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2

vim.opt.scrolloff = 25

-- Add lazy.nvim to runtime path
local lazypath = "C:/Users/Hugo/AppData/Local/nvim-data/site/pack/lazy/start/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  -- { "ggandor/leap.nvim", lazy = false, config = function()
  -- require("leap").add_default_mappings()
-- end  }
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
})

