local utils = require("utils")

local set = vim.keymap.set

-- set("<leader>ln", "")

-------------------------------------------------------------------------------
---- 🛑 Disable Default Mappings
-------------------------------------------------------------------------------

---- Disable insert key in insert mode
set("i", "<Insert>", "<Nop>", { noremap = true, silent = true })

---- Disable "F1" (help)
set({ "n", "i", "c", "x" }, "<F1>", "<Nop>", { noremap = true, silent = true })

-- Disable the default `q` behavior (macro recording)
set({ "n", "x" }, "q", "<Nop>", { noremap = true })

---- Disable "s" key (which is substitute by default)
set({ "n", "x" }, "s", "<Nop>", { noremap = true })

---- Disable F13–F22 in insert/command mode
for i = 1, 22 do
  set({ "i", "c" }, "<F" .. i .. ">", "<Nop>", { silent = true, noremap = true })
end

---- Disable join line in visual mode
-- set("x", "J", "<Nop>", { desc = "Disable join line in visual line" })

---- Remove default lowercase mapping (gu) in normal mode
set("n", "gu", "<Nop>")

-------------------------------------------------------------------------------
---- 💾 Save / Format / File Ops
-------------------------------------------------------------------------------

--- Run file
-- set("n", "<leader>rf", function()
--   vim.cmd("!ii %")
--   vim.notify("File opened with default application")
-- end, { desc = "Run current file" })

-- Execute script inside Neovim
-- set("n", "<leader>rs", function()
--   vim.cmd("!& %")
--   vim.notify("Script executed inside Neovim")
-- end, { desc = "Execute script inside Neovim" })

---- Source nvim config file
set("n", "<leader>r,", function()
  -- local filetype = vim.bo.filetype
  -- if filetype ~= "lua" then
  --   vim.notify(
  --     "Warning: This command is meant to be used on Lua files. Current filetype: " .. filetype,
  --     vim.log.levels.WARN
  --   )
  --   return
  -- end
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Config Reloaded")
end, { desc = "Source nvim config file" })

---- Change directory to git root
set("n", "cd", utils.smart_change_dir, { desc = "CD to git root or file path" })

---- Go up one directory
set("n", "cu", "<cmd>cd ../ | pwd<CR>", { desc = "CD up a directory" })

---- Show current file directory
set("n", "cp", function()
  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")

  vim.notify(("CWD:\n%s\n%s"):format(cwd, file), vim.log.levels.INFO)
end, { desc = "Print cwd and file path" })

---- Quick Save
set("n", "<C-s>", "<cmd>up<CR>", { desc = "Save File" })

---- Change directory to current file
set("n", "cD", "<cmd>cd %:p:h | pwd<CR>", { desc = "CD to file directory" })

-------------------------------------------------------------------------------
---- 🪟 Buffers & Windows
-------------------------------------------------------------------------------

set({ "n", "x" }, "qq", utils.close_all_splits, { desc = "close", silent = true })
-- set({ "n", "x" }, "qq", ":wincmd o|silent! close<CR>", { desc = "close", silent = true })
-- set({ "n", "x" }, "q[", ":wincmd o|silent! close<CR>", { desc = "close", silent = true })
set({ "n", "x" }, "q[", utils.close_all_splits, { desc = "close", silent = true })

---- Reload Chrome
-- set("n", "<C-r>", function()
--   local ahk = vim.fn.stdpath("config") .. "/scripts/Reload Chrome.ahk"
--
--   vim.fn.system({
--     "powershell",
--     "-NoProfile",
--     "-Command",
--     'ii "' .. ahk .. '"',
--   })
--
--   vim.notify("Reload Triggered")
-- end, { desc = "Reload Chrome" })

---- Go to previous buffer
set("n", "<C-6>", "gt", { desc = "Switch tabs" })
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

-- delete whitespace
set("n", "g=", "m0<cmd>%s/\\s\\+$/<CR>`0<cmd>delm 0<CR>", { desc = "Delete trailing whitespace in buffer" })

local ns = vim.api.nvim_create_namespace("comma_flash")

local function flash_last_char()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local line = vim.api.nvim_get_current_line()

  if line == "" then
    return
  end

  local col = #line - 1

  local id = vim.api.nvim_buf_set_extmark(0, ns, row, col, {
    end_col = col + 1,
    hl_group = "IncSearch", -- choose any highlight group you like
  })

  vim.defer_fn(function()
    pcall(vim.api.nvim_buf_del_extmark, 0, ns, id)
  end, 300)
end

local function set_comma(go_to_next_line)
  local next_line = go_to_next_line or false
  local line = vim.api.nvim_get_current_line()

  if line:match(";$") then
    vim.api.nvim_set_current_line(line:sub(1, -2) .. ",")
    flash_last_char()
  elseif not line:match(",$") then
    vim.api.nvim_set_current_line(line .. ",")
    flash_last_char()
  else
    vim.api.nvim_set_current_line(line:sub(1, -2))
  end

  if next_line then
    vim.api.nvim_feedkeys("o", "n", false)
  end
end

local function set_semicolon(go_to_next_line)
  local next_line = go_to_next_line or false
  local line = vim.api.nvim_get_current_line()

  if line:match(",$") then
    vim.api.nvim_set_current_line(line:sub(1, -2) .. ";")
    flash_last_char()
  elseif not line:match(";$") then
    vim.api.nvim_set_current_line(line .. ";")
    flash_last_char()
  else
    vim.api.nvim_set_current_line(line:sub(1, -2))
  end

  if next_line then
    vim.api.nvim_feedkeys("o", "n", false)
  end
end

set("i", "<M-,>", function()
  set_comma(true)
end, { noremap = true, desc = "Insert comma at the end of the line and start next line" })

set("i", "<M-;>", function()
  set_semicolon(true)
end, { noremap = true, desc = "Insert semicolon at the end of the line and start next line" })

---- Set comma at the end of the line
set("n", "<leader>,", set_comma, { desc = "Set comma at the end of the line" })

---- Set semicolon at the end of the line
set("n", "<leader>;", set_semicolon, { desc = "Set semicolon at the end of the line" })

---- Spellcheck word under cursor
set("n", "z;", function()
  local word = vim.fn.spellbadword()[1]
  print(word == "" and "✅ No misspelled word under cursor" or "❌ Misspelled word: " .. word)
end, { desc = "Spellcheck Line" })

---- Diff this buffer with the saved file
set("n", "<leader>fu", utils.diff_saved, { desc = "Diff this buffer with the saved file" })

set("n", "gUu", "gU", { desc = "To uppercase" })
set("n", "gUl", "gu", { desc = "To lowercase" })
-- set("n", "<leader>gUu", "g~", { desc = "Switch case operation" })

------ Alternate mappings
set("n", "do", "dd", { desc = "Delete line" })
set("n", "<leader>do", '"_dd', { desc = "Delete line without yank" })
set("n", "co", "cc", { desc = "Change line" })
set("n", "<leader>co", '"_cc', { desc = "Change line without yank" })
set("n", "yo", "yy", { desc = "Yank line" })
set("n", "<leader>yo", '"+yy', { desc = "Yank line into system clipboard" })
set("n", "vo", "V", { desc = "Visual Line Mode" })
set("n", "vq", "", { desc = "Visual Block Mode" })
set("n", "g~o", "g~g~", { desc = "Toggle case line" })
set("n", "gco", "<cmd>norm gcc<CR>", { desc = "Toggle comment line" })

local insertCommentMaps = {
  t = function()
    vim.cmd("norm OTODO:  gccA")
    vim.cmd.startinsert()
  end,
  f = function()
    vim.cmd("norm OFIX:  gccA")
    vim.cmd.startinsert()
  end,
  w = function()
    vim.cmd("norm OWARN:  gccA")
    vim.cmd.startinsert()
  end,
  e = function()
    vim.cmd("norm OTEST:  gccA")
    vim.cmd.startinsert()
  end,
  n = function()
    vim.cmd("norm ONOTE:  gccA")
    vim.cmd.startinsert()
  end,
  h = function()
    vim.cmd("norm OHACK:  gccA")
    vim.cmd.startinsert()
  end,
  b = function()
    vim.cmd("norm OBUG:  gccA")
    vim.cmd.startinsert()
  end,
  p = function()
    vim.cmd("norm OPERFORMANCE:  gccA")
    vim.cmd.startinsert()
  end,
  i = function()
    vim.cmd("norm OINFO:  gccA")
    vim.cmd.startinsert()
  end,
  W = function()
    vim.cmd("norm OWARNING:  gccA")
    vim.cmd.startinsert()
  end,
  x = function()
    vim.cmd("norm OXXX:  gccA")
    vim.cmd.startinsert()
  end,
  o = function()
    vim.cmd("norm OOPTMIZE:  gccA")
    vim.cmd.startinsert()
  end,
  P = function()
    vim.cmd("norm OPASSED:  gccA")
    vim.cmd.startinsert()
  end,
  F = function()
    vim.cmd("norm OFAILED:  gccA")
    vim.cmd.startinsert()
  end,
  l = function()
    vim.cmd("norm oxgcckJ$xA ")
    vim.cmd.startinsert()
  end,
  j = function()
    vim.cmd("norm oxgcc$xA ")
    vim.cmd.startinsert()
  end,
  k = function()
    vim.cmd("norm Oxgcc$xA ")
    vim.cmd.startinsert()
  end,
}

for key, fn in pairs(insertCommentMaps) do
  set("n", "<C-t>" .. key, fn)
  set("n", "<C-t><C-" .. key .. ">", fn)
end

set("n", "<C-u>", "M<C-u>zz", { desc = "Scroll up" })
set("n", "<C-d>", "M<C-d>zz", { desc = "Scroll down" })

---- Remap jk to gj gk for moving by display lines
set({ "n", "x", "o" }, "j", function()
  return vim.v.count > 0 and "j" or "gj"
end, {
  expr = true,
  desc = "Move down by display line",
})

set({ "n", "x", "o" }, "k", function()
  return vim.v.count > 0 and "k" or "gk"
end, {
  expr = true,
  desc = "Move up by display line",
})

set({ "n", "x", "o" }, "gk", "k", { desc = "Move up by real line" })
set({ "n", "x", "o" }, "gj", "j", { desc = "Move down by real line" })

---- Start/end of line (non-blank)
set({ "n", "x", "o" }, "gH", "_", { desc = "Start of line (non-blank)" })
set({ "n", "x", "o" }, "gh", "g^", { desc = "Start of visual line (non-blank)" })
set({ "n", "x", "o" }, "gL", "g_", { desc = "End of line (non-blank)" })
set({ "n", "x", "o" }, "gl", "g$", { desc = "End of visual line (non-blank)" })

---- Toggle Relative Line Numbers
set("n", "<leader>tn", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  if vim.wo.relativenumber then
    vim.notify("Relative Line Numbers: ON")
  else
    vim.notify("Relative Line Numbers: OFF")
  end
end, { desc = "Toggle Relative Line Numbers" })

---- Toggle Line Wrap
set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  if vim.wo.wrap then
    vim.notify("Line Wrap: ON")
  else
    vim.notify("Line Wrap: OFF")
  end
end, { desc = "Toggle Line Wrap" })

---- Mantain selection when indenting in visual mode
set("x", "<", "<gv", { desc = "Indent left" })
set("x", ">", ">gv", { desc = "Indent right" })

-- Turn on diff mode
set("n", "<leader>fc", function()
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
  vim.cmd("diffupdate")
  vim.notify("Diff Mode On")
end, { desc = "Turn on diff mode" })

-- Turn off diff mode
set("n", "<leader>fC", function()
  vim.cmd("diffoff")
  vim.notify("Diff Mode Off")
end, { desc = "Turn off diff mode" })

set("n", "<M-k>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
set("n", "<M-j>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

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
  "n",
  "<leader>*",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI<Left><Left><Left><Left>",
  { desc = "Search and replace word under cursor" }
)

set(
  "x",
  "<leader>*",
  '"zy:s/\\V<C-r>z/<C-r>z/gcI<Left><Left><Left><Left>',
  { desc = "Search and replace selection under cursor" }
)

---- Paste from system's clipboard
set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system's clipboard" })
set({ "n", "x" }, "<leader>P", 'O<Esc>"+p^', { desc = "Paste above from system's clipboard" })

---- Yank into system's clipboard
-- for _, key in ipairs({ "y", "Y" }) do
--   set({ "n", "x" }, "<leader>" .. key, '"+' .. key, { desc = "Yank into system's clipboard" })
-- end

set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank into system's clipboard" })

set({ "n", "x" }, "<leader>Y", '"+y$', { desc = "which_key_ignore" })

set({ "n", "x" }, "qe", "@", { noremap = true, desc = "Play macro" })

set({ "n", "x" }, "Q", "@@", { noremap = true, desc = "Replay last played macro" })

set({ "n", "x" }, "@@", "Q", { noremap = true, desc = "Play last recorded macro" })

---- `qr` to start macro recording
set({ "n", "x" }, "qr", function()
  vim.api.nvim_feedkeys("q", "n", false)
end, { noremap = true, desc = "Start recording macro" })

---- Clear Search Query
-- set("n", "<leader>ll", "<cmd>redraw | nohlsearch<CR>", { desc = "Clear Highlight Search" })
set("n", "<C-l>", "<cmd>nohlsearch|diffupdate|redraw|normal! <C-L><CR>", { desc = "Clear Highlight Search" })

-- set(
--   "n",
--   "<leader>lR",
--   "m0<cmd>enew<CR><C-6><cmd>bd<CR><C-6>`0<cmd>delm 0<CR><C-6><cmd>bd<CR>",
--   { desc = "Refresh buffer" }
-- )
set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search query" })

set("n", "<leader>rm", "<cmd>delm A-Z a-z 0-9<CR>", { desc = "Reset Marks" })

set("n", "<leader>rf", "<cmd>e!<CR>", { desc = "Reload buffer" })

set("n", "<leader>rF", "<cmd>bufdo e!<CR>", { desc = "Reload all buffers" })

set("n", "<leader>rl", "<cmd>lsp restart<CR>", { desc = "Restart LSP" })

set("n", "<leader>rn", "<cmd>restart<CR>", { desc = "Restart Neovim" })

---- '*' Keeps cursor on the same occurrence
set("n", "*", "*N", { desc = "'*' Keeps cursor on the name occurrence" })

---- Duplicate Line
-- set("n", "H", "<cmd>copy .<CR>", { desc = "Duplicate Line" })
set("n", "<c-h>", "<cmd>copy .<CR>", { desc = "Duplicate Line" })
set("x", "<c-h>", ":'<,'>copy '><CR>", { desc = "Duplicate Selection" })

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
set("x", "p", "P", { noremap = true, silent = true, desc = "Paste without yanking selection" })
set("x", "P", "p", { noremap = true, silent = true, desc = "Paste yanking selection" })

---- Delete selection without yanking
set("x", "<leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without yank" })

---- Delete line without yanking
set("n", "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yank" })

---- Delete till $ witout yanking
set("x", "<leader>D", '"_d$', { noremap = false, silent = true, desc = "Delete without yank" })

---- x deletes without yanking
-- set({ "n", "x" }, "x", "\"_x", { noremap = true, silent = true, desc = "Delete char without yank" })
for _, key in ipairs({ "x", "X" }) do
  set({ "n", "x" }, key, '"_' .. key, { noremap = true, silent = true, desc = "Delete char without yanking" })
end

---- Exit insert mode
set({ "i", "c" }, "jk", "<Esc>", { desc = "Exit insert mode (jk)" })
set({ "i", "c" }, "kj", "<Esc>", { desc = "Exit insert mode (kj)" })
-- set({ "i", "c" }, "JK", "<Esc>", { desc = "Exit insert mode (JK)" })
-- set({ "i", "c" }, "KJ", "<Esc>", { desc = "Exit insert mode (KJ)" })

---- Join lines and delete space
-- set("n", "<leader>jl", "J", { noremap = true, silent = true, desc = "Join lines" })
set("n", "J", "m0J`0<cmd>delm 0<CR>", { silent = true, desc = "Join lines" })
set("n", "gJ", "m0gJ`0<cmd>delm 0<CR>", { silent = true, desc = "Join lines without spaces" })

----Add empty line under
set("n", "<C-k>", "m0o<Esc>`0<cmd>delm 0<CR>", { desc = "Add empty line under", noremap = true })

----Add empty line above
set("n", "<C-j>", "m0O<Esc>==`0<cmd>delm 0<CR>", { desc = "Add empty line above", noremap = true })

---- Add empty line under insert mode
-- set("i", "<C-k>", "<Esc>m0o<Esc>`0l<cmd>delm 0<CR>i", { desc = "Add empty line under", noremap = true })
-- set("i", "<C-k>", "<C-p>", { desc = "Select Prev", noremap = true })
-- set("i", "<C-j>", "<C-n>", { desc = "Select Next", noremap = true })

---- Split lines downwards
set("n", "K", "m0i<CR><Esc>==`0<cmd>delm 0<CR>", { desc = "Split line downwards", noremap = true })

---- Visual lowercase
-- set("x", "gL", "gu", { noremap = true, desc = "Visual lowercase (gu)" })

---- Exit visual mode overrides
set("x", "u", "<C-c>", { noremap = true, desc = "Exit visual mode (u override)" })
set("x", "U", "<C-c>", { noremap = true, desc = "Exit visual mode (U override)" })

-------------------------------------------------------------------------------
---- 🧭 Explorers/File Navigation
-------------------------------------------------------------------------------

---- Open in GitHub
vim.keymap.set("n", "gX", function()
  local target = vim.fn.expand("<cfile>")
  if target == "" then
    return
  end

  vim.ui.open("https://github.com/" .. target)
end, {
  noremap = true,
  desc = "Open in GitHub",
})

-------------------------------------------------------------------------------
---- 🔤 Insert Mode Keymaps
-------------------------------------------------------------------------------

---- Ctrl-Backspace: delete word before cursor
set({ "c", "i" }, "<C-Backspace>", "<C-o>db", { noremap = true, desc = "Delete word before cursor" })

---- Ctrl-Delete: delete word after curso
set({ "c", "i" }, "<C-Delete>", "<C-o>de", { noremap = true, desc = "Delete word after cursor" })

-------------------------------------------------------------------------------
---- ☸> Command Mode Keymaps
-------------------------------------------------------------------------------

-- set("c", "<Up>", "<C-p>", { desc = "Select Previous" })
-- set("c", "<Down>", "<C-n>", { desc = "Select Next" })
