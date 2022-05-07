local wezterm = require("wezterm")

-- TODO: Anything better?
local which_os = function()
  if wezterm.home_dir:find("^/Users") ~= nil then
    return "Mac"
  else
    return "Linux"
  end
end

local font_conf = function()
  local font = "JetBrainsMono Nerd Font Mono"
  local size = 10.0

  if which_os() == "Mac" then
    size = 12.0
  end

  return font, size
end

local catppuccin = {
  foreground = "#D9E0EE",
  background = "#1E1E2E",
  cursor_bg = "#F5E0DC",
  cursor_fg = "#1E1E2E",
  cursor_border = "#F5E0DC",
  selection_fg = "#575268",
  selection_bg = "#D9E0EE",
  ansi = {
    "#6E6C7E",
    "#F28FAD",
    "#ABE9B3",
    "#FAE3B0",
    "#96CDFB",
    "#F5C2E7",
    "#89DCEB",
    "#C3BAC6",
  },
  brights = {
    "#988BA2",
    "#F28FAD",
    "#ABE9B3",
    "#FAE3B0",
    "#96CDFB",
    "#F5C2E7",
    "#89DCEB",
    "#D9E0EE",
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
  colors = catppuccin,
  enable_wayland = true,
  freetype_load_target = "HorizontalLcd",
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
}
