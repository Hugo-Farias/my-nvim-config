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
vim.keymap.set("n", "cd", "<cmd>:cd %:p:h | pwd<CR>", { desc = "CD to file directory" })

-- Go up one directory
vim.keymap.set("n", "cu", "<cmd>:cd ../ | pwd<CR>", { desc = "CD up a directory" })

-- -- Show current working directory
vim.keymap.set("n", "<leader>W", function()
  print(vim.fn.getcwd())
end, { desc = "Show current working directory" })

-- Save and source file
vim.api.nvim_create_user_command("W", function()
  vim.cmd("write | source %")
end, {})

-------------------------------------------------------------------------------
-- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

-- Go to previous buffer
vim.keymap.set("n", "gt", "<C-6>", { desc = "Go to previous buffer" })

-- Open netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Open netrw (EX)"} )
-- vim.keymap.set("n", "<leader>po", ":Ex<CR>", { desc = "Open netrw (EX)"} )

-- Buffer navigation
vim.keymap.set({ "n" }, "J", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set({ "n" }, "K", ":bnext<CR>", { desc = "Next buffer" })

-- Safely Quit Neovim
vim.keymap.set("n", "<leader>Q", ":q<CR>", { desc = "Safely quit neovim" })

-- -- Close buffer
-- for _, key in ipairs({ "<C-f4>", "<leader>q" }) do
--   -- vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
--   vim.keymap.set("n", key, "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Close buffer" })
-- end

-- Change between visible buffers/sidebars/etc...
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-------------------------------------------------------------------------------
-- 📦 General Editing
-------------------------------------------------------------------------------

-- Move lines
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Select all
-- vim.keymap.set({ "n" }, "<leader>sa", "VggoG", { noremap = true, desc = "Select all" })
-- vim.keymap.set({ "x" }, "aa", "VggoG", { noremap = true, desc = "Select all" })

-- Add option to operate on full buffer on yank and delete
vim.keymap.set({ "o", "x" }, "aa", function()
  vim.cmd("normal! ggVG")
end, { desc = "Entire buffer" })

-- Swap Paste without overwriting register with regular
vim.keymap.set("x", "p", "P", { noremap = true, silent = true, desc = "Paste without overwrite" })
vim.keymap.set("x", "P", "p", { noremap = true, silent = true, desc = "Paste without overwrite" })

-- Delete selection without yanking
vim.keymap.set("x", "<leader>d", "\"_d", { noremap = true, silent = true, desc = "Delete without yank" })

-- Delete line without yanking
vim.keymap.set("n", "<leader>dd", "\"_dd", { noremap = true, silent = true, desc = "Delete line without yank" })

-- x deletes without yanking
-- vim.keymap.set({ "n", "x" }, "x", "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })
for _, key in ipairs({ "x", "X" }) do
  vim.keymap.set({ "n", "x" }, key, "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })
end

-- Start/end of line (non-blank)
vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Start of line (non-blank)" })
vim.keymap.set({ "n", "x", "o" }, "gl", "g_", { desc = "End of line (non-blank)" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode (jk)" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode (kj)" })
vim.keymap.set("i", "JK", "<Esc>", { desc = "Exit insert mode (JK)" })
vim.keymap.set("i", "KJ", "<Esc>", { desc = "Exit insert mode (KJ)" })

-- Join lines with description
vim.keymap.set("n", "<leader>jl", "J", { noremap = true, silent = true, desc = "Join lines" })
vim.keymap.set("n", "L", "J", { noremap = true, silent = true, desc = "Join lines" })

-- Visual lowercase
vim.keymap.set("x", "gL", "gu", { noremap = true, desc = "Visual lowercase (gu)" })

-- Exit visual mode overrides
vim.keymap.set("x", "u", "<C-c>", { noremap = true, desc = "Exit visual mode (u override)" })
vim.keymap.set("x", "U", "<C-c>", { noremap = true, desc = "Exit visual mode (U override)" })

-------------------------------------------------------------------------------
-- 🧠 Diagnostics
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-------------------------------------------------------------------------------
-- 🧭 Explorers/File Navigation
-------------------------------------------------------------------------------

-- Open Yazi
vim.keymap.set("n", "<leader>pe", function()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- Use PowerShell directly and launch yazi explicitly
  vim.fn.termopen(
    { "powershell.exe", "-NoLogo", "-Command", "yazi" },
    {
      on_exit = function()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end,
    }
  )

  vim.cmd("startinsert")
end, { desc = "Yazi: Open"})

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
for i = 1, 22 do
  vim.keymap.set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true, desc = "Disable <F" .. i .. ">" })
end

-- Disable join line in visual mode
vim.keymap.set("x", "J", "<Nop>", { desc = "Disable join line in visual line" })

-- Remove default lowercase mapping (gu)
vim.keymap.set({ "n", "x" }, "gu", "<Nop>", { desc = "Disable gu" })

-- Optional: Prevent Neovide window from minimizing with <C-z>
-- vim.keymap.set({ "i", "x", "c", "t" }, "<C-z>", "<Nop>", { noremap = true, silent = true, desc = "Disable <C-z>" })
