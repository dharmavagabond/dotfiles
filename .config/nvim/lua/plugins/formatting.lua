return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        html = { "htmlbeautifier" },
        javascript = { "biome-check" },
        typescript = { "biome-check" },
        json = { "fixjson" },
        css = { "stylelint" },
        markdown = { "mdformat" },
        go = { "goimports-reviser", "golines", "gofumpt" },
        proto = { "buf" },
        sh = { "beautysh", "shfmt" },
        sql = { "sqruff" },
        templ = { "templ" },
        toml = { "taplo" },
        tsp = { "typespec" },
        yaml = { "yamlfix" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        sqruff = {
          cwd = require("conform.util").root_file({
            ".sqruff",
            ".editorconfig",
          }),
        },
        yamlfix = {
          env = {
            YAMLFIX_SEQUENCE_STYLE = "block_style",
            YAMLFIX_WHITELINES = 1,
            YAMLFIX_SECTION_WHITELINES = 1,
          },
        },
      },
    },
  },
}
