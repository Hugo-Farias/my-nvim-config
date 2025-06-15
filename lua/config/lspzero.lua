return {
"neovim/nvim-lspconfig",
config = function () 
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
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
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code Action" }))
  end,
})

end,
}
