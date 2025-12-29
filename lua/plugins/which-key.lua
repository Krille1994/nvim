return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()
			require("which-key").add({
				{ "<leader>e", group = "File [E]xplorer" },
				{ "<leader>b", group = "[B]ackground" },
				{ "<leader>s", group = "[S]plit" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>n", group = "[N]o" },
				{ "<leader>x", group = "[X] Trouble" },
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>m", group = "[M]essages" },
				{ "<leader>g", group = "[G]it" },
			})
		end,
	},
}
