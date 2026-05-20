return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble_telescope = require("trouble.sources.telescope")

		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				actions.smart_send_to_qflist(prompt_bufnr)
				vim.cmd("Trouble qflist open")
			end,
		})

		telescope.setup({
			pickers = {
				find_files = { hidden = true },
			},
			defaults = {
				path_display = { "smart" },
				sorting_strategy = "ascending",
				-- selection_caret = " ",
				-- entry_prefix = "  ",
				-- prompt_prefix = " ",
				dynamic_preview_title = true,
				file_ignore_patterns = {
					"node_modules/",
					".git/",
					"dist/",
					"build/",
					"target/",
					"%.lock",
					"%.jpg",
					"%.png",
					"%.webp",
					"%.mp4",
				},
				preview = { filesize_limit = 1 },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local k = vim.keymap
		k.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
		k.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
		k.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
		k.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Grep in cwd" })
		k.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })
		k.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
		k.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
		k.set("n", "<leader>fG", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
	end,
}
