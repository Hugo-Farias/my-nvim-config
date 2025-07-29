local set = vim.keymap.set

set("n", "<leader>ga", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview Line" })
set("n", "<leader>gA", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Gitsigns: Preview Hunk Inline" })
set("n", "<leader>gu", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: Undo" })
-- set("n", "<leader>gn", "<cmd>Gitsigns nav_hunk next<CR>", { desc = "Gitsigns: Next Hunk" })
set("n", "]g", "<cmd>Gitsigns nav_hunk next<CR>", { desc = "Gitsigns: Next Hunk" })
-- set("n", "<leader>gp", "<cmd>Gitsigns nav_hunk prev<CR>", { desc = "Gitsigns: Previous Hunk" })
set("n", "[g", "<cmd>Gitsigns nav_hunk prev<CR>", { desc = "Gitsigns: Previous Hunk" })
set({ "o", "x" }, "ig", "<Cmd>Gitsigns select_hunk<CR>", { desc = "Gitsigns: Git Hunk" })
-- set({ "o", "x" }, "ah", "<Cmd>Gitsigns select_hunk<CR>", { desc = "Gitsigns: Git Hunk" })

set("n", "<leader>gd", function()
  vim.cmd("Gitsigns diffthis")
  vim.cmd("wincmd H") -- push original buffer to the left
end, { desc = "Gitsigns: Open vertical diff" })

set("n", "<leader>gD", function()
  vim.cmd("wincmd h")
  vim.cmd("wincmd o") -- close diff
end, { desc = "Gitsigns: Close vertical diff" })

return {
  "lewis6991/gitsigns.nvim",
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
    current_line_blame = false,
    update_debounce = 100,
    status_formatter = nil,
  },
}
