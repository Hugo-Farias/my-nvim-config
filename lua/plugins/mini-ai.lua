return {
  "echasnovski/mini.ai",
  version = "*",
  config = function()
    require("mini.ai").setup()

    -- local ai = require("mini.ai")

    -- Define a custom textobject "g" for the entire buffer
    -- ai.setup({
    -- 	custom_textobjects = {
    -- 		z = function()
    -- 			return { vim.fn.line("1"), 1, vim.fn.line("$"), 0 }
    -- 			-- returns {start_line, start_col, end_line, end_col}
    -- 			-- full buffer from line 1 col 1 to last line col 0 (end)
    -- 		end,
    -- 	},
    -- })
  end,
}
