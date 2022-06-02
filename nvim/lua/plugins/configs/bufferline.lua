return function()
    require("bufferline").setup({
        options = {
            show_close_icon = false,
            close_command = function()
                require("bufdelete").bufdelete(0, true)
            end,
        },
    })
end
