vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use "simrat39/rust-tools.nvim"
    use 'felipecaninnovaes/dracula'
    use 'wbthomason/packer.nvim'
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use 'terroo/vim-simple-emoji'
    use 'navarasu/onedark.nvim'
    use 'bash-lsp/bash-language-server'

    use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.null-ls")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require "plugins.neoTree"
        end
        }
    use 'kyazdani42/nvim-web-devicons'
    use 'tamton-aquib/staline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'ray-x/lsp_signature.nvim'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'onsails/lspkind-nvim'
end
)


