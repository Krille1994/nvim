-- local M = {}
--
-- local themes = {
-- 	"catppuccin",
-- 	"kanagawa",
-- 	"oxocarbon",
-- 	"github_dark",
-- 	"nightfox",
-- 	"tokyonight",
-- 	"everforest",
-- 	"rose-pine",
-- 	"monokai-pro",
-- }
--
-- local current = 1
-- local transparent = false
--
-- local function apply_transparency()
-- 	if transparent then
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	end
-- end
--
-- local function apply_theme(name)
-- 	local ok = pcall(vim.cmd, "colorscheme " .. name)
-- 	if not ok then
-- 		vim.notify("Colorscheme '" .. name .. "' not found", vim.log.levels.WARN)
-- 		return
-- 	end
-- 	apply_transparency()
-- end
--
-- function M.setup()
-- 	vim.api.nvim_create_autocmd("ColorScheme", {
-- 		group = vim.api.nvim_create_augroup("ThemeTransparency", { clear = true }),
-- 		callback = apply_transparency,
-- 	})
--
-- 	for i = 1, #themes do
-- 		vim.keymap.set("n", "<leader>b" .. (i % 10), function()
-- 			current = i
-- 			apply_theme(themes[i])
-- 		end, { desc = "Theme: " .. themes[i] })
-- 	end
--
-- 	vim.keymap.set("n", "<leader>bg", function()
-- 		transparent = not transparent
-- 		apply_theme(themes[current])
-- 		vim.notify(transparent and "Transparency on" or "Transparency off")
-- 	end, { desc = "Toggle transparency" })
--
-- 	apply_theme(themes[current])
-- end
--
-- return M

local M = {}

local favorites = {
	"catppuccin",
	"kanagawa",
	"nightfox",
	"duskfox",
	"tokyonight",
	"poimandres",
	"mellow",
	"melange",
	"candyland",
	"nightblossom",
}

local current = 1
local transparent = false

local function apply_transparency()
	if transparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

local function apply_theme(name)
	local ok = pcall(vim.cmd, "colorscheme " .. name)
	if not ok then
		vim.notify("Colorscheme '" .. name .. "' not found", vim.log.levels.WARN)
		return
	end
	for i, v in ipairs(favorites) do
		if v == name then
			current = i
			break
		end
	end
	apply_transparency()
end

local function pick_theme()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local before = vim.g.colors_name

	local function preview_selection()
		vim.schedule(function()
			local entry = action_state.get_selected_entry()
			if entry then
				pcall(vim.cmd, "colorscheme " .. entry[1])
			end
		end)
	end

	pickers
		.new({}, {
			prompt_title = "Colorschemes",
			finder = finders.new_table({ results = favorites }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(bufnr, map)
				map("i", "<C-j>", function()
					actions.move_selection_next(bufnr)
					preview_selection()
				end)
				map("i", "<C-k>", function()
					actions.move_selection_previous(bufnr)
					preview_selection()
				end)
				map("n", "j", function()
					actions.move_selection_next(bufnr)
					preview_selection()
				end)
				map("n", "k", function()
					actions.move_selection_previous(bufnr)
					preview_selection()
				end)

				actions.select_default:replace(function()
					actions.close(bufnr)
					local entry = action_state.get_selected_entry()
					if entry then
						apply_theme(entry[1])
					end
				end)

				map("i", "<Esc>", function()
					actions.close(bufnr)
					if before then
						pcall(vim.cmd, "colorscheme " .. before)
					end
				end)
				map("n", "<Esc>", function()
					actions.close(bufnr)
					if before then
						pcall(vim.cmd, "colorscheme " .. before)
					end
				end)

				return true
			end,
		})
		:find()
end

function M.setup()
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("ThemeTransparency", { clear = true }),
		callback = apply_transparency,
	})

	vim.keymap.set("n", "<leader>bb", pick_theme, { desc = "Browse colorschemes" })

	vim.keymap.set("n", "<leader>bn", function()
		current = current % #favorites + 1
		apply_theme(favorites[current])
		vim.notify(favorites[current], vim.log.levels.INFO)
	end, { desc = "Next colorscheme" })

	vim.keymap.set("n", "<leader>bp", function()
		current = (current - 2) % #favorites + 1
		apply_theme(favorites[current])
		vim.notify(favorites[current], vim.log.levels.INFO)
	end, { desc = "Previous colorscheme" })

	vim.keymap.set("n", "<leader>bg", function()
		transparent = not transparent
		apply_theme(favorites[current])
		vim.notify(transparent and "Transparency on" or "Transparency off")
	end, { desc = "Toggle transparency" })

	apply_theme(favorites[current])
end

return M
