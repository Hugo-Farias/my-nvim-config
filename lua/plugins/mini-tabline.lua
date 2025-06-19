return {
  "echasnovski/mini.tabline",
  version = "*",
  config = function()
    require("mini.tabline").setup({
      -- Whether to show file icons (requires 'nvim-web-devicons')
      show_icons = true,
      -- Whether to set Vim's showtabline option automatically
      set_vim_settings = true,
    })
  end,
  cond = not vim.g.vscode, -- Optional: avoid loading in VSCode
}
