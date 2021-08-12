local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local fn = vim.fn

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {},
        inactive = {}
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {},
        inactive = {}
    }
}

properties.force_inactive.filetypes = {
    'NvimTree',
    'packer',
    'startify',
}

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

local mode_color = {
	NORMAL = colors.blue,
    INSERT = colors.green,
	VISUAL = colors.purple,
    COMMAND = colors.yellow,
}

local mode_icon = {
    VimNormal = ' ',
    VimInsert = ' ',
    VimVisual = ' ',
    VimCommand = ' ',
}

components.left.active[1] = {
    provider = function()
        return ' ' .. (mode_icon[vi_mode_utils.get_mode_highlight_name()] or 'Error')
    end,

    hl = function()
        local val = {}
        val.fg = colors.black
        val.bg = vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' '
}

components.left.active[2] = {
}



require('feline').setup({
    default_bg = colors.line_color,
    default_fg = colors.foreground,
    components = components,
    vi_mode_colors = mode_color,
})

