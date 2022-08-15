local wezterm = require("wezterm")

local font_conf = function()
  local font = "FantasqueSansMono Nerd Font Mono"
  local size = 14.0

  if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    size = 12.0
  end

  return font, size
end

local everblush = {
  foreground = "#dadada",
  background = "#141b1e",
  cursor_bg = "#dadada",
  cursor_fg = "#141b1e",
  cursor_border = "#dadada",
  selection_fg = "141b1e",
  selection_bg = "#dadada",
  scrollbar_thumb = "#b3b9b8",
  split = "#dadada",
  ansi = { "#232a2d", "#e57474", "#8ccf7e", "#e5c76b", "#67b0e8", "#c47fd5", "#6cbfbf", "#b3b9b8" },
  brights = { "#2d3437", "#ef7d7d", "#96d988", "#f4d67a", "#71baf2", "#ce89df", "#67cbe7", "#bdc3c2" },
  tab_bar = {
    background = "#3b4244",
    active_tab = {
      bg_color = "#bab3e5",
      fg_color = "#22292b",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#22292b",
      fg_color = "#dadada",
    },
    inactive_tab_hover = {
      bg_color = "#8ad8ef",
      fg_color = "#22292b",
      italic = true,
    },
    new_tab = {
      bg_color = "#141b1e",
      fg_color = "#dadada",
    },
    new_tab_hover = {
      bg_color = "#ce89df",
      fg_color = "#dadada",
      italic = true,
    },
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
  colors = everblush,
  enable_wayland = true,
  freetype_load_target = "HorizontalLcd",
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
