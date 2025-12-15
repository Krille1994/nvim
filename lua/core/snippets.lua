vim.hl.priorities.semantic_tokens = 95

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		format = function(diagnostic)
			local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
			return string.format("%s %s", code, diagnostic.message)
		end,
	},
	underline = false,
	update_in_insert = true,
	float = {
		source = "always",
	},
	on_ready = function()
		vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
	end,
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		local file = vim.api.nvim_buf_get_name(0)
		if file ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! mkview")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		local file = vim.api.nvim_buf_get_name(0)
		if file ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! loadview")
		end
	end,
})
