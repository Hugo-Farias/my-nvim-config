-- Before leaving and after buffer opened
vim.api.nvim_create_autocmd({ "QuitPre", "BufAdd" }, {
  callback = function()
    SmartSaveSession()
  end,
})

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     SmartChangeDir()
--   end,
-- })

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
