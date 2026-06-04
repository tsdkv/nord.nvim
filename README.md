# nord.nvim

As close to the original [nordtheme/vim](https://github.com/nordtheme/vim) as possible, but loads 10 times faster.

It does not include third-party plugin support, providing just the core colors and an easy hook to add your own highlights.

## Installation

Using Neovim's native package manager (`vim.pack.add`):

```lua
vim.pack.add({
  "https://github.com/tsdkv/nord.nvim"
})

require("nord").setup({
  transparent = false,
  terminal_colors = true,

  -- Text Styling
  italic_comments = false,
  italic_keywords = false,
  bold_headers = true,      -- Affects Titles, Folds, etc.

  -- Editor UI Tweaks
  uniform_diffs = false,    -- Uses Nord backgrounds for Git diffs
  uniform_status = false,   -- Makes active and inactive statuslines the same color
  bold_separators = false,  -- Makes vertical window separators thicker/darker
  cursorline_bg = false,    -- Adds a background color to the current line number

  -- Add or override highlights
  on_highlights = function(hl, c)
    -- Example: Make comments bold and use the frost color
    hl.Comment = { fg = c.frost, bold = true }

    -- Example: Add telescope support
    hl.TelescopeNormal = { bg = c.nord1 }
    hl.TelescopeBorder = { fg = c.nord3, bg = c.nord1 }
  end,
})

vim.cmd.colorscheme("nord")
```

## Migration from nord.vim

If you are migrating from the original `nord.vim`, the old `g:nord_*` global variables have been replaced with a cleaner Lua table in `setup()`:

| Original `nord.vim` variable | `nord.nvim` config option |
|------------------------------|---------------------------|
| `g:nord_italic_comments` | `italic_comments` |
| `g:nord_italic` | `italic_keywords` |
| `g:nord_bold` | `bold_headers` |
| `g:nord_uniform_diff_background`| `uniform_diffs` |
| `g:nord_uniform_status_lines` | `uniform_status` |
| `g:nord_bold_vertical_split_line`| `bold_separators` |
| `g:nord_cursor_line_number_background`| `cursorline_bg` |

*Note: Global toggles like `g:nord_underline` were removed in favor of native Neovim styling (e.g., undercurls for spelling).*

## The Palette

In `on_highlights(hl, c)`, the `c` argument exposes the full palette. You can use raw Nord colors (`c.nord0` ... `c.nord15`) or semantic aliases:

- `c.bg` (`nord0`)
- `c.bg_dim` (`nord1`)
- `c.bg_hl` (`nord2`)
- `c.fg_dim` (`nord3`)
- `c.comment` (`nord3_bright`)
- `c.fg` (`nord4`)
- `c.frost` (`nord8`)
- `c.keyword` (`nord9`)
- `c.accent` (`nord10`)
- `c.error` (`nord11`)
- `c.orange` (`nord12`)
- `c.warn` (`nord13`)
- `c.yellow` (`nord13`)
- `c.green` (`nord14`)
- `c.purple` (`nord15`)

## Acknowledgements

- [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim): A popular port, but diverges from the original colors and requires huge customization to match.
- [gbprod/nord.nvim](https://github.com/gbprod/nord.nvim): Another good port that is close to the original, but includes built-in support for extra plugins.
