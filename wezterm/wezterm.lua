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
  {
    key = "F",
    mods = mods,
    action = act.Search({ CaseInSensitiveString = "" }),
  },
  {
    key = "Enter",
    mods = mods,
    action = act.TogglePaneZoomState,
  },
  {
    key = "j",
    mods = "CTRL",
    action = wezterm.action.SendKey({ key = "DownArrow" }),
  },
  {
    key = "k",
    mods = "CTRL",
    action = wezterm.action.SendKey({ key = "UpArrow" }),
  },
}

return {
  colors = { -- https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras/wezterm
    foreground = "#ffffff",
    background = "#16181a",

    cursor_bg = "#ffffff",
    cursor_fg = "#16181a",
    cursor_border = "#ffffff",

    selection_fg = "#ffffff",
    selection_bg = "#3c4048",

    scrollbar_thumb = "#16181a",
    split = "#16181a",

    ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
  },
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
  window_background_opacity = 0.95,
}
