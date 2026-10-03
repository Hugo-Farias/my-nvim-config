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
          { "C-t", group = "Add Comment" },
        })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    -- ---@type false | "classic" | "modern" | "helix"
    -- preset = "helix",
    spec = {
      { "<leader>g", name = "Git" },
      { "<leader>a", name = "PromptYank" },
      { "<leader>c", name = "ColorPicker" },
      { "<leader>d", name = "Alt Delete" },
      { "<leader>f", name = "File Ops" },
      { "<leader>r", name = "Reload/Reset" },
      { "<leader>s", name = "Snacks" },
      { "<leader>t", name = "Toggle" },
      { "qa", name = "Add to Grapple" },
    },
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "<C-t>", mode = "n" },
      { "q", mode = { "n", "x" } },
      { "s", mode = { "n", "x" } },
    },
    -- layout = {
    --   width = { min = 50 }, -- min and max width of the columns
    --   spacing = 2, -- spacing between columns
    -- },
  },
}
