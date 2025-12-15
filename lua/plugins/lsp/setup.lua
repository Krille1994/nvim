local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
})

local servers = require("plugins.lsp.servers")

for name, opts in pairs(servers) do
  if type(opts) == "function" then
    opts = opts()
  end
  vim.lsp.config(name, opts)
end
