return function()
    local luadev = require("lua-dev").setup({
        library = {
            vimruntime = true,
            types = true,
            plugins = false,
        },
    })

    require("lspmanager").setup({
        lsps = {
            sumneko_lua = luadev
        },
    })
end
