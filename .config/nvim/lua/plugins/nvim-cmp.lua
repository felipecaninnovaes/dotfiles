local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	vim.opt.completeopt = "menu,menuone,noselect"
	-- configure how nvim-cmp interacts with snippet engine
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-.>"] = cmp.mapping.complete(), -- show completion suggestions
			["<C-e>"] = cmp.mapping.abort(), -- close completion window
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
		-- sources for autocompletion
		sources = cmp.config.sources({
			{ name = 'crates' }, -- rust
			{ name = "nvim_lsp" }, -- lsp
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		}),
		-- configure lspkind for vs-code like icons
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})
	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = 'buffer' },
		}),
	})
	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' },
		},
	})
	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' },
		}, {
			{ name = 'cmdline' },
		}),
	})
	-- load snippets from vscode
	require('luasnip.loaders.from_vscode').load {
		paths = { '~/.config/nvim/snippets' },
	}
end

local opts = {
	-- plugin options
}

return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	config = config,
	opts = opts,
	dependencies = {
		'hrsh7th/cmp-buffer', -- source for text in buffer
		'hrsh7th/cmp-path',   -- source for file system paths
		'L3MON4D3/LuaSnip',   -- snippet engine
		'saadparwaiz1/cmp_luasnip', -- for autocompletion
		'onsails/lspkind.nvim', -- vs-code like pictograms
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-cmdline',
	},
}
