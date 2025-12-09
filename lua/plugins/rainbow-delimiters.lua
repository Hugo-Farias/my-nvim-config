return {
  "HiPhish/rainbow-delimiters.nvim",
  -- event = { "BufReadPost", "BufNewFile" },
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    -- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#00b3b3" }) -- teal
    -- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#d4a017" }) -- amber/gold

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterBlue",
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterCyan",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
      },
    }
  end,
}
