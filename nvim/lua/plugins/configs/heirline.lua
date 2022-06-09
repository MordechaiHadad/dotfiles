return function()
    local colors = {
        fg = "#E5E9F0",
        bg = "#2E3440",
        yellow = "#d4d198",
        green = "#98C379",
        black = "#2b2e36",
        blue = "#5d8ac2",
        grey = "#3B4048",
        purple = "#c487b9",
        red = "#d94848",
        light_blue = "#8fc6e3",
        blue_green = "#4EC9B0",
        line_color = "#353c4a",
    }

    local files = {
        ["cs"] = "C#",
        ["cpp"] = "C++",
    }

    local align = { provider = "%=" }
    local function alignment(amount)
        return { provider = string.rep(" ", amount) }
    end

    local conditions = require("heirline.conditions")

    local ModeComponent = {
        init = function(self)
            self.mode = vim.fn.mode(1) -- :h mode()

            -- execute this only once, this is required if you want the ViMode
            -- component to be updated on operator pending mode
            if not self.once then
                vim.api.nvim_create_autocmd("ModeChanged", { command = "redrawstatus" })
                self.once = true
            end
        end,
        -- Now we define some dictionaries to map the output of mode() to the
        -- corresponding string and color. We can put these into `static` to compute
        -- them at initialisation time.
        static = {
            mode_colors = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                V = colors.blue,
                c = colors.yellow,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [""] = colors.red,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ["r?"] = colors.cyan,
                ["!"] = colors.red,
                t = colors.red,
            },
        },
        -- We can now access the value of mode() that, by now, would have been
        -- computed by `init()` and use it to index our strings dictionary.
        -- note how `static` fields become just regular attributes once the
        -- component is instantiated.
        -- To be extra meticulous, we can also add some vim statusline syntax to
        -- control the padding and make sure our string is always at least 2
        -- characters long. Plus a nice Icon.
        provider = "▊",
        -- Same goes for the highlight. Now the foreground will change according to the current mode.
        hl = function(self)
            local mode = self.mode:sub(1, 1) -- get only the first mode character
            return { fg = self.mode_colors[mode], bold = true }
        end,
        -- Re-evaluate the component only on ModeChanged event!
        -- This is not required in any way, but it's there, and it's a small
        -- performance improvement.
        update = "ModeChanged",
    }

    local GitComponent = {
        condition = conditions.is_git_repo,
        on_click = {
            callback = function()
                require("neogit").open()
            end,
            name = "toggle_neogit",
        },

        init = function(self)
            self.status_dict = vim.b.gitsigns_status_dict
            self.has_changes = self.status_dict.added ~= 0
                or self.status_dict.removed ~= 0
                or self.status_dict.changed ~= 0
        end,
        alignment(1),
        {
            provider = "",
            hl = { fg = colors.blue },
            alignment(1),
        },
        {
            provider = function(self)
                return self.status_dict.head
            end,
            alignment(1),
        },
        {

            condition = function(self)
                local count = self.status_dict.added or 0
                return count > 0
            end,
            provider = "",
            hl = { fg = colors.green },
            alignment(1),
            {
                provider = function(self)
                    return self.status_dict.added
                end,
                hl = { fg = colors.fg },
            },
            alignment(1),
        },
        {

            condition = function(self)
                local count = self.status_dict.changes or 0
                return count > 0
            end,
            provider = "",
            hl = { fg = colors.yellow },
            alignment(1),
            {
                provider = function(self)
                    return self.status_dict.changed
                end,
                hl = { fg = colors.fg },
                alignment(1),
            },
        },
        {
            condition = function(self)
                local count = self.status_dict.removed or 0
                return count > 0
            end,
            provider = "",
            hl = { fg = colors.red },
            alignment(1),
            {
                provider = function(self)
                    return self.status_dict.removed
                end,
                hl = { fg = colors.fg },
                alignment(1),
            },
        },
    }

    local LspComponent = {
        condition = conditions.has_diagnostics,
        on_click = {
            callback = function()
                require("trouble").toggle({ mode = "document_diagnostics" })
            end,
            name = "toggle_trouble",
        },
        provider = "|",
        hl = { fg = colors.blue },

        init = function(self)
            self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
            self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,
        alignment(1),
        {
            condition = function(self)
                return self.errors > 0
            end,
            provider = "",
            hl = { fg = colors.red },
            alignment(1),
            {
                provider = function(self)
                    return self.errors
                end,
                hl = { fg = colors.fg },
                alignment(1),
            },
        },
        {
            condition = function(self)
                return self.warnings > 0
            end,
            provider = "",
            hl = { fg = colors.yellow },
            alignment(1),
            {
                provider = function(self)
                    return self.warnings
                end,
                hl = { fg = colors.fg },
                alignment(1),
            },
        },
    }

    local FileFormatComponent = {
        provider = function()
            return string.upper(vim.bo.fileformat)
        end,
        alignment(1),
        {
            provider = "|",
            hl = { fg = colors.blue },
            alignment(1),
        },
    }

    local RulerComponenet = {
        -- %l = current line number
        -- %L = number of lines in the buffer
        -- %c = column number
        -- %P = percentage through file of displayed window
        provider = "%7(%l/%3L%):%2c %P",
        alignment(1),
    }

    local FileEncodingComponent = {
        provider = function()
            return string.upper(vim.bo.fileencoding)
        end,
        alignment(1),
    }

    local FileTypeComponent = {
        on_click = {
            callback = function()
                require("neogit").open()
            end,
            name = "toggle_neogit",
        },
        provider = function()
            return (vim.bo.filetype:gsub("^%l", string.upper))
        end,
        alignment(1),
    }

    local statusline = {
        ModeComponent,
        GitComponent,
        LspComponent,
        align,
        FileFormatComponent,
        RulerComponenet,
        FileEncodingComponent,
        FileTypeComponent,
        ModeComponent,
        hl = { bg = colors.line_color },
    }
    local winbar = {}

    require("heirline").setup(statusline)
end
