return {
	{ 
		"catppuccin/nvim",
		name = "catppuccin", 
		lazy = false,
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				flavour = "auto",
				transparent_background = true,
				integrations = {
					telescope = {
						enabled = true,
					}
				},
			})
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      vim.cmd("colorscheme catppuccin")
		end
	}
}
