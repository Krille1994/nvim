vim.hl.priorities.semantic_tokens = 95

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 100 })
	end,
})

-- Save and restore view (folds, cursor position) per buffer
local view_group = vim.api.nvim_create_augroup("PersistView", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
	group = view_group,
	pattern = "*",
	callback = function()
		if vim.api.nvim_buf_get_name(0) ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! mkview")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = view_group,
	pattern = "*",
	callback = function()
		if vim.api.nvim_buf_get_name(0) ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! loadview")
		end
	end,
})
