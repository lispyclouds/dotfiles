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

return {
  color_scheme = "Tokyo Night Moon",
  enable_wayland = true,
  font = wezterm.font_with_fallback({
    { family = "Iosevka Term", weight = "Bold" },
    "Symbols Nerd Font Mono",
  }),
  font_size = 11.0,
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
}
