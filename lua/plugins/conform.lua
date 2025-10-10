return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        css = { "biome" },
        scss = { "biome" },
        less = { "biome" },
        html = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        yaml = { "biome" },
        yml = { "biome" },
        markdown = { "biome" },
        ["markdown.mdx"] = { "biome" },
        graphql = { "biome" },
        vue = { "biome" },
        handlebars = { "biome" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
        filter = function(client)
          return client.name == "eslint"
        end,
      },
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
      vim.keymap.set({ "n", "x" }, "<C-f>", function()
        require("conform").format({ async = true })
      end, { desc = "Format file with Conform" }),
    })
  end,
}
