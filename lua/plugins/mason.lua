local workspaceDiagnostics = function(client)
  local cwd = vim.fn.getcwd()
  local git_dir = cwd .. "/.git"

  if not vim.loop.fs_stat(git_dir) then
    return
  end

  require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
  vim.notify("workspaceDiagnostics: finished")
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

    vim.notify(opts)

    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "powershell_es",
        "tailwindcss",
      },
    })

    -- local lspconfig = require("lspconfig")

    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      vim.lsp.enable(server)
    end

    -- for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    --   vim.lsp.config(
    --     server,
    --     vim.tbl_deep_extend(
    --       "force",
    --       (opts.servers and opts.servers[server]) or {},
    --       { on_attach = workspaceDiagnostics }
    --     )
    --   )
    --   vim.lsp.enable(server)
    --   -- lspconfig[server].setup({})
    -- end

    vim.lsp.config("eslint", {
      on_attach = function(client, bufnr)
        -- Disable ESLint formatting if you want Prettier only
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })
  end,
}
