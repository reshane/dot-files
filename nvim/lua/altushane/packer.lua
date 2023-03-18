--; This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'j-hui/fidget.nvim',

            'folke/neodev.nvim',
        },
    }
    
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
       -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'navarasu/onedark.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-sleuth'

    use {
        'nvim-treesitter/nvim-treesitter', 
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

end)

-- Set lualine as statusline
-- See :help lualine.txt
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
}

-- enable Comment.nvim
require('Comment').setup()

-- enable indent_blankline plugin
-- See :help indent_blankline.txt
require('indent_blankline').setup {
    char = '┊',
    show_trail--ing_blankline_indent = false,
}

require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}


