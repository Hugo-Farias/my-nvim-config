local set = vim.keymap.set

-- stylua: ignore start
---- Lsp Keymaps ----
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", { desc = "LSP: Goto Definition" })
    set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", { desc = "LSP: Goto Declaration" })
    set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", { nowait = true, desc = "LSP: References" })
    set("n", "gI", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", { desc = "LSP: Goto Implementation" })
    set("n", "go", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", { desc = "LSP: Goto T[y]pe Definition" })
    set("n", "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", { desc = "LSP: Symbols" })
    set("n", "<leader>sS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>", { desc = "LSP: Workspace Symbols" })
    set("n", "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<CR>", { desc = "Snacks: Search Diagnostics" })
  end,
})
-- stylua: ignore end

---- Open Diff View
set("n", "<leader>fd", function()
  vim.cmd("diffoff")
  vim.cmd("wincmd o")
  vim.cmd("wincmd v")
  vim.cmd("wincmd l")
  require("snacks").picker.files({
    confirm = function(picker, item)
      picker:close()
      vim.cmd("e " .. item.file)
      vim.cmd("diffthis")
      vim.cmd("wincmd h")
      vim.defer_fn(function()
        vim.cmd("diffthis")
        vim.cmd("diffupdate")
      end, 100)
    end,
    cancel = function()
      vim.cmd("diffoff")
      vim.cmd("wincmd h")
      vim.cmd("wincmd o")
    end,
  })
end, { desc = "Snacks: Compare Files" })

-- Toggle terminal in normal mode
set("n", "<C-y>", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Snacks: Toggle terminal (normal)" })

-- Toggle terminal in terminal mode
set("t", "<C-y>", function()
  vim.cmd("stopinsert") -- exit terminal input mode
  vim.cmd("lua Snacks.terminal.toggle()") -- then hide the terminal
end, { desc = "Snacks: Toggle terminal (terminal)" })

for _, key in ipairs({ "<C-f4>", "<leader>q", "<M-q>", "qt" }) do
  set("n", key, function()
    require("snacks").bufdelete()
  end, { desc = "Close Buffer" })
end

local function closeAllBuffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      -- Delete the buffer
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

local function searchScratchFiles()
  local scratch_dir = vim.fn.getcwd():gsub("\\", "/") .. "/.scratch/"
  if vim.fn.isdirectory(scratch_dir) == 0 then
    vim.notify("No scratch files found")
    return
  end

  require("snacks").picker.files({
    cwd = scratch_dir,
    prompt_title = "Scratch Files",
    confirm = function(picker, item)
      picker:close()
      local full_path = scratch_dir .. item.file
      vim.notify("Opening: " .. full_path)

      vim.schedule(function()
        -- Prefer this safe form over vim.cmd("e " .. full_path)
        vim.cmd({ cmd = "edit", args = { full_path } })
      end)
    end,
  })
end

-- local function pickerTodo

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = require("plugins.snacks-dashboard"),
    explorer = { enabled = true },
    indent = require("plugins.snacks-indent"),
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
    { "<leader><leader>", "<cmd>lua Snacks.picker.files()<CR>", desc = "Snacks: Search Files" },
    { "<leader>sf", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Snacks: Smart Search Files" },
    { "<leader>sgf", "<cmd>lua Snacks.picker.git_files()<CR>", desc = "Snacks: Search Git Files" },
    { "<leader>s,", "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>", desc = "Snacks: Search Config File"},
    { "<leader>sr", "<cmd>lua Snacks.picker.recent()<CR>", desc = "Snacks: Search Recent Files" },
    { "<leader>sl", "<cmd>lua Snacks.picker.lines()<CR>", desc = "Snacks: Search Lines" },
    { "<leader>e", "<cmd>lua Snacks.picker.explorer()<CR>", desc = "Snacks: Open Explorer" },
    { "<leader>fR", "<cmd>lua Snacks.rename.rename_file()<CR>", desc = "Snacks: Rename File" },
    { "<leader>/", "<cmd>lua Snacks.picker.grep()<CR>", desc = "Snacks: Search Grep" },
    { "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<CR>", desc = "Snacks: Search Word Grep" },
    { "<leader>/", "<cmd>lua Snacks.picker.grep_word()<CR>", desc = "Snacks: Search Selection Grep", mode = "x" },
    { "<C-e>", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Snacks: Search Buffers" },
    { "<leader>sb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Snacks: Search Buffers" },
    { "<leader>sC", "<cmd>lua Snacks.picker.colorschemes()<CR>", desc = "Snacks: Search Color Schemes" },
    { "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "Snacks: Search Keymaps" },
    { "<leader>sH", "<cmd>lua Snacks.picker.help()<CR>", desc = "Snacks: Search Help" },
    { "<leader>sh", "<cmd>lua Snacks.picker.search_history()<CR>", desc = "Snacks: Search History" },
    { "<leader>s'", "<cmd>lua Snacks.picker.registers()<CR>", desc = "Snacks: Search Registers" },
    { "<leader>sc", "<cmd>lua Snacks.picker.command_history()<CR>", desc = "Snacks: Search Command History" },
    { "<leader>sm", "<cmd>lua Snacks.picker.marks()<CR>", desc = "Snacks: Search Marks" },
    { "<leader>n", "<cmd>lua Snacks.notifier.show_history()<CR>", desc = "Snacks: Show Notification History" },
    { "<leader>st", "<cmd>lua Snacks.picker.todo_comments()<CR>", desc = "Snacks: Search TODOs" },
    { "<leader>sz", "<cmd>lua Snacks.picker.zoxide()<CR>", desc = "Snacks: Search Zoxide" },
    { "<leader>sy", searchScratchFiles, desc = "Snacks: Search Scratch Files" },
    { "<leader>sp", openProjects, desc = "Snacks: Search Projects" },
    ---- Git Actions ----
    { "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", desc = "Snacks: Git Lazygit" },
    { "<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", desc = "Snacks: Git Line Blame" },
    { "<leader>gl", "<cmd>lua Snacks.picker.git_log_line()<CR>", desc = "Snacks: Git Log Line" },
    { "<leader><Tab>", "<cmd>lua Snacks.picker.resume()<CR>", desc = "Snacks: Resume Search" },
  },
}
