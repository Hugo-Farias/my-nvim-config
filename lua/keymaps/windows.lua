-------------------------------------------------------------------------------
-- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

-- Open netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Open netrw (EX)"} )

-- Buffer navigation
for _, key in ipairs({ "H", "J" }) do
  vim.keymap.set("n", key, ":bprevious<CR>", { desc = "Previous buffer" })
end

for _, key in ipairs({ "L", "K" }) do
  vim.keymap.set("n", key, ":bnext<CR>", { desc = "Next buffer" })
end

-- Close buffer
for _, key in ipairs({ "<C-f4>", "<leader>qb" }) do
  vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
end

-- Change between visible buffers/sidebars/etc...
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

