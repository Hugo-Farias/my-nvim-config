-------------------------------------------------------------------------------
-- 🍿 Snacks Keymaps
-------------------------------------------------------------------------------

-- stylua: ignore start
---- Lsp Keymaps ----
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", {desc = "LSP: Goto Definition" })
    vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", {desc = "LSP: Goto Declaration" })
    vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", {nowait = true, desc = "LSP: References" })
    vim.keymap.set("n", "gI", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", {desc = "LSP: Goto Implementation" })
    vim.keymap.set("n", "go", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", {desc = "LSP: Goto T[y]pe Definition" })
    vim.keymap.set("n", "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", {desc = "LSP: Symbols" })
    vim.keymap.set("n", "<leader>sS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>", {desc = "LSP: Workspace Symbols" })
  end,
})
-- stylua: ignore end

-- Toggle terminal in normal mode
vim.keymap.set("n", "<C-y>", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Snacks: Toggle terminal (normal)" })

-- Toggle terminal in terminal mode
vim.keymap.set("t", "<C-y>", function()
  vim.cmd("stopinsert") -- exit terminal input mode
  vim.cmd("lua Snacks.terminal.toggle()") -- then hide the terminal
end, { desc = "Snacks: Toggle terminal (terminal)" })

for _, key in ipairs({ "<C-f4>", "<leader>q", "<M-q>", "qt" }) do
  vim.keymap.set("n", key, function()
    require("snacks").bufdelete()
  end, { desc = "Close Buffer" })
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = require("plugins.snacks-dashboard"),
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = require("plugins.snacks-picker"),
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    {"<leader>sf", function() Snacks.picker.files() end, desc = "Snacks: Search Files" },
    {"<leader><leader>", function() Snacks.picker.smart() end, desc = "Snacks: Smart Search Files" },
    {"<leader>sg", function() Snacks.picker.git_files() end, desc = "Snacks: Search Git Files" },
    {"<leader>sr", function() Snacks.picker.recent() end, desc = "Snacks: Search Recent Files" },
    {"<leader>sl", function() Snacks.picker.lines() end, desc = "Snacks: Search Lines" },
    {"<leader>e", function() Snacks.picker.explorer() end, desc = "Snacks: Open Explorer" },
    {"<leader>fR", function() Snacks.rename.rename_file() end, desc = "Snacks: Rename File" },
    {"<leader>s/", function() Snacks.picker.grep() end, desc = "Snacks: Search Grep" },
    {"<C-e>", function() Snacks.picker.buffers() end, desc = "Snacks: Search Buffers" },
    {"<leader>sC", function() Snacks.picker.colorschemes() end, desc = "Snacks: Search Color Schemes" },
    {"<leader>sk", function() Snacks.picker.keymaps() end, desc = "Snacks: Search Keymaps" },
    {"<leader>sh", function() Snacks.picker.help() end, desc = "Snacks: Search Help" },
    {"<leader>s'", function() Snacks.picker.registers() end, desc = "Snacks: Search Registers" },
    {"<leader>sc", function() Snacks.picker.command_history() end, desc = "Snacks: Search Command History" },
    {"<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Snacks: Search Diagnostics" },
    {"<leader>sm", function() Snacks.picker.marks() end, desc = "Snacks: Search Diagnostics" },
    {"<leader>sp", function() Snacks.picker.projects() end, desc = "Snacks: Search Projects" },
    {"<leader>sn", function() Snacks.notifier.show_history() end, desc = "Snacks: Show Notification History" },
    ---- Git Actions ----
    {"<leader>gg", function() Snacks.lazygit() end, desc = "Snacks: Git Lazygit" },
    {"<leader>gb", function() Snacks.git.blame_line() end, desc = "Snacks: Git Line Blame" },
    {"<leader>gl", function() Snacks.picker.git_log_line() end, desc = "Snacks: Git Log Line" },
    -- stylua: ignore end
  },
}
