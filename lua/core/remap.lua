vim.g.mapleader = " "

local keymap = vim.keymap

-- Don't yank on x/c
keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')

-- Move highlighted lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor stable
keymap.set("n", "J", "mzJ`z", { desc = "Join lines (cursor stays)" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })
keymap.set("n", "n", "nzzzv", { desc = "Next search (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

-- Paste over selection without yanking
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection (no yank)" })

-- Yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })

-- Ctrl-C as Escape in insert mode
keymap.set("i", "<C-c>", "<Esc>", { desc = "Ctrl-C as Escape" })

-- Make file executable
keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Split management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Maximize/restore split (replaces vim-maximizer plugin)
local maximized = false
keymap.set("n", "<leader>sm", function()
	if maximized then
		vim.cmd("wincmd =")
		maximized = false
	else
		vim.cmd("wincmd _")
		vim.cmd("wincmd |")
		maximized = true
	end
end, { desc = "Maximize/restore split" })

-- Buffer navigation
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })

-- Built-in undotree (0.12)
keymap.set("n", "<leader>u", "<cmd>Undotree<CR>", { desc = "Undotree" })
