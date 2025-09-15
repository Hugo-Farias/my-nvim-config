local set = vim.keymap.set
-------------------------------------------------------------------------------
---- 🛑 Disable Default Mappings
-------------------------------------------------------------------------------

-- Disable the default `q` behavior (macro recording)
set({ "n", "x" }, "q", "<Nop>", { noremap = true })

---- Disable s key
set({ "n", "x" }, "s", "<Nop>", { noremap = true })

---- Disable F13–F22 in insert/command mode
for i = 1, 22 do
  set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true, noremap = true })
end

---- Disable join line in visual mode
-- set("x", "J", "<Nop>", { desc = "Disable join line in visual line" })

---- Remove default lowercase mapping (gu)
set({ "n", "x" }, "gu", "<Nop>")

-------------------------------------------------------------------------------
---- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

set("n", "cy", "<cmd>pwd<CR>", { desc = "Show current working directory" })

set("n", "cp", function()
  SmartChangeDir()
end, { desc = "CD to git root" })

---- Quick Save
set("n", "<C-s>", "<cmd>up<CR>", { desc = "Save File" })

---- Format buffer
-- vim.api.nvim_set_keymap("n", "<leader>f", ":format<cr>", { noremap = true, silent = true, desc = "Format buffer" })

---- Change directory to current file
set("n", "cd", "<cmd>cd %:p:h | pwd<CR>", { desc = "CD to file directory" })

---- Go up one directory
set("n", "cu", "<cmd>cd ../ | pwd<CR>", { desc = "CD up a directory" })

---- Show current working directory
set("n", "co", function()
  print(vim.fn.expand("%:p:h"))
end, { desc = "Show current working directory" })

---- Save and source file
vim.api.nvim_create_user_command("W", function()
  vim.cmd("write | source %")
end, {})

-------------------------------------------------------------------------------
---- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

---- Go to previous buffer
set("n", "gt", "<C-6>", { desc = "Go to previous buffer" })

---- Change focus between visible buffers/sidebars/etc...
set("n", "<Left>", "<C-w>h")
set("n", "<Down>", "<C-w>j")
set("n", "<Up>", "<C-w>k")
set("n", "<Right>", "<C-w>l")

set("n", "<S-Left>", "<C-w>H")
set("n", "<S-Down>", "<C-w>J")
set("n", "<S-Up>", "<C-w>K")
set("n", "<S-Right>", "<C-w>L")

set("n", "<M-Left>", "<cmd>vertical res -8<CR>", { noremap = true, desc = "Resize window left" })
set("n", "<M-Right>", "<cmd>vertical res +8<CR>", { noremap = true, desc = "Resize window right" })
set("n", "<M-Down>", "<cmd>horizontal res +5<CR>", { noremap = true, desc = "Resize window down" })
set("n", "<M-Up>", "<cmd>horizontal res -5<CR>", { noremap = true, desc = "Resize window up" })

-- resize("<M-Left>", "<C-w><", 8)
-- resize("<M-Right>", "<C-w>>", 8)
-- resize("<M-Down>", "<C-w>-", 5)
-- resize("<M-Up>", "<C-w>+", 5)

-- set("n", "<M-C-Left>", "<C-w><")
-- set("n", "<M-C-Right>", "<C-w>>")
-- set("n", "<M-C-Down>", "<C-w>-")
-- set("n", "<M-C-Up>", "<C-w>+")

-------------------------------------------------------------------------------
---- 📦 General Editing
-------------------------------------------------------------------------------

set("n", "K", "<cmd>bnext<CR>", { desc = "Next Buffer" })
set("n", "J", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

-- set("n", "gw", "=", { desc = "Align text" })

-- Marks are always uppercase
-- for c = string.byte("a"), string.byte("z") do
--   local lower = string.char(c)
--   local upper = string.upper(lower)
--
--   -- Set mark: ma → mA
--   vim.keymap.set("n", "m" .. lower, "m" .. upper, { noremap = true })
--
--   -- Jump to mark by line: 'a → 'A
--   vim.keymap.set("n", "'" .. lower, "'" .. upper, { noremap = true })
--
--   -- Jump to mark by exact position: `a → `A
--   vim.keymap.set("n", "`" .. lower, "`" .. upper, { noremap = true })
-- end

---- Get previous yanked text
set({ "n", "x" }, '<leader>"', '"0p', { desc = "Paste previously yanked text", noremap = true })

---- Substitute
set({ "n", "x" }, "ss", "s", { desc = "Subistitute", noremap = true })

---- Flip Boolean
set("n", "<C-b>", function()
  local line = vim.api.nvim_get_current_line()
  local replacements = {
    ["true"] = "false",
    ["false"] = "true",
    ["True"] = "False",
    ["False"] = "True",
  }

  for bool, flip in pairs(replacements) do
    local s, e = line:find(bool)
    if s then
      -- Replace the first occurrence of the boolean
      local new_line = line:sub(1, s - 1) .. flip .. line:sub(e + 1)
      vim.api.nvim_set_current_line(new_line)
      -- Move cursor to the start of replaced boolean
      vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], s - 1 })
      return
    end
  end
end, { desc = "Flip first boolean on current line" })

---- Search and replace word under cursor
set(
  { "n", "x" },
  "<leader>*",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Search and replace word under cursor" }
)

---- Paste from system's clipboard
-- for _, key in ipairs({ "p", "P" }) do
--   set({ "n", "x" }, "<leader>" .. key, '"+' .. key .. "==", { desc = "Paste from system's clipboard" })
-- end
set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system's clipboard" })
set({ "n", "x" }, "<leader>P", 'o<Esc>"+p^', { desc = "which_key_ignore" })

---- Yank into system's clipboard
-- for _, key in ipairs({ "y", "Y" }) do
--   set({ "n", "x" }, "<leader>" .. key, '"+' .. key, { desc = "Yank into system's clipboard" })
-- end

set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank into system's clipboard" })

set({ "n", "x" }, "<leader>Y", '"+y$', { desc = "which_key_ignore" })

---- `qp` to play macro
set({ "n", "x" }, "qp", function()
  vim.api.nvim_feedkeys("@", "n", false)
end, { noremap = true, desc = "Play macro" })

----- `qr` to start macro recording
set({ "n", "x" }, "qr", function()
  vim.api.nvim_feedkeys("q", "n", false)
end, { noremap = true, desc = "Start recording macro" })

---- Prevent d or y operators from yanking into register if register would be empty
-- Save unnamed register before yank/delete
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:[nv]", -- From any mode into Normal/Visual
  callback = function()
    vim.g._reg_backup = vim.fn.getreg('"')
    vim.g._regtype_backup = vim.fn.getregtype('"')
  end,
})

---- Clear Search Query
set("n", "<leader>ll", "<cmd>redraw | nohlsearch<CR>", { desc = "Clear Highlight Search" })
set("n", "<C-l>", "<Cmd>nohlsearch|diffupdate|redraw|normal! <C-L><CR>", { desc = "Clear Highlight Search" })
set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "LSP: Restart" })
set(
  "n",
  "<leader>lR",
  "m0<cmd>enew<CR><C-6><cmd>bd<CR><C-6>`0<cmd>delm 0<CR><C-6><cmd>bd<CR>",
  { desc = "Refresh buffer" }
)
set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search query" })

set("n", "<leader>lm", "<cmd>DeleteAllMarks<CR>jk", { desc = "Clear All Marks" })

set("n", "<leader>lf", "<cmd>e!<CR>", { desc = "Reload from file" })

---- '*' Keeps cursor on the same occurrence
set("n", "*", "*N", { desc = "'*' Keeps cursor on the name occurrence" })

---- Duplicate Line
set("n", "H", "<cmd>copy .<CR>", { desc = "Duplicate Line" })

---- Move lines
set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

---- Redo
set("n", "U", "<C-r>", { desc = "Redo" })

---- Add option to operate on full buffer on yank, delete and visual
set({ "o", "x" }, "az", function()
  local start_pos = { 1, 0 }
  local end_pos = { vim.fn.line("$"), vim.fn.getline("$"):len() }
  vim.fn.setpos("'<", { 0, start_pos[1], start_pos[2] + 1, 0 })
  vim.fn.setpos("'>", { 0, end_pos[1], end_pos[2] + 1, 0 })
  vim.cmd("normal! gv")
end, { desc = "Entire buffer" })

---- Swap Paste without overwriting register with regular
set("x", "p", "P", { noremap = true, silent = true, desc = "Paste without overwrite" })
set("x", "P", "p", { noremap = true, silent = true, desc = "Paste without overwrite" })

---- Delete selection without yanking
set("x", "<leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without yank" })

---- Delete line without yanking
set("n", "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yank" })

---- x deletes without yanking
-- set({ "n", "x" }, "x", "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })
for _, key in ipairs({ "x", "X" }) do
  set({ "n", "x" }, key, '"_' .. key, { noremap = true, silent = true, desc = "Delete char without yank" })
end

---- Start/end of line (non-blank)
set({ "n", "x", "o" }, "gh", "^", { desc = "Start of line (non-blank)" })
set({ "n", "x", "o" }, "gl", "g_", { desc = "End of line (non-blank)" })

---- Exit insert mode
set({ "i", "c" }, "jk", "<Esc>", { desc = "Exit insert mode (jk)" })
set({ "i", "c" }, "kj", "<Esc>", { desc = "Exit insert mode (kj)" })
set({ "i", "c" }, "JK", "<Esc>", { desc = "Exit insert mode (JK)" })
set({ "i", "c" }, "KJ", "<Esc>", { desc = "Exit insert mode (KJ)" })

---- Join lines
-- set("n", "<leader>jl", "J", { noremap = true, silent = true, desc = "Join lines" })
set("n", "L", "m0J`0<cmd>delm 0<CR>", { silent = true, desc = "Join lines" })

----Add empty line under
set("n", "<C-k>", "m0o<Esc>k_`0<cmd>delm 0<CR>", { desc = "Add empty line under", noremap = true })

---- Add empty line under insert mode
set("i", "<C-k>", "<Esc>o<Esc>k_i", { desc = "Add empty line under", noremap = true })

---- Split lines downwards
set("n", "<C-j>", "m0i<CR><Esc>==`0<cmd>delm 0<CR>", {
  desc = "Split line downwards",
  noremap = true,
})

---- Visual lowercase
set("x", "gL", "gu", { noremap = true, desc = "Visual lowercase (gu)" })

---- Exit visual mode overrides
set("x", "u", "<C-c>", { noremap = true, desc = "Exit visual mode (u override)" })
set("x", "U", "<C-c>", { noremap = true, desc = "Exit visual mode (U override)" })

-------------------------------------------------------------------------------
---- 🧭 Explorers/File Navigation
-------------------------------------------------------------------------------

---- Open Yazi
--- TODO: make this open on current buffer directory instead of working directory
set("n", "<leader>E", function()
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

  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })

  local chooser_path = "C:\\Temp\\nvim-yazi.txt"
  vim.fn.mkdir("C:/Temp", "p")
  vim.fn.delete(chooser_path)

  local cwd = vim.fn.expand("%:p:h")

  vim.fn.termopen({
    "C:\\PROGRA~1\\PowerShell\\7\\pwsh.exe",
    "-NoLogo",
    "-NoProfile",
    "-Command",
    "yazi --chooser-file=" .. chooser_path,
  }, {
    cwd = cwd, -- ← Set terminal working directory
    on_exit = function()
      if vim.fn.filereadable(chooser_path) == 1 then
        local lines = vim.fn.readfile(chooser_path)
        if #lines > 0 then
          local filepath = vim.fn.fnameescape(lines[1])
          vim.cmd("e " .. filepath)

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
set({ "c", "i" }, "<C-Backspace>", "<C-w>", { noremap = true, desc = "Delete word before cursor" })

---- Ctrl-Delete: delete word after cursor
set({ "c", "i" }, "<C-Delete>", "<Esc>ldwi", { noremap = true, desc = "Delete word after cursor" })

-------------------------------------------------------------------------------
---- ☸> Command Mode Keymaps
-------------------------------------------------------------------------------

set("c", "<Up>", "<C-p>", { desc = "Select Previous" })
set("c", "<Down>", "<C-n>", { desc = "Select Next" })
