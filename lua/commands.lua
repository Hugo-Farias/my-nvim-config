local utils = require("utils")

vim.api.nvim_create_user_command("Q", "<cmd>q<CR>", {})

vim.api.nvim_create_user_command("MkProject", function()
  utils.smart_change_dir()
  IsProject = true
end, {})

---- Save and source file
-- vim.api.nvim_create_user_command("W", function()
--   vim.cmd("write | source %")
-- end, {})
