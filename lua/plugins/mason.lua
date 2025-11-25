return {
  "williamboman/mason.nvim",
  lazy = false,
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
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        -- "eslint",
        "html",
        "cssls",
        "stylua",
        "biome",
        "jsonls",
        -- "bashls",
        -- "powershell_es",
        "tailwindcss",
      },
    })

    -- vim.lsp.config("biome", {
    --   cmd = { "biome", "lsp-proxy" },
    --   root_dir = vim.fs.root(0, { "biome.json", "package.json", ".git" }),
    -- })

    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      vim.lsp.enable(server)
    end
  end,
  keys = {
    {
      "<space>x",
      function()
        for _, client in ipairs(vim.lsp.get_clients()) do
          require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
        vim.notify("Workspace Diagnostics has finished")
      end,
      mode = "n",
      desc = "Populate workspace diagnostics",
    },
  },
}
