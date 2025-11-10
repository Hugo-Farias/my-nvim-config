function EditorColorScheme(color)
  if not color then
    return nil
  end

  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.api.nvim_set_hl(0, "LineNr", { fg = "#e6e6e6" })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })
end

local function theme(repo, name, style)
  return {
    repo,
    name = name,
    lazy = false,
    priority = 1000,
    opts = {
      style = style or "",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  }
end

return {
  -- theme("rose-pine/neovim", "rose-pine"),
  theme("folke/tokyonight.nvim"),
  -- theme("ellisonleao/gruvbox.nvim"),
  theme("navarasu/onedark.nvim", "onedark", "darker"),
  -- theme("nickkadutskyi/jb.nvim"),
  -- theme("catppuccin/nvim", "catppuccin"),
}
