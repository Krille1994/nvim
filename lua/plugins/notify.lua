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
				DEBUG = "",
				TRACE = "✎",
			},
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "rounded" })
				vim.wo[win].winhl = "Normal:NormalFloat,FloatBorder:FloatBorder"
			end,
		})

		local function style_notify()
			vim.api.nvim_set_hl(0, "NotifyBackground", { link = "NormalFloat" })

			vim.api.nvim_set_hl(0, "NotifyINFOTitle", { link = "DiagnosticInfo" })
			vim.api.nvim_set_hl(0, "NotifyWARNTitle", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NotifyERRORTitle", { link = "DiagnosticError" })
			vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { link = "DiagnosticHint" })
			vim.api.nvim_set_hl(0, "NotifyTRACETitle", { link = "DiagnosticHint" })

			vim.api.nvim_set_hl(0, "NotifyINFOIcon", { link = "DiagnosticInfo" })
			vim.api.nvim_set_hl(0, "NotifyWARNIcon", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NotifyERRORIcon", { link = "DiagnosticError" })
			vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { link = "DiagnosticHint" })
			vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { link = "DiagnosticHint" })

			vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "DiagnosticInfo" })
			vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "DiagnosticError" })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "DiagnosticHint" })
			vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "DiagnosticHint" })

			vim.api.nvim_set_hl(0, "NotifyINFOBody", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "NotifyWARNBody", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "NotifyERRORBody", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "NotifyTRACEBody", { link = "NormalFloat" })
		end

		style_notify()
		local group = vim.api.nvim_create_augroup("NotifyHighlights", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = group,
			callback = style_notify,
		})

		vim.keymap.set("n", "<leader>md", function()
			notify.dismiss({ silent = true, pending = true })
		end, { desc = "Dismiss Notifications" })

		vim.keymap.set("n", "<leader>mh", "<cmd>Notifications<cr>", { desc = "Notification History" })
		vim.keymap.set("n", "<leader>mc", "<cmd>NotificationsClear<cr>", { desc = "Clear Notification History" })
	end,
}
