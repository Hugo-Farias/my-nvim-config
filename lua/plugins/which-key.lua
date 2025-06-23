return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })

        local wk = require("which-key")

        wk.add({
          { "<leader>g", group = "Git" },
        })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    -- spec = {
    --   { "qr", desc = "Record macro" },
    --   { "qp", desc = "Play macro" },
    --   { "q", group = "macro" },
    --   { "<leader>g", group = "Git" },
    -- },
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "q", mode = { "n", "x" } },
      { "s", mode = { "n", "x" } },
    },
  },
}
