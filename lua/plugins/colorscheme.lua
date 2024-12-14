return {
	
		"catppuccin/nvim",
		name = "catppuccin", 
		lazy = false,
		priority = 1000,
		config = function()
			opts = {
				flavour = "auto",
				transparent_background = true,
				integrations = {
					telescope = {
						enabled = true,
					}
				},
			}
			require('catppuccin').setup(opts)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			local bg_transparent = true

			local toggle_transparency = function()
			  bg_transparent = not bg_transparent
			  opts.transparent_background = bg_transparent
			  require('catppuccin').setup(opts)
			  vim.cmd("colorscheme catppuccin")
			end
      		vim.cmd("colorscheme catppuccin")
	  		vim.keymap.set('n', '<leader>bg', toggle_transparency, {noremap = true, silent=true})
		end
	
}
