return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		update_debounce = 300,

		watch_gitdir = { follow_files = true },
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> · <summary>",

		preview_config = {
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},

		on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
				else
					---@diagnostic disable-next-line: param-type-mismatch
					gs.nav_hunk("next")
				end
			end, "Next Git Hunk")

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					---@diagnostic disable-next-line: param-type-mismatch
					gs.nav_hunk("prev")
				end
			end, "Previous Git Hunk")

			map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
			map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")

			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage selection")
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset selection")

			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

			map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle current line blame")
			map("n", "<leader>gB", gs.blame_line, "Blame line (full)")

			map("n", "<leader>gd", gs.diffthis, "Diff this (vs index)")
			map("n", "<leader>gD", function()
				---@diagnostic disable-next-line: param-type-mismatch
				gs.diffthis("~")
			end, "Diff this (vs last commit)")

			map("n", "<leader>gq", function()
				---@diagnostic disable-next-line: param-type-mismatch
				gs.setqflist("all")
			end, "Hunks → quickfix")
			map("n", "<leader>gl", gs.setloclist, "Hunks → loclist")

			map("n", "<leader>gT", gs.toggle_signs, "Toggle signs")
			map("n", "<leader>gL", gs.toggle_linehl, "Toggle line highlight")
			map("n", "<leader>gN", gs.toggle_numhl, "Toggle number highlight")
			map("n", "<leader>gw", gs.toggle_word_diff, "Toggle word diff")

			map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
		end,
	},
}
