return function()
    require("themer.config")("internal", {
        langs = {
            html = false,
            md = false,
        },
        plugins = {
            indentline = false,
            barbar = false,
            bufferline = false,
            gitsigns = false,
            telescope = false,
        },
    })

    require("themer").setup({
        colorscheme = "papa_dark",
    })
end
