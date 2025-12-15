return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module "render-markdown"
		---@type render.md.UserConfig
		opts = {
			render_modes = true,

			heading = {
				enabled = true,
				sign = false,
			},

			bullet = {
				enabled = true,
				icons = { "•", "◦", "▪", "▸" },
			},

			checkbox = {
				enabled = true,
				unchecked = "󰄱 ",
				checked = "󰱒 ",
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
				},
			},

			code = {
				enabled = true,
				style = "full",
			},
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_page_title = "${name}"

			-- Keybinds to control it
			vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview: Open" })
			vim.keymap.set("n", "<leader>mP", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown Preview: Stop" })
			vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview: Toggle" })
		end,
	},
}
