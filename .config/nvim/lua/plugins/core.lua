return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
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
}
