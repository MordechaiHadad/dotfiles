return function()
    local luadev = require("lua-dev").setup({
        library = {
            vimruntime = true,
            types = true,
            plugins = false,
        },
        lspconfig = {
            on_attach = function (client)
                require("illuminate").on_attach(client)
            end,
        }
    })

    require("lspmanager").setup({
        lsps = {
            sumneko_lua = luadev,
            rust_analyzer = {
                on_attach = function (client)
                    require("illuminate").on_attach(client)
                end,
            }
        },
    })
end
