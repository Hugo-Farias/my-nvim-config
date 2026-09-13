---@param color string
function ColorScheme(color)
  if not color then
    return nil
  end

  vim.cmd.colorscheme(color)
  -- vim.o.background = "dark"

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#E6E6E6" })
  -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
  -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })

  vim.api.nvim_set_hl(0, "Search", {
    fg = "#f1f1f1",
    bg = "#3e68d7",
  })

  vim.api.nvim_set_hl(0, "CurSearch", {
    fg = "#1b1d2b",
    bg = "#ff966c",
  })

  -- vim.api.nvim_set_hl(0, "IncSearch", {
  --   fg = "#222436",
  --   bg = "#ff757f",
  -- })

  vim.api.nvim_set_hl(0, "Visual", {
    -- fg = "#f1f1f1",
    bg = "#2d3f76",
  })
end

local function theme(repo, name, transparent, style)
  return {
    repo,
    name = name,
    lazy = true,
    priority = 1000,
    opts = {
      style = style or "",
      transparent = transparent or false,
      styles = {
        transparency = transparent or false,
        sidebars = "transparent",
        floats = "transparent",
        keywords = { italic = true },
        functions = { italic = true },
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
    },
  }
end

return {
  { "catppuccin/nvim", priority = 1000 },
  -- theme("catppuccin/nvim", "catppuccin", false),
  theme("rose-pine/neovim", "rose-pine", true),
  theme("folke/tokyonight.nvim", "tokyonight", true),
  theme("navarasu/onedark.nvim", "onedark", false, "cool"), -- { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
  -- theme("uhs-robert/oasis.nvim", "oasis"),
  theme("vague-theme/vague.nvim", "vague", true),
  theme("EdenEast/nightfox.nvim", "nightfox", true),
  theme("scottmckendry/cyberdream.nvim", "cyberdream", true),
}
