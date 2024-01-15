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

    -- autocompelete
    -- nvim-cmp
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    -- vsnip
    use {'hrsh7th/cmp-vsnip'} 
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    -- lspkind
    use {'onsails/lspkind-nvim'}
    

    -- comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'lewis6991/gitsigns.nvim'}
  end)
