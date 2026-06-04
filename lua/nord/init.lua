local M = {}

M.colors = require("nord.palette")

---@class nord.Config
M.config = {
  transparent = false,
  terminal_colors = true,
  ---@param hl table<string, vim.api.keyset.highlight>
  ---@param c table
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
  local bg = M.config.transparent and c.none or c.bg

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
    VertSplit = { fg = c.nord2, bg = bg },
    WinSeparator = { fg = c.nord2, bg = bg },
    Folded = { fg = c.nord3, bg = c.nord1 },
    FoldColumn = { fg = c.nord3, bg = bg },
    SignColumn = { fg = c.nord1, bg = bg },
    LineNr = { fg = c.nord3 },
    CursorLineNr = { fg = c.nord4, bold = true },
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
    StatusLineNC = { fg = c.nord4, bg = c.nord1 },
    StatusLineTerm = { fg = c.nord8, bg = c.nord3 },
    StatusLineTermNC = { fg = c.nord4, bg = c.nord1 },
    TabLine = { fg = c.nord4, bg = c.nord1 },
    TabLineFill = { fg = c.nord4, bg = c.nord1 },
    TabLineSel = { fg = c.nord8, bg = c.nord3 },
    TermCursorNC = { bg = c.nord1 },
    Title = { fg = c.nord4, bold = true },
    Visual = { bg = c.nord2 },
    VisualNOS = { bg = c.nord2 },
    WarningMsg = { fg = c.nord0, bg = c.nord13 },
    Whitespace = { fg = c.nord2 },
    WildMenu = { fg = c.nord8, bg = c.nord1 },

    -- Standard syntax
    Comment = { fg = c.comment, italic = true },
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
    Keyword = { fg = c.keyword, italic = true },
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
    SpecialComment = { fg = c.frost, italic = true },
    Debug = { fg = c.error },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.nord3 },
    Error = { fg = c.nord4, bg = c.error },
    Todo = { fg = c.yellow, bg = c.none },

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

    -- Diff
    DiffAdd = { fg = c.green, bg = c.nord0 },
    DiffChange = { fg = c.yellow, bg = c.nord0 },
    DiffDelete = { fg = c.error, bg = c.nord0 },
    DiffText = { fg = c.keyword, bg = c.nord0 },

    -- GitSigns
    GitSignsAdd = { fg = c.green, bg = c.nord0 },
    GitSignsChange = { fg = c.yellow, bg = c.nord0 },
    GitSignsDelete = { fg = c.error, bg = c.nord0 },
    GitSignsUntracked = { fg = c.nord12, bg = c.nord0 },

    -- Treesitter defaults
    ["@variable"] = { link = "Identifier" },
    ["@function"] = { link = "Function" },
    ["@keyword"] = { link = "Keyword" },
    ["@string"] = { link = "String" },
    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@comment"] = { link = "Comment" },
    ["@type"] = { link = "Type" },
    ["@property"] = { fg = c.nord4 },
    ["@parameter"] = { fg = c.nord4 },
    ["@punctuation.delimiter"] = { fg = c.nord6 },
    ["@punctuation.bracket"] = { fg = c.nord6 },
    ["@constructor"] = { fg = c.frost },
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
  vim.g.colors_name = "nord"

  -- Intercept here if adding caching in the future:
  -- if try_load_cache() then return end

  local hl = M.build_highlights()

  for group, val in pairs(hl) do
    if type(val) == "string" then
      val = { link = val }
    end
    vim.api.nvim_set_hl(0, group, val)
  end

  if M.config.terminal_colors then
    set_terminal_colors(M.colors)
  end
end

return M
