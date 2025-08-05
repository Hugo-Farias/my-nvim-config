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
    { require("plugins.autopairs") },
  },
  config = function()
    vim.opt.signcolumn = "yes"
    local lspconfig = require("lspconfig")

    require("luasnip.loaders.from_vscode").lazy_load()

    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities =
      vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    local cmp = require("cmp")

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
        ["<C-Space>"] = cmp.mapping.complete(),
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
      },
    })
  end,
}
