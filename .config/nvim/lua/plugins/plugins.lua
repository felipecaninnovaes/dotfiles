vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'felipecaninnovaes/dracula'
    use 'tpope/vim-surround'
    use 'terroo/vim-simple-emoji'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use {"vim-airline/vim-airline",
        requires = {
            "vim-airline/vim-airline-themes"
        }
    }

    use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.nullLs")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {
        "nvim-neo-tree/neo-tree.nvim",
        -- branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require "plugins.neoTree"
        end
        }

    use {'neovim/nvim-lspconfig',
    requires = {
        'bash-lsp/bash-language-server',
        'ray-x/lsp_signature.nvim',
        'onsails/lspkind-nvim',
        "simrat39/rust-tools.nvim",
    },
    config = function()
        require('plugins.lsp')
    end
    }

    use {'hrsh7th/nvim-cmp',
    requires = {        
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        require('plugins.cmp')
    end
    }

    use {'windwp/nvim-autopairs',
        config = function()
            require("plugins.autoPairs")
        end,
        }

    use {'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("plugins.indentBlankLineRainbow")
        end,
    }
end
)