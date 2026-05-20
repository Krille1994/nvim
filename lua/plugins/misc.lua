return {
	{
		"tpope/vim-sleuth",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- Color highlighter (maintained fork, no deprecation warnings)
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		-- Context-aware commentstring for JSX/TSX/Vue
		-- Hooks into built-in gc/gcc commenting
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = { enable_autocmd = false },
		init = function()
			local get_option = vim.filetype.get_option
			---@diagnostic disable-next-line: duplicate-set-field
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
