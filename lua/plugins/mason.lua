--- LSP Configs ----

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate",
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      inlayHints = {
        locationLinks = true,
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
    },
  },
})

return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
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
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = {
        "lua_ls",
        -- "ts_ls",
        -- "html",
        -- "cssls",
        "stylua",
        -- "biome",
        -- "jsonls",
        -- "tailwindcss",
      },
    })

    -- vim.lsp.config("biome", {
    --   cmd = { "biome", "lsp-proxy" },
    --   root_dir = vim.fs.root(0, { "biome.json", "package.json", ".git" }),
    -- })

    -- for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    --   vim.lsp.enable(server)
    -- end
  end,
  keys = {
    {
      "<space>x",
      function()
        local wd = require("workspace-diagnostics")
        for _, client in ipairs(vim.lsp.get_clients()) do
          wd.populate_workspace_diagnostics(client, 0)
        end
        vim.notify("Workspace Diagnostics has started...")
      end,
      mode = "n",
      desc = "Populate workspace diagnostics",
    },
  },
}
