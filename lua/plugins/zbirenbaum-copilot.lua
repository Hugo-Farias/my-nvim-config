local copilotStatus = true -- is copilot enabled on start up
-- local autoTriggerStatus = true

local function copilotToggle()
  vim.cmd(copilotStatus and "Copilot disable" or "Copilot enable")
  copilotStatus = not copilotStatus
  vim.notify(copilotStatus and "Copilot Enabled" or "Copilot Disabled")
end

-- local function autoTriggerToggle()
--   -- vim.cmd(copilotStatus and "Copilot disable" or "Copilot enable")
--   vim.cmd("Copilot suggestion toggle_auto_trigger")
--   local notifyText = "Copilot Auto Trigger"
--   autoTriggerStatus = not autoTriggerStatus
--   vim.notify(autoTriggerStatus and notifyText .. " On" or notifyText .. " Off")
-- end

return {
  "zbirenbaum/copilot.lua",
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
  keys = {
    -- stylua: ignore start
    { "<leader>tC", copilotToggle, desc = "Toggle Copilot" },
    -- { "<C-d>", autoTriggerToggle, desc = "Copilot: Toggle Auto Trigger", mode = "i" },
    { "<leader>tp", "<cmd>Copilot panel<CR>", desc = "Toggle Copilot Panel" },
    { "<leader>cn", "<cmd>Copilot<CR>", desc = "Copilot: Status" },
    { "<Tab>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", desc = "Copilot: Accept Line", mode = "i" },
    { "<C-l>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", desc = "Copilot: Accept Word", mode = "i" },
    { "<C-y>", "<cmd>lua require('copilot.suggestion').accept()<CR>", desc = "Copilot: Accept All", mode = "i" },
    { "<M-]>", "<cmd>lua require('copilot.suggestion').next()<CR>", desc = "Copilot: Next Suggestion", mode = "i" },
    { "<M-[>", "<cmd>lua require('copilot.suggestion').prev()<CR>", desc = "Copilot: Prev Suggestion", mode = "i" },
  },
}
