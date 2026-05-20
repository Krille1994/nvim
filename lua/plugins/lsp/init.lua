return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		-- Order matters:
		-- 1. Configure servers (vim.lsp.config)
		-- 2. Mason setup (mason-lspconfig v2 auto-enables installed servers)
		-- 3. Keymaps (LspAttach autocmd)
		require("plugins.lsp.setup")
		require("plugins.lsp.mason")
		require("plugins.lsp.lsp_keymaps")
	end,
}
