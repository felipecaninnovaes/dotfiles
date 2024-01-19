local diagnostic_signs = require("util.icons").diagnostic_signs
local config = function()
  require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = require("plugins.lsps.lua_ls").settings,
  })

  -- json
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    filetypes = { "json", "jsonc" },
  })

  -- python
  lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = require("plugins.lsps.pyright").settings,
  })

  -- typescript
  lspconfig.tsserver.setup({
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  })

  -- bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
    filetypes = { "sh", "aliasrc" },
  })

  -- solidity
  lspconfig.solidity.setup({
    capabilities = capabilities,
    filetypes = { "solidity" },
  })

  -- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = {
      "typescriptreact",
      "javascriptreact",
      "javascript",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
      "html",
    },
  })

  -- docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
  })

  -- C/C++
  lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  -- configure efm server
  lspconfig.efm.setup({
    filetypes = require("plugins.lsps.efm").filetypes,
    init_options = require("plugins.lsps.efm").init_options,
    settings = require("plugins.lsps.efm").settings,
  })
  -- rust_analyzer
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = require("plugins.lsps.rust").settings,
  })
  vim.keymap.set({ 'n', 'v' }, '<leader>.', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'da', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<C-q>', vim.diagnostic.setloclist)

end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
