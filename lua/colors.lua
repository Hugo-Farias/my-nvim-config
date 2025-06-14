function editorScheme(color)
  color = color or "tokyonight-storm"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
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
  theme("Mofiqul/dracula.nvim")
}
