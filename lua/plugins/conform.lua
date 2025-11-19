return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      css = { "biome" },
      scss = { "prettierd" },
      less = { "prettierd" },
      html = { "prettierd" },
      json = { "biome" },
      jsonc = { "biome" },
      yaml = { "prettierd" },
      yml = { "prettierd" },
      markdown = { "prettierd" },
      ["markdown.mdx"] = { "biome" },
      graphql = { "biome" },
      vue = { "biome" },
      handlebars = { "prettierd" },
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_format = "fallback",
    --   filter = function(client)
    --     return client.name == "biome"
    --   end,
    -- },
    formatters = {
      stylua = {
        inherit = false,
        command = "stylua",
        args = {
          "--search-parent-directories",
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--stdin-filepath",
          "$FILENAME",
          "-",
        },
      },
      biome = {
        command = "biome",
        args = {
          "check",
          "--write",
          "--unsafe",
          "--stdin-file-path",
          "$FILENAME",
        },
        stdin = true,
      },
    },
    diagnostics = {
      -- Enable diagnostics with linter here
      eslint_d = {
        command = "eslint_d",
        args = { "--stdin", "--stdin-filename", "$FILENAME", "--format", "json" },
        decode = function(output, _)
          local decoded = vim.fn.json_decode(output)
          local diagnostics = {}
          if not decoded then
            return diagnostics
          end

          for _, result in ipairs(decoded[1].messages or {}) do
            table.insert(diagnostics, {
              lnum = result.line - 1,
              col = result.column - 1,
              end_lnum = result.endLine and result.endLine - 1 or nil,
              end_col = result.endColumn and result.endColumn - 1 or nil,
              severity = result.severity == 2 and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
              message = result.message,
              source = "eslint_d",
            })
          end

          return diagnostics
        end,
      },
    },
  },
  keys = {
    {
      "<C-s>",
      function()
        require("conform").format({ async = false })
        vim.cmd("up")
      end,
      desc = "Save and format file with Conform",
    },
    {
      "<C-f>",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format file with Conform",
    },
  },
}
