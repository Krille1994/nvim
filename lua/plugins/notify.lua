return {
	"rcarriga/nvim-notify",
	event = "VimEnter",
	config = function()
		local notify = require("notify")
		vim.notify = notify

		notify.setup({
			merge_duplicates = true,
			stages = "slide",
			timeout = 3000,
			render = "wrapped-compact",
			top_down = true,
			icons = {
				ERROR = "󰅚 ",
				WARN = "󰀪 ",
				INFO = "󰋽 ",
				DEBUG = "",
				TRACE = "✎",
			},
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "rounded" })
				vim.wo[win].winhl = "Normal:NormalFloat,FloatBorder:FloatBorder"
			end,
		})

		local links = {
			INFO = "DiagnosticInfo", WARN = "DiagnosticWarn",
			ERROR = "DiagnosticError", DEBUG = "DiagnosticHint", TRACE = "DiagnosticHint",
		}

		local function style_notify()
			vim.api.nvim_set_hl(0, "NotifyBackground", { link = "NormalFloat" })
			for level, hl in pairs(links) do
				vim.api.nvim_set_hl(0, "Notify" .. level .. "Title", { link = hl })
				vim.api.nvim_set_hl(0, "Notify" .. level .. "Icon", { link = hl })
				vim.api.nvim_set_hl(0, "Notify" .. level .. "Border", { link = hl })
				vim.api.nvim_set_hl(0, "Notify" .. level .. "Body", { link = "NormalFloat" })
			end
		end

		style_notify()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("NotifyHighlights", { clear = true }),
			callback = style_notify,
		})

		vim.keymap.set("n", "<leader>md", function()
			notify.dismiss({ silent = true, pending = true })
		end, { desc = "Dismiss notifications" })
		vim.keymap.set("n", "<leader>mh", "<cmd>Notifications<CR>", { desc = "Notification history" })
		vim.keymap.set("n", "<leader>mc", "<cmd>NotificationsClear<CR>", { desc = "Clear notification history" })
	end,
}
