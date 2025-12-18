for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "which_key_ignore" })
end

for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    require("bufferline").go_to(i, true)
  end, { desc = "which_key_ignore" })
end

-- vim.keymap.set("n", "<C-h>", function () require("bufferline").go_to(1, true) end, { desc = "Go to buffer 1" })
-- vim.keymap.set("n", "<C-j>", function () require("bufferline").go_to(2, true) end, { desc = "Go to buffer 2" })
-- vim.keymap.set("n", "<C-k>", function () require("bufferline").go_to(3, true) end, { desc = "Go to buffer 3" })
-- vim.keymap.set("n", "<C-l>", function () require("bufferline").go_to(4, true) end, { desc = "Go to buffer 4" })
-- vim.keymap.set("n", "<C-;>", function () require("bufferline").go_to(5, true) end, { desc = "Go to buffer 5" })

for _, key in ipairs({ "<C-S-j>", "<C-PageDown>" }) do
  vim.keymap.set("n", key, function()
    require("bufferline").move(-1) -- move current buffer right (end)
  end, { desc = "Move buffer right" })
end

for _, key in ipairs({ "<C-S-k>", "<C-PageUp>" }) do
  vim.keymap.set("n", key, function()
    require("bufferline").move(1) -- move current buffer left (start)
  end, { desc = "Move buffer left" })
end

return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_buffer_icons = true,
      show_close_icon = false,
      separator_style = "thin",
      always_show_bufferline = false,
      numbers = "ordinal",
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
      },
    },
  },
  keys = {
    { "<M-j>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline: Cycle Prev" },
    { "<M-k>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline: Cycle Next" },
  },
}
