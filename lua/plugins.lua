return {
  { "nvim-tree/nvim-web-devicons" },
  { "rcarriga/nvim-notify", require("config.notify") },
  { "kana/vim-smartword", require("config.vim-smartword") },
  -- { "nvim-lualine/lualine.nvim", require("config.lualine") },
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
  { "stevearc/conform.nvim" },
  { "windwp/nvim-autopairs", require("config.autopairs") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  -- { "jose-elias-alvarez/null-ls.nvim", require("config.null-ls") },

  ---- LSP ----
  { "mason-org/mason.nvim", require("config.mason") },
  { "neovim/nvim-lspconfig", require("lsp") },
}
