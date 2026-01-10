return {
  "folke/noice.nvim",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline
    },
    views = {
      cmdline_popup = {
        position = {
          row = "5%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = "11.3%",
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 0 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        filter = {
          event = "cmdline",
          cmdline = "^b(next|previous)$",
          -- find = "^:m [><]'?[%+%-]?%d*",
        },
        opts = { skip = true },
      },
    },
  },
  keys = {
    {
      "<leader>n",
      "<cmd>lua Snacks.picker.noice()<CR>",
      desc = "Noice Messages Picker",
    },
    {
      "<leader>N",
      "<cmd>NoiceDismiss<CR>",
      desc = "Dismiss All Noice Messages",
    },
  },
}
