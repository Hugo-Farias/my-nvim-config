-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>r", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Snacks: Open recent files" })
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>", { desc = "Snacks: Open explorer" })
-- vim.keymap.set("n", "<leader>sc", "<cmd>:lua Snacks.picker.pick('config')<CR>", { desc = "Snacks: Open config picker" })

-- Return to dashboard
-- vim.keymap.set("n", "<leader>sd", function()
--   require("snacks.dashboard").open()
-- end, { desc = "Snacks: Open dashboard" })

