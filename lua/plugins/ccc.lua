return {
  "uga-rosa/ccc.nvim",
  lazy = true,
  opts = {
    highlighter = {
      auto_enable = false,
      lsp = false,
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CccPick<cr>", desc = "Color Picker" },
    -- { "qcr", "<cmd>CccConvert<cr>", desc = "Color Convert" },
    -- { "<leader>tc", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Color Highlight" },
  },
}
