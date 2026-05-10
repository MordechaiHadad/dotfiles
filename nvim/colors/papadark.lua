-- colors/papadark.lua
vim.g.colors_name = "papadark"
vim.o.termguicolors = true

local function hl(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

local function blend(foreground, background, alpha)
    alpha = type(alpha) == "number" and alpha or 0.8
    local function hexToRgb(c)
        c = c:gsub("#", "")
        return tonumber(c:sub(1, 2), 16), tonumber(c:sub(3, 4), 16), tonumber(c:sub(5, 6), 16)
    end
    local fgR, fgG, fgB = hexToRgb(foreground)
    local bgR, bgG, bgB = hexToRgb(background)
    local r = math.floor(fgR * alpha + bgR * (1 - alpha))
    local g = math.floor(fgG * alpha + bgG * (1 - alpha))
    local b = math.floor(fgB * alpha + bgB * (1 - alpha))
    return string.format("#%02x%02x%02x", r, g, b)
end


local palette = {
    base00  = "#2e3440", -- Primary BG
    base01  = "#2b2e36", -- Alt BG
    base02  = "#3b4252", -- Selection / Line Color
    base03  = "#3e4452", -- Float BG / Visual Grey
    base04  = "#4c566a", -- Inactive / Muted
    base05  = "#e5e9f0", -- Primary FG
    red     = "#d94848",
    orange  = "#d08770",
    yellow  = "#d4d198",
    green   = "#98c379",
    cyan    = "#4ec9b0",
    blue    = "#5d8ac2",
    magenta = "#c487b9",
    sky     = "#8fc6e3", -- light_blue
    mint    = "#84d9aa", -- interface_color
    moss    = "#b4cda8", -- number
}

local sky_dim = blend(palette.sky, palette.base00, 0.8)

local colors = {
    bg      = palette.base00,
    fg      = palette.base05,
    surface = palette.base01,
    overlay = palette.base02,
    float   = palette.base03,
    muted   = palette.base04,
    unused  = sky_dim,
    syntax  = {
        keyword  = palette.blue,
        func     = palette.yellow,
        string   = palette.green,
        type     = palette.cyan,
        variable = palette.sky,
        number   = palette.moss,
        comment  = "#699856"
    }
}

-- [ Base Editor Highlights ]
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("ColorColumn", { fg = palette.red })
hl("CursorLine", { bg = colors.overlay })
hl("CursorLineNr", { fg = colors.fg })
hl("Directory", { fg = palette.blue })
hl("EndOfBuffer", { fg = colors.bg })
hl("ErrorMsg", { fg = colors.fg, bg = palette.red })
hl("VertSplit", { fg = colors.surface, bg = colors.bg })
hl("Folded", { fg = colors.syntax.comment })
hl("IncSearch", { fg = palette.yellow, bg = colors.syntax.comment })
hl("MatchParen", { fg = colors.fg, bg = palette.blue })
hl("NonText", { fg = palette.blue })
hl("Search", { bg = palette.blue })
hl("TabLine", { fg = colors.syntax.comment })
hl("TabLineSel", { fg = colors.fg })
hl("TabLineFill", { bg = colors.bg })
hl("Visual", { bg = colors.float })
hl("WarningMsg", { fg = palette.yellow })
hl("Whitespace", { fg = colors.fg })
hl("FloatBorder", { fg = colors.fg })
hl("Comment", { fg = colors.syntax.comment, italic = true })
hl("NeoTreeVertSplit", { fg = colors.surface })

-- [ Standard Syntax ]
hl("Constant", { fg = palette.blue })
hl("String", { fg = colors.syntax.string })
hl("Character", { link = "String" })
hl("Number", { fg = colors.syntax.number })
hl("Boolean", { link = "Constant" })
hl("Float", { link = "Number" })
hl("Identifier", { fg = colors.syntax.variable })
hl("Function", { fg = colors.syntax.func })
hl("Statement", { fg = palette.blue })
hl("PreProc", { link = "Statement" })
hl("Type", { fg = colors.syntax.type })
hl("Special", { fg = palette.blue })
hl("Keyword", { fg = palette.blue })
hl("Error", { fg = colors.fg, bg = palette.red })

-- [ Treesitter (@ and TS groups) ]
local ts_groups = {
    ["@boolean"] = "Boolean",
    ["TSBoolean"] = "Boolean",
    ["@character"] = "Character",
    ["TSCharacter"] = "Character",
    ["@constant"] = "Constant",
    ["TSConstant"] = "Constant",
    ["@error"] = "Error",
    ["TSError"] = "Error",
    ["@function"] = "Function",
    ["TSFunction"] = "Function",
    ["@function.builtin"] = "Function",
    ["TSFuncBuiltin"] = "Function",
    ["@function.macro"] = "Function",
    ["TSFuncMacro"] = "Function",
    ["@method"] = "Function",
    ["TSMethod"] = "Function",
    ["@keyword.function"] = "Keyword",
    ["TSKeywordFunction"] = "Keyword",
    ["@conditional"] = "Keyword",
    ["TSConditional"] = "Keyword",
    ["@constant.builtin"] = "Keyword",
    ["TSConstBuiltin"] = "Keyword",
    ["@include"] = "Keyword",
    ["TSInclude"] = "Keyword",
    ["@variable.builtin"] = "Keyword",
    ["TSVariableBuiltin"] = "Keyword",
    ["@tag"] = "Keyword",
    ["TSTag"] = "Keyword",
    ["@text.title"] = "String",
    ["TSTitle"] = "String",
    ["@label"] = "String",
    ["TSLabel"] = "String",
}
for group, target in pairs(ts_groups) do hl(group, { link = target }) end

hl("@field", { fg = colors.syntax.variable })
hl("TSField", { fg = colors.syntax.variable })
hl("@property", { link = "@field" })
hl("TSProperty", { link = "@field" })
hl("@variable", { link = "@field" })
hl("TSVariable", { link = "@field" })
hl("@namespace", { fg = colors.syntax.type })
hl("TSNamespace", { fg = colors.syntax.type })
hl("@type", { fg = colors.syntax.type })
hl("TSType", { fg = colors.syntax.type })
hl("@type.builtin", { fg = palette.blue })
hl("TSTypeBuiltin", { fg = palette.blue })
hl("@keyword", { fg = palette.blue })
hl("TSKeyword", { fg = palette.blue })
hl("@punctuation.bracket", { fg = palette.blue })
hl("TSPunctBracket", { fg = palette.blue })
hl("@constructor", { fg = palette.blue })
hl("TSConstructor", { fg = palette.blue })

-- [ Plugins: Gitsigns ]
hl("GitSignsChange", { fg = palette.yellow, bg = colors.bg })
hl("GitSignsDelete", { fg = palette.red })

-- [ Plugins: CMP ]
hl("CmpItemKind", { fg = palette.blue })
hl("CmpItemKindVariable", { fg = colors.syntax.variable })
hl("CmpItemAbbr", { fg = colors.fg })
hl("CmpItemAbbrMatch", { fg = colors.syntax.variable })
hl("CmpItemMenu", { fg = palette.blue })

-- [ Plugins: Trouble ]
hl("TroubleSignError", { fg = palette.red })
hl("TroubleSignWarning", { fg = palette.yellow })

-- [ Plugins: Nvim-Tree ]
hl("NvimTreeRootFolder", { fg = colors.syntax.variable })
hl("NvimTreeFileDeleted", { fg = palette.red })
hl("NvimTreeGitDeleted", { fg = palette.red })
hl("NvimTreeGitDirty", { fg = palette.yellow })

-- [ Plugins: Telescope ]
hl("TelescopeSelection", { bg = colors.float })
hl("TelescopeMatching", { fg = palette.blue })
hl("TelescopeBorder", { fg = colors.surface, bg = colors.surface })
hl("TelescopePromptPrefix", { fg = palette.blue, bg = colors.surface })
hl("TelescopeResultsTitle", { fg = colors.surface, bg = palette.blue })
hl("TelescopePreviewTitle", { fg = colors.surface, bg = palette.green })
hl("TelescopePromptTitle", { fg = colors.surface, bg = palette.yellow })
hl("TelescopePreviewNormal", { bg = colors.surface })
hl("TelescopeResultsNormal", { bg = colors.surface })
hl("TelescopePromptNormal", { fg = colors.fg, bg = colors.surface })
hl("TelescopePromptBorder", { fg = colors.bg, bg = colors.surface })
hl("TelescopeSelectionCaret", { fg = colors.surface, bg = colors.surface })

-- [ LSP & Markdown ]
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.yellow })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = palette.sky })
hl("DiagnosticUnnecessary", { fg = colors.unused })
hl("markdownCode", { fg = colors.syntax.string })
hl("@lsp.type.decorator", { link = "Function" })
hl("@lsp.typemod.decorator.attribute", { link = "Function" })
hl("@lsp.type.macro.rust", { link = "Function" })

-- [ Plugins: Blink.cmp ]
hl("BlinkCmpMenu", { fg = colors.fg, bg = colors.float })
hl("BlinkCmpMenuBorder", { fg = colors.float, bg = colors.float })
hl("BlinkCmpMenuSelection", { bg = colors.float, bold = true })
hl("BlinkCmpScrollBarThumb", { bg = colors.muted })
hl("BlinkCmpScrollBarGutter", { bg = colors.float })
hl("BlinkCmpLabel", { fg = colors.fg })
hl("BlinkCmpLabelMatch", { fg = colors.syntax.variable, bold = true })
hl("BlinkCmpLabelDetail", { fg = colors.muted })
hl("BlinkCmpLabelDescription", { fg = colors.muted })
hl("BlinkCmpSource", { fg = colors.syntax.type, italic = true })
hl("BlinkCmpGhostText", { fg = colors.muted })
hl("BlinkCmpDoc", { fg = colors.fg, bg = colors.float })
hl("BlinkCmpDocBorder", { fg = colors.float, bg = colors.float })
hl("BlinkCmpDocSeparator", { fg = colors.bg })
hl("BlinkCmpKind", { fg = palette.blue })
hl("BlinkCmpKindVariable", { fg = colors.syntax.variable })
hl("BlinkCmpKindFunction", { fg = colors.syntax.func })
hl("BlinkCmpKindMethod", { fg = colors.syntax.func })
hl("BlinkCmpKindKeyword", { fg = palette.blue })
hl("BlinkCmpKindProperty", { fg = colors.syntax.variable })
hl("BlinkCmpKindInterface", { fg = colors.syntax.type })
hl("BlinkCmpKindTypeParameter", { fg = colors.syntax.type })
hl("BlinkCmpSignatureHelp", { fg = colors.fg, bg = colors.float })
hl("BlinkCmpSignatureHelpBorder", { fg = colors.float, bg = colors.float })
hl("BlinkCmpSignatureHelpActiveParameter", { fg = palette.yellow, bold = true })


-- [ Plugins: mini-cursorword ]
hl("MiniCursorword", { bg = colors.overlay })
hl("MiniCursorwordCurrent", { bg = colors.overlay, bold = true })

-- [ Plugins: Snacks ]
hl("SnacksIndent", { fg = colors.muted })
