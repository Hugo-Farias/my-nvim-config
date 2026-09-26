vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

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
  -- theme("catppuccin/nvim", "catppuccin", false),
  -- theme("rose-pine/neovim", "rose-pine", true),
  -- theme("navarasu/onedark.nvim", "onedark", false, "cool"), -- { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
  -- theme("uhs-robert/oasis.nvim", "oasis"),
  theme("vague-theme/vague.nvim", "vague", true),
  -- theme("EdenEast/nightfox.nvim", "nightfox", true),
}
