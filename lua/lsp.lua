local set = vim.keymap.set

local floatingOpts = {
  focusable = true,
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
  set("n", "gu", function() vim.lsp.buf.hover(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
  set("n", "gs", function() vim.lsp.buf.signature_help(floatingOpts) end, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))
  -- set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" }))
  -- set( "n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Go to declaration" }))
  -- set( "n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Go to implementation" }))
  -- set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: References" }))
  -- set( "n", "go", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Type definition" }))
  set("n", "<F2>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
  set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))
  set({ "n", "x" }, "gq", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))
  set("n", "]d", function() jump_diag(1) end, vim.tbl_extend("force", opts, { desc = "LSP: Next diagnostic" }))
  set("n", "[d", function() jump_diag(-1) end, vim.tbl_extend("force", opts, { desc = "LSP: Previous diagnostic" }))
  set("n", "ga", function() vim.diagnostic.open_float(nil, { focusable = true }) end, vim.tbl_extend("force", opts, { desc = "LSP: Line diagnostics" }))

  set("n", "gA", function() vim.diagnostic.setqflist() end, vim.tbl_extend("force", opts, { desc = "LSP: Open full buffer diagnostics" }))
end
-- stylua: ignore end

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
        {
          path = "${3rd}/luv/library",
          words = { "vim%.uv", "vim%.loop.fs_stat" },
          unpack(vim.api.nvim_get_runtime_file("", true)),
        },
      },
    },
  },
}
