-- lua/core/theme.lua
local M = {}

local themes = {
	"catppuccin",
	"tokyonight",
	"nightfox",
	"rose-pine",
	"gruvbox",
	"solarized",
}

local current = 1
local transparent = false

local function apply_theme(name)
	vim.cmd("colorscheme " .. name)
	if transparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	else
		vim.api.nvim_set_hl(0, "Normal", {})
		vim.api.nvim_set_hl(0, "NormalFloat", {})
	end
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
