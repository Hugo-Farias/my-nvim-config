local copilotStatus = true

local function copilotToggle()
  vim.cmd(copilotStatus and "Copilot disable" or "Copilot enable")
  copilotStatus = not copilotStatus
  vim.cmd("Copilot status")
end

-- stylua: ignore start
vim.keymap.set( "n", "<leader>cd", copilotToggle, { desc = "Copilot: Toggle Auto Trigger" })
vim.keymap.set( "n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Copilot: Toggle Panel" })
vim.keymap.set( "n", "<leader>cn", "<cmd>Copilot<CR>", { desc = "Copilot: Status" })
vim.keymap.set( "i", "<Tab>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Copilot: Accept Line" })
vim.keymap.set( "i", "<M-w>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", { desc = "Copilot: Accept Word" })
vim.keymap.set( "i", "<M-y>", "<cmd>lua require('copilot.suggestion').accept()<CR>", { desc = "Copilot: Accept All" })
vim.keymap.set( "i", "<M-]>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot: Next Suggestion" })
vim.keymap.set( "i", "<M-[>", "<cmd>lua require('copilot.suggestion').prev()<CR>", { desc = "Copilot: Prev Suggestion" })
vim.keymap.set( "i", "<C-d>", "<cmd>Copilot suggestion dismiss<CR>", { desc = "Copilot: Dismiss" })
-- stylua: ignore end

return {
  "zbirenbaum/copilot.lua",
  version = false,
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
      -- keymap = {
      --   accept = "<Tab>",
      --   next = "<M-]>",
      --   prev = "<M-[>",
      --   dismiss = "<C-d>",
      --   toggle_auto_trigger = "<leader>cd",
      --   status = "<leader>cn",
      -- },
    },
    panel = {
      enabled = true,
    },
  },
  -- config = function()
  --   require("copilot").setup({})
  -- end,
}
