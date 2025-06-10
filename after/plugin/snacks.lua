-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>r", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>")
-- vim.keymap.set("n", "<leader>sc", "<cmd>:lua Snacks.picker.pick('config')<CR>")

-- Return to dashboard
vim.keymap.set("n", "<leader>sd", function()
  require("snacks.dashboard").open()
end, { desc = "Open Snacks Dashboard" })

