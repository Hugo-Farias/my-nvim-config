return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- ⚓ Harpoon Keymaps
    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon: Add file to list" })
    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "qh", function()
      ui.nav_file(1)
    end, { desc = "Harpoon: File 1" })
    vim.keymap.set("n", "qj", function()
      ui.nav_file(2)
    end, { desc = "Harpoon: File 2" })
    vim.keymap.set("n", "qk", function()
      ui.nav_file(3)
    end, { desc = "Harpoon: File 3" })
    vim.keymap.set("n", "ql", function()
      ui.nav_file(4)
    end, { desc = "Harpoon: File 4" })
  end,
}
