return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local colours = {
      black = "#080808",
      blue = "#80a0ff",
      cyan = "#79dac8",
      grey = "#303030",
      red = "#ff5189",
      violet = "#d183e8",
      white = "#c6c6c6",
    }
    local left_sep, right_sep = "", ""

    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = colours.black, bg = colours.violet },
            b = { fg = colours.white, bg = colours.grey },
            c = { fg = colours.black, bg = "None" },
          },
          insert = { a = { fg = colours.black, bg = colours.blue } },
          visual = { a = { fg = colours.black, bg = colours.cyan } },
          replace = { a = { fg = colours.black, bg = colours.red } },
          inactive = {
            a = { fg = colours.white, bg = colours.black },
            b = { fg = colours.white, bg = colours.black },
            c = { fg = colours.black, bg = colours.black },
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
