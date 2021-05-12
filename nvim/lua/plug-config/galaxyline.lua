local gl = require('galaxyline')

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
	n = colors.blue,
	i = colors.green,
	v = colors.purple,
    c = colors.yellow,
    V = colors.purple,
    [''] = colors.red
}

local mode_icon = {
    n = ' ',
    i = ' ',
    v = ' ',
    c = ' ',
    V = ' ',
    [''] = 'tf '
}

local condition = require('galaxyline.condition')
local gls = gl.section
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
gl.short_line_list = {'NvimTree', 'packer' ,'startify' ,'LspTrouble'}

gls.left[1] = {
	ViMode = {
		provider = function()
			vim.api.nvim_command('hi GalaxyViMode guifg=' .. colors.black .. ' guibg=' .. (mode_color[vim.fn.mode()] or colors.red))
			return '  ' .. (mode_icon[vim.fn.mode()] or 'Error')
		end,
		highlight = {colors.red, colors.line_color}
	}
}

gls.left[2] = {
    GitIcon = {
		condition = condition.check_git_workspace,
		provider = function()
            return '   '
        end,
        highlight = {colors.blue, colors.line_color}
    }
}

gls.left[3] = {
    GitBranch = {
		condition = condition.check_git_workspace,
        provider = function()
			return vcs.get_git_branch() .. ' '
		end,
        highlight = {colors.foreground, colors.line_color}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = {colors.green, colors.line_color}
    }
}
gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = {colors.yellow, colors.line_color}
    }
}
gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = {colors.red, colors.line_color},
        separator = '| ',
        separator_highlight = {colors.blue, colors.line_color}
    }
}

gls.left[7] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = {colors.red, colors.line_color}
    }
}

gls.left[8] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = {colors.yellow, colors.line_color}
    }
}

gls.right[1] = {
	FileFormat = {
		provider = function()
			return fileinfo.get_file_format() .. ' '
		end,
		highlight = {colors.foreground, colors.line_color}
	}
}

gls.right[2] = {
	LinePercent = {
		provider = 'LinePercent',
		highlight = {colors.foreground, colors.line_color},
		separator = '|',
		separator_highlight = {colors.blue, colors.line_color}
	}
}

gls.right[3] = {
	LineColumn = {
		provider = function()
			return fileinfo.line_column() .. ' '
		end,
		highlight = {colors.foreground, colors.line_color}
	}
}

gls.right[4] = {
	RightViMode = {
		provider = function()
			vim.api.nvim_command('hi GalaxyRightViMode guifg=' .. (mode_color[vim.fn.mode()] or colors.red))
			return '▊'
		end,
		highlight = {colors.red, colors.line_color}
	}
}

gl.section.short_line_left[1] = {
    FileName = {
        provider = 'FileName',
        highlight = {colors.foreground, colors.line_color}
    }
}
