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
    event = "VeryLazy",
    opts = {
      auto_enable = true,
      minimap_width = 15,
      screen_bounds = "background",
      window_border = "",
    },
    config = function(_, opts)
      local codewindow = require("codewindow")
      codewindow.setup(opts)
      codewindow.apply_default_keybinds()
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>ff",
        function()
          Snacks.picker.files({ hidden = true, follow = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({
            cwd = vim.fn.stdpath("config"),
            hidden = true,
            follow = true,
          })
        end,
        desc = "Find Config File",
      },
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
  },
}
