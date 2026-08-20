-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	dependencies = {
-- 		{ "windwp/nvim-ts-autotag", opts = {} },
-- 		{
-- 			"nvim-treesitter/nvim-treesitter-context",
-- 			opts = {
-- 				enable = true,
-- 				max_lines = 3,
-- 				trim_scope = "outer",
-- 				mode = "cursor",
-- 			},
-- 		},
-- 	},
-- 	config = function()
-- 		-- Initialize the new top-level Treesitter module
-- 		require("nvim-treesitter").setup()
--
-- 		-- Define the parsers you want to make sure are present
-- 		local ensure_installed = {
-- 			"json", "javascript", "typescript", "tsx",
-- 			"yaml", "html", "css", "prisma",
-- 			"markdown", "markdown_inline",
-- 			"svelte", "graphql", "bash", "lua", "vim",
-- 			"dockerfile", "gitignore", "query", "vimdoc",
-- 			"c", "rust", "python", "go", "gomod", "gowork",
-- 		}
--
-- 		-- Get what is already installed via the correct main-branch API
-- 		local installed = require("nvim-treesitter").get_installed("parsers")
-- 		local missing = vim.tbl_filter(function(parser)
-- 			return not vim.tbl_contains(installed, parser)
-- 		end, ensure_installed)
--
-- 		if #missing > 0 then
-- 			require("nvim-treesitter").install(missing)
-- 		end
-- 	end,
-- }
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- Explicitly target the new 0.12 compatible branch
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
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
	init = function()
		-- 1. Enable Native Treesitter Highlighting & Indentation on FileType
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Safely start native Treesitter highlighting
				pcall(vim.treesitter.start)
				-- Enable native treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
	config = function()
		-- 2. List the parsers you want to make sure are present
		local ensure_installed = {
			"json", "javascript", "typescript", "tsx",
			"yaml", "html", "css", "prisma",
			"markdown", "markdown_inline",
			"svelte", "graphql", "bash", "lua", "vim",
			"dockerfile", "gitignore", "query", "vimdoc",
			"c", "rust", "python", "go", "gomod", "gowork",
		}

		-- 3. Get what is already installed via the 0.12 API structure
		local already_installed = require("nvim-treesitter.config").get_installed()

		local missing = vim.tbl_filter(function(parser)
			return not vim.tbl_contains(already_installed, parser)
		end, ensure_installed)

		-- 4. Install missing parsers
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end
	end,
}
