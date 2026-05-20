return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
		{ "<leader>es", "<cmd>Neotree reveal<CR>", desc = "Reveal current file" },
		{ "<leader>ef", "<cmd>Neotree focus<CR>", desc = "Focus file tree" },
		{ "<leader>er", "<cmd>Neotree refresh<CR>", desc = "Refresh file tree" },
		{ "<leader>eg", "<cmd>Neotree git_status<CR>", desc = "Git status tree" },
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = { enabled = true },
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
}
