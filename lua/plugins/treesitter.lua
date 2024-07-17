return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "gitignore",
        "python",
        "typescript",
        "scss",
        "sql",
        "vim",
        "yaml",
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
