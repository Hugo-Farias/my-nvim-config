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

-- Save and source with Wso
vim.api.nvim_create_user_command("Wso", function()
  vim.cmd("write | source %")
end, {})

-------------------------------------------------------------------------------
-- 📦 General Editing
-------------------------------------------------------------------------------

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Select all
vim.keymap.set({ "n", "v" }, "<leader>sa", "VggoG", { noremap = true })

-- Paste over without overwriting register
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true })

-- Delete line without regestering into the buffer
vim.keymap.set({"n"}, "<leader>dd", "\"_dd", { noremap = true, silent = true })

-- Default behaviour for dd (register deleted line into the buffer)
-- vim.keymap.set({"n"}, "dy", "dd", { noremap = true, silent = true })

-- Prevent x from yanking every character deleted-- STUPID behaviour
vim.keymap.set("n", "x", "\"_x", { noremap = true, silent = true })

-- Start/end of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to beginning of line (non-blank)" })
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode tap 'jk'" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode tap 'kj'" })

vim.keymap.set("n", "<C-S-j>", "J", { noremap = true, silent = true })

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
for _, key in ipairs({ "H", "J" }) do
  vim.keymap.set("n", key, ":bprevious<CR>", { desc = "Previous buffer" })
end

for _, key in ipairs({ "L", "K" }) do
  vim.keymap.set("n", key, ":bnext<CR>", { desc = "Next buffer" })
end

-- Close buffer
for _, key in ipairs({ "<leader>tc", "<C-f4>" }) do
  vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
end

-- Change between visible buffers/sidebars/etc...
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

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

-- Disable C-z minimizing Neovide's window
vim.keymap.set({ "i", "v", "c", "t" }, "<C-z>", "<Nop>", { noremap = true, silent = true })

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

vim.keymap.set("n", "<leader>r", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>")


-------------------------------------------------------------------------------
-- ⚓ Harpoon Keymaps
-------------------------------------------------------------------------------

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

-------------------------------------------------------------------------------
-- 🌲 Undotree Keymaps
-------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

