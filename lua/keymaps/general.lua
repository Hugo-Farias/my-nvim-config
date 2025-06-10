-------------------------------------------------------------------------------
-- 🏁 Leaders
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
-- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

-- Format buffer
-- vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true, desc = "Format buffer" })

-- Change directory to current file
vim.keymap.set("n", "<leader>cd", "<cmd>:cd %:p:h<CR>", { desc = "CD to file directory" })

-- Go up one directory
vim.keymap.set("n", "<leader>cu", "<cmd>:cd ../<CR>", { desc = "CD up a directory" })

-- Show current working directory
vim.keymap.set("n", "<leader>cw", function()
  print(vim.fn.getcwd())
end, { desc = "Show current working directory" })

-- Save and source file
vim.api.nvim_create_user_command("Wso", function()
  vim.cmd("write | source %")
end, {})

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
for _, key in ipairs({ "<C-f4>", "<leader>q" }) do
  vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
end

-- Change between visible buffers/sidebars/etc...
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-------------------------------------------------------------------------------
-- 📦 General Editing
-------------------------------------------------------------------------------

-- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Select all
vim.keymap.set({ "n", "v" }, "<leader>sa", "VggoG", { noremap = true, desc = "Select all" })

-- Paste without overwriting register
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true, desc = "Paste without overwrite" })

-- Delete selection without yanking
vim.keymap.set("v", "<leader>d", "\"_d", { noremap = true, silent = true, desc = "Delete without yank" })

-- Delete line without yanking
vim.keymap.set("n", "<leader>dd", "\"_dd", { noremap = true, silent = true, desc = "Delete line without yank" })

-- x deletes without yanking
vim.keymap.set({ "n", "v" }, "x", "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })

-- Start/end of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to start of line (non-blank)" })
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode (jk)" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode (kj)" })
vim.keymap.set("i", "JK", "<Esc>", { desc = "Exit insert mode (JK)" })
vim.keymap.set("i", "KJ", "<Esc>", { desc = "Exit insert mode (KJ)" })

-- Join lines with description
vim.keymap.set("n", "<leader>jl", "J", { noremap = true, silent = true, desc = "Join lines" })

-- Visual lowercase
vim.keymap.set("v", "gL", "gu", { noremap = true, desc = "Visual lowercase (gu)" })

-- Exit visual mode overrides
vim.keymap.set("v", "u", "<C-c>", { noremap = true, desc = "Exit visual mode (u override)" })
vim.keymap.set("v", "U", "<C-c>", { noremap = true, desc = "Exit visual mode (U override)" })

-------------------------------------------------------------------------------
-- 🧠 Diagnostics
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-------------------------------------------------------------------------------
-- 🔤 Insert Mode Keymaps
-------------------------------------------------------------------------------

-- Ctrl-Backspace: delete word before cursor
vim.keymap.set({ "c", "i" }, "<C-Backspace>", "<C-w>", { noremap = true, desc = "Delete word before cursor" })

-- Ctrl-Delete: delete word after cursor
vim.keymap.set("i", "<C-Delete>", "<Esc>ldwi", { noremap = true, desc = "Delete word after cursor" })

-------------------------------------------------------------------------------
-- ⏱ Mode Tweaks
-------------------------------------------------------------------------------

-- Reduce timeoutlen in insert mode for faster key sequences
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

-- Restore timeoutlen when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})

-------------------------------------------------------------------------------
-- 🛑 Disable Default Mappings
-------------------------------------------------------------------------------

-- Disable F13–F22 in insert/command mode
for i = 13, 22 do
  vim.keymap.set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true, desc = "Disable <F" .. i .. ">" })
end

-- Remove default lowercase mapping (gu)
vim.keymap.set({ "n", "v" }, "gu", "<Nop>", { desc = "Disable gu" })

-- Optional: Prevent Neovide window from minimizing with <C-z>
-- vim.keymap.set({ "i", "v", "c", "t" }, "<C-z>", "<Nop>", { noremap = true, silent = true, desc = "Disable <C-z>" })
