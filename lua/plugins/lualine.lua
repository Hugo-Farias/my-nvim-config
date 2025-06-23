return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				-- lualine_a = {
				--   {
				--     'mode',
				--     fmt = function(str)
				--       local map = {
				--         ['NORMAL']   = 'N',
				--         ['INSERT']   = 'I',
				--         ['VISUAL']   = 'V',
				--         ['V-LINE']   = 'VL',
				--         ['V-BLOCK']  = 'VB',
				--         ['REPLACE']  = 'R',
				--         ['COMMAND']  = 'C',
				--         ['SELECT']   = 'S',
				--         ['S-LINE']   = 'SL',
				--         ['S-BLOCK']  = 'SB',
				--         ['TERMINAL'] = 'T',
				--       }
				--       return map[str] or str
				--     end,
				--   }
				-- },
				lualine_a = { "filename" },
				lualine_b = { "branch" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
