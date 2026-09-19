-- stylua: ignore
local keymaps = {
  "q", "w", "e", "r", "t", "a",
  "s", "d", "f", "g", "h", "j",
  "k", "l", ";", "z", "x", "c",
  "v", "b", "y", "u", "i", "o",
  "p", "m", "n", ",", ".",
}
return {
  "cbochs/grapple.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  lazy = true,
  opts = {},
  keys = function()
    local grapple = require("grapple")

    local output = {
      { "<leader>G", grapple.toggle_tags, desc = "Grapple: Toggle menu" },
      -- {
      --   "gA",
      --   function()
      --     grapple.tag({ buffer = 0 })
      --   end,
      --   desc = "Grapple: Add buffer",
      -- },
    }

    -- TODO: Get a confirmation from user if user trying to attach file already attached
    for _, key in ipairs(keymaps) do
      table.insert(output, {
        "<S-tab>" .. key,
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
        "	" .. key,
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
