-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>sf", "<cmd>:lua Snacks.picker.files()<CR>", { desc = "Snacks: Search Files" })
vim.keymap.set("n", "<leader>sr", "<cmd>:lua Snacks.dashboard.pick('oldfiles')<CR>", { desc = "Snacks: Search recent files" })
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.picker.explorer()<CR>", { desc = "Snacks: Open explorer" })
vim.keymap.set("n", "<leader>sR", "<cmd>:lua Snacks.rename.rename_file()<CR>", { desc = "Snacks: Rename File" })
vim.keymap.set("n", "<leader>sg", "<cmd>:lua Snacks.picker.grep()<CR>", { desc = "Snacks: Search Grep" })
vim.keymap.set("n", "<C-e>", "<cmd>:lua Snacks.picker.buffers()<CR>", { desc = "Snacks: Search Buffers" })
vim.keymap.set("n", "<leader>sc", ":lua Snacks.picker.colorschemes()<CR>", { desc = "Snacks: Search Color Schemes" })
vim.keymap.set("n", "<leader>sk", ":lua Snacks.picker.keymaps()<CR>", { desc = "Snacks: Search Keymaps" })
vim.keymap.set("n", "<leader>sh", ":lua Snacks.picker.help()<CR>", { desc = "Snacks: Search Help" })

vim.keymap.set("n", "<leader>gg", "<cmd>:lua Snacks.lazygit()<CR>", { desc = "Snacks: Git Lazygit" })
vim.keymap.set("n", "<leader>gb", "<cmd>:lua Snacks.git.blame_line()<CR>", { desc = "Snacks: Git Line Blame" })

-- Toggle terminal in normal mode
vim.keymap.set("n", "<C-y>", function()
  Snacks.terminal.toggle()
end, { desc = "Snacks: Toggle terminal (normal)" })

-- Toggle terminal in terminal mode
vim.keymap.set("t", "<C-y>", function()
  vim.cmd("stopinsert")        -- exit terminal input mode
  Snacks.terminal.toggle()     -- then hide the terminal
end, { desc = "Snacks: Toggle terminal (terminal)" })

-- Close buffer
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
