-- local set = vim.keymap.set

-- set("n", "<leader>G", require("grapple").toggle, { desc = "Grapple: Toggle Menu" })

return {
  "cbochs/grapple.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  lazy = true,
  opts = {},
  keys = function()
    local grapple = require("grapple")

    local output = {
      { "<leader>G", grapple.toggle_tags, desc = "Grapple: Toggle menu" },
      {
        "<leader>A",
        function()
          grapple.tag({ buffer = 0 })
        end,
        desc = "Grapple: Add buffer",
      },
      {
        "<leader>M",
        function()
          grapple.tag({ buffer = 0, index = 11 })
        end,
        desc = "Grapple: Add buffer to 'Main'",
      },
      {
        "qm",
        function()
          grapple.select({ index = 11 })
        end,
        desc = "Grapple: Switch to 'Main'",
      },
    }

    for i, key in ipairs({ "h", "j", "k", "l", ";", "y", "u", "i", "o", "p" }) do
      table.insert(output, {
        "q" .. key,
        function()
          grapple.select({ index = i })
        end,
        desc = "which_key_ignore",
      })
    end

    return output
  end,

  -- keys = {
  --   { "<leader>G", require("grapple").toggle, desc = "Grapple: Toggle Menu" },
  -- },
}
