return {
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon", require("config.harpoon") }, 
  { "mbbill/undotree" }, 
  { "kmonad/kmonad-vim" }, 
  { "nvim-telescope/telescope.nvim" }, 
  { "akinsho/bufferline.nvim", require("config.bufferline") },
  { "folke/flash.nvim", require("config.flash") }, 
  { "folke/which-key.nvim", require("config.which-key") },
  { "folke/snacks.nvim", require("config.snacks") },
}
