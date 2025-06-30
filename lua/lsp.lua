local floatingOpts = {
  focusable = false,
  style = "minimal",
  border = "rounded",
  source = true, -- or "if_many"
  header = "",
  prefix = "",
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = floatingOpts,
})

local function jump_diag(direction)
  vim.diagnostic.jump({ count = direction, float = true })
end

---- Keymaps ----
-- stylua: ignore start
local on_attach = function(event)
  local opts = { buffer = event.buf }
  vim.keymap.set("n", "gk", function() vim.lsp.buf.hover(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
  vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" }))
  -- vim.keymap.set( "n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Go to declaration" }))
  -- vim.keymap.set( "n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" }))
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: References" }))
  -- vim.keymap.set( "n", "go", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Type definition" }))
  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
  vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
  vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))
  vim.keymap.set("n", "gn", function() jump_diag(1) end, vim.tbl_extend("force", opts, { desc = "LSP: Next diagnostic" }))
  vim.keymap.set("n", "gp", function() jump_diag(-1) end, vim.tbl_extend("force", opts, { desc = "LSP: Previous diagnostic" }))
  vim.keymap.set("n", "ga", function() vim.diagnostic.open_float(nil, { focus = false }) end, vim.tbl_extend("force", opts, { desc = "LSP: Line diagnostics" }))
  vim.keymap.set("n", "gA", function() vim.diagnostic.setqflist() end, vim.tbl_extend("force", opts, { desc = "LSP: Open full buffer diagnostics" }))
end
-- stylua: ignore end

--
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = on_attach,
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv", "vim%.loop" } },
      },
    },
  },
}
