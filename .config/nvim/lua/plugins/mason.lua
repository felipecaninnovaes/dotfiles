return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"efm",
				"bashls",
				"tsserver",
				"solidity",
				"tailwindcss",
				"pyright",
				"lua_ls",
				"emmet_ls",
				"jsonls",
				"clangd",
				"biome",
				"rust_analyzer",
			},

			automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server", -- lua language server
				"rust_analyzer", -- rust language server
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"biome", -- js linter
			},
		})
	end,
}
