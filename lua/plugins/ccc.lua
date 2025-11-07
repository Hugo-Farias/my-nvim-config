return {
  "uga-rosa/ccc.nvim",
  lazy = true,
  -- event = { "BufReadPre", "BufNewFile" },
  event = "VeryLazy",
  opts = {
    highlighter = {
      auto_enable = false,
      lsp = false,
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CccPick<cr>", desc = "Color Picker" },
    -- { "qcr", "<cmd>CccConvert<cr>", desc = "Color Convert" },
  },
}
