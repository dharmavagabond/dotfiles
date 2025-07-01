return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      integrations = {
        avante = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        gitsigns = true,
        illuminate = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        treesitter = true,
        treesitter_context = true,
        ufo = true,
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = true,
          alt_background = false,
        },
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = true,
          },
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
}
