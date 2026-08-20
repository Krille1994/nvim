-- Configure servers BEFORE mason-lspconfig enables them.
-- mason-lspconfig v2 auto-calls vim.lsp.enable() for installed servers,
-- so we only need to set config overrides here.

local servers = require("plugins.lsp.servers")

for name, opts in pairs(servers) do
	if type(opts) == "function" then
		opts = opts()
	end
	vim.lsp.config(name, opts)

	vim.lsp.enable(name)
end
vim.lsp.enable("qmlls", false)
