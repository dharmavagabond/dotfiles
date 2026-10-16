return {
  {
    "carderne/pi-nvim",
    opts = {
      socket_path = nil,
      set_default_keymaps = true,
    },
  },
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      provider = "claude",
      context_window = 2048,
      throttle = 300,
      debounce = 200,
      provider_options = {
        claude = {
          api_key = "TERM",
          end_point = "http://127.0.0.1:10100/inference/anthropic/v1/messages",
          model = "minicpm5-2b:gguf:q8",
          max_tokens = 128,
          stream = true,
          optional = {
            temperature = 0.2,
            top_p = 0.9,
            frequency_penalty = 0.3,
            thinking = { type = "disabled" },
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          next = "<C-;>",
          accept = "<C-l>",
          dismiss = "<C-e>",
        },
      },
    },
  },
}
