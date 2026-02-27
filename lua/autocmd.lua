-- On vim startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Change window title to Nvim
    vim.opt.title = true
    vim.opt.titlestring = "Neovim"
  end,
})

---- Prevent d or y operators from yanking into register if register would be empty
-- Save unnamed register before yank/delete
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:[nv]", -- From any mode into Normal/Visual
  callback = function()
    vim.g._reg_backup = vim.fn.getreg('"')
    vim.g._regtype_backup = vim.fn.getregtype('"')
  end,
})

-- Auto Set ini filetype for Equalizer APO config.txt
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "C:/Program Files/EqualizerAPO/config/config.txt",
--   callback = function()
--     vim.bo.filetype = "dosini"
--   end,
--   desc = "Set filetype for Equalizer APO config.txt", -- Optional: a description for the autocmd
-- })

-- Before quiting and after buffer opened
vim.api.nvim_create_autocmd({ "QuitPre", "BufAdd" }, {
  callback = function()
    SmartSaveSession()
  end,
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      -- defer centering slightly so it's applied after render
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end
  end,
})

-- Set filetype for dotenv files and Equalizer APO config.txt
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
  pattern = { ".env", ".env.*", "C:/Program Files/EqualizerAPO/config/config.txt" },
  callback = function()
    vim.bo.filetype = "dosini"
  end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Before Quiting Neovim
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    -- vim.cmd("LspStop")
    vim.fn.system([[
      powershell -NoProfile -Command "
      if ((Get-Process nvim -ErrorAction SilentlyContinue).Count -le 2) {
      Get-Process biome -ErrorAction SilentlyContinue | Stop-Process
      }
    "
    ]])
    -- vim.fn.jobstart({ "eslint_d", "--stop" })
    -- vim.fn.jobstart({ "prettierd", "--stop" })
    -- CleanShaDaFiles()
  end,
})

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     SmartChangeDir()
--   end,
-- })

-- ---- On buffer write, reload LuaSnip snippets
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = vim.fn.stdpath("config") .. "/lua/snippets/*.lua",
--   callback = function()
--     require("luasnip.loaders.from_lua").load({
--       paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
--     })
--   end,
-- })

---- Highlight yanked text
---- Prevent d and y operations from replacing the register if the content is empty
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local op = vim.v.event.operator
    if op ~= "d" and op ~= "y" then
      return
    end

    local content = vim.fn.getreg('"')
    if content:match("^%s*$") then
      -- Restore previous register if new one is empty
      vim.fn.setreg('"', vim.g._reg_backup or "", vim.g._regtype_backup or "v")
    end
    vim.highlight.on_yank()
  end,
})

---- Reduce timeoutlen in insert and Cmdline
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  callback = function()
    vim.o.timeoutlen = 50
  end,
})

---- Restore timeoutlen when leaving insert and Cmdline mode
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  callback = function()
    vim.o.timeoutlen = 500
  end,
})
