-- Harpoon2 WIP
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    default = {
      BufLeave = function() end,
    },
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = false,
    },
  },
  keys = function()
    local harpoon = require("harpoon")

    local keys = {
      {
        "<leader>H",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon: Add File",
      },
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: Quick Menu",
      },
    }

    for i, key in ipairs({ "h", "j", "k", "l", ";", "y", "u", "i", "o", "p", "m" }) do
      table.insert(keys, {
        "q" .. key,
        function()
          harpoon:list():select(i)
        end,
        desc = "which_key_ignore",
      })
    end

    return keys
  end,
}
