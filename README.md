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
  transparent = false, -- Disable background colors
  terminal_colors = true,

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

## Acknowledgements

- [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim): A popular port, but diverges from the original colors and requires huge customization to match.
- [gbprod/nord.nvim](https://github.com/gbprod/nord.nvim): Another good port that is close to the original, but includes built-in support for extra plugins.
