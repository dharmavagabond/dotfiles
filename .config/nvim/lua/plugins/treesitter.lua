return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    opts = {
      autotag = {
        enable = true,
      },
      highlight = {
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        "css",
        "go",
        "gomod",
        "gosum",
        "sql",
        "templ",
        "starlark",
        "typescript",
      },
    },
  },
  {
    "drybalka/tree-climber.nvim",
    event = "LazyFile",
    keys = {
      {
        "ah",
        mode = { "n", "v", "o" },
        function()
          require("tree-climber").goto_parent()
        end,
        desc = "Go to parent node",
      },
      {
        "al",
        mode = { "n", "v", "o" },
        function()
          require("tree-climber").goto_child()
        end,
        desc = "Go to child node",
      },
      {
        "aj",
        mode = { "n", "v", "o" },
        function()
          require("tree-climber").goto_next()
        end,
        desc = "Go to next node",
      },
      {
        "ak",
        mode = { "n", "v", "o" },
        function()
          require("tree-climber").goto_prev()
        end,
        desc = "Go to previous node",
      },
      {
        "inn",
        mode = { "v", "o" },
        function()
          require("tree-climber").select_node()
        end,
        desc = "Selects node",
      },
      {
        "<leader><c-k>",
        mode = { "n" },
        function()
          require("tree-climber").swap_prev()
        end,
        desc = "Swaps previous node",
      },
      {
        "<leader><c-j>",
        mode = { "n" },
        function()
          require("tree-climber").swap_next()
        end,
        desc = "Swaps next node",
      },
      {
        "<leader><c-i>",
        mode = { "n" },
        function()
          require("tree-climber").highlight_node()
        end,
        desc = "Highlights node",
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
  "m-demare/hlargs.nvim",
}
