local M = {}

M.settings = {
	rnix = {
		rnix = {
			cmd = { "rnix-lsp" },
			filetypes = { "nix" },
			settings = {
				rnix = {
					nixfmt = {
						enable = true,
						formatCommand = "nixpkgs-fmt",
						formatStdin = true,
					},
				},
			},
		},
	},
}

return M
