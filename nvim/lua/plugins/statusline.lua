return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local colors = {
        black = "#080808",
        blue = "#80a0ff",
        cyan = "#79dac8",
        grey = "#303030",
        red = "#ff5189",
        violet = "#d183e8",
        white = "#c6c6c6",
      }
      local left_sep, right_sep = "", ""
      local theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.black, bg = "None" },
        },
        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },
        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.black, bg = colors.black },
        },
      }

      require("lualine").setup({
        options = {
          theme = theme,
          component_separators = "|",
          section_separators = { left = left_sep, right = right_sep },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = left_sep }, right_padding = 2 },
          },
          lualine_b = { "filename", "diagnostics" },
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
  },
}
