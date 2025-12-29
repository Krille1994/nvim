return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					hijack_netrw_behavior = "open_default",
					use_libuv_file_watcher = true,
				},

				window = {
					mappings = {
						["<space>"] = "none",
						["Z"] = "expand_all_nodes",
					},
				},
			})
		end,
	},

	vim.keymap.set("n", "<leader>ee", "<cmd>:Neotree toggle<cr>", { desc = "Toggle file tree" }),
	vim.keymap.set("n", "<leader>es", "<cmd>:Neotree reveal<cr>", { desc = "Show current file in tree" }),
	vim.keymap.set("n", "<leader>ef", "<cmd>:Neotree focus<cr>", { desc = "Focus file tree" }),
	vim.keymap.set("n", "<leader>er", "<cmd>:Neotree refresh<cr>", { desc = "Refresh filetree" }),
	vim.keymap.set("n", "<leader>eg", "<cmd>:Neotree git_status<cr>", { desc = "Show git status in tree" }),
}
