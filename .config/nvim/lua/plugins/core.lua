return {
  {
    "LazyVim/LazyVim",
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "kenn7/vim-arsync",
    event = "VeryLazy",
    dependencies = {
      "prabirshrestha/async.vim",
    },
  },
  {
    "nvim-mini/mini.ai",
    enabled = false,
  },
  {
    "denialofsandwich/sudo.nvim",
    event = "CmdlineEnter",
    dependencies = "MunifTanjim/nui.nvim",
    config = true,
  },
  {
    "PriceHiller/z.nvim",
    opts = {
      z_cmd = function()
        return { "zoxide", "query", "--exclude", vim.fn.getcwd() }
      end,
      z_comp_cmd = function()
        return { "zoxide", "query", "--list", "--exclude", vim.fn.getcwd() }
      end,
      z_dir_changed_cmd = { "zoxide", "add" },
    },
  },
  {
    "wsdjeg/rooter.nvim",
    opts = {
      command = "tcd",
    },
  },
  {
    "polirritmico/lazy-local-patcher.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {
      debug = {
        enabled = true,
        show_scores = true,
      },
    },
    lazy = false,
    keys = {
      {
        "ff",
        function()
          require("fff").find_files()
        end,
        desc = "FFFind files",
      },
      {
        "fg",
        function()
          require("fff").live_grep()
        end,
        desc = "LiFFFe grep",
      },
      {
        "fz",
        function()
          require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
        end,
        desc = "Live fffuzy grep",
      },
      {
        "fc",
        function()
          require("fff").live_grep({ query = vim.fn.expand("<cword>") })
        end,
        desc = "Search current word",
      },
    },
  },
}
