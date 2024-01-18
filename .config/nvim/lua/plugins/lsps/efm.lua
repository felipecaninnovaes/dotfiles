local M = {}

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local flake8 = require("efmls-configs.linters.flake8")
local black = require("efmls-configs.formatters.black")
local eslint = require("efmls-configs.linters.eslint")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local fixjson = require("efmls-configs.formatters.fixjson")
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
local hadolint = require("efmls-configs.linters.hadolint")
local solhint = require("efmls-configs.linters.solhint")
local cpplint = require("efmls-configs.linters.cpplint")
local clangformat = require("efmls-configs.formatters.clang_format")

M.filetypes ={
    "lua",
    "python",
    "json",
    "jsonc",
    "sh",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "docker",
    "solidity",
    "html",
    "css",
    "c",
    "cpp",
}

M.init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
}

M.settings = {
    languages = {
        lua = { luacheck, stylua },
        python = { flake8, black },
        typescript = { eslint, prettier_d },
        json = { eslint, fixjson },
        jsonc = { eslint, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint, prettier_d },
        javascriptreact = { eslint, prettier_d },
        typescriptreact = { eslint, prettier_d },
        svelte = { eslint, prettier_d },
        vue = { eslint, prettier_d },
        docker = { hadolint, prettier_d },
        solidity = { solhint },
        html = { prettier_d },
        css = { prettier_d },
        c = { clangformat, cpplint },
        cpp = { clangformat, cpplint },
    },
  }

return M