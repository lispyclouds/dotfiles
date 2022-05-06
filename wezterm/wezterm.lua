local wezterm = require("wezterm")

local function get_font_conf()
  local font = "JetBrainsMono Nerd Font Mono"
  local size = 12.0
  local os = io.popen("uname -s", "r"):read("*l") -- TODO: Faster

  if os == "Darwin" then
    size = 14.0
  end

  return font, size
end

local font, font_size = get_font_conf()

local catppuccin = {
  foreground = "#D9E0EE",
  background = "#1E1E2E",
  cursor_bg = "#F5E0DC",
  cursor_fg = "#1E1E2E",
  cursor_border = "#F5E0DC",
  selection_fg = "#575268",
  selection_bg = "#D9E0EE",
  ansi = { "#6E6C7E", "#F28FAD", "#ABE9B3", "#FAE3B0", "#96CDFB", "#F5C2E7", "#89DCEB", "#C3BAC6" },
  brights = { "#988BA2", "#F28FAD", "#ABE9B3", "#FAE3B0", "#96CDFB", "#F5C2E7", "#89DCEB", "#D9E0EE" },
}

return {
  font = wezterm.font(font),
  font_size = font_size,
  colors = catppuccin,
  keys = {
    {
      key = "K",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }),
    },
    {
      key = "s",
      mods = "CTRL",
      action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
      key = "S",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
    },
  },
}
