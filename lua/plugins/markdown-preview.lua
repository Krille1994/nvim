-- lazy.nvim
return {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_auto_start = 1 -- auto open preview when editing markdown
			vim.g.mkdp_auto_close = 1 -- auto close preview when you leave markdown buffer
			vim.g.mkdp_refresh_slow = 0 -- refresh as you type
			vim.g.mkdp_page_title = "${name}"
			vim.g.mkdp_browser = "" -- optionally set a specific browser
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			render_modes = true,
		},
	},
}
