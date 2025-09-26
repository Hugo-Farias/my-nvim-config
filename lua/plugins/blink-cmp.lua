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
        -- lsp = {
        --   trigger_characters = { ".", ":", "->" }, -- force trigger on dot
        -- },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "none", "fallback" },

      -- disable a keymap from the preset
      -- ["<C-e>"] = false, -- or {}
      ["<C-e>"] = { "hide", "fallback" },

      -- ["<C-k>"] = { "show_documentation", "fallback" },

      -- ["<C-n>"] = { "show", "fallback" },
      -- ["<C-p>"] = { "show", "fallback" },
      --

      -- show with a list of providers
      -- ["<C-space>"] = {
      --   function(cmp)
      --     cmp.show({ providers = { "snippets" } })
      --   end,
      -- },
    },
  },
  keys = {
    {
      "<C-n>",
      function()
        local cmp = require("blink.cmp")
        if cmp.is_visible() then
          cmp.select_next()
        else
          cmp.show()
        end
      end,
      mode = "i",
      desc = "Show menu or select next item",
    },
  },
}
