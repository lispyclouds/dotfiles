local wezterm = require("wezterm")

local font_conf = function()
  local font = "FantasqueSansMono Nerd Font Mono"
  local size = 14.0

  if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    size = 12.0
  end

  return font, size
end

local catppuccin_mocha = {
  foreground = "#CDD6F4",
  background = "#1E1E2E",
  cursor_bg = "#F5E0DC",
  cursor_fg = "#1E1E2E",
  cursor_border = "#F5E0DC",
  selection_fg = "#1E1E2E",
  selection_bg = "#F5E0DC",
  ansi = {
    "#43465A",
    "#F38BA8",
    "#A6E3A1",
    "#F9E2AF",
    "#87B0F9",
    "#F5C2E7",
    "#94E2D5",
    "#CDD6F4",
  },
  brights = {
    "#43465A",
    "#F38BA8",
    "#A6E3A1",
    "#F9E2AF",
    "#87B0F9",
    "#F5C2E7",
    "#94E2D5",
    "#A1A8C9",
  },
}

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

local font, font_size = font_conf()

return {
  colors = catppuccin_mocha,
  enable_wayland = true,
  freetype_load_target = "HorizontalLcd",
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
