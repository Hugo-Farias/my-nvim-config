-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>sr", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Snacks: Open recent files" })
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>", { desc = "Snacks: Open explorer" })
vim.keymap.set("n", "<leader>cR", "<cmd>:lua Snacks.rename.rename_file()<CR>", { desc = "Rename File" })

vim.keymap.set("n", "<leader>gg", "<cmd>:lua Snacks.lazygit()<CR>", { desc = "Git: Lazygit" })
vim.keymap.set("n", "<leader>gb", "<cmd>:lua Snacks.git.blame_line()<CR>", { desc = "Git: Line Blame" })

vim.keymap.set("n", "<C-t>", "<cmd>:lua Snacks.Terminal()<CR>", { desc = "Open Terminal" })

-- -- Close buffer
-- for _, key in ipairs({ "<C-f4>", "<leader>q" }) do
--   -- vim.keymap.set("n", key, ":bd<CR>", { desc = "Close buffer" })
--   vim.keymap.set("n", key, "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Close buffer" })
-- end

-- for _, key in ipairs({ "<C-f4>", "<leader>q" }) do
--   vim.keymap.set("n", key, function()
--     require("snacks").bufdelete()

--     -- Check if there are any listed buffers left
--     local listed = vim.fn.getbufinfo({ buflisted = 1 })
--     if #listed == 0 then
--       require("snacks.dashboard").open()
--     end
--   end, { desc = "Close buffer" })
-- end

for _, key in ipairs({ "<C-f4>", "<leader>q" }) do
  vim.keymap.set("n", key, function()
    require("snacks").bufdelete()

    vim.defer_fn(function()
      local buf = vim.api.nvim_get_current_buf()
      local info = vim.fn.getbufinfo(buf)[1]

      local is_nofile = vim.bo[buf].buftype == "" and vim.fn.bufname(buf) == ""
      local is_unmodified = not vim.bo[buf].modified
      local is_empty = info and info.linecount == 1 and vim.fn.getbufline(buf, 1)[1] == ""

      if is_nofile and is_unmodified and is_empty then
        require("snacks.dashboard").open()
      end
    end, 50)  -- small delay to allow bufdelete to finish
  end, { desc = "Close buffer" })
end


-- vim.keymap.set("n", "<leader>sc", "<cmd>:lua Snacks.picker.pick('config')<CR>", { desc = "Snacks: Open config picker" })

-- Return to dashboard
vim.keymap.set("n", "<leader>sd", function()
  require("snacks.dashboard").open()
end, { desc = "Snacks: Open dashboard" })

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
