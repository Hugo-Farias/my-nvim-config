-- require("which-key").setup({
--   window = {
--     border = "shadow",   -- or "single", "shadow", etc.
--     position = "bottom",  -- use "bottom" or "right" for side-like look
--     margin = { 0, 0, 1, 0 },
--     padding = { 1, 2, 1, 2 },
--     winblend = 5,        -- transparency
--   },
--   layout = {
--     height = { min = 4, max = 25 },  -- min/max height of columns
--     width = { min = 20, max = 50 }, -- min/max width of columns
--     spacing = 3,                    -- spacing between columns
--     align = "left",                 -- align columns left, center or right
--   },
-- })

-------------------------------------------------------------------------------
-- ⌨️ Which-key Keymaps
-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
