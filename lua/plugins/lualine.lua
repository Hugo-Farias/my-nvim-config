return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "pnx/lualine-lsp-status" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "filename" },
        lualine_b = { "branch" },
        lualine_c = { "diagnostics", "lsp-status" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
