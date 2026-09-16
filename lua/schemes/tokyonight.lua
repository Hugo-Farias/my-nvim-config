return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
      keywords = { italic = true },
      functions = { italic = true },
    },

    on_colors = function(colors)
      colors.bg_statusline = colors.none
    end,

    on_highlights = function(colors)
      -- colors["@string"] = { fg = "#998000" }
      colors["FloatBorder"] = { fg = "#3c4048" }
      colors["SnacksIndentScope"] = { fg = "#668080", italic = true }
    end,
  },
}
