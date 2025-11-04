return {
  "uga-rosa/ccc.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CccPick<cr>", desc = "Color Picker" },
    -- { "qcr", "<cmd>CccConvert<cr>", desc = "Color Convert" },
  },
}
