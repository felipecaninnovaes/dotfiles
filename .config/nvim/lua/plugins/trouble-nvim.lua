local diagnostic_signs = require("util.icons").diagnostic_signs

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		signs = {
			-- icons / text used for a diagnostic
			error = diagnostic_signs.Error,
			warning = diagnostic_signs.Warn,
			hint = diagnostic_signs.Hint,
			information = diagnostic_signs.Info,
			other = diagnostic_signs.Info,
		},
	},
	keys = {
		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>",
			{ silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",
			{ silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true }),
	},
}
