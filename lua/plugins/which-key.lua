return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()
		require("which-key").add({
			{ "<leader>a", group = "[A]ngular" },
			{ "<leader>b", group = "[B]ackground" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>e", group = "[E]xplorer" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>m", group = "[M]essages / Markdown" },
			{ "<leader>n", group = "[N]o" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>x", group = "[X] Trouble" },
		})
	end,
}
