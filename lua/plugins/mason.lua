local on_attach = function(client)
  require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "artemave/workspace-diagnostics.nvim" },
  },
  build = ":MasonUpdate",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = { "lua_ls" },
    })

    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      -- TODO merge opts with on_attach
      vim.lsp.config(
        server,
        vim.tbl_deep_extend("force", (opts.servers and opts.servers[server]) or {}, { on_attach = on_attach })
      )
      vim.lsp.enable(server)
      -- lspconfig[server].setup({})
    end
  end,
}
