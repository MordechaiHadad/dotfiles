return function()
    require("lspmanager").setup()

    local luadev = require("lua-dev").setup({
        library = {
            vimruntime = true,
            types = true,
            plugins = false,
        },
    })

    require("lspconfig").sumneko_lua.setup(luadev)
end
