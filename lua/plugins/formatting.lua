return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local exclude = { "c", "cpp", "objc", "objcpp" }

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				htmlangular = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = function(bufnr)
				if vim.tbl_contains(exclude, vim.bo[bufnr].filetype) then
					return nil
				end
				return { lsp_fallback = true, async = false, timeout_ms = 1000 }
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			conform.format({ lsp_format = "fallback", async = false, timeout_ms = 1000 })
		end, { desc = "Format file or range" })
	end,
}
