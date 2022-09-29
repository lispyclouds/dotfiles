local wezterm = require("wezterm")

local act = wezterm.action

local function is_linux() return wezterm.target_triple == "x86_64-unknown-linux-gnu" end

local function font_conf()
  local font = "FantasqueSansMono Nerd Font Mono"
  local size = 14.0

  if is_linux() then size = 12.0 end

  return font, size
end

local keymap = {
  {
    key = "Backspace",
    mods = "CTRL|SHIFT",
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },
  {
    key = "S",
    mods = "CTRL|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "s",
    mods = "CTRL",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "W",
    mods = "CTRL|SHIFT",
    action = act.CloseCurrentPane({ confirm = false }),
  },
  {
    key = "Home",
    mods = "CTRL|SHIFT",
    action = "ScrollToTop",
  },
}

local font, font_size = font_conf()

local tundra_colors = {
  foreground = "#D1D5DB",
  background = "#111827",

  cursor_fg = "#111827",
  cursor_bg = "#D1D5DB",
  cursor_border = "#111827",

  selection_fg = "#DDD6FE",
  selection_bg = "#374151",

  scrollbar_thumb = "#6B7280",
  split = "#6B7280",

  ansi = {
    "#6B7280",
    "#FCA5A5",
    "#B1E3AD",
    "#FBC19D",
    "#BAE6FD",
    "#957FB8",
    "#DDD6FE",
    "#A5F3FC",
  },

  brights = {
    "#6B7280",
    "#FCA5A5",
    "#B1E3AD",
    "#FBC19D",
    "#BAE6FD",
    "#938AA9",
    "#DDD6FE",
    "#A5F3FC",
  },
}

return {
  colors = tundra_colors,
  enable_wayland = true,
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
