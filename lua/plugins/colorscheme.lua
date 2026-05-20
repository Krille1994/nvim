-- return {
-- 	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
-- 	{ "folke/tokyonight.nvim", lazy = true },
-- 	{ "EdenEast/nightfox.nvim", lazy = true },
-- 	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
-- 	{ "loctvl842/monokai-pro.nvim", lazy = true },
-- 	{ "rebelot/kanagawa.nvim", lazy = true },
-- 	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
-- 	{ "sainnhe/everforest", lazy = true },
-- 	{ "projekt0n/github-nvim-theme", name = "github-theme", lazy = true },
-- }

return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{
		"olivercederborg/poimandres.nvim",
		lazy = true,
		config = function()
			require("poimandres").setup({})
		end,
	},
	{ "mellow-theme/mellow.nvim", lazy = true },
	{ "savq/melange-nvim", lazy = true },
	{ "AmberLehmann/candyland.nvim", lazy = true },

	{
		"rijulpaul/nightblossom.nvim",
		lazy = true,
	},
}
