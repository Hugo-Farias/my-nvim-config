return { -- optional blink completion source for require statements and module annotations
  "saghen/blink.cmp",
  version = "*",
  -- dependencies = { "giuxtaposition/blink-cmp-copilot" },
  opts = {
    snippets = { preset = "luasnip" },
    -- ensure you have the `snippets` source (enabled by default)
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "select_and_accept", "fallback" },

      -- disable a keymap from the preset
      -- ["<C-e>"] = false, -- or {}

      ["<C-space>"] = { "show", "fallback" },

      -- show with a list of providers
      -- ["<C-space>"] = {
      --   function(cmp)
      --     cmp.show({ providers = { "snippets" } })
      --   end,
      -- },
    },
  },
  -- keys = {
  --   { "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<CR>", desc = "Snacks: Search Word Grep", mode = { "n", "x" } },
  --   { "<Up>", "<cmd>lua Snacks.picker.grep_word()<CR>", desc = "Snacks: Search Word Grep", mode = { "n", "x" } },
  -- },
  -- config = function(_, opts)
  --   require("blink.cmp").setup(opts)
  --
  --   vim.keymap.set("c", "<Up>", "<C-p>", { desc = "Select Previous" })
  --   vim.keymap.set("c", "<Down>", "<C-n>", { desc = "Select Next" })
  -- end,
}
