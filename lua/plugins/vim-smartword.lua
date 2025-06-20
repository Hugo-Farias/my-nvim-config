return {
  "kana/vim-smartword",
  config = function()
    -- Enable default keymaps for smart motions: w, b, e, ge
    vim.g.smartword_default_mappings = 0

    -- Then remap selectively if you want:
    vim.keymap.set({ "n", "x" }, "w", "<Plug>(smartword-w)", { desc = "Smart word forward" })
    vim.keymap.set({ "n", "x" }, "b", "<Plug>(smartword-b)", { desc = "Smart word backward" })
    vim.keymap.set({ "n", "x" }, "e", "<Plug>(smartword-e)", { desc = "Smart word end" })
    vim.keymap.set({ "n", "x" }, "ge", "<Plug>(smartword-ge)", { desc = "Smart word end backward" })
  end,
}
