local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true, noremap = true }),
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true, noremap = true }),
	},
}
