vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
-- gh: start of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to beginning of line (non-blank)" })

-- gl: end of line (non-blank), overrides diagnostics float
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode by double-tapping navigation keys
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with double tap 'h'" })
-- vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with double tap 'j'" })
-- vim.keymap.set("i", "kk", "<Esc>", { desc = "Exit insert mode with double tap 'k'" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with double tap 'l'" })

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

vim.keymap.set("n", "<leader>tc", ":bd<CR>", { desc = "Close buffer" })

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-=>", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)

vim.keymap.set("n", "<C-->", function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)

-- Telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")

-- Remap Fowards and backwards
-- nnoremap . ;
-- nnoremap , ,

