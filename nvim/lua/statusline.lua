require("staline").setup({
  defaults = {
    left_separator = "",
    right_separator = "",
  },
  sections = {
    left = {
      " ",
      "right_sep_double",
      "-mode",
      "-file_name",
      "left_sep",
      " ",
      "right_sep",
      "-branch",
      "left_sep_double",
      " ",
    },
    mid = { "lsp" },
    right = {
      " ",
      "right_sep_double",
      "-file_size",
      "-line_column",
      "left_sep_double",
      " ",
    },
  },
})
