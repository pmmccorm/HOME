return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'farmergreg/vim-lastplace'

  use 'nvim-lualine/lualine.nvim'

  -- treesitter
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- lsp-zero from here down
  use 'VonHeikemen/lsp-zero.nvim'
  
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
end)
