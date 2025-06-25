-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

-- stylua: ignore start
vim.keymap.set("n", "<leader>sg", "<cmd>lua Snacks.picker.git_files()<CR>", { desc = "Snacks: Search Git Files" })
vim.keymap.set("n", "<leader><leader>", "<cmd>lua Snacks.picker.files()<CR>", { desc = "Snacks: Search Files" })
vim.keymap.set("n", "<leader>sr", "<cmd>lua Snacks.picker.recent()<CR>", { desc = "Snacks: Search Recent Files" })
vim.keymap.set("n", "<leader>sl", "<cmd>lua Snacks.picker.lines()<CR>", { desc = "Snacks: Search Lines" })
vim.keymap.set("n", "<leader>e", "<cmd>lua Snacks.picker.explorer()<CR>", { desc = "Snacks: Open Explorer" })
vim.keymap.set("n", "<leader>fR", "<cmd>lua Snacks.rename.rename_file()<CR>", { desc = "Snacks: Rename File" })
vim.keymap.set("n", "<leader>s/", "<cmd>lua Snacks.picker.grep()<CR>", { desc = "Snacks: Search Grep" })
vim.keymap.set("n", "<C-e>", "<cmd>lua Snacks.picker.buffers()<CR>", { desc = "Snacks: Search Buffers" })
vim.keymap.set("n", "<leader>sC", "<cmd>lua Snacks.picker.colorschemes()<CR>", { desc = "Snacks: Search Color Schemes" })
vim.keymap.set("n", "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<CR>", { desc = "Snacks: Search Keymaps" })
vim.keymap.set("n", "<leader>sh", "<cmd>lua Snacks.picker.help()<CR>", { desc = "Snacks: Search Help" })
vim.keymap.set("n", "<leader>s'", "<cmd>lua Snacks.picker.registers()<CR>", { desc = "Snacks: Search Registers" })
vim.keymap.set("n", "<leader>sc", ":lua Snacks.picker.command_history()<CR>", { desc = "Snacks: Search Command History" })
vim.keymap.set("n", "<leader>sd", ":lua Snacks.picker.diagnostics()<CR>", { desc = "Snacks: Search Diagnostics" })
vim.keymap.set("n", "<leader>sm", ":lua Snacks.picker.marks()<CR>", { desc = "Snacks: Search Diagnostics" })

vim.keymap.set("n", "<leader>sn", ":lua Snacks.notifier.show_history()<CR>", { desc = "Snacks: Show Notification History" })

---- Git Actions
vim.keymap.set("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", { desc = "Snacks: Git Lazygit" })
vim.keymap.set("n", "<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", { desc = "Snacks: Git Line Blame" })
vim.keymap.set("n", "<leader>gl", "<cmd>lua Snacks.picker.git_log_line()<CR>", {desc = "Snacks: Git Log Line" })

---- Keymaps ----
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, {desc = "LSP: Goto Definition" })
    vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, {desc = "LSP: Goto Declaration" })
    vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, {nowait = true, desc = "LSP: References" })
    vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, {desc = "LSP: Goto Implementation" })
    vim.keymap.set("n", "go", function() Snacks.picker.lsp_type_definitions() end, {desc = "LSP: Goto T[y]pe Definition" })
    vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, {desc = "LSP: Symbols" })
    vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, {desc = "LSP: Workspace Symbols" })
  end,
})

-- stylua: ignore end

-- Toggle terminal in normal mode
vim.keymap.set("n", "<C-y>", function()
  Snacks.terminal.toggle()
end, { desc = "Snacks: Toggle terminal (normal)" })

-- Toggle terminal in terminal mode
vim.keymap.set("t", "<C-y>", function()
  vim.cmd("stopinsert") -- exit terminal input mode
  Snacks.terminal.toggle() -- then hide the terminal
end, { desc = "Snacks: Toggle terminal (terminal)" })

-- Close buffer
for _, key in ipairs({ "<C-f4>", "<leader>q", "<M-q>", "qt" }) do
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
    end, 50) -- small delay to allow bufdelete to finish
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
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
