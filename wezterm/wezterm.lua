local wezterm = require("wezterm")
local act = wezterm.action
local mods = "CTRL|SHIFT"
local keymap = {
  {
    key = "Backspace",
    mods = mods,
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },
  {
    key = "E",
    mods = mods,
    action = act.CharSelect({ copy_on_select = false }),
  },
  {
    key = "S",
    mods = mods,
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "s",
    mods = "CTRL",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "W",
    mods = mods,
    action = act.CloseCurrentPane({ confirm = false }),
  },
  {
    key = "Home",
    mods = mods,
    action = "ScrollToTop",
  },
  {
    key = "H",
    mods = mods,
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "L",
    mods = mods,
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "K",
    mods = mods,
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "J",
    mods = mods,
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "D",
    mods = mods,
    action = act.ShowDebugOverlay,
  },
}
local palette = {
  base = "#191724",
  overlay = "#26233a",
  muted = "#6e6a86",
  text = "#e0def4",
  love = "#eb6f92",
  gold = "#f6c177",
  rose = "#ebbcba",
  pine = "#31748f",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
  highlight_high = "#524f67",
}
local active_tab = {
  bg_color = palette.overlay,
  fg_color = palette.text,
}
local inactive_tab = {
  bg_color = palette.base,
  fg_color = palette.muted,
}
local rose_pine = {
  foreground = palette.text,
  background = palette.base,
  cursor_bg = palette.highlight_high,
  cursor_border = palette.highlight_high,
  cursor_fg = palette.text,
  selection_bg = "#2a283e",
  selection_fg = palette.text,

  ansi = {
    palette.overlay,
    palette.love,
    palette.pine,
    palette.gold,
    palette.foam,
    palette.iris,
    palette.rose,
    palette.text,
  },

  brights = {
    palette.muted,
    palette.love,
    palette.pine,
    palette.gold,
    palette.foam,
    palette.iris,
    palette.rose,
    palette.text,
  },

  tab_bar = {
    background = palette.base,
    active_tab = active_tab,
    inactive_tab = inactive_tab,
    inactive_tab_hover = active_tab,
    new_tab = inactive_tab,
    new_tab_hover = active_tab,
    inactive_tab_edge = palette.muted,
  },
}

return {
  colors = rose_pine,
  enable_wayland = true,
  font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Bold" }),
  font_size = 11.0,
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
}
