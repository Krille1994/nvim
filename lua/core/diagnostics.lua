local sev = vim.diagnostic.severity

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = true },
	update_in_insert = false,
	underline = { severity = sev.ERROR },
	signs = {
		text = {
			[sev.ERROR] = "󰅚 ",
			[sev.WARN] = "󰀪 ",
			[sev.INFO] = "󰋽 ",
			[sev.HINT] = "󰌶 ",
		},
	},
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
