return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1

    -- 🌲 Undotree Keymaps
    vim.keymap.set("n", "<leader>u", function()
      vim.cmd("UndotreeToggle")
      vim.cmd("vertical resize 40")
    end, { desc = "Undotree: Open Sidebar" })
  end,
}
