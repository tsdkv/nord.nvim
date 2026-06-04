-- stylua: ignore start
local p = {
  nord0        = "#2E3440",
  nord1        = "#3B4252",
  nord2        = "#434C5E",
  nord3        = "#4C566A",
  nord3_bright = "#616E88", -- Extra color from the original nord.vim
  nord4        = "#D8DEE9",
  nord5        = "#E5E9F0",
  nord6        = "#ECEFF4",
  nord7        = "#8FBCBB",
  nord8        = "#88C0D0",
  nord9        = "#81A1C1",
  nord10       = "#5E81AC",
  nord11       = "#BF616A",
  nord12       = "#D08770",
  nord13       = "#EBCB8B",
  nord14       = "#A3BE8C",
  nord15       = "#B48EAD",
  none         = "NONE",
}

-- Semantic aliases
p.bg      = p.nord0
p.bg_dim  = p.nord1
p.bg_hl   = p.nord2
p.fg_dim  = p.nord3
p.comment = p.nord3_bright
p.fg      = p.nord4
p.frost   = p.nord8
p.keyword = p.nord9
p.accent  = p.nord10
p.error   = p.nord11
p.warn    = p.nord12
p.yellow  = p.nord13
p.green   = p.nord14
p.purple  = p.nord15
-- stylua: ignore end

return p
