require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"jsonls",
		-- "tsserver",
		"html",
		"cssls",
		"emmet_ls",
		"angularls",
		"gopls",
		"rust_analyzer",
		"clangd",
		"omnisharp",
		"bashls",
		"yamlls",
	},
})
