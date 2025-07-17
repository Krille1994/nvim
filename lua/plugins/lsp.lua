return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
	},
	config = function()
		-- Setup Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"emmet_ls",
				"gopls",
				"rust_analyzer",
				"clangd",
				"omnisharp",
				"bashls",
				"yamlls",
			},
		})

		-- Setup capabilities for completion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			vim.fn.sign_define("DiagnosticSign" .. type, {
				text = icon,
				texthl = "DiagnosticSign" .. type,
				numhl = "",
			})
		end

		-- Diagnostic appearance
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				border = "rounded",
				focusable = true,
				source = "if_many",
				header = "",
				prefix = "",
				max_width = 80,
				wrap = true,
			},
			severity_sort = true,
		})

		-- Global keymaps when LSP attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local buf = event.buf
				local opts = { buffer = buf }

				vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local map = vim.keymap.set

				map("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = buf, desc = "Signature Help" })
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				map("n", "gD", vim.lsp.buf.declaration, opts)
				map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				map("n", "K", vim.lsp.buf.hover, opts)
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>fo", "<cmd>lua require('conform').format({ lsp_fallback = true })<CR>", opts)

				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				map("n", "<leader>d", vim.diagnostic.open_float, opts)
				map("n", "[d", vim.diagnostic.goto_prev, opts)
				map("n", "]d", vim.diagnostic.goto_next, opts)

				map("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
			end,
		})

		-- LSP server setup
		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },

							format = {
								enable = true,
								-- Put format options here
								-- NOTE: the value should be STRING!!
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
								},
							},
						},
					},
				})
			end,
		})
	end,
}
