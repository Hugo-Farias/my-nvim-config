-------------------------------------------------------------------------------
---- 🏁 Leaders
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
---- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

---- Quick Save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })

---- Format buffer
-- vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true, desc = "Format buffer" })

---- Change directory to current file
vim.keymap.set("n", "cd", "<cmd>:cd %:p:h | pwd<CR>", { desc = "CD to file directory" })

---- Go up one directory
vim.keymap.set("n", "cu", "<cmd>:cd ../ | pwd<CR>", { desc = "CD up a directory" })

---- Show current working directory
vim.keymap.set("n", "<leader>W", function()
  print(vim.fn.getcwd())
end, { desc = "Show current working directory" })

---- Save and source file
vim.api.nvim_create_user_command("W", function()
  vim.cmd("write | source %")
end, {})

-------------------------------------------------------------------------------
---- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

---- Go to previous buffer
vim.keymap.set("n", "gt", "<C-6>", { desc = "Go to previous buffer" })

---- Open netrw
-- vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Open netrw (EX)" })

---- Buffer navigation
-- vim.keymap.set({ "n" }, "J", ":bprevious<CR>", { desc = "Previous buffer" })

-- vim.keymap.set({ "n" }, "K", ":bnext<CR>", { desc = "Next buffer" })

---- Safely Quit Neovim
vim.keymap.set("n", "<leader>Q", ":q<CR>", { desc = "Safely quit neovim" })

---- Close buffer
-- for _, key in ipairs({ "<C-f4>", "<leader>q", "qw" }) do
--   -- vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
--   vim.keymap.set("n", key, "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Close buffer" })
-- end

---- Change focus between visible buffers/sidebars/etc...
vim.keymap.set("n", "<Left>", "<C-w>h")
vim.keymap.set("n", "<Down>", "<C-w>j")
vim.keymap.set("n", "<Up>", "<C-w>k")
vim.keymap.set("n", "<Right>", "<C-w>l")

vim.keymap.set("n", "<S-Left>", "<C-w>H")
vim.keymap.set("n", "<S-Down>", "<C-w>J")
vim.keymap.set("n", "<S-Up>", "<C-w>K")
vim.keymap.set("n", "<S-Right>", "<C-w>L")

local function resize(key, cmd, times)
  vim.keymap.set("n", key, string.rep(cmd, times), { noremap = true })
end

resize("<M-Left>", "<C-w><", 8)
resize("<M-Right>", "<C-w>>", 8)
resize("<M-Down>", "<C-w>-", 5)
resize("<M-Up>", "<C-w>+", 5)

-- vim.keymap.set("n", "<M-C-Left>", "<C-w><")
-- vim.keymap.set("n", "<M-C-Right>", "<C-w>>")
-- vim.keymap.set("n", "<M-C-Down>", "<C-w>-")
-- vim.keymap.set("n", "<M-C-Up>", "<C-w>+")

-------------------------------------------------------------------------------
---- 📦 General Editing
-------------------------------------------------------------------------------

---- Paste from system's clipboard
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system's clipboard" })

---- Yank into system's clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank into system's clipboard" })

---- `qp` to play macro
vim.keymap.set("n", "qp", function()
  vim.api.nvim_feedkeys("@", "n", false)
end, { noremap = true, desc = "Play macro" })

----- `qr` to start macro recording
vim.keymap.set("n", "qr", function()
  vim.api.nvim_feedkeys("q", "n", false)
end, { noremap = true, desc = "Start recording macro" })

vim.keymap.set("x", "d", function()
  if vim.fn.getline("."):match("^%s*$") then
    return '"_d'
  end
  return "d"
end, { expr = true })

vim.keymap.set("n", "dd", function()
  if vim.fn.getline("."):match("^%s*$") then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

---- Split the current line at the cursor position and keep the cursor on the original line
vim.keymap.set("n", "<C-l>", "i<CR><Esc>==k$", {
  desc = "Split line at cursor and reindent",
  noremap = true,
})

---- Clear Search Query
vim.keymap.set("n", "<leader>ll", "<cmd>nohlsearch | redraw<CR>", { desc = "Clear search query" })

---- '*' Keeps cursor on the name occurrence
vim.keymap.set("n", "*", "*N", { desc = "'*' Keeps cursor on the name occurrence" })

-- ---- Skip between paragraphs
-- vim.keymap.set({ "n", "x" }, "(", function()
-- 	local count = vim.v.count1 -- defaults to 1 if no count is given
-- 	for _ = 1, count do
-- 		vim.cmd("normal! {{")
-- 		while vim.fn.getline("."):match("^%s*$") and vim.fn.line(".") > 1 do
-- 			vim.cmd("normal! j")
-- 		end
-- 	end
-- 	vim.cmd("normal! ^")
-- end, { desc = "Previous paragraph start (count, skip blanks, jump to content)" })

-- vim.keymap.set({ "n", "x" }, ")", function()
-- 	local count = vim.v.count1
-- 	for _ = 1, count do
-- 		vim.cmd("normal! }}{j")
-- 		local last_line = vim.fn.line("$")
-- 		while vim.fn.getline("."):match("^%s*$") and vim.fn.line(".") < last_line do
-- 			vim.cmd("normal! j")
-- 		end
-- 	end
-- 	vim.cmd("normal! ^")
-- end, { desc = "Next paragraph start (count, skip blanks, jump to content)" })

-- vim.keymap.set("n", "(", "{{j^", { desc = "Skip paragraph backwards", noremap = true })
-- vim.keymap.set("n", ")", "}}{j^", { desc = "Skip paragraph forwards", noremap = true })
-- vim.keymap.set("n", "{", "(", { desc = "Skip paragraph forwards", noremap = true })
-- vim.keymap.set("n", "}", ")", { desc = "Skip paragraph forwards", noremap = true })

---- Duplicate Line
vim.keymap.set("n", "H", function()
  vim.cmd("copy .")
end, { desc = "Duplicate Line" })

---- Move lines
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

---- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

---- Add option to operate on full buffer on yank, delete and select
vim.keymap.set({ "o", "x" }, "az", function()
  local start_pos = { 1, 0 }
  local end_pos = { vim.fn.line("$"), vim.fn.getline("$"):len() }
  vim.fn.setpos("'<", { 0, start_pos[1], start_pos[2] + 1, 0 })
  vim.fn.setpos("'>", { 0, end_pos[1], end_pos[2] + 1, 0 })
  vim.cmd("normal! gv")
end, { desc = "Entire buffer" })

---- Swap Paste without overwriting register with regular
vim.keymap.set("x", "p", "P", { noremap = true, silent = true, desc = "Paste without overwrite" })
vim.keymap.set("x", "P", "p", { noremap = true, silent = true, desc = "Paste without overwrite" })

---- Delete selection without yanking
vim.keymap.set("x", "<leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without yank" })

---- Delete line without yanking
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yank" })

---- x deletes without yanking
-- vim.keymap.set({ "n", "x" }, "x", "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })
for _, key in ipairs({ "x", "X" }) do
  vim.keymap.set({ "n", "x" }, key, '"_x', { noremap = true, silent = true, desc = "Delete char without yank" })
end

---- Start/end of line (non-blank)
vim.keymap.set({ "n", "x", "o" }, "gh", "^", { desc = "Start of line (non-blank)" })
vim.keymap.set({ "n", "x", "o" }, "gl", "g_", { desc = "End of line (non-blank)" })

---- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode (jk)" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode (kj)" })
vim.keymap.set("i", "JK", "<Esc>", { desc = "Exit insert mode (JK)" })
vim.keymap.set("i", "KJ", "<Esc>", { desc = "Exit insert mode (KJ)" })

---- Join lines with description
vim.keymap.set("n", "<leader>jl", "J", { noremap = true, silent = true, desc = "Join lines" })
vim.keymap.set("n", "L", "J", { noremap = true, silent = true, desc = "Join lines" })

---- Visual lowercase
vim.keymap.set("x", "gL", "gu", { noremap = true, desc = "Visual lowercase (gu)" })

---- Exit visual mode overrides
vim.keymap.set("x", "u", "<C-c>", { noremap = true, desc = "Exit visual mode (u override)" })
vim.keymap.set("x", "U", "<C-c>", { noremap = true, desc = "Exit visual mode (U override)" })

-------------------------------------------------------------------------------
---- 🧠 Diagnostics
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-------------------------------------------------------------------------------
---- 🧭 Explorers/File Navigation
-------------------------------------------------------------------------------

---- Open Yazi
vim.keymap.set("n", "<leader>E", function()
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

  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  local chooser_path = "C:\\Temp\\nvim-yazi.txt" -- or some other writable temp file

  -- Ensure temp directory exists
  vim.fn.mkdir("C:/Temp", "p")

  -- Clear any stale file
  vim.fn.delete(chooser_path)

  vim.fn.termopen({
    "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe",
    "-NoLogo",
    "-NoProfile",
    "-Command",
    "yazi --chooser-file=" .. chooser_path,
  }, {
    on_exit = function()
      if vim.fn.filereadable(chooser_path) == 1 then
        local lines = vim.fn.readfile(chooser_path)
        if #lines > 0 then
          -- vim.cmd("edit " .. vim.fn.fnameescape(lines[1]))
          local filepath = vim.fn.fnameescape(lines[1])
          vim.cmd("edit " .. filepath)

          vim.defer_fn(function()
            local bufnr = vim.fn.bufnr(filepath)
            if bufnr ~= -1 then
              vim.api.nvim_set_current_buf(bufnr)
            end
          end, 50)
        end
        vim.fn.delete(chooser_path)
      end

      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd("startinsert")
end, { desc = "Yazi: Open" })

-------------------------------------------------------------------------------
---- 🔤 Insert Mode Keymaps
-------------------------------------------------------------------------------

---- Ctrl-Backspace: delete word before cursor
vim.keymap.set({ "c", "i" }, "<C-Backspace>", "<C-w>", { noremap = true, desc = "Delete word before cursor" })

---- Ctrl-Delete: delete word after cursor
vim.keymap.set("i", "<C-Delete>", "<Esc>ldwi", { noremap = true, desc = "Delete word after cursor" })

-------------------------------------------------------------------------------
---- ☸> Command Mode Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("c", "<Up>", "<C-p>", { desc = "Select Previous" })
vim.keymap.set("c", "<Down>", "<C-n>", { desc = "Select Next" })

-------------------------------------------------------------------------------
---- ⏱ Mode Tweaks
-------------------------------------------------------------------------------

---- Reduce timeoutlen in insert mode for faster key sequences
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

---- Restore timeoutlen when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})

-------------------------------------------------------------------------------
---- 🛑 Disable Default Mappings
-------------------------------------------------------------------------------

-- Disable the default `q` behavior (macro recording)
vim.keymap.set("n", "q", "<Nop>", { noremap = true })

---- Disable s key
vim.keymap.set({ "n", "x" }, "s", "<Nop>", { desc = "Disable s key" })

---- Disable F13–F22 in insert/command mode
for i = 1, 22 do
  vim.keymap.set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true, desc = "Disable <F" .. i .. ">" })
end

---- Disable join line in visual mode
vim.keymap.set("x", "J", "<Nop>", { desc = "Disable join line in visual line" })

---- Remove default lowercase mapping (gu)
vim.keymap.set({ "n", "x" }, "gu", "<Nop>", { desc = "Disable gu" })
