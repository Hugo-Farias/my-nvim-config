-- Before leaving and after buffer opened
vim.api.nvim_create_autocmd({ "QuitPre", "BufAdd" }, {
  callback = function()
    SmartSaveSession()
  end,
})

-- -- After Quiting Neovim
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = function()
--     CleanShaDaFiles()
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     SmartChangeDir()
--   end,
-- })

---- On buffer write, reload LuaSnip snippets
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.stdpath("config") .. "/lua/snippets/*.lua",
  callback = function()
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets",
    })
  end,
})

---- Reduce timeoutlen in insert and Cmdline mode for faster key sequences
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

---- Prevent d and y operations from replacing the register if the content is empty
---- Highlight yanked text
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
