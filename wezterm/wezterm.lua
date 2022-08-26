local wezterm = require("wezterm")

local font_conf = function()
  local font = "FantasqueSansMono Nerd Font Mono"
  local size = 14.0

  if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    size = 12.0
  end

  return font, size
end

local keymap = {
  {
    key = "Delete",
    mods = "CTRL|SHIFT",
    action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }),
  },
  {
    key = "S",
    mods = "CTRL|SHIFT",
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "s",
    mods = "CTRL",
    action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "W",
    mods = "CTRL|SHIFT",
    action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
  },
  {
    key = "Home",
    mods = "CTRL|SHIFT",
    action = "ScrollToTop",
  },
}

local kanagawa = {
  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  background = "#1f1f28",
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  cursor_bg = "#c8c093",
  cursor_border = "#c8c093",
  cursor_fg = "#c8c093",
  foreground = "#dcd7ba",
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  scrollbar_thumb = "#16161d",
  selection_bg = "#2d4f67",
  selection_fg = "#c8c093",
  split = "#16161d",
}

local font, font_size = font_conf()

return {
  colors = kanagawa,
  enable_wayland = true,
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
