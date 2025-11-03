return {
  "uga-rosa/ccc.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    highlighter = {
      auto_enable = false,
      lsp = true,
    },
  },
  keys = {
    { "qcc", "<cmd>CccPick<cr>", desc = "Color Picker" },
    -- { "qcr", "<cmd>CccConvert<cr>", desc = "Color Convert" },
  },
}
