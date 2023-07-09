return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            "_build/",
            ".cache/",
            ".cpcache/",
            ".git/",
            ".mypy_cache/",
            ".node_modules/",
            "__pycache__/",
            "target/classes/",
            ".terraform/",
          },
        },
      },
    },
  },
}
