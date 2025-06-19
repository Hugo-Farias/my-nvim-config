return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1

    -- 🌲 Undotree Keymaps
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Undotree: Open Sidebar" })
  end,
}
