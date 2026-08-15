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
  theme("navarasu/onedark.nvim", "onedark", true, "warm"), -- { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
  theme("uhs-robert/oasis.nvim", "oasis"),
  theme("vague-theme/vague.nvim", "vague", true),
  theme("EdenEast/nightfox.nvim", "nightfox", true),
  theme("scottmckendry/cyberdream.nvim", "cyberdream", true),
}
