-- Makes the jaq buffer temporary, unlisted and hidden when closed
vim.api.nvim_create_autocmd("FileType", {
  pattern = "jaq",
  callback = function(args)
    vim.bo[args.buf].bufhidden = "wipe"
    vim.bo[args.buf].buflisted = false
    vim.bo[args.buf].swapfile = false
  end,
})

return {
  "is0n/jaq-nvim",
  opts = {
    cmds = {
      -- Uses vim commands
      internal = {
        lua = "luafile %",
        vim = "source %",
      },

      -- Uses shell commands
      external = {
        -- markdown = "glow %",
        python = "python %",
        -- go = "go run %",
        sh = "sh %",
        javascript = "node %",
        typescript = "bun run %",
        rust = "cargo run",
      },
    },

    behavior = {
      -- Default type
      default = "float",

      -- Start in insert mode
      startinsert = false,

      -- Use `wincmd p` on startup
      wincmd = true,

      -- Auto-save files
      autosave = false,
    },

    ui = {
      float = {
        -- See ':h nvim_open_win'
        border = "rounded",

        -- See ':h winhl'
        winhl = "Normal",
        borderhl = "FloatBorder",

        -- See ':h winblend'
        winblend = 20,

        -- Num from `0-1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
      },

      terminal = {
        -- Window position
        position = "bot",

        -- Window size
        size = 18,

        -- Disable line numbers
        line_no = false,
      },

      quickfix = {
        -- Window position
        position = "bot",

        -- Window size
        size = 10,
      },
    },
  },
  keys = {
    { "<C-r>", "<cmd>Jaq terminal<CR>", desc = "Run code with Jaq" },
  },
}
