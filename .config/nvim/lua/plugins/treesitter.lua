return {
  {
    "nvim-treesitter/nvim-treesitter",
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
    "vrischmann/tree-sitter-templ",
    ft = { "templ" },
  },
  {
    "aaronik/treewalker.nvim",
    event = "LazyFile",
    keys = {
      {
        "ah",
        mode = { "n", "v", "o" },
        "<cmd>Treewalker Up<cr>",
        desc = "Go to parent node",
      },
      {
        "al",
        mode = { "n", "v", "o" },
        "<cmd>Treewalker Down<cr>",
        desc = "Go to child node",
      },
      {
        "aj",
        mode = { "n", "v", "o" },
        "<cmd>Treewalker Right<cr>",
        desc = "Go to next node",
      },
      {
        "ak",
        mode = { "n", "v", "o" },
        "<cmd>Treewalker Left<cr>",
        desc = "Go to previous node",
      },
      {
        "<leader><c-k>",
        mode = { "n" },
        "<cmd>Treewalker SwapUp<cr>",
        desc = "Swaps previous node",
      },
      {
        "<leader><c-j>",
        mode = { "n" },
        "<cmd>Treewalker SwapDown<cr>",
        desc = "Swaps next node",
      },
      {
        "<leader><c-h>",
        mode = { "n" },
        "<cmd>Treewalker SwapLeft<cr>",
        desc = "Swaps next node",
      },
      {
        "<leader><c-l>",
        mode = { "n" },
        "<cmd>Treewalker SwapRight<cr>",
        desc = "Swaps next node",
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
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      enable = true,
    },
  },
}
