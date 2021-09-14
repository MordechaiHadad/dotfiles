return function()
    local vi_mode_utils = require("feline.providers.vi_mode")

    local colors = {
        foreground = "#E5E9F0",
        background = "#2E3440",
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

    local components = {
        left = { active = {}, inactive = {} },
        mid = { active = {}, inactive = {} },
        right = { active = {}, inactive = {} },
    }

    local vi_mode_colors = {
        NORMAL = "blue",
        OP = "green",
        INSERT = "green",
        VISUAL = "purple",
        BLOCK = "skyblue",
        REPLACE = "violet",
        ["V-REPLACE"] = "violet",
        ENTER = "cyan",
        MORE = "cyan",
        SELECT = "orange",
        COMMAND = "yellow",
        SHELL = "green",
        TERM = "green",
        NONE = "yellow",
    }

    local vi_mode_text = {
        NORMAL = " ",
        INSERT = " ",
        VISUAL = " ",
        BLOCK = "<>",
        REPLACE = "<>",
        ["V-REPLACE"] = "<>",
        ENTER = "<>",
        MORE = "<>",
        SELECT = "<>",
        COMMAND = " ",
        SHELL = "<|",
        TERM = "<|",
        NONE = "<>",
    }

    components.left.active[1] = {
        provider = function()
            return " " .. vi_mode_text[vi_mode_utils.get_vim_mode() or "Error"]
        end,
        hl = function()
            local val = {}

            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "black"

            return val
        end,
    }

    components.left.active[2] = {
        provider = "git_branch",
        hl = {
            fg = "blue",
            bg = "line_color",
            style = "bold",
        },
    }

    components.left.active[3] = {
        provider = "git_diff_added",
        icon = "  ",
        hl = {
            fg = "green",
        },
    }

    components.left.active[4] = {
        provider = "git_diff_changed",
        icon = "  ",
        hl = {
            fg = "yellow",
        },
    }

    components.left.active[5] = {
        provider = "git_diff_removed",
        icon = "  ",
        hl = {
            fg = "red",
        },
        right_sep = {
            str = " |",
            hl = {
                fg = "blue",
            },
        },
    }

    require("feline").setup({
        colors = colors,
        default_bg = "line_color",
        default_fg = "foreground",
        vi_mode_colors = vi_mode_colors,
        components = components,
    })
end
