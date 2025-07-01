return {
  {
    "cpea2506/relative-toggle.nvim",
    event = "InsertEnter",
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "freddiehaddad/feline.nvim",
    event = "VeryLazy",
    opts = function()
      local ctp_feline = require("catppuccin.groups.integrations.feline")
      ctp_feline.setup({
        assets = {
          mode_icon = "",
        },
      })
      return {
        components = ctp_feline.get(),
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    version = "*",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      render = "first_column",
      enable_tailwind = true,
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      { "echasnovski/mini.icons", opts = {} },
    },
    event = "VeryLazy",
    opts = {
      theme = "catppuccin",
    },
  },
}
