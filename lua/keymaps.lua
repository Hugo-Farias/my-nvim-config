vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true }) -- Ctrl-Backspace: delete word before cursor
vim.keymap.set('i', '<C-Delete>', '<Esc>ldwi', { noremap = true }) -- Ctrl-Delete: delete word after cursor

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("n", "U", "<C-r>", {desc = "Redo"})

for _, key in ipairs({ "<S-h>", "<S-j>" }) do
  vim.keymap.set("n", key, ":bprevious<CR>", { desc = "Previous buffer" })
end

for _, key in ipairs({ "<S-l>", "<S-k>" }) do
  vim.keymap.set("n", key, ":bnext<CR>", { desc = "Next buffer" })
end

for _, key in ipairs({ "<leader>tc", "<C-f4>", "<C-w>"}) do
  vim.keymap.set("n", key, ":bd<CR>", {desc = "Close buffer"})
end

-- vim.keymap.set("n", "<c-s>", ":w<cr>", { desc = "Save" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- greatest remap ever
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true })
-- vim.keymap.set("v", "p", "p", { noremap = true, silent = true })

-- gh: start of line (non-blank)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to beginning of line (non-blank)" })

-- gl: end of line (non-blank), overrides diagnostics float
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go to end of line (non-blank)" })

-- Exit insert mode by double-tapping navigation keys
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode tap 'jk'" }) 
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode tap 'kj'" })

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "line diagnostics" })

vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<c-=>", function()
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
-- end)

-- vim.keymap.set("n", "<C-->", function()
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
-- end)

-- Change directory to current opened file
vim.keymap.set("n", "<leader>cd", "<cmd>:cd %:p:h<CR>")
vim.fn.expand("%:p:h")
-- Change directory to up one from current
vim.keymap.set("n", "<leader>cu", "<cmd>:cd ../<CR>")

-- Telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<C-e>", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")

-- Disable function keys in insermode
for i = 13, 22 do
  vim.keymap.set({"i", "c"}, "<F" .. i .. ">", "<Nop>", { silent = true })
end

vim.api.nvim_create_autocmd("insertenter", {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})

-- Telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<c-p>', builtin.git_files, {})

-- Snack Remaps
vim.keymap.set("n", "<leader>e", "<cmd>SnacksExplorerToggle<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<leader>r", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<cr>")
