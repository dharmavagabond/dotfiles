return {
  cmd = function(dispatchers)
    local root = vim.fs.root(vim.uv.cwd(), { ".luaurc", ".git" }) or vim.uv.cwd()
    local defs = vim.fn.glob(root .. "/*.d.luau", false, true)

    local cmd = { "luau-lsp", "lsp" }
    for _, path in ipairs(defs) do
      local name = vim.fs.basename(path):match("^(.+)%.d%.luau$") or "unknown"
      cmd[#cmd + 1] = "--definitions:@" .. name .. "=" .. path
    end

    return vim.lsp.rpc.start(cmd, dispatchers)
  end,
}
