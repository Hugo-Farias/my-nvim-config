return {
  "martifaj/rustlings.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- optional
  },
  opts = {
    -- Path to rustlings directory (auto-detected if nil)
    rustlings_path = "D:/Users/Hugo/Documents/Projects/rustlings",

    keymaps = {
      next = "<leader>ln", -- Set to false to disable
      --   hint = "<leader>lh",
      --   list = "<leader>ll",
      --   reset = "<leader>lr",
      --   start = "<leader>ls",
      --   stop = "<leader>lq",
    },

    progress = {
      show_in_statusline = true,
    },

    telescope = {
      show_completed = true,
      show_pending = true,
      layout_strategy = "vertical",
    },
  },
  keys = {
    -- { "<leader>ln", "<cmd>Rustlings next<cr>", desc = "Next Exercise" },
    { "<leader>lh", "<cmd>Rustlings hint<cr>", desc = "Hint" },
    { "<leader>ll", "<cmd>Rustlings list<cr>", desc = "List Exercises" },
    { "<leader>lr", "<cmd>Rustlings reset<cr>", desc = "Reset Exercise" },
    { "<leader>ls", "<cmd>Rustlings start<cr>", desc = "Start Rustlings" },
    { "<leader>lq", "<cmd>Rustlings stop<cr>", desc = "Stop Rustlings" },
  },
}
