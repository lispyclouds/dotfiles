local windline = require("windline")
local helper = require("windline.helpers")
local sep = helper.separators
local vim_components = require("windline.components.vim")

local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
  Black = { "white", "black" },
  White = { "black", "white" },
  Inactive = { "InactiveFg", "InactiveBg" },
  Active = { "ActiveFg", "ActiveBg" },
}
local config = {}

config.divider = { b_components.divider, hl_list.Inactive }
config.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
config.line_col_inactive = { b_components.line_col, hl_list.Inactive }
config.progress_inactive = { b_components.progress, hl_list.Inactive }

config.vi_mode = {
  name = "vi_mode",
  hl_colors = {
    Normal = { "black", "red", "bold" },
    Insert = { "black", "green", "bold" },
    Visual = { "black", "yellow", "bold" },
    Replace = { "black", "blue_light", "bold" },
    Command = { "black", "magenta", "bold" },
    NormalBefore = { "red", "black" },
    InsertBefore = { "green", "black" },
    VisualBefore = { "yellow", "black" },
    ReplaceBefore = { "blue_light", "black" },
    CommandBefore = { "magenta", "black" },
    NormalAfter = { "white", "red" },
    InsertAfter = { "white", "green" },
    VisualAfter = { "white", "yellow" },
    ReplaceAfter = { "white", "blue_light" },
    CommandAfter = { "white", "magenta" },
  },
  text = function()
    return {
      { sep.left_rounded, state.mode[2] .. "Before" },
      { state.mode[1] .. " ", state.mode[2] },
      { sep.left_rounded, state.mode[2] .. "After" },
    }
  end,
}

config.lsp = {
  name = "diagnostic",
  hl_colors = {
    red = { "red", "black" },
    yellow = { "yellow", "black" },
    blue = { "blue", "black" },
  },
  width = 90,
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        { lsp_comps.lsp_error({ format = " \u{f071} %s" }), "red" },
        { lsp_comps.lsp_warning({ format = " \u{f071} %s" }), "yellow" },
        { lsp_comps.lsp_hint({ format = " \u{f685} %s" }), "blue" },
      }
    end

    return ""
  end,
}

config.file = {
  name = "file",
  hl_colors = {
    default = hl_list.White,
  },
  text = function()
    return {
      { b_components.cache_file_icon({ default = "?" }), "default" },
      { " ", "default" },
      { b_components.cache_file_name("[No Name]", "unique") },
      { b_components.file_modified("[+] ") },
      { b_components.cache_file_size() },
    }
  end,
}

config.right = {
  hl_colors = {
    sep_before = { "black_light", "black" },
    sep_after = { "black_light", "black" },
    text = { "white", "black_light" },
  },
  text = function()
    return {
      { sep.left_rounded, "sep_before" },
      { "\u{fa70}", "text" },
      { b_components.line_col_lua },
      { b_components.progress_lua },
      { sep.right_rounded, "sep_after" },
    }
  end,
}

config.git = {
  name = "git",
  width = 90,
  hl_colors = {
    green = { "green", "black" },
    red = { "red", "black" },
    blue = { "blue", "black" },
  },
  text = function(bufnr)
    if git_comps.is_git(bufnr) then
      return {
        { " " },
        { git_comps.diff_added({ format = "+%s" }), "green" },
        { git_comps.diff_removed({ format = " -%s" }), "red" },
        { git_comps.diff_changed({ format = " ~%s" }), "blue" },
      }
    end

    return ""
  end,
}

local default = {
  filetypes = { "default" },
  active = {
    { " ", hl_list.Active },
    config.vi_mode,
    config.file,
    { vim_components.search_count(), { "red", "white" } },
    { sep.right_rounded, hl_list.Active },
    config.lsp,
    config.git,
    config.divider,
    { git_comps.git_branch({ icon = " \u{e0a0} " }), { "green", "black" }, 90 },
    { " ", hl_list.Active },
    config.right,
    { " ", hl_list.Active },
  },
  inactive = {
    config.file_name_inactive,
    config.divider,
    config.divider,
    config.line_col_inactive,
    { "?", hl_list.Inactive },
    config.progress_inactive,
  },
}

local explorer = {
  filetypes = { "NvimTree" },
  active = {
    { " \u{e5ff} ", { "white", "black_light" } },
    { helper.separators.slant_right, { "black_light", "NormalBg" } },
    config.divider,
    { b_components.file_name("?"), { "NormalFg", "NormalBg" } },
  },
  always_active = true,
  show_last_status = true,
}

windline.setup({
  colors_name = function(colors)
    colors.ActiveBg = "NONE"
    colors.InactiveBg = "NONE"
    colors.NormalBg = "NONE"

    return colors
  end,
  statuslines = {
    default,
    explorer,
  },
})
