return {
  { "nvim-tree/nvim-web-devicons" },
  { "rcarriga/nvim-notify", require("config.notify") },
  { "nvim-lualine/lualine.nvim", require("config.lualine") },
  -- { "folke/noice.nvim", require('config.noice') },
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", require("config.treesitter") },
  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon", require("config.harpoon") }, 
  { "mbbill/undotree", require("config.undotree") }, 
  -- { "nvim-telescope/telescope.nvim", require("config.telescope") }, 
  { "akinsho/bufferline.nvim", require("config.bufferline") },
  { "folke/flash.nvim", require("config.flash") }, 
  { "folke/which-key.nvim", require("config.which-key") },
  { "folke/snacks.nvim", require("config.snacks") },
  { "lewis6991/gitsigns.nvim", require("config.gitsigns") },

  --------- Language Support ---------
  { "kmonad/kmonad-vim" }, 
  
  --------- LSP ---------
  -- { "neovim/nvim-lspconfig" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lsp" },
}
