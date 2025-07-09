return {
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = {
      linters_by_ft = {
        ["*"] = { "editorconfig-checker", "codespell" },
        ["yaml.yml"] = { "actionlint", "yamllint" },
        css = { "stylelint" },
        editorconfig = { "editorconfig-checker" },
        html = { "htmlhint", "tidy" },
        markdown = { "markdownlint-cli2" },
        proto = { "buf_lint" },
        sql = { "sqruff" },
        zsh = { "zsh" },
        dockerfile = { "hadolint" },
      },
      linters = {
        tidy = {
          ignore_exitcode = true,
        },
      },
    },
  },
}
