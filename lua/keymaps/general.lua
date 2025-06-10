-------------------------------------------------------------------------------
-- 🏁 Leaders
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
-- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

-- vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true })

-- Change directory
vim.keymap.set("n", "<leader>cd", "<cmd>:cd %:p:h<CR>")
vim.keymap.set("n", "<leader>cu", "<cmd>:cd ../<CR>") -- Go Up a directory

-- Save and source with Wso
vim.api.nvim_create_user_command("Wso", function()
  vim.cmd("write | source %")
end, {})

vim.keymap.set('n', '<leader>cw', function()
  print(vim.fn.getcwd())
end, { desc = "Show current working directory" })

-------------------------------------------------------------------------------
-- 📦 General Editing
-------------------------------------------------------------------------------

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Select all
vim.keymap.set({ "n", "v" }, "<leader>sa", "VggoG", { noremap = true })

-- Paste over without overwriting register
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true })

-- Delete selection without regestering into the buffer
vim.keymap.set({"v"}, "<leader>d", "\"_d", { noremap = true, silent = true })

-- Delete line without regestering into the buffer
vim.keymap.set({"n"}, "<leader>dd", "\"_dd", { noremap = true, silent = true })

-- Default behaviour for dd (register deleted line into the buffer)
-- vim.keymap.set({"n"}, "dy", "dd", { noremap = true, silent = true })

-- x deletes without yanking
vim.keymap.set({ "n", "v" }, "x", "\"_x", { noremap = true, silent = true })

-- Start/end of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to beginning of line (non-blank)" })
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode tap 'jk'" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode tap 'kj'" })
vim.keymap.set("i", "JK", "<Esc>", { desc = "Exit insert mode tap 'jk'" })
vim.keymap.set("i", "KJ", "<Esc>", { desc = "Exit insert mode tap 'kj'" })

vim.keymap.set("n", "<leader>jl", "J", { noremap = true, silent = true })

-------------------------------------------------------------------------------
-- 🧠 Diagnostics
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-------------------------------------------------------------------------------
-- 🔤 Insert Mode Keymaps
-------------------------------------------------------------------------------

-- Ctrl-Backspace: delete word before cursor
vim.keymap.set({ "c" , "i" }, "<C-Backspace>", "<C-w>", { noremap = true })

-- Ctrl-Delete: delete word after cursor
vim.keymap.set("i", "<C-Delete>", "<Esc>ldwi", { noremap = true })

-------------------------------------------------------------------------------
-- 🛑 Disable default
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
vim.keymap.set("v", "u", "<C-c>", { noremap = true })
vim.keymap.set("v", "U", "<C-c>", { noremap = true })

-- Disable C-z minimizing Neovide's window
-- vim.keymap.set({ "i", "v", "c", "t" }, "<C-z>", "<Nop>", { noremap = true, silent = true })

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

