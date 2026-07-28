-- Makes the jaq buffer temporary, unlisted and hidden when closedkggg
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Jaq",
  callback = function(args)
    vim.bo[args.buf].bufhidden = "wipe"
    vim.bo[args.buf].buflisted = false
    vim.bo[args.buf].swapfile = false
  end,
})

-- Close any jaq buffer before opening a new one
local function run_jaq()
  -- Close any existing JAQ windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)

    if vim.bo[buf].filetype == "Jaq" then
      vim.api.nvim_win_close(win, true)
    end
  end

  vim.cmd("Jaq terminal")
end

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
        -- position = "bot",
        position = "vert 60",

        -- Window size
        size = 20,

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
    { "<C-r>", run_jaq, desc = "Run code with Jaq" },
  },
}
