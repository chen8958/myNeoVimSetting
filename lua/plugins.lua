return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme
    -- use 'glepnir/zephyr-nvim'`
    use "folke/tokyonight.nvim"

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
      }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'akinsho/bufferline.nvim', 
        tag = "*", 
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- use { 'mg979/vim-visual-multi', branch = 'master' }
    use {'terryma/vim-multiple-cursors', branch = 'master'}
    
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'neovim/nvim-lspconfig'}
    
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ 'mfussenegger/nvim-dap'})

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  end)
