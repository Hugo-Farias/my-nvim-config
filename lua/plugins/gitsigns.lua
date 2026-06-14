local function gitDiffBranch()
  require("snacks").picker.git_branches(
    ---@type snacks.picker.git.branches.Config
    {
      source = "git_branches",
      focus = "list",
      confirm = function(picker, item)
        picker:close()
        if not item then
          vim.notify("No branch selected", vim.log.levels.WARN)
          return
        end
        -- print(vim.inspect(item))
        vim.cmd("Gitsigns diffthis " .. item.branch)
      end,
    }
  )
end

local function gitDiffCommit()
  require("snacks").picker.git_log_file(
    ---@type snacks.picker.git.log.Config
    {
      source = "git_log_file",
      focus = "list",
      confirm = function(picker, item)
        picker:close()
        if not item then
          vim.notify("No commit selected", vim.log.levels.WARN)
          return
        end

        vim.cmd("Gitsigns diffthis " .. item.commit)
      end,
    }
  )
end

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "|" },
      delete = { text = "-" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "?" },
    },
    -- word_diff = true,
    signcolumn = true, -- show signs
    numhl = false, -- set to true to highlight line numbers instead
    linehl = false, -- set to true to highlight entire lines
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    diffthis = {
      flags = {
        split = "belowright",
        vertical = false,
      },
    },
    current_line_blame = false,
    update_debounce = 500,
    status_formatter = nil,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
  keys = {
    { "<leader>gD", gitDiffBranch, desc = "Snacks: Diff Branches" },
    { "<leader>ga", "<cmd>Gitsigns preview_hunk<CR>", desc = "Gitsigns: Preview Line" },
    { "<leader>gA", "<cmd>Gitsigns preview_hunk_inline<CR>", desc = "Gitsigns: Preview Hunk Inline" },
    { "<leader>gu", "<cmd>Gitsigns reset_hunk<CR>", desc = "Gitsigns: Undo" },
    { "]g", "<cmd>Gitsigns nav_hunk next<CR>", desc = "Gitsigns: Next Hunk" },
    { "[g", "<cmd>Gitsigns nav_hunk prev<CR>", desc = "Gitsigns: Previous Hunk" },
    { "ig", "<Cmd>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Gitsigns: Git Hunk" },
    { "ag", "<Cmd>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Gitsigns: Git Hunk" },
    { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Gitsigns: Toggle Word Diff" },
    { "<leader>gd", gitDiffCommit, desc = "Gitsigns: Diff Commit" },
  },
}
