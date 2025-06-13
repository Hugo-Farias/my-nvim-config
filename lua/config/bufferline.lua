return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function() require("bufferline").setup({ 
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
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
