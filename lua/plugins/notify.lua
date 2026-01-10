-- vim.keymap.set("n", "<leader>nh", "<cmd>Notifications<CR>", { desc = "Open Notification History" })

return {
  "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    merge_duplicates = true,
    timeout = 5000,
  },
  keys = {
    { "<leader>n", "<cmd>Notifications<CR>", desc = "Open Notification History" },
  },
}
