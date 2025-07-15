local copilotStatus = true
local set = vim.keymap.set

local function copilotToggle()
  vim.cmd(copilotStatus and "Copilot disable" or "Copilot enable")
  copilotStatus = not copilotStatus
  vim.cmd("Copilot status")
end

-- stylua: ignore start
set( "n", "<leader>cd", copilotToggle, { desc = "Copilot: Toggle Auto Trigger" })
set( "n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Copilot: Toggle Panel" })
set( "n", "<leader>cn", "<cmd>Copilot<CR>", { desc = "Copilot: Status" })
set( "i", "<Tab>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Copilot: Accept Line" })
set( "i", "<M-w>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", { desc = "Copilot: Accept Word" })
set( "i", "<M-y>", "<cmd>lua require('copilot.suggestion').accept()<CR>", { desc = "Copilot: Accept All" })
set( "i", "<M-]>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot: Next Suggestion" })
set( "i", "<M-[>", "<cmd>lua require('copilot.suggestion').prev()<CR>", { desc = "Copilot: Prev Suggestion" })
set( "i", "<C-d>", "<cmd>Copilot suggestion dismiss<CR>", { desc = "Copilot: Dismiss" })
-- stylua: ignore end

return {
  "zbirenbaum/copilot.lua",
  -- enabled = false,
  version = false,
  lazy = true,
  event = "BufReadPost",
  opts = {
    filetypes = {
      javascript = true,
      typescript = true,
      lua = true,
      css = true,
      html = true,
      jsx = true,
      tsx = true,
      json = true,
      python = true,
      ps1 = true,
      go = true,
      rust = true,
      c = true,
      cpp = true,
      java = true,
      bash = true,
      yaml = true,
      toml = true,
      markdown = true,
      terraform = true,
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
    },
    panel = {
      enabled = false,
    },
  },
  -- config = function()
  --   require("copilot").setup({})
  -- end,
}
