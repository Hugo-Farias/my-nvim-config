vim.keymap.set("n", "<leader>nh", "<cmd>Notifications<CR>", { desc = "Open Notification History" })

return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      merge_duplicates = true,
      timeout = 5000,
    })
  end,
}
