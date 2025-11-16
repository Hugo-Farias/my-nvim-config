return {
  "echasnovski/mini.tabline",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "*",
  opts = {
    -- Whether to show file icons (requires 'nvim-web-devicons')
    show_icons = true,
    format = nil,
    -- Whether to set Vim's showtabline option automatically
    set_vim_settings = false,
  },
  cond = not vim.g.vscode, -- Optional: avoid loading in VSCode
}
