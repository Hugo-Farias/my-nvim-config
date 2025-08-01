﻿vim.keymap.set("n", "<leader>cd", "<cmd>Codeium Toggle<CR>", { desc = "Codeium: Toggle" })

return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      -- Optionally disable cmp source if using virtual text only
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        -- Set to true if you never want completions to be shown automatically.
        manual = false,
        -- A mapping of filetype to true or false, to enable virtual text.
        filetypes = {
          ["*.lua"] = true,
          ["*.js"] = true,
          ["*.jsx"] = true,
          ["*.tsx"] = true,
          ["*.ts"] = true,
          ["*.json"] = true,
          ["*.md"] = true,
          ["*.mdx"] = true,
          ["*.html"] = true,
          ["*.css"] = true,
          ["*.scss"] = true,
          ["*.py"] = true,
          ["*.yaml"] = true,
          ["*"] = false,
        },
        -- Whether to enable virtual text of not for filetypes not specifically listed above.
        default_filetype_enabled = true,
        -- How long to wait (in ms) before requesting completions after typing stops.
        idle_delay = 200,
        -- Priority of the virtual text. This usually ensures that the completions appear on top of
        -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
        -- desired.
        virtual_text_priority = 65535,
        -- Set to false to disable all key bindings for managing completions.
        map_keys = true,
        -- The key to press when hitting the accept keybinding but no completion is showing.
        -- Defaults to \t normally or <c-n> when a popup is showing.
        accept_fallback = nil,
        -- Key bindings for managing completions in virtual text mode.
        key_bindings = {
          accept = "<M-y>",
          accept_word = "<M-w>",
          accept_line = "<Tab>",
          clear = "<C-d>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    })
  end,
}
