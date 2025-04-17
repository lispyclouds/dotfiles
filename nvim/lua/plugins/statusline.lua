return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local black = "#080808"
    local blue = "#80a0ff"
    local cyan = "#79dac8"
    local grey = "#303030"
    local red = "#ff5189"
    local violet = "#d183e8"
    local white = "#c6c6c6"
    local left_sep, right_sep = "", ""

    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = black, bg = violet },
            b = { fg = white, bg = grey },
            c = { fg = black, bg = "None" },
          },
          insert = { a = { fg = black, bg = blue } },
          visual = { a = { fg = black, bg = cyan } },
          replace = { a = { fg = black, bg = red } },
          inactive = {
            a = { fg = white, bg = black },
            b = { fg = white, bg = black },
            c = { fg = black, bg = black },
          },
        },
        component_separators = "|",
        section_separators = { left = right_sep, right = left_sep },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = left_sep }, right_padding = 2 },
        },
        lualine_b = { { "filename", path = 4 }, "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "branch", "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = right_sep }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
