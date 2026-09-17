return {
  "cbochs/grapple.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  lazy = true,
  opts = {},
  keys = function()
    local grapple = require("grapple")

    local output = {
      { "qg", grapple.toggle_tags, desc = "Grapple: Toggle menu" },
      -- {
      --   "gA",
      --   function()
      --     grapple.tag({ buffer = 0 })
      --   end,
      --   desc = "Grapple: Add buffer",
      -- },
    }

    local keymaps = { "h", "j", "k", "l", ";", "y", "u", "i", "o", "p", "m", "n", ",", "." }

    for _, key in ipairs(keymaps) do
      table.insert(output, {
        "qa" .. key,
        function()
          grapple.tag({ name = key })
          vim.notify(
            "Added " .. vim.fn.expand("%:t") .. " to namespace: " .. key,
            vim.log.levels.INFO,
            { title = "Grapple" }
          )
        end,
        desc = "Grapple: Add file to namespace: " .. key,
      })
    end

    for _, key in ipairs(keymaps) do
      table.insert(output, {
        "q" .. key,
        function()
          grapple.select({ name = key })
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
