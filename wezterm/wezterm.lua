local wezterm = require("wezterm")
local act = wezterm.action
local function is_linux()
  return wezterm.target_triple == "x86_64-unknown-linux-gnu"
end
local function font_conf()
  local font = "Iosevka Nerd Font Mono"
  local size = 14.0

  if is_linux() then
    size = size - 3.0
  end

  return font, size
end
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
local font, font_size = font_conf()

return {
  color_scheme = "catppuccin-mocha",
  enable_wayland = true,
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
  window_decorations = "TITLE | RESIZE",
}
