return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = {
          focus = true,
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = "nvim-mini/mini.icons",
    keys = {
      {
        "<leader>fe",
        "<cmd>Oil --float<CR>",
        desc = "File Explorer",
      },
    },
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
      },
    },
  },
  {
    "malewicz1337/oil-git.nvim",
    dependencies = { "stevearc/oil.nvim" },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "LazyFile",
    dependencies = "kevinhwang91/promise-async",
    keys = {
      {
        "zR",
        mode = { "n" },
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Opens all folds",
      },
      {
        "zM",
        mode = { "n" },
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Closes all folds",
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "LazyFile",
    branch = "master",
  },
  {
    "folke/twilight.nvim",
    enabled = false,
    event = "CmdlineEnter",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = "<abbrev_sha> | <committer> (<author_time:%R>) · <summary>",
    },
  },
  {
    "gorbit99/codewindow.nvim",
    enabled = false,
    event = "LazyFile",
    keys = {
      {
        "<leader>mm",
        function()
          local cw = require("codewindow")
          cw.toggle_minimap()
        end,
      },
    },
    opts = {
      auto_enable = true,
      minimap_width = 10,
      screen_bounds = "background",
      window_border = "",
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    enabled = false,
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
        "<leader><space>",
        function()
          require("fff").find_files()
        end,
        desc = "fffind files",
      },
      {
        "fc",
        function()
          require("fff").find_files_in_dir(vim.fn.stdpath("config"))
        end,
        desc = "Find config files",
      },
      {
        "<leader>fg",
        function()
          require("fff").live_grep()
        end,
        desc = "LiFFFe grep",
      },
      {
        "<leader>fz",
        function()
          require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
        end,
        desc = "Live fffuzy grep",
      },
      {
        "<leader>fw",
        function()
          require("fff").live_grep_under_cursor()
        end,
        mode = { "n", "x" },
        desc = "Search current word / selection",
      },
    },
  },
  {
    "cpea2506/relative-toggle.nvim",
    event = "InsertEnter",
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader><F5>", "<cmd>UndotreeToggle<cr>", desc = "Toggles Undotree sidebar" },
    },
  },
  {
    "toppair/peek.nvim",
    event = "VeryLazy",
    build = "deno task --quiet build:fast",
    init = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    opts = {
      app = "zen-browser",
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    enabled = true,
    event = "BufEnter",
    keys = {
      {
        "<M-S-h>",
        function()
          require("smart-splits").resize_left()
        end,
      },
      {
        "<M-S-l>",
        function()
          require("smart-splits").resize_right()
        end,
      },
      {
        "<M-S-j>",
        function()
          require("smart-splits").resize_down()
        end,
      },
      {
        "<M-S-k>",
        function()
          require("smart-splits").resize_up()
        end,
      },
      {
        "<C-M-S-h>",
        function()
          require("smart-splits").swap_buf_left()
        end,
      },
      {
        "<C-M-S-l>",
        function()
          require("smart-splits").swap_buf_right()
        end,
      },
      {
        "<C-M-S-j>",
        function()
          require("smart-splits").swap_buf_down()
        end,
      },
      {
        "<C-M-S-k>",
        function()
          require("smart-splits").swap_buf_up()
        end,
      },
    },
    build = "./kitty/install-kittens.bash",
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
}
