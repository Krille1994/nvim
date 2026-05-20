return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	branch = "master",
	dependencies = {
		{ "windwp/nvim-ts-autotag", opts = {} },
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
				max_lines = 3,
				trim_scope = "outer",
				mode = "cursor",
			},
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"json", "javascript", "typescript", "tsx",
				"yaml", "html", "css", "prisma",
				"markdown", "markdown_inline",
				"svelte", "graphql", "bash", "lua", "vim",
				"dockerfile", "gitignore", "query", "vimdoc",
				"c", "rust", "python", "go",
			},
			auto_install = true,
		})
	end,
}
