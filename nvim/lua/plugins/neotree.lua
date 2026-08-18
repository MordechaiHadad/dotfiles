return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim"
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
                        if not node or node.type ~= "file" then return end

                        -- 1. Open the file normally via Neo-tree
                        ---@diagnostic disable-next-line: missing-parameter
                        require("neo-tree.sources.common.commands").open(state)

                        vim.schedule(function()
                            local file_path = node.path
                            local rel_path = vim.fn.systemlist("git ls-files --full-name " ..
                            vim.fn.shellescape(file_path))[1]
                            if not rel_path or rel_path == "" then return end

                            local target_ft = vim.bo.filetype

                            -- 2. Turn on diff for the modified buffer
                            vim.cmd("diffthis")

                            -- 3. Open a scratch split on the left for the HEAD version
                            vim.cmd("leftabove vnew")
                            local scratch_buf = vim.api.nvim_get_current_buf()

                            -- 4. Load HEAD contents from Git into scratch buffer
                            vim.cmd("silent read !git show HEAD:" .. vim.fn.shellescape(rel_path))
                            vim.cmd("1delete _")

                            -- 5. Match filetype for syntax highlighting and configure scratch options
                            vim.bo[scratch_buf].filetype = target_ft
                            vim.bo[scratch_buf].buftype = "nofile"
                            vim.bo[scratch_buf].bufhidden = "wipe"

                            -- 6. Enable diff on HEAD buffer
                            vim.cmd("diffthis")
                        end)
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
