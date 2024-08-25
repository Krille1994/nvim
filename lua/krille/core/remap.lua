vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- not needed with nvim-tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Able to move highlighted section" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Able to move highlighted section" })

keymap.set("n", "J", "mzJ`z", { desc = "Keeps cursor inplace when Joining" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keeps cursor inplace when jumping" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keeps cursor inplace when jumping" })
keymap.set("n", "n", "nzzzv", { desc = "Keeps search term in middle" })
keymap.set("n", "N", "Nzzzv", { desc = "Keeps search term in middle" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over highlighted section without adding to registry" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to clipboard" })

keymap.set("i", "<C-c>", "<Esc>", { desc = "C-c works as <Esc> in insertmode" })

-- keymap.set("n", "<leader>f", vim.lsp.buf.format)     crash with find files in telescope

-- keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])    crash with split window!!!
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
