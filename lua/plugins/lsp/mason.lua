require("mason").setup({
	ui = { border = "rounded" },
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"jsonls",
		"html",
		"cssls",
		"emmet_ls",
		"angularls",
		"svelte",
		"gopls",
		"rust_analyzer",
		"clangd",
		"omnisharp",
		"bashls",
		"yamlls",
		"pyright",
	},
})
