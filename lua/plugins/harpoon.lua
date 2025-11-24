return {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- ⚓ Harpoon Keymaps
    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon: Add file to list" })
    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })

    for i, key in ipairs({ "h", "j", "k", "l", ";", "y", "u", "i", "o", "p", "m" }) do
      vim.keymap.set("n", "q" .. key, function()
        ui.nav_file(i)
      end, { desc = "which_key_ignore" })
    end
  end,
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
}
