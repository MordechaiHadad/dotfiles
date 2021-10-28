return function()
    local luadev = require("lua-dev").setup({
        library = {
            vimruntime = true,
            types = true,
            plugins = false,
        },
        lspconfig = {
            cmd = "lol"
        },
    })

    require("lspmanager").setup({
        lsps = {
            sumneko_lua = luadev
        }
    })
end
