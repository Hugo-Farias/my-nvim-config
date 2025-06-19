return {
  "kana/vim-smartword",
  config = function()
    -- Enable default keymaps for smart motions: w, b, e, ge
    vim.g.smartword_default_mappings = 0

    -- Then remap selectively if you want:
    vim.keymap.set("n", "w", "<Plug>(smartword-w)", { desc = "Smart word forward" })
    vim.keymap.set("n", "b", "<Plug>(smartword-b)", { desc = "Smart word backward" })
    vim.keymap.set("n", "e", "<Plug>(smartword-e)", { desc = "Smart word end" })
    vim.keymap.set("n", "ge", "<Plug>(smartword-ge)", { desc = "Smart word end backward" })
  end,
}
