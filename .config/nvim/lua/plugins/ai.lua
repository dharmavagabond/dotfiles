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
      provider = "openai_compatible",
      context_window = 2048,
      throttle = 300,
      debounce = 200,
      request_timeout = 15,
      provider_options = {
        openai_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://127.0.0.1:11434/v1/chat/completions",
          model = "hf.co/Abiray/MiniCPM5-2B-heretic-abliterated-GGUF:Q8_0",
          max_tokens = 128,
          stream = true,
          optional = {
            temperature = 0.2,
            top_p = 0.9,
            frequency_penalty = 0.3,
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
