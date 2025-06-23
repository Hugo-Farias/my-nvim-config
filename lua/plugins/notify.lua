return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			merge_duplicates = true,
			timeout = 8000,
		})
	end,
}
