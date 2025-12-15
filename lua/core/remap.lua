vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Able to move highlighted section" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Able to move highlighted section" })

keymap.set("n", "J", "mzJ`z", { desc = "Keeps cursor inplace when Joining" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keeps cursor inplace when jumping" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keeps cursor inplace when jumping" })
keymap.set("n", "n", "nzzzv", { desc = "Keeps search term in middle" })
keymap.set("n", "N", "Nzzzv", { desc = "Keeps search term in middle" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over highlighted section without adding to registry" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })

keymap.set({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete to clipboard" })

keymap.set("i", "<C-c>", "<Esc>", { desc = "C-c works as <Esc> in insertmode" })

keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer", noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to next buffer", noremap = true, silent = true })
