return {
  {
    "carderne/pi-nvim",
    opts = {
      socket_path = nil,
      set_default_keymaps = true,
    },
  },
  {
    "sha0coder/nvim-ollama",
    opts = {
      model = "qwen3-coder:30b",
      trigger = "manual",
      keybind = "<F2>",
    },
  },
}
