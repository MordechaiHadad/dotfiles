-- colors/papadark.lua
-- Native highlight version of themer.lua theme: papa_dark.lua (papa_dark/papadark).

vim.g.colors_name = "papadark"
vim.o.termguicolors = true

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local colors = {
  bg = "#2e3440",
  fg = "#E5E9F0",
  bg_alt = "#2b2e36",
  bg_float = "#3B4048",
  inactive = "#4C566A",
  subtle = "#4c566a",
  red = "#d94848",
  yellow = "#d4d198",
  orange = "#d08770",
  blue = "#5d8ac2",
  green = "#98C379",
  magenta = "#c487b9",
  highlight = "#434c5e",
  highlight_overlay = "#434c5e",
  highlight_inactive = "#3e4452",
  comment = "#699856",
  light_blue = "#8fc6e3",
  cyan = "#4EC9B0",
  vertsplit = "#373e4a",
  number = "#B4CDA8",
  string = "#A3BE8C",
  line_number = "#4C566A",
  line_color = "#3B4252",
  visual_grey = "#3E4452",
  interface_color = "#84D9AA",
  light_blue_dimmed = "#7cabbd"
}

-- Base remaps
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("ColorColumn", { fg = colors.red })
hl("CursorLine", { bg = colors.line_color })
hl("CursorLineNr", { fg = colors.fg })
hl("Directory", { fg = colors.blue })
hl("EndOfBuffer", { fg = colors.bg })
hl("ErrorMsg", { fg = colors.fg, bg = colors.red })
hl("VertSplit", { fg = colors.vertsplit, bg = colors.bg })
hl("Folded", { fg = colors.comment })
hl("IncSearch", { fg = colors.yellow, bg = colors.comment })
hl("MatchParen", { fg = colors.fg, bg = colors.blue })
hl("NonText", { fg = colors.blue })
hl("Search", { bg = colors.blue })
hl("TabLine", { fg = colors.comment })
hl("TabLineSel", { fg = colors.fg })
hl("TabLineFill", { bg = colors.bg })
hl("Visual", { bg = colors.visual_grey })
hl("WarningMsg", { fg = colors.yellow })
hl("Whitespace", { fg = colors.fg })
hl("FloatBorder", { fg = colors.fg })
hl("Comment", { fg = colors.comment, italic = true })
hl("VertSplit", { fg = colors.vertsplit })
hl("NeoTreeVertSplit", { fg = colors.vertsplit })

hl("Constant", { fg = colors.blue })
-- themer linked Character -> String, but base remaps didn't define String.
-- define String so the link has an actual target.
hl("String", { fg = colors.string })
hl("Character", { link = "String" })
hl("Number", { fg = colors.number })
hl("Boolean", { link = "Constant" })
hl("Float", { link = "Number" })
hl("Identifier", { fg = colors.light_blue })
hl("Function", { fg = colors.yellow })
hl("Statement", { fg = colors.blue })
hl("PreProc", { link = "Statement" })
hl("Type", { fg = colors.cyan })
hl("Special", { fg = colors.blue })

-- themer links TS groups to Keyword and Error; ensure those exist
hl("Keyword", { fg = colors.blue })
hl("Error", { fg = colors.fg, bg = colors.red })

-- Plugins: treesitter (new @ groups + old TS* groups)
hl("@boolean", { link = "Boolean" })
hl("TSBoolean", { link = "Boolean" })

hl("@character", { link = "Character" })
hl("TSCharacter", { link = "Character" })

hl("@constant", { link = "Constant" })
hl("TSConstant", { link = "Constant" })

hl("@error", { link = "Error" })
hl("TSError", { link = "Error" })

hl("@field", { fg = colors.light_blue })
hl("TSField", { fg = colors.light_blue })

hl("@function", { link = "Function" })
hl("TSFunction", { link = "Function" })

hl("@function.builtin", { link = "Function" })
hl("TSFuncBuiltin", { link = "Function" })

hl("@function.macro", { link = "Function" })
hl("TSFuncMacro", { link = "Function" })

hl("@namespace", { fg = colors.cyan })
hl("TSNamespace", { fg = colors.cyan })

hl("@type", { fg = colors.cyan })
hl("TSType", { fg = colors.cyan })

hl("@type.builtin", { fg = colors.blue })
hl("TSTypeBuiltin", { fg = colors.blue })

hl("@variable", { link = "TSField" })
hl("TSVariable", { link = "TSField" })

hl("@property", { link = "TSField" })
hl("TSProperty", { link = "TSField" })

hl("@keyword", { fg = colors.blue })
hl("TSKeyword", { fg = colors.blue })

hl("@punctuation.bracket", { fg = colors.blue })
hl("TSPunctBracket", { fg = colors.blue })

hl("@constructor", { fg = colors.blue })
hl("TSConstructor", { fg = colors.blue })

hl("@method", { link = "Function" })
hl("TSMethod", { link = "Function" })

hl("@keyword.function", { link = "Keyword" })
hl("TSKeywordFunction", { link = "Keyword" })

hl("@conditional", { link = "Keyword" })
hl("TSConditional", { link = "Keyword" })

hl("@constant.builtin", { link = "Keyword" })
hl("TSConstBuiltin", { link = "Keyword" })

hl("@include", { link = "Keyword" })
hl("TSInclude", { link = "Keyword" })

hl("@variable.builtin", { link = "Keyword" })
hl("TSVariableBuiltin", { link = "Keyword" })

hl("@tag", { link = "Keyword" })
hl("TSTag", { link = "Keyword" })

hl("@text.title", { link = "String" })
hl("TSTitle", { link = "String" })

hl("@label", { link = "String" })
hl("TSLabel", { link = "String" })

-- Plugins: gitsigns
hl("GitSignsChange", { fg = colors.yellow, bg = colors.bg })
hl("GitSignsDelete", { fg = colors.red })

-- Plugins: cmp
hl("CmpItemKind", { fg = colors.blue })
hl("CmpItemKindVariable", { fg = colors.light_blue })
hl("CmpItemAbbr", { fg = colors.fg })
hl("CmpItemAbbrMatch", { fg = colors.light_blue })
hl("CmpItemMenu", { fg = colors.blue })

-- Plugins: trouble
hl("TroubleSignError", { fg = colors.red })
hl("TroubleSignWarning", { fg = colors.yellow })

-- Plugins: nvim-tree
hl("NvimTreeRootFolder", { fg = colors.light_blue })
hl("NvimTreeFileDeleted", { fg = colors.red })
hl("NvimTreeGitDeleted", { fg = colors.red })
hl("NvimTreeGitDirty", { fg = colors.yellow })

-- Plugins: telescope
hl("TelescopeSelection", { bg = colors.highlight_overlay })
hl("TelescopeMatching", { fg = colors.blue })
hl("TelescopeBorder", { fg = colors.bg_alt, bg = colors.bg_alt })
hl("TelescopePromptPrefix", { fg = colors.blue, bg = colors.bg_alt })
hl("TelescopeResultsTitle", { fg = colors.bg_alt, bg = colors.blue })
hl("TelescopePreviewTitle", { fg = colors.bg_alt, bg = colors.green })
hl("TelescopePromptTitle", { fg = colors.bg_alt, bg = colors.yellow })
hl("TelescopePreviewNormal", { bg = colors.bg_alt })
hl("TelescopeResultsNormal", { bg = colors.bg_alt })
hl("TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_alt })
hl("TelescopePromptBorder", { fg = colors.bg, bg = colors.bg_alt })
hl("TelescopeSelectionCaret", { fg = colors.bg_alt, bg = colors.bg_alt })

-- Plugins: lsp underline (themer used style="underline" and sp=...)
hl("DiagnosticUnderlineWarn", { underline = true, sp = colors.yellow })
hl("DiagnosticUnderlineHint", { underline = true, sp = colors.light_blue })
hl("DiagnosticUnnecessary", { fg = colors.light_blue_dimmed })

-- langs.md
hl("markdownCode", { fg = colors.string })


-- Rust attribute / decorator semantic tokens -> Function (yellow)
hl("@lsp.type.decorator.rust",            { link = "Function" })
hl("@lsp.typemod.decorator.attribute.rust", { link = "Function" })
hl("@function.attribute.rust",          { link = "Function" })

-- Generic fallback (for other languages/servers)
hl("@lsp.type.decorator",                 { link = "Function" })
hl("@lsp.typemod.decorator.attribute",    { link = "Function" })
