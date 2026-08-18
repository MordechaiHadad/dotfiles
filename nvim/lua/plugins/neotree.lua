return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            sources = {
                "filesystem",
                "git_status",
                "document_symbols",
            },
            source_selector = {
                winbar = true,
                statusline = false,
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                    { source = "document_symbols", display_name = "  Symbols " },
                },
            },
            git_status = {
                window = {
                    mappings = {
                        ["<CR>"] = "open_and_diff",
                    },
                },
                commands = {
                    open_and_diff = function(state)
                        local node = state.tree:get_node()
                        if not node then return end

                        if node.type == "file" then
                            ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
                            require("neo-tree.sources.common.commands").open(state)

                            vim.schedule(function()
                                if vim.bo.filetype ~= "neo-tree" then
                                    require("gitsigns").diffthis()
                                end
                            end)
                        else
                            ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
                            require("neo-tree.sources.common.commands").open(state)
                        end
                    end,
                },
            },
            window = {
                -- Calculate 20% of the total editor width
                width = "15%",

                mappings = {
                    ["<Tab>"] = "next_source",
                    ["<S-Tab>"] = "prev_source",
                    ["<C-r>"] = "noop",
                },
            },
        },
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { "terminal", "quickfix" },
                    },
                },
            })
        end,
    },
}
