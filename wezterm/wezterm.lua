local wezterm = require("wezterm")

local act = wezterm.action

local function is_linux() return wezterm.target_triple == "x86_64-unknown-linux-gnu" end

local function font_conf()
  local font = "JetBrainsMono Nerd Font Mono"
  local size = 14.0

  if is_linux() then size = size - 4.0 end

  return font, size
end

local keymap = {
  {
    key = "Backspace",
    mods = "CTRL|SHIFT",
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },
  {
    key = "E",
    mods = "CTRL|SHIFT",
    action = act.CharSelect({ copy_on_select = false }),
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

local window_decoration = "TITLE | RESIZE"
if is_linux() then window_decoration = "RESIZE" end

return {
  colors = {
    foreground = "#c0caf5",
    background = "#1a1b26",
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    cursor_fg = "#1a1b26",
    selection_bg = "#33467c",
    selection_fg = "#c0caf5",
    scrollbar_thumb = "#6B7280",
    ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
    brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
    tab_bar = {
      inactive_tab_edge = "#16161e",
      background = "#191b28",
      active_tab = {
        fg_color = "#7aa2f7",
        bg_color = "#1a1b26",
      },
      inactive_tab = {
        bg_color = "#16161e",
        fg_color = "#545c7e",
      },
      inactive_tab_hover = {
        bg_color = "#16161e",
        fg_color = "#7aa2f7",
      },
      new_tab_hover = {
        bg_color = "#16161e",
        fg_color = "#7aa2f7",
      },
      new_tab = {
        bg_color = "#16161e",
        fg_color = "#7aa2f7",
      },
    },
  },
  enable_wayland = true,
  font_size = font_size,
  font = wezterm.font(font, { weight = "Bold" }),
  force_reverse_video_cursor = true,
  freetype_load_target = "HorizontalLcd",
  hide_tab_bar_if_only_one_tab = true,
  keys = keymap,
  tab_bar_at_bottom = true,
  window_decorations = window_decoration,
}
