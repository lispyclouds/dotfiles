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

local font, font_size = font_conf()

return {
  color_scheme = "tokyonight",
  enable_wayland = true,
  freetype_load_target = "HorizontalLcd",
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
