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
      "left_sep_double",
      " ",
      "right_sep",
      "-file_name",
      "left_sep",
      " ",
      "right_sep_double",
      "-branch",
      "left_sep_double",
      " ",
    },
    mid = { "lsp" },
    right = {
      "right_sep",
      "-file_size",
      "left_sep",
      " ",
      "right_sep_double",
      "-line_column",
      "left_sep_double",
      " ",
    },
  },
})
