return {
  "NTBBloodbath/color-converter.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    round_hsl = true, -- rounds saturation and light when generating HSL colors.
    lowercase_hex = false, -- by default HEX colors will be uppercased.
    hsl_pattern = "hsl([h]deg [s] [l])",
    hsla_pattern = "hsl([h]deg [s] [l] / [a]%)",
    rgb_pattern = "rgb([r] [g] [b])",
    rgba_pattern = "rgb([r] [g] [b] / [a]%)",
  },
  keys = {
    -- { "qcc", "<cmd>lua require('color-converter').cycle()<CR>", desc = "Convert color" },
    { "<leader>ch", "<cmd>lua require('color-converter').to_hex()<CR>", desc = "Convert color under cursor to HEX" },
    { "<leader>cs", "<cmd>lua require('color-converter').to_hsl()<CR>", desc = "Convert color under cursor to HSL" },
    { "<leader>cr", "<cmd>lua require('color-converter').to_rgb()<CR>", desc = "Convert color under cursor to RGB" },
  },
}
