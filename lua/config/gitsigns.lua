vim.keymap.set("n", "<leader>ga", ":Gitsigns preview_hunk<CR>", { desc = "Git: Analyze Line" })
vim.keymap.set("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", { desc = "Git: Undo" })

-- vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git: Open vertical diff" })

vim.keymap.set("n", "<leader>gd", function()
  -- vim.cmd("wincmd o")    -- close all other splits first
  vim.cmd("Gitsigns diffthis")
  vim.cmd("wincmd H")    -- go to the diff window
end, { desc = "Git: Open vertical diff" })


vim.keymap.set("n", "<leader>gc", function()
  vim.cmd("wincmd o")    -- close diff
end, { desc = "Git: Close vertical diff" })


return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "l" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      signcolumn = true,  -- show signs
      numhl      = false, -- set to true to highlight line numbers instead
      linehl     = false, -- set to true to highlight entire lines
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      current_line_blame = false,
      update_debounce = 100,
      status_formatter = nil,
    })

  end
}
