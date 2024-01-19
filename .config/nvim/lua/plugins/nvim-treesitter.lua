local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		ensure_installed = {
			"rust",
			"markdown",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"bash",
			"lua",
			"dockerfile",
			"solidity",
			"gitignore",
			"python",
			"vue",
			"svelte",
			"toml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		autotag = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<enter>',
				node_incremental = '<enter>',
				scope_incremental = false,
				node_decremental = '<bs>',
			},
		},
	})
	require('template-string').setup {}
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
	dependencies = {
		'windwp/nvim-ts-autotag',
		'axelvc/template-string.nvim',
	},
}
