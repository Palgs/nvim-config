-- TV

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" , "nvim-tree/nvim-web-devicons"}
    }

    use('nvim-lualine/lualine.nvim')

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end})

        use({
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                vim.cmd('colorscheme rose-pine')
            end})

            use('ThePrimeagen/harpoon')
            use('ThePrimeagen/vim-be-good')
            use('mbbill/undotree')
            use('tpope/vim-fugitive')
            use('OmniSharp/omnisharp-vim')

            use('mhinz/vim-signify')
            use {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v2.x',
                requires = {
                    -- LSP Support
                    {'neovim/nvim-lspconfig'},             -- Required
                    {                                      -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},     -- Required
                {'hrsh7th/cmp-nvim-lsp'}, -- Required
                {'hrsh7th/cmp-nvim-lua'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_LuaSnip'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},     -- Required
                {'rafamadriz/friendly-snippets'}, 
            }}

        end)
