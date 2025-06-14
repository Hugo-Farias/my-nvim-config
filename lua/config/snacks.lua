-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>sr", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Snacks: Open recent files" })
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>", { desc = "Snacks: Open explorer" })
vim.keymap.set("n", "<leader>gg", "<cmd>:lua Snacks.lazygit()<CR>", { desc = "Snacks: Open lazygit" })
-- vim.keymap.set("n", "<leader>sc", "<cmd>:lua Snacks.picker.pick('config')<CR>", { desc = "Snacks: Open config picker" })

-- Return to dashboard
vim.keymap.set("n", "<leader>sd", function()
  require("snacks.dashboard").open()
end, { desc = "Snacks: Open dashboard" })

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
