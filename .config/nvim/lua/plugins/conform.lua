local config = function()
  require("conform").setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_fallback = true,
    },

    ["*"] = { "codespell" },
    ["*.md"] = { "markdownlint" },
    ["*.js"] = { "biome" },
    ["*.ts"] = { "biome" },
    ["*.jsx"] = { "biome" },
    ["*.tsx"] = { "biome" },
    ["*.css"] = { "stylelint" },
    ["*.scss"] = { "stylelint" },
    ["*.html"] = { "htmlhint" },
    ["*.json"] = { "jsonlint" },
    ["*.yaml"] = { "yamllint" },
    ["*.yml"] = { "yamllint" },
    ["*.graphql"] = { "graphql" },
    ["*.lua"] = { "luacheck" },
    ["*.py"] = { "flake8" },
    ["*.rs"] = { "rustfmt" },
    ["*.svelte"] = { "svelte-check" },

  })
  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end, { desc = "Format file or range (in visual mode)" })
end

return {
  'stevearc/conform.nvim',

  lazy = false,
  config = config,
}
