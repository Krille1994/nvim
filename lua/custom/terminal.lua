vim.keymap.set("t", "<C-c>", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("t", "<Esc><Esc>", function()
	vim.api.nvim_chan_send(vim.b.terminal_job_id, "\003")
end, { noremap = true, desc = "Send Ctrl-C to terminal" })

vim.keymap.set("n", "<Esc><Esc>", function()
	if vim.bo.buftype == "terminal" and vim.b.terminal_job_id then
		vim.api.nvim_chan_send(vim.b.terminal_job_id, "\003")
	end
end, { noremap = true, desc = "Send Ctrl-C in terminal (normal mode)" })

local state = { buf = -1, win = -1 }

local function toggle_terminal()
	if vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_hide(state.win)
		return
	end

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	if not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
	end

	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	})

	if vim.bo[state.buf].buftype ~= "terminal" then
		vim.cmd.terminal()
	end
	vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set("n", "<leader>t", toggle_terminal, { desc = "Toggle floating terminal" })
