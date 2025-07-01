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

local function closeAllBuffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      vim.api.nvim_set_current_buf(buf)
      require("snacks").bufdelete()
    end
  end
end

local function openProjects()
  require("snacks").picker.projects({
    confirm = function(picker, item)
      SmartSaveSession()
      IsProject = false
      closeAllBuffers()
      LoadSession(picker, item)
    end,
  })
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
    {"<leader>sf", "<cmd>lua Snacks.picker.files()<CR>", desc = "Snacks: Search Files" },
    {"<leader><leader>", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Snacks: Smart Search Files" },
    {"<leader>sg", "<cmd>lua Snacks.picker.git_files()<CR>", desc = "Snacks: Search Git Files" },
    {"<leader>sr", "<cmd>lua Snacks.picker.recent()<CR>", desc = "Snacks: Search Recent Files" },
    {"<leader>sl", "<cmd>lua Snacks.picker.lines()<CR>", desc = "Snacks: Search Lines" },
    {"<leader>e", "<cmd>lua Snacks.picker.explorer()<CR>", desc = "Snacks: Open Explorer" },
    {"<leader>fR", "<cmd>lua Snacks.rename.rename_file()<CR>", desc = "Snacks: Rename File" },
    {"<leader>s/", "<cmd>lua Snacks.picker.grep()<CR>", desc = "Snacks: Search Grep" },
    {"<C-e>", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Snacks: Search Buffers" },
    {"<leader>sC", "<cmd>lua Snacks.picker.colorschemes()<CR>", desc = "Snacks: Search Color Schemes" },
    {"<leader>sk", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "Snacks: Search Keymaps" },
    {"<leader>sh", "<cmd>lua Snacks.picker.help()<CR>", desc = "Snacks: Search Help" },
    {"<leader>s'", "<cmd>lua Snacks.picker.registers()<CR>", desc = "Snacks: Search Registers" },
    {"<leader>sc", "<cmd>lua Snacks.picker.command_history()<CR>", desc = "Snacks: Search Command History" },
    {"<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<CR>", desc = "Snacks: Search Diagnostics" },
    {"<leader>sm", "<cmd>lua Snacks.picker.marks()<CR>", desc = "Snacks: Search Diagnostics" },
    {"<leader>sn", "<cmd>lua Snacks.notifier.show_history()<CR>", desc = "Snacks: Show Notification History" },
    {"<leader>sH", "<cmd>lua Snacks.picker.search_history()<CR>", desc = "Snacks: Show Notification History" },
    ---- Git Actions ----
    {"<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", desc = "Snacks: Git Lazygit" },
    {"<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", desc = "Snacks: Git Line Blame" },
    {"<leader>gl", "<cmd>lua Snacks.picker.git_log_line()<CR>", desc = "Snacks: Git Log Line" },
    {"<leader>sp", function() openProjects() end, desc = "Snacks: Search Projects" },
    -- stylua: ignore end
  },
}
