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
    "echasnovski/mini.ai",
    enabled = false,
  },
  {
    "denialofsandwich/sudo.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = true,
  },
}
