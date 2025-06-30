local workspaceDiagnostics = function(client)
  require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
  -- print("workspaceDiagnostics Running")
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
      ensure_installed = {},
    })

    local lspconfig = require("lspconfig")

    lspconfig["powershell_es"].setup({
      cmd = {
        "pwsh",
        "-NoLogo",
        "-NoProfile",
        "-Command",
        vim.fn.expand("~")
          .. "/AppData/Local/nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1",
        "-HostName",
        "nvim",
        "-HostProfileId",
        "0",
        "-HostVersion",
        "1.0.0",
        "-LogLevel",
        "Normal",
        "-BundledModulesPath",
        vim.fn.expand("~") .. "/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
        "-SessionDetailsPath",
        vim.fn.stdpath("cache") .. "/powershell_es.session.json",
        "-FeatureFlags",
        "@()",
        "-AdditionalModules",
        "@()",
      },
      filetypes = { "ps1" },
    })

    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      -- TODO merge opts with on_attach
      vim.lsp.config(
        server,
        vim.tbl_deep_extend(
          "force",
          (opts.servers and opts.servers[server]) or {},
          { on_attach = workspaceDiagnostics }
        )
      )
      vim.lsp.enable(server)
      -- lspconfig[server].setup({})
    end
  end,
}
