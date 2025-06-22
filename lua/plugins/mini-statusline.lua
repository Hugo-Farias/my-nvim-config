return {
	"echasnovski/mini.statusline",
	version = "*",
	config = function()
		require("mini.statusline").setup({
			use_icons = true,
			set_vim_settings = true, -- sets 'laststatus' to 3
		})
	end,
}
