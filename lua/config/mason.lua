return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- optional but recommended
  config = function()
    require("mason").setup()
  end
}

