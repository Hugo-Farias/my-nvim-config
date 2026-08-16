return {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  },
  keys = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    local keys = {
      { "<leader>H", mark.add_file, desc = "Harpoon: Add File" },
      { "<leader>h", ui.toggle_quick_menu, desc = "Harpoon: Quick Menu" },
    }

    for i, key in ipairs({ "h", "j", "k", "l", ";", "y", "u", "i", "o", "p", "m" }) do
      table.insert(keys, {
        "q" .. key,
        function()
          ui.nav_file(i)
        end,
        desc = "which_key_ignore",
      })
    end

    return keys
  end,
}

-- Harpoon2 WIP
--
-- return {
--   "ThePrimeagen/harpoon",
--   branch = "harpoon2",
--   dependencies = "nvim-lua/plenary.nvim",
--   opts = {
--     menu = {
--       width = vim.api.nvim_win_get_width(0) - 4,
--     },
--     settings = {
--       save_on_toggle = false,
--     },
--   },
--   keys = function()
--     local harpoon = require("harpoon")
--
--     local keys = {
--       {
--         "<leader>H",
--         function()
--           harpoon:list():add()
--         end,
--         desc = "Harpoon: Add File",
--       },
--       {
--         "<leader>h",
--         function()
--           harpoon.ui:toggle_quick_menu(harpoon:list())
--         end,
--         desc = "Harpoon: Quick Menu",
--       },
--     }
--
--     for i, key in ipairs({ "h", "j", "k", "l", ";", "y", "u", "i", "o", "p", "m" }) do
--       table.insert(keys, {
--         "q" .. key,
--         function()
--           harpoon:list():select(i)
--         end,
--         desc = "which_key_ignore",
--       })
--     end
--
--     return keys
--   end,
-- }
