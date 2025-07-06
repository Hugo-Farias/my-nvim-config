return {
  "Goose97/timber.nvim",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("timber").setup({
      keymaps = {
        -- Set to false to disable the default keymap for specific actions
        -- insert_log_below = false,
        insert_log_below = "gpj",
        insert_log_above = "gpk",
        insert_plain_log_below = "gpo",
        insert_plain_log_above = "gp<S-o>",
        insert_batch_log = "gpb",
        add_log_targets_to_batch = "gpa",
        insert_log_below_operator = "g<S-p>j",
        insert_log_above_operator = "g<S-p>k",
        insert_batch_log_operator = "g<S-p>b",
        add_log_targets_to_batch_operator = "g<S-p>a",
      },
    })
  end,
}
