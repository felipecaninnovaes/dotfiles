local config = function()
    require('gitblame').setup {
        enabled = true,
    }
end

return {
    'f-person/git-blame.nvim',

    lazy = false,
    config = config,
}
