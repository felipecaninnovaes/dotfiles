vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

vim.api.nvim_create_autocmd({"ColorScheme"}, { 
    pattern="*",
    callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { cterm=bold, bold=true })   
    end,
})