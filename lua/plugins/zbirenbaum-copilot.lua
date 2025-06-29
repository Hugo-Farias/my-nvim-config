-- stylua: ignore start
vim.keymap.set( "n", "<leader>cd", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", { desc = "Copilot: Toggle Auto Trigger" })
vim.keymap.set( "n", "<leader>cn", "<cmd>Copilot<CR>", { desc = "Copilot: Status" })
vim.keymap.set( "i", "<Tab>", "<cmd>lua require('copilot.suggestion').accept()<CR>", { desc = "Copilot: Accept" })
vim.keymap.set( "i", "<M-]>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot: Next Suggestion" })
vim.keymap.set( "i", "<M-[>", "<cmd>lua require('copilot.suggestion').prev()<CR>", { desc = "Copilot: Prev Suggestion" })
vim.keymap.set( "i", "<C-d>", "<cmd>lua require('copilot.suggestion').dismiss()<CR>", { desc = "Copilot: Dismiss" })
-- stylua: ignore end

return {
  "zbirenbaum/copilot.lua",
  version = false,
  opts = {
    filetypes = {
      javascript = true, -- allow specific filetype
      typescript = true, -- allow specific filetype
      lua = true,
      css = true,
      html = true,
      jsx = true,
      json = true,
      python = true,
      go = true,
      rust = true,
      c = true,
      cpp = true,
      java = true,
      bash = true,
      yaml = true,
      toml = true,
      markdown = true, -- overrides default
      terraform = true, -- disallow specific filetype
      ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
      sh = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
          -- disable for .env files
          return false
        end
        return true
      end,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-d>",
      },
    },
    panel = {
      enabled = false,
    },
  },
  -- config = function()
  --   require("copilot").setup({})
  -- end,
}
