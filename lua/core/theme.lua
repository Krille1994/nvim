local M = {}

local themes = {
	"catppuccin",
	"kanagawa",
	"oxocarbon",
	"github_dark",
	"nightfox",
	"tokyonight",
	"everforest",
	"rose-pine",
	"monokai-pro",
}

local current = 1
local transparent = false

local function apply_theme(name)
	vim.cmd("colorscheme " .. name)

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			if transparent then
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
				vim.notify("Transparency enabled")
			else
				local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
				local bg = normal_hl.bg or "NONE" -- fallback

				vim.api.nvim_set_hl(0, "Normal", { bg = bg })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
				vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = bg })
				vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = bg })
				vim.notify("Transparency disabled")
			end
		end,
	})
end

function M.setup()
	for i = 1, #themes do
		vim.keymap.set("n", "<leader>b" .. (i % 10), function()
			current = i
			apply_theme(themes[i])
		end, { desc = "Theme: " .. themes[i] })
	end

	vim.keymap.set("n", "<leader>bg", function()
		transparent = not transparent
		apply_theme(themes[current])
	end, { desc = "Toggle background transparency" })

	apply_theme(themes[current])
end

return M
