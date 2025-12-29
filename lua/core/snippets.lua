vim.hl.priorities.semantic_tokens = 95

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

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "guicursor",
	callback = function()
		vim.notify("guicursor -> " .. vim.o.guicursor)
	end,
})
