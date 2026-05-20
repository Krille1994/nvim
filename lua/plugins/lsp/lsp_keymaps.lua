vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
		end

		-- NOTE: Completion is handled by blink.cmp, not built-in vim.lsp.completion

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

		-- Override built-in defaults with Telescope pickers
		map("n", "grr", "<cmd>Telescope lsp_references<CR>", "References (Telescope)")
		map("n", "gri", "<cmd>Telescope lsp_implementations<CR>", "Implementations (Telescope)")
		map("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>", "Type definitions (Telescope)")
		map("n", "gO", "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols (Telescope)")

		-- Actions (grn/gra/K/Ctrl-S are fine as built-in defaults)
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

		-- Diagnostics ([d and ]d are built-in defaults)
		map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
		map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")

		-- Inlay hints toggle
		if client:supports_method("textDocument/inlayHint") then
			map("n", "<leader>ch", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
			end, "Toggle inlay hints")
		end

		-- Misc
		map("n", "<leader>rs", "<cmd>lsp restart<CR>", "Restart LSP")
	end,
})
