# nord.nvim

A clean and minimal [Nord](https://www.nordtheme.com/) theme for Neovim, written in Lua.

This theme is designed to accurately reflect the original [nordtheme/vim](https://github.com/nordtheme/vim) colors while keeping the codebase as simple as possible. It has zero built-in plugin dependencies, but allows you to easily add your own highlights.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "tsdkv/nord.nvim",
  config = function()
    require("nord").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      transparent = false,
      terminal_colors = true,
      
      -- Custom overrides hook
      on_highlights = function(hl, c)
        -- Example: Make comments bold and use the frost color
        hl.Comment = { fg = c.frost, bold = true }
        
        -- Example: Add telescope support
        hl.TelescopeNormal = { bg = c.nord1 }
        hl.TelescopeBorder = { fg = c.nord3, bg = c.nord1 }
      end,
    })
    vim.cmd.colorscheme("nord")
  end
}
```

## Configuration

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `transparent` | boolean | `false` | Disables background color for Normal, NormalFloat, and other core UI elements. |
| `terminal_colors` | boolean | `true` | Configures the 16 colors used when opening a `:terminal` in Neovim. |
| `on_highlights` | function | `function(hl, c) end` | A hook that lets you add or override any highlight group. |

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
- `c.warn` (`nord12`)
- `c.yellow` (`nord13`)
- `c.green` (`nord14`)
- `c.purple` (`nord15`)
