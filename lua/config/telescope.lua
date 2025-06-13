-------------------------------------------------------------------------------
-- 🔍 Telescope Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope: Find files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope: List open buffers" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: Live grep" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope: Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope: Recently opened files" })
-- vim.keymap.set("n", "<C-e>", "<cmd>Telescope buffers<cr>")
