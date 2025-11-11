return { -- optional blink completion source for require statements and module annotations
  "saghen/blink.cmp",
  version = "*",
  lazy = false,
  -- dependencies = { "giuxtaposition/blink-cmp-copilot" },
  opts = {
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
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
      preset = "none",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "none", "fallback" },

      -- disable a keymap from the preset
      -- ["<C-e>"] = false, -- or {}
      ["<C-e>"] = { "hide", "fallback" },

      ["<C-l>"] = { "show_documentation", "fallback" },
      ["<Right>"] = { "show_documentation", "fallback" },
      ["<C-h>"] = { "hide_documentation", "fallback" },
      ["<Left>"] = { "hide_documentation", "fallback" },

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
      "<C-p>",
      function()
        local cmp = require("blink.cmp")
        if cmp.is_visible() then
          cmp.select_prev()
        else
          cmp.show()
        end
      end,
      mode = "i",
      desc = "Show menu or select next item",
    },
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
