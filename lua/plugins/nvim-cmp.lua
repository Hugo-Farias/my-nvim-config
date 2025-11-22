return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "onsails/lspkind.nvim" },
  },
  config = function()
    vim.opt.signcolumn = "yes"
    local lspconfig = require("lspconfig")

    -- require("luasnip.loaders.from_vscode").lazy_load()

    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities =
      vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    local cmp = require("cmp")
    -- local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Down>"] = cmp.mapping.scroll_docs(4),
        ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      {
        { name = "buffer" },
      },
      formatting = {
        format = require("nvim-highlight-colors").format,
        -- format = lspkind.cmp_format({
        --   mode = "symbol", -- show only symbol annotations
        --   maxwidth = {
        --     -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        --     -- can also be a function to dynamically calculate max width such as
        --     -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        --     menu = 50, -- leading text (labelDetails)
        --     abbr = 50, -- actual suggestion item
        --   },
        --   ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        --   show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        --
        --   -- The function below will be called before any actual modifications from lspkind
        --   -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --   before = function(entry, vim_item)
        --     -- ...
        --     return vim_item
        --   end,
        -- }),
      },
    })
  end,
}
