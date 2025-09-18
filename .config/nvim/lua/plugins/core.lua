return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
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
}
