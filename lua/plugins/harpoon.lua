return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- ⚓ Harpoon Keymaps
    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon: Add file to list" })
    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })

    for i, key in ipairs({ "h", "j", "k", "l", ";", "u", "i", "o", "p", "m" }) do
      vim.keymap.set("n", "q" .. key, function()
        ui.nav_file(i)
      end, { desc = "which_key_ignore" })
    end
  end,
}
