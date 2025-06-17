vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true, -- or "if_many"
    header = "",
    prefix = "",
  },
})

local function jump_diag(direction)
  vim.diagnostic.jump({ count = direction, float = true})
end

---- Keymaps ----
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Definition" }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Go to Declaration" }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Go to Implementation" }))
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Type Definition" }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: References" }))
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code Action" }))
    vim.keymap.set('n', 'gn', function () jump_diag(1) end, vim.tbl_extend("force", opts, { desc = "LSP: Next diagnostic" }))
    vim.keymap.set('n', 'gp', function () jump_diag(-1) end, vim.tbl_extend("force", opts, { desc = "LSP: Previous diagnostic" }))
    vim.keymap.set('n', 'ga', function () vim.diagnostic.open_float(nil, { focus = false }) end, vim.tbl_extend("force", opts, { desc = "LSP: Show Diagnostics" }))
  end,
})



return {
  "neovim/nvim-lspconfig",
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
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" }
  },
  config = function()
    vim.opt.signcolumn = 'yes'

    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- require("lspconfig").lua_ls.setup {}

    -- Add <C-Space> to trigger nvim-cmp completion
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
}
