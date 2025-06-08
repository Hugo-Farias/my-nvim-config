-------------------------------------------------------------------------------
-- 🏁 Leaders
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
-- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true })

-- Change directory
vim.keymap.set("n", "<leader>cd", "<cmd>:cd %:p:h<CR>")
vim.keymap.set("n", "<leader>cu", "<cmd>:cd ../<CR>") -- Go Up a directory

-------------------------------------------------------------------------------
-- 📦 General Editing
-------------------------------------------------------------------------------

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Select all
vim.keymap.set({ "n", "v" }, "<leader>sa", "VggoG", { noremap = true })

-- Paste over without overwriting register
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true })

-- Start/end of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to beginning of line (non-blank)" })
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode tap 'jk'" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode tap 'kj'" })

vim.keymap.set("n", "<C-j>", "J", { noremap = true, silent = true })

-------------------------------------------------------------------------------
-- 🧠 Diagnostics
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-------------------------------------------------------------------------------
-- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

-- Open netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Buffer navigation
for _, key in ipairs({ "H" }) do
  vim.keymap.set("n", key, ":bprevious<CR>", { desc = "Previous buffer" })
end

for _, key in ipairs({ "L" }) do
  vim.keymap.set("n", key, ":bnext<CR>", { desc = "Next buffer" })
end

-- Close buffer
for _, key in ipairs({ "<leader>tc", "<C-f4>", "<C-w>" }) do
  vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
end

-------------------------------------------------------------------------------
-- 🔍 Telescope
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<C-e>", "<cmd>Telescope buffers<cr>")

-------------------------------------------------------------------------------
-- 🔤 Insert Mode Keymaps
-------------------------------------------------------------------------------

-- Ctrl-Backspace: delete word before cursor
vim.keymap.set("i", "<C-Backspace>", "<C-w>", { noremap = true })

-- Ctrl-Delete: delete word after cursor
vim.keymap.set("i", "<C-Delete>", "<Esc>ldwi", { noremap = true })

-------------------------------------------------------------------------------
-- 🛑 Disable Keys
-------------------------------------------------------------------------------

-- Disable F13–F22 in insert/command mode
for i = 13, 22 do
  vim.keymap.set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true })
end

-- Remove default lowercase mappings
vim.keymap.set({ "n", "v" }, "gu", "<Nop>")
-- vim.keymap.set("v", "gu", "<Nop>")

-- Remap lowercase to gL
-- vim.keymap.set("n", "gL", "gu", { noremap = true })
vim.keymap.set("v", "gL", "gu", { noremap = true })

-------------------------------------------------------------------------------
-- ⏱  Mode Tweaks
-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})

-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

-- vim.keymap.set("n", "<leader>se", "<cmd>snacksexplorertoggle<cr>", { desc = "file explorer" }) -- renamed from <leader>e
vim.keymap.set("n", "<leader>r", "<cmd>:lua snacks.dashboard.pick('oldfiles')<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>")

