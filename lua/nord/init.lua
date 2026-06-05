local M = {}

M.colors = require("nord.palette")

---@class nord.Config
M.config = {
  --- Disable background colors
  transparent = false,
  --- Enable 16 colors for :terminal
  terminal_colors = true,
  --- Italicize comments
  italic_comments = false,
  --- Italicize keywords
  italic_keywords = false,
  --- Bold titles, folded text, etc.
  bold_headers = true,
  --- Use Nord backgrounds for Git diffs
  uniform_diffs = false,
  --- Make active and inactive statuslines the same color
  uniform_status = false,
  --- Make vertical window separators thicker/darker
  bold_separators = false,
  --- Add a background color to the current line number
  cursorline_bg = false,
  --- Add or override highlights
  ---@param hl table<string, vim.api.keyset.highlight>
  ---@param c NordPalette
  on_highlights = function(hl, c) end,
}

---@param opts? nord.Config
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function set_terminal_colors(c)
  -- dark
  vim.g.terminal_color_0 = c.nord1
  vim.g.terminal_color_8 = c.nord3
  -- light
  vim.g.terminal_color_7 = c.nord5
  vim.g.terminal_color_15 = c.nord6
  -- colors
  vim.g.terminal_color_1 = c.error
  vim.g.terminal_color_9 = c.error
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_4 = c.keyword
  vim.g.terminal_color_12 = c.keyword
  vim.g.terminal_color_5 = c.purple
  vim.g.terminal_color_13 = c.purple
  vim.g.terminal_color_6 = c.frost
  vim.g.terminal_color_14 = c.nord7
end

-- Highlight generation is separated into its own function.
-- This allows for easy addition of compilation caching in the future.
function M.build_highlights()
  local c = M.colors
  local cfg = M.config
  local bg = cfg.transparent and c.none or c.bg

  local hl = {
    ColorColumn = { bg = c.nord1 },
    Conceal = { fg = c.none, bg = c.none },
    Cursor = { fg = c.nord0, bg = c.nord4 },
    CursorIM = { fg = c.nord0, bg = c.nord4 },
    CursorColumn = { bg = c.nord1 },
    CursorLine = { bg = c.nord1 },
    Directory = { fg = c.nord8 },
    EndOfBuffer = { fg = c.nord1 },
    ErrorMsg = { fg = c.nord4, bg = c.nord11 },
    VertSplit = { fg = c.nord2, bg = cfg.bold_separators and c.nord1 or bg },
    WinSeparator = { fg = c.nord2, bg = cfg.bold_separators and c.nord1 or bg },
    Folded = { fg = c.nord3, bg = c.nord1, bold = cfg.bold_headers },
    FoldColumn = { fg = c.nord3, bg = bg },
    SignColumn = { fg = c.nord1, bg = bg },
    LineNr = { fg = c.nord3 },
    CursorLineNr = { fg = c.nord4, bg = cfg.cursorline_bg and c.nord1 or c.none },
    MatchParen = { fg = c.nord8, bg = c.nord3 },
    ModeMsg = { fg = c.nord4 },
    MsgArea = { fg = c.nord4 },
    MoreMsg = { fg = c.nord8 },
    NonText = { fg = c.nord2 },
    Normal = { fg = c.nord4, bg = bg },
    NormalFloat = { fg = c.nord4, bg = bg },
    FloatBorder = { fg = c.nord3, bg = bg },
    Pmenu = { fg = c.nord4, bg = c.nord2 },
    PmenuSel = { fg = c.nord8, bg = c.nord3 },
    PmenuSbar = { fg = c.nord4, bg = c.nord2 },
    PmenuThumb = { fg = c.nord8, bg = c.nord3 },
    Question = { fg = c.nord4 },
    QuickFixLine = { bg = c.nord1, bold = true },
    Search = { fg = c.nord1, bg = c.nord8 },
    IncSearch = { fg = c.nord6, bg = c.nord10, underline = true },
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.nord3 },
    SpellBad = { sp = c.nord11, undercurl = true },
    SpellCap = { sp = c.nord13, undercurl = true },
    SpellLocal = { sp = c.nord5, undercurl = true },
    SpellRare = { sp = c.nord6, undercurl = true },
    StatusLine = { fg = c.nord8, bg = c.nord3 },
    StatusLineNC = { fg = c.nord4, bg = cfg.uniform_status and c.nord3 or c.nord1 },
    StatusLineTerm = { fg = c.nord8, bg = c.nord3 },
    StatusLineTermNC = { fg = c.nord4, bg = cfg.uniform_status and c.nord3 or c.nord1 },
    TabLine = { fg = c.nord4, bg = c.nord1 },
    TabLineFill = { fg = c.nord4, bg = c.nord1 },
    TabLineSel = { fg = c.nord8, bg = c.nord3 },
    TermCursorNC = { bg = c.nord1 },
    Title = { fg = c.nord4, bold = cfg.bold_headers },
    Visual = { bg = c.nord2 },
    VisualNOS = { bg = c.nord2 },
    WarningMsg = { fg = c.nord0, bg = c.nord13 },
    Whitespace = { fg = c.nord2 },
    WildMenu = { fg = c.nord8, bg = c.nord1 },

    -- Standard syntax
    Comment = { fg = c.comment, italic = cfg.italic_comments },
    Constant = { fg = c.nord4 },
    Decorator = { fg = c.nord12 },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.purple },
    Boolean = { fg = c.keyword },
    Float = { fg = c.purple },
    Identifier = { fg = c.nord4 },
    Function = { fg = c.frost },
    Statement = { fg = c.keyword },
    Conditional = { fg = c.keyword },
    Repeat = { fg = c.keyword },
    Label = { fg = c.keyword },
    Operator = { fg = c.keyword },
    Keyword = { fg = c.keyword, italic = cfg.italic_keywords },
    Exception = { fg = c.keyword },
    PreProc = { fg = c.keyword },
    Include = { fg = c.keyword },
    Define = { fg = c.keyword },
    Macro = { fg = c.keyword },
    PreCondit = { fg = c.keyword },
    Type = { fg = c.keyword },
    StorageClass = { fg = c.keyword },
    Structure = { fg = c.keyword },
    Typedef = { fg = c.keyword },
    Special = { fg = c.nord4 },
    SpecialChar = { fg = c.yellow },
    Tag = { fg = c.nord4 },
    Delimiter = { fg = c.nord6 },
    SpecialComment = { fg = c.frost, italic = cfg.italic_comments },
    Debug = { fg = c.error },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.nord3 },
    Error = { fg = c.nord4, bg = c.error },
    Todo = { fg = c.yellow, bg = c.none },
    Annotation = { link = "Decorator" },
    Variable = { link = "Identifier" },
    iCursor = { link = "Cursor" },

    -- Health
    healthError = { fg = c.error, bg = c.nord1 },
    healthSuccess = { fg = c.green, bg = c.nord1 },
    healthWarning = { fg = c.yellow, bg = c.nord1 },

    -- LSP diagnostics
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warn },
    DiagnosticInfo = { fg = c.frost },
    DiagnosticHint = { fg = c.accent },
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.frost },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.accent },

    -- LSP document highlights & signature help
    LspReferenceText = { bg = c.nord3 },
    LspReferenceRead = { bg = c.nord3 },
    LspReferenceWrite = { bg = c.nord3 },
    LspSignatureActiveParameter = { fg = c.frost, underline = true },
    LspCodeLens = { fg = c.comment },

    -- Diff
    DiffAdd = { fg = c.green, bg = cfg.uniform_diffs and c.nord1 or c.nord0, reverse = not cfg.uniform_diffs },
    DiffChange = { fg = c.yellow, bg = cfg.uniform_diffs and c.nord1 or c.nord0, reverse = not cfg.uniform_diffs },
    DiffDelete = { fg = c.error, bg = cfg.uniform_diffs and c.nord1 or c.nord0, reverse = not cfg.uniform_diffs },
    DiffText = { fg = c.keyword, bg = cfg.uniform_diffs and c.nord1 or c.nord0, reverse = not cfg.uniform_diffs },
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },

    -- GitSigns
    GitSignsAdd = { fg = c.green, bg = c.nord0 },
    GitSignsChange = { fg = c.yellow, bg = c.nord0 },
    GitSignsDelete = { fg = c.error, bg = c.nord0 },
    GitSignsUntracked = { fg = c.nord12, bg = c.nord0 },
    GitSignsCurrentLineBlame = { link = "Comment" },

    -- Treesitter defaults
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = c.keyword },
    ["@constant.builtin"] = { link = "Constant" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.macro"] = { link = "Function" },
    ["@keyword"] = { link = "Keyword" },
    ["@string"] = { link = "String" },
    ["@string.regex"] = { link = "SpecialChar" },
    ["@string.escape"] = { fg = c.yellow },
    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@comment"] = { link = "Comment" },
    ["@type"] = { link = "Type" },
    ["@property"] = { fg = c.nord4 },
    ["@parameter"] = { fg = c.nord4 },
    ["@punctuation.delimiter"] = { fg = c.nord6 },
    ["@punctuation.bracket"] = { fg = c.nord6 },
    ["@constructor"] = { fg = c.frost },
    ["@tag"] = { fg = c.keyword },
    ["@tag.attribute"] = { fg = c.nord7 },
    ["@tag.delimiter"] = { fg = c.keyword },
    ["@markup.heading"] = { fg = c.frost, bold = true },
    ["@markup.link"] = { fg = c.frost },
    ["@markup.link.url"] = { fg = c.nord4, underline = true },
    ["@markup.raw"] = { fg = c.nord7 },
    ["@markup.list"] = { fg = c.keyword },
    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },
  }

  -- Apply user highlights
  M.config.on_highlights(hl, c)

  return hl
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "nord"

  -- Intercept here if adding caching in the future:
  -- if try_load_cache() then return end

  local hl = M.build_highlights()

  for group, val in pairs(hl) do
    vim.api.nvim_set_hl(0, group, val)
  end

  if M.config.terminal_colors then
    set_terminal_colors(M.colors)
  end
end

return M
