return {
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    branch = "master",
    dependencies = {
      "ray-x/guihua.lua",
    },
    opts = {
      luasnip = true,
      lsp_cfg = false,
      lsp_gofumpt = true,
      run_in_floaterm = true,
      tag_transform = "snakecase",
      test_runner = "richgo",
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
    "rcarriga/nvim-dap-ui",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "nvim-neotest/neotest",
    event = "LazyFile",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = {
      adapters = {
        -- ["neotest-bun"] = {
        -- 	filter_dir = function(name)
        -- 		return name ~= "node_modules"
        -- 	end,
        -- 	is_test_file = function(file_path)
        -- 		return string.match(file_path, "test")
        -- 	end,
        -- },
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
  { "marilari88/neotest-vitest" },
  -- { "arthur944/neotest-bun" },
}
