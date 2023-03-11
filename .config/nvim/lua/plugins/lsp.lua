require'lspconfig'.clangd.setup{}
require "lsp_signature".setup()
require'lspconfig'.bashls.setup{}
require("rust-tools").setup(opts)
require("luasnip/loaders/from_vscode").load()

