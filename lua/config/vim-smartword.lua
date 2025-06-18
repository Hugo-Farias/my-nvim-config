return {
  "kana/vim-smartword",
  config = function()
    -- Enable default keymaps for smart motions: w, b, e, ge
    vim.g.smartword_default_mappings = 1
  end,
}
