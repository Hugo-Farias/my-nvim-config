-- vim.keymap.set("n", "<leader>cc", "<cmd>PickColor<CR>", { desc = "PickColor" })
-- vim.keymap.set("n", "<leader>cc", "<cmd>ConvertHEXandRGB<CR>", { desc = "ConvertHEXandRGB" })

return {
  "ziontee113/color-picker.nvim",
  cmd = { "PickColor", "PickColorInsert", "ConvertHEXandRGB", "ConvertHEXandHSL" },
  keys = {
    { "qc", "<cmd>PickColor<cr>", mode = "n", desc = "Pick color" },
    -- { "<C-c>", "<cmd>PickColorInsert<cr>", mode = "i", desc = "Pick color (insert)" },
  },
  config = function()
    require("color-picker").setup({
      icons = { "ﱢ", "" },
      border = "rounded",
      keymap = {
        U = "<Plug>ColorPickerSlider5Decrease",
        O = "<Plug>ColorPickerSlider5Increase",
      },
      background_highlight_group = "Normal",
      border_highlight_group = "FloatBorder",
      text_highlight_group = "Normal",
    })

    vim.cmd([[hi FloatBorder guibg=NONE]])
  end,
}
