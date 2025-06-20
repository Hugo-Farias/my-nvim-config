function EditorColorScheme(color)
  color = color or "tokyonight-storm"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  vim.api.nvim_set_hl(0, 'LineNr', { fg = "#919191", bold=true })
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#575757" })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#575757" })
end

local function theme(repo, name)
  return {
    repo,
    name = name,
    lazy = false,
    priority = 1000,
    opts ={
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      }},
    }
  end

return {
  theme("rose-pine/neovim", "rose-pine"),
  theme("folke/tokyonight.nvim"),
  theme("Mofiqul/dracula.nvim"),
  theme("navarasu/onedark.nvim"),
}
