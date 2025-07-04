return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          },
        },
      },
      setup = {
        gopls = function()
          local cfg = require("go.lsp").config()
          require("lspconfig").gopls.setup(cfg)
          return true
        end,
      },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "LazyFile",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
      })
    end,
  },
}
