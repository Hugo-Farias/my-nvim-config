return {
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon" }, 
  { "mbbill/undotree" }, 
  { "kmonad/kmonad-vim" }, 
  { "nvim-telescope/telescope.nvim" }, 
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { "folke/flash.nvim", event = "VeryLazy" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
	"<leader>?",
	function()
	  require("which-key").show({ global = false })
	end,
	desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
}
