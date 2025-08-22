return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      render = "virtual",
      virtual_symbol = "",
      virtual_symbol_position = "eol",
      virtual_symbol_suffix = "",
      enable_tailwind = true,
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = "SmiteshP/nvim-navic",
    event = "VeryLazy",
    opts = {
      theme = "rose-pine",
    },
  },
}
