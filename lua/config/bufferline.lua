
for i = 1, 9 do
  vim.keymap.set("n", "g" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "which_key_ignore" })
end

for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    require("bufferline").go_to(i, true)
  end, { desc = "which_key_ignore" })
end


return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/which-key.nvim" },
  config = function() require("bufferline").setup({
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_buffer_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      always_show_bufferline = false,
      offsets = {
	{ filetype = "NvimTree", text = "", padding = 1 },
      },
    },
    -- highlights = {
    --   buffer_selected = {
	-- fg = "#ffffff",     -- text color
	-- bg = "#3b3b4f",     -- background color (subtle highlight)
	-- bold = true,
	-- italic = false,
    --   },
    --   indicator_selected = {
	-- fg = "#89dceb",     -- indicator color (optional)
	-- bg = "#3b3b4f",     -- match background with buffer_selected
    --   },
    -- },
  }) end
}
