return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- "hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		require("plugins.lsp.mason")
		require("plugins.lsp.setup")
		require("plugins.lsp.lsp_keymaps")
	end,
}
