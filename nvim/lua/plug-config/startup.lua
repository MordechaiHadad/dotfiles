
return function()
    require("startup").setup({
        header = {
            content = {
                "",
                "██████╗  █████╗ ██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗",
                "██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
                "██████╔╝███████║██████╔╝███████║██║   ██║██║██╔████╔██║",
                "██╔═══╝ ██╔══██║██╔═══╝ ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                "██║     ██║  ██║██║     ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                "╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            },
            type = "text",
            align = "center",
            highlight = "Statement",
        },
        body = {
            type = "mapping",
            align = "center",
            title = "Commands",
            content = {
                { "  New file", "lua require'startup'.new_file()", "e" },
                { "  Find file", "Telescope frecency", "f" },
                { "  Projects", "Telescope projects", "p"},
                { "  Open last session", "lua require('persistence').load()", "s"},
                { "  Quit", "qa", "q"},
            },
            highlight = "Function",
        },
        footer = {
            type = "text",
            align = "center",
            content = {
                "Initialized with " .. vim.tbl_count(packer_plugins) .. " plugins and " .. #require("lspmanager").installed_servers() .. " language servers",
            },
            highlight = "Function",
        },
        options = {
            mapping_keys = true,
        },

        parts = { "header", "body", "footer" },
    })
end
