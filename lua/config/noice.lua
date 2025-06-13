return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- You can customize the UI here
      cmdline = {
        view = "cmdline_popup", -- this is the centered UI
      },
    })
  end,
}
