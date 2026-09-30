return {
    {
        "brianhuster/live-preview.nvim",
        cmd = "LivePreview",
        dependencies = {
            -- You can choose one of the following pickers
            "nvim-telescope/telescope.nvim",
        },
    },
    {
        "laytan/cloak.nvim",
        opts = {
            enabled = true,
            cloak_character = "*",
            -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
            highlight_group = "Comment",
            -- Applies the length of the replacement characters for all matched
            -- patterns, defaults to the length of the matched pattern.
            cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
            -- Whether it should try every pattern to find the best fit or stop after the first.
            try_all_patterns = true,
            -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
            cloak_telescope = true,
            -- Re-enable cloak when a matched buffer leaves the window.
            cloak_on_leave = false,
            patterns = {
                {
                    -- Match any file starting with '.env'.
                    -- This can be a table to match multiple file patterns.
                    file_pattern = ".env*",
                    -- Match an equals sign and any character after it.
                    -- This can also be a table of patterns to cloak,
                    -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
                    cloak_pattern = "=.+",
                    -- A function, table or string to generate the replacement.
                    -- The actual replacement will contain the 'cloak_character'
                    -- where it doesn't cover the original text.
                    -- If left empty the legacy behavior of keeping the first character is retained.
                    replace = nil,
                },
            },
        },
    },
    {
        "echasnovski/mini.move",
        version = "*",
        config = function()
            require("mini.move").setup({
                mappings = {
                    -- Move visual selection in Visual mode
                    left = "<M-Left>",
                    right = "<M-Right>",
                    down = "<M-Down>",
                    up = "<M-Up>",

                    -- Move current line in Normal mode
                    line_left = "<M-Left>",
                    line_right = "<M-Right>",
                    line_down = "<M-Down>",
                    line_up = "<M-Up>",
                },
            })
        end,
    },
    {
        "echasnovski/mini.cursorword",
        version = "*",
        config = function()
            require("mini.cursorword").setup({
                -- delay in milliseconds before highlighting
                delay = 100,
            })
        end,
    },
    {
        "DrKJeff16/project.nvim",
        dependencies = { -- OPTIONAL. Choose any of the following
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    }
}
