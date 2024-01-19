local config = function()
    -- plugin configuration
end

local opts = {
    -- plugin options
}

return {
    'plugin/url',
    lazy = false,
    config = config,
    opts = opts,
    dependencies = {
        'plugin/dependency',
    },
}
