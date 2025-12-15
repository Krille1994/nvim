return { -- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
			require("which-key").add({
				{ "<leader>e", group = "File [E]xplorer" },
				{ "<leader>b", group = "[B]ackground" },
				{ "<leader>s", group = "[S]plit" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>n", group = "[N]o" },
				{ "<leader>x", group = "[X] Trouble" },
			})
		end,
	},
}
