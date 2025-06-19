return {
  "echasnovski/mini.statusline",
  version = "*",
  config = function()
    require("mini.statusline").setup({
      use_icons = vim.g.have_nerd_font == true, -- optional if using Nerd Font
      set_vim_settings = true, -- sets 'laststatus' to 3
    })
  end,
}
