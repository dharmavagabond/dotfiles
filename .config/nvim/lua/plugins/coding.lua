return {
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    branch = "master",
    dependencies = {
      "ray-x/guihua.lua",
    },
    opts = {
      run_in_floaterm = true,
      tag_transform = "snakecase",
      test_runner = "gotestsum",
      trouble = true,
    },
  },
  {
    "rafaelsq/nvim-goc.lua",
    ft = { "go" },
    keys = {
      {
        "<leader>gcf",
        mode = { "n" },
        function()
          require("nvim-goc").Coverage()
        end,
        desc = "Runs Coverage for whole file",
      },
      {
        "<leader>gct",
        mode = { "n" },
        function()
          require("nvim-goc").CoverageFunc()
        end,
        desc = "Runs Coverage for selected test unit",
      },
      {
        "<leader>gcc",
        mode = { "n" },
        function()
          require("nvim-goc").ClearCoverage()
        end,
        desc = "Clears Coverage highlights",
      },
    },
    opts = {
      verticalSplit = false,
    },
    config = function(_, opts)
      vim.opt.switchbuf = "useopen"
      require("nvim-goc").setup(opts)
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = { "~/.config/nvim/lua/snippets" },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_and_accept" },
      },
    },
  },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = "VeryLazy",
    opts = {
      enabled = true,
      condition = function(buf)
        return vim.fn.getbufvar(buf, "&modifiable") == 1
          and vim.fn.bufname(buf) ~= ""
          and vim.fn.getbufvar(buf, "&buftype") == ""
      end,
      debounce_delay = 10000,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opt = {
      automatic_installation = true,
      ensure_installed = { "delve" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
          is_test_file = function(file_path)
            return string.match(file_path, "test")
          end,
        },
      },
    },
  },
  {
    "marilari88/neotest-vitest",
    event = "VeryLazy",
  },
  {
    "mrcjkb/neotest-haskell",
    event = "VeryLazy",
  },
}
