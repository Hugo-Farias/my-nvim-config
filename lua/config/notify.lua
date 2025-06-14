return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 8000,
    })
  end
}

