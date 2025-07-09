return {
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
    opts = function(_, opts)
      local bufferline = require("catppuccin.groups.integrations.bufferline")
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      opts.highlights = bufferline.get({
        custom = {
          mocha = {
            indicator_selected = { fg = mocha.sapphire },
          },
        },
      })
    end,
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
      theme = "catppuccin",
    },
  },
}
