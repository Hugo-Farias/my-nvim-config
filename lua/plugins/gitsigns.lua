vim.keymap.set("n", "<leader>ga", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Analyze Line" })
vim.keymap.set("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns: Undo" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns: Next Hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "Gitsigns: Prev Hunk" })

vim.keymap.set("n", "<leader>gd", function()
	vim.cmd("Gitsigns diffthis")
	vim.cmd("wincmd H") -- push original file to the left
end, { desc = "Gitsigns: Open vertical diff" })

vim.keymap.set("n", "<leader>gD", function()
	vim.cmd("wincmd h") -- push original file to the left
	vim.cmd("wincmd o") -- close diff
end, { desc = "Gitsigns: Close vertical diff" })

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "|" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "?" },
			},
			signcolumn = true, -- show signs
			numhl = false, -- set to true to highlight line numbers instead
			linehl = false, -- set to true to highlight entire lines
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			current_line_blame = false,
			update_debounce = 100,
			status_formatter = nil,
		})
	end,
}
