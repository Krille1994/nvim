vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = true },
	update_in_insert = false,
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},

	virtual_text = {
		source = "if_many",
		spacing = 2,
		prefix = "●",
		format = function(diagnostic)
			local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
			if code ~= "" then
				return string.format("%s %s", code, diagnostic.message)
			end
			return diagnostic.message
		end,
	},
})
