function ColorMyPencils(color)
	color = color or 'catppuccin'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
--			ColorMyPencils()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	}
}
