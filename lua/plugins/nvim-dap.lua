return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }

      vim.keymap.set("n", "<space>bl", dap.toggle_breakpoint, { desc = "Toggle Breakpoint on Line" })
      vim.keymap.set("n", "<space>bc", dap.run_to_cursor, { desc = "Run to Cursor" })

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true, context = "line", height = 10, width = 50 })
      end)

      vim.keymap.set("n", "<F8>", dap.continue)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<S-F11>", dap.step_out)
      vim.keymap.set("n", "<S-F8>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
