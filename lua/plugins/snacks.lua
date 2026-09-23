local utils = require("utils")

local set = vim.keymap.set

local floatingOpts = {
  focusable = true,
  style = "minimal",
  border = "rounded",
  source = true, -- or "if_many"
  header = "",
  prefix = "",
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = floatingOpts,
})


-- stylua: ignore start
---- Lsp Keymaps ----
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    set("n", "gu", function() vim.lsp.buf.hover(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
    set("n", "gs", function() vim.lsp.buf.signature_help(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))
    set("i", "<C-s>", function() vim.lsp.buf.signature_help(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))
    set("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
    set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
    set({ "n", "x" }, "gq", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))
    set("n", "ga", function() vim.diagnostic.open_float(nil, { focusable = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Line diagnostics" }))
    set("n", "gA", function() vim.diagnostic.setqflist() end, vim.tbl_extend("force", opts, { desc = "LSP: Open full buffer diagnostics" }))
    set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", { desc = "LSP: Goto Definition" })
    set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", { desc = "LSP: Goto Declaration" })
    set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", { nowait = true, desc = "LSP: References" })
    set("n", "gI", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", { desc = "LSP: Goto Implementation" })
    set("n", "go", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", { desc = "LSP: Goto Type Definition" })
    set("n", "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<CR>", { desc = "LSP: Symbols" })
    set("n", "<leader>sS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>", { desc = "LSP: Workspace Symbols" })
    set("n", "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<CR>", { desc = "LSP: Search Diagnostics" })
  end,
})
-- stylua: ignore end

for _, key in ipairs({ "<leader>q", "<M-q>", "qt" }) do
  set("n", key, "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Close Buffer" })
end

local function close_all_buffers()
  local snacks = require("snacks")
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      snacks.bufdelete(buf)
    end
  end
end

local function open_projects()
  require("snacks").picker.projects({
    confirm = function(picker, item)
      if not item then
        return
      end
      utils.smart_save_session()
      IsProject = false
      close_all_buffers()
      LoadSession(picker, item)
    end,
  })
end

local function safe_quit_neovim()
  utils.smart_save_session()
  IsProject = false
  close_all_buffers()
  vim.cmd("q")
end

local function search_scratch_files()
  local scratch_dir = vim.fn.getcwd():gsub("\\", "/") .. "/.scratch/"
  if vim.fn.isdirectory(scratch_dir) == 0 then
    vim.notify("No scratch files found")
    return
  end

  require("snacks").picker.files({
    cwd = scratch_dir,
    title = "Scratch Files",
    prompt_title = "Scratch Files",
    confirm = function(picker, item)
      picker:close()
      local full_path = scratch_dir .. item.file

      vim.schedule(function()
        vim.cmd({ cmd = "edit", args = { full_path } })
      end)
    end,
  })
end

local function snacks_todo()
  ---@diagnostic disable-next-line: undefined-field
  Snacks.picker.todo_comments({
    focus = "list",
    -- keywords = { "TODO", "FIX", "TEST", "WARN", "HACK", "BUG", "NOTE" },
    keywords = { "TODO", "FIX", "TEST", "BUG" },
  })
end

local function open_terminal()
  vim.cmd("lua Snacks.terminal.toggle()")
  vim.cmd("wincmd L")
  vim.cmd("vertical res -8")
end

local function leave_terminal()
  vim.cmd.stopinsert()
  vim.cmd("lua Snacks.terminal.toggle()")
end

-- local function change_colorscheme()
--   require("snacks").picker.colorschemes({
--     finder = "vim_colorschemes",
--     format = "text",
--     preview = "colorscheme",
--     layout = "bottom",
--     preset = "vertical",
--     transform = function(item)
--       return not item.file or not vim.startswith(item.file, vim.env.VIMRUNTIME)
--     end,
--     confirm = function(picker, item)
--       picker:close()
--       if item then
--         picker.preview.state.colorscheme = nil
--         -- vim.schedule(function()
--         --   -- vim.cmd("colorscheme" .. item.text)
--         --   -- ColorScheme(item.text)
--         -- end)
--       end
--     end,
--   })
-- end

local function smart_search()
  require("snacks").picker.smart({
    multi = { "files", "buffers" },
    format = "file", -- use `file` format for all sources
    matcher = {
      cwd_bonus = false, -- boost cwd matches
      frecency = false, -- use frecency boosting
      sort_empty = false, -- sort even when the filter is empty
    },
    transform = "unique_file",
  })
end

return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = require("plugins.snacks-dashboard"),
    explorer = { enabled = true },
    indent = require("plugins.snacks-indent"),
    input = { enabled = true },
    picker = require("plugins.snacks-picker"),
    notifier = { enabled = true, timeout = 3000 },
    quickfile = { enabled = true },
    scope = { enabled = true },
    -- scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = { notification = { wo = { wrap = true } } },
  },
  keys = {
    -- stylua: ignore start
    { "<leader><Tab>", "<cmd>lua Snacks.picker.resume()<CR>",{ desc = "Snacks: Resume Search" } },
    -- { "<leader><leader>", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Snacks: Smart Search Files" },
    -- { "<C- >", "<cmd>lua Snacks.picker.smart()<CR>", desc = "Snacks: Smart Search Files" },
    { "<C-e>", smart_search, desc = "Snacks: Search Files" },
    { "<leader>sf", "<cmd>lua Snacks.picker.files()<CR>", desc = "Snacks: Smart Search Files" },
    { "<leader>sg", "<cmd>lua Snacks.picker.git_diff()<CR>", desc = "Snacks: Search Git Diffs" },
    { "<leader>s,", "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>", desc = "Snacks: Search Config Files" },
    { "<leader>sr", "<cmd>lua Snacks.picker.recent()<CR>", desc = "Snacks: Search Recent Files" },
    { "<leader>sl", "<cmd>lua Snacks.picker.lines()<CR>", desc = "Snacks: Search Lines" },
    -- { "<leader>-", "<cmd>lua Snacks.picker.explorer()<CR>", desc = "Snacks: Open Explorer" },
    { "<leader>fR", "<cmd>lua Snacks.rename.rename_file()<CR>", desc = "Snacks: Rename File" },
    { "<leader>/", "<cmd>lua Snacks.picker.grep()<CR>", desc = "Snacks: Search Grep" },
    { "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<CR>", desc = "Snacks: Search Word Grep", mode = { "n", "x" } },
    { "<leader>sW", "m0viW<cmd>lua Snacks.picker.grep_word()<CR>`0", desc = "Snacks: Search Word Grep", mode = "n" },
    { "<C-p>", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Snacks: Search Buffers" },
    { "<leader>sb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Snacks: Search Buffers" },
    { "<leader>sC", "<cmd>lua Snacks.picker.commands()<CR>", desc = "Snacks: Search Commands" },
    { "<leader>sc", "<cmd>lua Snacks.picker.colorschemes({ layout = 'bottom' })<CR>", desc = "Snacks: Search Color Schemes" },
    -- { "<leader>sc", change_colorscheme, desc = "Snacks: Search Color Schemes" },
    { "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "Snacks: Search Keymaps" },
    { "<leader>sh", "<cmd>lua Snacks.picker.help()<CR>", desc = "Snacks: Search Help", mode = {'n', 'x'} },
    { "<leader>s/", "<cmd>lua Snacks.picker.search_history()<CR>", desc = "Snacks: Search History" },
    { "<leader>s\"", "<cmd>lua Snacks.picker.registers()<CR>", desc = "Snacks: Search Registers" },
    { "<leader>s:", "<cmd>lua Snacks.picker.command_history()<CR>", desc = "Snacks: Search Command History" },
    { "<leader>n", "<cmd>lua Snacks.notifier.show_history()<CR>", desc = "Snacks: Show Notification History" },
    { "<leader>sn", "<cmd>lua Snacks.picker.notifications()<CR>", desc = "Snacks: Show Notification Picker" },
    { "<leader>sm", "<cmd>lua Snacks.picker.marks()<CR>", desc = "Snacks: Search Marks" },
    { "<leader>sz", "<cmd>lua Snacks.picker.zoxide()<CR>", desc = "Snacks: Search Zoxide" },
    { "<leader>sy", search_scratch_files, desc = "Snacks: Search Custom Scratch Files" },
    { "<leader>s.", "<cmd>lua Snacks.scratch.select()<CR>", desc = "Snacks: Pick Project Scratch File" },
    { "<leader>.", "<cmd>lua Snacks.scratch()<CR>", desc = "Snacks: Open Project Scratch File" },
    { "<leader>sp", open_projects, desc = "Snacks: Search Projects" },
    { "<leader>su", "<cmd>lua Snacks.picker.undo({focus='list', layout='right'})<CR>", desc = "Snacks: Search Undos" },
    -- { "<leader>st", searchTodos, desc = "Snacks: Search Every TODO" },
    -- { "<leader>sT", function () searchTodos([[( TODO\:| FIX\:)]]) end, desc = "Snacks: Search TODOs" },
    { "<leader>sj", "<cmd>lua Snacks.picker.jumps({focus='list'})<CR>", desc = "Snacks: Search Jumplist" },
    { "<leader>sT", "<cmd>lua Snacks.picker.todo_comments()<CR>", desc = "Search TODOs" },
    { "<leader>st", snacks_todo, desc = "Search TODOs" },
    { "<leader>sP", "<cmd>lua Snacks.picker.pickers()<CR>", desc = "Search Snacks' Pickers" },
    ---- Git Actions ----
    { "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", desc = "Snacks: Git Lazygit" },
    { "<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", desc = "Snacks: Git Line Blame" },
    { "<leader>gl", "<cmd>lua Snacks.picker.git_log_line()<CR>", desc = "Snacks: Git Log Line" },
    { "<leader>gf", "<cmd>lua Snacks.picker.git_log_file()<CR>", desc = "Snacks: Git Search Diff File" },
    ---- Jumps ----
    { "]w", "<cmd>lua Snacks.words.jump(1)<CR>", desc = "Snacks: Jump to Next Word" },
    { "[w", "<cmd>lua Snacks.words.jump(-1)<CR>", desc = "Snacks: Jump to Previous Word" },
    ---- Zen mode ----
    {"<leader>z", "<cmd>lua Snacks.zen()<CR>", desc = "Snacks: Toggle Zen Mode" },
    -- {"<leader>Z", "<cmd>lua Snacks.zen.zoom()<CR>", desc = "Snacks: Toggle Zen Mode Zoom" },
    ---- Terminal mode ----
    { "<C-y>", open_terminal, { desc = "Snacks: Toggle terminal (normal)" } },
    { "<C-y>", leave_terminal, { desc = "Snacks: Toggle terminal (terminal)" }, mode = "t" },
    { "ZZ", safe_quit_neovim, { desc = "Safe Quit Neovim" } }
,
  },
}
