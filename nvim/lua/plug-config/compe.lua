return function()
    require'compe'.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
            path = {kind = "  "},
            buffer = {kind = "  "},
            calc = {kind = "  "},
            vsnip = {kind = "  "},
            nvim_lsp = {kind = "  "},
            nvim_lua = {kind = "  "},
            spell = {kind = "  "},
            snippets_nvim = {kind = "  "},
            emoji = {filetypes = {"markdown", "text"}},
            tabnine = true
        }
    }
end
